Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38DF2C3601A
	for <intel-xe@archiver.kernel.org>; Mon,  7 Apr 2025 09:53:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFA9E10E3FF;
	Mon,  7 Apr 2025 09:53:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dGHLR548";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3953A10E3FF
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Apr 2025 09:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744019596; x=1775555596;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VkbF20hGbPKn4tvS975w+yZD2IWGxMoMi/IvqGdPOys=;
 b=dGHLR5486V5aSq6GNnzykMmpVWUlkuFVIElPTh9WYqi4RzuVgVcBxWWT
 fT7g8EdsylVRVMfgoGu5dQQjwW6I2KmBT7m/7CsunDttkHYKCoxOChE5d
 +skAPWetWcxOBxwW2eKDldg5f9nzSSXchTucEYY7h+So75Q6pu7mCL7jg
 6x/j6X+pHJ/o1/HTLHMNCNPR7IYC1K96T8lk7kgwMZaMuw0yOxu94Lprc
 oaZgmoFPggC5v/vHQGcPLZ1Qd/X3Txe2R6eQzdclQydnGCrIxaAwC0e+u
 kf6tuEgwfxekpMjOEUMQ8iCiR1CliX24/fG+fIy1ZwAoifcq2vQau7dTK A==;
X-CSE-ConnectionGUID: 0HFdLUy3T0+YfezDdZ6B+w==
X-CSE-MsgGUID: ZKNAhoHVSAmlOPD6CCtELg==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="56029430"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="56029430"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 02:53:16 -0700
X-CSE-ConnectionGUID: 9rTDwMp9Qq6/KA+8IkULWQ==
X-CSE-MsgGUID: IMZy6H4rShKhWc/RcaZsRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="128778798"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa009.fm.intel.com with ESMTP; 07 Apr 2025 02:53:14 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v2 18/32] drm/xe/vm: Add attributes struct as member of vma
Date: Mon,  7 Apr 2025 15:47:05 +0530
Message-Id: <20250407101719.3350996-19-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
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

The attribute of xe_vma will determine the migration policy and the
encoding of the page table entries (PTEs) for that vma.
This attribute helps manage how memory pages are moved and how their
addresses are translated. It will be used by madvise to set the
behavior of the vma.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       |  6 ++++++
 drivers/gpu/drm/xe/xe_vm_types.h | 20 ++++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 27a8dbe709c2..1ff9e477e061 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2470,6 +2470,12 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
 		vma = ERR_PTR(err);
 	}
 
+	/*TODO: assign devmem_fd of local vram once multi device
+	 * support is added.
+	 */
+	vma->attr.preferred_loc.devmem_fd = 1;
+	vma->attr.atomic_access = DRM_XE_VMA_ATOMIC_UNDEFINED;
+
 	return vma;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index d3c1209348e9..5f5feffecb82 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -77,6 +77,19 @@ struct xe_userptr {
 #endif
 };
 
+/**
+ * struct xe_vma_mem_attr - memory attributes associated with vma
+ */
+struct xe_vma_mem_attr {
+	/** @preferred_loc: perferred memory_location*/
+	struct {
+		u32 migration_policy; /* represents migration policies */
+		u32 devmem_fd; /* devmem_fd used for determining pagemap_fd requested by user */
+	} preferred_loc;
+	/** @atomic_access: The atomic access type for the vma */
+	u32 atomic_access;
+};
+
 struct xe_vma {
 	/** @gpuva: Base GPUVA object */
 	struct drm_gpuva gpuva;
@@ -128,6 +141,13 @@ struct xe_vma {
 	 * Needs to be signalled before UNMAP can be processed.
 	 */
 	struct xe_user_fence *ufence;
+
+	/**
+	 * @attr: The attributes of vma which determines the migration policy
+	 * and encoding of the PTEs for this vma.
+	 */
+	struct xe_vma_mem_attr attr;
+
 };
 
 /**
-- 
2.34.1

