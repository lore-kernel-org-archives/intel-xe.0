Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DED5C43458
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jun 2026 03:38:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAA0F10E166;
	Tue, 30 Jun 2026 03:38:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PLDlABH1";
	dkim-atps=neutral
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012002.outbound.protection.outlook.com
 [40.93.195.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A92210E159
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jun 2026 03:38:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MZA2zJ4QoDoqUGHcQLAXA+rW4PSZ5FWSOmvLMXbFD6cBIvAST6HyFAvzd6y1ENncJVLEILnv562O+L+5f9AX0TD9o7x6BtOnRlGilFtIWM58a5AkOr9sxehBrr04gNg6xeLHTVoltQVXFTblBwayf9+OgeX6nIjCI1AcwoeCBMwiAuL7D1oaitYbD3GBZNkHQPH1f6/JKtIlhViBbJTsJfd+Fs8t6GIuSMQHR/brysN/NHwOozy2kw0gCIUw1IYJP7jNiRBRI2eLtA4QbZ05UilFADqXzZrrA6BjgCQ0buUD8dZhzOYEUxi1H0NxdiyOMDi6AUVduJpo8Sm8r8CaWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CHDMa5NODSlqF1ak0f3pBSIUSBefKs/FDTgD36oeFGM=;
 b=MnvHKpWWRfJrYSjWVOiROxtLCAwX3Oszlr6HiUfpLX3yS0iAqJEniV15Qm3I7Nu0AGQhxZ8waA9mANICMnQmzAEUCA9aU6gZlSLbr0uYUd9tCAuj1HBiGprT+P6MQuiKb5jokziW3McXWVdPprjqKS2Cn62qZUi4Vy3oDWjSB2gADwYAwEp/CY602Y6xGrjNSLBgzqplvfyKukrWgNefU0kYKbWvgkmDOpaNiwGyko1Epo7VXd5NzvyyXTylROfZ+CpuFNzEexVjMFqpewxfPO8Yhe+h0H4Zq97VCe/5V10PnS7KcnA0GXEJYWZ+7MRoq0vIYdiZt0RhTSLBXqwIdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CHDMa5NODSlqF1ak0f3pBSIUSBefKs/FDTgD36oeFGM=;
 b=PLDlABH1sWyygfxNE4FZaM/bzxemmUhMibwvQeitmhPgiDISYIslethVLMcj3UZrjP/WGfL4ei++etmILo1MpwJjMNx/JG5rdIslQxKLrY0jY8SCvYtbXMbswSIvhD16xIJxc9lXbRB4j8FW93Haf4eBGU4piMuyYTmY+77Xd+U=
Received: from BY5PR04CA0001.namprd04.prod.outlook.com (2603:10b6:a03:1d0::11)
 by CYYPR12MB9013.namprd12.prod.outlook.com (2603:10b6:930:c2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 03:38:09 +0000
Received: from CO1PEPF00012E66.namprd05.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::9b) by BY5PR04CA0001.outlook.office365.com
 (2603:10b6:a03:1d0::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Tue,
 30 Jun 2026 03:38:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF00012E66.mail.protection.outlook.com (10.167.249.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 03:38:08 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 29 Jun
 2026 22:37:59 -0500
Received: from honglei-remote.amd.com (10.180.168.240) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 29 Jun
 2026 20:37:56 -0700
From: Honglei Huang <honghuan@amd.com>
To: <intel-xe@lists.freedesktop.org>
CC: Honglei Huang <honghuan@amd.com>, Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v8 2/5] drm/gpusvm: embed struct drm_device into
 drm_gpusvm_pages
Date: Tue, 30 Jun 2026 11:37:28 +0800
Message-ID: <20260630033731.362150-3-honghuan@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260630033731.362150-1-honghuan@amd.com>
References: <20260630033731.362150-1-honghuan@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E66:EE_|CYYPR12MB9013:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d579ec7-7a52-46dc-965d-08ded65900ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|82310400026|23010399003|1800799024|376014|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: Pc4QPPWipwO5O7i6tOSqjvHUR5+4m4PpTBdtHOg2WwvjDOIqR4l563/YlvRYuTKIIfT1dRx96fuv/u2ZxMFvrQlwMO97qAt5ccdJv8Ws8+N9vvd/8PDVGxOsOqfDpuZM4Scs7WVjKw00H0bRkwapRLCByUBZLENpdp4HmQVq2AYvc9l4icU1H+Upi6KZ3Zcc4DrdY9jMxqtrzw2iMHzgjFg7pN8TMR6Gh9HDgHPkr3HoU33vrR6VmcmaMG9e9zZD3kF3LKFJcDoHO3CX2Wwdc1zxuTBhbbLYIcsHFwc0QEDRfws5FJoLEBQ+IoppJM5TPja70Zg6kXVnw2Ytmn8iZoUTm7jCWgZ89bnnXJPH74Ti4bkXFoEI06hdBxgB13VV00hakKrj7eeXQWARKvG+dGRI08vLWSnQIWZhnaR8B9/wakUCHU5XkMV8ROqb/ywFAIk8RUBg3IL/Q7zVcZ0Azww+cTvq21Ux1hwXW/6V+cNHNM+0BB+Q6+MHlFNOPNLw9w8b9u6hC6bWgIGAMxW/ejZnG4/L0xPVkFTkoWDb0G8tg4nsRQZX4x9FRy8fVmEUaLWo7iZiH1EwZ8zp0S13PC4Xop+hzI/LusoyiBKmneBHRt1Nj9u+V+Zy/iQQCf1seWepCkykqWwxlmU63u3c4TBS/6blIRQdo6NmrJNrk6Pwf4k4/bAe3ofIWyU2q0vRHR4Zj4WtxFmz1H+n3E4PMw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(82310400026)(23010399003)(1800799024)(376014)(22082099003)(18002099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: yKnFSd7Nwgl3ZDDEQ2DUwQYant3KVyQKtRI7pstBLZ7OcK23IXVrMcGVXLj08GpylbhOYV4aBAnc1yaA2wnD0wbfph7jNu+vpkVGApN/birkVZV615XukTk+PCekJkevUBrM/WOY3Y8o/+zuyUXo9mdYhueKMI/pYJC+0esjR/PYV4V7p98m5pdrjKptlY6Iwww4YcX7Sk9ELOTz19uFF3rbo0J9NPUOCVvDuyQmH9DRKO+TeJhNgIEtc070ZzAknhIpLYP0Jk2UHVJhrrPFBPYs3VT9aTQG7kFER8HQsuGaULQEKJu/YDLaVNBhIlTAf9GKo0Xf8OI/cTRUApurct6m8U6vUCljiFfdES3uyER2GA1Cd/3DKVOiDWZZzvG1ewLi69kz36LumN7gE31pSVZ0fpYFiAnB97HR79+j4qaS17fDZHcaLYS3pcSjvsx7
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 03:38:08.5563 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d579ec7-7a52-46dc-965d-08ded65900ca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00012E66.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB9013
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

drm_gpusvm_pages is the layer that actually represents physical
pages/mappings it owns the dma_addr array, the dma_iova_state...
With the previous patch, so drm_gpusvm_pages is now strictly about
physical pages and their DMA view.

Since now the drm_gpusvm_pages instance is inherently bound to one
specific drm_device, make that ownership explicit by giving
drm_gpusvm_pages its own drm_device handle, and drive all DMA through
it instead of through the gpusvm:

  - Add drm to struct drm_gpusvm_pages and route all DMA in
    drm_gpusvm_get_pages() / __drm_gpusvm_unmap_pages() through
    svm_pages->drm instead of gpusvm->drm.
  - Bind svm_pages->drm where the pages object is initialised
    (drm_gpusvm_range_alloc() and the xe userptr setup) and require
    it to be set on entry to drm_gpusvm_get_pages(); the dma device
    is immutable for the lifetime of the pages instance. A later
    patch introduces drm_gpusvm_init_pages() to centralise this.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Honglei Huang <honghuan@amd.com>
---
 drivers/gpu/drm/drm_gpusvm.c    | 30 ++++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_userptr.c |  2 ++
 include/drm/drm_gpusvm.h        |  2 ++
 3 files changed, 24 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index abdfdaaf5e2..604554e40f6 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -641,6 +641,7 @@ drm_gpusvm_range_alloc(struct drm_gpusvm *gpusvm,
 	range->itree.last = ALIGN(fault_addr + 1, chunk_size) - 1;
 	INIT_LIST_HEAD(&range->entry);
 	range->pages.notifier_seq = LONG_MAX;
+	range->pages.drm = gpusvm->drm;
 	range->flags.migrate_devmem = migrate_devmem ? 1 : 0;
 
 	return range;
@@ -1135,11 +1136,16 @@ static void __drm_gpusvm_unmap_pages(struct drm_gpusvm *gpusvm,
 				     unsigned long npages)
 {
 	struct drm_pagemap *dpagemap = svm_pages->dpagemap;
-	struct device *dev = gpusvm->drm->dev;
+	struct device *dev;
 	unsigned long i, j;
 
 	lockdep_assert_held(&gpusvm->notifier_lock);
 
+	if (!svm_pages->drm)
+		return;
+
+	dev = svm_pages->drm->dev;
+
 	if (svm_pages->flags.has_dma_mapping) {
 		struct drm_gpusvm_pages_flags flags = {
 			.__flags = svm_pages->flags.__flags,
@@ -1421,6 +1427,9 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
 							   DMA_BIDIRECTIONAL;
 	struct dma_iova_state *state = &svm_pages->state;
 
+	if (!svm_pages->drm)
+		return -EINVAL;
+
 retry:
 	if (time_after(jiffies, timeout))
 		return -EBUSY;
@@ -1520,7 +1529,7 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
 
 				pagemap = page_pgmap(page);
 				dpagemap = drm_pagemap_page_to_dpagemap(page);
-				if (drm_WARN_ON(gpusvm->drm, !dpagemap)) {
+				if (drm_WARN_ON(svm_pages->drm, !dpagemap)) {
 					/*
 					 * Raced. This is not supposed to happen
 					 * since hmm_range_fault() should've migrated
@@ -1532,10 +1541,10 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
 			}
 			svm_pages->dma_addr[j] =
 				dpagemap->ops->device_map(dpagemap,
-							  gpusvm->drm->dev,
+							  svm_pages->drm->dev,
 							  page, order,
 							  dma_dir);
-			if (dma_mapping_error(gpusvm->drm->dev,
+			if (dma_mapping_error(svm_pages->drm->dev,
 					      svm_pages->dma_addr[j].addr)) {
 				err = -EFAULT;
 				goto err_unmap;
@@ -1555,11 +1564,11 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
 			}
 
 			if (!i)
-				dma_iova_try_alloc(gpusvm->drm->dev, state,
+				dma_iova_try_alloc(svm_pages->drm->dev, state,
 						   0, npages * PAGE_SIZE);
 
 			if (dma_use_iova(state)) {
-				err = dma_iova_link(gpusvm->drm->dev, state,
+				err = dma_iova_link(svm_pages->drm->dev, state,
 						    hmm_pfn_to_phys(pfns[i]),
 						    svm_pages->state_offset,
 						    PAGE_SIZE << order,
@@ -1570,11 +1579,11 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
 				addr = state->addr + svm_pages->state_offset;
 				svm_pages->state_offset += PAGE_SIZE << order;
 			} else {
-				addr = dma_map_page(gpusvm->drm->dev,
+				addr = dma_map_page(svm_pages->drm->dev,
 						    page, 0,
 						    PAGE_SIZE << order,
 						    dma_dir);
-				if (dma_mapping_error(gpusvm->drm->dev, addr)) {
+				if (dma_mapping_error(svm_pages->drm->dev, addr)) {
 					err = -EFAULT;
 					goto err_unmap;
 				}
@@ -1590,7 +1599,7 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
 	}
 
 	if (dma_use_iova(state)) {
-		err = dma_iova_sync(gpusvm->drm->dev, state, 0,
+		err = dma_iova_sync(svm_pages->drm->dev, state, 0,
 				    svm_pages->state_offset);
 		if (err)
 			goto err_unmap;
@@ -1640,7 +1649,8 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 			       struct drm_gpusvm_range *range,
 			       const struct drm_gpusvm_ctx *ctx)
 {
-	return drm_gpusvm_get_pages(gpusvm, &range->pages, gpusvm->mm,
+	return drm_gpusvm_get_pages(gpusvm, &range->pages,
+				    gpusvm->mm,
 				    &range->notifier->notifier,
 				    drm_gpusvm_range_start(range),
 				    drm_gpusvm_range_end(range), ctx);
diff --git a/drivers/gpu/drm/xe/xe_userptr.c b/drivers/gpu/drm/xe/xe_userptr.c
index 6761005c0b9..1b540e62af6 100644
--- a/drivers/gpu/drm/xe/xe_userptr.c
+++ b/drivers/gpu/drm/xe/xe_userptr.c
@@ -390,6 +390,7 @@ int xe_userptr_setup(struct xe_userptr_vma *uvma, unsigned long start,
 		     unsigned long range)
 {
 	struct xe_userptr *userptr = &uvma->userptr;
+	struct xe_vm *vm = xe_vma_vm(&uvma->vma);
 	int err;
 
 	INIT_LIST_HEAD(&userptr->invalidate_link);
@@ -402,6 +403,7 @@ int xe_userptr_setup(struct xe_userptr_vma *uvma, unsigned long start,
 		return err;
 
 	userptr->pages.notifier_seq = LONG_MAX;
+	userptr->pages.drm = &vm->xe->drm;
 
 	return 0;
 }
diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
index 251a7266a73..842353afb27 100644
--- a/include/drm/drm_gpusvm.h
+++ b/include/drm/drm_gpusvm.h
@@ -129,6 +129,7 @@ struct drm_gpusvm_pages_flags {
 /**
  * struct drm_gpusvm_pages - Structure representing a GPU SVM mapped pages
  *
+ * @drm: The DRM device that owns the dma mappings
  * @dma_addr: Device address array
  * @dpagemap: The struct drm_pagemap of the device pages we're dma-mapping.
  *            Note this is assuming only one drm_pagemap per range is allowed.
@@ -138,6 +139,7 @@ struct drm_gpusvm_pages_flags {
  * @flags: Flags for the range; see &struct drm_gpusvm_pages_flags
  */
 struct drm_gpusvm_pages {
+	struct drm_device *drm;
 	struct drm_pagemap_addr *dma_addr;
 	struct drm_pagemap *dpagemap;
 	struct dma_iova_state state;
-- 
2.34.1

