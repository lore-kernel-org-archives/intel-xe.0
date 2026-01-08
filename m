Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4142AD1489F
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 05:38:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9BC910E27B;
	Thu,  8 Jan 2026 05:38:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="cvyHz0LR";
	dkim-atps=neutral
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012015.outbound.protection.outlook.com [52.101.48.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F186D10E691
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 05:38:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n9vQNzOK/znNe8rxYKZdVjL3wKJMbo0VMPCxA+rDJkHN7jYiwdVAFtgSxIBgIs/cDxgcRfukjujlwifb2p995BzL7CSDgxNcV40a+PfIXoA1csFc/UdpvnAgaXC87ekWr3u1clfDLwziCgyVwAaB4/SU4/ycTPXXoc1yCUpiLSUrRQlbvq5uahpzWT0r4cb5gNs/ZUjzAa3od2ii2kWq3g4T0JDggPbow6AZ17d6guAEDejLyWJf1eakw/EbGlcVaFVT00F0R+H1rUpP0qJjUu8ZMD8Q0Pn/BvcxOlEG+vxFjFOBQx/gvM3S1mDcynuglnlTv2smCCa1W+hWblZ6Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RDTVtLEMiaidYI9//QirfqxiELn36QUJLXg+Qf6+Hso=;
 b=mX99ABVDlzP8OLQ2VbwBe8OlnzaQm0L8Wuq02TonMa6MYHmUpB0nVRxi+0FvDWH4e+teeWbI/tIrXy+0dsy0qyogOypvS5fOhma7wBifj8jcVhBc5yoL0+/e5aFmN/Up6APiWCQwqCLUCzt//f9ygCzCjMYf32JOfehovF7qu/BB0dsCuVtknmTVXErIp16lu6EGryTnOjJHIcoMXx+5DuU+CzjOJWeBukLqJym0xk+aL+gtGb4wTg80unY2GiSTjGjAKFPc89Olh+mcvvWBn2CKk3Qev+BV0g+JeTmMuAeKdbuHukjvB9Saqoj4zaMN+v+NhXrpfi/gQzhW4Re4sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RDTVtLEMiaidYI9//QirfqxiELn36QUJLXg+Qf6+Hso=;
 b=cvyHz0LRHbr9RcK6aaXw0q6TNin0L1jY0huqNNerwxlVhhbKXFpzfm8pXHbhhHUDsSns7+VmMipjk5hk6397BdsHtAzMoDOQzXr0u3Wt2rIRNschIL6iCQ/7WH3729BfMaTttZyzjqrrp30zRwolWmJDCX/bAqMnHtSUL7I/5zPHYcB47lOEnVI6ibdqGZnyv9awZQAjbo0Mp/4LkjyIg0ro+y7QlASKDlKZNvb6uhkQN8UHm5Rq5L5ZIt/L3V/ASAaMFYCKWU/bNHRMHM/Z07Rbvft/OmWRu/9Tx6mFLp+BccBlNuDwszLM/gbb1OTQvcWTittsdJRuY7CNF8AAEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 LV8PR12MB9451.namprd12.prod.outlook.com (2603:10b6:408:206::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 05:38:01 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 05:38:01 +0000
From: Jordan Niethe <jniethe@nvidia.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [RESEND v2 01/11] mm/migrate_device: Introduce
 migrate_pfn_from_page() helper
Date: Thu,  8 Jan 2026 16:37:31 +1100
Message-Id: <20260108053741.38802-2-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108053741.38802-1-jniethe@nvidia.com>
References: <20260108053741.38802-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0040.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::15) To DM4PR12MB9072.namprd12.prod.outlook.com
 (2603:10b6:8:be::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|LV8PR12MB9451:EE_
X-MS-Office365-Filtering-Correlation-Id: f0bc33b9-49a0-459f-7f88-08de4e781633
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qvo2hVMzjTCEteYj938d2tFgsICX7funtCP/c7/Cp9y5vPf/8OgvyNHrYRGa?=
 =?us-ascii?Q?aZ40H/jE3DtPdiOSd4DGPGqb7wN2iiMWRXVtZK5W/LgiXz3wU+YBCsdPXg3j?=
 =?us-ascii?Q?onPnzgVz5wyaJ2gD4Ae9bx5PMFYMyn11VEQvr1bcNK9CaDpssLYcX+evtKKs?=
 =?us-ascii?Q?pHhPmusTzCNeJeccGXniO96aMrQK9yRajNrE3xuTBDshJRZ0EC5oJnnme715?=
 =?us-ascii?Q?Sffa9iFQt1maudUbHdyQLhXGz+yJHOOIshGkUrUm9YdLXuLRUJ93jL3PN8K3?=
 =?us-ascii?Q?sOeIsynpm/JaApQdxKUz9+/BgKAbXVaszqj1MFaImsolPMtHtXvnfKo6t4Vd?=
 =?us-ascii?Q?aPbidzsVz+eYDYxcp26qwD/Pm1Iwx6PGoPLJlaSe0Y+T+V7DFamsb+fCRn9+?=
 =?us-ascii?Q?jQfpTfsDjIfaxDXH3yAtv3ZgjT1J0ZbUUyA1+GxzNgEdFn9C6+MY2ZmtFILU?=
 =?us-ascii?Q?R6jhThrsO/Btt/P/NAbM8G+uisFCKVx2OUbSvWMK9MDDFH3BRmSvh89Xn4eh?=
 =?us-ascii?Q?XXBaiHXFSxprljTloqhv28mTj0jw5vl7FSYAdWShASnIC/LKZXsrSPjZ4pQr?=
 =?us-ascii?Q?lg4c0k7AdkR8hHf+uNS17VLsBxRn0kG5DmxoVTs/KZ/yCrMBCsq0euC4Cs/k?=
 =?us-ascii?Q?VCvaqL1Dq+dAgxHPxG4Rw+K4wINuU+zaAxMQWkxQ1/xz2h2kFphwGiQ72ARr?=
 =?us-ascii?Q?EkeK9HaMItMCXKPMD18hQnbPsHYYmRvhryhZlkMH1mdD3iXHtsCGqe9vKm84?=
 =?us-ascii?Q?20pd3N+CyARV1WfQRGaHhOTyOa6dWCEkgVbXmXRlhKmUp8heOtvX8GJu37DI?=
 =?us-ascii?Q?su00CXg6EKsAdywTk3LzTuxujOX2ml8ZQIYbJm74N7c4kd+AwbjXI/2mgzMz?=
 =?us-ascii?Q?T1DDEbA8XOjBpHECter2eG7ptYN3xw0PNLPNBoX2tAtbwOgmQTxSJe0mAoU4?=
 =?us-ascii?Q?nlfaNvgrvCAn0yN/3BCrJK+oszv7rEGSDlLXwMpYHLTg/9D+xrUBOqABEBCi?=
 =?us-ascii?Q?4o+6I3FcdV9Lugxtw09t+n3etheCWxn5KiQL0d4CLBvJa4LKQym8KbTeL2Xl?=
 =?us-ascii?Q?+zidFuV2kmRyRRbhYFy8GJbVTuTVqEi7Pern6p0iduLPHLvj6eIiRlkRlCGv?=
 =?us-ascii?Q?f5H3XCvRy9g9LbcgfdfYVSd1uNht+crIJ2ESIRARU82XzGf+GJYaTn9niYBq?=
 =?us-ascii?Q?BxzW1IVfCIHU3nHZzmPapE2D4aQM9pxh81W9IRsTn4hq/Cy58S599+ekP/lo?=
 =?us-ascii?Q?sOld9p5EHhdd5HSwDp4xCTsUIqaMzTlmdIboDZvG5l5eGf40XSWVhRLFnaKg?=
 =?us-ascii?Q?UMbThZziFKHSBEO6QWKp7A4+8ftMAwU5TfhIo0ba8iGtr/M4E6wJzwCrEe1G?=
 =?us-ascii?Q?4JrTeKjYeBb+CySjRo/KGMTkZt+Zu8oAE8NEg2pUuUmSLBVmWaO1eaMd+90n?=
 =?us-ascii?Q?5sSqpSCtJaGflCo94AKD43GYm4CwiDix?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB9072.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Hpcvj9LghcJn6OPRmemQXhYVexlvYiZArvI3YxjpGVk7n0fDk7cVZHHLTsm1?=
 =?us-ascii?Q?yUr3USvi1zbYwRqnaoysLf1q+fteA6bADayNcW2eJa3NQVClAFIn2v6A0Dpw?=
 =?us-ascii?Q?AzqtRp7VHIw7/zjBIc3aRuehL4ryVHTu7jNPHDb5cJm5ylODPAKeIDtd1ewv?=
 =?us-ascii?Q?x/ch/vZAWb4rVMMTUNKDDT6s+oni5HzHDyEIkk74WUm1UVg0pcdi1n6IqZpb?=
 =?us-ascii?Q?woWzx/VrNzX1dF+j+9vce5vzRFKdIe6pxq583cuLZv3lDDRxadI93CebO40K?=
 =?us-ascii?Q?K/XyvdLYUwJk6kMu1+kHYjQHN0JZG2jZNOoPna9OtcejucG8AyV47Mpk97RW?=
 =?us-ascii?Q?+KWdDx/3vK+yqaJHizjMwcyN+z/eAx6AC3xTEr5Xw2X0UTPl6tlrXapQv2Be?=
 =?us-ascii?Q?juhpoWX90j7OO8oUqpkCURqM5YJeavBplOzwicLnHvhxkZsiiWcgGBLNKXFW?=
 =?us-ascii?Q?K42yrAwl9g3cCfQUqX1Rb/xk+AwmHU95oH6qSP7lkBqGnLK9b0oxv5coLKAf?=
 =?us-ascii?Q?HkRh/s+zrL3npT0eBbGGxj/5gNuJTSlm4Qo+3qM9h7+a/1Fpi3wlVohth5KB?=
 =?us-ascii?Q?BNI3aSGXhTf7SMZy/jBOUOhPmHQXKKvjPnkaqhwrMAeBryi9ISm3L3zaTiQT?=
 =?us-ascii?Q?sOzOdXPVR8vQgME/h7xn6//TCNFMPPHHpfduw1+5IVc63G0MAFlLFPJheKRd?=
 =?us-ascii?Q?91CMDiAoxTnYmP7FnroX8QPbjL9PPYK0uF3IPkIRU3WtnX5S5OYLdAhVIBUL?=
 =?us-ascii?Q?Si3VpAgOYK1cvgBzx0HXm3b4jWx+1ywLL/GP6K1iQUVUDBOI36ba4H99OsbS?=
 =?us-ascii?Q?fYjrN8u9Lp4L+w9asrsQMTc8oQ5zlDElB4B/xE24incqBEV4NU/vo2BFdCl9?=
 =?us-ascii?Q?ChwV8DR6mn4Y1y+UX8XOWHeLVBHdGh1dzSh2AR0/Cs0bEIEQ6Z3PUodvM3T1?=
 =?us-ascii?Q?F5kQ/nNqdNfZn2u1iG3j6zg+IHMRbL6H66JZVlAtZMR86jKYBCbX/13hoNP/?=
 =?us-ascii?Q?VeUf9WfR5hBlT3kyhkeP9V6QaSlwGwI6GP2CnpIGDZf7ypzdG/R54x7IhsJ3?=
 =?us-ascii?Q?Kl5ZRSeamvE+ySEaRvCJy+W9aWf3oj73yhtSv71awxsoVJIHaWx6slxFzbyB?=
 =?us-ascii?Q?nV41DzOYNzN87gdkIY1BuYre+77w4or3fRCFxS1xnQUM3EALv9hwXzZDxQI5?=
 =?us-ascii?Q?SXc+ToVkl9RpSOQfPq8IB/JzqxGps4aMBlaICDGUo49POA4ZzQRpWpxNIqIF?=
 =?us-ascii?Q?GKK712kFCL5Ua03jrTlAEbN1oIExptx5G2nl/OaroS9VALrDgJ7591JfDHe3?=
 =?us-ascii?Q?VNNvL1t6jKYFRUy62L7GYPuw/cz3JwLXlDp0yM3YxwJq+QtY1c+wRhfXfXuC?=
 =?us-ascii?Q?2U37IaYuRTz56hm76XyR3UcrQjOQtk848Jn2/weYf1Gm2SG5nIMNIXF/NHuP?=
 =?us-ascii?Q?PBVJ2rXY09HpXzf3afLeN3JxXKjp2ynZg6ZSmf0Ncg+Zlk3c2Lmi2FzUE8qB?=
 =?us-ascii?Q?0MYGPSFapPsiZUdnr/V/QcZvk8cDMRR/wi3vVJHdjar9sQjU9Jv/4s5ozVuB?=
 =?us-ascii?Q?XGFpWZerEk00mugFg4xtugU5FjyU7k6aMuy7uk1RZA2h+drsbwk9oWw73IQY?=
 =?us-ascii?Q?M0NT9n/wDvxWLvfYx8dQ6AReZSWlbKZ8lLJOlJlJl4ggeq78tWnswRc9t7CG?=
 =?us-ascii?Q?OE7zuBLaIehUM7gy4kAUHQOGPJvMdt5uKHPDU63QqgAlaxUzgEShT9XIvXs5?=
 =?us-ascii?Q?P3CgRa0x4A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0bc33b9-49a0-459f-7f88-08de4e781633
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 05:38:00.9750 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0o9b7hUm3W8Jf0+Jo2waCMUvJ3K4ckcx9zaJaGYGdZEniqLHttVtnaFCPCo7erjLbuI75uQdpTD/MPsids86Iw==
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

To create a migrate from a given struct page, that page is first
converted to its pfn, before passing the pfn to migrate_pfn().

A future change will remove device private pages from the physical
address space. This will mean that device private pages no longer have a
pfn and must be handled separately.

Prepare for this with a new helper:

    - migrate_pfn_from_page()

This helper takes a struct page as parameter instead of a pfn. This will
allow more flexibility for handling the mpfn differently for device
private pages.

Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
---
v2: New to series
---
 arch/powerpc/kvm/book3s_hv_uvmem.c       |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  2 +-
 drivers/gpu/drm/drm_pagemap.c            |  2 +-
 drivers/gpu/drm/nouveau/nouveau_dmem.c   |  4 ++--
 include/linux/migrate.h                  |  5 +++++
 lib/test_hmm.c                           | 11 ++++++-----
 mm/migrate_device.c                      |  7 +++----
 7 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
index e5000bef90f2..67910900af7b 100644
--- a/arch/powerpc/kvm/book3s_hv_uvmem.c
+++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
@@ -784,7 +784,7 @@ static int kvmppc_svm_page_in(struct vm_area_struct *vma,
 		}
 	}
 
-	*mig.dst = migrate_pfn(page_to_pfn(dpage));
+	*mig.dst = migrate_pfn_from_page(dpage);
 	migrate_vma_pages(&mig);
 out_finalize:
 	migrate_vma_finalize(&mig);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index af53e796ea1b..ca552c34ece2 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -646,7 +646,7 @@ svm_migrate_copy_to_ram(struct amdgpu_device *adev, struct svm_range *prange,
 		pr_debug_ratelimited("dma mapping dst to 0x%llx, pfn 0x%lx\n",
 				     dst[i] >> PAGE_SHIFT, page_to_pfn(dpage));
 
-		migrate->dst[i] = migrate_pfn(page_to_pfn(dpage));
+		migrate->dst[i] = migrate_pfn_from_page(dpage);
 		j++;
 	}
 
diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index ba099aa7c52f..05818fd62843 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -730,7 +730,7 @@ static int drm_pagemap_migrate_populate_ram_pfn(struct vm_area_struct *vas,
 			goto free_pages;
 
 		page = folio_page(folio, 0);
-		mpfn[i] = migrate_pfn(page_to_pfn(page));
+		mpfn[i] = migrate_pfn_from_page(page);
 
 next:
 		if (page)
diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index 58071652679d..a7edcdca9701 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -249,7 +249,7 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 		goto done;
 	}
 
-	args.dst[0] = migrate_pfn(page_to_pfn(dpage));
+	args.dst[0] = migrate_pfn_from_page(dpage);
 	if (order)
 		args.dst[0] |= MIGRATE_PFN_COMPOUND;
 	dfolio = page_folio(dpage);
@@ -766,7 +766,7 @@ static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
 		((paddr >> PAGE_SHIFT) << NVIF_VMM_PFNMAP_V0_ADDR_SHIFT);
 	if (src & MIGRATE_PFN_WRITE)
 		*pfn |= NVIF_VMM_PFNMAP_V0_W;
-	mpfn = migrate_pfn(page_to_pfn(dpage));
+	mpfn = migrate_pfn_from_page(dpage);
 	if (folio_order(page_folio(dpage)))
 		mpfn |= MIGRATE_PFN_COMPOUND;
 	return mpfn;
diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index 26ca00c325d9..d269ec1400be 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -140,6 +140,11 @@ static inline unsigned long migrate_pfn(unsigned long pfn)
 	return (pfn << MIGRATE_PFN_SHIFT) | MIGRATE_PFN_VALID;
 }
 
