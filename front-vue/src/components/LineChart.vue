<script>
import { HorizontalBar, mixins } from "vue-chartjs";

import axios from "axios";

export default {
  extends: HorizontalBar,
  props: ["id"],
  data() {
    return {
      mixins: [mixins.reactiveData],
      chartData: "",
      options: {
        legend: {
          display: true
        },
        title: {
          display: true
        },
        responsive: true,
        maintainAspectRatio: false,
        scales: {
          xAxes: [
            {
              ticks: {
                max: 5,
                min: 0,
                stepSize: 0.5
              }
            }
          ]
        }
      }
    };
  },
  mounted() {
    // console.log("ID ES,", this.id);
    // console.log(this.chartData);
    setTimeout(() => {}, 4000);
    this.getVolatilityUser(this.id)
  },
  created() {},
  watch: {
    id() {
      // console.log("CAMBUE", this.id);
      this.getVolatilityUser(this.id)
    }
  },
  methods: {
    getVolatilityUser(id) {
      axios
        .get(`http://localhost:3000/api/users/volatility/${id}`)
        .then(response => {
          // console.log("WEEL DOME", response);
          const responseData = response.data.v_questions;
          // responseData.map(item => {
          //   console.log(item.volatility_question_id + " " + item.volatility_question.description );
          //   console.log(item.score);
          // });

          this.chartData = {
            labels: responseData.map(
              item => item.volatility_question.description
            ),
            position: "bottom",
            datasets: [
              {
                label: "Encuesta de Satisifacion",
                backgroundColor: "#3e95cd",
                data: responseData.map(item => item.score)
              }
            ]
          };
        })
        .catch(e => {
          console.log("EEORRR", e);
        })
        .then(() => {
          console.log("Se ternimo");
          this.renderChart(this.chartData, this.options);
        });
    }
  }
};
</script>
