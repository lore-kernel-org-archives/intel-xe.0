Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B156D1489F
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 06:01:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BC8E10E27B;
	Thu,  8 Jan 2026 06:01:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="l816bFee";
	dkim-atps=neutral
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011040.outbound.protection.outlook.com
 [40.93.194.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53C6110E27B
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 06:01:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TXc6Bhe3NsTRMdSafbhy9+HVT3A2ZOGs3FrviY3rnHgfGve09+y5AXTZM0QGtwZHc73Nvv0timlhjQL1EZHCH3teUfV94O0P8UlZttZqBY1TFam3gVx6n1ym5e7Q4h73tyF6cl/KgyuZkj2/Snc2325mCgzPQK+0Tbu+7rR2p1SuJs0lDhAv2iEh9wzhIjZ9RUkDoQGPcB56RTPxLEKTM/js/a3Jp43a+BTnORXIfgjZ+0v87DnPrM7PFTAqrKtgBF0viT3wH1DhhEMtKVofR5vo9GBsabZgyi4KGswwQStEQ1T+brxGUtSBD/7WMefLyrW1RkjpXf1//d8CB/GCPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mTCOw8O2/FmS0/oIkgmfJ2QRo4HhR2h3GQoMRcopkcY=;
 b=uwxCKAUFTLsuVpM8uiEYfaPoUVay1zRkI30k0XJvQl6Qf5fzX+lSELNdakLg/Ptujl2YKI4kIloc/YPV3YRdAm9yXBeuz8KBHcOzCxKYHU4v5yKxZjDGGe+D7EWIddW0Jrz2RwmfVdsuLhY325xM0TXzs1kKrdKZZmIuoEdNdDwH4QHvS4D2iwP3rXIZkSX7mTej/Yfil2AFqVY3Lcsh/i53uijcIhuTdrrp5A93cNaV21Cp0NUruQCa2V0fPyWoaBjnUOWuEepGOCSZtU/7sDOR3Q8eWXjrxiLvwJATmrXwBdGXs6NnKHFJeTee9ICH4fcwzYFBKIcT28oG/9tj+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mTCOw8O2/FmS0/oIkgmfJ2QRo4HhR2h3GQoMRcopkcY=;
 b=l816bFee2BBNeK5Ny0cdEbndKZLaLYqxX8gi3A+3DMb9KKPF06/6BEk2okksKj+tJsti8DrF7cSgFWcZ7I1nafRQvvvhZWsg88I8YX9MRANtG2+ZEIMqiQN9Sc1xh3XPWKKuHLvgzUes+CivdxLV1A8Mz1MwKNKvHSM7kIxFyVoKgdxGN+F99nvIfqLG6CwLX4Loj/lzfJkbhhgwXSv38TbHoAqchxD/hRBALK81PH8J2GZ6lZEzvILzK20151DwR9KTTGvOu9CY+xN//POjgxyFwsWmDkINZ8brns5gAQLzqTrUScfa12HeqvLQg1WifnZ2ch/YTg01td1XfZPavg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 BL3PR12MB6618.namprd12.prod.outlook.com (2603:10b6:208:38d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Thu, 8 Jan
 2026 06:01:07 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 06:01:07 +0000
From: Jordan Niethe <jniethe@nvidia.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [RESENDv2 v2 00/11] Remove device private pages from physical address
 space
Date: Thu,  8 Jan 2026 17:00:51 +1100
Message-Id: <20260108060102.41357-1-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0195.namprd05.prod.outlook.com
 (2603:10b6:a03:330::20) To DM4PR12MB9072.namprd12.prod.outlook.com
 (2603:10b6:8:be::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|BL3PR12MB6618:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d1d02ca-f087-4671-3363-08de4e7b5041
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JT0kqIG5EtWuDy1XTKAm2fxZQbg1iraPmCUB1wPfsuw27S1OrrHHHciCoxDz?=
 =?us-ascii?Q?wt2zMDFJetm3zOWqnIi7htSMJkQKcLbbaI1N5+6ffK96KBzNN4RPMFysD/4u?=
 =?us-ascii?Q?5Q4k8xjfXgvlxzzGzRNQCwoQJd2M96Vk/Sf5ifymCdJ57mkaDPEBwOlwjS8T?=
 =?us-ascii?Q?YUmWdj0HsYyTojZ3/7+XjaIW6K+aOly+M/NNwOR+aXyWe0XPjEJALy9C1taB?=
 =?us-ascii?Q?iAq3DzBvVx8FUQUORBi3ylr8tC/rqw0OM/9gEPv3/EgfAfVnssWMNc7VbJUr?=
 =?us-ascii?Q?ECqZOAlBTRa7y5M06kK/3paO8rnXnHxel8by3rw8U5UiaEhfFpP7jfj5tfi0?=
 =?us-ascii?Q?kf1ypYgUQMA9T/uUKapqVtC55cca+wlcs93ynb8DKp154PfyqrkfRjdL0rxn?=
 =?us-ascii?Q?6kXsYGQP7y8cwkG3PrHiokS6HV4nEnQC+tYBehVdIlDRCAvKlR0mUi/VWrWd?=
 =?us-ascii?Q?y4Tf1SQsA+TY0LC0/iMaEZG9imwYVLxZOy3L7eWk6VSBl/db9WLCv9D4Deo2?=
 =?us-ascii?Q?H9r3v6qOGrQFrfJIEPRR6bvY9MNxg+GxVpG1Do74S4OLbvojGsJ3Ujzm4JrL?=
 =?us-ascii?Q?GeDhNmNi49kC/veuv2jwoXQG0CZEsIiC+bkmcwZ11NxIwzm/FFHWM28rbamZ?=
 =?us-ascii?Q?3tKdsLwZ/ESg1q11ne5ABAuf1F1aNLxG8brcH9nb3+uhelQP7Ln4bA5knNj3?=
 =?us-ascii?Q?mW/sx+r3lYltT55SNL8Icxmjx8g9wPGTsmBxPeJmy8U0Mp08vYgp9yvupgJ+?=
 =?us-ascii?Q?4bImPbHtoFGEPV0OIKmUs9sgohdxFGmewo/Q1qHwTkCqbtQIGFsHVBVQCToO?=
 =?us-ascii?Q?rNizIt84qFgnClfWFZbIWrkYli/iOvZfYeoEynSfeS0ZhrOd82mj+aQ4i3Nk?=
 =?us-ascii?Q?JWLFFb8qa6EmhBKSvs5HFKvQvgn73TI8hV5Khp1EVFu+3mONK3d2jjA/uDaB?=
 =?us-ascii?Q?nU3NMYgLj0E+MarSbj3QvK5isTua4AIuFwwsPWk3jZi/aPb0EDsdEhxWZOm+?=
 =?us-ascii?Q?TR9YqFZHKxeKeydq6M42DdFkZhgwah8KF2kOQSfzKvYhBQIOpoaLfwfBr/xR?=
 =?us-ascii?Q?UlXYAOkwQo9sgB3vdAEczHXLcQLdjlhaL9L6k0ty/S+JsuFUV6HsXpgDEQ/S?=
 =?us-ascii?Q?MI+PieO6rTHQTTPS2Ql9Y85l6nTq2WdJAS9radKWmJGSW1PyvPC0RenM7AbW?=
 =?us-ascii?Q?+oMft3niNOF+OxW2cCsqobj7z5EwfOdvCvwAQDDai07FcTXuzgqsmCUZB8sU?=
 =?us-ascii?Q?CxO70OUhbpoDUAuMeoRovZMC2UxdhoA2Lw04vSOZyMHxuCs1CwlK1P4ogkaZ?=
 =?us-ascii?Q?Dx0Q6oAzl4Cx/UAhR70/E+EZJvRCmQKOeQvwu4fih2Ym4JOO8A8UHSKwxUx8?=
 =?us-ascii?Q?ea4/2e4kx/hJW8hCiVya+z+xV9iAidR3KVoOGWPkB6dZG5ZEqiGP+/U+4uNJ?=
 =?us-ascii?Q?SFKkh308gzPw1NVaVLqWJvYUb+6Phjcg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB9072.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JTDszNH4uvHe1X6Og9TypGkHQurStuazV4YUIs9pxpg0/MELBTEHLTOTK/7S?=
 =?us-ascii?Q?FsxHqbrQJNAaDCZGctvUE36GXPATIOYo8/VYncj2+fHl7yIvsbZTX8z5nDMw?=
 =?us-ascii?Q?xZ6DdEVEikNDfTwxTPwUZwkMVl/4PQ9W8gkc9Mb4PPmGD+2s5gt6Ilcq3is2?=
 =?us-ascii?Q?Uec58vgJb1glnFgZRBMnPnlvlyaXBlJH9Y/EermzdtU0lmFkIt7W80iR4+0I?=
 =?us-ascii?Q?KK/S6ar2NCpNxW0TRY561r+uGwMkUBmeyjS94ilqHAeSv26LP5HmmSh7VfTj?=
 =?us-ascii?Q?hn/R/zCdDBN7jmzRgK24QMhe2M9s1Ay/8bqCRarviu6P7PW1tkPhetnQsoBR?=
 =?us-ascii?Q?U7Tf+FPi3nIvqCD6yvTPWk+ZgNExznxTv/bRczfgHuXUuKaDk0VCqfQWn+MJ?=
 =?us-ascii?Q?yZ+n65se0K1RFbiMPw/uVwYNH0MfK7Gr0p9Y4pkZ4fMLZ++PZMy+/AXG+li6?=
 =?us-ascii?Q?GWSay04XXGQEYjlHRxi/4VELGw3uSXpXGUc/Qdz3Ww0EqIxDr/+hxSH5PjZk?=
 =?us-ascii?Q?3BMZcwM6NmfCx6yUyEhKXkRf31AkLbH+ayWShQ5QfDp14NGVE+dMwmi1e23X?=
 =?us-ascii?Q?EQDNZ3C8HM1m0R2OiTIm515cKwyyrhIxpsfmyvxq002nR5RA3qtLVGQYQg3W?=
 =?us-ascii?Q?Odl1mYPMsKlQHGtbE/axEdXbnBUpxylQMlA1pQ+qUDH2TbPUmJWvMXGTDF0t?=
 =?us-ascii?Q?XZLWLADoybCBJabLpgmcdwtc3nGox5C54rlodQX60Y7AC6B7o4HK/FyjtKlt?=
 =?us-ascii?Q?dPT7zWUnC0+5Xtyte4set6IIAMzaAAdBSR5P0tjwEOEfNVAUl9Ou/YGmIgH4?=
 =?us-ascii?Q?DRGD5ZMLXKKR3qL0Bl6z+OFoHmj9yYVkDfbmGgXoCYhsDa4Lb57z9EHZsIHX?=
 =?us-ascii?Q?J7Ul4VTljqXEUhizXh8yIO4FSRdJcxedLn/R9zVsGFveat7roJGLiCiwvg2o?=
 =?us-ascii?Q?K6lO63TXP1UcTLpO6owW79nMYjfQXyzNeyLhsP0XCb0q0az4bG3QKDms8cDd?=
 =?us-ascii?Q?b7amkpDSqgEggpIrRJdwTPGfprhoH+Xjeo1lU/TldLGoerfISZoQJI3f00jR?=
 =?us-ascii?Q?mfBmF4rl2XnZk8tSlGtO2Bz1bhmINe1mXwKacqo/V2TwvbipX9TaG21IisPg?=
 =?us-ascii?Q?jg6rkSPb2Ojpip1Mp7FkNrpa2BGqbXNxoxii8/tz+hESN3hZYC1UF+J7gMfv?=
 =?us-ascii?Q?hI6X2xalyqlmwMuqNTEJgQjHnwNxJ4qd4w7FutflaG0OOSMWiSkLFjhteBOh?=
 =?us-ascii?Q?BACPip8AqLRhpXpUPjiY9ZHl1Jj7xW6PRYn4xxicKRUNeqjPpyd9YgEf4Kb3?=
 =?us-ascii?Q?r4DQwbU3ndGvlhAVt6MFUSz3oOjhrM2DkahTns/ReUj6Fsng58PuohCkUZkD?=
 =?us-ascii?Q?SkfWoLywvk0nLpT5o0k+eK0kUhqf+pVlvPGtuWbOXTmqSVz5G4nFU5F3bRlc?=
 =?us-ascii?Q?8hrpZCY6WyGHCRAWJGzeVDfq/KiaJdIEjpBV7hPmjJG+0LaXGr4LFuLQHEu/?=
 =?us-ascii?Q?q6nejpnDjfVrFm2hnHfhsHM3JpDcz9xIcdpHIQnQBGUJLyCSDDsPH6DP/LJk?=
 =?us-ascii?Q?ayxQQ96N83/LahLghSSizP+qhANH5lXdpKIhlgtI6c4aszl5dYok36xt2dcB?=
 =?us-ascii?Q?BjTnWBnCDCa+VjCBNLA+lAWczWSPnCZzIakUWc+wLXGhcrFahZXaw5cQR5+h?=
 =?us-ascii?Q?mweYtskESVbXr5D4R4AgpbxBpV4clv76ukagNoB2vosdGNShamKiQN9T9VzS?=
 =?us-ascii?Q?mypEsqEfWA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d1d02ca-f087-4671-3363-08de4e7b5041
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 06:01:07.0235 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jnx2Fvue1FtgJ7xekQcqXJ+Wc+Gk3neBM6f1xl3JVSGqOpnj5/FcUQDkAmBSXPRm1SwgDZHAdMRvntmlrcN2iQ==
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

Resend attempt 2 of
https://lore.kernel.org/all/20260107091823.68974-1-jniethe@nvidia.com/#t
rebased on drm-tip

drm-tip was updated after the first resend attempt: https://patchwork.freedesktop.org/series/159738/ 

Today, when creating these device private struct pages, the first step
is to use request_free_mem_region() to get a range of physical address
space large enough to represent the devices memory. This allocated
physical address range is then remapped as device private memory using
memremap_pages.

Needing allocation of physical address space has some problems:

  1) There may be insufficient physical address space to represent the
     device memory. KASLR reducing the physical address space and VM
     configurations with limited physical address space increase the
     likelihood of hitting this especially as device memory increases. This
     has been observed to prevent device private from being initialized.  

  2) Attempting to add the device private pages to the linear map at
     addresses beyond the actual physical memory causes issues on
     architectures like aarch64  - meaning the feature does not work there [0].

