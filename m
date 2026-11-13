Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3590606A330
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 19:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lwu7+fQu
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FFC110E831;
	Fri, 13 Nov 2026 19:52:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC68F10E775
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Nov 2026 19:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794599539; x=1826135539;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TY4pYcfU0pcYr9jPJKiqSXK5IOMZjgG+4Oe0ien2iyA=;
 b=lwu7+fQuGuMvKiQdZqGES4a4rsPgQMca3OizQM6nd9WQvMoHaW0jzQmF
 NmjuS28Abpz6QgT1fDQ3CvTHHyGVuSbfDTr9P4ZIjImC85bm3BXpwzHXi
 Q5hN63JNjpExdnLa/0t9xlHNv79nWxf0MWyNnpW9hkyeXmjdA4QWaafx7
 afzaCva/Xe4HG+NZvAC0e+MiSRmGE2HcEd78YsDOplBg8GgBPcIKiXb8v
 YDk7BCRg2ZvpxuJ+grLM/fvynPx4dSnWLO+mxVP8J4kA70LvQqwyh1zOd
 giUuTeArHcTgXj0Hcq2QLG6uHVfhtJIG7TobPHQQlJeGY8klf5qFGsVRV Q==;
X-CSE-ConnectionGUID: R54JuAhLRI+eHycvYmN4TQ==
X-CSE-MsgGUID: dJxmw8vWQGefAyhusmfPGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3423919"
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="3423919"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 11:52:19 -0800
X-CSE-ConnectionGUID: NgAOYa/yQ4e+gZen4jlVuQ==
X-CSE-MsgGUID: AwkxzhXfTJuaNFArTnz/YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="8812155"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 11:52:17 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: [PATCH v4 1/2] drm/gpusvm: Add a DMA-mapping accounting callback
Date: Fri, 13 Nov 2026 11:52:11 -0800
Message-Id: <20261113195212.2124791-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Drivers that use the GPU SVM core to DMA-map system memory for GPU
access may want to keep track of how many pages they have mapped, for
example to expose statistics or to detect leaks. Doing this accounting
in the driver around drm_gpusvm_get_pages() / drm_gpusvm_unmap_pages()
is error prone: the number, order and kind of the dma_addr[] entries can
change between map and unmap (migration, partial unmaps, the iova vs
non-iova paths), which makes symmetric accounting hard to get right.

Add an optional @dma_map_account callback to struct drm_gpusvm_ops and
invoke it once per &drm_pagemap_addr entry at the exact points where the
entry is DMA-mapped (sign == +1) in drm_gpusvm_get_pages() and unmapped
(sign == -1) in __drm_gpusvm_unmap_pages(). Since the map error path and
every unmap/free path funnel through __drm_gpusvm_unmap_pages() for the
entries that were actually mapped, the accounting is symmetric by
construction. The callback receives the full &drm_pagemap_addr so the
driver can use the order and the proto field to distinguish system
memory mappings from device interconnect mappings.

The callback must also be usable by the core drm_gpusvm_pages-only API
(mm == NULL), as used e.g. for userptr-style mappings. Relax
drm_gpusvm_init() to allow such users to pass a restricted @ops that
only implements the page-level hooks; the full-SVM hooks (@invalidate)
and the chunk configuration must still be unset in that mode.

Assisted-by: LLM
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

---
v3:
 - Check range_alloc/range_free (Niranjana)
---
 drivers/gpu/drm/drm_gpusvm.c | 41 ++++++++++++++++++++++++++++--------
 include/drm/drm_gpusvm.h     | 19 +++++++++++++++++
 2 files changed, 51 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index de2fa2684e84..92f46aad71f3 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -503,8 +503,16 @@ int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
 			return -EINVAL;
 		mmgrab(mm);
 	} else {
-		/* No full SVM mode, only core drm_gpusvm_pages API. */
-		if (ops || num_chunks || mm_range || notifier_size)
+		/*
+		 * No full SVM mode, only core drm_gpusvm_pages API. A
+		 * restricted @ops that only implements the page-level hooks
+		 * (e.g. @dma_map_account) is allowed; the full-SVM hooks must
+		 * not be set.
+		 */
+		if (num_chunks || mm_range || notifier_size)
+			return -EINVAL;
+		if (ops && (ops->invalidate || ops->range_alloc ||
+			    ops->range_free))
 			return -EINVAL;
 	}
 
