Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D949C83F1A
	for <intel-xe@archiver.kernel.org>; Fri, 11 Jul 2025 11:55:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1801B10E17C;
	Fri, 11 Jul 2025 11:55:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="En1xkOXA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B11D910E17C
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Jul 2025 11:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752234955; x=1783770955;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=W3lQuk1/RWO2NGVqj9JXhmRlpLhfSm8Mr6OJ6xsan00=;
 b=En1xkOXAJEU3et5/se6czN+VS9rq+GuxlexyPUYq+9Mo7n9J8OtoxoJT
 wGFaQgsvbZ3rXzctrHKv8fbwt1w8n1Wzw5SyGDM7+Oh8pabF5tuCnRo+0
 H+rMhu8Q5wJIOzi4CiLH2DK7VIbCa7vsrzHas4FrZKulQ8XuMPxs0o943
 0F2GDM+/oldAnBsXwvw+wzTvQp2e0tWYpY4jgIAlB5QX7BhYbFli/VLOY
 BCYyL7vCGRmx5/FZF+tEt3UgDlgRAK/eU8E2c2bfWR9yms++L3Z9UA8qJ
 5+T1fN0YfkfoG9X8C4dBLZNWfgKFx2dPt2IoWuTVRxNHWRpWevdnaouTd Q==;
X-CSE-ConnectionGUID: 6E/+KhPCTt2zBhqJh4BuTA==
X-CSE-MsgGUID: 0Il6GeKdQ+i39bmCnjQo6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="64789846"
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; d="scan'208";a="64789846"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 04:55:55 -0700
X-CSE-ConnectionGUID: g0c3T7UBQWOruZPTBBthqA==
X-CSE-MsgGUID: ODbICZoUSRu3zjmIyswnkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; d="scan'208";a="193556532"
Received: from gsd-build.iind.intel.com ([10.190.229.173])
 by orviesa001.jf.intel.com with ESMTP; 11 Jul 2025 04:55:52 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH] drm/xe: Improve VF provision stability with fault injection
Date: Fri, 11 Jul 2025 11:51:35 +0000
Message-Id: <20250711115135.1113303-1-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.34.1
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

In unlikely event, due to PF malfunction or misconfiguration, VF may
receive incomplete or invalid configuration and it must be prepared
to handle such cases without causing a crash.

When simulating errors with the kernel's fault injection framework, crashes
were observed during device unbind. These crashes were primarily due to the
use of the XE_BO_FLAG_GGTT_INVALIDATE flag when creating buffer objects.

The GGTT is invalidated using CTB, which is allocated with the
XE_BO_FLAG_GGTT_INVALIDATE flag. However, the buffer object for CTB is
freed before GGTT invalidation completes, leading to crashes.

Similarly, for buffer objects allocated in memirq_alloc_pages() and
__xe_sa_bo_manager_init(), the CTB is already freed by the time GGTT
invalidation occurs, resulting in system crashes.

To prevent these issues, the XE_BO_FLAG_GGTT_INVALIDATE flag is no longer
used when creating buffer objects in memirq_alloc_pages(),
__xe_sa_bo_manager_init() and xe_guc_ct_init().

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 1 -
 drivers/gpu/drm/xe/xe_memirq.c | 1 -
 drivers/gpu/drm/xe/xe_sa.c     | 1 -
 3 files changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 23e8c155025e..f32103811d00 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -258,7 +258,6 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
 	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ct_size(),
 					  XE_BO_FLAG_SYSTEM |
 					  XE_BO_FLAG_GGTT |
-					  XE_BO_FLAG_GGTT_INVALIDATE |
 					  XE_BO_FLAG_PINNED_NORESTORE);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
index 49c45ec3e83c..678b78f42132 100644
--- a/drivers/gpu/drm/xe/xe_memirq.c
+++ b/drivers/gpu/drm/xe/xe_memirq.c
@@ -180,7 +180,6 @@ static int memirq_alloc_pages(struct xe_memirq *memirq)
 	bo = xe_managed_bo_create_pin_map(xe, tile, bo_size,
 					  XE_BO_FLAG_SYSTEM |
 					  XE_BO_FLAG_GGTT |
-					  XE_BO_FLAG_GGTT_INVALIDATE |
 					  XE_BO_FLAG_NEEDS_UC |
 					  XE_BO_FLAG_NEEDS_CPU_ACCESS);
 	if (IS_ERR(bo)) {
diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
index 1d43e183ca21..e11ed0a1ed13 100644
--- a/drivers/gpu/drm/xe/xe_sa.c
+++ b/drivers/gpu/drm/xe/xe_sa.c
@@ -60,7 +60,6 @@ struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u3
 	bo = xe_managed_bo_create_pin_map(xe, tile, size,
 					  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
 					  XE_BO_FLAG_GGTT |
-					  XE_BO_FLAG_GGTT_INVALIDATE |
 					  XE_BO_FLAG_PINNED_NORESTORE);
 	if (IS_ERR(bo)) {
 		drm_err(&xe->drm, "Failed to prepare %uKiB BO for SA manager (%pe)\n",
-- 
2.34.1

