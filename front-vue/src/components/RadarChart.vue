<script>
import { Radar, mixins } from "vue-chartjs";

import axios from "axios";

export default {
  extends: Radar,
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
        maintainAspectRatio: false
      }
    };
  },
  mounted() {
    this.getFollowup(this.id);
  },
  created() {},
  watch: {
    id() {
      console.log("CAMBUE", this.id);
      this.getFollowup(this.id);
    }
  },
  methods: {
    getFollowup(id) {
      axios
        .get(`http://localhost:3000/api/users/followup/${id}`)
        .then(response => {
          if (response.data.followup.length > 0) {
            console.log("Radar Data", response);

            const responseData = response.data.followup[0].followup_objective;
            console.log("period---> ", responseData.compliance_period);
            console.log("rate---> ", responseData.compliance_rate);
            console.log("goal---> ", responseData.goal);
            console.log("result---> ", responseData.compliance_period);
            // responseData.map(item => {
            //   console.log(item.volatility_question_id + " " + item.volatility_question.description );
            //   console.log(item.score);
            // });

            this.chartData = {
              labels: [
                "Compilance Period",
                "Compilance Rate",
                "Goal",
                "Result"
              ],
              position: "bottom",
              datasets: [
                {
                  label: "Radar Seguiemiento",
                  borderWidth: 1,
                  backgroundColor: "rgba(54, 162, 235, 0.2)",
                  data: [
                    responseData.compliance_period,
                    responseData.compliance_rate,
                    responseData.goal,
                    responseData.result
                  ]
                }
              ]
            };
          }
        })
        .catch(e => {
          console.log("EEORRR", e);
        })
        .then(() => {
          // console.log("Se ternimo");
          this.renderChart(this.chartData, this.options);
        });
    }
  }
};
</script>
