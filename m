Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 495F5C00142
	for <intel-xe@archiver.kernel.org>; Tue, 31 Oct 2023 14:22:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D54410E506;
	Tue, 31 Oct 2023 14:22:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A35BD10E4FF
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Oct 2023 14:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698762113; x=1730298113;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=U5faFsLt81/HBM/bO3T+qtxJdyRnnAkOkAi6YGNcRoU=;
 b=eyfPlyE5TNGHNTEA2l/vYNRSB2TgSSXt3fNSOKMQzI38HklI2jpQyc69
 9b4rRHjt7XIYUYOLuQXpz0GJ9+8pxDjtEhCEIJ/qFbd7bvor5TdjTNmhp
 lQew0km5InJBux5fNAHnRGuy4EJU61h9E7X6ZRCVq9xQx1mCTGMznN+sO
 E7Dc5IlXtHahUtfRvp7i8VZM9iruAeFGLlZL8SUjXHn2EdCOQjQaWzueQ
 /dsu6yUQl1XzKzlDgmbnzWiL0PgifQUTG8vee/tzlkHLepgCcK+OJbWdJ
 j4qpEGAl1OcAMABW50jpQvW4idAcFEs16Q6uQeeC+CJwksjcuNESkDgrF g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="387183166"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; d="scan'208";a="387183166"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 07:21:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="934126093"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; d="scan'208";a="934126093"
Received: from olindum-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.59])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 07:21:52 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 31 Oct 2023 15:21:32 +0100
Message-ID: <20231031142133.17129-10-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231031142133.17129-1-thomas.hellstrom@linux.intel.com>
References: <20231031142133.17129-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 10/11] drm/xe: Use DRM_GPUVM_RESV_PROTECTED for gpuvm
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
index 5f3bdb4e48ad..6bd1f4ac462a 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1229,8 +1229,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 		goto err_no_resv;
 	}
 
-	drm_gpuvm_init(&vm->gpuvm, "Xe VM", 0, &xe->drm, vm_resv_obj,
-		       0, vm->size, 0, 0, &gpuvm_ops);
+	drm_gpuvm_init(&vm->gpuvm, "Xe VM", DRM_GPUVM_RESV_PROTECTED, &xe->drm,
+		       vm_resv_obj, 0, vm->size, 0, 0, &gpuvm_ops);
 
 	drm_gem_object_put(vm_resv_obj);
 
-- 
2.41.0

