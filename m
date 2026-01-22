Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33875CA5FB6
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jan 2026 12:38:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC22C10E99C;
	Thu, 22 Jan 2026 12:38:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XUl9M9Dn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA84D10E99C;
 Thu, 22 Jan 2026 12:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769085486; x=1800621486;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RHwMG388+QmL2WxUGjMz5JPmupY2+Wv+hB/OlE9O59o=;
 b=XUl9M9DnKZSK6nwXoV7hTflsK5JanVjMQngGdOmdtgNPVT+B/nEmSspo
 NJto3nKS4gOF8o5gVOKh+2xccsyIWhRUCJ06oLorHvnDhx9ZA+FhxG6yA
 SQkFdAa0sRir1jGbIjygOEctjLF8jlu52Mt+1RFQ9uP6fl1QlfoDZ7Qos
 3hUYkHDeBCmpLrie+tkkojDEc3cpW0MrY27eeG+EExtp6aSnbOzYmbsqM
 T6VDvLkZwnqM8cTSY9G8TwbspYlByXs4x1PKemv9+3OdeGT/M0K5DzZR4
 pSQxpLoHLBbHy/w64XvlOcXuRJKKYHplyE2+mj7FfKbmXxQS3r0M1WLmj Q==;
X-CSE-ConnectionGUID: FJom8+e+TyKU/Z5miWVjEg==
X-CSE-MsgGUID: YJ3s0I8wRAyJvXwoiWeM1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="87902543"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="87902543"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 04:38:05 -0800
X-CSE-ConnectionGUID: wDcmZzprQrGTAdtnojqlvQ==
X-CSE-MsgGUID: uJHeXIR3QMuFK8eaQqZtfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="211741116"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.192])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 04:38:03 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	Uma Shankar <uma.shankar@intel.com>
Subject: [PATCH] drm/i915: move GEN7_ERR_INT snapshot to display irq code
Date: Thu, 22 Jan 2026 14:37:59 +0200
Message-ID: <20260122123759.1701492-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
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

The error interrupt register GEN7_ERR_INT is a display irq
register. Move its GPU error capture to display irq snapshot.

Cc: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_irq.c | 5 +++++
 drivers/gpu/drm/i915/i915_gpu_error.c            | 6 ------
 drivers/gpu/drm/i915/i915_gpu_error.h            | 1 -
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_irq.c b/drivers/gpu/drm/i915/display/intel_display_irq.c
index 9adeebb376b1..0a71840041de 100644
--- a/drivers/gpu/drm/i915/display/intel_display_irq.c
+++ b/drivers/gpu/drm/i915/display/intel_display_irq.c
@@ -2472,6 +2472,7 @@ void intel_display_irq_init(struct intel_display *display)
 
 struct intel_display_irq_snapshot {
 	u32 derrmr;
+	u32 err_int;
 };
 
 struct intel_display_irq_snapshot *
@@ -2486,6 +2487,9 @@ intel_display_irq_snapshot_capture(struct intel_display *display)
 	if (DISPLAY_VER(display) >= 6 && DISPLAY_VER(display) < 20 && !HAS_GMCH(display))
 		snapshot->derrmr = intel_de_read(display, DERRMR);
 
+	if (DISPLAY_VER(display) == 7)
+		snapshot->err_int = intel_de_read(display, GEN7_ERR_INT);
+
 	return snapshot;
 }
 
@@ -2496,4 +2500,5 @@ void intel_display_irq_snapshot_print(const struct intel_display_irq_snapshot *s
 		return;
 
 	drm_printf(p, "DERRMR: 0x%08x\n", snapshot->derrmr);
+	drm_printf(p, "ERR_INT: 0x%08x\n", snapshot->err_int);
 }
diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index 303d8d9b7775..31c5341fb9cf 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -824,9 +824,6 @@ static void err_print_gt_global(struct drm_i915_error_state_buf *m,
 		err_printf(m, "FAULT_TLB_DATA: 0x%08x 0x%08x\n",
 			   gt->fault_data1, gt->fault_data0);
 
-	if (GRAPHICS_VER(m->i915) == 7)
-		err_printf(m, "ERR_INT: 0x%08x\n", gt->err_int);
-
 	if (IS_GRAPHICS_VER(m->i915, 8, 11))
 		err_printf(m, "GTT_CACHE_EN: 0x%08x\n", gt->gtt_cache);
 
@@ -1929,9 +1926,6 @@ static void gt_record_global_regs(struct intel_gt_coredump *gt)
 	if (IS_VALLEYVIEW(i915))
 		gt->forcewake = intel_uncore_read_fw(uncore, FORCEWAKE_VLV);
 
-	if (GRAPHICS_VER(i915) == 7)
-		gt->err_int = intel_uncore_read(uncore, GEN7_ERR_INT);
-
 	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 55)) {
 		gt->fault_data0 = intel_gt_mcr_read_any((struct intel_gt *)gt->_gt,
 							XEHP_FAULT_TLB_DATA0);
diff --git a/drivers/gpu/drm/i915/i915_gpu_error.h b/drivers/gpu/drm/i915/i915_gpu_error.h
index 91b3df621a49..26970c5e291e 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.h
+++ b/drivers/gpu/drm/i915/i915_gpu_error.h
@@ -149,7 +149,6 @@ struct intel_gt_coredump {
 	u32 gtier[6], ngtier;
 	u32 forcewake;
 	u32 error; /* gen6+ */
-	u32 err_int; /* gen7 */
 	u32 fault_data0; /* gen8, gen9 */
 	u32 fault_data1; /* gen8, gen9 */
 	u32 done_reg;
-- 
2.47.3

