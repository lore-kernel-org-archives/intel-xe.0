Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2F06C61DD3
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 06:51:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0D2C10E615;
	Mon, 31 Aug 2026 06:51:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i+axM1NJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD83E10E5E4
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 06:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788159067; x=1819695067;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JkWEqrGSGmfc24ELSjaEf/n0+DRjVa1ICI+D0dldGS4=;
 b=i+axM1NJRGfV413amcg0C3omBVLvB8OvOUqicvxMcGbsc7vVZBcEIXE9
 EQJiXHt3ifZXF7RaoZCh8TvGAtT2oR8NdgJKimR2NM6zD3IdRO3ZdG/z1
 68xwM9iPYbXlNoyoUWalsfxfrIZDVMmSaNaoDuHZeDxXL+xpSMUuzXXa1
 ghsrVf30/J2Fm3EoyGbc6Ko1EAszUQrxVDEhjCp4Bvfg0DxvFKAPIBP/8
 xm6iUs5rYzGAYYyK5hJq/Xs8mJvF82bFyM6XBH7UVwVF2yGxNtk3DxWhE
 55gflJSiydehXBHHgq7VSiVUszLNUa9sHN3vUn8/oF1byxrj4HjKn5LRN Q==;
X-CSE-ConnectionGUID: BnLNGYUlQj6rvPzQqVKsHg==
X-CSE-MsgGUID: nWDjpl3cSPaLUZU9PCfFGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="106081706"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="106081706"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2026 23:50:13 -0700
X-CSE-ConnectionGUID: UOfugKgHR0y0NBSimqRlaQ==
X-CSE-MsgGUID: u43+MfXmS+C9sOHSD/mEag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="269302809"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2026 23:50:11 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, rodrigo.vivi@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH V19 04/15] drm/xe: Handle NULL resource and allow purging of
 VRAM pages
Date: Mon, 31 Aug 2026 12:19:46 +0530
Message-ID: <20260831064942.315720-21-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260831064942.315720-17-tejas.upadhyay@intel.com>
References: <20260831064942.315720-17-tejas.upadhyay@intel.com>
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

