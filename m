Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74B61C61DC6
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 17:12:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 233D510EDA6;
	Wed, 26 Aug 2026 17:12:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i+yuLdn9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3369110EDA2
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 17:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787764326; x=1819300326;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VAKL3tElaacwv5j1b+XRzHxIIutc+oW1I0zLXtPk/eM=;
 b=i+yuLdn95mLF7MOPrPYEJgTwPl4k7hZ2DiTJCPZvKn9VzXNLdWo5PvFW
 UG2FQcO2y+e4knsf30S8leVorsYDZAkdCFdpfCGRWa8O0gDmQ/2n4PoxJ
 XevVqZ/NBkQhmc6HHMumJVEsN/+gG6Ng+a2zRiL4rCYlSxeQDmXp6q6q5
 HpX4DYOLYtgHNT3/pT1UjGPotZtuPbTWOHpkDXHpPdij/PLpqpAYLOuNW
 TZEg6/E+JXr1E7U0ReXIpXoO5doJNPv3NsD/kc0waY9K/rSc6q5HJW7GJ
 9WvMDkrzVnUMC6wSfTQOzazVrUza0zb2wyWQEP6OhIttsg4xySIZarqtS w==;
X-CSE-ConnectionGUID: lRPhlqDpTBmvS+vbYv2keg==
X-CSE-MsgGUID: 9ZHRcv1HQM6ygI5nbtd4Gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88379129"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="88379129"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 10:12:06 -0700
X-CSE-ConnectionGUID: yg4TcKFhSM2hDHNAVmFCyg==
X-CSE-MsgGUID: e2/C2HUeQCSMgL9eI1m0wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="261493148"
Received: from dceraolo-desk1.fm.intel.com (HELO dceraolo-desk1)
 ([10.121.64.189])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 10:12:06 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH v2 4/6] drm/xe/uc: Support fetching different FW files
 per-subplatform
Date: Wed, 26 Aug 2026 17:11:47 +0000
Message-ID: <20260826171149.708378-5-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260826171149.708378-1-daniele.ceraolospurio@intel.com>
References: <20260826171149.708378-1-daniele.ceraolospurio@intel.com>
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

WCL is a PTL subplatform with a different GSC FW, so we need to be able
to differentiate between the 2 platforms at fetch time.
For now we only support a FW being used on either a specific subplatform
or all of them since that's the only use-case we have, but we can extend
this in the future if needed.
Only the GSC macros have been modified for now to accept a subplatform
parameter.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 3a74acfaf2c7..12fbc25dc6b8 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -93,6 +93,7 @@
 
 struct uc_fw_entry {
 	enum xe_platform platform;
+	enum xe_subplatform subplatform;
 	enum xe_gt_type gt_type;
 
 	struct {
@@ -113,6 +114,7 @@ struct fw_blobs_by_type {
  * Add an "ANY" define just to convey the meaning it's given here.
  */
 #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
+#define XE_SUBPLATFORM_ANY XE_SUBPLATFORM_UNINITIALIZED
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
 	fw_def(NOVALAKE_P,	GT_TYPE_MAIN,	mmp_ver(xe,	guc,	nvlpg,	70, 70, 0))	\
@@ -145,9 +147,9 @@ struct fw_blobs_by_type {
 
 /* for the GSC FW we match the compatibility version and not the release one */
 #define XE_GSC_FIRMWARE_DEFS(fw_def, major_ver)		\
-	fw_def(PANTHERLAKE,	GT_TYPE_MEDIA,	major_ver(xe,	gsc,	ptl,	105, 1, 0))	\
-	fw_def(LUNARLAKE,	GT_TYPE_MEDIA,	major_ver(xe,	gsc,	lnl,	104, 1, 0))	\
-	fw_def(METEORLAKE,	GT_TYPE_MEDIA,	major_ver(i915,	gsc,	mtl,	102, 1, 0))
+	fw_def(PANTHERLAKE,	SUBPLATFORM_ANY,	major_ver(xe,	gsc,	ptl,	105, 1, 0))	\
+	fw_def(LUNARLAKE,	SUBPLATFORM_ANY,	major_ver(xe,	gsc,	lnl,	104, 1, 0))	\
+	fw_def(METEORLAKE,	SUBPLATFORM_ANY,	major_ver(i915,	gsc,	mtl,	102, 1, 0))
 
 #define MAKE_FW_PATH(dir__, uc__, shortname__, version__)			\
 	__stringify(dir__) "/" __stringify(shortname__) "_" __stringify(uc__) version__ ".bin"
@@ -181,10 +183,19 @@ struct fw_blobs_by_type {
 #define XE_UC_FW_ENTRY(platform__, gt_type__, entry__)				\
 	{									\
 		.platform = XE_ ## platform__,					\
+		.subplatform = XE_SUBPLATFORM_ANY,				\
 		.gt_type = XE_ ## gt_type__,					\
 		entry__,							\
 	},
 
+#define XE_GSC_FW_ENTRY(platform__, subplatform__, entry__)			\
+	{									\
+		.platform = XE_ ## platform__,					\
+		.subplatform = XE_ ## subplatform__,				\
+		.gt_type = XE_GT_TYPE_MEDIA,					\
+		entry__,							\
+	},
+
 XE_GUC_FIRMWARE_DEFS(XE_UC_MODULE_FIRMWARE,
 		     fw_filename_mmp_ver, fw_filename_major_ver)
 XE_HUC_FIRMWARE_DEFS(XE_UC_MODULE_FIRMWARE,
@@ -243,7 +254,7 @@ uc_fw_auto_select(struct xe_device *xe, struct xe_uc_fw *uc_fw)
 				     uc_fw_entry_no_ver)
 	};
 	static const struct uc_fw_entry entries_gsc[] = {
-		XE_GSC_FIRMWARE_DEFS(XE_UC_FW_ENTRY, uc_fw_entry_gsc)
+		XE_GSC_FIRMWARE_DEFS(XE_GSC_FW_ENTRY, uc_fw_entry_gsc)
 	};
 	static const struct fw_blobs_by_type blobs_all[XE_UC_FW_NUM_TYPES] = {
 		[XE_UC_FW_TYPE_GUC] = { entries_guc, ARRAY_SIZE(entries_guc) },
@@ -266,6 +277,10 @@ uc_fw_auto_select(struct xe_device *xe, struct xe_uc_fw *uc_fw)
 		if (p != entries[i].platform)
 			continue;
 
+		if (entries[i].subplatform != XE_SUBPLATFORM_ANY &&
+		    entries[i].subplatform != xe->info.subplatform)
+			continue;
+
 		if (entries[i].gt_type != XE_GT_TYPE_ANY &&
 		    entries[i].gt_type != gt->info.type)
 			continue;
-- 
2.53.0

