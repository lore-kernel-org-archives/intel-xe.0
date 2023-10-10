Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A32A6CD80C2
	for <intel-xe@archiver.kernel.org>; Tue, 10 Oct 2023 12:49:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7022F10E33F;
	Tue, 10 Oct 2023 12:49:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4032610E344
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Oct 2023 12:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696942138; x=1728478138;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=kbrwbu8x/LBWFEtCNC7E9s3nq7vi8mFuoLXwFYgTzDg=;
 b=ObAq3uWGRn2rEhNjhTQhYK7vBDRUfmIu49sdhgEItp4sHVriZkOIu/D5
 aUw7b3ggglaW3AcsEbKJfqpJpfY2D3R1FPx97ekGENyo/YRymcSW9KmES
 1xlV6fZAyeE6YfXXxw7MkKOs1rrGfQtLa+UgR45N+45SzMr5359SR+RO1
 MDvgZr3DxQFoNHcWjmMIQYLNQz2HJiWiqyriObMNkBz2IYWYok4GzceX/
 crzM3Ao1hmGGPj0r4d8YvBOFRJpMVF4JiGR1w06gpyyDDebklUaZlZdRX
 WE3Hase7A0aKeh31p5ps+JZ3BTVdmIXrM3obSvJa6o1sc3NpWSzg8M+9k w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="374725049"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; d="scan'208";a="374725049"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2023 05:48:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="703302389"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; d="scan'208";a="703302389"
Received: from agargas-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.164])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2023 05:48:56 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 10 Oct 2023 14:48:37 +0200
Message-ID: <20231010124839.7948-9-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231010124839.7948-1-thomas.hellstrom@linux.intel.com>
References: <20231010124839.7948-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 09/11] drm/gpuvm: Local fixes
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

Fixes to v6 where we anticipate change.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/drm_gpuvm.c | 14 +++++++-------
 drivers/gpu/drm/xe/xe_vm.c  |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index c0d41ad236a5..e089d030d771 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -1068,8 +1068,10 @@ drm_gpuvm_prepare_objects_locked(struct drm_gpuvm *gpuvm,
 		if (ret)
 			break;
 
-		if (vm_bo->evicted)
+		if (vm_bo->evicted) {
 			drm_gpuvm_bo_list_add(vm_bo, evict, false);
+			vm_bo->evicted = false;
+		}
 	}
 
 	return ret;
@@ -1387,7 +1389,7 @@ drm_gpuvm_resv_add_fence(struct drm_gpuvm *gpuvm,
 		dma_resv_assert_held(obj->resv);
 		dma_resv_add_fence(obj->resv, fence,
 				   drm_gpuvm_is_extobj(gpuvm, obj) ?
-				   private_usage : extobj_usage);
+				   extobj_usage : private_usage);
 	}
 }
 EXPORT_SYMBOL_GPL(drm_gpuvm_resv_add_fence);
@@ -1626,11 +1628,9 @@ drm_gpuvm_bo_evict(struct drm_gpuvm_bo *vm_bo, bool evict)
 
 	dma_resv_assert_held(obj->resv);
 
-	if (drm_gpuvm_is_extobj(gpuvm, obj)) {
-		vm_bo->evicted = evict;
-
-		if (!lock)
-			return;
+	if (evict && !lock && drm_gpuvm_is_extobj(gpuvm, obj)) {
+		vm_bo->evicted = true;
+		return;
 	}
 
 	if (evict)
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index e22f1705b46c..2e07573055cb 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1235,7 +1235,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 		goto err_no_resv;
 	}
 
-	drm_gpuvm_init(&vm->gpuvm, vm_resv_obj, "Xe VM", 0, 0, vm->size,
+	drm_gpuvm_init(&vm->gpuvm, vm_resv_obj, "Xe VM", 0, vm->size,
 		       0, 0,
 		       &gpuvm_ops);
 
-- 
2.41.0

