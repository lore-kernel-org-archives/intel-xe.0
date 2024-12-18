Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 314E0E77187
	for <intel-xe@archiver.kernel.org>; Wed, 18 Dec 2024 12:19:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F250010EB8D;
	Wed, 18 Dec 2024 12:19:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lLgP9xB8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57A7F10EB98
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Dec 2024 12:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734524358; x=1766060358;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qoH2Adv21No+s+Iv3N4GpJH/3gO7TZUygfUeylM59XY=;
 b=lLgP9xB8z1Q8VGgX8gJlsLggCguzVeM9dPlo00krRAyM2L2qRsInEVnq
 x3WvbyVVYGD0VV/U+lYmtDL/ViQIOZaVwu5q1eqgYuoqqbL8ayo0K8O9I
 0wkfUYnkXDTElmRhjgaaGOr8f7/CiTLhFSkcqYKbBmqBYUC0ba7bPaz0l
 sCnIlj783/Oo8Gh7PaiX6LbW1X8GrZiLns1q+g4NosR/t4K7+kqJcI/sN
 myQnLK6aNf1ZmXvcz80X03AqWznZeBLYuYkm1MHQlpSGrqoM1LzPwUoQP
 O1WUFtFnUBWq6gE6t3QGVAca0NDGERShWLPRHzfItV4Eq7lfVRMmjQqNb w==;
X-CSE-ConnectionGUID: 9aPTmuD0S7eI9c3qDBY8nA==
X-CSE-MsgGUID: qevuNT9DSQCD7m0helYw8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="35028096"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="35028096"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 04:19:17 -0800
X-CSE-ConnectionGUID: AayEcyEYSQC7y7ACWM7VgA==
X-CSE-MsgGUID: yxEkOyCBTqSzQ2lt/guz/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="97633613"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.74])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 04:19:17 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 7/7] drm/xe/sriov: support non-contig VRAM provisioning
Date: Wed, 18 Dec 2024 12:18:45 +0000
Message-ID: <20241218121837.226393-16-matthew.auld@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241218121837.226393-9-matthew.auld@intel.com>
References: <20241218121837.226393-9-matthew.auld@intel.com>
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
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 65082f12f1a8..56a178aca0d4 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1409,15 +1409,22 @@ static int pf_provision_vf_lmem(struct xe_gt *gt, unsigned int vfid, u64 size)
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
+				 XE_BO_FLAG_PINNED);
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
 
 	err = pf_update_vf_lmtt(xe, vfid);
-- 
2.47.1

