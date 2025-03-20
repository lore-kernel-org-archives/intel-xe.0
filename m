Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7C17C28B30
	for <intel-xe@archiver.kernel.org>; Thu, 20 Mar 2025 21:08:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6079C10E6D6;
	Thu, 20 Mar 2025 21:08:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HUL3WsZz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAA6010E6D6
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Mar 2025 21:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742504878; x=1774040878;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p8keWqwdLlKDOZguQSKSWn8HbI359vXpGgT00TjTFYo=;
 b=HUL3WsZznjS2Ld3xA0RecSabyx3vKTRrHn07d9Rn6XPHQqISuPf34kl9
 cQYggwiZUBYduYngoJe7OrpqSX0NkUmg8D2TDB5Odd8eryppupfe0S/6L
 WXBsLSlq99aWRf77UcnVQaPLhCRkEuF0asmejbNXV/GACEjPA0xl7oyxM
 xGa1CisF+l2Tr0MEZwlVLR0PX7ccJQqABU2LfseYkk4imgTMF8lvepCjH
 PI3ZWWzJUuUgevKtIkC4WDFXMoTSYCvaifbJvS/3++UewXhZSq/rokeIQ
 CKPdE30PgwVcckA7+xUJKdA5LGng3jJ9v/OOZ0b5VY2/a5Y2PNB2R9jpG Q==;
X-CSE-ConnectionGUID: Lr+oJ97BTO+97xGGVRFfQg==
X-CSE-MsgGUID: L053NjGNQ3aq+pm0oNKRHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="43875360"
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="43875360"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 14:07:58 -0700
X-CSE-ConnectionGUID: mp2lefUsSkCAfAXPnxTUOQ==
X-CSE-MsgGUID: QFJb/toXQ36FDE/JWWwWcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="128326153"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.113.30])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 14:07:55 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH 3/3] drm/xe/vf: Don't expose privileged GT debugfs files if VF
Date: Thu, 20 Mar 2025 22:07:38 +0100
Message-Id: <20250320210738.1733-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250320210738.1733-1-michal.wajdeczko@intel.com>
References: <20250320210738.1733-1-michal.wajdeczko@intel.com>
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

Some of the debugfs files require access to the registers that are
not accessible to the VFs. Don't expose those files on VF drivers.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_gt_debugfs.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index 2d63a69cbfa3..789d463fe395 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -300,19 +300,14 @@ static int hwconfig(struct xe_gt *gt, struct drm_printer *p)
 }
 
 static const struct drm_info_list debugfs_list[] = {
-	{"hw_engines", .show = xe_gt_debugfs_simple_show, .data = hw_engines},
 	{"force_reset", .show = xe_gt_debugfs_simple_show, .data = force_reset},
 	{"force_reset_sync", .show = xe_gt_debugfs_simple_show, .data = force_reset_sync},
 	{"sa_info", .show = xe_gt_debugfs_simple_show, .data = sa_info},
 	{"topology", .show = xe_gt_debugfs_simple_show, .data = topology},
-	{"steering", .show = xe_gt_debugfs_simple_show, .data = steering},
 	{"ggtt", .show = xe_gt_debugfs_simple_show, .data = ggtt},
-	{"powergate_info", .show = xe_gt_debugfs_simple_show, .data = powergate_info},
 	{"register-save-restore", .show = xe_gt_debugfs_simple_show, .data = register_save_restore},
 	{"workarounds", .show = xe_gt_debugfs_simple_show, .data = workarounds},
 	{"tunings", .show = xe_gt_debugfs_simple_show, .data = tunings},
-	{"pat", .show = xe_gt_debugfs_simple_show, .data = pat},
-	{"mocs", .show = xe_gt_debugfs_simple_show, .data = mocs},
 	{"default_lrc_rcs", .show = xe_gt_debugfs_simple_show, .data = rcs_default_lrc},
 	{"default_lrc_ccs", .show = xe_gt_debugfs_simple_show, .data = ccs_default_lrc},
 	{"default_lrc_bcs", .show = xe_gt_debugfs_simple_show, .data = bcs_default_lrc},
@@ -322,6 +317,14 @@ static const struct drm_info_list debugfs_list[] = {
 	{"hwconfig", .show = xe_gt_debugfs_simple_show, .data = hwconfig},
 };
 
+static const struct drm_info_list privileged_list[] = {
+	{"hw_engines", .show = xe_gt_debugfs_simple_show, .data = hw_engines},
+	{"mocs", .show = xe_gt_debugfs_simple_show, .data = mocs},
+	{"pat", .show = xe_gt_debugfs_simple_show, .data = pat},
+	{"powergate_info", .show = xe_gt_debugfs_simple_show, .data = powergate_info},
+	{"steering", .show = xe_gt_debugfs_simple_show, .data = steering},
+};
+
 void xe_gt_debugfs_register(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
@@ -349,6 +352,11 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
 				 ARRAY_SIZE(debugfs_list),
 				 root, minor);
 
+	if (!IS_SRIOV_VF(xe))
+		drm_debugfs_create_files(privileged_list,
+					 ARRAY_SIZE(privileged_list),
+					 root, minor);
+
 	xe_uc_debugfs_register(&gt->uc, root);
 
 	if (IS_SRIOV_PF(xe))
-- 
2.47.1

