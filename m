Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E9C6CCF9E3
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 18:13:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F57310EB78;
	Fri,  7 Nov 2025 18:13:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BC5msfp3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BCEA10EB78
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Nov 2025 18:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762539209; x=1794075209;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PE73QM0o7uQQYnEIswBNxmaWuJwqEpocCE9RD1q+FUs=;
 b=BC5msfp3Pf4pe7flZ0NV+SXu6qORMYnY+Xm/lKTZSVdnGVc9+lk6uapP
 UmtO76oO9o8aUadNPhlZ9wBbFELGgQQFPz1lPDDmShu67WFLXI/Ak6EQc
 nVibyeUAoBXhV4o6+Pbxj3p31vkZzV61lSMl6PjGTsxUrQmGrejVdRGnB
 UmOqm4SeLWRbzByrhUrV41jE0PFMR6d0MtrFwJfLz79yDmHyyvLyzCEz9
 GZcS0SJz0B4Qk4QbmSG4aEqr9sQspQ9q1Y/e18imOP4HDy3uvCB4HxVNj
 XTOMesBkrFUJ9HTt8z74qnXi7a37u0JJ7rhUGrQOh2xVZBlJJnuA/rhlW w==;
X-CSE-ConnectionGUID: J+9kD2yASKqQKIz/Mu6UYw==
X-CSE-MsgGUID: QUgqkYceTE2C11XTEZaZUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="64730186"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="64730186"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 10:13:29 -0800
X-CSE-ConnectionGUID: g1ZF0fzOQaqcWYiEp65GFw==
X-CSE-MsgGUID: IVTf6iqhTSqIvQfb79AVdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="193271164"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 10:13:29 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 06/33] squash! squash! drm/xe/forcewake: Create dedicated type
 for forcewake references
Date: Fri,  7 Nov 2025 10:13:22 -0800
Message-ID: <20251107181315.631642-41-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251107181315.631642-35-matthew.d.roper@intel.com>
References: <20251107181315.631642-35-matthew.d.roper@intel.com>
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

Additional xe_force_wake_ref conversions that are unusual and thus
weren't picked up automatically by Coccinelle and needed to be adjusted
by hand.  Most of these are cases where 'fw_ref' was declared on the
same line as other unsigned int variables (I'm sure there's a proper way
to split it out automatically in smpl, but I couldn't figure it out).

This will be squashed into the conversion patch before applying.  It
remains separate now to make the conversion easier to review.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_mocs.c | 8 +++++---
 drivers/gpu/drm/xe/xe_mocs.c       | 3 ++-
 drivers/gpu/drm/xe/xe_pmu.c        | 4 ++--
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_mocs.c b/drivers/gpu/drm/xe/tests/xe_mocs.c
index 9c774b44328e..611050d49d0b 100644
--- a/drivers/gpu/drm/xe/tests/xe_mocs.c
+++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
@@ -42,8 +42,9 @@ static void read_l3cc_table(struct xe_gt *gt,
 			    const struct xe_mocs_info *info)
 {
 	struct kunit *test = kunit_get_current_test();
+	struct xe_force_wake_ref fw_ref;
 	u32 l3cc, l3cc_expected;
-	unsigned int fw_ref, i;
+	unsigned int i;
 	u32 reg_val;
 
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
@@ -81,15 +82,16 @@ static void read_mocs_table(struct xe_gt *gt,
 			    const struct xe_mocs_info *info)
 {
 	struct kunit *test = kunit_get_current_test();
+	struct xe_force_wake_ref fw_ref;
 	u32 mocs, mocs_expected;
-	unsigned int fw_ref, i;
+	unsigned int i;
 	u32 reg_val;
 
 	KUNIT_EXPECT_TRUE_MSG(test, info->unused_entries_index,
 			      "Unused entries index should have been defined\n");
 
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	KUNIT_ASSERT_NE_MSG(test, fw_ref, 0, "Forcewake Failed.\n");
+	KUNIT_ASSERT_NE_MSG(test, fw_ref.domains, 0, "Forcewake Failed.\n");
 
 	for (i = 0; i < info->num_mocs_regs; i++) {
 		if (regs_are_mcr(gt))
diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
index 73f9401d9907..7b7b71ef82f1 100644
--- a/drivers/gpu/drm/xe/xe_mocs.c
+++ b/drivers/gpu/drm/xe/xe_mocs.c
@@ -811,7 +811,8 @@ int xe_mocs_dump(struct xe_gt *gt, struct drm_printer *p)
 	struct xe_device *xe = gt_to_xe(gt);
 	enum xe_force_wake_domains domain;
 	struct xe_mocs_info table;
-	unsigned int fw_ref, flags;
+	struct xe_force_wake_ref fw_ref;
+	unsigned int flags;
 	int err = 0;
 
 	flags = get_mocs_settings(xe, &table);
diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
index dbd95327f9fc..9c88e6159b32 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -135,7 +135,7 @@ static bool event_gt_forcewake(struct perf_event *event)
 	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
 	u64 config = event->attr.config;
 	struct xe_gt *gt;
-	unsigned int *fw_ref;
+	struct xe_force_wake_ref *fw_ref;
 
 	if (!is_engine_event(config) && !is_gt_frequency_event(event))
 		return true;
@@ -147,7 +147,7 @@ static bool event_gt_forcewake(struct perf_event *event)
 		return false;
 
 	*fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (!*fw_ref) {
+	if (fw_ref->domains) {
 		kfree(fw_ref);
 		return false;
 	}
-- 
2.51.1

