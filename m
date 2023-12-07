Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1723EC10F05
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 14:12:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3BA410E8C1;
	Thu,  7 Dec 2023 14:12:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F97310E8C0
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 14:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701958344; x=1733494344;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=NF6brB6BSu7XN9hEb2/sTT5DXnoD/s+H6lzeSktJ4dk=;
 b=iFntzPwD7HmwLPYg7WmMPgexCExBqDyCiy8plF0zeyZP0fNpgJoWcWda
 iy3tr6Op9jK7plHzpARsf0lY6/8zTyXXbl3QcLn+niiRUcTb+hbrGfbG5
 9BnN/uix37LuU03ZEkwNWM+SedqXDFWly4JOGkWWGLACCCc4sQPlf3PCx
 0AjxB5Znvtq/zin6sXY68jnWj7zJ11QmkK8U9E/zDTunK5DhZJAbaxYXh
 fyeY0dd+GDf8zsYXXRZ554Qg+ag/0DcuLB+rnTuStPfX1a6DNF07gjwTZ
 UKyGhglov70ncsadmqZyL/vWpUkiPRxSib7ns4N2e7qpgbqlNa2ACLybf Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="12947584"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="12947584"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 06:12:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="721479794"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="721479794"
Received: from jpoulsen-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.234])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 06:12:22 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 16/16] drm/xe: Use DRM_GPUVM_RESV_PROTECTED for gpuvm
Date: Thu,  7 Dec 2023 15:11:56 +0100
Message-ID: <20231207141157.26014-17-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231207141157.26014-1-thomas.hellstrom@linux.intel.com>
References: <20231207141157.26014-1-thomas.hellstrom@linux.intel.com>
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

Use DRM_GPUVM_RESV_PROTECTED to relax locking.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index f71285e8ef10..41c98d2032cf 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1399,8 +1399,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 		goto err_no_resv;
 	}
 
-	drm_gpuvm_init(&vm->gpuvm, "Xe VM", 0, &xe->drm, vm_resv_obj,
-		       0, vm->size, 0, 0, &gpuvm_ops);
+	drm_gpuvm_init(&vm->gpuvm, "Xe VM", DRM_GPUVM_RESV_PROTECTED, &xe->drm,
+		       vm_resv_obj, 0, vm->size, 0, 0, &gpuvm_ops);
 
 	drm_gem_object_put(vm_resv_obj);
 
-- 
2.42.0

