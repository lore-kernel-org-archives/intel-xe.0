Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C672C3601E
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 10:25:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FD0510E996;
	Thu,  3 Apr 2025 10:25:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kfYcO+6q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43D1410E99A
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Apr 2025 10:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743675904; x=1775211904;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9HfUjn566KcCqNeeSGmDZXvxXlNpmAHWn/lun72k5N0=;
 b=kfYcO+6qhjPeGSzT93XbbLiE9ukXcYtDkRfI4V2d/0dYqlBq20FnPUsX
 DcZ+Myn0ngDyvhMvVS/aOVmz4ntiIOjmxTkl2qQR9NF9OKBCm0OMElryv
 8fY+xRyzXZjp9y3zI15vAB5rMwjebk4+azFy8/KEk7K22gygN1qfDw+O8
 8awr352L/O4YP5fWWWJdLCohG4gLRC6K/WitmBIeFnO5GSNJQ49Q0L5X6
 7Ifsqs3jMJxMUOjAp2S08nApt1LgAJKMh3ukclLNEeqfL7UEsr/RkGY6Q
 ttfzEzOXN1XEuU8zS6vUCk259KfurEdxbNE1YDHrSiOhhZ7f8TJqpbZHa w==;
X-CSE-ConnectionGUID: 0ZOf+EEsRfKqNw6ZxeLVAQ==
X-CSE-MsgGUID: YkSzEHK9Qn6IX1lgf5hOaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="62475477"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="62475477"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 03:25:04 -0700
X-CSE-ConnectionGUID: Ha/aHSvAQpSFRhAxFKq20w==
X-CSE-MsgGUID: 2W+A7tRpRbi6kmL4g1ypuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="132166847"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.142])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 03:25:02 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v6 7/7] drm/xe/sriov: support non-contig VRAM provisioning
Date: Thu,  3 Apr 2025 11:24:48 +0100
Message-ID: <20250403102440.266113-16-matthew.auld@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250403102440.266113-9-matthew.auld@intel.com>
References: <20250403102440.266113-9-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Currently we can run into issues with provisioning VRAM region, due to
requiring contig VRAM BO underneath. We sometimes see that allocation
(multiple GB) can fail even when there is enough free space.  We don't
need CPU access to the buffer in the first place, so can forgo pin_map
and therefore also the contig requirement. Keep the same behavior with
save and restore during suspend/resume (which can now be done with
blitter).  We also need the VRAM to occupy the same pages so we don't
need to re-program the LMTT, so should still remain pinned (also we
don't want something to try evict it). With that covert over to plain
pinned kernel object.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 10be109bf357..2420a548cacc 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1444,15 +1444,23 @@ static int pf_provision_vf_lmem(struct xe_gt *gt, unsigned int vfid, u64 size)
 		return 0;
 
 	xe_gt_assert(gt, pf_get_lmem_alignment(gt) == SZ_2M);
-	bo = xe_bo_create_pin_map(xe, tile, NULL,
-				  ALIGN(size, PAGE_SIZE),
-				  ttm_bo_type_kernel,
-				  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
-				  XE_BO_FLAG_NEEDS_2M |
-				  XE_BO_FLAG_PINNED);
+	bo = xe_bo_create_locked(xe, tile, NULL,
+				 ALIGN(size, PAGE_SIZE),
+				 ttm_bo_type_kernel,
+				 XE_BO_FLAG_VRAM_IF_DGFX(tile) |
+				 XE_BO_FLAG_NEEDS_2M |
+				 XE_BO_FLAG_PINNED |
+				 XE_BO_FLAG_PINNED_LATE_RESTORE);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
+	err = xe_bo_pin(bo);
+	xe_bo_unlock(bo);
+	if (unlikely(err)) {
+		xe_bo_put(bo);
+		return err;
+	}
+
 	config->lmem_obj = bo;
 
 	if (xe_device_has_lmtt(xe)) {
-- 
2.49.0

