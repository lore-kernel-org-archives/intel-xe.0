Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94368C001B0
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jul 2023 15:06:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A67E10E6FB;
	Thu, 13 Jul 2023 15:06:34 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60BC310E6F8
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jul 2023 15:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689260792; x=1720796792;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wo5mkmWG7S3ODEycYvWd5pVTG/xM+fNboCohcN+5rvg=;
 b=Xd4yGrHs0LCTUit23mHP6zz6FGhLMcHY7UDm9MXk00yu4UXAbCPmHk68
 LiE9gbr77LAsyzKvmy77Pga9Q+038U2IyVBAl/sFSeCamyV8KxOESqh7c
 ofoMykJTOkcWUnk6xCBh5itrz0g/+sd/wQH1WTi8Rt2CaMhtciL22ykno
 CPll0BRwN26+1/Ruv8ncQwdotrGoqsNTMS4SSIBeQ03kOm4rm1qjojb7o
 s7KdVksZjfha7zdNQoR0AtLj0c92INfdXDF+mB69Rjg00YRl8gHMWVNBn
 R/Of3CnDjlzJ+TAHYon/swaQsCLcYBIGpgaAUg4arcPLxw4xvApVbBB93 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="367856896"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; d="scan'208";a="367856896"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 08:06:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="699285533"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; d="scan'208";a="699285533"
Received: from ineznano-mobl1.ger.corp.intel.com (HELO 8817c471bfcd.intel.com)
 ([10.251.221.219])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 08:06:30 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 13 Jul 2023 15:06:06 +0000
Message-Id: <20230713150611.7-3-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230713150611.7-1-francois.dugast@intel.com>
References: <20230713150611.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/7] drm/xe: Cleanup OPEN_BRACE style issues
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
Cc: Francois Dugast <francois.dugast@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Remove almost all existing style issues of type OPEN_BRACE reported
by checkpatch.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/display/ext/intel_device_info.c | 11 ++++++++---
 drivers/gpu/drm/xe/xe_gt_mcr.c                     |  3 ++-
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/ext/intel_device_info.c b/drivers/gpu/drm/xe/display/ext/intel_device_info.c
index 29f3909e018a..9e9ccdef81f1 100644
--- a/drivers/gpu/drm/xe/display/ext/intel_device_info.c
+++ b/drivers/gpu/drm/xe/display/ext/intel_device_info.c
@@ -49,9 +49,14 @@ void intel_dvo_init(struct drm_i915_private *i915) {}
 int intel_tv_init(struct drm_i915_private *i915) { return 0; }
 int assert_dsi_pll_enabled(struct drm_i915_private *i915) { return 0; }
 bool intel_sdvo_init(struct drm_i915_private *dev_priv,
-		     i915_reg_t sdvo_reg, enum port port) { return false; }
+		     i915_reg_t sdvo_reg, enum port port)
+
+{
+	return false;
+}
 void g4x_hdmi_init(struct drm_i915_private *dev_priv,
-		   i915_reg_t hdmi_reg, enum port port) {}
+		   i915_reg_t hdmi_reg, enum port port)
+{}
 int g4x_hdmi_connector_atomic_check(struct drm_connector *connector,
-                                    struct drm_atomic_state *state)
+				    struct drm_atomic_state *state)
 { return -ENODEV; }
diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index 3db550c85e32..ff4075387564 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -429,7 +429,8 @@ static void mcr_lock(struct xe_gt *gt)
 	drm_WARN_ON_ONCE(&xe->drm, ret == -ETIMEDOUT);
 }
 
-static void mcr_unlock(struct xe_gt *gt) {
+static void mcr_unlock(struct xe_gt *gt)
+{
 	/* Release hardware semaphore */
 	if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1270)
 		xe_mmio_write32(gt, STEER_SEMAPHORE, 0x1);
-- 
2.34.1

