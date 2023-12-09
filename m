Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E216C4167B
	for <intel-xe@archiver.kernel.org>; Sat,  9 Dec 2023 14:49:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6004910E19C;
	Sat,  9 Dec 2023 14:49:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A73FD10E19C
 for <intel-xe@lists.freedesktop.org>; Sat,  9 Dec 2023 14:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702133383; x=1733669383;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XpNKEe2W75j+XQk/YGpHL5nHScGiAKjFxyo86x/mHw8=;
 b=dD6DvbLINxM5xoX5vxHuUmjPqWhdRqBytpnDE+W0Ypo5U2UmcFe+vTWD
 SaDiENQnLucK+ge6y4h8rXBFju+Ip8HJIa/BqrIziMzAkZpgE2y0rPTSN
 vHGMrY2OLLwZyEE6ry06L5F56er9JOPD3dV4+Y3B0FhAAoZUwDh16T9WK
 ZYT/6sWTGdUqtQlqW5tltYT8SzcIBKvCwzW7i7JLy+sEViEjhhxjc5zGO
 ZjZ9iCbYDjdylmCwRKPa6a3BkdrSUqM/p0oqZ0xlb8Rg+XCbgRIjCk0t5
 8Hupgi1ggoqheNeVirhMyRgfNNpmuX3ZlZjORWnRaR5oCNmFoqEv7RpDx w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="7838170"
X-IronPort-AV: E=Sophos;i="6.04,263,1695711600"; 
   d="scan'208";a="7838170"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2023 06:49:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="748661381"
X-IronPort-AV: E=Sophos;i="6.04,263,1695711600"; d="scan'208";a="748661381"
Received: from pplotits-mobl2.ccr.corp.intel.com (HELO fedora..)
 ([10.249.254.23])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2023 06:49:40 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/2] drm/xe: Use DRM_GPUVM_RESV_PROTECTED for gpuvm
Date: Sat,  9 Dec 2023 15:49:17 +0100
Message-ID: <20231209144917.4459-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231209144917.4459-1-thomas.hellstrom@linux.intel.com>
References: <20231209144917.4459-1-thomas.hellstrom@linux.intel.com>
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

Use DRM_GPUVM_RESV_PROTECTED to use corse-grained locking for the
evict and external object list.
Since we are already holding the relevant RESV locks, for now at least,
we don't need the fine-grained locking.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 2c35395ff5d4..c0fcb49e9137 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1231,8 +1231,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 		goto err_no_resv;
 	}
 
-	drm_gpuvm_init(&vm->gpuvm, "Xe VM", 0, &xe->drm, vm_resv_obj,
-		       0, vm->size, 0, 0, &gpuvm_ops);
+	drm_gpuvm_init(&vm->gpuvm, "Xe VM", DRM_GPUVM_RESV_PROTECTED, &xe->drm,
+		       vm_resv_obj, 0, vm->size, 0, 0, &gpuvm_ops);
 
 	drm_gem_object_put(vm_resv_obj);
 
-- 
2.42.0

