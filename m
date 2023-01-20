Return-Path: <intel-xe-bounces@lists.freedesktop.org>
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Fri, 20 Jan 2023 15:44:17 -0500
Message-ID: <20230120204426.68104-12-rodrigo.vivi@intel.com>
In-Reply-To: <20230120204426.68104-1-rodrigo.vivi@intel.com>
References: <20230120204426.68104-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
MIME-Version: 1.0
Subject: [Intel-xe] [PATCH 11/20] drm/xe/ext: Dont call
 intel_display_power_is_enabled from irq install/remove
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
To: intel-xe@lists.freedesktop.org, maarten.lankhorst@linux.intel.com, philippe.lecluse@intel.com, mchehab@kernel.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Just assume all power domains are enabled, since we use the INIT domain
when suspending/resuming.

Not taking a mutex inside a spinlock makes suspend/resume work again.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/display/ext/i915_irq.c | 50 +++++------------------
 1 file changed, 11 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/ext/i915_irq.c b/drivers/gpu/drm/xe/display/ext/i915_irq.c
index 36b684230663..183071eb50f5 100644
--- a/drivers/gpu/drm/xe/display/ext/i915_irq.c
+++ b/drivers/gpu/drm/xe/display/ext/i915_irq.c
@@ -1407,34 +1407,20 @@ void gen11_display_irq_reset(struct drm_i915_private *dev_priv)
 	enum pipe pipe;
 	u32 trans_mask = BIT(TRANSCODER_A) | BIT(TRANSCODER_B) |
 		BIT(TRANSCODER_C) | BIT(TRANSCODER_D);
+	enum transcoder trans;
 
 	if (!HAS_DISPLAY(dev_priv))
 		return;
 
 	intel_uncore_write(dev_priv, GEN11_DISPLAY_INT_CTL, 0);
 
-	if (DISPLAY_VER(dev_priv) >= 12) {
-		enum transcoder trans;
-
-		for_each_cpu_transcoder_masked(dev_priv, trans, trans_mask) {
-			enum intel_display_power_domain domain;
-
-			domain = POWER_DOMAIN_TRANSCODER(trans);
-			if (!intel_display_power_is_enabled(dev_priv, domain))
-				continue;
-
-			intel_uncore_write(dev_priv, TRANS_PSR_IMR(trans), 0xffffffff);
-			intel_uncore_write(dev_priv, TRANS_PSR_IIR(trans), 0xffffffff);
-		}
-	} else {
-		intel_uncore_write(dev_priv, EDP_PSR_IMR, 0xffffffff);
-		intel_uncore_write(dev_priv, EDP_PSR_IIR, 0xffffffff);
+	for_each_cpu_transcoder_masked(dev_priv, trans, trans_mask) {
+		intel_uncore_write(dev_priv, TRANS_PSR_IMR(trans), 0xffffffff);
+		intel_uncore_write(dev_priv, TRANS_PSR_IIR(trans), 0xffffffff);
 	}
 
 	for_each_pipe(dev_priv, pipe)
-		if (intel_display_power_is_enabled(dev_priv,
-						   POWER_DOMAIN_PIPE(pipe)))
-			GEN8_IRQ_RESET_NDX(dev_priv, DE_PIPE, pipe);
+		GEN8_IRQ_RESET_NDX(dev_priv, DE_PIPE, pipe);
 
 	GEN3_IRQ_RESET(dev_priv, GEN8_DE_PORT_);
 	GEN3_IRQ_RESET(dev_priv, GEN8_DE_MISC_);
@@ -1653,6 +1639,7 @@ static void gen8_de_irq_postinstall(struct drm_i915_private *dev_priv)
 	u32 de_misc_masked = GEN8_DE_EDP_PSR;
 	u32 trans_mask = BIT(TRANSCODER_A) | BIT(TRANSCODER_B) |
 		BIT(TRANSCODER_C) | BIT(TRANSCODER_D);
+	enum transcoder trans;
 	enum pipe pipe;
 
 	if (!HAS_DISPLAY(dev_priv))
@@ -1682,30 +1669,15 @@ static void gen8_de_irq_postinstall(struct drm_i915_private *dev_priv)
 	else if (IS_BROADWELL(dev_priv))
 		de_port_enables |= BDW_DE_PORT_HOTPLUG_MASK;
 
-	if (DISPLAY_VER(dev_priv) >= 12) {
-		enum transcoder trans;
-
-		for_each_cpu_transcoder_masked(dev_priv, trans, trans_mask) {
-			enum intel_display_power_domain domain;
-
-			domain = POWER_DOMAIN_TRANSCODER(trans);
-			if (!intel_display_power_is_enabled(dev_priv, domain))
-				continue;
-
-			gen3_assert_iir_is_zero(dev_priv, TRANS_PSR_IIR(trans));
-		}
-	} else {
-		gen3_assert_iir_is_zero(dev_priv, EDP_PSR_IIR);
-	}
+	for_each_cpu_transcoder_masked(dev_priv, trans, trans_mask)
+		gen3_assert_iir_is_zero(dev_priv, TRANS_PSR_IIR(trans));
 
 	for_each_pipe(dev_priv, pipe) {
 		dev_priv->de_irq_mask[pipe] = ~de_pipe_masked;
 
-		if (intel_display_power_is_enabled(dev_priv,
-				POWER_DOMAIN_PIPE(pipe)))
-			GEN8_IRQ_INIT_NDX(dev_priv, DE_PIPE, pipe,
-					  dev_priv->de_irq_mask[pipe],
-					  de_pipe_enables);
+		GEN8_IRQ_INIT_NDX(dev_priv, DE_PIPE, pipe,
+				  dev_priv->de_irq_mask[pipe],
+				  de_pipe_enables);
 	}
 
 	GEN3_IRQ_INIT(dev_priv, GEN8_DE_PORT_, ~de_port_masked, de_port_enables);
-- 
2.39.0


