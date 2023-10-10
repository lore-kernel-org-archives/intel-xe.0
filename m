Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AC90CD80C1
	for <intel-xe@archiver.kernel.org>; Tue, 10 Oct 2023 12:49:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F399110E1ED;
	Tue, 10 Oct 2023 12:49:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E236510E344
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Oct 2023 12:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696942138; x=1728478138;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=rlNrKxUJPOrAUw6WzG6DNjX8uifUP0sFi9cK5+oaJf8=;
 b=J8bjwbpwOZXzPTcGkfkn/Eb3tm7P8cxrjAYFk+VlzIph3mynSl/0vjbn
 7nAJS54BALNvO8tBH5MzRGMuQR7PCbRmWF9qu2uo2dKw7fWevRS3WT14i
 +aFI8rr1aeKsJqSNswOGP/Kz2eNCfyLhQ1kXAofqQGnzgSxERTemkNS3B
 6ztWKAz8pxEUh3qdkdBZufBo4xCB/WX6rr1+3b06YhbYp0nzNGCOs10wy
 TUTUDIF5jMP+po39jSpB0WyXjNy6y+Q+MZpZlFcSpLtWIHlkYU8Vc+oYj
 qaZvoZgIGGRE+xY538Vq7HBcFWULmqSTXP/cKsGABFHzI2/1hs8MmLiaM g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="374725051"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; d="scan'208";a="374725051"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2023 05:48:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="703302393"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; d="scan'208";a="703302393"
Received: from agargas-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.164])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2023 05:48:58 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 10 Oct 2023 14:48:38 +0200
Message-ID: <20231010124839.7948-10-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231010124839.7948-1-thomas.hellstrom@linux.intel.com>
References: <20231010124839.7948-1-thomas.hellstrom@linux.intel.com>
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
 drivers/gpu/drm/xe/xe_vm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 2e07573055cb..ed400de51529 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1235,8 +1235,9 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 		goto err_no_resv;
 	}
 
-	drm_gpuvm_init(&vm->gpuvm, vm_resv_obj, "Xe VM", 0, vm->size,
-		       0, 0,
+	drm_gpuvm_init(&vm->gpuvm, vm_resv_obj, "Xe VM",
+		       DRM_GPUVM_RESV_PROTECTED,
+		       0, vm->size, 0, 0,
 		       &gpuvm_ops);
 
 	drm_gem_object_put(vm_resv_obj);
-- 
2.41.0

