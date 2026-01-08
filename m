Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 468EED1489F
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 05:38:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E086110E693;
	Thu,  8 Jan 2026 05:38:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="CDEXTa45";
	dkim-atps=neutral
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012035.outbound.protection.outlook.com [52.101.48.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44A7210E693
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 05:38:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f2CQ+nt2iVqjjxtg3t4U6gqh7n46ZL1CZ2VJkCRXxqEoK13zncRfvE7KDXeaDcvXpOUhLQtEVGbzGkZyHQm4oijcNTWTMAixviZhyeUGoBd9GQppCinzXF4nMca+N0xqP/gtUWk7RGxQzu6X37xoentNwNUX6s1tkkVmJD0V6GioDtpz42QonRAKF7uN+eP1y3sYwdJqbLau7qxqioawrXfdutlp65cQgRNq8wVAEYjyIo7ShiY4KO19R/EXgIVEZeqcJ6vSXxHG1IoLEjgxnsJzGL/ZCuM6cvvkbl8QDuyWKJ/ksis0+eg+H/D0mOfr4N+aX3hH8n/gECOwrWBIZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Gw3NHeoQMTPH2l2SYQ4EpLofF65dqEAA6czLciZ0vU=;
 b=zBqcLp3M5umq4oWhbyzpCfXEwgwCpu/Djld5gTra419qaNorcF9Pus6aiRydTiWEH9hpunlxAQzFUz6sCBcqk/8+xQbRi8PuDuIYcWX28B9VmN16OalxAqCfO8SqRSybLxczcP58zR3OH4+6BHQUSK+ct95+zPUqCePBS2YTonIGRrStJ6wNMQzvC9s8CJOcmgK+UhdfQYStL9onHoOuCseW187mEpp3BeQUOnNPrjP4B5Z86ArNBXRYLKHbMRz987oDO9Ho+JWdPHiM74NGVJ9sIO3Z6waT6kznLenTx1mJX4yQAn8ScNDzH/OxbLz5E9oGA0qEb5NSBITzAIwAYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Gw3NHeoQMTPH2l2SYQ4EpLofF65dqEAA6czLciZ0vU=;
 b=CDEXTa45yMt9LY/DVn0mQN+0Hqpbo//O+4PPzQyk0nQwCx5egwqpkLTGQBooKbN6tX9cNRJ4D+RhfvW3zWCOtj37lr2blCQ+OZKsLj4HzdooKvbl7b9dlmdYKpX6BIJuF8Em7JUkbG8UIGQgHZsbfEImUnUViNusaXNYB5OdocOhrJeDmfkeJj2ziEB4BSRWnZVlqlUjyN+IzmehELPpOFWWml4QjRHMKtXnZdpInV/CxxYwhn+iqGUl62Ddb2AtNkdMvnHNLt4xqX4T7lSRlsSbdeVJBDpopMxFz8+Xa2QmZECZv3AsTvHfJUkaPTxOTXoS8KbXuZ3rBgd+7RnSPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 LV8PR12MB9451.namprd12.prod.outlook.com (2603:10b6:408:206::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 05:38:08 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 05:38:08 +0000
From: Jordan Niethe <jniethe@nvidia.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [RESEND v2 03/11] mm/migrate_device: Make migrate_device_{pfns,
 range}() take mpfns
Date: Thu,  8 Jan 2026 16:37:33 +1100
Message-Id: <20260108053741.38802-4-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108053741.38802-1-jniethe@nvidia.com>
References: <20260108053741.38802-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0126.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::11) To DM4PR12MB9072.namprd12.prod.outlook.com
 (2603:10b6:8:be::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|LV8PR12MB9451:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f9a2cf3-f932-44cc-c84a-08de4e781a70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?U7yvFGac2NJ+Y5Zow6FYAZTCpJaPWTzzPuG4J1BYdf7LVJ2CRDdPaCF0zmub?=
 =?us-ascii?Q?DRTogIb0z3aeT0y6gw4Me7rL6ISZ2z4R3ojWvR+CQrLAK22vzlGAQuMLlNYJ?=
 =?us-ascii?Q?B54sDGklaJwqESgWWWVu5ULK+rBsmw9eHDmOoTe7jX0XGVXwqbBTZjaXkOFJ?=
 =?us-ascii?Q?c9Tn9BXWUM90xEryDc8xEsdpu/ceN7ilKGAcUVp8a/wu+c2yNCrqtLcqBxN4?=
 =?us-ascii?Q?yJH1hXwdJayJlu3EsqOftieuEVALDTXJWY+2xPaZcSI4HaP3DROn0LspiayU?=
 =?us-ascii?Q?TaFvtnUZSRgAXUYRGmxJXUM3EoU4PmWBz0a8DUk6xNs7p8ztcQIV6GwbdVPI?=
 =?us-ascii?Q?CWn1CwuL1S4ac7qYhBg1jpSNqksRTuAyTvyz1RlwGd/OfyaUyP81MzA7/HSw?=
 =?us-ascii?Q?I8XVNuyTeHf713UASXOLiPcxMSW6ftcYzSiafisSNWujTxNBKfo1EAa1wVyM?=
 =?us-ascii?Q?hri7IWwrFj4hFtyZt0KOrK6NAn6puZN8p8fE13Vd6wgt521BLiYjgWGKlI0J?=
 =?us-ascii?Q?oOkHsMNTMHp0nYQDR3ui5g4BvgNG84KhoT7Z2jA79NuekRtjC16o3gnba8Gy?=
 =?us-ascii?Q?RaNXE0F2yd4pdVIGRXCQYdxAWSKSKODQlIDBRycUm8di/itDAZqptERco9cp?=
 =?us-ascii?Q?2FTpLQt9vN3GB1maGr8JZAmMOZtKW1V7eatAheR6fuK3PlX+BsatsXxPkYzQ?=
 =?us-ascii?Q?MRmO5fEANfaQWWXMHDIRE087AfqGFTFmSgfbzbN4K5lIgCHxgTsJzPHf06pY?=
 =?us-ascii?Q?J01knbNhl4+CjsbNZxjwfBoyKoS5KbxrbRkPzScijfd35LUeMPCvUuMM0v73?=
 =?us-ascii?Q?ShZh1GRP0fOelNo2Q3uOgQE5rZUyiFfsMsD8myVq5llqcxE92rKAFkwoG1KH?=
 =?us-ascii?Q?E8L2slTrSSTg5kVXS4jmAehPXmzdfIxA9F/QMB3dAwR53NYoNgiIhTYVWqrS?=
 =?us-ascii?Q?2Fa9frbBla9FGwWPVWvynMKEm+ZmfO3qqye0cF8hlxB0mBMjOKb5knDolwcN?=
 =?us-ascii?Q?LXp9xol/lgvXWlO3YoeTohFr7+0hxmx1QABL2lWDvCcQTnJDRooFXoCvxyWt?=
 =?us-ascii?Q?QpS+Lgc0pxPDdY7cCHTp2EvymNLFf4BTNvQxRIzD2w2pS86dGqn3zKIDqgbu?=
 =?us-ascii?Q?mO7jn1geATMVwOKfeW34uId0/w4FyMhulgTMuZtrKrQrWBvH+2Hz5IzwtOr+?=
 =?us-ascii?Q?n6vlBeEQUsCCSU9yNLZN/TcJdHx26UcS9ms6sW+xnkPFZbMVE9TAmNCYypG+?=
 =?us-ascii?Q?NSK1+MaH9jI+eR7ANN25z+PoJsNQnaTMlNlfWGp+dUTUfTVvnQ5rlUa2DDIV?=
 =?us-ascii?Q?jid2hMKGKqOCObGEK/2xL3cxpQvEl116w3HAgT17AsjCknaV4urr/R1Xl4J8?=
 =?us-ascii?Q?GYwEpJEYUJrGmhSA17nLYJX1FUXZeY8mJrb1GwT2HO/bPBtjkxRlE3UL9iSV?=
 =?us-ascii?Q?+NgYer38HZohatkCQOHIfd/MSyz/PU27?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB9072.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vEzrYoakJ7/0GjY3PL6kx+MFizfRCQaurvv3LX0PQL78SLdxTo0mgKCavlD+?=
 =?us-ascii?Q?sry8jN1tR8k1Ol6JoPJtQw9HDnnMXtQjN4K9bFaT59V+Q+NvfVS0FEbeaD/C?=
 =?us-ascii?Q?9Ple1QhlRSMUQY9ShDcSX5P6kOU/A2MLv3xTlFfeJ2eYObp+xV05No7FTAI8?=
 =?us-ascii?Q?2ZuiK8PxnRGwwa+mJcgu7ilfGHY2P7AT/KbHTKM400s62hgGdcCapJBKx+WK?=
 =?us-ascii?Q?LW/4nsH1sr8SEF6J+hW/JsOR6mrXXC9RMpJn1I22jP6M6f0H3IEAWEdJZRUK?=
 =?us-ascii?Q?O55ASx6Caz8Kio6fzXE/5b49gq0hjiq9LXO0PY0IXjZqRZsYomYEEr1tR1PE?=
 =?us-ascii?Q?GSnuJ2jr7ZsXzX5l2ILl1S4tc5LUfVnwbfMFF1qrd3b88nB95ztA7tX3HNAy?=
 =?us-ascii?Q?YSNm4yVYv3fXKTYUmm5Q3KE0f7EoctWTyjbeyDhiwGWZgspvUcP+pq7vvWXo?=
 =?us-ascii?Q?F4MUsKWwbqWzLOxHRSz5wizchNv97V+koEGQF5mXJEIKckTHf0l8CgI34n1V?=
 =?us-ascii?Q?3KihgE3AEuYq2sABGk/uXUFXToTsTXCOS3nz5jaf2XnuUt5175PEdv/N8FIw?=
 =?us-ascii?Q?JD1MUXxkAzSA2AKGhNgy4PfWov8bRw/MKDYzymKSj8dNnctAlhyYJE+TNnQE?=
 =?us-ascii?Q?8HT9OUIc/Lot3d7kN5Jy+cWu9n5TxkjLC614vOHQXJ5DgeFt2Fv+Kq637TIs?=
 =?us-ascii?Q?rzdtaqrg/iMm+bUWG+tBoOlT46wPyueOSa2377JQgYq00ruq31Yjxa25LixO?=
 =?us-ascii?Q?KAZQUtSJ1dMYZY/eVZa863ztzLGiVWC5aeR7SYdW956gcplgc1+T2OnKdSX3?=
 =?us-ascii?Q?J358X3tRP7UV+iP4g6tZWB8SVlHZhlAUNcEgl6lHWfeNlTwaXTZOfhEwV52l?=
 =?us-ascii?Q?eqlv9DBp8VXFX+SQ8exgqI8uhxeip/YmxxR2pcVMa8CHo8TjebcjZyOKttnS?=
 =?us-ascii?Q?aRSSgjYOQ4yd/etjabrUGk4vNL9Wt9LvG/mTUmxLTQL4bRXo0A5l3wCGoV6H?=
 =?us-ascii?Q?HDvBpPPoCHOrXcawAYo/u7z323Ut7+r3fA+b7ExmPVeweReS/44XNbzUkXFP?=
 =?us-ascii?Q?n4I9B5ntZrb3/u8alixyr3RCrTrVBM7hoY5WOCyLQdIxGj1xlqEPJe5kzfpb?=
 =?us-ascii?Q?kVzWyEFgRtZfD4kaf4IkYHHJU+sIGhN15ihFSzRZajpRgUhHJH72ffoexlgU?=
 =?us-ascii?Q?IxFGzo9ng19Ya2XTueWLmQTpDfSIpkSNwpKCzoukMITsH0i4lXG/nP5a2ujC?=
 =?us-ascii?Q?3z23qMBUcD8M5HYBrHv1Uah7Z62hPOyaYmnkt7GX7lLCSACroxGkPVag4WzT?=
 =?us-ascii?Q?x+jix8mqz2aTFhy5w+2D4HfWPpJeyN+YGI1jR0SV6lkgzrUQRo18qRRVklU0?=
 =?us-ascii?Q?PTKTD3UXcoJ4DYoea3LhPH/FzaIg4lIR93xqaoMiryG/hXCDMOrSUxPBVkFg?=
 =?us-ascii?Q?v4f1/EVDR4QCfBcr+Bi3nOm5zCGi2gdIgcl5gO6QI97B1kxhbLYEkDjUYdJ+?=
 =?us-ascii?Q?K3yQHY1FlhEW1AKN3wJz+YFB26vmM0h3Viap6I5P7igCAHSnherBqfBn/s6X?=
 =?us-ascii?Q?E8tz6TuiREjD/O+HOnDpr9qsQX7yV07fcZIGuWgDZWzsA9wPloFM7v53+jLi?=
 =?us-ascii?Q?kt2sOztbqvPbGk9SdWw7tsN4IY5/Gm+TcY2P+cCHgKvRUjUnWwHQycWLntPq?=
 =?us-ascii?Q?RYnZcDmlSkGegQl3f9S/l1kWap/v9opvyqP/DYA8EcaN/bQELazWesupdtcO?=
 =?us-ascii?Q?eQkqtS1wuw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f9a2cf3-f932-44cc-c84a-08de4e781a70
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 05:38:08.0920 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pZelprMxUDgCIY9ADR7TVKThL55gMVKHKSVrmnQmEhN2tZUyn1K+ILOrESf+BLGv7cHwE0fHy6z/2uTwDUPhHA==
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
v2: New to series
---
 drivers/gpu/drm/drm_pagemap.c          |  9 +++---
 drivers/gpu/drm/nouveau/nouveau_dmem.c |  5 +--
 drivers/gpu/drm/xe/xe_svm.c            |  9 +++---
 include/drm/drm_pagemap.h              |  8 ++---
 lib/test_hmm.c                         |  2 +-
 mm/migrate_device.c                    | 45 ++++++++++++++------------
 6 files changed, 41 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index 05818fd62843..3450763a894b 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -495,7 +495,7 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 
 	mmap_assert_locked(mm);
 
-	if (!ops->populate_devmem_pfn || !ops->copy_to_devmem ||
+	if (!ops->populate_devmem_mpfn || !ops->copy_to_devmem ||
 	    !ops->copy_to_ram)
 		return -EOPNOTSUPP;
 
@@ -580,14 +580,14 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 		goto err_aborted_migration;
 	}
 
-	err = ops->populate_devmem_pfn(devmem_allocation, npages, migrate.dst);
+	err = ops->populate_devmem_mpfn(devmem_allocation, npages, migrate.dst);
 	if (err)
 		goto err_finalize;
 
 	own_pages = 0;
 
 	for (i = 0; i < npages; ++i) {
-		struct page *page = pfn_to_page(migrate.dst[i]);
+		struct page *page = migrate_pfn_to_page(migrate.dst[i]);
 		struct page *src_page = migrate_pfn_to_page(migrate.src[i]);
 		cur.start = i;
 
@@ -614,7 +614,6 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 			cur.device = dpagemap->drm->dev;
 			pages[i] = page;
 		}
-		migrate.dst[i] = migrate_pfn(migrate.dst[i]);
 		drm_pagemap_get_devmem_page(page, zdd);
 
 		/* If we switched the migrating drm_pagemap, migrate previous pages now */
@@ -967,7 +966,7 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
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

