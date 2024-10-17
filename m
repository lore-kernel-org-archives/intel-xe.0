Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC715D374A3
	for <intel-xe@archiver.kernel.org>; Thu, 17 Oct 2024 14:44:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7138E10E201;
	Thu, 17 Oct 2024 14:44:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V6g5pLxp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 268B710E201
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Oct 2024 14:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729176273; x=1760712273;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Oz95CjlCKl1RlUVdHYQ5yrw6SsHaSVQCX/kz7CQM5sM=;
 b=V6g5pLxp3rspKavlVQ/3aJHS6tLIKgb5YCvHfHCzglUyY1R24qfm0VZR
 eu/kr3b8+61panxmGqZS506MxI93U9v5hYovSDGwY5okVTTGziwgX1IPo
 LVYLqHGFnJfErK3yjKim4fSzQ6eVoM9ckBKMmlfa/0NWjwtznDTaUar21
 bZB5aI6DWyjrPLQEluCS9CMoHiNpgMn5SLF/Iu7zwYqN2lzpjj2gD4J6g
 VwkT8xRMGH/ksQ1IDVw4FlDtHrPqlnOUyyEDIg3vHhcuBvWzx6hW0AKFn
 j9qwlWfMiIcNsUO+bFThhButmMxlqNt+PKdeRNpXowuUKlNCnry3Yuw8C A==;
X-CSE-ConnectionGUID: XidCkW9tTTuHA46eEaPHxA==
X-CSE-MsgGUID: 5cEMAAIaTkaPsvrOF+nveg==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="28547046"
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; d="scan'208";a="28547046"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 07:44:33 -0700
X-CSE-ConnectionGUID: r55fGgFFTyOoHZBVRhnPDg==
X-CSE-MsgGUID: i3XTYlzJTIi+KO6gGMFC8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; d="scan'208";a="82522960"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.150])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 07:44:32 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH 1/2] drm/xe: Avoid the OOM killer on buffer object memory
 allocation
Date: Thu, 17 Oct 2024 16:44:06 +0200
Message-ID: <20241017144407.91919-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241017144407.91919-1-thomas.hellstrom@linux.intel.com>
References: <20241017144407.91919-1-thomas.hellstrom@linux.intel.com>
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

Rather than invoking the OOM killer on buffer object memory
allocations and validations, have the allocations fail and
pass the error to user-space if applicable.

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2701
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index c74c121ea7bb..d060f4f019a2 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -876,6 +876,7 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
 	};
 	struct ttm_operation_ctx ctx = {
 		.interruptible = false,
+		.gfp_retry_mayfail = true,
 	};
 	struct ttm_resource *new_mem;
 	int ret;
@@ -937,6 +938,7 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
 {
 	struct ttm_operation_ctx ctx = {
 		.interruptible = false,
+		.gfp_retry_mayfail = false,
 	};
 	struct ttm_resource *new_mem;
 	int ret;
@@ -1099,7 +1101,8 @@ static void xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operati
 static void xe_ttm_bo_swap_notify(struct ttm_buffer_object *ttm_bo)
 {
 	struct ttm_operation_ctx ctx = {
-		.interruptible = false
+		.interruptible = false,
+		.gfp_retry_mayfail = false,
 	};
 
 	if (ttm_bo->ttm) {
@@ -1294,6 +1297,7 @@ struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 	struct ttm_operation_ctx ctx = {
 		.interruptible = true,
 		.no_wait_gpu = false,
+		.gfp_retry_mayfail = true,
 	};
 	struct ttm_placement *placement;
 	uint32_t alignment;
@@ -1880,6 +1884,7 @@ int xe_bo_validate(struct xe_bo *bo, struct xe_vm *vm, bool allow_res_evict)
 	struct ttm_operation_ctx ctx = {
 		.interruptible = true,
 		.no_wait_gpu = false,
+		.gfp_retry_mayfail = true,
 	};
 
 	if (vm) {
@@ -2223,6 +2228,7 @@ int xe_bo_migrate(struct xe_bo *bo, u32 mem_type)
 	struct ttm_operation_ctx ctx = {
 		.interruptible = true,
 		.no_wait_gpu = false,
+		.gfp_retry_mayfail = true,
 	};
 	struct ttm_placement placement;
 	struct ttm_place requested;
@@ -2273,6 +2279,7 @@ int xe_bo_evict(struct xe_bo *bo, bool force_alloc)
 		.interruptible = false,
 		.no_wait_gpu = false,
 		.force_alloc = force_alloc,
+		.gfp_retry_mayfail = true,
 	};
 	struct ttm_placement placement;
 	int ret;
-- 
2.46.0

