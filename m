Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 630DACD80A7
	for <intel-xe@archiver.kernel.org>; Tue, 10 Oct 2023 11:07:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C27E10E33B;
	Tue, 10 Oct 2023 11:07:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FB4110E337
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Oct 2023 11:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696936049; x=1728472049;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=2mBcrvDIXxMmOvdclN0i1rsH2cNJJc5FjqL4rfrpplU=;
 b=N/OFA23J4tqoDCWW6NmlGTAnHZIn53Wp6lX1m9umAJX120M6DbvhmKGL
 7Co2/SPGinLUEJANDXQV4s9czjWw9u4PRfiW7ijtB9yI4sXMc9LHQTnZz
 BDeHS6/AS9kKVH5RSYoZ8q1pm+prqTrybwVjNAUzIuVUlOrK0jxgmuSyw
 1oT86GFu/V+XQkJ/e8Svt7PVwylHt2zpNGWMIBemU6LKcse9iPGWcqqVA
 2i8YBQyMDxSBnA74S9JUsuMxBuTvL6/19e9hOLb16AcZAzgVcDf36Madd
 qRlve+1sbPkYYaApehzOr5V8A9H2iBhN1VwCO8JS0z7j6rYbMgfzu+gxz w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="387204045"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; d="scan'208";a="387204045"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2023 04:07:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="757074850"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; d="scan'208";a="757074850"
Received: from agargas-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.164])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2023 04:07:28 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 10 Oct 2023 13:07:10 +0200
Message-ID: <20231010110711.25616-10-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231010110711.25616-1-thomas.hellstrom@linux.intel.com>
References: <20231010110711.25616-1-thomas.hellstrom@linux.intel.com>
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
index f44677194cfb..4ebcf615bdc2 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1234,8 +1234,9 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
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

