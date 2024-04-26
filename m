Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B78FC4345F
	for <intel-xe@archiver.kernel.org>; Fri, 26 Apr 2024 21:05:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAD6A11256D;
	Fri, 26 Apr 2024 21:05:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XDXhtjD1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED8E811256B
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Apr 2024 21:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714165559; x=1745701559;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YT5QSSCiH1uuLa5nS79xzs8Pc94YilwHkXKQva1qi9w=;
 b=XDXhtjD1zIOIcXbmS8b0BG4oHzxz6eJI47RHyc2OQZQdJbZF7yN6Qu5u
 iTaoIJMk7fSFAsXc0UeCWmpNq6Or0S4kiZtDo6AyQMiIEjAv8f0Gs7pI8
 G9d/lfoTChnvAGBmxCAB5V77RmzM+xnbmlP6G/KgSBGJeJP2zA3t86Eq/
 1sUKydox3V0WxchCEBQdKzppFdvj25ANF9oFmSOBx0B7xtOG5dR4ByhVt
 W6t4mBCIrYlGMEajlVKCJSKjxBPcPr1AHo8Tvbe3HExNNZr518iyyaac/
 zct70TL5FM5j1j0ufsiAs718YwPexXnuPdBj53B3quNK5WeOpebGhKaNO w==;
X-CSE-ConnectionGUID: 5bNASlwBR3ykxLtNKThIpg==
X-CSE-MsgGUID: uXMPo+zARliPc/QcC1YP9g==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="10079990"
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000"; d="scan'208";a="10079990"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 14:05:59 -0700
X-CSE-ConnectionGUID: kjsBjCDhR56/5WqV3+X7YA==
X-CSE-MsgGUID: 3rdoNyTuSZW3gMFasm6MaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000"; d="scan'208";a="25529628"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 14:05:58 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [RFC PATCH] drm/xe: Add TTM priority levels for single and multi
 placemnts
Date: Fri, 26 Apr 2024 14:06:28 -0700
Message-Id: <20240426210628.2070068-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

The simple idea being that we should try to evict BOs with multiple
placements first before BOs with a single placment.

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c       | 4 +++-
 drivers/gpu/drm/xe/xe_bo.h       | 3 +++
 drivers/gpu/drm/xe/xe_bo_types.h | 3 ++-
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index bc1f794e3e61..1b96881ae84e 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1247,7 +1247,9 @@ struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 	bo->flags = flags;
 	bo->cpu_caching = cpu_caching;
 	bo->ttm.base.funcs = &xe_gem_object_funcs;
-	bo->ttm.priority = XE_BO_PRIORITY_NORMAL;
+	bo->ttm.priority = hweight32(flags & XE_BO_FLAG_PLACEMENTS_MASK) == 1 ?
+		XE_BO_PRIORITY_SINGLE_PLACEMENT :
+		XE_BO_PRIORITY_MULTI_PLACEMENT;
 	INIT_LIST_HEAD(&bo->pinned_link);
 #ifdef CONFIG_PROC_FS
 	INIT_LIST_HEAD(&bo->client_link);
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index a885b14bf595..c53c7286f1db 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -23,6 +23,9 @@
 #define XE_BO_FLAG_VRAM_MASK		(XE_BO_FLAG_VRAM0 | XE_BO_FLAG_VRAM1)
 /* -- */
 #define XE_BO_FLAG_STOLEN		BIT(4)
+#define XE_BO_FLAG_PLACEMENTS_MASK	(XE_BO_FLAG_SYSTEM | \
+					 XE_BO_FLAG_VRAM_MASK | \
+					 XE_BO_FLAG_STOLEN)
 #define XE_BO_FLAG_VRAM_IF_DGFX(tile)	(IS_DGFX(tile_to_xe(tile)) ? \
 					 XE_BO_FLAG_VRAM0 << (tile)->id : \
 					 XE_BO_FLAG_SYSTEM)
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index 86422e113d39..ff71364feab3 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -20,7 +20,8 @@ struct xe_vm;
 #define XE_BO_MAX_PLACEMENTS	3
 
 /* TODO: To be selected with VM_MADVISE */
-#define	XE_BO_PRIORITY_NORMAL	1
+#define	XE_BO_PRIORITY_MULTI_PLACEMENT	1
+#define XE_BO_PRIORITY_SINGLE_PLACEMENT	2
 
 /** @xe_bo: XE buffer object */
 struct xe_bo {
-- 
2.34.1

