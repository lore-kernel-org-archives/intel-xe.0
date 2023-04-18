Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E03EFC77B75
	for <intel-xe@archiver.kernel.org>; Tue, 18 Apr 2023 23:02:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7429910E277;
	Tue, 18 Apr 2023 23:02:56 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9047410E277
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Apr 2023 23:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681858973; x=1713394973;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=B7oeKCbXC4+E6i5bHdF69qli2GKM59WDv0Wd/WI3i8U=;
 b=fH5gNCvjrT2jO/WGmMNiE60wUq3d1nYNrMCuxHLrs0y3f9VsIMTUEqfj
 VHadb1bTejRgJjoY7CxSe6ScBWOh0xc5mH22hlBl79Zw3j3OgU6w1luCN
 o0W9IbAlf+jVFwO4aa4vw2xFGFWFkbrRUiTbDseNZIHTvW6usN8c6KSGU
 vg5XJmhOs+cCTme3a5SzCqUYHz2JDDxMU1C5LLE2siBFn7boPBPA4a4nS
 crnc+auYFuoOWDREAx6ad3H64cNgMGh44wtrMxHCJM3FHicrWtf3rn1tl
 GjN4gLVIG8WoUkhNPMy3Wvs/9CNN1z4J1GfPrenNc9PqfOH2FJ7E0Bm37 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="345300631"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; d="scan'208";a="345300631"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2023 16:02:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="755864307"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; d="scan'208";a="755864307"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2023 16:02:53 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 18 Apr 2023 16:02:47 -0700
Message-Id: <20230418230247.3802438-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Drop GFX_FLSH_CNTL_GEN6 write during
 GGTT invalidation
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The write of GFX_FLSH_CNTL_GEN6 was inherited from the i915 codebase
where it was used to force a flush of the write-combine buffer in cases
where the GSM/GGTT were mapped as WC.  Since Xe never uses WC mappings
of the GGTT, this register write is unnecessary.  Furthermore, this
register was removed on Xe_HP-based platforms, so this write winds up
clobbering an unrelated register.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---

This write has also become unnecessary/unwanted in i915 for newer
platforms (gen9bc and earlier do use WC mappings and need this write,
but gen9lp and beyond do not).  Fei is working on that and should have
an i915 patch posted soon.

 drivers/gpu/drm/xe/xe_ggtt.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 0ae373b604f6..531c685cf2a1 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -196,11 +196,6 @@ void xe_ggtt_invalidate(struct xe_gt *gt)
 {
 	/* TODO: vfunc for GuC vs. non-GuC */
 
-	/* TODO: i915 makes comments about this being uncached and
-	 * therefore flushing WC buffers.  Is that really true here?
-	 */
-	xe_mmio_write32(gt, GFX_FLSH_CNTL_GEN6.reg, GFX_FLSH_CNTL_EN);
-
 	if (gt->uc.guc.submission_state.enabled) {
 		int seqno;
 
-- 
2.39.2

