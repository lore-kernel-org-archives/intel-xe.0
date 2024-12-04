Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F96BE7716B
	for <intel-xe@archiver.kernel.org>; Wed,  4 Dec 2024 11:17:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B4AA10E33C;
	Wed,  4 Dec 2024 11:17:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dTbfFVBU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CE7F10E33C
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Dec 2024 11:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733311025; x=1764847025;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xGGblU6/fTMkc0WClW1qvD13P4FkOvQ7u3JfqCXV7ag=;
 b=dTbfFVBUGGIj57uPGmBhWbW8acbQDOlmuBGD+xtPtfDI/HugMfxUjpA9
 TS0emPPflPXoxzs6aEu/s/TXXLf39zN6GjjhLjYvJ/8VP68PkFWDqawVH
 J9J9QxntZpSfK3scbuwqW3Ur/n6FFLj6yVQvdnW+vYOjxm2s0Tgux+KZ8
 hytRsL1HWTU0dGQWG9yA8gMVtP1l0QITNzZMELhMmw0FTSbvlDBOKrhPE
 6JD1N+9R572485hzVK5OnRL71U+QgNsjPKKY+YMZm6SMPyZQ2KYt0htnj
 GU8AHtIxNS8YpoX1zq2kEgIwUgUpyXyaMevnpzcXwwVXwxEINZgH4c+9J w==;
X-CSE-ConnectionGUID: k3QDhZ87TF+ZMtA7BIasQA==
X-CSE-MsgGUID: jdIpwamoSISWpHWFzlQUNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="51103793"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="51103793"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 03:17:04 -0800
X-CSE-ConnectionGUID: wfNC7oVvRKOhrpRKl1Cfag==
X-CSE-MsgGUID: 88SsXLJLTASBprnuT6VG3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="98725450"
Received: from ilevi-mobl.ger.corp.intel.com (HELO ilevi-mobl.intel.com)
 ([10.245.176.53])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 03:17:03 -0800
From: Ilia Levi <ilia.levi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ilia.levi@intel.com, piotr.piorkowski@intel.com,
 michal.wajdeczko@intel.com, koby.elbaz@intel.com, yaron.avizrat@intel.com
Subject: [PATCH] drm/xe: Use managed BO in memirq
Date: Wed,  4 Dec 2024 13:16:55 +0200
Message-Id: <20241204111655.1293-1-ilia.levi@intel.com>
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

When probe has an error, the current scheme causes a page fault during
resource unwinding. This happens because GTTMMADR_BAR gets unmapped
before the allocated BO is released via drmm. Switching to a managed BO
that is released via devm solves this ordering issue.

Signed-off-by: Ilia Levi <ilia.levi@intel.com>
---
 drivers/gpu/drm/xe/xe_memirq.c | 23 +++++++----------------
 1 file changed, 7 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
index 51dc90906003..404fa2a456d5 100644
--- a/drivers/gpu/drm/xe/xe_memirq.c
+++ b/drivers/gpu/drm/xe/xe_memirq.c
@@ -155,13 +155,6 @@ static const char *guc_name(struct xe_guc *guc)
  *
  */
 
-static void __release_xe_bo(struct drm_device *drm, void *arg)
-{
-	struct xe_bo *bo = arg;
-
-	xe_bo_unpin_map_no_vm(bo);
-}
-
 static inline bool hw_reports_to_instance_zero(struct xe_memirq *memirq)
 {
 	/*
@@ -184,14 +177,12 @@ static int memirq_alloc_pages(struct xe_memirq *memirq)
 	BUILD_BUG_ON(!IS_ALIGNED(XE_MEMIRQ_SOURCE_OFFSET(0), SZ_64));
 	BUILD_BUG_ON(!IS_ALIGNED(XE_MEMIRQ_STATUS_OFFSET(0), SZ_4K));
 
-	/* XXX: convert to managed bo */
-	bo = xe_bo_create_pin_map(xe, tile, NULL, bo_size,
-				  ttm_bo_type_kernel,
-				  XE_BO_FLAG_SYSTEM |
-				  XE_BO_FLAG_GGTT |
-				  XE_BO_FLAG_GGTT_INVALIDATE |
-				  XE_BO_FLAG_NEEDS_UC |
-				  XE_BO_FLAG_NEEDS_CPU_ACCESS);
+	bo = xe_managed_bo_create_pin_map(xe, tile, bo_size,
+					  XE_BO_FLAG_SYSTEM |
+					  XE_BO_FLAG_GGTT |
+					  XE_BO_FLAG_GGTT_INVALIDATE |
+					  XE_BO_FLAG_NEEDS_UC |
+					  XE_BO_FLAG_NEEDS_CPU_ACCESS);
 	if (IS_ERR(bo)) {
 		err = PTR_ERR(bo);
 		goto out;
@@ -215,7 +206,7 @@ static int memirq_alloc_pages(struct xe_memirq *memirq)
 		     xe_bo_ggtt_addr(bo), bo_size, XE_MEMIRQ_SOURCE_OFFSET(0),
 		     XE_MEMIRQ_STATUS_OFFSET(0));
 
-	return drmm_add_action_or_reset(&xe->drm, __release_xe_bo, memirq->bo);
+	return 0;
 
 out:
 	memirq_err(memirq, "Failed to allocate memirq page (%pe)\n", ERR_PTR(err));
-- 
2.43.2

