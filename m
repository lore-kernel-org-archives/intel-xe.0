Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD8BC35FF6
	for <intel-xe@archiver.kernel.org>; Fri, 14 Mar 2025 07:38:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61F3C10E97B;
	Fri, 14 Mar 2025 07:38:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bk68EQ36";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D234010E97A
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Mar 2025 07:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741937895; x=1773473895;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A0i5ryQ1FtBWQXiFTY4yRcIodJZaPKRHq1hDS8ojr3Q=;
 b=bk68EQ36S5spJEG7WoKpdddkG1G1JSgtF8TnPaIQd6G7Bv54ed31/C4Q
 qXcZMz1j0s0yWZKPEJ7XMqenM82krZkr+4VRHzPL65lNJqRptfh26NiVR
 iiP8SEZN3K5Zt4XQIUGki683i7EoOHnFYnXdW7aleEfCGScOA1LCHYJeU
 NF5I8IXr6RFcYOgSi0JhX9PF8XmDsHVv2JWgQ7VZ0T24HalJN/7kOKs/t
 oxBhV/vLIHBlwSrdthL+DuroM8xztWttfZTUCDw8dqsCD56zsHVcjyOfr
 3mFNCFVr2J9ReXPN1MBl25MUXkdBks4IEviyw8xLDP6ioZp1s7i5/z4Q+ w==;
X-CSE-ConnectionGUID: 0PEdvW0/TzmOfZ/iiasjhQ==
X-CSE-MsgGUID: q2v30Df4S0aB3fxWMFWruA==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="68445961"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="68445961"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 00:38:15 -0700
X-CSE-ConnectionGUID: g7kz1p3qSs+ZIe0crtCYJg==
X-CSE-MsgGUID: KN50ffU3TaeQkyJmbLwTgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="152043684"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by orviesa002.jf.intel.com with ESMTP; 14 Mar 2025 00:38:13 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 oak.zeng@intel.com, Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC 02/29] drm/xe: Make xe_svm_alloc_vram public
Date: Fri, 14 Mar 2025 13:31:59 +0530
Message-Id: <20250314080226.2059819-3-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250314080226.2059819-1-himal.prasad.ghimiray@intel.com>
References: <20250314080226.2059819-1-himal.prasad.ghimiray@intel.com>
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

This function will be used in prefetch too, hence make it public.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c |  6 +++---
 drivers/gpu/drm/xe/xe_svm.h | 13 +++++++++++++
 2 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 516898e99b26..2d2b385b691e 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -655,9 +655,9 @@ static struct xe_vram_region *tile_to_vr(struct xe_tile *tile)
 	return &tile->mem.vram;
 }
 
-static int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
-			     struct xe_svm_range *range,
-			     const struct drm_gpusvm_ctx *ctx)
+int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
+		      struct xe_svm_range *range,
+		      const struct drm_gpusvm_ctx *ctx)
 {
 	struct mm_struct *mm = vm->svm.gpusvm.mm;
 	struct xe_vram_region *vr = tile_to_vr(tile);
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index e059590e5076..976059545173 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -72,6 +72,10 @@ bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end);
 int xe_svm_bo_evict(struct xe_bo *bo);
 
 void xe_svm_range_debug(struct xe_svm_range *range, const char *operation);
+
+int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
+		      struct xe_svm_range *range,
+		      const struct drm_gpusvm_ctx *ctx);
 #else
 static inline bool xe_svm_range_pages_valid(struct xe_svm_range *range)
 {
@@ -124,6 +128,15 @@ static inline
 void xe_svm_range_debug(struct xe_svm_range *range, const char *operation)
 {
 }
+
+static inline
+int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
+		      struct xe_svm_range *range,
+		      const struct drm_gpusvm_ctx *ctx)
+{
+	return 0;
+}
+
 #endif
 
 /**
-- 
2.34.1

