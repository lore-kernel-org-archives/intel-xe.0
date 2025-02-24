Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5D8FC021A4
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 15:07:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BF9610E18D;
	Mon, 24 Feb 2025 15:07:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yfxd/FES";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FD3210E09A
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Feb 2025 15:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740409636; x=1771945636;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5f8m1vtWtB+2Yg17cuJgw1ueEYYJrJp8FlI2wHHxRic=;
 b=Yfxd/FES3rJWlF2Yevy5++0DJ08pYDvkfO+4j3C279o4qIBIUuWljP93
 20RzQQGyEuo7J7aBFelgaEx9cDAnl/pGD1o9EaJVcZ0klcfyewk/jAHNt
 +wTNuRgmo6oCN9MxokJydnzkvNFC3iCK32wZ+AQ1wOXOCsOxZ6DgLfFCM
 2euVFtrQXW8n2lzHqz0TKRJGGub74aSkJ0A6+CHzPg04/GOLAgyvaP2uq
 i8ZkOHDRIH0W5qx5h+9HzVeAYj19LLddwEKhPmcRvpmTE7qiszZDvDtRC
 5zN1QKpKKJ7N3nCIKMZdmHH6FgPF/i/MHS1D7oau8JsdxwcFkKNlxgyir g==;
X-CSE-ConnectionGUID: tyu5piHpRie608qrnslz9A==
X-CSE-MsgGUID: cE85/ZnlSEywLUxU5UuIDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="28763876"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="28763876"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 07:07:16 -0800
X-CSE-ConnectionGUID: DK5KfhCrSbiZSwL562vnyg==
X-CSE-MsgGUID: sr8NJZCrSF2+TaAhaWnznw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="121349478"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.80.79])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 07:07:14 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v2 1/5] drm/xe/rtp: Prepare RTP to define SR-IOV specific rules
Date: Mon, 24 Feb 2025 16:06:56 +0100
Message-Id: <20250224150700.1778-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250224150700.1778-1-michal.wajdeczko@intel.com>
References: <20250224150700.1778-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
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

Almost all currently defined workaround actions are dedicated
for the driver running in a privileged mode (native or SR-IOV PF)
and those actions should not be used when running in the VF mode.

While we can easily skip any attempt to apply tile, engine or
LRC workarounds by doing early exit, it's not so easy with OOB
workarounds, as on exception basis, there could be some actions
expected to be done also by the VF driver.

Since we process OOB rules also in the SR-IOV VF mode, we had to
explicitly decline the ones that were not applicable for VF, by
using FUNC(xe_rtp_match_not_sriov_vf). However that may not
scale well, since most future workarounds will likely not be
needed in VF mode.

Instead of forcing us to append more and more FUNC(not_sriov_vf)
to potentially every new OOB workaround, change the RTP logic
and assume that RTP rules are not applicable to VFs by default,
unless there will be added a special SRIOV(VF_READY) rule.

As of today only no_media_l3 OOB workaround seems to be applicable
also for the VF mode, since the value of MIRROR_FUSE3(0x9118) from
the PF is likely unreliable, so mark that WA as VF_READY right away.

