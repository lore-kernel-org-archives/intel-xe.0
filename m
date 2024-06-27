Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C626AC2BD09
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jun 2024 20:37:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A8BB10EB24;
	Thu, 27 Jun 2024 20:37:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XWLKcJng";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C79C010EB24
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jun 2024 20:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719520665; x=1751056665;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MYjsDgP0e6sBBMGCPuyM/HoIJmKVvTqVQGZTcPLWr0E=;
 b=XWLKcJngkPdALJpNk87TKVHUHzNjlSGISPEeC3+7th9dhYFWkmuxz3Xc
 jzoU8Pm7r41Hy/su9PZ4Ae/FDPcjU2s6lAtBXR1jaxrIqSMAvHSZfys1p
 ENkLK72PIvyNQGZtLFVDNClNBjpdZEx/tBnjGrjC9IZaA24koc3hSxv8+
 4lIE74lgW8ku3QNjoWXZed2AuB7HByrFv5g/FbXnU+Yf1ai4Q+8lyDYyx
 FB7/dnhAQcM1S7L12BFd4Z+IaA243Gtltg4QGNkTTFYDNB7fdHEABQB0V
 YeCKLDM3lHvHSQ8zGA0r4yPRMoW/MU6xK89a2zQIuOia931QIuqBecixg g==;
X-CSE-ConnectionGUID: HmJ8R5T9RDC1ItQV3ok1tw==
X-CSE-MsgGUID: 9hqa0t+MRQW3KOklO2FX+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="27815518"
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; d="scan'208";a="27815518"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 13:37:45 -0700
X-CSE-ConnectionGUID: 0kXQDrVATh6QLlOMhybQ7Q==
X-CSE-MsgGUID: Lhi4DqNDS8W0MLnn1lSu4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; d="scan'208";a="44911204"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 13:37:46 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 1/2] drm/xe/mocs: Update MOCS assertions and remove redundant
 checks
Date: Thu, 27 Jun 2024 13:37:42 -0700
Message-ID: <20240627203741.2042752-3-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.0
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

Rely more heavily on assertions to describe the MOCS programming
invariants.  CI checks these assertions and will ensure no violations
sneak in due to programmer error, so we can remove some of the redundant
WARN and silent return checks from non-debug builds.

Also tweak/augment some of the existing assertions: there's no reason
we'd ever want a platform not to have a MOCS 'ops' structure hooked up
so ensure info->ops is non-NULL.  Likewise, we should never have a case
where the bspec-defined MOCS setting table is larger than the number of
MOCS registers exposed by the hardware, so add an extra assert on those
sizes as well.

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_mocs.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
index de3f2d3f1b04..110ef89cd640 100644
--- a/drivers/gpu/drm/xe/xe_mocs.c
+++ b/drivers/gpu/drm/xe/xe_mocs.c
@@ -642,12 +642,8 @@ static unsigned int get_mocs_settings(struct xe_device *xe,
 	 */
 	xe_assert(xe, info->unused_entries_index != 0);
 
-	xe_assert(xe, !info->ops || info->ops->dump);
-
-	if (XE_WARN_ON(info->size > info->n_entries)) {
-		info->table = NULL;
-		return 0;
-	}
+	xe_assert(xe, info->ops && info->ops->dump);
+	xe_assert(xe, info->size <= info->n_entries);
 
 	if (!IS_DGFX(xe) || GRAPHICS_VER(xe) >= 20)
 		flags |= HAS_GLOBAL_MOCS;
@@ -675,9 +671,6 @@ static void __init_mocs_table(struct xe_gt *gt,
 	unsigned int i;
 	u32 mocs;
 
-	xe_gt_WARN_ONCE(gt, !info->unused_entries_index,
-			"Unused entries index should have been defined\n");
-
 	mocs_dbg(gt, "mocs entries: %d\n", info->n_entries);
 
 	for (i = 0; i < info->n_entries; i++) {
@@ -779,9 +772,6 @@ void xe_mocs_dump(struct xe_gt *gt, struct drm_printer *p)
 
 	flags = get_mocs_settings(xe, &table);
 
-	if (!table.ops->dump)
-		return;
-
 	xe_pm_runtime_get_noresume(xe);
 	ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 
-- 
2.45.0

