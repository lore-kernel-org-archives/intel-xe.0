Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D3BFE95A8E
	for <intel-xe@archiver.kernel.org>; Mon,  9 Oct 2023 13:14:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4D1410E112;
	Mon,  9 Oct 2023 13:14:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0887710E112
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Oct 2023 13:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696857266; x=1728393266;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=zPv1E3DQLRIbCxrVu9FB7DMDyBBGFuXwxa+Z0Y+xiE0=;
 b=irr8t6mGpgbSwfCqdOr3K4MiCOHkeZsSkWBq4MdjW46HRMWd8v6WvptX
 rS0AzwqHuhtAuZtRPvmp8XvUCBcFBq78PQsI+AK1EHvSv6iIMS2OE287y
 VrukzOQJMs7g4TeaJksRYBM32uK02qh8iY9AnyKyfZcONPs1doj+OZ5cy
 H3z59jMXUwc76AtLHIpi5WwrPmIIy4GG4jc1MNFliz4roX3eadYVW+kv9
 KowpL2ZNf1gtwJAeKIHMqukdg+2IUWbGZtXREWHJVsmHED+XBipUPkm4t
 0/GP2W0hwmN5lICID67ZD96jxsSCYjE8I3R0wSTjdEAxYtyQJhrbpFvj+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="415129019"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; d="scan'208";a="415129019"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 06:14:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="843695818"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; d="scan'208";a="843695818"
Received: from sorenthe-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.151])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 06:14:07 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  9 Oct 2023 15:13:39 +0200
Message-ID: <20231009131341.18355-9-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231009131341.18355-1-thomas.hellstrom@linux.intel.com>
References: <20231009131341.18355-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 09/10] drm/xe: Use the evicted flag and
 RESV_PROTECTED vm.
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

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/drm_gpuvm.c | 12 ++++++------
 drivers/gpu/drm/xe/xe_vm.c  |  5 +++--
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index c0d41ad236a5..2deeeb5d8577 100644
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
index 3da97442d415..aba299216c55 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1235,8 +1235,9 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 		goto err_no_resv;
 	}
 
-	drm_gpuvm_init(&vm->gpuvm, vm_resv_obj, "Xe VM", 0, 0, vm->size,
-		       0, 0,
+	drm_gpuvm_init(&vm->gpuvm, vm_resv_obj, "Xe VM",
+		       DRM_GPUVM_RESV_PROTECTED,
+		       0, vm->size, 0, 0,
 		       &gpuvm_ops);
 
 	drm_gem_object_put(vm_resv_obj);
-- 
2.41.0

