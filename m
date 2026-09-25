Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D376EC9832A
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 04:53:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 614A910F859;
	Fri, 25 Sep 2026 04:53:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ng2W6AzN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65C5B10E44C
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 04:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790312011; x=1821848011;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Q7taCW0Y7F96kQYtvJxXteWs/cwZn300CKu7S+HYEEo=;
 b=Ng2W6AzNeeL/OG68zcWSnIM+3mKBNusY91vnDEjLc/0hoLSuKQfK3mjX
 I7OQGXeNGhjrtQam2dKjnDUNKVVSwuAt7LPnzgWnb7cYaH10U72X5//rx
 X8uX7b/usXmK2aAFuJHGPKuhuNKdPeJhP8n/fgkSUuoNF+slU9mjoAIog
 ovyVhGVTVuC6tud8AqHQgbSPronzfR2tLNpVohtCLXleqZ+8XBQu4QJu4
 ggmW61+NdWu71QgOyBUfP3bfAmPvHHXqBi8HSvMyQHM1uOcYeOsuQmdkS
 6rnuAoWbKQNfw61mz1ICzc8lCDly0QR353gnJUoQv6GmZUJYTQ/kAXeBl w==;
X-CSE-ConnectionGUID: EHzj49vuTWu6Cu5o5iRzjA==
X-CSE-MsgGUID: K6CiFy4RRD6uRiz2wl9Raw==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90156214"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; d="scan'208";a="90156214"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 21:53:27 -0700
X-CSE-ConnectionGUID: hFOK6WrQS/uKaUjT6DuF7Q==
X-CSE-MsgGUID: VXEjK1tdShqmNVwIT2FwbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; d="scan'208";a="312155496"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 21:53:26 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v7 01/24] drm/xe: reference VM from PT BOs
Date: Thu, 24 Sep 2026 21:52:57 -0700
Message-Id: <20260925045320.1325860-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260925045320.1325860-1-matthew.brost@intel.com>
References: <20260925045320.1325860-1-matthew.brost@intel.com>
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

PT BOs share the VM's dma-resv and therefore must keep the VM alive
until all PT BOs are destroyed.
 
Take a VM reference from PT BOs to ensure the shared dma-resv remains
valid for the lifetime of the BOs. Scope the change to PT BOs rather
than all kernel BOs to minimize risk and avoid extending VM lifetimes
unnecessarily.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index f2ab9bf43a86..6921b6967330 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1879,7 +1879,7 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
 		xe_drm_client_remove_bo(bo);
 #endif
 
-	if (bo->vm && xe_bo_is_user(bo))
+	if (bo->vm && (xe_bo_is_user(bo) || bo->flags & XE_BO_FLAG_PAGETABLE))
 		xe_vm_put(bo->vm);
 
 	if (bo->parent_obj)
@@ -2575,7 +2575,7 @@ __xe_bo_create_locked(struct xe_device *xe,
 	 * by having all the vm's bo refereferences released at vm close
 	 * time.
 	 */
-	if (vm && xe_bo_is_user(bo))
+	if (vm && (xe_bo_is_user(bo) || bo->flags & XE_BO_FLAG_PAGETABLE))
 		xe_vm_get(vm);
 	bo->vm = vm;
 
-- 
2.34.1