This series changes device private memory so that it does not require
allocation of physical address space and these problems are avoided.
Instead of using the physical address space, we introduce a "device
private address space" and allocate from there.

A consequence of placing the device private pages outside of the
physical address space is that they no longer have a PFN. However, it is
still necessary to be able to look up a corresponding device private
page from a device private PTE entry, which means that we still require
some way to index into this device private address space. Instead of a
PFN, device private pages use an offset into this device private address
space to look up device private struct pages.

The problem that then needs to be addressed is how to avoid confusing
these device private offsets with PFNs. It is the inherent limited usage
of the device private pages themselves which make this possible. A
device private page is only used for userspace mappings, we do not need
to be concerned with them being used within the mm more broadly. This
means that the only way that the core kernel looks up these pages is via
the page table, where their PTE already indicates if they refer to a
device private page via their swap type, e.g.  SWP_DEVICE_WRITE. We can
use this information to determine if the PTE contains a PFN which should
be looked up in the page map, or a device private offset which should be
looked up elsewhere.

This applies when we are creating PTE entries for device private pages -
because they have their own type there are already must be handled
separately, so it is a small step to convert them to a device private
PFN now too.

The first part of the series updates callers where device private
offsets might now be encountered to track this extra state.

The last patch contains the bulk of the work where we change how we
convert between device private pages to device private offsets and then
use a new interface for allocating device private pages without the need
for reserving physical address space.

