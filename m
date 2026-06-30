Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83FC5C43602
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jun 2026 07:41:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D8DE10EB57;
	Tue, 30 Jun 2026 07:41:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="EDXcmOEA";
	dkim-atps=neutral
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010043.outbound.protection.outlook.com
 [40.93.198.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80F0510EB54
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jun 2026 07:41:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M8OIhdQTeiJWn46hRDLCgotEZcTQmdwXleKnRyE+DlyqmUwPiO//WUkKFV+q10Z/ROGy8E/2NCXEYmS2/cwvzMC+E1w9dJCa0SRM0bmDTepbnKlijk/zhMLf/3edX8ub0VUzNII6CepZXiQFtEB5j04Kyx7SgaPWPY1CdfdXNZjWhSLtTAPoN2RA2/7wl3COSU2LKyOFnNWhyQwbuZRcj6EJeGwDW6KbEdRcRSJNP4+yuatouJRNtboAyBaq8eFJKDimNg38PoEUkUnnluzprpwRoM6z+Aea3jUPlZdJFsXetaDQby9ZFOeB137J8nz49yixjnPeh+qyux+epKsARA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TVeYNXHEI/HhLk99IcJKXrGaDhBBm8lPk7O+B33lnWw=;
 b=UEIjozmIDT+F1YRpPn7L9TQb0Y5LKk9oe5KWqrYwu6s9bXVihonN5IMBNaXmYQa1qo7BlTkqcGh570ZCXAJ3e1eL+mAy0CGkdlVKgKS15Ofv2nbIi/nO01D9Hs3oPoWMJVRsWgiEUEWEbFlm/ph60oTqyUiaN4AveVLF3F3b5989XVLvLr3dlb2evgQ1XxzUugOAl2cmbiQ6cSRheBS2r8p288Q72h07TJdl2Qj0oGBy3jgxDuWD38/9SSmhOvUvXOh3g8CYBsD8oXHsE2nue9m1O98YpsNhpPDy8ub2lHARRC6S16MCJ+zBH4//eMx16R0Q29/JD3BqyJOJP1JuHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TVeYNXHEI/HhLk99IcJKXrGaDhBBm8lPk7O+B33lnWw=;
 b=EDXcmOEAVahBDdRPdnUyHTVlDFC4F0nQWFccBFBnbL8UA7QBKDmNMy1rTEAVWi/n4AEAoz1cHTWXz32D6ahA6ixXKauEQBNl7QKxE5GNeN2I1DNoJP/QIuni8wD90Yg1fXTJnQ5f95CySf68Ugb4qfFLx2Vxq1AO6WDpbO1jDcI=
Received: from SA0PR11CA0155.namprd11.prod.outlook.com (2603:10b6:806:1bb::10)
 by IA1PR12MB7613.namprd12.prod.outlook.com (2603:10b6:208:42a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 30 Jun
 2026 07:41:05 +0000
Received: from SN1PEPF000252A1.namprd05.prod.outlook.com
 (2603:10b6:806:1bb:cafe::a2) by SA0PR11CA0155.outlook.office365.com
 (2603:10b6:806:1bb::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Tue,
 30 Jun 2026 07:41:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SN1PEPF000252A1.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 07:41:05 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 30 Jun
 2026 02:41:02 -0500
Received: from honglei-remote.amd.com (10.180.168.240) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 30 Jun
 2026 00:35:05 -0700
From: Honglei Huang <honghuan@amd.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH v9 1/5] drm/gpusvm: split MM state flags out of
 drm_gpusvm_pages_flags
Date: Tue, 30 Jun 2026 15:34:48 +0800
Message-ID: <20260630073452.379071-2-honghuan@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A1:EE_|IA1PR12MB7613:EE_
X-MS-Office365-Filtering-Correlation-Id: 360cec0d-1e34-4ca5-aca9-08ded67af14a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|1800799024|23010399003|82310400026|376014|22082099003|18002099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: JrsHSNF+AgfQrmD1Jvgqj+6IE6LO56XTXAyiMv06idrVh2uoP193yVW5E1Aw7MA9u0nCglBEe2gqIA8FM9eVKgYUO1GA/kFlQtEqVaJDXrZhDcLsh6R6aGWHBzSl9X2t6VwzY9iWSTy6BfG3KmLGdLplNpFfFZsNlLIXyplqj4Rl/4cpLrtdomUHT/34hyFJNVEPnKznUoIrWXu1wIeFDhK0J6WMuQprIpviM6Us+t1Cat2zqYy3BLWPl8LGydS6PhfAd+W14rlWnPCCKiMHZUBnH8voTRLsqxqHcdqqKavhwL7SGk1jNw43EUM56+BQF+BomtKtRKMH7thpC5jDEFFzzpipwKBGHWxBAffIvORmZ567mqjlSBnrigLDFKzZdD/3btzsNrxgu+j1phu7iOW26ySbETZXfT3mc0dqttwHy3zZcWQ1vQdAf1xwbygnR7Mq0mhjA8vrxHdPlM/TU0MumaRcMELFlOG1JtM6fghKEqNsuO81avYAqjKzrmfjdj0lAWBiZGiYMHhfOrQtNbWipoWofbdD/5w60J+T9I/M9v3XTYq1UGwRF/DTKuqtZs1xDUAs2+kjfsRqYvlq/essPbuj5lMmAYR1lkdWJ6HxfwMYBVaOUHxFRb9nCQg+9koEb/NijQ+jBfhJd8GC9A==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(1800799024)(23010399003)(82310400026)(376014)(22082099003)(18002099003)(11063799006)(56012099006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: OQ56Vif1omG2KjZCayOI5ebS7qD+I9XvvVveVDyKNvUJoczDWe/hqhxvu6LQoSj/bFFylx1+/zlzFHV+/diAGLwxF05fCvEaCY0ppwBxAEaPmccVH7OgN6MfYxSmUa4rIhbBokea0h2fePuvBunjaYA1BUiPJxFSDha6hL8iw3byJ41z5NbElHOEb3a0RCl1g5Frdizu+GZ6qQPb/SXSdPVOufyxyhnpoJUpTOkED/yFiz0R/IaZ64rD0g3BwddCdt54yWLxwOCyM2SPKj8p6wZ0B6plyEtkg5+EAVlHcGkGXABB2msy6Vle7DJhhSbpcw6Af6m6q1xXTB1tHTIH/RTmiWYDFQ4i/B+upzPnV45pQ0MtPhe9Lve1dqOo3/DwGi7t091uTV3uhqlUGA9v4ahHfofver3UplzrQMrDGGL8kVKwzv2A5slO5udxqZdN
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 07:41:05.5139 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 360cec0d-1e34-4ca5-aca9-08ded67af14a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7613
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

drm_gpusvm_pages_flags currently mixes two status:
  - MM / virtual-address state: whether the range has been (partially)
    unmapped by the Linux MM, these follow the lifetime of the VMA and
    are a single per VA range fact.
  - Device mapping state: has_devmem_pages and has_dma_mapping,
    which describe the current page mapping status held by device
    itself.

Keeping both on the pages object blurs the semantics of the
abstraction of pages and VA range. So move the MM state flags onto the
range, and keep drm_gpusvm_pages_flags strictly for mapping state.

  - Introduce drm_gpusvm_range_flags { migrate_devmem, unmapped,
    partial_unmap } on drm_gpusvm_range.
  - Shrink drm_gpusvm_pages_flags to just has_devmem_pages and
    has_dma_mapping.

Side effect: drivers now need to check the unmap flags in the driver
itself to avoid handling the unmapped pages.

Mirror that bit onto drm_gpusvm_pages so the framework can
still short circuit drm_gpusvm_get_pages() under the notifier lock, and
make drm_gpusvm_range_set_unmapped() propagate it to the backing pages.
This follows Matt's review fixup for the v0 series; see the Link below.

Like drm_gpusvm_pages_flags, drm_gpusvm_range_flags unions its bits with
a u16 __flags member. Build the new value in a local copy and publish it
with a single WRITE_ONCE() on __flags, and have the lockless readers use
READ_ONCE(), so concurrent bitfield access stays data-race free and KCSAN
quiet.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Link: https://gitlab.freedesktop.org/mbrost/xe-kernel-driver-svn-perf-6-15-2025/-/commit/623f6a50c037d9e44f6c9fbe6859a0ba7ad50177
Signed-off-by: Honglei Huang <honghuan@amd.com>
---
 drivers/gpu/drm/drm_gpusvm.c | 26 +++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_svm.c  | 18 +++++++++++++-----
 include/drm/drm_gpusvm.h     | 30 +++++++++++++++++++++++++-----
 3 files changed, 61 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index 958cb605aed..abdfdaaf5e2 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -641,7 +641,7 @@ drm_gpusvm_range_alloc(struct drm_gpusvm *gpusvm,
 	range->itree.last = ALIGN(fault_addr + 1, chunk_size) - 1;
 	INIT_LIST_HEAD(&range->entry);
 	range->pages.notifier_seq = LONG_MAX;
-	range->pages.flags.migrate_devmem = migrate_devmem ? 1 : 0;
+	range->flags.migrate_devmem = migrate_devmem ? 1 : 0;
 
 	return range;
 }
@@ -1784,20 +1784,40 @@ EXPORT_SYMBOL_GPL(drm_gpusvm_has_mapping);
 /**
  * drm_gpusvm_range_set_unmapped() - Mark a GPU SVM range as unmapped
  * @range: Pointer to the GPU SVM range structure.
+ * @pages: Pointer to the GPU SVM pages structure(s).
+ * @pages_count: Number of GPU SVM pages structure(s) passed in.
  * @mmu_range: Pointer to the MMU notifier range structure.
  *
  * This function marks a GPU SVM range as unmapped and sets the partial_unmap flag
  * if the range partially falls within the provided MMU notifier range.
  */
 void drm_gpusvm_range_set_unmapped(struct drm_gpusvm_range *range,
+				   struct drm_gpusvm_pages *pages,
+				   unsigned int pages_count,
 				   const struct mmu_notifier_range *mmu_range)
 {
+	struct drm_gpusvm_range_flags range_flags = {
+		.__flags = range->flags.__flags,
+	};
+	unsigned int i;
+
 	lockdep_assert_held_write(&range->gpusvm->notifier_lock);
 
-	range->pages.flags.unmapped = true;
+	range_flags.unmapped = true;
+	for (i = 0; i < pages_count; ++i) {
+		struct drm_gpusvm_pages_flags flags = {
+			.__flags = pages[i].flags.__flags,
+		};
+
+		flags.unmapped = true;
+		/* WRITE_ONCE pairs with READ_ONCE for opportunistic checks */
+		WRITE_ONCE(pages[i].flags.__flags, flags.__flags);
+	}
 	if (drm_gpusvm_range_start(range) < mmu_range->start ||
 	    drm_gpusvm_range_end(range) > mmu_range->end)
-		range->pages.flags.partial_unmap = true;
+		range_flags.partial_unmap = true;
+	/* WRITE_ONCE pairs with READ_ONCE for opportunistic checks */
+	WRITE_ONCE(range->flags.__flags, range_flags.__flags);
 }
 EXPORT_SYMBOL_GPL(drm_gpusvm_range_set_unmapped);
 
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index b1e1ac26c66..e8b7a51e67f 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -134,7 +134,8 @@ xe_svm_garbage_collector_add_range(struct xe_vm *vm, struct xe_svm_range *range,
 
 	range_debug(range, "GARBAGE COLLECTOR ADD");
 
-	drm_gpusvm_range_set_unmapped(&range->base, mmu_range);
+	drm_gpusvm_range_set_unmapped(&range->base, &range->base.pages, 1,
+				      mmu_range);
 
 	spin_lock(&vm->svm.garbage_collector.lock);
 	if (list_empty(&range->garbage_collector_link))
@@ -166,7 +167,7 @@ xe_svm_range_notifier_event_begin(struct xe_vm *vm, struct drm_gpusvm_range *r,
 	range_debug(range, "NOTIFIER");
 
 	/* Skip if already unmapped or if no binding exist */
-	if (range->base.pages.flags.unmapped || !range->tile_present)
+	if (range->base.flags.unmapped || !range->tile_present)
 		return 0;
 
 	range_debug(range, "NOTIFIER - EXECUTE");
@@ -1135,8 +1136,12 @@ bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vm
 {
 	struct xe_vm *vm = range_to_vm(&range->base);
 	u64 range_size = xe_svm_range_size(range);
+	struct drm_gpusvm_range_flags flags = {
+		/* READ_ONCE pairs with WRITE_ONCE in drm_gpusvm_range_set_unmapped() */
+		.__flags = READ_ONCE(range->base.flags.__flags),
+	};
 
-	if (!range->base.pages.flags.migrate_devmem || !dpagemap)
+	if (!flags.migrate_devmem || !dpagemap)
 		return false;
 
 	xe_assert(vm->xe, IS_DGFX(vm->xe));
@@ -1220,6 +1225,7 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	struct xe_validation_ctx vctx;
 	struct drm_exec exec;
 	struct xe_svm_range *range;
+	struct drm_gpusvm_range_flags range_flags;
 	struct dma_fence *fence;
 	struct drm_pagemap *dpagemap;
 	struct xe_tile *tile = gt_to_tile(gt);
@@ -1248,7 +1254,9 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 
 	xe_svm_range_fault_count_stats_incr(gt, range);
 
-	if (ctx.devmem_only && !range->base.pages.flags.migrate_devmem)
+	/* READ_ONCE pairs with WRITE_ONCE in drm_gpusvm_range_set_unmapped() */
+	range_flags.__flags = READ_ONCE(range->base.flags.__flags);
+	if (ctx.devmem_only && !range_flags.migrate_devmem)
 		return -EACCES;
 
 	if (xe_svm_range_is_valid(range, tile, ctx.devmem_only, dpagemap)) {
@@ -1621,7 +1629,7 @@ int xe_svm_alloc_vram(struct xe_svm_range *range, const struct drm_gpusvm_ctx *c
 	int err, retries = 1;
 	bool write_locked = false;
 
-	xe_assert(range_to_vm(&range->base)->xe, range->base.pages.flags.migrate_devmem);
+	xe_assert(range_to_vm(&range->base)->xe, range->base.flags.migrate_devmem);
 	range_debug(range, "ALLOCATE VRAM");
 
 	migration_state = drm_gpusvm_scan_mm(&range->base,
diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
index 8a4d7134a9a..251a7266a73 100644
--- a/include/drm/drm_gpusvm.h
+++ b/include/drm/drm_gpusvm.h
@@ -109,9 +109,7 @@ struct drm_gpusvm_notifier {
 /**
  * struct drm_gpusvm_pages_flags - Structure representing a GPU SVM pages flags
  *
- * @migrate_devmem: Flag indicating whether the pages can be migrated to device memory
  * @unmapped: Flag indicating if the pages has been unmapped
- * @partial_unmap: Flag indicating if the pages has been partially unmapped
  * @has_devmem_pages: Flag indicating if the pages has devmem pages
  * @has_dma_mapping: Flag indicating if the pages has a DMA mapping
  * @__flags: Flags for pages in u16 form (used for READ_ONCE)
@@ -119,11 +117,8 @@ struct drm_gpusvm_notifier {
 struct drm_gpusvm_pages_flags {
 	union {
 		struct {
-			/* All flags below must be set upon creation */
-			u16 migrate_devmem : 1;
 			/* All flags below must be set / cleared under notifier lock */
 			u16 unmapped : 1;
-			u16 partial_unmap : 1;
 			u16 has_devmem_pages : 1;
 			u16 has_dma_mapping : 1;
 		};
@@ -151,6 +146,27 @@ struct drm_gpusvm_pages {
 	struct drm_gpusvm_pages_flags flags;
 };
 
+/**
+ * struct drm_gpusvm_range_flags - Range-level GPU SVM flags
+ *
+ * @migrate_devmem: Flag indicating whether the range can be migrated to device memory
+ * @unmapped: Flag indicating if the range has been unmapped
+ * @partial_unmap: Flag indicating if the range has been partially unmapped
+ * @__flags: All flags in u16 form (used for READ_ONCE)
+ */
+struct drm_gpusvm_range_flags {
+	union {
+		struct {
+			/* All flags below must be set upon creation */
+			u16 migrate_devmem	: 1;
+			/* All flags below must be set / cleared under notifier lock */
+			u16 unmapped		: 1;
+			u16 partial_unmap	: 1;
+		};
+		u16 __flags;
+	};
+};
+
 /**
  * struct drm_gpusvm_range - Structure representing a GPU SVM range
  *
@@ -160,6 +176,7 @@ struct drm_gpusvm_pages {
  * @itree: Interval tree node for the range (inserted in GPU SVM notifier)
  * @entry: List entry to fast interval tree traversal
  * @pages: The pages for this range.
+ * @flags: Flags for range see &struct drm_gpusvm_range_flags
  *
  * This structure represents a GPU SVM range used for tracking memory ranges
  * mapped in a DRM device.
@@ -171,6 +188,7 @@ struct drm_gpusvm_range {
 	struct interval_tree_node itree;
 	struct list_head entry;
 	struct drm_gpusvm_pages pages;
+	struct drm_gpusvm_range_flags flags;
 };
 
 /**
@@ -310,6 +328,8 @@ drm_gpusvm_range_find(struct drm_gpusvm_notifier *notifier, unsigned long start,
 		      unsigned long end);
 
 void drm_gpusvm_range_set_unmapped(struct drm_gpusvm_range *range,
+				   struct drm_gpusvm_pages *pages,
+				   unsigned int pages_count,
 				   const struct mmu_notifier_range *mmu_range);
 
 int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
-- 
2.34.1

