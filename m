Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A703DD767DD
	for <intel-xe@archiver.kernel.org>; Thu, 31 Oct 2024 15:37:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7003A10E8D0;
	Thu, 31 Oct 2024 15:37:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GSaq9UNx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00C3F10E8D0
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Oct 2024 15:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730389066; x=1761925066;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9n15XZavDl+jTlH7sSrGpzz4qzdo7pvT4qpBY+cxT9w=;
 b=GSaq9UNxto4oYqZbUTkznSlTjqpOcpwoPDUw1CgPa8CVWZl00wZWrsWQ
 xm7LD8UfTuMu8G/R2X9HAfxOn6LfmQ4AWJ2L5vX+T7H2PvX15gfTv4z+a
 9q13J1ZCeqbGfg9mP+BB/Qmv/CzPCPbgiNPmDI+KbuNRbFEhe3bL9qqv9
 NjFtwZrugYS9KJpsWhtJVjgzwWAsyS81hkROwugmlwPAzmvW7pKw5B9G0
 +ksAnmENDZ8CGY1ct1QcKlThCILlwWfuQOMs+E9ZWyrGkBy7eKcbiaTVz
 6uH4/l7eHxIpqF2kk7RTqE/dsoM0KHTS8Nq7P8XIwIyBCvKCEfthPz9us g==;
X-CSE-ConnectionGUID: azbJBX5JSZ6Ydmbr23xpTQ==
X-CSE-MsgGUID: xfhUIvzmToybCde1yzbpMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30089077"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30089077"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 08:37:46 -0700
X-CSE-ConnectionGUID: yOBcsYZ3QRCDj9z4VWzDjA==
X-CSE-MsgGUID: zzBKekCyTOGruzqEBMeBZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="87446043"
Received: from carterle-desk.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.213])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 08:37:44 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 1/2] drm/xe: Avoid the OOM killer on buffer object memory
 allocation
Date: Thu, 31 Oct 2024 16:37:31 +0100
Message-ID: <20241031153732.164995-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241031153732.164995-1-thomas.hellstrom@linux.intel.com>
References: <20241031153732.164995-1-thomas.hellstrom@linux.intel.com>
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
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 5b232f2951b1..7082290539df 100644
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
@@ -1897,6 +1901,7 @@ int xe_bo_validate(struct xe_bo *bo, struct xe_vm *vm, bool allow_res_evict)
 	struct ttm_operation_ctx ctx = {
 		.interruptible = true,
 		.no_wait_gpu = false,
+		.gfp_retry_mayfail = true,
 	};
 
 	if (vm) {
@@ -2240,6 +2245,7 @@ int xe_bo_migrate(struct xe_bo *bo, u32 mem_type)
 	struct ttm_operation_ctx ctx = {
 		.interruptible = true,
 		.no_wait_gpu = false,
+		.gfp_retry_mayfail = true,
 	};
 	struct ttm_placement placement;
 	struct ttm_place requested;
@@ -2290,6 +2296,7 @@ int xe_bo_evict(struct xe_bo *bo, bool force_alloc)
 		.interruptible = false,
 		.no_wait_gpu = false,
 		.force_alloc = force_alloc,
+		.gfp_retry_mayfail = true,
 	};
 	struct ttm_placement placement;
 	int ret;
-- 
2.46.2

