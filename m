Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F46CC5472F
	for <intel-xe@archiver.kernel.org>; Tue, 27 Aug 2024 16:17:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2579610E376;
	Tue, 27 Aug 2024 16:17:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tg4yqsV/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA40C10E376
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Aug 2024 16:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724775457; x=1756311457;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kPbmsUN0+sn42pbPs4vyy4vjFp0hGqq2xqB5T7GBc4U=;
 b=Tg4yqsV/ZlJDYzKP1OpL/KKu8V5gNabXpUgxZ5Xt1UAtmYFU0RwET4Gi
 rtXPhh3ViKTaW0ahlAOAy/JAijoZhFkU1X1dk8T1KPpC7b9ogOBp8StjV
 WsZqitOatp4Xx/NLto9uj4USSpYOmPCZAku27UMXGBKWypSYya6TOwc+5
 H3NovwzqbMUIZR8hBkJzmVnnCdIqTngshjLdx/Y2tsOwxG3iVgJlasXOD
 yhhEhiYCysbGkSmGjoQ9+crd2Q78xquV5dVJkHwrKBOoTGui8ENTW04TR
 9iBE+2GwV+UckkT6q9Fp4JUt52IvhSBsZPRJAUytu4LBHqzk4crmbbDCz Q==;
X-CSE-ConnectionGUID: viAFJTvAQ+SV680R5/+k2w==
X-CSE-MsgGUID: 5QkV0h8LTBacs+46ZwxsHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="26166037"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="26166037"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 09:17:36 -0700
X-CSE-ConnectionGUID: U3+7iGlwSNydLHZgRXzvPA==
X-CSE-MsgGUID: fc+IPRhVSeO64q0rRs9ffg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="100423336"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 09:17:33 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 1/2] drm/xe: Skip CCS clear for WB type BOs
Date: Tue, 27 Aug 2024 17:49:09 +0200
Message-ID: <20240827154910.24841-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

HW treats any access to 1-way or 2-way coherent memory as compression
disabled memory. So for such BOs there is no need to do CCS clearing.

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index cbe7bf098970..24701272e3af 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -283,6 +283,7 @@ struct xe_ttm_tt {
 	struct device *dev;
 	struct sg_table sgt;
 	struct sg_table *sg;
+	bool skip_ccs_clear:1;
 };
 
 static int xe_tt_map_sg(struct ttm_tt *tt)
@@ -404,6 +405,8 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
 	if (ttm_bo->type == ttm_bo_type_device && xe->mem.gpu_page_clear_sys)
 		page_flags |= TTM_TT_FLAG_CLEARED_ON_FREE;
 
+	/* compression is not allowed for cached BO so ccs clear can be skipped. */
+	tt->skip_ccs_clear = caching == ttm_cached;
 	err = ttm_tt_init(&tt->ttm, &bo->ttm, page_flags, caching, extra_pages);
 	if (err) {
 		kfree(tt);
@@ -664,13 +667,16 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 	struct ttm_resource *old_mem = ttm_bo->resource;
 	u32 old_mem_type = old_mem ? old_mem->mem_type : XE_PL_SYSTEM;
 	struct ttm_tt *ttm = ttm_bo->ttm;
+	struct xe_ttm_tt *xe_tt = container_of(ttm_bo->ttm, struct xe_ttm_tt,
+					       ttm);
 	struct xe_migrate *migrate = NULL;
 	struct dma_fence *fence;
 	bool move_lacks_source;
 	bool tt_has_data;
 	bool needs_clear;
 	bool handle_system_ccs = (!IS_DGFX(xe) && xe_bo_needs_ccs_pages(bo) &&
-				  ttm && ttm_tt_is_populated(ttm)) ? true : false;
+				  ttm && ttm_tt_is_populated(ttm) &&
+				  !xe_tt->skip_ccs_clear) ? true : false;
 	bool clear_system_pages;
 	int ret = 0;
 
-- 
2.42.0

