Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F10D148A0
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 06:01:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2480D10E68F;
	Thu,  8 Jan 2026 06:01:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="hEq2PzIW";
	dkim-atps=neutral
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012012.outbound.protection.outlook.com [52.101.43.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D62310E68F
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 06:01:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MQglFU9dU+ZEHrJLgIhPY5nrsmjvV6P2eRO6MrLhdBW75WGkrCuc34Hf1N34aXK/R9tj7cl643cu++FsNd8XzmZ1r4v/UypdszrUY0vzqKyPVdDr7KmJwFzu7NaD+cQzkfLHw6nwicc/TQefo6UOhfJVBLuqmdnEmt3nXb1EroFfBQvAItveE7hWEEm8NfCGmzYx/gxkGgODMdnXw/0Vgg2PQHVGXZN54yNmWc7jRDb5EUP7VHKTvc43LG1eUi7gJivz9Mfvzn72Yt6jLXFd7lfusHaYyt9s11K4zECHL4Eiuy7O/inHXI1q25oI/NvnijTQ45HLq896wonencphdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NeYtlHpsZu0JGS6S0pQtRDEjoYqyES4gikyyciay1oc=;
 b=YRPkJsDW5qKBiVV0OBbUsINotWewommZHRZbJz6uLPEV1Z8ZSMql/TvIB/zjPgoWEZHsvJwYtlDWpTByOqal8sUP47bYNJjtqQEVzDOhoLv3OM9qSB86BtOHBY+fPPbBXurQZreC/rf70A0YXL1pJTtlEf65J7yZqYvi9maNQ3mPurZS8bktgE7UG5AGERUAMPVtfaFSh6Iywrf/ypC70W+jUxLqIJiYgYPPNyKeTMLGyPSspoGc0IoH1qXVkIghDXlzEqymkfRSod3OFEbum1OLi/E2ju4YfbWTr7sPR05DvPmeArly/6AwdLA4oN9Ys7Ki+82BQJEHDmFx5vz+5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NeYtlHpsZu0JGS6S0pQtRDEjoYqyES4gikyyciay1oc=;
 b=hEq2PzIWzybf+jBq9tu0Nz3HQO1FwTSla3yRaVoz5ouRwxQRQS3Mv2xYYKp8Qpz4sIZwy2tTBpnJDzMGrqoM/WToT08SbdwbbwlXrIoTI9b+ss6L7siLBGg33v7FXlxA65SYjbOji8No/wGHmaAexRGiCGZEXd4pLqPAE6zaiy74s94fz1HSu+B4APmrlVdtry4sdG2TStgJYfAmK0OyXbyzyxSVHMMZ+VbBFL7URMQg7sKrPEVPCdf+1OySe0nTEqouhJNb8zgs45KBfw2qGP4hC34Y66Zh63gwFLgXl80chHVVDYmOM1F79EDI5ty0HgqWhzsr4UINZuG0t2Hv4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 BL3PR12MB6618.namprd12.prod.outlook.com (2603:10b6:208:38d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Thu, 8 Jan
 2026 06:01:17 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 06:01:17 +0000
From: Jordan Niethe <jniethe@nvidia.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [RESENDv2 v2 03/11] mm/migrate_device: Make migrate_device_{pfns,
 range}() take mpfns
Date: Thu,  8 Jan 2026 17:00:54 +1100
Message-Id: <20260108060102.41357-4-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108060102.41357-1-jniethe@nvidia.com>
References: <20260108060102.41357-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0042.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::19) To DM4PR12MB9072.namprd12.prod.outlook.com
 (2603:10b6:8:be::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|BL3PR12MB6618:EE_
X-MS-Office365-Filtering-Correlation-Id: 052c0260-9a3d-4127-744d-08de4e7b567f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oFsn6HIOEiT7mllQ8hfOV0GQzLte5NfQYweNYgi9+iJEOwDwW5+yD3hHgURi?=
 =?us-ascii?Q?/ig53kkqQQOAHT3fvEFAdr3Fj1Ij+4fObttgIVjgt4Nc+zdC+RN9nGsweRlN?=
 =?us-ascii?Q?f1sWhQZYEnpwkz1V6nBBEDsXVp5CwSAaDk8tUZZbHoPTZ9sUl0au+9TMsW91?=
 =?us-ascii?Q?LEvjxLpeKDOQy+fi2fl0XnTyyYQwkLm3LBlCPI4vlVzXbAywuBuBflaXeaaX?=
 =?us-ascii?Q?lmQUMuq/Q5+UccOOt2i5lPHoMJRiUUKamXU8nrnz12noukRHS7SkF+fOEvK+?=
 =?us-ascii?Q?IDVr/Gpqi7Q01NxN9jzsOXm6Ro+1fLxL8wLnh0O3NnS8kTEbmGH5wjlnEp+g?=
 =?us-ascii?Q?4CfcqAnSPzF7YMewWoBAx3z1b9Q7qSJnd0mm5w2WyEo4xxHtZeLL1BljCUCQ?=
 =?us-ascii?Q?lbvMfT0MjGF6A0qoAhS/O7AvYbi49B2lE8iumng32DDh4Q7kdqwhQKvSA9bV?=
 =?us-ascii?Q?Ng5S4WWAveM2BonHgn9hsVf6x+VmGnFQVg/vPZmTHibR0fQZ9G7LLUkGIxcu?=
 =?us-ascii?Q?chmk+HEegMBN5cw7dzurvxg1a2cACN5b07yiFENldZWTiL3KqMjO9bLStPWu?=
 =?us-ascii?Q?fd/v/V/iCP2BfnUL8x8GzHpsoHqqBaxRznaGuvQPEpGf0uJ9coSotahtT9cy?=
 =?us-ascii?Q?5nt2dYl8QXcxcnQRV4TPVLBJgYwQeaJ+MGGLcJgOj3oZ5ui3wD57LGeA74js?=
 =?us-ascii?Q?bsq03K23PaEVr9rTazgmwo6RLgoT1Jl+X6rsi9ldP9Xcrh0l2VjOk3qwwU1c?=
 =?us-ascii?Q?qNNrUvcDcDbGgoE8tMUm/SHWYUENqughQ6ShDKHtc3xt5Xx1YcFuZgG8CcKX?=
 =?us-ascii?Q?xkkfhyGV8+ttoAkJ+aQFA40hak67DM65BPJdd2s/fWvHNsLaS8hqhHQ3ROmT?=
 =?us-ascii?Q?exFk9S8bI9tgFzL9N6YQemGyVi7Px1qa+phQIzzSIs/JoohOir/LbT8vGLnM?=
 =?us-ascii?Q?BrvpQ28QwZwEKVys7MlmDWSa9QKpMe2empB4bTrycWiP86dJa5kbBdYiWqPs?=
 =?us-ascii?Q?vpMZUMx0tbFs6lRL0Xdi0pNbhqTfenN4BhA/fgVtA4yz6axnVs8+ATu8mYfQ?=
 =?us-ascii?Q?kcBskCvDYidGQ5XnJ+QvrE8wMpWgSHKsBGpf+dhbM/tBIW34LlbttUO5lauX?=
 =?us-ascii?Q?lQpzaiywfSb2yvFqiS8SwwrWqEz2ao1GqbUaj6sEb38YsHukMgdBi1G6NRJU?=
 =?us-ascii?Q?iPt97zUI5LlwT3h96DBArXKyVbMysR4JN0yW0qSdyvmJ6z2ciQR0xQdvQ4c/?=
 =?us-ascii?Q?P0kytIUpw1eSA9PidnGsCmeFP/GbruSqfVTezWkXeOwhfLRZCDKfUvIY3Axn?=
 =?us-ascii?Q?KZRaF74tHgs/tTfI6Pn7LrxVX/rqzqGt4ef7rKNHUZD7GfTZEB+UlSqD0EoM?=
 =?us-ascii?Q?u4UgCLTjwfuUEUNyJK8wMpJuRT8uxrP/BN22MfoozrQD8oUAk6ruxIW95bkZ?=
 =?us-ascii?Q?ckGFafLBpSdQ730Rd90Cb8ZIk0zVp1MN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB9072.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SQ2OOGnYwEburS8fkMB3jF9PruxyC4n8Ks3cOZv6LtkKi/MrsCJ4uaXtLLsD?=
 =?us-ascii?Q?LRddwFzPtW6ZA1Br/+UPfWH6XSdxZ7v7OmwpJId7/f4I+ujXjeshmQMaNDG6?=
 =?us-ascii?Q?5Dl/PNYfx1U3M/h2qwgqS3Iz0CilLEc1J5CM+HHJeOMu6FU9W7lJrGCBUsNh?=
 =?us-ascii?Q?KIFB/xShJhREqG4iJWae7H75YTQr9CoTLqQobDsWhXFA2S49r0Q2J2rY+G9B?=
 =?us-ascii?Q?ZTK2q13t7QVOIaxmb9vJ2BS53tO38QN9ARtRDJifjO0U7Ult5cfzCTH00hn3?=
 =?us-ascii?Q?13HsG1DcHYNe1Zo/xqYiQCofvmNMdKJScldrlcf2yvFqN/qRjUcKw6s/PdAB?=
 =?us-ascii?Q?rXvItlUcSabM7AOmMid6UP6SW5X2FY/F7pvOQnt2UWQcsPlTuV1Pl69q8xPs?=
 =?us-ascii?Q?62Aor1C/qfT2rihQjuzHZL8dRCYNMjPrIQXwFdXONjuuineDHgxMnk16ReMR?=
 =?us-ascii?Q?DllunxFOAsHU+Kh8kBddddcTHpcXTELHGDBrU2rWFmS8DrxFAR6JwCZrN538?=
 =?us-ascii?Q?CcusREwde/vomUSLswtZE9UzUCisnX5ogJpuyeUczGT8wdwb57TMJIgT2+eJ?=
 =?us-ascii?Q?+DTiOl+vRQgwrE1hnUrW2CvwNAzvmc0sHEmNwLsN1O32b+E9k6+BXmZB/Bzx?=
 =?us-ascii?Q?S3ewbDJEIajYCwNWjgRj0jT865pPY97uJxChkW7PSQMRhJ0A86niLORpYwOH?=
 =?us-ascii?Q?c7c+tnQ7w3G+oXldGc2ldgVt6FXCLma9LiabJsiFgr20mTptflLvQWB+YQnt?=
 =?us-ascii?Q?nMMHV0OrNAcvLGEp84h7OzpLorUU6sWB0C2Gc3gqScX7W9QAEbP+Nf/jl7ZQ?=
 =?us-ascii?Q?qXruIG1DId5/YQ5aNSKmeYONg2L35ZMOrm24D4S5RoWq2YDRZfJhA7OmXAFk?=
 =?us-ascii?Q?HEtT4A/noFwvo9NzbGqIGvilsYylL8Kc6r+Ce3Iw5p+ZNWrqH+Qigu1g/uTI?=
 =?us-ascii?Q?9KLZe1hXfyENKhaq197r7Zg/tZykabOZqwADOiZ+a4OWDbi/5HDE/iyMhlt/?=
 =?us-ascii?Q?bQHWjuGl8Rj82ODPAeTAk5ogzCeQhxYoHIPRMWlvLQ4UabRVINkmZn+LuHB0?=
 =?us-ascii?Q?kV7w2X3fKKQSnuwJHMosb8EA8Pg0Lnoc/o5wcKnQMQDK/RJlCqvVbRptcBuk?=
 =?us-ascii?Q?yZQAcfTXBpXsdt9hvpl3JhE1XGN6o3QXFfPATFKNf/OCVpapd7ALq/sEK5wF?=
 =?us-ascii?Q?DtYPvO1ZucGelpwgdNHI8l9X6TISLMT+s0IeXQF2+Xg33ftWVcqHvvsjYLoS?=
 =?us-ascii?Q?q7fl0ZZPB4SCvmAeGGFClP885FnEudtSEahbD5drkO2s7Et7v7Pv5lsKQFEA?=
 =?us-ascii?Q?U/eispZZXR6EQh6fmnWIwBq2bGFpbTa+/YQvg/SSxUokeW0lUPJ208drOsw4?=
 =?us-ascii?Q?cTwGvsP43WOjaTx3u85R8jpIGeJHvxJOivIj9YsMIS+6vBd4NFz9dNRrXPkE?=
 =?us-ascii?Q?iZelhlApvUESNgOeWe01mFcBll1vP7yYo7kqKSbbF064EpdU/qcYVOvkl5yb?=
 =?us-ascii?Q?89W+040GaR+BxJdvWKxGuWWFEcdEMxAKD1aZZwxf+3abv6ffRDXMlFkRNyoa?=
 =?us-ascii?Q?E5W6NYSkAQl40yLwAf7DK4sr5SvrnMdab3cF0aYOnXsY9Wa46fL8NEA5y4eP?=
 =?us-ascii?Q?3+Nk+hjvcQqBeQhJ3ow/2CdxumslYlxTAr7pD5vrpHjQ0BlyJLazYe+OVEVJ?=
 =?us-ascii?Q?ykR6KJZPFlgfm94VZr9oU3kh8T++rw+NoFgWlvP9ntFTluygB9Bhds7Z8fPz?=
 =?us-ascii?Q?+qat/AMXBw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 052c0260-9a3d-4127-744d-08de4e7b567f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 06:01:17.5780 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pos0mgR1xbZ7cczR/jH/n3qQZy4iNYSKoZToOBxcvPu9yAwQ+oLfE1TOLcMW8L54opLrZzfGs0bkCxYZZO2adQ==
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

This causes an issue for migrate_device_{pfns,range}() which take pfn
parameters because depending on of the device is MEMORY_DEVICE_PRIVATE
or MEMORY_DEVICE_COHERENT will effect how that parameter should be
interpreted.

A MIGRATE_PFN flag will be introduced that distinguishes between mpfns
that contain a pfn vs an offset into device private memory, we will take
advantage of that here.

Update migrate_device_{pfns,range}() to take a mpfn instead of pfn.

Update the users of migrate_device_{pfns,range}() to pass in an mpfn.

To support this change, update the
dpagemap_devmem_ops::populate_devmem_pfn() to instead return mpfns and
rename accordingly.

Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
---
 drivers/gpu/drm/drm_pagemap.c          |  9 +++---
 drivers/gpu/drm/nouveau/nouveau_dmem.c |  5 +--
 drivers/gpu/drm/xe/xe_svm.c            |  9 +++---
 include/drm/drm_pagemap.h              |  8 ++---
 lib/test_hmm.c                         |  2 +-
 mm/migrate_device.c                    | 45 ++++++++++++++------------
 6 files changed, 41 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index 526105aa4b05..13072c8665b9 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -505,7 +505,7 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 
 	mmap_assert_locked(mm);
 
-	if (!ops->populate_devmem_pfn || !ops->copy_to_devmem ||
+	if (!ops->populate_devmem_mpfn || !ops->copy_to_devmem ||
 	    !ops->copy_to_ram)
 		return -EOPNOTSUPP;
 
@@ -590,14 +590,14 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 		goto err_aborted_migration;
 	}
 
-	err = ops->populate_devmem_pfn(devmem_allocation, npages, migrate.dst);
+	err = ops->populate_devmem_mpfn(devmem_allocation, npages, migrate.dst);
 	if (err)
 		goto err_aborted_migration;
 
 	own_pages = 0;
 
 	for (i = 0; i < npages; ++i) {
-		struct page *page = pfn_to_page(migrate.dst[i]);
+		struct page *page = migrate_pfn_to_page(migrate.dst[i]);
 		struct page *src_page = migrate_pfn_to_page(migrate.src[i]);
 		cur.start = i;
 
@@ -624,7 +624,6 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 			cur.device = dpagemap->drm->dev;
 			pages[i] = page;
 		}
-		migrate.dst[i] = migrate_pfn(migrate.dst[i]);
 		drm_pagemap_get_devmem_page(page, zdd);
 
 		/* If we switched the migrating drm_pagemap, migrate previous pages now */
@@ -979,7 +978,7 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
 	pagemap_addr = buf + (2 * sizeof(*src) * npages);
 	pages = buf + (2 * sizeof(*src) + sizeof(*pagemap_addr)) * npages;
 
-	err = ops->populate_devmem_pfn(devmem_allocation, npages, src);
+	err = ops->populate_devmem_mpfn(devmem_allocation, npages, src);
 	if (err)
 		goto err_free;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index a7edcdca9701..bd3f7102c3f9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -483,8 +483,9 @@ nouveau_dmem_evict_chunk(struct nouveau_dmem_chunk *chunk)
 	dst_pfns = kvcalloc(npages, sizeof(*dst_pfns), GFP_KERNEL | __GFP_NOFAIL);
 	dma_info = kvcalloc(npages, sizeof(*dma_info), GFP_KERNEL | __GFP_NOFAIL);
 
-	migrate_device_range(src_pfns, chunk->pagemap.range.start >> PAGE_SHIFT,
-			npages);
+	migrate_device_range(src_pfns,
+			     migrate_pfn(chunk->pagemap.range.start >> PAGE_SHIFT),
+			     npages);
 
 	for (i = 0; i < npages; i++) {
 		if (src_pfns[i] & MIGRATE_PFN_MIGRATE) {
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 213f0334518a..fbf5fd284616 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -10,6 +10,7 @@
 #include <drm/drm_pagemap.h>
 #include <drm/drm_pagemap_util.h>
 
+#include <linux/migrate.h>
 #include "xe_bo.h"
 #include "xe_exec_queue_types.h"
 #include "xe_gt_stats.h"
@@ -752,8 +753,8 @@ static struct drm_buddy *vram_to_buddy(struct xe_vram_region *vram)
 	return &vram->ttm.mm;
 }
 
-static int xe_svm_populate_devmem_pfn(struct drm_pagemap_devmem *devmem_allocation,
-				      unsigned long npages, unsigned long *pfn)
+static int xe_svm_populate_devmem_mpfn(struct drm_pagemap_devmem *devmem_allocation,
+				       unsigned long npages, unsigned long *pfn)
 {
 	struct xe_bo *bo = to_xe_bo(devmem_allocation);
 	struct ttm_resource *res = bo->ttm.resource;
@@ -769,7 +770,7 @@ static int xe_svm_populate_devmem_pfn(struct drm_pagemap_devmem *devmem_allocati
 		int i;
 
 		for (i = 0; i < drm_buddy_block_size(buddy, block) >> PAGE_SHIFT; ++i)
-			pfn[j++] = block_pfn + i;
+			pfn[j++] = migrate_pfn(block_pfn + i);
 	}
 
 	return 0;
@@ -777,7 +778,7 @@ static int xe_svm_populate_devmem_pfn(struct drm_pagemap_devmem *devmem_allocati
 
 static const struct drm_pagemap_devmem_ops dpagemap_devmem_ops = {
 	.devmem_release = xe_svm_devmem_release,
-	.populate_devmem_pfn = xe_svm_populate_devmem_pfn,
+	.populate_devmem_mpfn = xe_svm_populate_devmem_mpfn,
 	.copy_to_devmem = xe_svm_copy_to_devmem,
 	.copy_to_ram = xe_svm_copy_to_ram,
 };
diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
index 46e9c58f09e0..42e7418abb6a 100644
--- a/include/drm/drm_pagemap.h
+++ b/include/drm/drm_pagemap.h
@@ -192,17 +192,17 @@ struct drm_pagemap_devmem_ops {
 	void (*devmem_release)(struct drm_pagemap_devmem *devmem_allocation);
 
 	/**
-	 * @populate_devmem_pfn: Populate device memory PFN (required for migration)
+	 * @populate_devmem_mpfn: Populate device memory PFN (required for migration)
 	 * @devmem_allocation: device memory allocation
 	 * @npages: Number of pages to populate
-	 * @pfn: Array of page frame numbers to populate
+	 * @mpfn: Array of migrate page frame numbers to populate
 	 *
 	 * Populate device memory page frame numbers (PFN).
 	 *
 	 * Return: 0 on success, a negative error code on failure.
 	 */
-	int (*populate_devmem_pfn)(struct drm_pagemap_devmem *devmem_allocation,
-				   unsigned long npages, unsigned long *pfn);
+	int (*populate_devmem_mpfn)(struct drm_pagemap_devmem *devmem_allocation,
+				    unsigned long npages, unsigned long *pfn);
 
 	/**
 	 * @copy_to_devmem: Copy to device memory (required for migration)
diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 7e5248404d00..a6ff292596f3 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -1389,7 +1389,7 @@ static void dmirror_device_evict_chunk(struct dmirror_chunk *chunk)
 	src_pfns = kvcalloc(npages, sizeof(*src_pfns), GFP_KERNEL | __GFP_NOFAIL);
 	dst_pfns = kvcalloc(npages, sizeof(*dst_pfns), GFP_KERNEL | __GFP_NOFAIL);
 
-	migrate_device_range(src_pfns, start_pfn, npages);
+	migrate_device_range(src_pfns, migrate_pfn(start_pfn), npages);
 	for (i = 0; i < npages; i++) {
 		struct page *dpage, *spage;
 
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index 1a2067f830da..a2baaa2a81f9 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -1354,11 +1354,11 @@ void migrate_vma_finalize(struct migrate_vma *migrate)
 }
 EXPORT_SYMBOL(migrate_vma_finalize);
 
-static unsigned long migrate_device_pfn_lock(unsigned long pfn)
+static unsigned long migrate_device_pfn_lock(unsigned long mpfn)
 {
 	struct folio *folio;
 
-	folio = folio_get_nontail_page(pfn_to_page(pfn));
+	folio = folio_get_nontail_page(migrate_pfn_to_page(mpfn));
 	if (!folio)
 		return 0;
 
@@ -1367,13 +1367,14 @@ static unsigned long migrate_device_pfn_lock(unsigned long pfn)
 		return 0;
 	}
 
-	return migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE;
+	return mpfn | MIGRATE_PFN_MIGRATE;
 }
 
 /**
  * migrate_device_range() - migrate device private pfns to normal memory.
- * @src_pfns: array large enough to hold migrating source device private pfns.
- * @start: starting pfn in the range to migrate.
+ * @src_mpfns: array large enough to hold migrating source device private
+ * migrate pfns.
+ * @start: starting migrate pfn in the range to migrate.
  * @npages: number of pages to migrate.
  *
  * migrate_vma_setup() is similar in concept to migrate_vma_setup() except that
@@ -1389,28 +1390,29 @@ static unsigned long migrate_device_pfn_lock(unsigned long pfn)
  * allocate destination pages and start copying data from the device to CPU
  * memory before calling migrate_device_pages().
  */
-int migrate_device_range(unsigned long *src_pfns, unsigned long start,
+int migrate_device_range(unsigned long *src_mpfns, unsigned long start,
 			unsigned long npages)
 {
-	unsigned long i, j, pfn;
+	unsigned long i, j, mpfn;
 
-	for (pfn = start, i = 0; i < npages; pfn++, i++) {
-		struct page *page = pfn_to_page(pfn);
+	for (mpfn = start, i = 0; i < npages; i++) {
+		struct page *page = migrate_pfn_to_page(mpfn);
 		struct folio *folio = page_folio(page);
 		unsigned int nr = 1;
 
-		src_pfns[i] = migrate_device_pfn_lock(pfn);
+		src_mpfns[i] = migrate_device_pfn_lock(mpfn);
 		nr = folio_nr_pages(folio);
 		if (nr > 1) {
-			src_pfns[i] |= MIGRATE_PFN_COMPOUND;
+			src_mpfns[i] |= MIGRATE_PFN_COMPOUND;
 			for (j = 1; j < nr; j++)
-				src_pfns[i+j] = 0;
+				src_mpfns[i+j] = 0;
 			i += j - 1;
-			pfn += j - 1;
+			mpfn += (j - 1) << MIGRATE_PFN_SHIFT;
 		}
+		mpfn += 1 << MIGRATE_PFN_SHIFT;
 	}
 
-	migrate_device_unmap(src_pfns, npages, NULL);
+	migrate_device_unmap(src_mpfns, npages, NULL);
 
 	return 0;
 }
@@ -1418,32 +1420,33 @@ EXPORT_SYMBOL(migrate_device_range);
 
 /**
  * migrate_device_pfns() - migrate device private pfns to normal memory.
- * @src_pfns: pre-popluated array of source device private pfns to migrate.
+ * @src_mpfns: pre-popluated array of source device private migrate pfns to
+ * migrate.
  * @npages: number of pages to migrate.
  *
  * Similar to migrate_device_range() but supports non-contiguous pre-popluated
  * array of device pages to migrate.
  */
-int migrate_device_pfns(unsigned long *src_pfns, unsigned long npages)
+int migrate_device_pfns(unsigned long *src_mpfns, unsigned long npages)
 {
 	unsigned long i, j;
 
 	for (i = 0; i < npages; i++) {
-		struct page *page = pfn_to_page(src_pfns[i]);
+		struct page *page = migrate_pfn_to_page(src_mpfns[i]);
 		struct folio *folio = page_folio(page);
 		unsigned int nr = 1;
 
-		src_pfns[i] = migrate_device_pfn_lock(src_pfns[i]);
+		src_mpfns[i] = migrate_device_pfn_lock(src_mpfns[i]);
 		nr = folio_nr_pages(folio);
 		if (nr > 1) {
-			src_pfns[i] |= MIGRATE_PFN_COMPOUND;
+			src_mpfns[i] |= MIGRATE_PFN_COMPOUND;
 			for (j = 1; j < nr; j++)
-				src_pfns[i+j] = 0;
+				src_mpfns[i+j] = 0;
 			i += j - 1;
 		}
 	}
 
-	migrate_device_unmap(src_pfns, npages, NULL);
+	migrate_device_unmap(src_mpfns, npages, NULL);
 
 	return 0;
 }
-- 
2.34.1

