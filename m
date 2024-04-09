Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64E9FCD129C
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 20:05:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E56F310E96D;
	Tue,  9 Apr 2024 20:05:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XgUaUvLb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BF74112F2C
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Apr 2024 20:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712693098; x=1744229098;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k0c1AmO1iGLyrh2xeo7Hf0ToaAChP3tw3m6rnS5HyYU=;
 b=XgUaUvLbAg48p4iogKhPOz8npexNOxJje/2hyPWkxNa+wC23MLv+HBJp
 LIPgaylHcmCMbaJRRcsFbiN8tnvguWG9taw1Za7LJzvUFA4DwkQ1bEYvQ
 dY5HcZfNO//VNEjtJ+barSFiDbt7yzmB6BUggkKScyZwNkkt+o36TMtYh
 61f8uA3IEk+Reh3hBU9D0u/6NtokVHrSSbdGwzlov7vX0DB1TSGcLXGM6
 BLom+dgKKytFVGLvUDpv0nepKxOo1zrU43s08vlsd1slP65qbXr6efPu0
 VuwthXrYcIx4L8N4qrDVh/UpqNcgP2NRfA9wNHWYv/xlzFVuGY6BgifFt w==;
X-CSE-ConnectionGUID: hjgMhgrUQ7mh5ga+JFsXww==
X-CSE-MsgGUID: mj4lne+cSEa9aqzkoXkWOQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11803771"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="11803771"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 13:04:54 -0700
X-CSE-ConnectionGUID: p8gum6FORTev8QIO/js8Mw==
X-CSE-MsgGUID: B59OQATeRUi0DO+GmCHw+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20773799"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 13:04:53 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, krishnaiah.bommu@intel.com,
 matthew.brost@intel.com, Thomas.Hellstrom@linux.intel.com,
 brian.welty@intel.com
Subject: [v2 29/31] drm/xe/svm: trace svm migration
Date: Tue,  9 Apr 2024 16:17:40 -0400
Message-Id: <20240409201742.3042626-30-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240409201742.3042626-1-oak.zeng@intel.com>
References: <20240409201742.3042626-1-oak.zeng@intel.com>
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

Add two trace points to trace svm migrations.

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/xe_svm_migrate.c |  5 ++++-
 drivers/gpu/drm/xe/xe_trace.h       | 11 +++++++++++
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_svm_migrate.c b/drivers/gpu/drm/xe/xe_svm_migrate.c
index ab8dd1f58aa4..69096d81bf02 100644
--- a/drivers/gpu/drm/xe/xe_svm_migrate.c
+++ b/drivers/gpu/drm/xe/xe_svm_migrate.c
@@ -211,8 +211,10 @@ vm_fault_t xe_svm_migrate_to_sram(struct vm_fault *vmf)
 	xe_svm_for_each_vm(svm, vm) {
 		xe_assert(xe, vm->mm == mm);
 		xe_vma = xe_vm_lookup_vma(vm, vmf->address);
-		if (xe_vma)
+		if (xe_vma) {
+			trace_xe_svm_migrate_to_sram(xe_vma);
 			xe_vm_invalidate_vma(xe_vma);
+		}
 	}
 	migrate_vma_pages(&migrate_vma);
 	migrate_vma_finalize(&migrate_vma);
@@ -328,6 +330,7 @@ int xe_svm_migrate_vma_to_vram(struct xe_vm *vm,
 
 	migrate_vma_pages(&migrate);
 	migrate_vma_finalize(&migrate);
+	trace_xe_svm_migrate_to_vram(vma);
 free_dst_pages:
 	if (ret)
 		xe_devm_free_blocks(&blocks);
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index f3fcce9f1434..12e0c9856540 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -480,6 +480,17 @@ DEFINE_EVENT(xe_vma, xe_vma_userptr_invalidate_complete,
 	     TP_ARGS(vma)
 );
 
+DEFINE_EVENT(xe_vma, xe_svm_migrate_to_sram,
+		    TP_PROTO(struct xe_vma *vma),
+		    TP_ARGS(vma)
+);
+
+
+DEFINE_EVENT(xe_vma, xe_svm_migrate_to_vram,
+		    TP_PROTO(struct xe_vma *vma),
+		    TP_ARGS(vma)
+);
+
 DECLARE_EVENT_CLASS(xe_vm,
 		    TP_PROTO(struct xe_vm *vm),
 		    TP_ARGS(vm),
-- 
2.26.3

