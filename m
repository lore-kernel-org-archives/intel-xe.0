Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8453112584F
	for <intel-xe@archiver.kernel.org>; Wed, 11 Mar 2026 15:52:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AACE810E3C5;
	Wed, 11 Mar 2026 15:52:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bBULJ1IV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28D8710E2B5;
 Wed, 11 Mar 2026 15:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773244370; x=1804780370;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vTma2qW7o3rhaBNXY3OTsHwqf6t0tIa6AoW36t9S4qY=;
 b=bBULJ1IVOMIXLBplNcfKM/y6vbwaZSmLRWHLcdVzTnwehuvSaueF5Gas
 IUsrGv2pQWkJEUeli8cn7YVOGEXHPWTJOHJhq1Oub01qjdFfTzRlpmmYy
 3CSna/+SE7D5kTcd1wjKmMLyi0Ap2xycrH0xaBF8ClvwgfVjGHvEz4VKI
 kL5rPMJRX7vAayXTvcIvIzUpPij/ZQfzKQi0O+ImW3FKlqJmiE08p/w6z
 EqvUyZ6hyLTWwxF1LQ4WYOJz7K1lqUmqLyFYBT7fDyK+FeMV6KkPlKbx9
 2hwCxdVw31La6pX2i+b8MCf15InM6SedEszuNmhry4U93DWVOAcKEHxFX Q==;
X-CSE-ConnectionGUID: M0yZi6zIRjqFoUwdazFirA==
X-CSE-MsgGUID: +ZmzcPm2TCq0ucUSBvuW9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74398182"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="74398182"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 08:52:49 -0700
X-CSE-ConnectionGUID: 38f2FjPMQkasQHxFNTtPbg==
X-CSE-MsgGUID: EuRrCQo9QPmlwy2hukErwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="246064348"
Received: from gsd-build.iind.intel.com ([10.190.229.167])
 by fmviesa001.fm.intel.com with ESMTP; 11 Mar 2026 08:52:46 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/xe/vf: Disable fences while initializing CCS
 read/write sub-allocs
Date: Wed, 11 Mar 2026 15:52:36 +0000
Message-ID: <20260311155233.1903253-7-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260311155233.1903253-5-satyanarayana.k.v.p@intel.com>
References: <20260311155233.1903253-5-satyanarayana.k.v.p@intel.com>
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

The current sub-allocator default assumes that fences are enabled and
while finding a hole during buffer allocation, it checks only till
first hole.
Disable fences immediately initalizing the SA manager so that, holes can be
searched through out the sub-allocator while allocating buffer.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Maarten Lankhorst <dev@lankhorst.se>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/xe/xe_sa.c           | 20 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sa.h           |  1 +
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c |  3 ++-
 3 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
index f32045f40b7a..13f47db662a6 100644
--- a/drivers/gpu/drm/xe/xe_sa.c
+++ b/drivers/gpu/drm/xe/xe_sa.c
@@ -117,6 +117,26 @@ struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size,
 	return sa_manager;
 }
 
+/**
+ * xe_sa_bo_manager_fence_disable() - Set the suballocator to disable fencing.
+ * @sa_manager: the XE sub allocator manager
+ * @disable: Disable fences
+ *
+ * When @fence_disabled is true allocation scans all holes without waiting on
+ * fences. When false, the manager tracks free suballocations behind fences
+ * and reuses them only after the fence signals.
+ *
+ * This should be called immediately after creating the suballocator and before
+ * any allocations are made. The behaviour is undefined if this is called after
+ * allocations have been made.
+ *
+ * Return: None.
+ */
+void xe_sa_bo_manager_fence_disable(struct xe_sa_manager *sa_manager, bool disable)
+{
+	drm_suballoc_manager_fence_disable(&sa_manager->base, disable);
+}
+
 /**
  * xe_sa_bo_swap_shadow() - Swap the SA BO with shadow BO.
  * @sa_manager: the XE sub allocator manager
diff --git a/drivers/gpu/drm/xe/xe_sa.h b/drivers/gpu/drm/xe/xe_sa.h
index 50218b0d1404..77b5520b04e8 100644
--- a/drivers/gpu/drm/xe/xe_sa.h
+++ b/drivers/gpu/drm/xe/xe_sa.h
@@ -17,6 +17,7 @@ struct xe_tile;
 #define XE_SA_BO_MANAGER_FLAG_SHADOW	BIT(0)
 struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size,
 					      u32 guard, u32 align, u32 flags);
+void xe_sa_bo_manager_fence_disable(struct xe_sa_manager *sa_manager, bool disable);
 struct drm_suballoc *__xe_sa_bo_new(struct xe_sa_manager *sa_manager, u32 size, gfp_t gfp);
 
 static inline struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32 align)
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
index db023fb66a27..0508847da468 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
@@ -152,7 +152,6 @@ static int alloc_bb_pool(struct xe_tile *tile, struct xe_sriov_vf_ccs_ctx *ctx)
 
 	sa_manager = __xe_sa_bo_manager_init(tile, bb_pool_size, SZ_4K, SZ_16,
 					     XE_SA_BO_MANAGER_FLAG_SHADOW);
-
 	if (IS_ERR(sa_manager)) {
 		xe_sriov_err(xe, "Suballocator init failed with error: %pe\n",
 			     sa_manager);
@@ -160,6 +159,8 @@ static int alloc_bb_pool(struct xe_tile *tile, struct xe_sriov_vf_ccs_ctx *ctx)
 		return err;
 	}
 
+	xe_sa_bo_manager_fence_disable(sa_manager, true);
+
 	offset = 0;
 	xe_map_memset(xe, &sa_manager->bo->vmap, offset, MI_NOOP,
 		      bb_pool_size);
-- 
2.43.0

