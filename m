Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E6E8D1489F
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 06:01:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F42310E55D;
	Thu,  8 Jan 2026 06:01:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="IOmGhy8H";
	dkim-atps=neutral
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010026.outbound.protection.outlook.com [52.101.85.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAE9110E55D
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 06:01:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ygZoumO38oNiNjRWcEwdI/SuIxu3IsZ04+QFa0KQ8fYSex8ltozdrSzebwtOzcJOgR8NIGnhVFJ4eiDzqiFwbvq4M5uQbB+zHQ3r59KPvrqp1GuJhvpNnDnniLQnEOml5g4u1Gy1KIriBO/q3nLPy/ndq5NizEFWb5BkKvOSUQKkZH2JydZ6AH55z5VyW1wqtkX0lIN8z7epIfKiFmDnBBNoPoUgSLoQSToj2hsFK7QRoT/uW7tOYnoFN8p+lhzJc3XQ1e+Ps+QIErah6DdaKuYMWcSg+xDhqGhVryjcYACScyGhbDXSGPHpJhEhlTQGt0hEa6tr0r3G9crTyWjw0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oq0Bztmj62DokFQQ7dSomzjsD/Uxugx2cN58iZcmYJw=;
 b=ITv301SKNBYmsKYoMllaKqwHteCHpSCpBDPFV3r4d/8+2ywpNTHrKU+XC3LFhZN3ltwfU7I8WyEO6LSA6ZAi1LE2+lSzRIinU59pt2qala3+vCCkN6xjmnLR/OCDY3Vt3HDoDTtpyrYmrmk+MBI4mW96ZENJPd939HXkZilBBCOWGo9WilLgTn1V8EYE3bjN/asxyg89zaXwXiD66OPw4ecxlzvDvyesk313VMbI8fP3BHV4wVo7XvSJbiFkKFuuhuY4xO8Wb0XypZZnla7u4pCFB4TS3s7hvdcRwWvvuZjWHyoLeMlcLtJRV9FfIhDIfjcT3FV7ExKN/mWaSSuW/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oq0Bztmj62DokFQQ7dSomzjsD/Uxugx2cN58iZcmYJw=;
 b=IOmGhy8HC4tQd9GdPcc8Uh68WzeuQDEtzSn8DYKsjqbJO2CjMaTOaXpckMPSoDJpatDLYeP5HE4ligjq7E4Mc6X3IMr4eM5VzGiZmKV12r5EmI2NEjktbLjBPZ73BTuVWWhydpSVvxgEJRGr3DrODDpYRWBuv8u8Zsm9sM1jftrpPQ0P1wrQk6OyM1BTLlDpZaSNImjqukEDF1Gxt8ojHpVTQi0u3L9t/JTmbRM1s4PAhhoWb1xfCPRa9MExDFliRyebWNyfdIGrRcpoUEHgfrWrKUWR0Y28s9h+qxaRwPYxPnVe+WFLUOKXRRQAhlQ0MbJu5buD4EXnPGTf0MFgcQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 BL3PR12MB6618.namprd12.prod.outlook.com (2603:10b6:208:38d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Thu, 8 Jan
 2026 06:01:14 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 06:01:14 +0000
From: Jordan Niethe <jniethe@nvidia.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [RESENDv2 v2 02/11] drm/amdkfd: Use migrate pfns internally
Date: Thu,  8 Jan 2026 17:00:53 +1100
Message-Id: <20260108060102.41357-3-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108060102.41357-1-jniethe@nvidia.com>
References: <20260108060102.41357-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0122.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::7) To DM4PR12MB9072.namprd12.prod.outlook.com
 (2603:10b6:8:be::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|BL3PR12MB6618:EE_
X-MS-Office365-Filtering-Correlation-Id: 02f4f71f-0535-43f1-6c86-08de4e7b5499
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iJOq8gYFq1kaFziahPaSwB1xbFPuvRhSwQtXQY0+rsz/crSqu9d42P1fTWX8?=
 =?us-ascii?Q?fHn2pU1gb5wKk+0N68MbGwZc72wMuIc7N8u7cT9ctpgxGDVHAYJzD4N6l+rm?=
 =?us-ascii?Q?kYQ2OL8Aio+tRVzdhel7oqQH8OrJVGC8iUtxAVuxBem0gvsB2w5yvejPoesU?=
 =?us-ascii?Q?o+UcvmdmBAOuRmzhPGYadignlth3h7KBK89Ck6qYWDnWOTkJEth3MIS9szSv?=
 =?us-ascii?Q?MWvIa6qiDC+2zeed7pgfPdfTuGShYSm/6+HWas0Cu4/gP9o4x95PsUf1MVOL?=
 =?us-ascii?Q?0zA4vBnvrbMpGhK1hKXov7garjD9wS1eIrq2cMSxmm4YVa+VA1JdBJW3kQXw?=
 =?us-ascii?Q?s4NKpvgk08uF5dTDYFN6UTGxtq00yiYRXVIGWJKqXmGMdstXngfKkh/j08qE?=
 =?us-ascii?Q?NJcpkB2Tx6M9TlCkMVLgO5MWJM2HvYLPAGLKSsv81HyUSX1d7d0mD1rVBNKk?=
 =?us-ascii?Q?VXfOquSPgk6jkphUidqfBQAUBHnH/kErkbi4wIiCi0y6fYkaiFxz2Mq4HdwC?=
 =?us-ascii?Q?N481Di/1tQinu8I+HUc38yB9A/81ByZdKlsHETqWMwD1gqq4JaltdQ13N50J?=
 =?us-ascii?Q?5E2qN+TFvVS7CzUmZbdZJhEbd8GBuFdKOPhmnmmEC3zdLTdU7Ik0f2Ioo2ft?=
 =?us-ascii?Q?W5/Ex6NkMHIoHBzkHMjK75aWI2u8KOaAC9cPAZMXHgVOQUL1CyGUh5YanjSW?=
 =?us-ascii?Q?DOYTgvDZdJOx8aJWXYi242p4vKrLaq45SQEDDUnbKXGo863+UneEcVwAUbyM?=
 =?us-ascii?Q?1I+5NeXL9rUs8++4NZMypFmVpTDwlp/DsxkpBNuuhpbzJELDOIsqFKYNadMN?=
 =?us-ascii?Q?92SovOBCgaSVn4cJJgFYd/cOsSEIMk5Y6HCWLmUO1QSUndkB4pje9KFH2Ur/?=
 =?us-ascii?Q?V0sX5o+Jw79gkJ7VeHUNIzlH9kpTsD3EDtvHoiUJdRojQEzAMvFd0zbBxaaQ?=
 =?us-ascii?Q?Tj+HCFB3YD6sIhr9XUbNw2ArJNDqdTQMvcJcNcAyLDm+mJ55ybh/ZkUjisLv?=
 =?us-ascii?Q?Z72RHa0HqhzUTQS1W1niFJey37fVf0ywZYyN6633AoQq6oa4KXbdW2jaX3v8?=
 =?us-ascii?Q?0cGcEoYEApJDH7LxguEi4Atf/Whg/ESPP8txbSjh2+bGeExEu37uVCToeGHp?=
 =?us-ascii?Q?mdCYGijwpfXJ1VuubxtFRNCOEHHgG2tTkUGP42j/lcS/GJl5mDB+RJgTWEQY?=
 =?us-ascii?Q?VzMXqYlGErcYVpdXNsepKyJCKccUUOu3h/nMHODkL4Hf+VyP917mNCh+ZuqF?=
 =?us-ascii?Q?yXMwRYAtfi4ZxCi1BpKxB6PUM5BzAh8aL46lCIhW0qlEVQ+hImCatbW3FbnP?=
 =?us-ascii?Q?UR7LblS3NKfLksIwQdzapYqqMAqog3Fuxb2e1eMN9/u9SEGnlBBWAhKDqjwD?=
 =?us-ascii?Q?+OxuUnkhnrSt5coJNnLfvh4bFhyJjZ212MjGLrp0oU0Fcgj0zoG6gx33x2hD?=
 =?us-ascii?Q?Ov2+keOGwTtNCiPQce2Tv2QV+g5bMR9h?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB9072.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rgHHNgDBHsuM/T/rxhGN1x88oL6F1vrALqit+l3XT33zzfy7vMe4YTFmMC+o?=
 =?us-ascii?Q?2W/mwfCC5qWpKiABkawc+mcU3cBqA/Cr5o7Uu79C9hN9L1IM7JQZcNtfw5hq?=
 =?us-ascii?Q?SoGKLeAuJsLrmszfr4w24OhJ4dvinlIKY0oB2c87TikD814qUchf0gM/oTSQ?=
 =?us-ascii?Q?nNSbBlwK1XZTOx0neB1DQHQBxYt7MVJLbfdiu8H7TsHPuG6BO0zu2tiSYLro?=
 =?us-ascii?Q?/du8bgtLo9iURmicd8aEouwPJKjD6MHHocZIPoi+G2+mz/pElHnwVh8zBRV5?=
 =?us-ascii?Q?fll9WnnmzUQ50YcMm2DNJw6STVAGGnAN0L9BO63FGZRJyFIQwG1gaqqks4JV?=
 =?us-ascii?Q?KBR+wpU1mgwVDcyl0P2ZNkE+gZTTr2rrrJPDCzjOcMmHv0ja4Kbk4WK4abab?=
 =?us-ascii?Q?kO4Es62gU24PzjIOEFCvy+gBp+bTTolin0Tkfbx0bUBFiWSEuCIaAB8cgOmE?=
 =?us-ascii?Q?fnW8emilLKgonl+C8j5YJ0nUseCF8k1DOCarykPhOvQEPcxaIZBmaUAxysPz?=
 =?us-ascii?Q?SDsHkCve60wTTtukxLgM/aQpOwTjHJWNRncaTrlEXjV7EhiybosA1O/0Ahfh?=
 =?us-ascii?Q?o8CFEgGOSvCx8DFUJ//0adYNs0q16IRF9NuaKiQN9Kjgv00r19CCJCjRd7HM?=
 =?us-ascii?Q?haUdV0qYg2z24MaB1804S2JgZwqBzsILqImpWMJ6mNSfLaoZ+YdlYwLgXfkf?=
 =?us-ascii?Q?fBidtlvrB/90FcB7Psb/dXdzfNwkCBtL/KdjGvz51Di1CJpwmJz4+JZxabDp?=
 =?us-ascii?Q?V8+lKutK1sNajFakiAPivgIF4SwcEEyIGTZHe/EPVKrLgq7GR6YLELyunuxc?=
 =?us-ascii?Q?dwyWU2wrGsuIUzoJDYv/TKfDaD6Y8pR9+0XQM1PE/hqQrq889Z0gBwPU22u4?=
 =?us-ascii?Q?Oi1VHNwz0+6qnqyoNjML3mrKrgZIAKg3CGPYhzIt69+XSsm82JQAXZvl5TYv?=
 =?us-ascii?Q?NgPFXmo6BchqsHgB5uuGSKEOEx1ofWWTTaC8TUusLRCRKnd/Pz+dqlK9Q6YZ?=
 =?us-ascii?Q?toujSceULtCLLLd1Ehh5E/2T0/rC4pqPWZAxlyOuQRmeiFKyWA6lnvdBgDNM?=
 =?us-ascii?Q?LvxgyriVXsfJJ+hasulygKgi0etOJ7wwFhOgV93rV44Mrc3tddb0h+SYYoVu?=
 =?us-ascii?Q?d9z68QO0AQdRhhelCbfdXMLxxrS12r8wAzQCelFvop6EJDPm7xTqy7pc1RUV?=
 =?us-ascii?Q?EXtV+ybG8HIaDe3HHj/ADzaPFZjMb/Qxx2fM+5TtddgxvvvFhIKjEX0f81Zu?=
 =?us-ascii?Q?g8mPuCCtMHTSarCvX6dhIHVborDCxnGuhAhp6Tl0JZTqFxuokXZxSHmCBwLY?=
 =?us-ascii?Q?o4LVZ3TznSGBR4PkyJrLKT5Q7aMxYbua9aXdr3VtaO+14GvJ4/ImcJAv2KMM?=
 =?us-ascii?Q?lLOkMwPymQ7us7xKjR/CSZ8GQGEW9/BHCfgYzOuHr9aqB8O4idf6sjJvTjJ+?=
 =?us-ascii?Q?QOebHAmvwl3zRX+ewEmZM1or62g+QJj6MIsVG2tdFm7nIC1hhuUGZcGlyzn4?=
 =?us-ascii?Q?Ztlgi0E5ogiKrPwOmyxNGrqkGv/Y3ZRMp8l6nrncc94KLJQPKlGHsSHQLn3i?=
 =?us-ascii?Q?drRrlIUCsGE7xozTM1NjTho6sneencErDybpnkSeprNzjxQ8TArSXc1u59D1?=
 =?us-ascii?Q?5Gpns0TMaIXeJMGyY+zC9afIJgHjCNI+8lmIjU2KX0NFF9IjM6dtGWFnyZKN?=
 =?us-ascii?Q?mPwRFlhAKqdnY+n7vOGh8PNAVyLD5qCuFVPk54Hr0t1L7A9KJbu4oPVyiSyO?=
 =?us-ascii?Q?o3MLKP6WpQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02f4f71f-0535-43f1-6c86-08de4e7b5499
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 06:01:14.1571 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bvjZBk+ccSNEyU9b1XSf9JwqMDTJpBZ6mYk5cTV+Jz/kuPdbtsSu5ntX+gthM6lUGUUAWjz36XtPwQMjon8+0g==
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

