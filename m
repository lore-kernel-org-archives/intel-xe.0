Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8FD2C624A4
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 16:16:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5508B10F693;
	Thu,  3 Sep 2026 16:16:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Etf1/2KK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FFD510F693
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 16:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788452181; x=1819988181;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gNPXa5Qt4oZ/UrZujsJ+CCgliVxLpTLM+UCzzLL1R8g=;
 b=Etf1/2KK849AjiMj0ID3RSpExprDH7rwQDNnFEye6331h1G7B0WiEEj/
 7dMAK4RlWaWXcS1MjuYfYXIufUKGEMnx1sI/8hWS045BmIf26QBB6YsYm
 /VUn9x1oY7Pf3qkg8zty/vRnW+0mqUS2Ax0XAXnOCHqkNZLuqnikSWpEb
 k+01VtXiVgfkQFucdt5VB/fhCPZL8hZTW9P6d8OkdIgE2b05uMozsDWEQ
 dn/iegh9BbhFsmqFDrOfor/W8+XFZlEaiIYxW0MNdXZD/Tch3EDVBZ2wQ
 bnx970aKekchX3cKPoaYcOw/T4eiQ8flAnowgZDGVASqojltmswIQAzed w==;
X-CSE-ConnectionGUID: sBo8RtOvQGuVhmyJwAkLKw==
X-CSE-MsgGUID: pLAJbKUiRWW7RSwNF1zBJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="114487006"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="114487006"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 09:16:21 -0700
X-CSE-ConnectionGUID: uPLchIZiQeW2oaUJLtA4Ow==
X-CSE-MsgGUID: R/YfQtiCRD+BIn7vU2M9Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="268461460"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 09:16:19 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, rodrigo.vivi@intel.com,
 Matthew Brost <matthew.brost@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH V21 04/15] drm/xe: Handle NULL resource and allow purging of
 VRAM pages
Date: Thu,  3 Sep 2026 21:45:57 +0530
Message-ID: <20260903161553.528932-21-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260903161553.528932-17-tejas.upadhyay@intel.com>
References: <20260903161553.528932-17-tejas.upadhyay@intel.com>
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

Add NULL checks for the buffer object's resource pointer in
xe_bo_is_vram() and xe_bo_is_stolen() to prevent potential NULL
pointer dereferences when checking memory location during page
offlining.

Additionally, remove the `!ttm_bo->ttm` check from
xe_ttm_bo_purge(). This restriction is stripped away to
explicitly allow the driver to purge VRAM pages during the
memory page offline sequence.

v2(Sashiko):
- Split export and this patch also Check NULL res in
  xe_bo_is_vram() and xe_bo_is_stolen()

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 8f93e09e51bb..d30a8411d2a3 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -104,13 +104,16 @@ static bool resource_is_vram(struct ttm_resource *res)
 
 bool xe_bo_is_vram(struct xe_bo *bo)
 {
-	return resource_is_vram(bo->ttm.resource) ||
-		resource_is_stolen_vram(xe_bo_device(bo), bo->ttm.resource);
+	struct ttm_resource *res = bo->ttm.resource;
+
+	return  res && (resource_is_vram(res) || resource_is_stolen_vram(xe_bo_device(bo), res));
 }
 
 bool xe_bo_is_stolen(struct xe_bo *bo)
 {
-	return bo->ttm.resource->mem_type == XE_PL_STOLEN;
+	struct ttm_resource *res = bo->ttm.resource;
+
+	return res && res->mem_type == XE_PL_STOLEN;
 }
 
 /**
@@ -929,9 +932,6 @@ int xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operation_ctx *
 
 	xe_bo_assert_held(bo);
 
-	if (!ttm_bo->ttm)
-		return 0;
-
 	if (!xe_bo_madv_is_dontneed(bo))
 		return 0;
 
-- 
2.52.0