+static inline unsigned long migrate_pfn_from_page(struct page *page)
+{
+	return migrate_pfn(page_to_pfn(page));
+}
+
 enum migrate_vma_direction {
 	MIGRATE_VMA_SELECT_SYSTEM = 1 << 0,
 	MIGRATE_VMA_SELECT_DEVICE_PRIVATE = 1 << 1,
diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 8af169d3873a..7e5248404d00 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -727,7 +727,8 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 				rpage = BACKING_PAGE(dpage);
 				rpage->zone_device_data = dmirror;
 
-				*dst = migrate_pfn(page_to_pfn(dpage)) | write;
+				*dst = migrate_pfn_from_page(dpage) |
+				       write;
 				src_page = pfn_to_page(spfn + i);
 
 				if (spage)
@@ -754,7 +755,7 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 		pr_debug("migrating from sys to dev pfn src: 0x%lx pfn dst: 0x%lx\n",
 			 page_to_pfn(spage), page_to_pfn(dpage));
 
-		*dst = migrate_pfn(page_to_pfn(dpage)) | write;
+		*dst = migrate_pfn_from_page(dpage) | write;
 
 		if (is_large) {
 			int i;
@@ -989,7 +990,7 @@ static vm_fault_t dmirror_devmem_fault_alloc_and_copy(struct migrate_vma *args,
 
 		if (dpage) {
 			lock_page(dpage);
-			*dst |= migrate_pfn(page_to_pfn(dpage));
+			*dst |= migrate_pfn_from_page(dpage);
 		}
 
 		for (i = 0; i < (1 << order); i++) {
@@ -1000,7 +1001,7 @@ static vm_fault_t dmirror_devmem_fault_alloc_and_copy(struct migrate_vma *args,
 			if (!dpage && order) {
 				dpage = alloc_page_vma(GFP_HIGHUSER_MOVABLE, args->vma, addr);
 				lock_page(dpage);
-				dst[i] = migrate_pfn(page_to_pfn(dpage));
+				dst[i] = migrate_pfn_from_page(dpage);
 				dst_page = pfn_to_page(page_to_pfn(dpage));
 				dpage = NULL; /* For the next iteration */
 			} else {
@@ -1412,7 +1413,7 @@ static void dmirror_device_evict_chunk(struct dmirror_chunk *chunk)
 
 		/* TODO Support splitting here */
 		lock_page(dpage);
-		dst_pfns[i] = migrate_pfn(page_to_pfn(dpage));
+		dst_pfns[i] = migrate_pfn_from_page(dpage);
 		if (src_pfns[i] & MIGRATE_PFN_WRITE)
 			dst_pfns[i] |= MIGRATE_PFN_WRITE;
 		if (order)
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index 23379663b1e1..1a2067f830da 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -207,9 +207,8 @@ static int migrate_vma_collect_huge_pmd(pmd_t *pmdp, unsigned long start,
 			.vma = walk->vma,
 		};
 
-		unsigned long pfn = page_to_pfn(folio_page(folio, 0));
-
-		migrate->src[migrate->npages] = migrate_pfn(pfn) | write
+		migrate->src[migrate->npages] = migrate_pfn_from_page(folio_page(folio, 0))
+						| write
 						| MIGRATE_PFN_MIGRATE
 						| MIGRATE_PFN_COMPOUND;
 		migrate->dst[migrate->npages++] = 0;
@@ -328,7 +327,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 				goto again;
 			}
 
-			mpfn = migrate_pfn(page_to_pfn(page)) |
+			mpfn = migrate_pfn_from_page(page) |
 					MIGRATE_PFN_MIGRATE;
 			if (softleaf_is_device_private_write(entry))
 				mpfn |= MIGRATE_PFN_WRITE;
-- 
2.34.1

