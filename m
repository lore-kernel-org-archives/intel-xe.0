Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F62C28B2F
	for <intel-xe@archiver.kernel.org>; Fri, 14 Mar 2025 07:38:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71EE410E983;
	Fri, 14 Mar 2025 07:38:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K4cNSaDm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 544E910E983
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Mar 2025 07:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741937922; x=1773473922;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CGQGjFwx3No26VTpSAcjN3/Kr4WoFz7TF305r8NhJ6I=;
 b=K4cNSaDm34TN8zrbGZT2GoU1tw+QBBSttiiA5QzTvxbaIXEGIOpR4K3P
 blAhMDVlGCVN3KxCe4UI1xMGaYWbB+AOfdV/s32qPJFjC7mYuHnZj6PCF
 tDGH9zqj9a/sgvbGM0JyjXZ+zpYH5vPJz97BaTnOjJOxW6R2zHaInjwTx
 6UFaI1i+6TwNkfph6YfU8XD5Np3a5cXFtKH32Io3/+VKKeqiXyzqKi53u
 VR4joaW3qsz8ff3GOT/QJcMZubEy0BPPRztKFdwxgyOuL4kyJrIXeijh0
 ekEk/ZI/soWYP8mP9Xje9fQsNlUE/lJdOe70cmS6AotVYJf0Uu74akVIP Q==;
X-CSE-ConnectionGUID: 3ZnSF87+TjiaZ3hH2FRNsQ==
X-CSE-MsgGUID: XHGjDfMCSdqIYMSP5NlYqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="68446029"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="68446029"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 00:38:41 -0700
X-CSE-ConnectionGUID: bsz0CPOuQLu8ezw6u0cPWQ==
X-CSE-MsgGUID: Cmf8OGnjSEie3rnC0ZBmUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="152043806"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by orviesa002.jf.intel.com with ESMTP; 14 Mar 2025 00:38:39 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 oak.zeng@intel.com, Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC 15/29] drm/xe/vm: Add attributes struct as member of vma
Date: Fri, 14 Mar 2025 13:32:12 +0530
Message-Id: <20250314080226.2059819-16-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250314080226.2059819-1-himal.prasad.ghimiray@intel.com>
References: <20250314080226.2059819-1-himal.prasad.ghimiray@intel.com>
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
index f63dd4eb1ae8..369a9527af79 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2440,6 +2440,12 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
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
index 0b02a37bd2f3..b69dfe1646ed 100644
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

