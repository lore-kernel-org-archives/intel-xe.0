Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0152CAC59D
	for <intel-xe@archiver.kernel.org>; Tue, 16 Sep 2025 21:16:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ED0B10E81C;
	Tue, 16 Sep 2025 21:16:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kMZa3/0r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 884CE10E561
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Sep 2025 21:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758057364; x=1789593364;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UQsAcn8zWOknYKccSc2t3uTneUld8DpOEefwryRGgn8=;
 b=kMZa3/0rwdfF7KunBs+5IZOZYqurptvHEue77zru7hBhFeEN9RVtzdiH
 mGgGjw2OWCz32LxtS0bVij0ChdCxhwcqRiLZbMuehfYitvdlpb7I+swzH
 BpUz/AYeohZ6zzUtVoLU9IgMA4rU/sqiWoHjYMaWrxWIZXjmIHj1XGUPk
 6HuR9ZK5fGjOtLlTBRpjNii+CzOuw7ZCxGl/cMLoV63CFTFBZ3x3fh6PL
 CC+ip0FMZ4UKlpszwoh2xEaE7jqv84PamyvNKLmpulZQf9KuINM2/B6NJ
 +0cGFFyVWc2y/eEJx6uBc+XhgqLrjKi3PgxDHCDOQGQMD3m6QqkfzpPbH g==;
X-CSE-ConnectionGUID: x7DfEYMmTvGDYUvsB+vfMw==
X-CSE-MsgGUID: g3ff+OteTW6C/pfh6R4X8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="82949111"
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; d="scan'208";a="82949111"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 14:16:03 -0700
X-CSE-ConnectionGUID: IfzlP8z9TTKe18kZ2xKsYQ==
X-CSE-MsgGUID: /ycX/OFpSjyHMRb5grMSZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; d="scan'208";a="175146077"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 14:16:03 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v5 6/7] drm/xe/lrc: Allow to add user commands mid context
 switch
Date: Tue, 16 Sep 2025 14:15:43 -0700
Message-ID: <20250916-wa-bb-cmds-v5-6-306bddbc15da@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250916-wa-bb-cmds-v5-0-306bddbc15da@intel.com>
References: <20250916-wa-bb-cmds-v5-0-306bddbc15da@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-b03c7
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

Like done for post-context-restore commands, allow to add commands from
configfs in the middle of context restore. Since currently the indirect
ctx hardcodes the offset to CTX_INDIRECT_CTX_OFFSET_DEFAULT, this is
executed in the very beginning of engine context restore.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 15 +++++++++++++++
 drivers/gpu/drm/xe/xe_configfs.h |  4 ++++
 drivers/gpu/drm/xe/xe_lrc.c      | 37 +++++++++++++++++++++++++++++++++++++
 3 files changed, 56 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 9a30dc958c35c..90bc5a4b5da71 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -897,6 +897,21 @@ bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev)
 	return ret;
 }
 
+/**
+ * xe_configfs_get_ctx_restore_mid_bb - get configfs ctx_restore_mid_bb setting
+ * @pdev: pci device
+ * @class: hw engine class
+ * @cs: pointer to the bb to use - only valid during probe
+ *
+ * Return: Number of dwords used in the mid_ctx_restore setting in configfs
+ */
+u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
+				       enum xe_engine_class class,
+				       const u32 **cs)
+{
+	return 0;
+}
+
 /**
  * xe_configfs_get_ctx_restore_post_bb - get configfs ctx_restore_post_bb setting
  * @pdev: pci device
diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
index eff2645b5f593..c61e0e47ed94c 100644
--- a/drivers/gpu/drm/xe/xe_configfs.h
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -19,6 +19,8 @@ void xe_configfs_check_device(struct pci_dev *pdev);
 bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
 u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
 bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
+u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum xe_engine_class,
+				       const u32 **cs);
 u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
 					const u32 **cs);
 #else
@@ -28,6 +30,8 @@ static inline void xe_configfs_check_device(struct pci_dev *pdev) { }
 static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return false; }
 static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
 static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
+static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum xe_engine_class,
+						     const u32 **cs) { return 0; }
 static inline u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
 						      const u32 **cs) { return 0; }
 #endif
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 0ab99c210d882..47e9df7750725 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -77,11 +77,17 @@ lrc_to_xe(struct xe_lrc *lrc)
 static bool
 gt_engine_needs_indirect_ctx(struct xe_gt *gt, enum xe_engine_class class)
 {
+	struct xe_device *xe = gt_to_xe(gt);
+
 	if (XE_GT_WA(gt, 16010904313) &&
 	    (class == XE_ENGINE_CLASS_RENDER ||
 	     class == XE_ENGINE_CLASS_COMPUTE))
 		return true;
 
+	if (xe_configfs_get_ctx_restore_mid_bb(to_pci_dev(xe->drm.dev),
+					       class, NULL))
+		return true;
+
 	return false;
 }
 
@@ -1133,6 +1139,35 @@ static ssize_t setup_configfs_post_ctx_restore_bb(struct xe_lrc *lrc,
 	return cmd - batch;
 }
 
+static ssize_t setup_configfs_mid_ctx_restore_bb(struct xe_lrc *lrc,
+						 struct xe_hw_engine *hwe,
+						 u32 *batch, size_t max_len)
+{
+	struct xe_device *xe = gt_to_xe(lrc->gt);
+	const u32 *user_batch;
+	u32 *cmd = batch;
+	u32 count;
+
+	count = xe_configfs_get_ctx_restore_mid_bb(to_pci_dev(xe->drm.dev),
+						   hwe->class, &user_batch);
+	if (!count)
+		return 0;
+
+	if (count > max_len)
+		return -ENOSPC;
+
+	/*
+	 * This should be used only for tests and validation. Taint the kernel
+	 * as anything could be submitted directly in context switches
+	 */
+	add_taint(TAINT_TEST, LOCKDEP_STILL_OK);
+
+	memcpy(cmd, user_batch, count * sizeof(u32));
+	cmd += count;
+
+	return cmd - batch;
+}
+
 static ssize_t setup_invalidate_state_cache_wa(struct xe_lrc *lrc,
 					       struct xe_hw_engine *hwe,
 					       u32 *batch, size_t max_len)
@@ -1283,8 +1318,10 @@ setup_indirect_ctx(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
 {
 	static const struct bo_setup rcs_funcs[] = {
 		{ .setup = setup_timestamp_wa },
+		{ .setup = setup_configfs_mid_ctx_restore_bb },
 	};
 	static const struct bo_setup xcs_funcs[] = {
+		{ .setup = setup_configfs_mid_ctx_restore_bb },
 	};
 	struct bo_setup_state state = {
 		.lrc = lrc,

-- 
2.50.1

