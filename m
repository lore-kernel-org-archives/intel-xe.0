Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE5F8E77184
	for <intel-xe@archiver.kernel.org>; Tue, 17 Dec 2024 22:23:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8294610E180;
	Tue, 17 Dec 2024 22:23:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nPDrcWz/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45F8910E180
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Dec 2024 22:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734474181; x=1766010181;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=J/U+XSuO1i7QCiosnT/2Cy5y8T0BMB//dAWeKVhoflQ=;
 b=nPDrcWz/4DgdhKRWieCO6cyX3Z/0LQ9CEBBxi2iso0VOsuSPPj17Bnk3
 1jmTrAGdV7UMEDxlfW96dGR/zq/gJBnAcin/YKyT7yhAR3qzE2L9Xk7f+
 0Ufs4R5Z0nh8bLp9RC9bejge3MJISVRFrlUIaNgvqbaccG9a/rSTsbxf9
 TZTbCIctL4Yuug+ZjbRLqsO4QGEgTdE5QWD91jl1VROHW+TyRR9MojY/2
 8FqxgWd0lY4ujhU8N/EIYjH8hixUO+CBJDmXCCVasX/sLpsTLph/MOOiI
 6LxiC+ISW9VWu5w2qPzxUMJR0eoyrGsdQC7s0sIHlPJ/3OO5tNi6fv4bm w==;
X-CSE-ConnectionGUID: M7u0YY1tR/qQDEi+0Oezxg==
X-CSE-MsgGUID: zr17VM0QTNCuVoYFbYskFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="37760091"
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; d="scan'208";a="37760091"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 14:23:01 -0800
X-CSE-ConnectionGUID: gdL/OmBmQEyMLhluKV6GFg==
X-CSE-MsgGUID: kNC/wTsqSKa1GAdJrjQLeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; d="scan'208";a="102669724"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.21.182])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 14:23:00 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe/sa: Drop hardcoded 4K guard in sub-allocator
Date: Tue, 17 Dec 2024 23:22:46 +0100
Message-Id: <20241217222246.863-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

Any required prefetch guards are added during batch buffer
allocations anyway.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_sa.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
index e055bed7ae55..2f69277b1a50 100644
--- a/drivers/gpu/drm/xe/xe_sa.c
+++ b/drivers/gpu/drm/xe/xe_sa.c
@@ -34,7 +34,6 @@ static void xe_sa_bo_manager_fini(struct drm_device *drm, void *arg)
 struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32 align)
 {
 	struct xe_device *xe = tile_to_xe(tile);
-	u32 managed_size = size - SZ_4K;
 	struct xe_bo *bo;
 	int ret;
 
@@ -58,11 +57,11 @@ struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32
 	sa_manager->bo = bo;
 	sa_manager->is_iomem = bo->vmap.is_iomem;
 
-	drm_suballoc_manager_init(&sa_manager->base, managed_size, align);
+	drm_suballoc_manager_init(&sa_manager->base, size, align);
 	sa_manager->gpu_addr = xe_bo_ggtt_addr(bo);
 
 	if (bo->vmap.is_iomem) {
-		sa_manager->cpu_ptr = kvzalloc(managed_size, GFP_KERNEL);
+		sa_manager->cpu_ptr = kvzalloc(size, GFP_KERNEL);
 		if (!sa_manager->cpu_ptr) {
 			sa_manager->bo = NULL;
 			return ERR_PTR(-ENOMEM);
-- 
2.47.1