@@ -1240,9 +1248,12 @@ static void __drm_gpusvm_unmap_pages(struct drm_gpusvm *gpusvm,
 		struct drm_gpusvm_pages_flags flags = {
 			.__flags = svm_pages->flags.__flags,
 		};
+		bool contiguous;
 		const struct drm_pagemap_addr *addrs =
-			drm_gpusvm_pages_first_dma(svm_pages, NULL);
+			drm_gpusvm_pages_first_dma(svm_pages, &contiguous);
 		bool use_iova = dma_use_iova(&svm_pages->state);
+		bool needs_account = gpusvm->ops &&
+			gpusvm->ops->dma_map_account;
 
 		/*
 		 * IOVA is reserved for the whole range but only the linked
@@ -1260,14 +1271,18 @@ static void __drm_gpusvm_unmap_pages(struct drm_gpusvm *gpusvm,
 
 		/*
 		 * With IOVA and no device page the unlink above tore every
-		 * entry down, and that is also when the range may be folded
-		 * to one entry, which must not be walked per entry. dpagemap
-		 * is set before the first device_map(), so it is also right
-		 * on the error path, where the flags are not published yet.
+		 * entry down, but the per-entry walk is still needed when the
+		 * driver accounts the mappings. A folded (inline) mapping has
+		 * a single entry describing the whole range, so it must be
+		 * re-read for every iteration instead of indexed by @j.
+		 * dpagemap is set before the first device_map(), so it is also
+		 * right on the error path, where the flags are not published
+		 * yet.
 		 */
 		for (i = 0, j = 0;
-		     (!use_iova || dpagemap) && i < npages; j++) {
-			const struct drm_pagemap_addr *addr = &addrs[j];
+		     (!use_iova || dpagemap || needs_account) && i < npages; j++) {
+			const struct drm_pagemap_addr *addr =
+				contiguous ? &addrs[0] : &addrs[j];
 
 			if (addr->proto == DRM_INTERCONNECT_SYSTEM) {
 				/*
@@ -1283,6 +1298,10 @@ static void __drm_gpusvm_unmap_pages(struct drm_gpusvm *gpusvm,
 			} else if (dpagemap && dpagemap->ops->device_unmap)
 				dpagemap->ops->device_unmap(dpagemap,
 							    dev, addr);
+
+			if (needs_account)
+				gpusvm->ops->dma_map_account(gpusvm, addr, -1);
+
 			i += 1 << addr->order;
 		}
 
@@ -1705,6 +1724,10 @@ static int drm_gpusvm_dma_map_pages(struct drm_gpusvm *gpusvm,
 				(addr, DRM_INTERCONNECT_SYSTEM, order,
 				 dma_dir);
 		}
+		if (gpusvm->ops && gpusvm->ops->dma_map_account)
+			gpusvm->ops->dma_map_account(gpusvm,
+						     &svm_pages->dma_addr[j],
+						     1);
 		i += 1 << order;
 		num_dma_mapped = i;
 		flags.has_dma_mapping = true;
diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
index b43432af5637..fb6c1fa78e2d 100644
--- a/include/drm/drm_gpusvm.h
+++ b/include/drm/drm_gpusvm.h
@@ -75,6 +75,25 @@ struct drm_gpusvm_ops {
 	void (*invalidate)(struct drm_gpusvm *gpusvm,
 			   struct drm_gpusvm_notifier *notifier,
 			   const struct mmu_notifier_range *mmu_range);
+
+	/**
+	 * @dma_map_account: Account a DMA-mapping change (optional)
+	 * @gpusvm: Pointer to the GPU SVM
+	 * @addr: The address descriptor of the chunk being (un)mapped
+	 * @sign: +1 when @addr has just been DMA-mapped, -1 when it is being
+	 *        unmapped
+	 *
+	 * Called once per &drm_pagemap_addr entry, when the entry is
+	 * DMA-mapped by drm_gpusvm_get_pages() (@sign == +1) and when it is
+	 * unmapped (@sign == -1), so the driver can keep symmetric accounting
+	 * of the pages it has mapped for GPU access. The @addr->proto field
+	 * can be used to distinguish system-memory mappings from device
+	 * interconnect mappings. May be provided in both full SVM mode and the
+	 * core drm_gpusvm_pages-only mode.
+	 */
+	void (*dma_map_account)(struct drm_gpusvm *gpusvm,
+				const struct drm_pagemap_addr *addr,
+				int sign);
 };
 
 /**
-- 
2.34.1