By removing the device private pages from the physical address space,
this series also opens up the possibility to moving away from tracking
device private memory using struct pages in the future. This is
desirable as on systems with large amounts of memory these device
private struct pages use a signifiant amount of memory and take a
significant amount of time to initialize.

*** Changes in v2 ***

The most significant change in v2 is addressing code paths that are
common between MEMORY_DEVICE_PRIVATE and MEMORY_DEVICE_COHERENT devices.

This had been overlooked in previous revisions.

To do this we introduce a migrate_pfn_from_page() helper which will call
device_private_offset_to_page() and set the MIGRATE_PFN_DEVICE_PRIVATE
flag if required.

In places where we could have a device private offset
(MEMORY_DEVICE_PRIVATE) or a pfn (MEMORY_DEVICE_COHERENT) we update to
use an mpfn to disambiguate.  This includes some users in the drivers
and migrate_device_{pfns,range}().

Seeking opinions on using the mpfns like this or if a new type would be
preferred.

  - mm/migrate_device: Introduce migrate_pfn_from_page() helper
    - New to series

  - drm/amdkfd: Use migrate pfns internally
    - New to series

  - mm/migrate_device: Make migrate_device_{pfns,range}() take mpfns
    - New to series

  - mm/migrate_device: Add migrate PFN flag to track device private pages
    - Update for migrate_pfn_from_page()
    - Rename to MIGRATE_PFN_DEVICE_PRIVATE
    - drm/amd: Check adev->gmc.xgmi.connected_to_cpu
    - lib/test_hmm.c: Check chunk->pagemap.type == MEMORY_DEVICE_PRIVATE

  - mm: Add helpers to create migration entries from struct pages
    - Add a flags param

  - mm: Add a new swap type for migration entries of device private pages
    - Add softleaf_is_migration_device_private_read()

  - mm: Add helpers to create device private entries from struct pages
    - Add a flags param

  - mm: Remove device private pages from the physical address space
    - Make sure last member of struct dev_pagemap remains DECLARE_FLEX_ARRAY(struct range, ranges);

