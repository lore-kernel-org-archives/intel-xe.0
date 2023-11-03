Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0D7DC0018A
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 15:33:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1E7D10E16F;
	Fri,  3 Nov 2023 15:33:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35E6F10E170
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 15:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699025584; x=1730561584;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=CJaSm96C5vcNED0m+Q7pZeWWVwFRvGJGMAVo8YI/hmk=;
 b=KhmGgtBdWdRQ3ithrcDot/F3FdDDRvJF9wnmppAF/62kxDXchj6kZKC2
 w/GS7DNUGCfyvxafOnVbAIArDv6CLYWscJ0JrDsvSXCgHrMhGtzzVAGHd
 +4999JOEXFCw9WVjKopw6j6YPRyMRUwELGGPPzqd2nVcw/J5syojYG/TD
 XH/TmGPA6aEHyn/kvqCZIfORNuKeUyu3FYurtdeVpBe4c5xHPmBw6ikkC
 NLh1NlNGhzlSQqYwnyxi7ZlWlAqzq57COfFoQ/hI93YIJEKf8Hd7/a98p
 QKbcD05eQ/IbFxhFzF56O9rwwQyPW1MLz/avaAw2dz9ge9AtskqyFMCII A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="387853760"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="387853760"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 08:33:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="765272657"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="765272657"
Received: from shouweis-mobl1.ccr.corp.intel.com (HELO fedora..)
 ([10.249.254.68])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 08:33:03 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  3 Nov 2023 16:32:33 +0100
Message-ID: <20231103153234.30407-17-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231103153234.30407-1-thomas.hellstrom@linux.intel.com>
References: <20231103153234.30407-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI v8 17/18] drm/xe: Use DRM_GPUVM_RESV_PROTECTED for
 gpuvm
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
index 8239804baa0c..9742b929d168 100644
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
2.41.0

