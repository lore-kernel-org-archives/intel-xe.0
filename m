Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF9EFC4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 08:17:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3085310E828;
	Thu,  7 Dec 2023 08:17:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5919A10E81A
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 08:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701937035; x=1733473035;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=NF6brB6BSu7XN9hEb2/sTT5DXnoD/s+H6lzeSktJ4dk=;
 b=SSB5ezW1NcAqVpGvZTKFyYTjhsiYDpKP+DKvXUd42KGmMxLMKLAFRooH
 vPt+ef31WZmYXhgEoSh1QaNlP1wfTnKaqMcQ9RhtIF6sICQxn2N/+0bjB
 4rN/zOLnB81HUHE1zU87R1KXSFwhVL/URzMQ4LzUHJWaV7i2T/oOskEbh
 DltDRnzwVAnSf5ilrY5a8MeoCc52WI59vteMdiR3Q1eX1Mk3dcy1jR/sY
 +DOqdi2VWFHrov/MgCPQERx0/JBWw9fWuQCpicYA4WokKhcspHjNB2TIO
 MXBLC+9aSNFEQFKTbNE94mFKSeWddXb/A8XJ2YyXIUjDAqYSiPAsTWEJV A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="398079439"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="398079439"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 00:17:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="17413371"
Received: from jpoulsen-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.234])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 00:17:14 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  7 Dec 2023 09:16:51 +0100
Message-ID: <20231207081652.17431-16-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231207081652.17431-1-thomas.hellstrom@linux.intel.com>
References: <20231207081652.17431-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 16/16] drm/xe: Use DRM_GPUVM_RESV_PROTECTED for gpuvm
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

