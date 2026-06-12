Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E745CCD98CF
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jun 2026 17:05:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9286010EAD6;
	Fri, 12 Jun 2026 17:05:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CoyMZr0B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B076A10EAEC
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jun 2026 17:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781283937; x=1812819937;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=K6Id6eABD1DtOAsd4gpXlwYN8RNTmM7D1f2AYxpWh8Y=;
 b=CoyMZr0B3zdKV1IwVYpRO6aIVPu6AhdFFpMDkWdnc5uuR/kq2/sMSbhn
 0hk7B9uCLNZnn3b9uaBhHDD1EKE5VwZp7FgWwxI/2XbzIk9QdH4tm29x1
 cPeQpo7sD2dn5VL6sEIb/DYzQly+jQ5/yxjaE8dbrSAvnwOayvBJvNAwY
 mgxo0XEJ5PWb5pI9yLJOvA8/rAlbwlQSIOXpUj9RccwVK7m4olQFQCWlb
 VbzloNhamnXNQyy+gG9opDXi+qEp6e9Uer/C914KFSX9rLCmxQp+wnm1Q
 Z7uTZVtXAnVIPXNT4VLYSvjQLeXQa4SxbFhkj5g20bmnxDQS2hNrOPore w==;
X-CSE-ConnectionGUID: MPkFGD1ATRSn6/tY01CVTw==
X-CSE-MsgGUID: rY+rDmv4S5KhSbGKJ/nToQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="84688427"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; d="scan'208";a="84688427"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 10:05:28 -0700
X-CSE-ConnectionGUID: YPX98Mk4RHu+1Lm3V+y3cw==
X-CSE-MsgGUID: LtIpUCtMTnqq8tb74JiPBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; d="scan'208";a="244446616"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.97])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 10:05:20 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH] drm/xe/display: skip FORCE_WC and vm_bound check for external
 dma-bufs
Date: Fri, 12 Jun 2026 18:05:02 +0100
Message-ID: <20260612170501.550816-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.54.0
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

Currently, xe_display_bo_framebuffer_init() unconditionally attempts to
apply XE_BO_FLAG_FORCE_WC to the buffer and rejects the FB creation with
-EINVAL if the BO is already VM_BINDed.

However, for imported dma-bufs (ttm_bo_type_sg), this check doesn't seem
to make much sense since CPU caching policy is entirely controlled by
the exporter. Plus there is no place to set this flag, in the first
place. Also this is not rejected if not yet vm_binded, but that seems
arbitrary since setting or not setting FORCE_WC should a noop either
way, at this stage, and whether it is currently VM_BINDed makes no
difference.

Currently if we run an app and offload rendering to an external dGPU,
like NV or another xe device, the dma-buf passed back to the compositor
(igpu) will be an actual external import from xe pov, and it will be
missing FORCE_WC, and if the compositor side did a VM_BIND before
turning into it into an fb the whole thing gets rejected.

So it looks like we either need to reject outright, no matter what, or
this usecase is valid and we need to loosen the restriction for sg
buffers.  Proposing here to loosen the restriction.

Assisted-by: Gemini:gemini-3.1-pro-preview
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7919
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/display/xe_display_bo.c | 3 ++-
 drivers/gpu/drm/xe/display/xe_fb_pin.c     | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display_bo.c b/drivers/gpu/drm/xe/display/xe_display_bo.c
index 7fbac223b097..8953da0136dc 100644
--- a/drivers/gpu/drm/xe/display/xe_display_bo.c
+++ b/drivers/gpu/drm/xe/display/xe_display_bo.c
@@ -48,7 +48,8 @@ static int xe_display_bo_framebuffer_init(struct drm_gem_object *obj,
 	if (ret)
 		goto err;
 
-	if (!(bo->flags & XE_BO_FLAG_FORCE_WC)) {
+	if (!(bo->flags & XE_BO_FLAG_FORCE_WC) &&
+	    bo->ttm.type != ttm_bo_type_sg) {
 		/*
 		 * XE_BO_FLAG_FORCE_WC should ideally be set at creation, or is
 		 * automatically set when creating FB. We cannot change caching
diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index f93c98bec5b5..5f4a0cd8deca 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -331,7 +331,8 @@ static struct i915_vma *__xe_pin_fb_vma(struct drm_gem_object *obj, bool is_dpt,
 	int ret = 0;
 
 	/* We reject creating !SCANOUT fb's, so this is weird.. */
-	drm_WARN_ON(bo->ttm.base.dev, !(bo->flags & XE_BO_FLAG_FORCE_WC));
+	drm_WARN_ON(bo->ttm.base.dev, !(bo->flags & XE_BO_FLAG_FORCE_WC) &&
+		    bo->ttm.type != ttm_bo_type_sg);
 
 	if (!vma)
 		return ERR_PTR(-ENODEV);
-- 
2.54.0

