Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AAB3C021B5
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 19:01:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3636510EB25;
	Fri, 21 Feb 2025 19:01:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="krXefUQ+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70B7C10E1E6
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Feb 2025 19:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740164460; x=1771700460;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a+NjC9oZfCL8mBtSfJPcIY+sl1Rbo/7tv91e8L+KLLU=;
 b=krXefUQ+BL2eWaZTCYZtQfh4UD6z57KmlvnHK6jEqXwSTQDe68LZhBgV
 Uqz4IEiSMXmTv1JaJRrH7EreiDimZh+pQswhcndIKDB5AKUhekda+1WLW
 lAtqf+uQYd+4xMzph5Uk1NZNpLAS4jJbS7DeRnMW53GigiZvp3Qf5mODD
 qEYKhQLkWCcmuLPABxlXIiIQIqfsN5lvwlE8IoZUEmq1yH0QN9R+UgGcZ
 uIPai0I32MR7+JNx7E84BwU0g1LwrL0yfSfwQtyojMIHE74JQVbpznYYT
 rWGAkg4EE6uBZ7Awgrkazdx+AMQy792jB1CsOoXYkbQ+m+Uqz+RZCE0+f Q==;
X-CSE-ConnectionGUID: s67o92y8QF61Fm57LAP2YQ==
X-CSE-MsgGUID: zsOdjrEVR1yJ53UDRNgZGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="41257644"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="41257644"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 11:01:00 -0800
X-CSE-ConnectionGUID: /AhVqDoSQuKNP4pI0eij6w==
X-CSE-MsgGUID: dvWk7Rt+Rlamly3a+9rh7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="120549678"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.96.217])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 11:00:59 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 1/4] drm/xe/rtp: Prepare RTP to define SR-IOV specific rules
Date: Fri, 21 Feb 2025 20:00:35 +0100
Message-Id: <20250221190038.1734-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250221190038.1734-1-michal.wajdeczko@intel.com>
References: <20250221190038.1734-1-michal.wajdeczko@intel.com>
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

All currently defined workaround actions are dedicated for the
driver running in a privileged mode (native or SR-IOV PF) and
those actions should not be used when running in SR-IOV VF mode.

While we can easily skip any attempt to apply tile, engine or
LRC workarounds by doing early exit, it's not so easy with OOB
workarounds, as on exception basis, there could be some actions
expected to be done also by the VF driver.

Since we process OOB rules also in the SR-IOV VF mode, we had to
explicitly decline the ones that were not applicable for VF, by
using FUNC(xe_rtp_match_not_sriov_vf), however that may not
scale well, since most future workarounds will likely not be
needed in VF mode.

Instead of forcing us to append more and more FUNC(not_sriov_vf)
to potentially every new OOB workaround, change the RTP logic
and assume that RTP rules are not applicable to VFs by default,
unless there will be added a special SRIOV(VF_READY) rule.

For completeness define also SRIOV(ONLY) to require PF or VF mode,
SRIOV(PF_ONLY) to require PF mode and SRIOV(VF_ONLY) for VF mode.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_rtp.c       | 20 +++++++++++++++++++-
 drivers/gpu/drm/xe/xe_rtp.h       |  8 ++++++++
 drivers/gpu/drm/xe/xe_rtp_types.h |  4 ++++
 3 files changed, 31 insertions(+), 1 deletion(-)

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
 
-- 
2.47.1

