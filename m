Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CBCED1489F
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 05:38:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9E2110E691;
	Thu,  8 Jan 2026 05:38:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gsluZkrw";
	dkim-atps=neutral
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012050.outbound.protection.outlook.com [52.101.48.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71DFD10E691
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 05:38:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tk9ytsiKz360urrokqGehR4iy5AzhVl3R16kRD8T53cVIiZ0nRK8cwhWlmzZZq/2bokCasvfh4dl7JaDaXLykrtOJ/HOMUDvdQK6B2lVNcqZQZ1TLO2a7LGn+VWpprktgnqnYbs3ZmKbMrIjQIli7IkLE+3Q4ufglxxzQkl8r8jlKK1GmQBbZ6CimTBB+nIXhc0Xav7h3dp9LPGKkHtMTVhaEbfy16Ny5Fi198ZyWTYTXjipS2LJJgeRt/qhyg4tbg+4waUOjSaPOyQUCQ8lvF5eG2q6VxK/noRUgAB75ZSIpa/3En9jHX4iUBTRh/91NOTz5rzY+5QxJTNX4cviaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RiPfsVeSco4+tw9MLR3a6AO8th+OP5bcrFN+x/BIKr4=;
 b=XfsQ0KZXwzQHHeK6IuTQIkIEp3wTjB1oRCtMZWMywYWnAKTCrktaSMus5SYk/YoYP4iX86aqzaNGkZ0IcRzw3b1FQDWocLq2Fc59OgK1U4MJgWWvsl8RoJztCHiywypi3Ojgjgrlt9kBblD0l6erKCHngg/bkq3Rc+OPifPBGPEthcqA2YL+6JYnTYmt2TLCKs97Eis8t1pC8CuLZZsNSQ+m7/8+s4iaMbbzoYj/h7LuKALW7Qfl4yfenXziSII8wB5C/4NUMAuN1Td/sdq3g2Lw0HpEfA++k3EuDD2LXg7XIJw3L7IOnNMZg5G3S92LvcVd+CIe7TK7vYY4R9+iig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RiPfsVeSco4+tw9MLR3a6AO8th+OP5bcrFN+x/BIKr4=;
 b=gsluZkrwN3UNhL0x1hqyEwGsK4FAYcjCemEqyuaAH1ty0it1ywPR0bWXU7n2y2xfOTtvtTQAk6GyvgIod8bi7dZnSf8msIf5ToG0iRuUM7TowSJS3ceJdLAvm8l4rIiCuyNd1mRfvSOkrLAFs89A0izu3eM2Jb5GauqcMaJ3PRnUbfPZYDrmlyF5+E8yOPwhgTHTGFx9seIuXwq2/d+JKzWFw4+6JlvKnD9egiSpAQUx+GaWi26nJoamw+q1A9kLCJYRa2uKpzisIGHt5I8kOtIofikwDvWamU8a9ZlIu3bD5zSCEEw3GW0o7nagk6ReL2RrXXYCDaxp1h6OlURevw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 LV8PR12MB9451.namprd12.prod.outlook.com (2603:10b6:408:206::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 05:38:04 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 05:38:04 +0000
From: Jordan Niethe <jniethe@nvidia.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [RESEND v2 02/11] drm/amdkfd: Use migrate pfns internally
Date: Thu,  8 Jan 2026 16:37:32 +1100
Message-Id: <20260108053741.38802-3-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108053741.38802-1-jniethe@nvidia.com>
References: <20260108053741.38802-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0087.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::28) To DM4PR12MB9072.namprd12.prod.outlook.com
 (2603:10b6:8:be::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|LV8PR12MB9451:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c32ab87-0f04-41e9-a63f-08de4e78183c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?v7jOWLU/3Tcqxa/Udy3+d1DFw2JAtzJfW9E/N7R5L1VQn6Z0+uUcoutvMdbt?=
 =?us-ascii?Q?nHBP1u5aSeG8yIARR5axiEg/LcddnVGlKS64rR7GoZDC2asXOEmrAZYebBhO?=
 =?us-ascii?Q?oM7VVaSqPs/E5XmazYMOIhU5HPsVACbrQzkj3O1qV6PGoOE2G7OCoDJtxWUJ?=
 =?us-ascii?Q?04e3xVJJyEg0yAiRFUzXU8abPZBP6SaT/Rfy98rVXR+Jl846XjNT3BaTudNu?=
 =?us-ascii?Q?lcYY0plAhc0JncbsZQwpmIeti/KxU7u7rOJJpAZMIadPAfPLA5R3TWo7ojDK?=
 =?us-ascii?Q?9NdBAN6Hp3WUoqKzirm3wmjBBogGPXsquetvabuIlf9bF+pBjNiKYC4gv6U1?=
 =?us-ascii?Q?wM6nepluSg3Wr/VSvNA87rLuhCqZxFyg/QxQbqfaxv1HEIttmTIZXywWbZFu?=
 =?us-ascii?Q?GcS5TYx9NHBJVnezkShFzjQrlB3wL89iorMjRHvWYBLg3U64mYihjsFPgs+1?=
 =?us-ascii?Q?4Ts8iaaOJc5U26HK91DxZPG8r5tmi8By6eaCQ5jXGr8pOrZ2GwRxAPCy96jj?=
 =?us-ascii?Q?5Bgfb6BP8Df9geHvfxAQE9M9QnBZ4Usc81K8px0t8RCMksOtsJ3mQeRD/gFM?=
 =?us-ascii?Q?9ioS4yALYfL5kdL3mIZJHrrEqSskYAOTVMJI3AblGaz7uKz7B6C60ZV/Xy2K?=
 =?us-ascii?Q?0Plc6xRSR8Vk+Aiqo4wCxtNek6RYxanuoa8bDSYUH18o6uHWKqpSDJmqhFMd?=
 =?us-ascii?Q?OFNfPblvgunV4Sl0wAtnTA845h4GEa96WUA6AUpcnOuGROlPtA28G2Y7VO7R?=
 =?us-ascii?Q?PNJpTS/JpomkULLtHT8bnXwIYRm86sZ18ehnIlV8dVdPmm3kG72vw37rhCir?=
 =?us-ascii?Q?EQLI4paa1AeqZXhcx41RQbo5quQM9RnyqUhU/rI0O47NWiYML3ydM4NF2xTs?=
 =?us-ascii?Q?S30VVfYZxKjSOH5OnYBJw+v5fVMvwpnwpyACuR+QUA/1IKyupUfMrpuPIRFU?=
 =?us-ascii?Q?l/zpY5PqWoz4F6SAuJ+VX+4amcujhyJwFYmTOiVMDBlbyFvLC6UEgoVgxZCk?=
 =?us-ascii?Q?02Hp+57uXJknWl6+WBkx+M01Ls1Qe3g+6cssaVua49PRHRTd21ch8tiY817B?=
 =?us-ascii?Q?NM7bocFhrfmuUd2pCj4WrYvEuhPjvc8OlIjtiHN3r9ZY2w82KeoXOi5Mu9IZ?=
 =?us-ascii?Q?dP8S5AS1IwMuqTV6Qnd370aMAF8oqY6mPR0Z3BY4cGNMWc+SZ7NM1V9n+68D?=
 =?us-ascii?Q?6xwMisUZvhbEguK4BXj2BL9JD+TjFJXu/CjMvXAGpnqSg5e+Cbq64m2P07TW?=
 =?us-ascii?Q?7m79Gvsj+zIv8geByM4ULVzyd2Lxn1iGzW3P+z4ChWvWKcmtrQ4brwAmJReW?=
 =?us-ascii?Q?T4sP8xW3K0L2mGsQnG6G3Ii15uqTbIQSkhwowRsLv9HiVbDiWZCjdLeaXz+f?=
 =?us-ascii?Q?vuPFKYLhaMe+zZEDChSppm6GJmxP4YHiwt9kNWJHoTu7dYkxxftU//Qui6Te?=
 =?us-ascii?Q?i3kL3MXQSZYH+9szG83eGf4zLKDy97WW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB9072.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?v/b80B7dxdZ1fF92hr6RdSXfxsZWyNY70hWmGO49u4iqoG4fx9HwgBspLXWl?=
 =?us-ascii?Q?tdePw8bd2vhqCsVoCkioA74xkYVIi/KhDlt1b353rGhSbZSoFSxHlDEu+1VE?=
 =?us-ascii?Q?o+vWHO46Q3F6s3kVgCziygKty6A+wG7YDBabbGB1l3PEpjG98XwfZSfFRqBq?=
 =?us-ascii?Q?5GQqueotU8eJuXM+JqIOKOJIvVB5LTbP8r9DPs64/+Yk89xd4fWOlj9Zr18k?=
 =?us-ascii?Q?OxnR69yZg5yzANK+P7EJ7syfleSHbqBh6Z7mQYvuP3DUYh6Nq+63AItcZu17?=
 =?us-ascii?Q?eISCQEJgkfDYISjhrj17VI2z7HDAeKVatW4d/z42RGQ5G5BkiWvAhg1iDBTj?=
 =?us-ascii?Q?oYRt0TGblsgi5/rEDs4knrPR+tuCLy4yGZj8xn8Crzb3nOJpYn0DNlJeoq0H?=
 =?us-ascii?Q?/exqBteOnAIthvHtinewh7OyEdnBsl2ubCX8XuPWCyQhB7K4IXdpnk6ebYzk?=
 =?us-ascii?Q?Gc/5bVztZDibZmI/nojyI2LUoFKnFQaWEsTiLlWEjngHBOTecRJZnl9390wc?=
 =?us-ascii?Q?/+FyAzY2MzFZ7wn5GALRCs3boIYX0hCE+xU0xIwDDXm6zbZTu5iE8wfGRvDm?=
 =?us-ascii?Q?/yAZhlTuSE8qqnMdWmtrWrMHbGN+d1hyCkzPyCgCDrJaB+o4oqNKlPTX68qJ?=
 =?us-ascii?Q?mnTalf/yyEFq36og7zJJY4V/ttXhtufAYyEkeh+aXZMMMxbLAnXYQDoToP8J?=
 =?us-ascii?Q?Dg33F+a9dvWkA1t8GdO6ZCF1ZJ8klw9EBc0zTcyheUIH5XRrpvZ5hl0GQuuz?=
 =?us-ascii?Q?nP/D1AKK8K2n3JA12oG/vxaAVtY/TC7G4CAXJqcse9AeS+bdwX4TqM6PXuA3?=
 =?us-ascii?Q?b3obGrnnmT5OtNShiDVp0/mLKnz6V8Sxmjj4D9qXiq6ERQOknlZ9hUW9W99V?=
 =?us-ascii?Q?jdhjL39HpdQ+BxebD1ID6yl6+J64rH3BGjhEOaZD1FBXjow3mEWxVlLGTNPZ?=
 =?us-ascii?Q?mq8hXrS6SwwzuhI2DxWYHV3y2YoHPSXyCuF7Z5UMOF5YmvNHkfGJZXy8MPIE?=
 =?us-ascii?Q?uPWwBOAAySVqIvGyLSj7H6SyQ1fFC7ISaRfVxsahxPqwk+TeBQjB1RUlWwL4?=
 =?us-ascii?Q?ehgpKbiMmRXmknEnsRvMDgd1ILlFxVb8x/hzxttIsLYNGyyOfaCSYh2IYH+B?=
 =?us-ascii?Q?mNTBayrvB8mz3odOW0AID9WH0DJsH64cSUxzgqk+eANUvdT2hU0AMLxdwSO7?=
 =?us-ascii?Q?knzlPcjW8n25eO7nXs7qoHDaa3UTOeoyCGIED22WCbu2xv8yLF1fNuOhfoAe?=
 =?us-ascii?Q?qSqjNSD8oET2lD6/znVblEveX4hskRYc5TAOUQatkiIQT1Hu78V+UM3a5Dyg?=
 =?us-ascii?Q?J2f1kLZNs0phZkTNB4vk6+m6WxVoNk/hRJqqwEahHL6R2uwy863IpT682igd?=
 =?us-ascii?Q?cUhzGeeUFfAjg5HsviIUvcvkdrdqahI/BwT3IclC+9IKma7ayj8iLNdc98sB?=
 =?us-ascii?Q?c72vRUowW8TRwmPoi/VxAnkEV+IeTpKe7wqOzq8xnjl1OG6T6G0IQQGMS8wC?=
 =?us-ascii?Q?J6/+1yT5yvHUMobB1pz0q9fHWn2F4n5y8F8hPjctNAJD/umxbzK6DWenTHen?=
 =?us-ascii?Q?twXkcHR79VTt9TH/WivrWa7r2r8IeGhiqgXTKeK7ATXHQ6td1Q/8QhGww3oc?=
 =?us-ascii?Q?/wCMfNO0fz1VmxXL5JAAAb9360I38sQ5wMbbqBT7OYv/RKW1gu7jggPcIuz/?=
 =?us-ascii?Q?ig9wymUNWclwXZVU/l/cJ4i1FMmhqNrYC85PnNIGn9+XrZubUqkzLAh1dyFO?=
 =?us-ascii?Q?lK9q4dIDOQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c32ab87-0f04-41e9-a63f-08de4e78183c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 05:38:04.5045 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RfL93nWKpsdfo2AxRJFb/yvAyaS/mFlnvpO81nqLij1tpv9z/6KfXflgZ77MJ6dhLumjSHziyFN+DMoqYHFCAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9451
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
address space. This will mean that device private pages no longer have a
pfn.

A MIGRATE_PFN flag will be introduced that distinguishes between mpfns
that contain a pfn vs an offset into device private memory.

Replace usages of pfns and page_to_pfn() to mpfns and
migrate_pfn_to_page() to prepare for handling this distinction. This
will assist in continuing to use the same code paths for both
MEMORY_DEVICE_PRIVATE and MEMORY_DEVICE_COHERENT devices.

Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
---
v2:
  - New to series
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 15 +++++++--------
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h |  2 +-
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index ca552c34ece2..c493b19268cc 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -204,17 +204,17 @@ svm_migrate_copy_done(struct amdgpu_device *adev, struct dma_fence *mfence)
 }
 
 unsigned long
-svm_migrate_addr_to_pfn(struct amdgpu_device *adev, unsigned long addr)
+svm_migrate_addr_to_mpfn(struct amdgpu_device *adev, unsigned long addr)
 {
-	return (addr + adev->kfd.pgmap.range.start) >> PAGE_SHIFT;
+	return migrate_pfn((addr + adev->kfd.pgmap.range.start) >> PAGE_SHIFT);
 }
 
 static void
-svm_migrate_get_vram_page(struct svm_range *prange, unsigned long pfn)
+svm_migrate_get_vram_page(struct svm_range *prange, unsigned long mpfn)
 {
 	struct page *page;
 
-	page = pfn_to_page(pfn);
+	page = migrate_pfn_to_page(mpfn);
 	svm_range_bo_ref(prange->svm_bo);
 	page->zone_device_data = prange->svm_bo;
 	zone_device_page_init(page, 0);
@@ -225,7 +225,7 @@ svm_migrate_put_vram_page(struct amdgpu_device *adev, unsigned long addr)
 {
 	struct page *page;
 
-	page = pfn_to_page(svm_migrate_addr_to_pfn(adev, addr));
+	page = migrate_pfn_to_page(svm_migrate_addr_to_mpfn(adev, addr));
 	unlock_page(page);
 	put_page(page);
 }
@@ -235,7 +235,7 @@ svm_migrate_addr(struct amdgpu_device *adev, struct page *page)
 {
 	unsigned long addr;
 
-	addr = page_to_pfn(page) << PAGE_SHIFT;
+	addr = (migrate_pfn_from_page(page) >> MIGRATE_PFN_SHIFT) << PAGE_SHIFT;
 	return (addr - adev->kfd.pgmap.range.start);
 }
 
@@ -301,9 +301,8 @@ svm_migrate_copy_to_vram(struct kfd_node *node, struct svm_range *prange,
 
 		if (migrate->src[i] & MIGRATE_PFN_MIGRATE) {
 			dst[i] = cursor.start + (j << PAGE_SHIFT);
-			migrate->dst[i] = svm_migrate_addr_to_pfn(adev, dst[i]);
+			migrate->dst[i] = svm_migrate_addr_to_mpfn(adev, dst[i]);
 			svm_migrate_get_vram_page(prange, migrate->dst[i]);
-			migrate->dst[i] = migrate_pfn(migrate->dst[i]);
 			mpages++;
 		}
 		spage = migrate_pfn_to_page(migrate->src[i]);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
index 2b7fd442d29c..a80b72abe1e0 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
@@ -48,7 +48,7 @@ int svm_migrate_vram_to_ram(struct svm_range *prange, struct mm_struct *mm,
 			    uint32_t trigger, struct page *fault_page);
 
 unsigned long
-svm_migrate_addr_to_pfn(struct amdgpu_device *adev, unsigned long addr);
+svm_migrate_addr_to_mpfn(struct amdgpu_device *adev, unsigned long addr);
 
 #endif /* IS_ENABLED(CONFIG_HSA_AMD_SVM) */
 
-- 
2.34.1