For completeness define also SRIOV(ONLY) to require PF or VF mode,
SRIOV(PF_ONLY) to require PF mode and SRIOV(VF_ONLY) for VF mode.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
v2: tag no_media_l3 workaround as VF_READY
---
 drivers/gpu/drm/xe/xe_rtp.c        | 20 +++++++++++++++++++-
 drivers/gpu/drm/xe/xe_rtp.h        |  8 ++++++++
 drivers/gpu/drm/xe/xe_rtp_types.h  |  4 ++++
 drivers/gpu/drm/xe/xe_wa_oob.rules |  2 +-
 4 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index 7a1c78fdfc92..b607be981590 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -37,6 +37,7 @@ static bool rule_matches(const struct xe_device *xe,
 {
 	const struct xe_rtp_rule *r;
 	unsigned int i, rcount = 0;
+	bool vf_ready = false;
 	bool match;
 
 	for (r = rules, i = 0; i < n_rules; r = &rules[++i]) {
@@ -110,6 +111,22 @@ static bool rule_matches(const struct xe_device *xe,
 		case XE_RTP_MATCH_FUNC:
 			match = r->match_func(gt, hwe);
 			break;
+		case XE_RTP_MATCH_SRIOV_VF_READY:
+			match = true;
+			vf_ready = true;
+			break;
+		case XE_RTP_MATCH_SRIOV_VF_ONLY:
+			match = IS_SRIOV_VF(xe);
+			vf_ready = match;
+			break;
+		case XE_RTP_MATCH_SRIOV_PF_ONLY:
+			match = IS_SRIOV_PF(xe);
+			vf_ready = false;
+			break;
+		case XE_RTP_MATCH_SRIOV_ONLY:
+			match = IS_SRIOV(xe);
+			vf_ready = match;
+			break;
 		default:
 			drm_warn(&xe->drm, "Invalid RTP match %u\n",
 				 r->match_type);
@@ -128,6 +145,7 @@ static bool rule_matches(const struct xe_device *xe,
 				return false;
 
 			rcount = 0;
+			vf_ready = false;
 		} else {
 			rcount++;
 		}
@@ -137,7 +155,7 @@ static bool rule_matches(const struct xe_device *xe,
 	if (drm_WARN_ON(&xe->drm, !rcount))
 		return false;
 
-	return true;
+	return IS_SRIOV_VF(xe) ? vf_ready : true;
 }
 
 static void rtp_add_sr_entry(const struct xe_rtp_action *action,
diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
index 38b9f13bba5e..7874ea8588db 100644
--- a/drivers/gpu/drm/xe/xe_rtp.h
+++ b/drivers/gpu/drm/xe/xe_rtp.h
@@ -207,6 +207,14 @@ struct xe_reg_sr;
 #define XE_RTP_RULE_IS_DISCRETE							\
 	{ .match_type = XE_RTP_MATCH_DISCRETE }
 
+/**
+ * XE_RTP_RULE_SRIOV - Create a SR-IOV rule for Virtual Functions
+ *
+ * Refer to XE_RTP_RULES() for expected usage.
+ */
+#define XE_RTP_RULE_SRIOV(TAG)							\
+	{ .match_type = XE_RTP_MATCH_SRIOV_##TAG }
+
 /**
  * XE_RTP_RULE_OR - Create an OR condition for rtp rules
  *
diff --git a/drivers/gpu/drm/xe/xe_rtp_types.h b/drivers/gpu/drm/xe/xe_rtp_types.h
index 1b76b947c706..02c4e67906cc 100644
--- a/drivers/gpu/drm/xe/xe_rtp_types.h
+++ b/drivers/gpu/drm/xe/xe_rtp_types.h
@@ -53,6 +53,10 @@ enum {
 	XE_RTP_MATCH_ENGINE_CLASS,
 	XE_RTP_MATCH_NOT_ENGINE_CLASS,
 	XE_RTP_MATCH_FUNC,
+	XE_RTP_MATCH_SRIOV_VF_READY,
+	XE_RTP_MATCH_SRIOV_VF_ONLY,
+	XE_RTP_MATCH_SRIOV_PF_ONLY,
+	XE_RTP_MATCH_SRIOV_ONLY,
 	XE_RTP_MATCH_OR,
 };
 
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 228436532282..ff9da494efcf 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -40,6 +40,6 @@
 16023588340	GRAPHICS_VERSION(2001)
 14019789679	GRAPHICS_VERSION(1255)
 		GRAPHICS_VERSION_RANGE(1270, 2004)
-no_media_l3	MEDIA_VERSION(3000)
+no_media_l3	MEDIA_VERSION(3000), SRIOV(VF_READY)
 14022866841	GRAPHICS_VERSION(3000), GRAPHICS_STEP(A0, B0)
 		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0)
-- 
2.47.1

