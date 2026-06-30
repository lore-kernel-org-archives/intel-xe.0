Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B4DBC43327
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jun 2026 07:41:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 359C010EB51;
	Tue, 30 Jun 2026 07:41:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="B2buPkt+";
	dkim-atps=neutral
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011019.outbound.protection.outlook.com [52.101.62.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4085A10EB50
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jun 2026 07:41:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hz50NxIvcgrXSBy3x5F79c+UUmIcXSMlrCPwwsZxSPzB0Y/j2UrpxVCBF90np5fZukxPq0itu8SIYAJl8/FaW9Pwgu0jFpci59V5kiJNWkep2rdQ/wgywPKXEs4TKoO/bT0IhoGCJJqAxYF2b5Pbgqfo2jRlNjUPRWzfV7PmytvrztgL+lIGKY76OndNuFPpJSK5z6SLzdAHtqEXllV37U8ftwVYIB3M33EyflY78hDpkiB2H+yj5wja8lQ3eS0Dyd26X6n3S7vrM/pgb6usphMv782eWAA2Kt0Uoq+2fnD8c8CXtK7h9j7ffAbxpBidrtoO3kcvHds1Fm3TBEbjOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ggE9H/Uyq5+gf4+3TjfgZZUzYZ/haBxGiNSBwiYNks=;
 b=WIRS+MCvBGr+YPlhoWFyQd+hm+dVqN9KUvBmjNjI+toasOjU8I79/NZhMGnK22vjFLoUHniS4e4YIu6WUaEBpa5x4OQi78Ikuxdg2HXh2vYwoTSEyrgRRYoOYcngE4zeoUCuTxJ5DROzktwVNP4m+Z65fGIxCpBtYpqKs3UVd67K8ZL1HJuqv17CqyrXdiTg7Ij+lm8jcNjP2UXGmft3VK7YyskVd0+h+uQpz2jt5zV7VA0ZGTP8lw+BLn0Gjbkn60dF9nxaG5zQZE4C8i6WMh+IEzxWs8R2/Sv5TpiMwDQe9UhaIt/IYNxP0hqOQJYvwIqfs2OQQW5XdIteWbIbkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ggE9H/Uyq5+gf4+3TjfgZZUzYZ/haBxGiNSBwiYNks=;
 b=B2buPkt+Pukw2gURA6qUoruBsXgCmO0bqmp21hx/o1aBfKQsYr/O5jjXVHNbl4V8B/NotFfxpt09qyBwh9a8iPkYuTgtNa+svpDqPWhNbLFTvocS3jb15jSHenDdIJ9Z0h8pYeJBaxG2L1IBDs6QIGZuie7S9dg7I6cofwQosHo=
Received: from SA0PR11CA0163.namprd11.prod.outlook.com (2603:10b6:806:1bb::18)
 by IA1PR12MB7520.namprd12.prod.outlook.com (2603:10b6:208:42f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 07:41:06 +0000
Received: from SN1PEPF000252A1.namprd05.prod.outlook.com
 (2603:10b6:806:1bb:cafe::12) by SA0PR11CA0163.outlook.office365.com
 (2603:10b6:806:1bb::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Tue,
 30 Jun 2026 07:41:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SN1PEPF000252A1.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 07:41:06 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 30 Jun
 2026 02:41:03 -0500
Received: from honglei-remote.amd.com (10.180.168.240) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 30 Jun
 2026 00:35:08 -0700
From: Honglei Huang <honghuan@amd.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH v9 4/5] drm/gpusvm: move struct drm_gpusvm_pages out of struct
 drm_gpusvm_range
Date: Tue, 30 Jun 2026 15:34:51 +0800
Message-ID: <20260630073452.379071-5-honghuan@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260630073452.379071-1-honghuan@amd.com>
References: <20260630073452.379071-1-honghuan@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A1:EE_|IA1PR12MB7520:EE_
X-MS-Office365-Filtering-Correlation-Id: 868b433c-8fe8-48ca-f176-08ded67af1b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|23010399003|1800799024|82310400026|376014|18002099003|11063799006|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info: ZVayqAil4wqHAyKsywiq5NEMcT39ifPhTqFS8xT07qm76ZlknLmHa5hpFSE9Uh+H0BjlbvDo2I0uNYEPpQN2OOQBNanG7CvE9rXbP2jjzVMsjYVmn1LCxlye3xIBeQsfqv2b/epdQp/p8QEeyazAmbC2J+oPuBCG9kXCUhZUqdiD6U6L2qgYA7uflOUHbKWpOMCj/hxgQpUOHotkgqjZvUAEaPFeurHyOd74a1a3BJv22Th8U6vzo8rNvNzemyKSCog/xjFki47YRib185SDRQE1JOwr7+dT4PP6Z0zsgpEuH1D47wSNImY5VtEfYFGUb7iVNCBwYWEudugb7mVU1kYKX0935N+Z4vQKmbf5Fvs1+w8Dr8vBhuAV/dJrq2VoqMW1oER/kA3shztFVNI0STNOuj/6w+JodcDqYhG3THLCOMtvATEcLB7HlC7j4LiEjIbDGDkCrUBytj477KXxjclbeWZPPegf2Pi09p5NafJEsqwiU+0iKyhfD4W3HX12/+XiFX0P8KLZRutLv1BP8B4XSBBFbmrDEO4Z4h1SYkqEeCi+2iSNjeso5GztlkrO+jHPpaL2W4wHMH3TMkEpweAfditDkHyHXuJEYvhirKZPAnj3ztSxEfmSXLtekZ7uq1oBFUW9x6kWep/NlZrQG8qu8yr9QCqi+U+gqIhaP4KwaL4XkvTP5nV5MHm1oT6OcbqCXutUGMSsDXCfhbthYQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(23010399003)(1800799024)(82310400026)(376014)(18002099003)(11063799006)(56012099006)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 0Z9jFnT5jpq/n2DWv2f2jEtix3CPnfyzmtF4qL06YDy75767zZiAxcXmEDEe2tFF5vpRQYpgaJxlczCtkCnQTEHSRPr/hq3qior/YiZX3+FenVPq2ZPZLWNnTZjs8grir2mKN5QJRQopnbwDFqFk7dZ4KgF+XKXYz75odbm6o532TZQhOnqLfe+Se2IHyvYpf7v0XsFKqy8uteswp0VFpsSlMzFDET4enACMLiOdwDmOw+vzam7oSGLib3yuYBge1alf4UiXvs1Snygl0HKLcPQrwzkY11XGkeUbtunubsJboNMEq/qFaW2yLDfCnuX+GimxZpcvjuNNRfB0/mSRreDHME3nzR7e6FQ7pijUL5bqkZXt+lGIOQk9e3TO8tFEKowjYGivMi7RnniGWtZEkZyksQaxRmgASvRbjOOnnb8yK6oHN8zuUXT/QO4KCCeT
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 07:41:06.2303 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 868b433c-8fe8-48ca-f176-08ded67af1b3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7520
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

Since the pages the physical pages and MM VA range has been abstractly
separated. Unbinding a single form of physical page from the MM VA
range, brings flexibility to the drm gpu SVM framework, transfer the
way of management of MM and device physical pages to the driver layer.

framework's range embedded pages object and its range level wrappers
have no users left. Remove the following:

  - Drop pages in drm_gpusvm_range.
  - Drop drm_gpusvm_range_pages_valid(), drm_gpusvm_range_get_pages()
    and drm_gpusvm_range_unmap_pages(); drivers should use the
    drm_gpusvm_pages helpers (drm_gpusvm_pages_valid,
    drm_gpusvm_get_pages, drm_gpusvm_unmap_pages) directly on a
    pages object they own.
  - Drop the notifier_seq seeding in drm_gpusvm_range_alloc();
    drivers initialise notifier_seq on their own pages object.

Update the DOC: overview to match the new model: document struct
drm_gpusvm_pages and the driver owned 1:1 / N:1 layouts, and rewrite the
usage examples to operate on a driver embedded pages object by the
drm_gpusvm_pages helpers instead of the removed range level wrappers.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Honglei Huang <honghuan@amd.com>
---
 drivers/gpu/drm/drm_gpusvm.c | 169 +++++++++++++++++++----------------
 include/drm/drm_gpusvm.h     |  13 ---
 2 files changed, 90 insertions(+), 92 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index b0e9a2db108..e0fd0b2fcc5 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -48,6 +48,47 @@
  *	event. As mentioned above, ranges are tracked in a notifier's Red-Black
  *	tree.
  *
+ * - Pages:
+ *	struct drm_gpusvm_pages holds the DMA mapping state for a range of
+ *	CPU virtual addresses: the DMA mapped device addresses,
+ *	the device private pagemap, the IOVA state, the per mapping
+ *	notifier sequence number, and the drm_device that owns the DMA
+ *	mappings.
+ *	A driver embeds one or more struct drm_gpusvm_pages alongside its
+ *	struct drm_gpusvm_range, choosing one of two layouts:
+ *
+ *	1:1 - one drm_gpusvm_pages per range (one drm_device). Simplest
+ *	layout; to mirror a VA range on several devices a driver uses a
+ *	separate range (and notifier) per device, so the HMM fault is taken
+ *	once per device.
+ *
+ *	N:1 - one drm_gpusvm_pages per drm_device, all sharing one range and
+ *	notifier; only the per-device DMA mapping differs. The instances must
+ *	sit in contiguous memory so a single drm_gpusvm_range_set_unmapped()
+ *	can mark them all. A driver can keep one instance inline for the single
+ *	device case and switch to a heap array only when more devices join,
+ *	e.g.:
+ *
+ *	.. code-block:: c
+ *
+ *		struct driver_range {
+ *			struct drm_gpusvm_range base;
+ *			unsigned int num_pages;	// 1: inline_pages, >1: pages[]
+ *			union {
+ *				struct drm_gpusvm_pages inline_pages;
+ *				struct drm_gpusvm_pages *pages;
+ *			};
+ *		};
+ *
+ *	In the N:1 case the driver allocates the pages array with a zeroing
+ *	allocator (e.g. kcalloc(num_pages, ...)), initialises each entry with
+ *	drm_gpusvm_init_pages(), and frees each entry with
+ *	drm_gpusvm_free_pages() plus the array itself, from its range free
+ *	callback. Each drm_gpusvm_pages is mapped independently by their own
+ *	drm_device.
+ *	Each drm_gpusvm_pages must be zero-initialised and initialised with
+ *	drm_gpusvm_init_pages(), called once per entry.
+ *
  * - Operations:
  *	Define the interface for driver-specific GPU SVM operations such as
  *	range allocation, notifier allocation, and invalidations.
@@ -92,7 +133,7 @@
  * range RB tree and list, as well as the range's DMA mappings and sequence
  * number. GPU SVM manages all necessary locking and unlocking operations,
  * except for the recheck range's pages being valid
- * (drm_gpusvm_range_pages_valid) when the driver is committing GPU bindings.
+ * (drm_gpusvm_pages_valid) when the driver is committing GPU bindings.
  * This lock corresponds to the ``driver->update`` lock mentioned in
  * Documentation/mm/hmm.rst. Future revisions may transition from a GPU SVM
  * global lock to a per-notifier lock if finer-grained locking is deemed
@@ -140,15 +181,20 @@
  *
  * .. code-block:: c
  *
- *	int driver_bind_range(struct drm_gpusvm *gpusvm, struct drm_gpusvm_range *range)
+ *	struct driver_range {
+ *		struct drm_gpusvm_range base;
+ *		struct drm_gpusvm_pages pages;
+ *	};
+ *
+ *	int driver_bind_range(struct drm_gpusvm *gpusvm, struct driver_range *drange)
  *	{
  *		int err = 0;
  *
- *		driver_alloc_and_setup_memory_for_bind(gpusvm, range);
+ *		driver_alloc_and_setup_memory_for_bind(gpusvm, drange);
  *
  *		drm_gpusvm_notifier_lock(gpusvm);
- *		if (drm_gpusvm_range_pages_valid(range))
- *			driver_commit_bind(gpusvm, range);
+ *		if (drm_gpusvm_pages_valid(gpusvm, &drange->pages))
+ *			driver_commit_bind(gpusvm, drange);
  *		else
  *			err = -EAGAIN;
  *		drm_gpusvm_notifier_unlock(gpusvm);
@@ -160,6 +206,8 @@
  *			     unsigned long gpuva_start, unsigned long gpuva_end)
  *	{
  *		struct drm_gpusvm_ctx ctx = {};
+ *		struct driver_range *drange;
+ *		struct drm_gpusvm_range *range;
  *		int err;
  *
  *		driver_svm_lock();
@@ -174,6 +222,7 @@
  *			err = PTR_ERR(range);
  *			goto unlock;
  *		}
+ *		drange = container_of(range, struct driver_range, base);
  *
  *		if (driver_migration_policy(range)) {
  *			err = drm_pagemap_populate_mm(driver_choose_drm_pagemap(),
@@ -183,7 +232,10 @@
  *				goto retry;
  *		}
  *
- *		err = drm_gpusvm_range_get_pages(gpusvm, range, &ctx);
+ *		err = drm_gpusvm_get_pages(gpusvm, &drange->pages,
+ *					   gpusvm->mm, &range->notifier->notifier,
+ *					   drm_gpusvm_range_start(range),
+ *					   drm_gpusvm_range_end(range), &ctx);
  *		if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM) {	// CPU mappings changed
  *			if (err == -EOPNOTSUPP)
  *				drm_gpusvm_range_evict(gpusvm, range);
@@ -192,7 +244,7 @@
  *			goto unlock;
  *		}
  *
- *		err = driver_bind_range(gpusvm, range);
+ *		err = driver_bind_range(gpusvm, drange);
  *		if (err == -EAGAIN)	// CPU mappings changed
  *			goto retry
  *
@@ -205,6 +257,21 @@
  *
  * .. code-block:: c
  *
+ *	// The driver owns the drm_gpusvm_pages lifecycle. ops->range_free is
+ *	// the final fallback: drm_gpusvm_free_pages() unmaps any
+ *	// lingering DMA mapping and a no-op if already unmapped and frees the
+ *	// dma_addr array. The normal flow is to DMA unmap before
+ *	// drm_gpusvm_range_remove() (before the range leaves the tree).
+ *	void driver_range_free(struct drm_gpusvm_range *range)
+ *	{
+ *		struct driver_range *drange =
+ *			container_of(range, struct driver_range, base);
+ *
+ *		drm_gpusvm_free_pages(range->gpusvm, &drange->pages,
+ *				      drm_gpusvm_range_size(range) >> PAGE_SHIFT);
+ *		kfree(drange);
+ *	}
+ *
  *	void __driver_garbage_collector(struct drm_gpusvm *gpusvm,
  *					struct drm_gpusvm_range *range)
  *	{
@@ -215,6 +282,14 @@
  *			drm_gpusvm_range_evict(gpusvm, range);
  *
  *		driver_unbind_range(range);
+ *		// The pages must be DMA unmapped before drm_gpusvm_range_remove()
+ *		// , so a range is never off the MMU interval tree while still DMA
+ *		// mapped as the original drmsvm design flow. Otherwise a concurrent CPU
+ *		// munmap's notifier could miss this range and free pages still mapped
+ *		// for device DMA. This is the normal unmap point.
+ *		drm_gpusvm_unmap_pages(gpusvm, &drange->pages,
+ *				       drm_gpusvm_range_size(range) >> PAGE_SHIFT,
+ *				       &(struct drm_gpusvm_ctx){ .in_notifier = false });
  *		drm_gpusvm_range_remove(gpusvm, range);
  *	}
  *
@@ -236,17 +311,22 @@
  *	{
  *		struct drm_gpusvm_ctx ctx = { .in_notifier = true, };
  *		struct drm_gpusvm_range *range = NULL;
+ *		struct driver_range *drange;
  *
  *		driver_invalidate_device_pages(gpusvm, mmu_range->start, mmu_range->end);
  *
  *		drm_gpusvm_for_each_range(range, notifier, mmu_range->start,
  *					  mmu_range->end) {
- *			drm_gpusvm_range_unmap_pages(gpusvm, range, &ctx);
+ *			drange = container_of(range, struct driver_range, base);
+ *
+ *			drm_gpusvm_unmap_pages(gpusvm, &drange->pages,
+ *					       drm_gpusvm_range_size(range) >> PAGE_SHIFT,
+ *					       &ctx);
  *
  *			if (mmu_range->event != MMU_NOTIFY_UNMAP)
  *				continue;
  *
- *			drm_gpusvm_range_set_unmapped(range, mmu_range);
+ *			drm_gpusvm_range_set_unmapped(range, &drange->pages, 1, mmu_range);
  *			driver_garbage_collector_add(gpusvm, range);
  *		}
  *	}
@@ -640,8 +720,6 @@ drm_gpusvm_range_alloc(struct drm_gpusvm *gpusvm,
 	range->itree.start = ALIGN_DOWN(fault_addr, chunk_size);
 	range->itree.last = ALIGN(fault_addr + 1, chunk_size) - 1;
 	INIT_LIST_HEAD(&range->entry);
-	range->pages.notifier_seq = LONG_MAX;
-	range->pages.drm = gpusvm->drm;
 	range->flags.migrate_devmem = migrate_devmem ? 1 : 0;
 
 	return range;
@@ -930,7 +1008,7 @@ drm_gpusvm_range_chunk_size(struct drm_gpusvm *gpusvm,
 		 * mallocs 16k but the CPU VMA is ~128k which results in 64k SVM
 		 * ranges. When migrating the SVM ranges, some processes fail in
 		 * drm_pagemap_migrate_to_devmem with 'migrate.cpages != npages'
-		 * and then upon drm_gpusvm_range_get_pages device pages from
+		 * and then upon drm_gpusvm_get_pages device pages from
 		 * other processes are collected + faulted in which creates all
 		 * sorts of problems. Unsure exactly how this happening, also
 		 * problem goes away if 'xe_exec_system_allocator --r
@@ -1337,27 +1415,6 @@ bool drm_gpusvm_pages_valid(struct drm_gpusvm *gpusvm,
 }
 EXPORT_SYMBOL_GPL(drm_gpusvm_pages_valid);
 
-/**
- * drm_gpusvm_range_pages_valid() - GPU SVM range pages valid
- * @gpusvm: Pointer to the GPU SVM structure
- * @range: Pointer to the GPU SVM range structure
- *
- * This function determines if a GPU SVM range pages are valid. Expected be
- * called holding gpusvm->notifier_lock and as the last step before committing a
- * GPU binding. This is akin to a notifier seqno check in the HMM documentation
- * but due to wider notifiers (i.e., notifiers which span multiple ranges) this
- * function is required for finer grained checking (i.e., per range) if pages
- * are valid.
- *
- * Return: True if GPU SVM range has valid pages, False otherwise
- */
-bool drm_gpusvm_range_pages_valid(struct drm_gpusvm *gpusvm,
-				  struct drm_gpusvm_range *range)
-{
-	return drm_gpusvm_pages_valid(gpusvm, &range->pages);
-}
-EXPORT_SYMBOL_GPL(drm_gpusvm_range_pages_valid);
-
 /**
  * drm_gpusvm_pages_valid_unlocked() - GPU SVM pages valid unlocked
  * @gpusvm: Pointer to the GPU SVM structure
@@ -1638,29 +1695,6 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
 }
 EXPORT_SYMBOL_GPL(drm_gpusvm_get_pages);
 
-/**
- * drm_gpusvm_range_get_pages() - Get pages for a GPU SVM range
- * @gpusvm: Pointer to the GPU SVM structure
- * @range: Pointer to the GPU SVM range structure
- * @ctx: GPU SVM context
- *
- * This function gets pages for a GPU SVM range and ensures they are mapped for
- * DMA access.
- *
- * Return: 0 on success, negative error code on failure.
- */
-int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
-			       struct drm_gpusvm_range *range,
-			       const struct drm_gpusvm_ctx *ctx)
-{
-	return drm_gpusvm_get_pages(gpusvm, &range->pages,
-				    gpusvm->mm,
-				    &range->notifier->notifier,
-				    drm_gpusvm_range_start(range),
-				    drm_gpusvm_range_end(range), ctx);
-}
-EXPORT_SYMBOL_GPL(drm_gpusvm_range_get_pages);
-
 /**
  * drm_gpusvm_unmap_pages() - Unmap GPU svm pages
  * @gpusvm: Pointer to the GPU SVM structure
@@ -1691,29 +1725,6 @@ void drm_gpusvm_unmap_pages(struct drm_gpusvm *gpusvm,
 }
 EXPORT_SYMBOL_GPL(drm_gpusvm_unmap_pages);
 
-/**
- * drm_gpusvm_range_unmap_pages() - Unmap pages associated with a GPU SVM range
- * @gpusvm: Pointer to the GPU SVM structure
- * @range: Pointer to the GPU SVM range structure
- * @ctx: GPU SVM context
- *
- * This function unmaps pages associated with a GPU SVM range. If @in_notifier
- * is set, it is assumed that gpusvm->notifier_lock is held in write mode; if it
- * is clear, it acquires gpusvm->notifier_lock in read mode. Must be called on
- * each GPU SVM range attached to notifier in gpusvm->ops->invalidate for IOMMU
- * security model.
- */
-void drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
-				  struct drm_gpusvm_range *range,
-				  const struct drm_gpusvm_ctx *ctx)
-{
-	unsigned long npages = npages_in_range(drm_gpusvm_range_start(range),
-					       drm_gpusvm_range_end(range));
-
-	return drm_gpusvm_unmap_pages(gpusvm, &range->pages, npages, ctx);
-}
-EXPORT_SYMBOL_GPL(drm_gpusvm_range_unmap_pages);
-
 /**
  * drm_gpusvm_range_evict() - Evict GPU SVM range
  * @gpusvm: Pointer to the GPU SVM structure
diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
index 3f38283111c..2862104aa1b 100644
--- a/include/drm/drm_gpusvm.h
+++ b/include/drm/drm_gpusvm.h
@@ -177,7 +177,6 @@ struct drm_gpusvm_range_flags {
  * @refcount: Reference count for the range
  * @itree: Interval tree node for the range (inserted in GPU SVM notifier)
  * @entry: List entry to fast interval tree traversal
- * @pages: The pages for this range.
  * @flags: Flags for range see &struct drm_gpusvm_range_flags
  *
  * This structure represents a GPU SVM range used for tracking memory ranges
@@ -189,7 +188,6 @@ struct drm_gpusvm_range {
 	struct kref refcount;
 	struct interval_tree_node itree;
 	struct list_head entry;
-	struct drm_gpusvm_pages pages;
 	struct drm_gpusvm_range_flags flags;
 };
 
@@ -307,20 +305,9 @@ drm_gpusvm_range_get(struct drm_gpusvm_range *range);
 
 void drm_gpusvm_range_put(struct drm_gpusvm_range *range);
 
-bool drm_gpusvm_range_pages_valid(struct drm_gpusvm *gpusvm,
-				  struct drm_gpusvm_range *range);
-
 bool drm_gpusvm_pages_valid(struct drm_gpusvm *gpusvm,
 			    struct drm_gpusvm_pages *svm_pages);
 
-int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
-			       struct drm_gpusvm_range *range,
-			       const struct drm_gpusvm_ctx *ctx);
-
-void drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
-				  struct drm_gpusvm_range *range,
-				  const struct drm_gpusvm_ctx *ctx);
-
 bool drm_gpusvm_has_mapping(struct drm_gpusvm *gpusvm, unsigned long start,
 			    unsigned long end);
 
-- 
2.34.1

