Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 610E4D1489F
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 06:01:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 295B510E695;
	Thu,  8 Jan 2026 06:01:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ouoLVdHL";
	dkim-atps=neutral
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012033.outbound.protection.outlook.com [52.101.43.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3941710E695
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 06:01:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QmFzUly5EP+mo6O1XVtpmK7PDvwpCk5wZLMaMZV7wmpXh7jlp4vP+Fs22cvaNs4/mht/9InvSbpJQQzvFbL+Pb1k+K/5lNYMzqr1BfLGU+muicrUWrUfY0wZbkzrhtXQxG+AKmMXaEKi6xVCyaRF2k7clOK2LTBDXOUegODEX/dlTUqpaSEBAk08kUobTkmbQM5f7OmZgcJ5Qgv+HAfcqSuPQYFmB3sV89klmBT64lql0Oh+dcTjMGtuKuxVsI76SI6xnn0AZXxAb81Yr7/nSchPYDgmaB+Qdngac2CyJS+uLnL9lZcFBHz3AWncNd5DjtJOH0NIj9Ygcbed/VX6Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1SH2kgtFVCCJAcYAomao+D5Xm2DXWgQiA7Psvu1PSLA=;
 b=xJPJsRRUX9PYdkDzPaI/CW0B0zVjCP2jMPDXSH5QDjye3RribFWFxYOpTZ7/UJKmFVDJCpfT1k0JuuLiNbZfbdcBrLp2reW3O/zu/Mazuly1fx6lTSHK0oJnKkHDTDdk3i2HEGD3tzRiajhhcCEnUI+jbtPmqKYpkRrq1Tci6OugbNqpAEWbSbRV1uVP3hFftP2/FbO5sXNSWW6LkWatfly0VlU/9LqSl+IyQtThkUmvRPHnLTKTODnulbrK47zikpdx5wVoK2kvQHyemORH/uSHk5QW/KcrshjAETjki3tZ+8NLoAgTE6sUIQ0bXuERTNf1HnS3DDY+T7x+Lgh/uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1SH2kgtFVCCJAcYAomao+D5Xm2DXWgQiA7Psvu1PSLA=;
 b=ouoLVdHL9BLd/zu3s4LXkl4o4DdAr+TKzv9YyU3kHBXgwKrw8QKRrtf3yL5TYUH8++P0Ga43W6PbaR4g4mRFnxsrxogZ+93Ju6dWHuT/e9C2vJbFzwjZPdVmLpHrua8UnrlMbPLIaQ6zUIYEIE6NrBKfyTppUW3YqfRGnhxYqO5T8U0IBPM8+zrsnWO2WXU3oB5bewCz09/wHUV67bglMKUBy39/0l4XePbE46DKxU6Wil7m6JD8v/Qk/eqDxUHFQPUaz+MSts8FA3D71TwCVd5ZCOap2BF4u5BU4Wbkf7ozkcngBrqyE9NEGssYJs8XN51VYcf5Gggg0lP04YmFNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 BL3PR12MB6618.namprd12.prod.outlook.com (2603:10b6:208:38d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Thu, 8 Jan
 2026 06:01:21 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 06:01:21 +0000
From: Jordan Niethe <jniethe@nvidia.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [RESENDv2 v2 04/11] mm/migrate_device: Add migrate PFN flag to track
 device private pages
Date: Thu,  8 Jan 2026 17:00:55 +1100
Message-Id: <20260108060102.41357-5-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108060102.41357-1-jniethe@nvidia.com>
References: <20260108060102.41357-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0013.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::18) To DM4PR12MB9072.namprd12.prod.outlook.com
 (2603:10b6:8:be::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|BL3PR12MB6618:EE_
X-MS-Office365-Filtering-Correlation-Id: 15ac6f86-465f-4701-ff85-08de4e7b58c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4dRGmBX+7gWDjIGI6Q/ygNrAiTx2+L8AizF7nVHLLTLZLkVnGu1IrYmvtoca?=
 =?us-ascii?Q?S9SoS12WLq+7azJ5IqAvPCrFUObwRnvFFnDLJTHVlQZUimNuv0G+CQmDs7fg?=
 =?us-ascii?Q?YiGCjcnhIsv8Mz5GnOqzLllK9bbosqQTLpK/QZdObMSsyk/3HXxmpVLrumky?=
 =?us-ascii?Q?LhJ8bqFH6LyItCUuY+7OyQQoLio8YJm1NICjk5CXuAwgZf3MxF1I9lqjrn52?=
 =?us-ascii?Q?78aJhp5Hkb5jPCaSAUxlzMidewn1zQRWXNwVS/jPtrzGSE0ak0kIfCiqnDAs?=
 =?us-ascii?Q?tBDPFnMf4gEGtQ/aaQG6DI26YUaIPhhsggTS278Sw98BTPY5SgaTc0gzNt+2?=
 =?us-ascii?Q?guxnvN8a0ms5IsWcu96ztekheLJtgU1MAct0o3DfdSOnq6XWJeZPzQV6IB2U?=
 =?us-ascii?Q?dElJilIyPLHCnkz1pHkEJjL81fSw1gnofKJjYEES6YEEMIvAe2SY3NeyK7Kw?=
 =?us-ascii?Q?ryPopYcYpagAkRZ4C55S+Q8JkdjGA/DfVRs/R76bvxI1kKAfVPzcsEhlJOmX?=
 =?us-ascii?Q?x71RfXcSfeH37rDAeI41yx4NPXXf0CxxTgRVe2q3TaRLFx5yh8tyqkSFF8Nc?=
 =?us-ascii?Q?+9F63wHswx535CNJt/EQhkX0CJmoMq5I/pisOaproRMHvoZQoPXMXZfhLnVD?=
 =?us-ascii?Q?sBeBiv3XzFRg7UCkOmyTS1dpMdriVovSotWfC+JmTKJ2kSfKGuRXCj8pkDVx?=
 =?us-ascii?Q?6JUt8ryLITlq7kWP6KumRFgJ9bdwDYPeginxH32KKYH11xfjRnAXONYx7ixu?=
 =?us-ascii?Q?CaLw8SGvuNnHL3KnnTwoW3kcAzWidAgJRO7q19vIEiXwdrUb2S8O2Br7Ypt2?=
 =?us-ascii?Q?paUg4QooT6TEGIvw5f6TOC443ObaOsafSjx+Dt0S977t+EGkEl8WaKYoM6NC?=
 =?us-ascii?Q?5+rSJCp4OgUGJ8Jjon6Or1gSNbcjbURXkgk0KohqaeFQcEATyMPgfINrwcBN?=
 =?us-ascii?Q?9ahcfBAqLQPZK9lqH5qUPn9SC2/NYmXU4LR4DvYzUDD5d6Rh6nae/5MsZmep?=
 =?us-ascii?Q?Elg+Wy6ZJ/hWxe7nUdAI7wOMB6WQXCRZ2CLzfeylfKwG2AKZkWK6t/y17RfQ?=
 =?us-ascii?Q?oYV4DbNEFcKAD1UATRdSdM3eoLwROEuAZArsJykaJkyhd1L59OHtzIKkLtYB?=
 =?us-ascii?Q?jsHX3rz18Obqb/E9wXGzvGNFy/Q7lNL/wROl4X4gUZfOxGb91Jk3fnRq9bEh?=
 =?us-ascii?Q?Ibxi7WoeQfzenn13wVIN9qtLiSQo/n084WWzwHfdw2L95Y/hMG1BJODo5trD?=
 =?us-ascii?Q?VmlJNDKNndR/PgF+2nmQurC7FtQ5zEa0nEM0KHIYh2yT6lotQZ77ex1ItFQy?=
 =?us-ascii?Q?4HFSTF8jw2XgrVypHktKGxHL9nH/8Rfij4CdRUY02bQeGUFnyK7B1vy/DI8a?=
 =?us-ascii?Q?OMMr6SgsEW7FI3x8JrsZmF66Un3RkSIDywTuHTrm/xVK3lbpmWvwI+zxejWc?=
 =?us-ascii?Q?8kSMecCMA1QVaeqVb6y4DyJ3iKpaCQG5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB9072.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fKv5ePuXnJNZARd1TA28HaYijVdpuwh/1O/WZH1AXkVia6Wp3g1mqzeZ/hgr?=
 =?us-ascii?Q?3xWvUDUvu73fkIjvX32oaaVW6aPDOgN+8MHZ9xDH/kOIMc4Z4S/EO8oGMMfF?=
 =?us-ascii?Q?pcWEp6AKZ9NBtYzAskux28wTYwoTL8ErIyVwO6FZNq/IDuoUIceffmcN9R4V?=
 =?us-ascii?Q?ZMwk9im4MyHRmnFk34M9mZsY7zuVcfAowBfiDvmUvVwogmaX9HG8BP1NM4R1?=
 =?us-ascii?Q?x5jjAMDwQKUv03ynVK6Xbe1da7/Q7zhOe7b+Z3iYXfViPmbntG3H9yxcJgBZ?=
 =?us-ascii?Q?RpBZZIH30EpqLy++Q+oqnyRMDPtyuxTv1eAFFQFBOl7y42GUjKT0Z/P7GzIw?=
 =?us-ascii?Q?MnwZlZlkaOdsVSWnkJQ8PZXGsPt3lMciKgWSy5Gc7oOVhuakYfmh9oxqCiNi?=
 =?us-ascii?Q?QwynBJIo+d3/dwuKQqQefE+AdcB+r7dU0faZULYW7spL0APE/5Ci3EfNJx11?=
 =?us-ascii?Q?FddfjXP9H3bkYiAqYcKEgvAIjo8B6B8AZwH1hapknSu1f9OATlYPL9yv3vV0?=
 =?us-ascii?Q?vp6ACmJqGsEVAW4IQzHh1gt2KqLSsDEI7JgjmfJBsDSzzRKOaTc0gGINkINA?=
 =?us-ascii?Q?LrP2A+REZt8hceijAwZK/CUVXPyz6cZtvo8Xo5KAV7Qz5RbgyXfsB0Eb7MdM?=
 =?us-ascii?Q?sovZM7vgskQZugc+ar6maZKE0R0ugoEaDr/3dlJrdr5BFMY6/ZmK2FOfQUf8?=
 =?us-ascii?Q?q5o55Vn7wX7v+qCayPaTqsSbvQxT08IjEUDm/JA1imC7fKLA0+YsmDp4mTKq?=
 =?us-ascii?Q?8yDPqAPGtqX0Pp0SglbkUuLwgXI/PnOHFr5u0QlNjQmJz4VylSIvBeuHRiqA?=
 =?us-ascii?Q?i2QL+cTDjsfDFemAGPAJlDa/b7WN5DkQZD7LJOZ3PVPnnWEKhT9anzzd87Qs?=
 =?us-ascii?Q?HKf63IDzLiIdAQ/8XqjgnQ8C8iz48YsmzzFtJOcO04uxwj3j7haPJ6UTYuwL?=
 =?us-ascii?Q?1Beij0slOdHlGMNCHwZO0nQ5t9P+YHR11vZouf7vRc/VrA3mK4wLiYQwBztZ?=
 =?us-ascii?Q?rHNJ1u+tdk7RFOtDAmmqFvOJXyGYxSXKAy9J4R4NvYHOzo7NUGYCRshvn7uJ?=
 =?us-ascii?Q?eUHJAy2la11BkoG5M+DMHVGauDTI5yhxwKyhtbBj27SHVEj3tGempeFzFzTo?=
 =?us-ascii?Q?s3/4y9oPvCqkpNBT/C0ZQPR65WLErnJeAamHePlV1CYLvfg4hb5nanvhwv3W?=
 =?us-ascii?Q?+SOpJLO6nTHMCo3C32xZd0QdvgNuFm7R+MWw82drvLNlC4NdoZd+SQzroD7f?=
 =?us-ascii?Q?IMs3EqoocMkeAOTcoJntLV8u5s/a7JGtaD48mlTo4oYJc2uU3xeWiOcNjRkE?=
 =?us-ascii?Q?LEeCNTJLxTZMyY5fiVYUXZzWEhzRr+5gI3gJY88M6ibEzoL9L/dvkbU+Qfkt?=
 =?us-ascii?Q?2tLW2/7eXc6B+Cupmtji5XZ8qm5PiMz32DH94NLrF6zPPkg2rgBx7JlCtzk/?=
 =?us-ascii?Q?UPUalwFWZPqmMW8R3X+rnsQ+ha3mkFXHe+921kuwhiVB75/utZHMHM8vlPAQ?=
 =?us-ascii?Q?BzTK/ZG2F6gmb7cRyqaCppE85yDbeXBA0WcYC5jAYIr2G2AALtx/mrDSxldO?=
 =?us-ascii?Q?AI1K4IPXTEgpT2Lwj3S5b9MxgrgY6U2eJUBDSjS9P1RM2SU55VSxHc6KMoGk?=
 =?us-ascii?Q?8s7qxwAYmhr0/mh1qwL/i9PdPHjWoZ5ybdRdjKiPUey886nFIOUYR7Vm/O1a?=
 =?us-ascii?Q?B9S9rm0+vTYSrWJCDeBVR3idOw5sNBTig11aw/lmtSiqoU7BFh+jU5Os9jNP?=
 =?us-ascii?Q?fML1bwMetA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15ac6f86-465f-4701-ff85-08de4e7b58c2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 06:01:21.1447 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qh5ZfMDtOWF493HHGeFi3FEF55DdOesHbuhdhSWmtyW/QZl3wPJ/NCucjA7yMLtBlURMS7cflZfZZTmpst++gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6618
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

A future change will remove device private pages from the physical
address space. This will mean that device private pages no longer have
normal PFN and must be handled separately.

Prepare for this by adding a MIGRATE_PFN_DEVICE_PRIVATE flag to indicate
that a migrate pfn contains a PFN for a device private page.

Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  7 ++++++-
 drivers/gpu/drm/nouveau/nouveau_dmem.c   |  3 ++-
 drivers/gpu/drm/xe/xe_svm.c              |  2 +-
 include/linux/migrate.h                  | 14 +++++++++-----
 lib/test_hmm.c                           |  6 +++++-
 5 files changed, 23 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index c493b19268cc..1a07a8b92e8f 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -206,7 +206,12 @@ svm_migrate_copy_done(struct amdgpu_device *adev, struct dma_fence *mfence)
 unsigned long
 svm_migrate_addr_to_mpfn(struct amdgpu_device *adev, unsigned long addr)
 {
-	return migrate_pfn((addr + adev->kfd.pgmap.range.start) >> PAGE_SHIFT);
+	unsigned long flags = 0;
+
+	if (!adev->gmc.xgmi.connected_to_cpu)
+		flags |= MIGRATE_PFN_DEVICE_PRIVATE;
+	return migrate_pfn((addr + adev->kfd.pgmap.range.start) >> PAGE_SHIFT) |
+	       flags;
 }
 
 static void
diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index bd3f7102c3f9..adfa3df5cbc5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -484,7 +484,8 @@ nouveau_dmem_evict_chunk(struct nouveau_dmem_chunk *chunk)
 	dma_info = kvcalloc(npages, sizeof(*dma_info), GFP_KERNEL | __GFP_NOFAIL);
 
 	migrate_device_range(src_pfns,
-			     migrate_pfn(chunk->pagemap.range.start >> PAGE_SHIFT),
+			     migrate_pfn(chunk->pagemap.range.start >> PAGE_SHIFT) |
+			     MIGRATE_PFN_DEVICE_PRIVATE,
 			     npages);
 
 	for (i = 0; i < npages; i++) {
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index fbf5fd284616..a8aad9e0b1fb 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -770,7 +770,7 @@ static int xe_svm_populate_devmem_mpfn(struct drm_pagemap_devmem *devmem_allocat
 		int i;
 
 		for (i = 0; i < drm_buddy_block_size(buddy, block) >> PAGE_SHIFT; ++i)
-			pfn[j++] = migrate_pfn(block_pfn + i);
+			pfn[j++] = migrate_pfn(block_pfn + i) | MIGRATE_PFN_DEVICE_PRIVATE;
 	}
 
 	return 0;
diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index d269ec1400be..5fd2ee080bc0 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -122,11 +122,12 @@ static inline int migrate_misplaced_folio(struct folio *folio, int node)
  * have enough bits to store all physical address and flags. So far we have
  * enough room for all our flags.
  */
-#define MIGRATE_PFN_VALID	(1UL << 0)
-#define MIGRATE_PFN_MIGRATE	(1UL << 1)
-#define MIGRATE_PFN_WRITE	(1UL << 3)
-#define MIGRATE_PFN_COMPOUND	(1UL << 4)
-#define MIGRATE_PFN_SHIFT	6
+#define MIGRATE_PFN_VALID		(1UL << 0)
+#define MIGRATE_PFN_MIGRATE		(1UL << 1)
+#define MIGRATE_PFN_WRITE		(1UL << 3)
+#define MIGRATE_PFN_COMPOUND		(1UL << 4)
+#define MIGRATE_PFN_DEVICE_PRIVATE	(1UL << 5)
+#define MIGRATE_PFN_SHIFT		6
 
 static inline struct page *migrate_pfn_to_page(unsigned long mpfn)
 {
@@ -142,6 +143,9 @@ static inline unsigned long migrate_pfn(unsigned long pfn)
 
 static inline unsigned long migrate_pfn_from_page(struct page *page)
 {
+	if (is_device_private_page(page))
+		return migrate_pfn(page_to_pfn(page)) |
+		       MIGRATE_PFN_DEVICE_PRIVATE;
 	return migrate_pfn(page_to_pfn(page));
 }
 
diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index a6ff292596f3..872d3846af7b 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -1385,11 +1385,15 @@ static void dmirror_device_evict_chunk(struct dmirror_chunk *chunk)
 	unsigned long *src_pfns;
 	unsigned long *dst_pfns;
 	unsigned int order = 0;
+	unsigned long flags = 0;
 
 	src_pfns = kvcalloc(npages, sizeof(*src_pfns), GFP_KERNEL | __GFP_NOFAIL);
 	dst_pfns = kvcalloc(npages, sizeof(*dst_pfns), GFP_KERNEL | __GFP_NOFAIL);
 
-	migrate_device_range(src_pfns, migrate_pfn(start_pfn), npages);
+	if (chunk->pagemap.type == MEMORY_DEVICE_PRIVATE)
+		flags |= MIGRATE_PFN_DEVICE_PRIVATE;
+
+	migrate_device_range(src_pfns, migrate_pfn(start_pfn) | flags, npages);
 	for (i = 0; i < npages; i++) {
 		struct page *dpage, *spage;
 
-- 
2.34.1

