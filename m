Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCBD606A31E
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 04:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ep74TgXO
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2E9910EC4B;
	Wed, 21 Oct 2026 04:14:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3EE010EC3A
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Oct 2026 04:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792556034; x=1824092034;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uQMQjErGN4Nz/TxgPPkK2TY06ZYNnbmZmvySVYU9oTQ=;
 b=Ep74TgXO3GXl/q0qyBdkNqG3fDqIsTQeDjnBatUNc/2MKr7BfNgZBkqA
 lCEDqkzk/6hW8dhA377Nw8aewFwTDC8kaNZt2LkibU3uWo0ctOGnvyQM2
 gloaM1qLMBvpyJtMsx7F23hWYaUuYDxEMjxaEeRR9wuitZFi4FxslNEqa
 mqxKT8fTTJ2yEcTdF6rD4Smm4Kr0PoJXJNAQ8f6UUqKDddKtA+dm4l+2G
 b5kFvX/6Y39INTQ6tJajALBILEYmx4wR4hvntHjDhK15LZOoyk4yRLORQ
 9ddqLDPrKK1p52x8YSJMYhEbd6pDlw1jXMSZ3sptKaVfmPgBOdLkZZ30C Q==;
X-CSE-ConnectionGUID: WithjCTpRZWmBNqULhiE3Q==
X-CSE-MsgGUID: FsF6jE7eTOOoPQne7SHfhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1264315"
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="1264315"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 21:13:52 -0700
X-CSE-ConnectionGUID: zbg4jW34SQKDYZaX2vMrsg==
X-CSE-MsgGUID: Tde9ENQLTg2WQdgtdGSAkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="2868694"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by orviesa008.jf.intel.com with ESMTP; 20 Oct 2026 21:13:51 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
 Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH 3/6] drm/xe/vm: add helper to retrieve VM SVA PASID
Date: Wed, 21 Oct 2026 09:41:14 +0530
Message-ID: <20261021041117.1774877-4-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021041117.1774877-1-naresh.kumar.g@intel.com>
References: <20261021041117.1774877-1-naresh.kumar.g@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add xe_vm_get_sva_pasid() to return the PASID associated with a VM SVA
binding.

The helper checks whether the VM has a valid SVA handle and, if so,
returns the PASID obtained from iommu_sva_get_pasid(). If no SVA handle
is present, return -EINVAL.

Export the helper in xe_vm.h so other XE components can query the VM's
PASID when programming per-context state.

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 16 ++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h |  2 ++
 2 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index b1d37e5a673f..dcaeeeb94721 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1649,6 +1649,22 @@ static void xe_vm_init_prove_locking(struct xe_device *xe, struct xe_vm *vm)
 	up_read(&vm->exec_queues.lock);
 }
 
+/**
+ * xe_vm_get_sva_pasid() - get sva pasid for the vm if allocated
+ * @vm: The vm to get valid sva_handle
+ *
+ * Helper to get associated pasid for the vm which uses svm.
+ *
+ * Return: %pasid value on Success. -EINVAL if not pasid available.
+ */
+int xe_vm_get_sva_pasid(struct xe_vm *vm)
+{
+	if (!vm || !vm->sva_handle)
+		return -EINVAL;
+
+	return iommu_sva_get_pasid(vm->sva_handle);
+}
+
 static void xe_vm_sva_handle_init(struct xe_vm *vm)
 {
 	struct device *dev = vm->xe->drm.dev;
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 89c4f95984a2..fe10fd91cdfa 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -290,6 +290,8 @@ struct dma_fence *xe_vm_bind_kernel_bo(struct xe_vm *vm, struct xe_bo *bo,
 
 void xe_vm_resume_rebind_worker(struct xe_vm *vm);
 
+int xe_vm_get_sva_pasid(struct xe_vm *vm);
+
 /**
  * xe_vm_resv() - Return's the vm's reservation object
  * @vm: The vm
-- 
2.43.0

