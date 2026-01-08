Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 408ACD148A0
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 05:38:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1D0E10E68F;
	Thu,  8 Jan 2026 05:38:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="rb4duGcQ";
	dkim-atps=neutral
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012026.outbound.protection.outlook.com [52.101.48.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B21410E68F
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 05:38:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o45qKi+TvriOZulZAEY3k/oVjLxvCrcJCA+y7CK/g9DWexRo4eJcH6QIu/6AhKUdNrWXnC6IYoiISVCpOKuTqLDw7NXIUuOv3wk28cTMwp66VWptXcvUGKmvkxjBmA8OczTxHL1Q22xLTj9CgChxvccvFfIzowWX9VCnrEps+IVF2S9hJsTvY+KEjU5razWxKJ21uG5M5vbKszwTzCRErgs7bzh7z1Z7ZEmL9wTBXtCnqfXNt8Nu69Yc+qPb6M9LmwPmexztpiRU79vWJnnoT+SjQ/1UkcT6NRiGCx+Diz3nQ+gxb1QBLU80EyL3CS7gmU+L0VerEksXqWnMbzbFCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+rpxwToJjOveOPM/kd/5yWp0OegM7glo46WppD/F/+Y=;
 b=FaGvgAhqlPwvljgnV0WKhefeN34pzsC5lPCAXb8B9z1KQ/108U9Ojc4cjaym8K2E09Q2OCE8MUDdJcEvkkE2UCO8n/MrnvkjPco56J66NFvbuyCgOnzEpRgfsAsOTRfxl4OTow6hT6uQpE7HyZbZW8GeihjUeoouEnO4KU5jVNO2vaSidLT5jgXJndEriZvatZhZEFotQY+B/C3oy7rmY2aGNhd2jIW6EBGseQUA1rpHbA6aWYzlrqwV2aghVP1I8S4Ml8BvzoD+3kKGvLmAa1afd2BdwnYLDEhWFZLYUey1Q3iLHfFXuz6iS1nC6gTxHS9cIDWaqmmmUbaokVUWqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+rpxwToJjOveOPM/kd/5yWp0OegM7glo46WppD/F/+Y=;
 b=rb4duGcQumyc1/DIvSW5GXcrIozOxAlD2aTlTWjgl/M5UvAMjQt/I/tde3DOHa7lxwqlAX27rS2bC7yI5iltmJMOLMXQlcx15sp44D4Z6PwVJNazFuQCFHB6RTyIskuLsiV6nkaAgq250M8KnE3y2NTlGq6y/p0aDX/ulwrNiNSyykFazeXgNujgKfGKTM1DcK3mXqmGTPiyanFREoVz3q3bZotk2ExjlZFn5/YDMnq5LLVWUY/CZRfb4zk2pXJ/yJIE9Pbfy1YVVoIce6YGFMep2wzhczA2PpDpZ2S7NPzXgWfOvg9sF8wfvrT6ABKnCdUGUNxE3gmaT+g5eUhVbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 LV8PR12MB9451.namprd12.prod.outlook.com (2603:10b6:408:206::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 05:38:11 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 05:38:11 +0000
From: Jordan Niethe <jniethe@nvidia.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [RESEND v2 04/11] mm/migrate_device: Add migrate PFN flag to track
 device private pages
Date: Thu,  8 Jan 2026 16:37:34 +1100
Message-Id: <20260108053741.38802-5-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108053741.38802-1-jniethe@nvidia.com>
References: <20260108053741.38802-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0084.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::25) To DM4PR12MB9072.namprd12.prod.outlook.com
 (2603:10b6:8:be::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|LV8PR12MB9451:EE_
X-MS-Office365-Filtering-Correlation-Id: 03315263-777e-4eb4-cfb2-08de4e781c73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8BvFYgr0ArQ4wCA318kn8nMLyvBhttqJpcvCotM6b38gm7Gh/y0A6TAqavVg?=
 =?us-ascii?Q?SjFdVXd65w7ZU3l/+r239IGbRTFYxmE2gORg/80FzcA7vW6DyRtc5DsEKL3J?=
 =?us-ascii?Q?Eyt+G1/ANjF6yDJ/A2lJy/TiXOJqnnrOb464CP5rsjCdbV+kVtnZs5F529Zy?=
 =?us-ascii?Q?h0Zt8EQyZ+rPkcBeTJrDqJkK51rzuTE1yPBniBgjvSHtHYMtRfkZcA7FBkhB?=
 =?us-ascii?Q?KeHHbtptw7NvM3g/N/gnFyS6XS1em52KS3GiZN/MXgvHA9+NbO8KDYd+CMQR?=
 =?us-ascii?Q?s4nIb82hR6rAD/D20JoBip0GEf6Dj1kYihBmwMqqBL9iKdKLn9HH2kA3sbRP?=
 =?us-ascii?Q?DjyNH/Iabzgm9w03tv8wfb36oziiJ9+AZCrXHPQN485D099sbNEu9cksYgA3?=
 =?us-ascii?Q?QxXVJdY4roWJPnMTgridvCsdFiO71YRuEhjsEYH1n719dlrqNQiLdbkyNBz1?=
 =?us-ascii?Q?+302AeaTq3+IPkk2qfJAtvSgvX+Y4z1yzIvIkRdtl0aah3+/D4uCyIEHNJnt?=
 =?us-ascii?Q?jbCa4TRfjvdcGNHtKC0mQn04zJ32qW+cxMAWZeGRYTyaeD25Tqb/h8D3PZAs?=
 =?us-ascii?Q?aFsrFa/I65yGD/OG1nqY7HYPkebx/7vX57tQL5/1aOLCE2OmQatxeYyrs9tr?=
 =?us-ascii?Q?B9ygv0gTksw8cYbLao74EfZg14kl8hU1WqHMl3CRRQF9vVSh8+/OG705zlfO?=
 =?us-ascii?Q?CCl1ymtNGDRNvtWPAk/TNPDeIddhZryYLrxoAQEkcn1JtI9MvhQ6JEN/5NS2?=
 =?us-ascii?Q?ckK6Ethe1qgWV1NH5gRwd8tJAWIfUK01N5eoOiZs2/Au/ZgJtKobhyR/NSZt?=
 =?us-ascii?Q?J/wFQxTHBeQa6h2wEdQVe5nSLIMfvBXbh3ROFLIohkUa+rYflTfgJ1nEuWQi?=
 =?us-ascii?Q?+uqghonBUOY5HwErUX/LeH5dR4t63IWa/FxeRvRWIW6LhJRfYSVpjpohEOGl?=
 =?us-ascii?Q?HI/7c4P7UsSph6NGGhOvIW97BKNjEsdYr+8o/9aT8rRzvK4qgRTSCgF+0xpM?=
 =?us-ascii?Q?b8px/Qr0JRrPV5eDmmP7kevhzuab06xmXAknmpxzmxoRDPyDmry3yv7V3iFF?=
 =?us-ascii?Q?RImx+IwPZgAUi9YbKWshbAT37f4JkiL+b1Z/nPErl0RYHLPJt0cz6wW4jJKk?=
 =?us-ascii?Q?sn63nnywBI4mvmXDRUKyArPybi6LCp4fw+CG37dCKZQL4xz64cSBvmNvrCdT?=
 =?us-ascii?Q?6EJ7FY72xUsA//ambbmWlcaxQCLf4homwQNCrcbHYzM5pzsNcNuZZkbq50aB?=
 =?us-ascii?Q?dC/389canNwx8JZOBtV2kMU1qle2NgXHSp+mkyiinD5QipJLPpg53PkStrwR?=
 =?us-ascii?Q?452NL+foGdqDbW5C+TZdMEjaZRhEjWADZYEKHymmiZTN2XyJfUd+g0Era3Oz?=
 =?us-ascii?Q?zClCeL4dJyK+IaUdcek02uOTIIlJQ8Vkah8LemYhUpmnJEvJGVy5tnUMDmHr?=
 =?us-ascii?Q?1UrrpgWUbS+ym4uQPHdqhFGiXrJKrciL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB9072.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5H5jKkwVPn5jtyak53S4FsxM0NG8GUaRZTLqmrBI6BoM8ewQ6SaL//XJeJfD?=
 =?us-ascii?Q?mR/Gcbp1Oskpu3ztbzAGcdBjwiYjhTgchF7kCbI9ADseLMbbKPxeo02+H5Ab?=
 =?us-ascii?Q?l5eefw/7/0W3E0QpNyj8mAfwP9Duf+nfJz2xZi3uXt5KC0w+XTc4uj0sVw1s?=
 =?us-ascii?Q?Bhorto9LKrapvKecVqQG0X/n29QM5NGDXgNa2UdVlcSTo2yfKltixaQ9e9WO?=
 =?us-ascii?Q?+Gby379YEXjup0lJhJvKYr87StCDLZxmm5Fee6/7nmYegtickeR6hhrJCpMm?=
 =?us-ascii?Q?reboQNijbVeCqHGR4tvUKvddjKXjvdvwN5Fy8dhtq8KU0R0otBfVnjCH4tZc?=
 =?us-ascii?Q?PR/Ba34iRxFmsbC8wUsIf7zesTRqWkgbrptynylKnpSMrMmbDI0OP02aB7DT?=
 =?us-ascii?Q?nM/4wzr8jFuH9zkG2RqfUzwv/xhqY42bkoJR1sEj8tvuncCR1Ycb8V/oziTT?=
 =?us-ascii?Q?V3C7M86rNLBT+zhquGfB/D6bQBLIWOBprpcLBrS0ZxQeoJhhJRNBUmjxSmQr?=
 =?us-ascii?Q?CcQg/8llr22OGTbKLT1qMIazABypEYpPvuiVXdUV6vs+ZMZRjovBgceNEbMg?=
 =?us-ascii?Q?hY81WfI7SiwrNrPiYplyFvq9bRo0C8wDwW8JwGphvuPKuPWj1NUOs5eAsWJF?=
 =?us-ascii?Q?cfPJjIcmLbYr15jrSEd/+FTxy3foSPS/4ekf0bKljy7ynSxWxSXFZG+vU41i?=
 =?us-ascii?Q?oLF5t3CCiNRMV2kK86LfYYYn4PjMEX3WS/19/3jCa4AM/eDEDs+XkWCuzVym?=
 =?us-ascii?Q?l12Xo48GmbP4qFU6o+Oo9Ze26dFXHiYVSj13oddtp982Tuoh/lKrqs9OHWf9?=
 =?us-ascii?Q?42Y4pI3MFOmY5d4g8dnWjV2wy/eAFZJKtbFGQrmwBXYfqX/iyRlu3v0TyB4h?=
 =?us-ascii?Q?H7I4y4Vf3CTeQuMnKJXFgx9Sc5WI88AkMl7gDgRghxAL2fOBDLmmyrOCmrHP?=
 =?us-ascii?Q?d6YfCuRgMSmAKggqvyBdB+L6AmZt3HCNcwFkKBUNoaJ/TmDydgTd8hmmbH9c?=
 =?us-ascii?Q?ElwpI8lH0veFvfR3D/Hx/vrHC3pIPlluDTDHZZDNUkoWOxu+QNb2KgylIbg8?=
 =?us-ascii?Q?f64OspUl08Lfe7rXGXCWsthuTahK0pp5siuNclp6SEXNVydBvDQ3Khr3VNca?=
 =?us-ascii?Q?ojiXmLuE6yAE6W9nrxmHB/YsbHXyZI57nM/4SYY6P8gkqOr/L/f7vM1cm14E?=
 =?us-ascii?Q?KvusnRVUmHiDo6huh+xTO7cdjRiNh55BERDKDEaKhV2ERmBMlbnIIV2ZgX8v?=
 =?us-ascii?Q?QHwhh4Zp63KOtJJdx7Rh0kzVfwLMBOL5oIASB7S0clRAw9JyDE1IDJa5Y2sE?=
 =?us-ascii?Q?M9OlPYEUqMKClpVu6O9pQdm41cvEDjp8xhLP8rumDZUbYjOVHcgmkBF1nFin?=
 =?us-ascii?Q?TsvXRH2cm4uBi3ZeA48eanUv60Kbq7/wcLnETUUg2TH6yi+dFhgIGC5dKYSw?=
 =?us-ascii?Q?RwBv+1diexyRwUPRaizBIZeocFXKt9vZalIQ4rZf2tJ8gxjgXhGyZbGvlHM8?=
 =?us-ascii?Q?JJtA/exSr8k+uOkJ+gqTzM5UEh8b4/YF1PF0SLsVge1jsV81yP5X4DtVrpAx?=
 =?us-ascii?Q?0rNscrZMwLi5TcXWTsEe2L+q6czGGK9Rf/9rFzfxrbotSdIBhZ0VvYULuhMb?=
 =?us-ascii?Q?WzscYaahwcmQU+IUkm1spsfh63SlCOYqeKAFgO3FzdGnL/ZmEn9mD7A9l+KF?=
 =?us-ascii?Q?iR9yL8zOW8XIQ2aK175j2leCGVYVp5lo91SmjCrgGPLfppJ8ixYXqEX/7jC7?=
 =?us-ascii?Q?7OL1v+PgiA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03315263-777e-4eb4-cfb2-08de4e781c73
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 05:38:11.6872 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZVwN67zHqttG2PXO2dIb8ARzlSXBCA5rnnWTxnVR39D2HmhkrF2EJrOKTYWXzdrstMk2qUng7d5z4Le8HvKxmA==
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
address space. This will mean that device private pages no longer have
normal PFN and must be handled separately.

Prepare for this by adding a MIGRATE_PFN_DEVICE_PRIVATE flag to indicate
that a migrate pfn contains a PFN for a device private page.

Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
Signed-off-by: Alistair Popple <apopple@nvidia.com>

---
v1:
- Update for HMM huge page support
- Update existing drivers to use MIGRATE_PFN_DEVICE
v2:
- Include changes to migrate_pfn_from_page()
- Rename to MIGRATE_PFN_DEVICE_PRIVATE
- drm/amd: Check adev->gmc.xgmi.connected_to_cpu
- lib/test_hmm.c: Check chunk->pagemap.type == MEMORY_DEVICE_PRIVATE
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

