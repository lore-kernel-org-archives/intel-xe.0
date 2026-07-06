Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB03C43458
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jul 2026 02:47:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04EDD10E717;
	Mon,  6 Jul 2026 02:47:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FkrAo+91";
	dkim-atps=neutral
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010014.outbound.protection.outlook.com
 [52.101.193.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AE0A10E716
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Jul 2026 02:47:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nj5AiKqckMYuR+83hLbriFdoPhTPB6OHNjoGCFzA6TUf1L4eW8LGgWeI4Z8pgLVljYNvDgNtDtPbv/QMOHXHu/zC5rsKosNu/31LiCH/trFQoMpU1zk6+AOw9P9F9WQMHJoe+rDXYSFWA+hA8gv6mpwjqnHCxbcftBbqmGAJ3fXx1Y4Xf9sXJxMgUHxKD1QF7MleTy71TTiEUJJ+F8tUFOap3rCE9dXbUF/0dg4TdDHG0Hq7o9Y3WukxaFYL1/L2SLWGZM0SnlR9R8uThhJgDMFzA2wqvcdm7sGsV7aahpZpkUtUzCAloTiI0A7OJkTy6ULVGoIdTgRvt+hH3UJKQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ngbR43pKY8YTZJlF1LsFcIm3cpyWyFPxSk095iCe8zk=;
 b=gJVKcWt0kiEr13hTQ2WCuerKYbzGqxe8dWGCTrPSmPzIsvV2IGLwvon1GFH5EdGvcNxIx2ho0C+tE51PNnE3ybf7YTKPnEK59DkArOSpjWCECKsspXee6I9PIzxVN1kAZcpbtto1JvYLmSZw5eJoSmyAgXu22eyVhIdUwUFaRZBcYpiShY5AVMLj10D4WsG/wFcekleokVMlwIb3ZViVRdrEbI9NWNuouxr6SpaxM8Vi7mM7R8cv9YIEpFlXZhb3+D9CqxJids1WITkXwC20y9YkGSxon/Jw8iWkDjB6W7stSvxOWjHDNZaZklp26Cy8CyjY0Rej7geq1xnIYv2hcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ngbR43pKY8YTZJlF1LsFcIm3cpyWyFPxSk095iCe8zk=;
 b=FkrAo+91PmYzKBcLKOR6KZ0r7sh8vjWWPYejai4O/zQhmcyyfpFPCPuNXO2jYOaGSTAj4Yq0QRL41mjbu6EF+OdjqsCZWfPIYJqjzdQVU8JscdRL5KjNOCCeDYdeMhJr7QV0PWO3ZD9nsWF8bnijakI1XrTsTU/dBdLl4Sc28Rc=
Received: from CH0PR03CA0344.namprd03.prod.outlook.com (2603:10b6:610:11a::35)
 by PH7PR12MB7872.namprd12.prod.outlook.com (2603:10b6:510:27c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Mon, 6 Jul
 2026 02:46:59 +0000
Received: from DS3PEPF0000C37A.namprd04.prod.outlook.com
 (2603:10b6:610:11a:cafe::1d) by CH0PR03CA0344.outlook.office365.com
 (2603:10b6:610:11a::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.13 via Frontend Transport; Mon, 6
 Jul 2026 02:46:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF0000C37A.mail.protection.outlook.com (10.167.23.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 6 Jul 2026 02:46:58 +0000
Received: from honglei-remote.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Sun, 5 Jul
 2026 21:46:57 -0500
From: Honglei Huang <honghuan@amd.com>
To: <intel-xe@lists.freedesktop.org>
CC: <honghuan@amd.com>
Subject: [PATCH v4 2/3] drm/gpusvm: do not route system pages to
 device_unmap() on IOVA unmap
Date: Mon, 6 Jul 2026 10:46:41 +0800
Message-ID: <20260706024642.614238-3-honghuan@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260706024642.614238-1-honghuan@amd.com>
References: <20260706024642.614238-1-honghuan@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37A:EE_|PH7PR12MB7872:EE_
X-MS-Office365-Filtering-Correlation-Id: 8144b37b-73d7-43c9-b978-08dedb08d987
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|82310400026|1800799024|36860700016|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: /8pU+wfXfts2ofnhqytIBaYqsE/iO6JATLJd37UQuWA3SIx7bV3lMVRwrxiMG8Iz3fCpGe5zy+QgPgcVBOI0ixH9f/cmDStWoHtUrZt3JJ/YgVIbXkRSbnkI6haLNVVZz+Y+0cv/1wXicdd9sWG/UB9Z7qzsQSSISt/N+E0GVXQQdslqUikp/2FBh6cIQpY7QcwzIOYBHj8DiYUytb6iWLjQd7T8S9DXwD8LUFHMcFQ93d0PSVuUC0znAyO4xpABP6tAy49QvA8FaufvPS6slxi1NqmM0sRlEVT4lSOArRonJj84AAs9YB2vUuui8n+IhKmMpP4Z6bC3MzbOuPH6k07uoXOLBJo9HhzbHEgDh1XHSKmavyVrqFmHSHOADFN4pi6bIL2Z/uU+2EUbeLm5dUcUoOnJLaat0jAGTDxvyLWz2roXFqFWJCE62oW5ljESzyTDk2E3yaFyQBQRUuizqb0M9uuAQ09/QEs87qg/nXK6V/R2vbufwdLsNnUgRuhqN641cXJ+A5NroXxHHU/iNyEB7bdpFme+8r0SV/sib2dBhTElYlAwLvWIZoRRnENIiYuLnMAV8DDG/C/2CdBmE7pNIY/cjqsP4CWGA9vZqQBNBOUeFSzBakHZP1dNXHMR+Dhyc8pxxO7Gtz6RRQQTzscOMV7vBWLHwlqP//b1Yg442bugxjDUwmMSYU+fHkFoBwrC25GKqkDWnYzRMVJxCQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(82310400026)(1800799024)(36860700016)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: lCVSwmYX0EFUqijsqvXll/EWv6+D8JFfpvpPIxEbor/2tqfXL2ncTYW5UG0I7act/21TfHiBWjw6T9I3pSzGTX33i5umpcYwzEwH6DHk4u16ia+wKIRmPMARHwAo5rbGdTFqLtgXCm0+q6moWyft4TpmX4wCE7G7uXUFcX1H9kOXRC47byS3dJDE54Z+n6FyeAo0T/zFsuyL7NgMh695LFhPhT/tcE+i2J32F4his5CjANsEIj4kbIvV2zn4oJgx7PPlhzrGtclE2sZ1C2A78STL5b0S8f6gUR8QZFUPReeH4tel6XI7zxusKbivu39X4dSRjqZGqcBx0l566M+dagk+jdTrrrEL4U/fnk/sMUm6THigpYGoAqduqs6ECj04K6g2NfX6+MmjiiVBm9rit9NNnI0iUIVfdYgFppKAEV4ZLob09PwjscD6FDuWxCdx
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 02:46:58.8276 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8144b37b-73d7-43c9-b978-08dedb08d987
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C37A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7872
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

In a mixed range: ctx->allow_mixed dpagemap is not NULL while some entries
are system pages. The unmap loop used:

        dma_unmap_page(...);
    else if (dpagemap && dpagemap->ops->device_unmap)
        dpagemap->ops->device_unmap(...);

When use_iova is true the first condition is false for system pages,
so they fall through to device_unmap() and a system DMA address is
handed to the device specific unmap callback, risking invalid accesses
or state corruption.

Key the branch off addr->proto instead: system pages only need an explicit
dma_unmap_page() in the non IOVA case, IOVA system pages are already torn
down by the single dma_iova_destroy(), and only genuine device pages
reach device_unmap().

This issue was found by Sashiko AI review.

Fixes: 37ad039fb367 ("drm/gpusvm: Use dma-map IOVA alloc, link, and sync API in GPU SVM")
Cc: stable@vger.kernel.org
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Honglei Huang <honghuan@amd.com>
---
 drivers/gpu/drm/drm_gpusvm.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index 3145d55cd86..44bb19658dd 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -1163,12 +1163,18 @@ static void __drm_gpusvm_unmap_pages(struct drm_gpusvm *gpusvm,
 		for (i = 0, j = 0; i < npages; j++) {
 			struct drm_pagemap_addr *addr = &svm_pages->dma_addr[j];
 
-			if (!use_iova && addr->proto == DRM_INTERCONNECT_SYSTEM)
-				dma_unmap_page(dev,
-					       addr->addr,
-					       PAGE_SIZE << addr->order,
-					       addr->dir);
-			else if (dpagemap && dpagemap->ops->device_unmap)
+			if (addr->proto == DRM_INTERCONNECT_SYSTEM) {
+				/*
+				 * Linked IOVA pages were already torn down by
+				 * the dma_iova_unlink()/dma_iova_free() above;
+				 * only the non-IOVA mappings need unmap here.
+				 */
+				if (!use_iova)
+					dma_unmap_page(dev,
+						       addr->addr,
+						       PAGE_SIZE << addr->order,
+						       addr->dir);
+			} else if (dpagemap && dpagemap->ops->device_unmap)
 				dpagemap->ops->device_unmap(dpagemap,
 							    dev, addr);
 			i += 1 << addr->order;
-- 
2.34.1