Testing:
- selftests/mm/hmm-tests on an amd64 VM

* NOTE: I will need help in testing the driver changes *

Revisions:
- RFC: https://lore.kernel.org/all/20251128044146.80050-1-jniethe@nvidia.com/
- v1: https://lore.kernel.org/all/20251231043154.42931-1-jniethe@nvidia.com/

[0] https://lore.kernel.org/lkml/CAMj1kXFZ=4hLL1w6iCV5O5uVoVLHAJbc0rr40j24ObenAjXe9w@mail.gmail.com/

Jordan Niethe (11):
  mm/migrate_device: Introduce migrate_pfn_from_page() helper
  drm/amdkfd: Use migrate pfns internally
  mm/migrate_device: Make migrate_device_{pfns,range}() take mpfns
  mm/migrate_device: Add migrate PFN flag to track device private pages
  mm/page_vma_mapped: Add flags to page_vma_mapped_walk::pfn to track
    device private pages
  mm: Add helpers to create migration entries from struct pages
  mm: Add a new swap type for migration entries of device private pages
  mm: Add helpers to create device private entries from struct pages
  mm/util: Add flag to track device private pages in page snapshots
  mm/hmm: Add flag to track device private pages
  mm: Remove device private pages from the physical address space

 Documentation/mm/hmm.rst                 |  11 +-
 arch/powerpc/kvm/book3s_hv_uvmem.c       |  43 ++---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  45 +++---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h |   2 +-
 drivers/gpu/drm/drm_pagemap.c            |  11 +-
 drivers/gpu/drm/nouveau/nouveau_dmem.c   |  45 ++----
 drivers/gpu/drm/xe/xe_svm.c              |  35 ++--
 fs/proc/page.c                           |   6 +-
 include/drm/drm_pagemap.h                |   8 +-
 include/linux/hmm.h                      |   7 +-
 include/linux/leafops.h                  | 116 ++++++++++++--
 include/linux/memremap.h                 |  64 +++++++-
 include/linux/migrate.h                  |  23 ++-
 include/linux/mm.h                       |   9 +-
 include/linux/rmap.h                     |  33 +++-
 include/linux/swap.h                     |   8 +-
 include/linux/swapops.h                  | 136 ++++++++++++++++
 lib/test_hmm.c                           |  86 ++++++----
 mm/debug.c                               |   9 +-
 mm/hmm.c                                 |   5 +-
 mm/huge_memory.c                         |  43 ++---
 mm/hugetlb.c                             |  15 +-
 mm/memory.c                              |   5 +-
 mm/memremap.c                            | 193 ++++++++++++++++++-----
 mm/migrate.c                             |   6 +-
 mm/migrate_device.c                      |  76 +++++----
 mm/mm_init.c                             |   8 +-
 mm/mprotect.c                            |  10 +-
 mm/page_vma_mapped.c                     |  32 +++-
 mm/rmap.c                                |  59 ++++---
 mm/util.c                                |   8 +-
 mm/vmscan.c                              |   2 +-
 32 files changed, 820 insertions(+), 339 deletions(-)


base-commit: bbd2596084d7d562841571575239ef867c69bdce
-- 
2.34.1

