Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B601EC531DA
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 23:12:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 722B810EA2B;
	Fri,  9 Aug 2024 23:12:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="afkXpNY8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C658710EA2B
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Aug 2024 23:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723245169; x=1754781169;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SFfy3g37RnZqMEGXHhzTPjYEq0SpjA6Xs7fSUruOw3w=;
 b=afkXpNY8QctZQxZwQvQPMZDuDwaaCl696b6SEkQk09+/fe8ofeByWqAc
 G3CMFMIBwmh/yjOOOjCS1VXJ2Ujq+ElG5FRmRCo9G54fKi9Rex0PaF6Pm
 bapRvt1VjZwLzdbKxPV8QPWu0Tlcmt41VmAunRh2LZOAx7zdxJSOQSGPn
 YzZS/3/JZA3TlwBfTyVd5oq6D0YHCEbXBsjVdt1+xPB/D84C5Z3UZYyr+
 gQ+AH9pTHvCOnYJ7S+w1v5Y840CXaS41spCzeli7ttisHp/z9LAL5Vjpm
 UVJ8pddeHUGtXm8WgE7XPKPmyjm1owQBdRVEf+PSTStWeIIzw4/ADwRGE Q==;
X-CSE-ConnectionGUID: mi4ESEZnTV+88hsEGIehxQ==
X-CSE-MsgGUID: PGfUxnAISg6ShLX5RwpSBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="32845946"
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; d="scan'208";a="32845946"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 16:12:49 -0700
X-CSE-ConnectionGUID: yuHv68x9QDCjmfDpaxRVag==
X-CSE-MsgGUID: rtGS8R1NSVGXoZYXpQElxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; d="scan'208";a="62107095"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 16:12:49 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH 1/3] drm/xe: use devm instead of drmm for managed bo
Date: Fri,  9 Aug 2024 16:12:35 -0700
Message-ID: <20240809231237.1503796-2-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240809231237.1503796-1-daniele.ceraolospurio@intel.com>
References: <20240809231237.1503796-1-daniele.ceraolospurio@intel.com>
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

The BO cleanup touches the GGTT and therefore requires the HW to be
available, so we need to use devm instead of drmm.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1160
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 3295bc92d7aa..45652d7e6fa6 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1576,7 +1576,7 @@ struct xe_bo *xe_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
 	return bo;
 }
 
-static void __xe_bo_unpin_map_no_vm(struct drm_device *drm, void *arg)
+static void __xe_bo_unpin_map_no_vm(void *arg)
 {
 	xe_bo_unpin_map_no_vm(arg);
 }
@@ -1591,7 +1591,7 @@ struct xe_bo *xe_managed_bo_create_pin_map(struct xe_device *xe, struct xe_tile
 	if (IS_ERR(bo))
 		return bo;
 
-	ret = drmm_add_action_or_reset(&xe->drm, __xe_bo_unpin_map_no_vm, bo);
+	ret = devm_add_action_or_reset(xe->drm.dev, __xe_bo_unpin_map_no_vm, bo);
 	if (ret)
 		return ERR_PTR(ret);
 
@@ -1639,7 +1639,7 @@ int xe_managed_bo_reinit_in_vram(struct xe_device *xe, struct xe_tile *tile, str
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
-	drmm_release_action(&xe->drm, __xe_bo_unpin_map_no_vm, *src);
+	devm_release_action(xe->drm.dev, __xe_bo_unpin_map_no_vm, *src);
 	*src = bo;
 
 	return 0;
-- 
2.43.0

