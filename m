Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43FDFCA0FF0
	for <intel-xe@archiver.kernel.org>; Mon,  1 Sep 2025 16:13:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D5C10E4EE;
	Mon,  1 Sep 2025 16:13:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P7ZH90Xo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A40710E4EE
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Sep 2025 16:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756743226; x=1788279226;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c1g2kQmuqBPzCvIgcVrHxaztc37xNdsd+dZpuZNzmEc=;
 b=P7ZH90Xor0Zxlk1Cy1B4XqJjgSPAK7B+pFiy19ARb9je1zdVdfEYqRh2
 75wANp/TLt/+Kg2OCfCd58y0X2Gf7hV1HdUy2RHavNW7uBvPsjJVoy6t9
 SKemyLfUtselWjnOna5YIl2DH4jfIE/yrYQwu0E09tczrGbonfKql0k7Y
 PzJRKR/phGUVx/EBhqQzWUFA/RsE3DSL71SJ6kyc+lI8OxabXC/a+/5kt
 qrWT+iVIqIhfxfNQRI/7hejcR+A5IsqXvvC2EUmm2OYLyTMcYMy3d9e7+
 ttFzFHjrkqCgc2QQA3Na/Hd52o/t/AsA739XF0X7+ev5Ki7Jw5lNzBv6F Q==;
X-CSE-ConnectionGUID: WsRHZBmwQDSZS9LWpSGp/A==
X-CSE-MsgGUID: m2urRLgKTGisS/qyC/Lxqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="58204389"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; d="scan'208";a="58204389"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2025 09:13:46 -0700
X-CSE-ConnectionGUID: ekOhbAGoSCmk8EBBIqDC0w==
X-CSE-MsgGUID: H2uMOreRTUafMmDYgpOt/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; d="scan'208";a="171215226"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.244.171])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2025 09:13:45 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v3 13/14] drm/xe: Convert psmi_alloc_object for exhaustive
 eviction
Date: Mon,  1 Sep 2025 18:12:48 +0200
Message-ID: <20250901161250.5279-14-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250901161250.5279-1-thomas.hellstrom@linux.intel.com>
References: <20250901161250.5279-1-thomas.hellstrom@linux.intel.com>
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

Open-code instead of adding yet another xe_bo_create_xxx() interface
pending a rework of the bo create functionality.

v3:
- Patch added.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_psmi.c | 40 +++++++++++++++++++++++-------------
 1 file changed, 26 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_psmi.c b/drivers/gpu/drm/xe/xe_psmi.c
index 2815987c190d..40ae094e2c4f 100644
--- a/drivers/gpu/drm/xe/xe_psmi.c
+++ b/drivers/gpu/drm/xe/xe_psmi.c
@@ -68,7 +68,8 @@ static void psmi_cleanup(struct xe_device *xe)
 static struct xe_bo *psmi_alloc_object(struct xe_device *xe,
 				       unsigned int id, size_t bo_size)
 {
-	struct drm_exec *exec = XE_VALIDATION_UNIMPLEMENTED;
+	struct xe_validation_ctx ctx;
+	struct drm_exec exec;
 	struct xe_bo *bo = NULL;
 	struct xe_tile *tile;
 	int err;
@@ -78,24 +79,35 @@ static struct xe_bo *psmi_alloc_object(struct xe_device *xe,
 
 	tile = &xe->tiles[id - 1];
 
-	/* VRAM: Allocate GEM object for the capture buffer */
-	bo = xe_bo_create_locked(xe, tile, NULL, bo_size,
-				 ttm_bo_type_kernel,
-				 XE_BO_FLAG_VRAM_IF_DGFX(tile) |
-				 XE_BO_FLAG_PINNED |
-				 XE_BO_FLAG_PINNED_LATE_RESTORE |
-				 XE_BO_FLAG_NEEDS_CPU_ACCESS,
-				 exec);
+	xe_validation_guard(&ctx, &xe->val, &exec, (struct xe_val_flags) {}, err) {
+		/* VRAM: Allocate GEM object for the capture buffer */
+		bo = xe_bo_create_locked(xe, tile, NULL, bo_size,
+					 ttm_bo_type_kernel,
+					 XE_BO_FLAG_VRAM_IF_DGFX(tile) |
+					 XE_BO_FLAG_PINNED |
+					 XE_BO_FLAG_PINNED_LATE_RESTORE |
+					 XE_BO_FLAG_NEEDS_CPU_ACCESS,
+					 &exec);
+		if (IS_ERR(bo)) {
+			drm_exec_retry_on_contention(&exec);
+			err = PTR_ERR(bo);
+			xe_validation_retry_on_oom(&ctx, &err);
+			if (err)
+				break;
+		}
 
-	if (!IS_ERR(bo)) {
 		/* Buffer written by HW, ensure stays resident */
-		err = xe_bo_pin(bo, exec);
-		if (err)
-			bo = ERR_PTR(err);
+		err = xe_bo_pin(bo, &exec);
 		xe_bo_unlock(bo);
+		if (err) {
+			xe_bo_put(bo);
+			drm_exec_retry_on_contention(&exec);
+			xe_validation_retry_on_oom(&ctx, &err);
+			break;
+		}
 	}
 
-	return bo;
+	return err ? ERR_PTR(err) : bo;
 }
 
 /*
-- 
2.50.1

