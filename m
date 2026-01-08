Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4700D1489F
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 06:01:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79E9410E2F7;
	Thu,  8 Jan 2026 06:01:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="YNEvDgx9";
	dkim-atps=neutral
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010015.outbound.protection.outlook.com
 [52.101.193.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2FB210E2F7
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 06:01:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ohn6u98NrFkJ17KjrBlmx1vq/Gi9fTiE1bfmcHcljyUg8Ai992JhM5MIzkgD33JZV1aHKz1vpN967ZYIdod6xqWdqG7DJHdtCEEXE3f/o6bGmHX6yyxoi2RFWWlN1uRZ9CiNbTFmRJj0BD1LOACTMFpQjBPakGO1uNUAQxV+GWfd6gw6RMFONbmYWSg5Ry3CxlPSg4s5R89TyqV7ej+l207hcdeLfaoNjo/5Q81JslIPVIckeSRPkBPPJhn1cJ1sKxxY/ExYruZ5MwucslZWMrdjNbuJCuMxiuIQeFUWlFI39J81S43H8DlLO/B60STr5u9vQOpNdRm9XlOkxXSAwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P+u1ZUxeUG+tbLn9wLsQrajNZHD5aIk0doamddcJLW4=;
 b=QmYXBPkxexXXnJyp5D6MSiXLKvk0ou6cUhkndsuu0WPfuOc4NlP3UkTsSPvYKiOMCAHaljkpd1jFI8O7c2TEM3TDOu/2FPw89xjuIYt0MCFaadJ+81Uf1nh6zxZv8rYsfoABIS2IkcSaFfl/6NrxfUloHwxr6sIe/8wX5WJxCSBk2KUjLFwD5IP1pSOUYOgSCymwuOLGW0M/YCuIC1AOfTbsc7vslbBV6P40LM/FK4whXzJeeF8GPkgmNVfWh2tZHuNWRY1aDNb/Y/ssuLs0SgoU3VPA4qADLMa02EWG8rjtjv//y7JZgqmXda8/HAWHcEuxPjX/PC43kYP359mXVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P+u1ZUxeUG+tbLn9wLsQrajNZHD5aIk0doamddcJLW4=;
 b=YNEvDgx9HN00WmKlmTHWrHxKcSXDw4nHaKHz9dJ2IFs4qGPf/vWvntZx9Ig2zDWXpBp1aDpU7zh2WfJ0x9o4sTf/jQo1i37lU0HNbx2fpdbrH+pgN0EKsfd3dWHDPed1Vi8SIWLJJww5+txrMP2956lPtxZRSLfXhHziCnbHuFWBjLX9qoZgtJfY+DTED3RncJN7hglxgX5E0lGB7jGwzKqe0V08ACLJlGPqmlBebppJjMtvxjt0CF50kKNjlgNNZ2NtGArAQfFjry7zj0C6tGRsJHk4k3pp/HODolD9A2A7QF4Be/wItl2sIi7byHba5F5YUZd4WzqafHcThDMvsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 BL3PR12MB6618.namprd12.prod.outlook.com (2603:10b6:208:38d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Thu, 8 Jan
 2026 06:01:46 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 06:01:46 +0000
From: Jordan Niethe <jniethe@nvidia.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [RESENDv2 v2 11/11] mm: Remove device private pages from the physical
 address space
Date: Thu,  8 Jan 2026 17:01:02 +1100
Message-Id: <20260108060102.41357-12-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108060102.41357-1-jniethe@nvidia.com>
References: <20260108060102.41357-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0107.namprd03.prod.outlook.com
 (2603:10b6:a03:333::22) To DM4PR12MB9072.namprd12.prod.outlook.com
 (2603:10b6:8:be::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|BL3PR12MB6618:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a49a7c2-9cc7-4c70-188d-08de4e7b679b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WR77gUBPWtK5UrAmrDojOsF6sSZLEJHRHZl0yl26WEBpbn+2g+Ma0Vq1hpvC?=
 =?us-ascii?Q?BSghEZ+nx46UdiU5SFGos4wB+mOKddxj2OmXwBAjVLln0WqSFypxSOg8n1Hb?=
 =?us-ascii?Q?4c6b02shjqcTBCbjsH+g9QRzn58theoI33HDemnTvUoTUy2OsjHJ2sf7qQHf?=
 =?us-ascii?Q?zKG+xdye3VpoYV4psLvHukjt/HA6OB7IA+TmkCFOKZ55sXsHMobAz8jHX5ES?=
 =?us-ascii?Q?EcroGUR5h6FQrQNVJtksBPHmVcziBFjl03rLSeL/DqOkJNQGKviRVIvem7Ai?=
 =?us-ascii?Q?FgVpeRKI8kDldkCd1wikXwAqhEmUE8n3cWAbGlGillemnhCnVQAef0MbdZmR?=
 =?us-ascii?Q?6YrG05jAZKa0RExYI16lTJeCNT74v2iycqGN89KEfZDRXJcKgZ3Ghsktvh8j?=
 =?us-ascii?Q?lBy2yVE5BWjtLOzg0GQ9K1xzA2b68MczZwfEANqWN3UqDR+aAUT3NAAL3pse?=
 =?us-ascii?Q?91sVcQrK5xHs/885Wblu5gCVL24TS2ziLYIyzVMgJ6+Lg3jIuZTvYsEqFDXx?=
 =?us-ascii?Q?5Bwm4ok0Xfodr715eHTwoTA6xhIf0py8SbYEzxytoYIR27IaXX4KoUkVX9bt?=
 =?us-ascii?Q?mXUE7Ck6xBmh6AwfITnelXeErL8dYxZSQlNPHCH+7+4FdnM9s+QUrwK5YKEA?=
 =?us-ascii?Q?MPUZcneT6V5zaTpbNiju8ZEZo9oVjCu3EEpLIuv2gnbviRaveApHO2p1N4QS?=
 =?us-ascii?Q?Xwh9gCVm81WukbxhI1WuNgv9B+PNaWGhjE9jkc2cC8PqYPX7Q8bHQclDGAX2?=
 =?us-ascii?Q?U3kCIlMxtuNhvM3deO3WCb1HBv/N5A/tCRT2XS9GMSdQgPB7+EupGPE/6WsJ?=
 =?us-ascii?Q?32ai8tVjO7Bip5xgbYAvk+/nNYGYW4SAnYqdCAg+ne9bT8EYQgcBKoKHfZFE?=
 =?us-ascii?Q?WvLKiIJhhwbYYLQi0qjaaXvEnZ0xGPXLYpepw947+xAXh28RFpcQcdbOon0X?=
 =?us-ascii?Q?p2XaOKFXs0y/X+jnLHQYm4Cy51jrBb0Wr0ro2+Aa9YhgkusJAY21Hwo4mn+r?=
 =?us-ascii?Q?SEmqY6MuI3GyNDJ3OVCan9FCG2tedhpRbGr5Qe/ZI7+xXSyamtA7fB87dNPw?=
 =?us-ascii?Q?mdAtrkrYYX8hz2ra3a8qZRUoZ6A87K0vQDxuGI6T8UV5vca7e9GMU1W1o4VR?=
 =?us-ascii?Q?Dp0rGRQGWopG3fRE1+GKKSk6/PcWH3ox8ihlTJ7c3RrAlOfGQW1V5u4wtbqh?=
 =?us-ascii?Q?4tpJStQyfKn/uUu1v0VDqb5flWuqG+1P7WwC/7v0iazZ88ZnpJ0/7VmNzg/J?=
 =?us-ascii?Q?KnitKAhOMWy4DfgCTFXc319Raux0WHP9vHbpLbO3LFQKEGMzl3MT4M1hJkFp?=
 =?us-ascii?Q?7uW2gxa+5K7KFoNjd1VcEezenFKR/+70xuq8wI7fPIL1fjY4CEl3xOgYjPq0?=
 =?us-ascii?Q?vpQC9/sN29eLHT3lawBAnp61ShxIT89DSXeJ6vCXpW64Zws2EgSTXKd9XZnW?=
 =?us-ascii?Q?CPwXR5dW259NtOMTl+gE+wanGsxDizhE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB9072.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IXOqEKqosmb+SdDpRszh3zCQFk/4WJq7PlG3cQSZKUSkpzs0ix1NaH6PG82Z?=
 =?us-ascii?Q?bfwsaj9ljZsbx39ZnGa2KJ4WS0N+iIY1wJDxB/HsNCZ5nKamWA+vvuhVfLj1?=
 =?us-ascii?Q?XwrG33Evkxwbgr/vCNcHFYCe/UHhKPCXVAmIcRflYckgH0qfBipWGHrPDaFP?=
 =?us-ascii?Q?AefcqB1snP1EhcAjAkLpI4PZoT9XPzo8v+YEPxLqOttXZyD6L19VCF7ZLHmo?=
 =?us-ascii?Q?hNSADXRAbn5HRXayi2lSOqp2xHNAv6Dp6oAEHByTmHHkJdSreUkxdnLZiUwt?=
 =?us-ascii?Q?86NP3ymcdQRRzRK2Ud0pEEsA/mFEMZ9cnKqq9NcniQ5UxaiUi5yQZix3MZAm?=
 =?us-ascii?Q?QmKZRCVb/8EuA517ywnHqsraSu9WBFZI8SfFSYnQlJisGrBzaJvOcLqbEVAl?=
 =?us-ascii?Q?UhV8DzZies+qlGtzKRNPcZGRGHeSlmjlXgpEt/hQTvhBn/VqyTjEFV37WXK4?=
 =?us-ascii?Q?7mA/0rpQzcijFsOgMSvbLgWleyLubO/WtFiIQ9G5K3kQ55l/0vnZrh+x8X9m?=
 =?us-ascii?Q?gmB5TVX4WCHnyYCz0+gf9qUBRqq64lVF3xGlXLgCm6ZwLj4aOyL165mLOqIj?=
 =?us-ascii?Q?zCTM/06BfIozWaTDlo7YiWLbpqLEyHFIjsbpdzyp+uJhjD0Uxs/f1Whgq3Rn?=
 =?us-ascii?Q?8tShfkRxbDRWNjP6KBBNpAlEORQ1YOzPZWdJB6ilb4YcFpM8Ja8R50MDEJIO?=
 =?us-ascii?Q?NVQuigA/6mqJ096JYZQGavQ9UIfm57I9aqnws7Rn/cJp5UPcw/CRfZzRyrEX?=
 =?us-ascii?Q?+eg4UQwQ7GFFLuvEF8Yl29w385KgX904c6nj/smeFy2+iBsK27kiLCsQ+VLm?=
 =?us-ascii?Q?V5Cnms8Yw5BzcMlVZZ7AAiBHbtxvqakdD8fT+gSV63Ob77fEhMu4Pn647Mvl?=
 =?us-ascii?Q?shksNsiA9QqJhy/PoxOypyxD+DRfLSSQVFi+ufdmjDVOMZFw9jkM7CNqLjwn?=
 =?us-ascii?Q?HDJe5yzEfbFSeC0C1Q5Do567nDLOptCxiNNDhIDMd45F3UwEDcqm8hZe6AqH?=
 =?us-ascii?Q?eSw730Ow7lHwdjsvh7lGX0as2gWOlPYxbuzL+/6sIgAsLTKsMFtgWZXjAVAH?=
 =?us-ascii?Q?SCcUA6WhIi6wMrWo/gkw5YcBifFXvETLfCbtDBlPPqaJ3kzhJ55+UTa6b0fe?=
 =?us-ascii?Q?guoK+87BVER7rtaOqFPNXyOQT6z8vjSGZt+8jy3l5PH6QrKzZEluyHAbDfiE?=
 =?us-ascii?Q?YSi3oO8I00sez3kfMX5xeVC+kT+nCj3WrXNiQjXwJKhxOv8EUVdnODgnc1Vx?=
 =?us-ascii?Q?/YCvUm3UdhRjLwkhDpv6hruNZ6DqzxRvc+OjDCAWW0D18LHHRg+PkepOrlQX?=
 =?us-ascii?Q?BrNaFQs8ggP3UPI8g0kyQZC/oc+xq+V4wUAz7S9gcjiF7jdoZtRsqM0cmvbt?=
 =?us-ascii?Q?3q+OKV51pCt/IFcRSuXo/WrysPAxZoD2rEFkElpKs/077LAObNno1LUfWVy6?=
 =?us-ascii?Q?DQrIY+cHmsHo4FgjeKG0szf7C9wJ5K+qe0JScam8UTNZ1Zx0mzjLizLPwTYm?=
 =?us-ascii?Q?YrbfJcn+XblCFnKnKrSuYT4vyn5bxE7YiXrP7rLQNJzY/i9/M3DMG0HSBtWp?=
 =?us-ascii?Q?hn8yM7tmJzQjWBK153TTxlB7WG45gqCYnnEu4vQ1tDTuX6+Lps5lmSZ3f2fp?=
 =?us-ascii?Q?iJe0CsKCQCDL9T9sh2844DuANb7uU5o5CbL7Jh9nRbaJY3jaLq87d7ZqJUr8?=
 =?us-ascii?Q?2kVQJAQQb+e4r1gG1xfL48zDFwYBZulvdFRXm9BDWuWnVuu8jEj4MDhytRod?=
 =?us-ascii?Q?ieS+m8V2RA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a49a7c2-9cc7-4c70-188d-08de4e7b679b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 06:01:46.5626 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aHi83vfESB4fvWMJB1AKPx+sRu/5rY6bQtrrg2bBk2BIQT6Hs/hHCwLKBO6fBpV1d0HtoN5aAqmcn0jjNm83Rg==
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

Currently when creating these device private struct pages, the first
step is to use request_free_mem_region() to get a range of physical
address space large enough to represent the devices memory. This
allocated physical address range is then remapped as device private
memory using memremap_pages().

Needing allocation of physical address space has some problems:

  1) There may be insufficient physical address space to represent the
     device memory. KASLR reducing the physical address space and VM
     configurations with limited physical address space increase the
     likelihood of hitting this especially as device memory increases. This
     has been observed to prevent device private from being initialized.

  2) Attempting to add the device private pages to the linear map at
     addresses beyond the actual physical memory causes issues on
     architectures like aarch64 meaning the feature does not work there.

Instead of using the physical address space, introduce a device private
address space and allocate devices regions from there to represent the
device private pages.

Introduce a new interface memremap_device_private_pagemap() that
allocates a requested amount of device private address space and creates
the necessary device private pages.

To support this new interface, struct dev_pagemap needs some changes:

  - Add a new dev_pagemap::nr_pages field as an input parameter.
  - Add a new dev_pagemap::pages array to store the device
    private pages.

When using memremap_device_private_pagemap(), rather then passing in
dev_pagemap::ranges[dev_pagemap::nr_ranges] of physical address space to
be remapped, dev_pagemap::nr_ranges will always be 1, and the device
private range that is reserved is returned in dev_pagemap::range.

Forbid calling memremap_pages() with dev_pagemap::ranges::type =
MEMORY_DEVICE_PRIVATE.

Represent this device private address space using a new
device_private_pgmap_tree maple tree. This tree maps a given device
private address to a struct dev_pagemap, where a specific device private
page may then be looked up in that dev_pagemap::pages array.

Device private address space can be reclaimed and the assoicated device
private pages freed using the corresponding new
memunmap_device_private_pagemap() interface.

Because the device private pages now live outside the physical address
space, they no longer have a normal PFN. This means that page_to_pfn(),
et al. are no longer meaningful.

Introduce helpers:

  - device_private_page_to_offset()
  - device_private_folio_to_offset()

to take a given device private page / folio and return its offset within
the device private address space.

Update the places where we previously converted a device private page to
a PFN to use these new helpers. When we encounter a device private
offset, instead of looking up its page within the pagemap use
device_private_offset_to_page() instead.

Update the existing users:

 - lib/test_hmm.c
 - ppc ultravisor
 - drm/amd/amdkfd
 - gpu/drm/xe
 - gpu/drm/nouveau

to use the new memremap_device_private_pagemap() interface.

Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 Documentation/mm/hmm.rst                 |  11 +-
 arch/powerpc/kvm/book3s_hv_uvmem.c       |  41 ++---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  23 +--
 drivers/gpu/drm/nouveau/nouveau_dmem.c   |  35 ++--
 drivers/gpu/drm/xe/xe_svm.c              |  26 +--
 include/linux/hmm.h                      |   3 +
 include/linux/leafops.h                  |  16 +-
 include/linux/memremap.h                 |  64 +++++++-
 include/linux/migrate.h                  |   6 +-
 include/linux/mm.h                       |   2 +
 include/linux/rmap.h                     |   5 +-
 include/linux/swapops.h                  |  10 +-
 lib/test_hmm.c                           |  69 ++++----
 mm/debug.c                               |   9 +-
 mm/memremap.c                            | 193 ++++++++++++++++++-----
 mm/mm_init.c                             |   8 +-
 mm/page_vma_mapped.c                     |  19 ++-
 mm/rmap.c                                |  43 +++--
 mm/util.c                                |   5 +-
 19 files changed, 389 insertions(+), 199 deletions(-)

diff --git a/Documentation/mm/hmm.rst b/Documentation/mm/hmm.rst
index 7d61b7a8b65b..27067a6a2408 100644
--- a/Documentation/mm/hmm.rst
+++ b/Documentation/mm/hmm.rst
@@ -276,17 +276,12 @@ These can be allocated and freed with::
     struct resource *res;
     struct dev_pagemap pagemap;
 
-    res = request_free_mem_region(&iomem_resource, /* number of bytes */,
-                                  "name of driver resource");
     pagemap.type = MEMORY_DEVICE_PRIVATE;
-    pagemap.range.start = res->start;
-    pagemap.range.end = res->end;
-    pagemap.nr_range = 1;
+    pagemap.nr_pages = /* number of pages */;
     pagemap.ops = &device_devmem_ops;
-    memremap_pages(&pagemap, numa_node_id());
+    memremap_device_private_pagemap(&pagemap, numa_node_id());
 
-    memunmap_pages(&pagemap);
-    release_mem_region(pagemap.range.start, range_len(&pagemap.range));
+    memunmap_device_private_pagemap(&pagemap);
 
 There are also devm_request_free_mem_region(), devm_memremap_pages(),
 devm_memunmap_pages(), and devm_release_mem_region() when the resources can
diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
index 67910900af7b..948747db8231 100644
--- a/arch/powerpc/kvm/book3s_hv_uvmem.c
+++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
@@ -636,7 +636,7 @@ void kvmppc_uvmem_drop_pages(const struct kvm_memory_slot *slot,
 		mutex_lock(&kvm->arch.uvmem_lock);
 
 		if (kvmppc_gfn_is_uvmem_pfn(gfn, kvm, &uvmem_pfn)) {
-			uvmem_page = pfn_to_page(uvmem_pfn);
+			uvmem_page = device_private_offset_to_page(uvmem_pfn);
 			pvt = uvmem_page->zone_device_data;
 			pvt->skip_page_out = skip_page_out;
 			pvt->remove_gfn = true;
@@ -721,7 +721,7 @@ static struct page *kvmppc_uvmem_get_page(unsigned long gpa, struct kvm *kvm)
 	pvt->gpa = gpa;
 	pvt->kvm = kvm;
 
-	dpage = pfn_to_page(uvmem_pfn);
+	dpage = device_private_offset_to_page(uvmem_pfn);
 	dpage->zone_device_data = pvt;
 	zone_device_page_init(dpage, 0);
 	return dpage;
@@ -888,7 +888,7 @@ static unsigned long kvmppc_share_page(struct kvm *kvm, unsigned long gpa,
 	srcu_idx = srcu_read_lock(&kvm->srcu);
 	mutex_lock(&kvm->arch.uvmem_lock);
 	if (kvmppc_gfn_is_uvmem_pfn(gfn, kvm, &uvmem_pfn)) {
-		uvmem_page = pfn_to_page(uvmem_pfn);
+		uvmem_page = device_private_offset_to_page(uvmem_pfn);
 		pvt = uvmem_page->zone_device_data;
 		pvt->skip_page_out = true;
 		/*
@@ -906,7 +906,7 @@ static unsigned long kvmppc_share_page(struct kvm *kvm, unsigned long gpa,
 
 	mutex_lock(&kvm->arch.uvmem_lock);
 	if (kvmppc_gfn_is_uvmem_pfn(gfn, kvm, &uvmem_pfn)) {
-		uvmem_page = pfn_to_page(uvmem_pfn);
+		uvmem_page = device_private_offset_to_page(uvmem_pfn);
 		pvt = uvmem_page->zone_device_data;
 		pvt->skip_page_out = true;
 		pvt->remove_gfn = false; /* it continues to be a valid GFN */
@@ -1017,7 +1017,7 @@ static vm_fault_t kvmppc_uvmem_migrate_to_ram(struct vm_fault *vmf)
 static void kvmppc_uvmem_folio_free(struct folio *folio)
 {
 	struct page *page = &folio->page;
-	unsigned long pfn = page_to_pfn(page) -
+	unsigned long pfn = device_private_page_to_offset(page) -
 			(kvmppc_uvmem_pgmap.range.start >> PAGE_SHIFT);
 	struct kvmppc_uvmem_page_pvt *pvt;
 
@@ -1159,8 +1159,6 @@ int kvmppc_uvmem_init(void)
 {
 	int ret = 0;
 	unsigned long size;
-	struct resource *res;
-	void *addr;
 	unsigned long pfn_last, pfn_first;
 
 	size = kvmppc_get_secmem_size();
@@ -1174,27 +1172,18 @@ int kvmppc_uvmem_init(void)
 		goto out;
 	}
 
-	res = request_free_mem_region(&iomem_resource, size, "kvmppc_uvmem");
-	if (IS_ERR(res)) {
-		ret = PTR_ERR(res);
-		goto out;
-	}
-
 	kvmppc_uvmem_pgmap.type = MEMORY_DEVICE_PRIVATE;
-	kvmppc_uvmem_pgmap.range.start = res->start;
-	kvmppc_uvmem_pgmap.range.end = res->end;
 	kvmppc_uvmem_pgmap.nr_range = 1;
+	kvmppc_uvmem_pgmap.nr_pages = size / PAGE_SIZE;
 	kvmppc_uvmem_pgmap.ops = &kvmppc_uvmem_ops;
 	/* just one global instance: */
 	kvmppc_uvmem_pgmap.owner = &kvmppc_uvmem_pgmap;
-	addr = memremap_pages(&kvmppc_uvmem_pgmap, NUMA_NO_NODE);
-	if (IS_ERR(addr)) {
-		ret = PTR_ERR(addr);
-		goto out_free_region;
-	}
+	ret = memremap_device_private_pagemap(&kvmppc_uvmem_pgmap, NUMA_NO_NODE);
+	if (ret)
+		goto out;
 
-	pfn_first = res->start >> PAGE_SHIFT;
-	pfn_last = pfn_first + (resource_size(res) >> PAGE_SHIFT);
+	pfn_first = kvmppc_uvmem_pgmap.range.start >> PAGE_SHIFT;
+	pfn_last = pfn_first + (range_len(&kvmppc_uvmem_pgmap.range) >> PAGE_SHIFT);
 	kvmppc_uvmem_bitmap = bitmap_zalloc(pfn_last - pfn_first, GFP_KERNEL);
 	if (!kvmppc_uvmem_bitmap) {
 		ret = -ENOMEM;
@@ -1204,9 +1193,7 @@ int kvmppc_uvmem_init(void)
 	pr_info("KVMPPC-UVMEM: Secure Memory size 0x%lx\n", size);
 	return ret;
 out_unmap:
-	memunmap_pages(&kvmppc_uvmem_pgmap);
-out_free_region:
-	release_mem_region(res->start, size);
+	memunmap_device_private_pagemap(&kvmppc_uvmem_pgmap);
 out:
 	return ret;
 }
@@ -1216,8 +1203,6 @@ void kvmppc_uvmem_free(void)
 	if (!kvmppc_uvmem_bitmap)
 		return;
 
-	memunmap_pages(&kvmppc_uvmem_pgmap);
-	release_mem_region(kvmppc_uvmem_pgmap.range.start,
-			   range_len(&kvmppc_uvmem_pgmap.range));
+	memunmap_device_private_pagemap(&kvmppc_uvmem_pgmap);
 	bitmap_free(kvmppc_uvmem_bitmap);
 }
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 1a07a8b92e8f..1e7768b91d9f 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -1024,9 +1024,9 @@ int kgd2kfd_init_zone_device(struct amdgpu_device *adev)
 {
 	struct amdgpu_kfd_dev *kfddev = &adev->kfd;
 	struct dev_pagemap *pgmap;
-	struct resource *res = NULL;
 	unsigned long size;
 	void *r;
+	int ret;
 
 	/* Page migration works on gfx9 or newer */
 	if (amdgpu_ip_version(adev, GC_HWIP, 0) < IP_VERSION(9, 0, 1))
@@ -1047,11 +1047,7 @@ int kgd2kfd_init_zone_device(struct amdgpu_device *adev)
 		pgmap->range.end = adev->gmc.aper_base + adev->gmc.aper_size - 1;
 		pgmap->type = MEMORY_DEVICE_COHERENT;
 	} else {
-		res = devm_request_free_mem_region(adev->dev, &iomem_resource, size);
-		if (IS_ERR(res))
-			return PTR_ERR(res);
-		pgmap->range.start = res->start;
-		pgmap->range.end = res->end;
+		pgmap->nr_pages = size / PAGE_SIZE;
 		pgmap->type = MEMORY_DEVICE_PRIVATE;
 	}
 
@@ -1062,14 +1058,19 @@ int kgd2kfd_init_zone_device(struct amdgpu_device *adev)
 	/* Device manager releases device-specific resources, memory region and
 	 * pgmap when driver disconnects from device.
 	 */
-	r = devm_memremap_pages(adev->dev, pgmap);
-	if (IS_ERR(r)) {
+	if (pgmap->type == MEMORY_DEVICE_PRIVATE) {
+		ret = devm_memremap_device_private_pagemap(adev->dev, pgmap);
+	} else {
+		r = devm_memremap_pages(adev->dev, pgmap);
+		if (IS_ERR(r))
+			ret = PTR_ERR(r);
+	}
+
+	if (ret) {
 		pr_err("failed to register HMM device memory\n");
-		if (pgmap->type == MEMORY_DEVICE_PRIVATE)
-			devm_release_mem_region(adev->dev, res->start, resource_size(res));
 		/* Disable SVM support capability */
 		pgmap->type = 0;
-		return PTR_ERR(r);
+		return ret;
 	}
 
 	pr_debug("reserve %ldMB system memory for VRAM pages struct\n",
diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index adfa3df5cbc5..37fe1cfba414 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -109,7 +109,7 @@ static struct nouveau_drm *page_to_drm(struct page *page)
 unsigned long nouveau_dmem_page_addr(struct page *page)
 {
 	struct nouveau_dmem_chunk *chunk = nouveau_page_to_chunk(page);
-	unsigned long off = (page_to_pfn(page) << PAGE_SHIFT) -
+	unsigned long off = (device_private_page_to_offset(page) << PAGE_SHIFT) -
 				chunk->pagemap.range.start;
 
 	return chunk->bo->offset + off;
@@ -297,9 +297,7 @@ nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage,
 			 bool is_large)
 {
 	struct nouveau_dmem_chunk *chunk;
-	struct resource *res;
 	struct page *page;
-	void *ptr;
 	unsigned long i, pfn_first, pfn;
 	int ret;
 
@@ -309,39 +307,28 @@ nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage,
 		goto out;
 	}
 
-	/* Allocate unused physical address space for device private pages. */
-	res = request_free_mem_region(&iomem_resource, DMEM_CHUNK_SIZE * NR_CHUNKS,
-				      "nouveau_dmem");
-	if (IS_ERR(res)) {
-		ret = PTR_ERR(res);
-		goto out_free;
-	}
-
 	chunk->drm = drm;
 	chunk->pagemap.type = MEMORY_DEVICE_PRIVATE;
-	chunk->pagemap.range.start = res->start;
-	chunk->pagemap.range.end = res->end;
 	chunk->pagemap.nr_range = 1;
+	chunk->pagemap.nr_pages = DMEM_CHUNK_SIZE * NR_CHUNKS / PAGE_SIZE;
 	chunk->pagemap.ops = &nouveau_dmem_pagemap_ops;
 	chunk->pagemap.owner = drm->dev;
 
 	ret = nouveau_bo_new_pin(&drm->client, NOUVEAU_GEM_DOMAIN_VRAM, DMEM_CHUNK_SIZE,
 				 &chunk->bo);
 	if (ret)
-		goto out_release;
+		goto out_free;
 
-	ptr = memremap_pages(&chunk->pagemap, numa_node_id());
-	if (IS_ERR(ptr)) {
-		ret = PTR_ERR(ptr);
+	ret = memremap_device_private_pagemap(&chunk->pagemap, numa_node_id());
+	if (ret)
 		goto out_bo_free;
-	}
 
 	mutex_lock(&drm->dmem->mutex);
 	list_add(&chunk->list, &drm->dmem->chunks);
 	mutex_unlock(&drm->dmem->mutex);
 
 	pfn_first = chunk->pagemap.range.start >> PAGE_SHIFT;
-	page = pfn_to_page(pfn_first);
+	page = device_private_offset_to_page(pfn_first);
 	spin_lock(&drm->dmem->lock);
 
 	pfn = pfn_first;
@@ -350,12 +337,12 @@ nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage,
 
 		if (!IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) || !is_large) {
 			for (j = 0; j < DMEM_CHUNK_NPAGES - 1; j++, pfn++) {
-				page = pfn_to_page(pfn);
+				page = device_private_offset_to_page(pfn);
 				page->zone_device_data = drm->dmem->free_pages;
 				drm->dmem->free_pages = page;
 			}
 		} else {
-			page = pfn_to_page(pfn);
+			page = device_private_offset_to_page(pfn);
 			page->zone_device_data = drm->dmem->free_folios;
 			drm->dmem->free_folios = page_folio(page);
 			pfn += DMEM_CHUNK_NPAGES;
@@ -382,8 +369,6 @@ nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage,
 
 out_bo_free:
 	nouveau_bo_unpin_del(&chunk->bo);
-out_release:
-	release_mem_region(chunk->pagemap.range.start, range_len(&chunk->pagemap.range));
 out_free:
 	kfree(chunk);
 out:
@@ -543,9 +528,7 @@ nouveau_dmem_fini(struct nouveau_drm *drm)
 		nouveau_bo_unpin_del(&chunk->bo);
 		WARN_ON(chunk->callocated);
 		list_del(&chunk->list);
-		memunmap_pages(&chunk->pagemap);
-		release_mem_region(chunk->pagemap.range.start,
-				   range_len(&chunk->pagemap.range));
+		memunmap_device_private_pagemap(&chunk->pagemap);
 		kfree(chunk);
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index a8aad9e0b1fb..c28fb987d42e 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -452,7 +452,7 @@ static u64 xe_page_to_dpa(struct page *page)
 	struct xe_pagemap *xpagemap = xe_page_to_pagemap(page);
 	struct xe_vram_region *vr = xe_pagemap_to_vr(xpagemap);
 	u64 hpa_base = xpagemap->hpa_base;
-	u64 pfn = page_to_pfn(page);
+	u64 pfn = device_private_page_to_offset(page);
 	u64 offset;
 	u64 dpa;
 
@@ -1745,8 +1745,6 @@ static struct xe_pagemap *xe_pagemap_create(struct xe_device *xe, struct xe_vram
 	struct xe_pagemap *xpagemap;
 	struct dev_pagemap *pagemap;
 	struct drm_pagemap *dpagemap;
-	struct resource *res;
-	void *addr;
 	int err;
 
 	xpagemap = kzalloc(sizeof(*xpagemap), GFP_KERNEL);
@@ -1763,36 +1761,24 @@ static struct xe_pagemap *xe_pagemap_create(struct xe_device *xe, struct xe_vram
 	if (err)
 		goto out_no_dpagemap;
 
-	res = devm_request_free_mem_region(dev, &iomem_resource,
-					   vr->usable_size);
-	if (IS_ERR(res)) {
-		err = PTR_ERR(res);
-		goto out_err;
-	}
-
 	err = drm_pagemap_acquire_owner(&xpagemap->peer, &xe_owner_list,
 					xe_has_interconnect);
 	if (err)
-		goto out_no_owner;
+		goto out_err;
 
 	pagemap->type = MEMORY_DEVICE_PRIVATE;
-	pagemap->range.start = res->start;
-	pagemap->range.end = res->end;
 	pagemap->nr_range = 1;
+	pagemap->nr_pages = vr->usable_size / PAGE_SIZE;
 	pagemap->owner = xpagemap->peer.owner;
 	pagemap->ops = drm_pagemap_pagemap_ops_get();
-	addr = devm_memremap_pages(dev, pagemap);
-	if (IS_ERR(addr)) {
-		err = PTR_ERR(addr);
+	err = devm_memremap_device_private_pagemap(dev, pagemap);
+	if (err)
 		goto out_no_pages;
-	}
-	xpagemap->hpa_base = res->start;
+	xpagemap->hpa_base = pagemap->range.start;
 	return xpagemap;
 
 out_no_pages:
 	drm_pagemap_release_owner(&xpagemap->peer);
-out_no_owner:
-	devm_release_mem_region(dev, res->start, res->end - res->start + 1);
 out_err:
 	drm_pagemap_put(dpagemap);
 	return ERR_PTR(err);
diff --git a/include/linux/hmm.h b/include/linux/hmm.h
index d8756c341620..25bb4df298f7 100644
--- a/include/linux/hmm.h
+++ b/include/linux/hmm.h
@@ -68,6 +68,9 @@ enum hmm_pfn_flags {
  */
 static inline struct page *hmm_pfn_to_page(unsigned long hmm_pfn)
 {
+	if (hmm_pfn & HMM_PFN_DEVICE_PRIVATE)
+		return device_private_offset_to_page(hmm_pfn & ~HMM_PFN_FLAGS);
+
 	return pfn_to_page(hmm_pfn & ~HMM_PFN_FLAGS);
 }
 
diff --git a/include/linux/leafops.h b/include/linux/leafops.h
index aa1b465e6556..a7b2e1681b09 100644
--- a/include/linux/leafops.h
+++ b/include/linux/leafops.h
@@ -455,7 +455,13 @@ static inline unsigned long softleaf_to_flags(softleaf_t entry)
  */
 static inline struct page *softleaf_to_page(softleaf_t entry)
 {
-	struct page *page = pfn_to_page(softleaf_to_pfn(entry));
+	struct page *page;
+
+	if (softleaf_is_migration_device_private(entry) ||
+	    softleaf_is_device_private(entry))
+		page = device_private_entry_to_page(entry);
+	else
+		page = pfn_to_page(softleaf_to_pfn(entry));
 
 	VM_WARN_ON_ONCE(!softleaf_has_pfn(entry));
 	/*
@@ -475,7 +481,13 @@ static inline struct page *softleaf_to_page(softleaf_t entry)
  */
 static inline struct folio *softleaf_to_folio(softleaf_t entry)
 {
-	struct folio *folio = pfn_folio(softleaf_to_pfn(entry));
+	struct folio *folio;
+
+	if (softleaf_is_migration_device_private(entry) ||
+	    softleaf_is_device_private(entry))
+		folio = page_folio(device_private_entry_to_page(entry));
+	else
+		folio = pfn_folio(softleaf_to_pfn(entry));
 
 	VM_WARN_ON_ONCE(!softleaf_has_pfn(entry));
 	/*
diff --git a/include/linux/memremap.h b/include/linux/memremap.h
index 713ec0435b48..7fad53f0f6ba 100644
--- a/include/linux/memremap.h
+++ b/include/linux/memremap.h
@@ -37,6 +37,7 @@ struct vmem_altmap {
  * backing the device memory. Doing so simplifies the implementation, but it is
  * important to remember that there are certain points at which the struct page
  * must be treated as an opaque object, rather than a "normal" struct page.
+ * Unlike "normal" struct pages, the page_to_pfn() is invalid.
  *
  * A more complete discussion of unaddressable memory may be found in
  * include/linux/hmm.h and Documentation/mm/hmm.rst.
@@ -126,8 +127,12 @@ struct dev_pagemap_ops {
  * @owner: an opaque pointer identifying the entity that manages this
  *	instance.  Used by various helpers to make sure that no
  *	foreign ZONE_DEVICE memory is accessed.
- * @nr_range: number of ranges to be mapped
- * @range: range to be mapped when nr_range == 1
+ * @nr_pages: number of pages requested to be mapped for MEMORY_DEVICE_PRIVATE.
+ * @pages: array of nr_pages initialized for MEMORY_DEVICE_PRIVATE.
+ * @nr_range: number of ranges to be mapped. Always == 1 for
+ *	MEMORY_DEVICE_PRIVATE.
+ * @range: range to be mapped when nr_range == 1. Used as an output param for
+ *	MEMORY_DEVICE_PRIVATE.
  * @ranges: array of ranges to be mapped when nr_range > 1
  */
 struct dev_pagemap {
@@ -139,6 +144,8 @@ struct dev_pagemap {
 	unsigned long vmemmap_shift;
 	const struct dev_pagemap_ops *ops;
 	void *owner;
+	unsigned long nr_pages;
+	struct page *pages;
 	int nr_range;
 	union {
 		struct range range;
@@ -224,7 +231,14 @@ static inline bool is_fsdax_page(const struct page *page)
 }
 
 #ifdef CONFIG_ZONE_DEVICE
+void __init_zone_device_page(struct page *page, unsigned long pfn,
+	unsigned long zone_idx, int nid,
+	struct dev_pagemap *pgmap);
 void zone_device_page_init(struct page *page, unsigned int order);
+unsigned long memremap_device_private_pagemap(struct dev_pagemap *pgmap, int nid);
+void memunmap_device_private_pagemap(struct dev_pagemap *pgmap);
+int devm_memremap_device_private_pagemap(struct device *dev, struct dev_pagemap *pgmap);
+void devm_memunmap_device_private_pagemap(struct device *dev, struct dev_pagemap *pgmap);
 void *memremap_pages(struct dev_pagemap *pgmap, int nid);
 void memunmap_pages(struct dev_pagemap *pgmap);
 void *devm_memremap_pages(struct device *dev, struct dev_pagemap *pgmap);
@@ -234,6 +248,15 @@ bool pgmap_pfn_valid(struct dev_pagemap *pgmap, unsigned long pfn);
 
 unsigned long memremap_compat_align(void);
 
+struct page *device_private_offset_to_page(unsigned long offset);
+struct page *device_private_entry_to_page(softleaf_t entry);
+pgoff_t device_private_page_to_offset(const struct page *page);
+
+static inline pgoff_t device_private_folio_to_offset(const struct folio *folio)
+{
+	return device_private_page_to_offset((const struct page *)&folio->page);
+}
+
 static inline void zone_device_folio_init(struct folio *folio, unsigned int order)
 {
 	zone_device_page_init(&folio->page, order);
@@ -276,6 +299,23 @@ static inline void devm_memunmap_pages(struct device *dev,
 {
 }
 
+static inline int devm_memremap_device_private_pagemap(struct device *dev,
+		struct dev_pagemap *pgmap)
+{
+	/*
+	 * Fail attempts to call devm_memremap_device_private_pagemap() without
+	 * ZONE_DEVICE support enabled, this requires callers to fall
+	 * back to plain devm_memremap() based on config
+	 */
+	WARN_ON_ONCE(1);
+	return -ENXIO;
+}
+
+static inline void devm_memunmap_device_private_pagemap(struct device *dev,
+		struct dev_pagemap *pgmap)
+{
+}
+
 static inline struct dev_pagemap *get_dev_pagemap(unsigned long pfn)
 {
 	return NULL;
@@ -296,6 +336,26 @@ static inline void zone_device_private_split_cb(struct folio *original_folio,
 						struct folio *new_folio)
 {
 }
+
+static inline struct page *device_private_offset_to_page(unsigned long offset)
+{
+	return NULL;
+}
+
+static inline struct page *device_private_entry_to_page(softleaf_t entry)
+{
+	return NULL;
+}
+
+static inline pgoff_t device_private_page_to_offset(const struct page *page)
+{
+	return 0;
+}
+
+static inline pgoff_t device_private_folio_to_offset(const struct folio *folio)
+{
+	return 0;
+}
 #endif /* CONFIG_ZONE_DEVICE */
 
 static inline void put_dev_pagemap(struct dev_pagemap *pgmap)
diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index 5fd2ee080bc0..2921b3abddf3 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -133,6 +133,10 @@ static inline struct page *migrate_pfn_to_page(unsigned long mpfn)
 {
 	if (!(mpfn & MIGRATE_PFN_VALID))
 		return NULL;
+
+	if (mpfn & MIGRATE_PFN_DEVICE_PRIVATE)
+		return device_private_offset_to_page(mpfn >> MIGRATE_PFN_SHIFT);
+
 	return pfn_to_page(mpfn >> MIGRATE_PFN_SHIFT);
 }
 
@@ -144,7 +148,7 @@ static inline unsigned long migrate_pfn(unsigned long pfn)
 static inline unsigned long migrate_pfn_from_page(struct page *page)
 {
 	if (is_device_private_page(page))
-		return migrate_pfn(page_to_pfn(page)) |
+		return migrate_pfn(device_private_page_to_offset(page)) |
 		       MIGRATE_PFN_DEVICE_PRIVATE;
 	return migrate_pfn(page_to_pfn(page));
 }
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 9fe63fc38155..befa87053d23 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2038,6 +2038,8 @@ static inline unsigned long memdesc_section(memdesc_flags_t mdf)
  */
 static inline unsigned long folio_pfn(const struct folio *folio)
 {
+	VM_BUG_ON(folio_is_device_private(folio));
+
 	return page_to_pfn(&folio->page);
 }
 
diff --git a/include/linux/rmap.h b/include/linux/rmap.h
index 57c63b6a8f65..c1561a92864f 100644
--- a/include/linux/rmap.h
+++ b/include/linux/rmap.h
@@ -951,7 +951,7 @@ static inline unsigned long page_vma_walk_pfn(unsigned long pfn)
 static inline unsigned long folio_page_vma_walk_pfn(const struct folio *folio)
 {
 	if (folio_is_device_private(folio))
-		return page_vma_walk_pfn(folio_pfn(folio)) |
+		return page_vma_walk_pfn(device_private_folio_to_offset(folio)) |
 		       PVMW_PFN_DEVICE_PRIVATE;
 
 	return page_vma_walk_pfn(folio_pfn(folio));
@@ -959,6 +959,9 @@ static inline unsigned long folio_page_vma_walk_pfn(const struct folio *folio)
 
 static inline struct page *page_vma_walk_pfn_to_page(unsigned long pvmw_pfn)
 {
+	if (pvmw_pfn & PVMW_PFN_DEVICE_PRIVATE)
+		return device_private_offset_to_page(pvmw_pfn >> PVMW_PFN_SHIFT);
+
 	return pfn_to_page(pvmw_pfn >> PVMW_PFN_SHIFT);
 }
 
diff --git a/include/linux/swapops.h b/include/linux/swapops.h
index f7d85a451a2b..def1d079d69b 100644
--- a/include/linux/swapops.h
+++ b/include/linux/swapops.h
@@ -141,7 +141,7 @@ static inline swp_entry_t make_readable_device_private_entry(pgoff_t offset)
 static inline swp_entry_t make_readable_device_private_entry_from_page(struct page *page,
 								       pgoff_t flags)
 {
-	return swp_entry(SWP_DEVICE_READ, page_to_pfn(page) | flags);
+	return swp_entry(SWP_DEVICE_READ, device_private_page_to_offset(page) | flags);
 }
 
 static inline swp_entry_t make_writable_device_private_entry(pgoff_t offset)
@@ -152,7 +152,7 @@ static inline swp_entry_t make_writable_device_private_entry(pgoff_t offset)
 static inline swp_entry_t make_writable_device_private_entry_from_page(struct page *page,
 								       pgoff_t flags)
 {
-	return swp_entry(SWP_DEVICE_WRITE, page_to_pfn(page) | flags);
+	return swp_entry(SWP_DEVICE_WRITE, device_private_page_to_offset(page) | flags);
 }
 
 static inline swp_entry_t make_device_exclusive_entry(pgoff_t offset)
@@ -268,7 +268,7 @@ static inline swp_entry_t make_readable_migration_entry_from_page(struct page *p
 {
 	if (is_device_private_page(page))
 		return make_readable_migration_device_private_entry(
-				page_to_pfn(page) | flags);
+				device_private_page_to_offset(page) | flags);
 
 	return swp_entry(SWP_MIGRATION_READ, page_to_pfn(page) | flags);
 }
@@ -283,7 +283,7 @@ static inline swp_entry_t make_readable_exclusive_migration_entry_from_page(stru
 {
 	if (is_device_private_page(page))
 		return make_readable_exclusive_migration_device_private_entry(
-				page_to_pfn(page) | flags);
+				device_private_page_to_offset(page) | flags);
 
 	return swp_entry(SWP_MIGRATION_READ_EXCLUSIVE, page_to_pfn(page) | flags);
 }
@@ -298,7 +298,7 @@ static inline swp_entry_t make_writable_migration_entry_from_page(struct page *p
 {
 	if (is_device_private_page(page))
 		return make_writable_migration_device_private_entry(
-				page_to_pfn(page) | flags);
+				device_private_page_to_offset(page) | flags);
 
 	return swp_entry(SWP_MIGRATION_WRITE, page_to_pfn(page) | flags);
 }
diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 872d3846af7b..b6e20041e448 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -497,7 +497,7 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
 				  struct page **ppage, bool is_large)
 {
 	struct dmirror_chunk *devmem;
-	struct resource *res = NULL;
+	bool device_private = false;
 	unsigned long pfn;
 	unsigned long pfn_first;
 	unsigned long pfn_last;
@@ -510,13 +510,9 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
 
 	switch (mdevice->zone_device_type) {
 	case HMM_DMIRROR_MEMORY_DEVICE_PRIVATE:
-		res = request_free_mem_region(&iomem_resource, DEVMEM_CHUNK_SIZE,
-					      "hmm_dmirror");
-		if (IS_ERR_OR_NULL(res))
-			goto err_devmem;
-		devmem->pagemap.range.start = res->start;
-		devmem->pagemap.range.end = res->end;
+		device_private = true;
 		devmem->pagemap.type = MEMORY_DEVICE_PRIVATE;
+		devmem->pagemap.nr_pages = DEVMEM_CHUNK_SIZE / PAGE_SIZE;
 		break;
 	case HMM_DMIRROR_MEMORY_DEVICE_COHERENT:
 		devmem->pagemap.range.start = (MINOR(mdevice->cdevice.dev) - 2) ?
@@ -525,13 +521,13 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
 		devmem->pagemap.range.end = devmem->pagemap.range.start +
 					    DEVMEM_CHUNK_SIZE - 1;
 		devmem->pagemap.type = MEMORY_DEVICE_COHERENT;
+		devmem->pagemap.nr_range = 1;
 		break;
 	default:
 		ret = -EINVAL;
 		goto err_devmem;
 	}
 
-	devmem->pagemap.nr_range = 1;
 	devmem->pagemap.ops = &dmirror_devmem_ops;
 	devmem->pagemap.owner = mdevice;
 
@@ -551,13 +547,20 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
 		mdevice->devmem_capacity = new_capacity;
 		mdevice->devmem_chunks = new_chunks;
 	}
-	ptr = memremap_pages(&devmem->pagemap, numa_node_id());
-	if (IS_ERR_OR_NULL(ptr)) {
-		if (ptr)
-			ret = PTR_ERR(ptr);
-		else
-			ret = -EFAULT;
-		goto err_release;
+
+	if (device_private) {
+		ret = memremap_device_private_pagemap(&devmem->pagemap, numa_node_id());
+		if (ret)
+			goto err_release;
+	} else {
+		ptr = memremap_pages(&devmem->pagemap, numa_node_id());
+		if (IS_ERR_OR_NULL(ptr)) {
+			if (ptr)
+				ret = PTR_ERR(ptr);
+			else
+				ret = -EFAULT;
+			goto err_release;
+		}
 	}
 
 	devmem->mdevice = mdevice;
@@ -567,15 +570,21 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
 
 	mutex_unlock(&mdevice->devmem_lock);
 
-	pr_info("added new %u MB chunk (total %u chunks, %u MB) PFNs [0x%lx 0x%lx)\n",
+	pr_info("added new %u MB chunk (total %u chunks, %u MB) %sPFNs [0x%lx 0x%lx)\n",
 		DEVMEM_CHUNK_SIZE / (1024 * 1024),
 		mdevice->devmem_count,
 		mdevice->devmem_count * (DEVMEM_CHUNK_SIZE / (1024 * 1024)),
+		device_private ? "device " : "",
 		pfn_first, pfn_last);
 
 	spin_lock(&mdevice->lock);
 	for (pfn = pfn_first; pfn < pfn_last; ) {
-		struct page *page = pfn_to_page(pfn);
+		struct page *page;
+
+		if (device_private)
+			page = device_private_offset_to_page(pfn);
+		else
+			page = pfn_to_page(pfn);
 
 		if (is_large && IS_ALIGNED(pfn, HPAGE_PMD_NR)
 			&& (pfn + HPAGE_PMD_NR <= pfn_last)) {
@@ -616,9 +625,6 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
 
 err_release:
 	mutex_unlock(&mdevice->devmem_lock);
-	if (res && devmem->pagemap.type == MEMORY_DEVICE_PRIVATE)
-		release_mem_region(devmem->pagemap.range.start,
-				   range_len(&devmem->pagemap.range));
 err_devmem:
 	kfree(devmem);
 
@@ -696,8 +702,8 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 		 */
 		spage = migrate_pfn_to_page(*src);
 		if (WARN(spage && is_zone_device_page(spage),
-		     "page already in device spage pfn: 0x%lx\n",
-		     page_to_pfn(spage)))
+		     "page already in device spage mpfn: 0x%lx\n",
+		     migrate_pfn_from_page(spage)))
 			goto next;
 
 		if (dmirror->flags & HMM_DMIRROR_FLAG_FAIL_ALLOC) {
@@ -752,8 +758,9 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 		 */
 		rpage->zone_device_data = dmirror;
 
-		pr_debug("migrating from sys to dev pfn src: 0x%lx pfn dst: 0x%lx\n",
-			 page_to_pfn(spage), page_to_pfn(dpage));
+		pr_debug("migrating from sys to mpfn src: 0x%lx pfn dst: 0x%lx\n",
+			 page_to_pfn(spage),
+			 migrate_pfn_from_page(dpage));
 
 		*dst = migrate_pfn_from_page(dpage) | write;
 
@@ -1462,10 +1469,10 @@ static void dmirror_device_remove_chunks(struct dmirror_device *mdevice)
 			spin_unlock(&mdevice->lock);
 
 			dmirror_device_evict_chunk(devmem);
-			memunmap_pages(&devmem->pagemap);
 			if (devmem->pagemap.type == MEMORY_DEVICE_PRIVATE)
-				release_mem_region(devmem->pagemap.range.start,
-						   range_len(&devmem->pagemap.range));
+				memunmap_device_private_pagemap(&devmem->pagemap);
+			else
+				memunmap_pages(&devmem->pagemap);
 			kfree(devmem);
 		}
 		mdevice->devmem_count = 0;
@@ -1710,7 +1717,12 @@ static void dmirror_devmem_folio_split(struct folio *head, struct folio *tail)
 		return;
 	}
 
-	offset = folio_pfn(tail) - folio_pfn(head);
+	tail->pgmap = head->pgmap;
+
+	if (folio_is_device_private(head))
+		offset = device_private_folio_to_offset(tail) - device_private_folio_to_offset(head);
+	else
+		offset = folio_pfn(tail) - folio_pfn(head);
 
 	rpage_tail = folio_page(rfolio, offset);
 	tail->page.zone_device_data = rpage_tail;
@@ -1719,7 +1731,6 @@ static void dmirror_devmem_folio_split(struct folio *head, struct folio *tail)
 	rpage_tail->mapping = NULL;
 
 	folio_page(tail, 0)->mapping = folio_page(head, 0)->mapping;
-	tail->pgmap = head->pgmap;
 	folio_set_count(page_folio(rpage_tail), 1);
 }
 
diff --git a/mm/debug.c b/mm/debug.c
index 77fa8fe1d641..04fcc62d440f 100644
--- a/mm/debug.c
+++ b/mm/debug.c
@@ -77,9 +77,11 @@ static void __dump_folio(const struct folio *folio, const struct page *page,
 	if (page_mapcount_is_type(mapcount))
 		mapcount = 0;
 
-	pr_warn("page: refcount:%d mapcount:%d mapping:%p index:%#lx pfn:%#lx\n",
+	pr_warn("page: refcount:%d mapcount:%d mapping:%p index:%#lx %spfn:%#lx\n",
 			folio_ref_count(folio), mapcount, mapping,
-			folio->index + idx, pfn);
+			folio->index + idx,
+			folio_is_device_private(folio) ? "device " : "",
+			pfn);
 	if (folio_test_large(folio)) {
 		int pincount = 0;
 
@@ -113,7 +115,8 @@ static void __dump_folio(const struct folio *folio, const struct page *page,
 	 * inaccuracy here due to racing.
 	 */
 	pr_warn("%sflags: %pGp%s\n", type, &folio->flags,
-		is_migrate_cma_folio(folio, pfn) ? " CMA" : "");
+		(!folio_is_device_private(folio) &&
+		 is_migrate_cma_folio(folio, pfn)) ? " CMA" : "");
 	if (page_has_type(&folio->page))
 		pr_warn("page_type: %x(%s)\n", folio->page.page_type >> 24,
 				page_type_name(folio->page.page_type));
diff --git a/mm/memremap.c b/mm/memremap.c
index 63c6ab4fdf08..7af9f70c35ff 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -12,9 +12,12 @@
 #include <linux/types.h>
 #include <linux/wait_bit.h>
 #include <linux/xarray.h>
+#include <linux/maple_tree.h>
 #include "internal.h"
 
 static DEFINE_XARRAY(pgmap_array);
+static struct maple_tree device_private_pgmap_tree =
+	MTREE_INIT(device_private_pgmap_tree, MT_FLAGS_ALLOC_RANGE);
 
 /*
  * The memremap() and memremap_pages() interfaces are alternately used
@@ -113,9 +116,10 @@ void memunmap_pages(struct dev_pagemap *pgmap)
 {
 	int i;
 
+	WARN_ONCE(pgmap->type == MEMORY_DEVICE_PRIVATE, "Type should not be MEMORY_DEVICE_PRIVATE\n");
+
 	percpu_ref_kill(&pgmap->ref);
-	if (pgmap->type != MEMORY_DEVICE_PRIVATE &&
-	    pgmap->type != MEMORY_DEVICE_COHERENT)
+	if (pgmap->type != MEMORY_DEVICE_COHERENT)
 		for (i = 0; i < pgmap->nr_range; i++)
 			percpu_ref_put_many(&pgmap->ref, pfn_len(pgmap, i));
 
@@ -144,7 +148,6 @@ static void dev_pagemap_percpu_release(struct percpu_ref *ref)
 static int pagemap_range(struct dev_pagemap *pgmap, struct mhp_params *params,
 		int range_id, int nid)
 {
-	const bool is_private = pgmap->type == MEMORY_DEVICE_PRIVATE;
 	struct range *range = &pgmap->ranges[range_id];
 	struct dev_pagemap *conflict_pgmap;
 	int error, is_ram;
@@ -190,7 +193,7 @@ static int pagemap_range(struct dev_pagemap *pgmap, struct mhp_params *params,
 	if (error)
 		goto err_pfn_remap;
 
-	if (!mhp_range_allowed(range->start, range_len(range), !is_private)) {
+	if (!mhp_range_allowed(range->start, range_len(range), true)) {
 		error = -EINVAL;
 		goto err_kasan;
 	}
@@ -198,30 +201,19 @@ static int pagemap_range(struct dev_pagemap *pgmap, struct mhp_params *params,
 	mem_hotplug_begin();
 
 	/*
-	 * For device private memory we call add_pages() as we only need to
-	 * allocate and initialize struct page for the device memory. More-
-	 * over the device memory is un-accessible thus we do not want to
-	 * create a linear mapping for the memory like arch_add_memory()
-	 * would do.
-	 *
-	 * For all other device memory types, which are accessible by
-	 * the CPU, we do want the linear mapping and thus use
+	 * All device memory types except device private memory are accessible
+	 * by the CPU, so we want the linear mapping and thus use
 	 * arch_add_memory().
 	 */
-	if (is_private) {
-		error = add_pages(nid, PHYS_PFN(range->start),
-				PHYS_PFN(range_len(range)), params);
-	} else {
-		error = kasan_add_zero_shadow(__va(range->start), range_len(range));
-		if (error) {
-			mem_hotplug_done();
-			goto err_kasan;
-		}
-
-		error = arch_add_memory(nid, range->start, range_len(range),
-					params);
+	error = kasan_add_zero_shadow(__va(range->start), range_len(range));
+	if (error) {
+		mem_hotplug_done();
+		goto err_kasan;
 	}
 
+	error = arch_add_memory(nid, range->start, range_len(range),
+				params);
+
 	if (!error) {
 		struct zone *zone;
 
@@ -248,8 +240,7 @@ static int pagemap_range(struct dev_pagemap *pgmap, struct mhp_params *params,
 	return 0;
 
 err_add_memory:
-	if (!is_private)
-		kasan_remove_zero_shadow(__va(range->start), range_len(range));
+	kasan_remove_zero_shadow(__va(range->start), range_len(range));
 err_kasan:
 	pfnmap_untrack(PHYS_PFN(range->start), range_len(range));
 err_pfn_remap:
@@ -281,22 +272,8 @@ void *memremap_pages(struct dev_pagemap *pgmap, int nid)
 
 	switch (pgmap->type) {
 	case MEMORY_DEVICE_PRIVATE:
-		if (!IS_ENABLED(CONFIG_DEVICE_PRIVATE)) {
-			WARN(1, "Device private memory not supported\n");
-			return ERR_PTR(-EINVAL);
-		}
-		if (!pgmap->ops || !pgmap->ops->migrate_to_ram) {
-			WARN(1, "Missing migrate_to_ram method\n");
-			return ERR_PTR(-EINVAL);
-		}
-		if (!pgmap->ops->folio_free) {
-			WARN(1, "Missing folio_free method\n");
-			return ERR_PTR(-EINVAL);
-		}
-		if (!pgmap->owner) {
-			WARN(1, "Missing owner\n");
-			return ERR_PTR(-EINVAL);
-		}
+		WARN(1, "Use memremap_device_private_pagemap()\n");
+		return ERR_PTR(-EINVAL);
 		break;
 	case MEMORY_DEVICE_COHERENT:
 		if (!pgmap->ops->folio_free) {
@@ -394,6 +371,31 @@ void devm_memunmap_pages(struct device *dev, struct dev_pagemap *pgmap)
 }
 EXPORT_SYMBOL_GPL(devm_memunmap_pages);
 
+static void devm_memremap_device_private_pagemap_release(void *data)
+{
+	memunmap_device_private_pagemap(data);
+}
+
+int devm_memremap_device_private_pagemap(struct device *dev, struct dev_pagemap *pgmap)
+{
+	int ret;
+
+	ret = memremap_device_private_pagemap(pgmap, dev_to_node(dev));
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(dev, devm_memremap_device_private_pagemap_release,
+			pgmap);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(devm_memremap_device_private_pagemap);
+
+void devm_memunmap_device_private_pagemap(struct device *dev, struct dev_pagemap *pgmap)
+{
+	devm_release_action(dev, devm_memremap_device_private_pagemap_release, pgmap);
+}
+EXPORT_SYMBOL_GPL(devm_memunmap_device_private_pagemap);
+
 /**
  * get_dev_pagemap() - take a new live reference on the dev_pagemap for @pfn
  * @pfn: page frame number to lookup page_map
@@ -493,3 +495,110 @@ void zone_device_page_init(struct page *page, unsigned int order)
 		prep_compound_page(page, order);
 }
 EXPORT_SYMBOL_GPL(zone_device_page_init);
+
+unsigned long memremap_device_private_pagemap(struct dev_pagemap *pgmap, int nid)
+{
+	unsigned long dpfn, dpfn_first, dpfn_last = 0;
+	unsigned long start;
+	int rc;
+
+	if (pgmap->type != MEMORY_DEVICE_PRIVATE) {
+		WARN(1, "Not device private memory\n");
+		return -EINVAL;
+	}
+	if (!IS_ENABLED(CONFIG_DEVICE_PRIVATE)) {
+		WARN(1, "Device private memory not supported\n");
+		return -EINVAL;
+	}
+	if (!pgmap->ops || !pgmap->ops->migrate_to_ram) {
+		WARN(1, "Missing migrate_to_ram method\n");
+		return -EINVAL;
+	}
+	if (!pgmap->owner) {
+		WARN(1, "Missing owner\n");
+		return -EINVAL;
+	}
+
+	pgmap->pages = kvzalloc(sizeof(struct page) * pgmap->nr_pages,
+			       GFP_KERNEL);
+	if (!pgmap->pages)
+		return -ENOMEM;
+
+	rc = mtree_alloc_range(&device_private_pgmap_tree, &start, pgmap,
+			       pgmap->nr_pages * PAGE_SIZE, 0,
+			       1ull << MAX_PHYSMEM_BITS, GFP_KERNEL);
+	if (rc < 0)
+		goto err_mtree_alloc;
+
+	pgmap->range.start = start;
+	pgmap->range.end = pgmap->range.start + (pgmap->nr_pages * PAGE_SIZE) - 1;
+	pgmap->nr_range = 1;
+
+	init_completion(&pgmap->done);
+	rc = percpu_ref_init(&pgmap->ref, dev_pagemap_percpu_release, 0,
+		GFP_KERNEL);
+	if (rc < 0)
+		goto err_ref_init;
+
+	dpfn_first = pgmap->range.start >> PAGE_SHIFT;
+	dpfn_last = dpfn_first + (range_len(&pgmap->range) >> PAGE_SHIFT);
+	for (dpfn = dpfn_first; dpfn < dpfn_last; dpfn++) {
+		struct page *page = device_private_offset_to_page(dpfn);
+
+		__init_zone_device_page(page, dpfn, ZONE_DEVICE, nid, pgmap);
+		page_folio(page)->pgmap = (void *) pgmap;
+	}
+
+	return 0;
+
+err_ref_init:
+	mtree_erase(&device_private_pgmap_tree, pgmap->range.start);
+err_mtree_alloc:
+	kvfree(pgmap->pages);
+	return rc;
+}
+EXPORT_SYMBOL_GPL(memremap_device_private_pagemap);
+
+void memunmap_device_private_pagemap(struct dev_pagemap *pgmap)
+{
+	percpu_ref_kill(&pgmap->ref);
+	wait_for_completion(&pgmap->done);
+	percpu_ref_exit(&pgmap->ref);
+	kvfree(pgmap->pages);
+	mtree_erase(&device_private_pgmap_tree, pgmap->range.start);
+}
+EXPORT_SYMBOL_GPL(memunmap_device_private_pagemap);
+
+struct page *device_private_offset_to_page(unsigned long offset)
+{
+	struct dev_pagemap *pgmap;
+
+	pgmap = mtree_load(&device_private_pgmap_tree, offset << PAGE_SHIFT);
+	if (WARN_ON_ONCE(!pgmap))
+		return NULL;
+
+	return &pgmap->pages[offset - (pgmap->range.start >> PAGE_SHIFT)];
+}
+EXPORT_SYMBOL_GPL(device_private_offset_to_page);
+
+struct page *device_private_entry_to_page(softleaf_t entry)
+{
+	unsigned long offset;
+
+	if (!((softleaf_is_device_private(entry) ||
+	    (softleaf_is_migration_device_private(entry)))))
+		return NULL;
+
+	offset = softleaf_to_pfn(entry);
+	return device_private_offset_to_page(offset);
+}
+
+pgoff_t device_private_page_to_offset(const struct page *page)
+{
+	struct dev_pagemap *pgmap = (struct dev_pagemap *) page_pgmap(page);
+
+	VM_BUG_ON_PAGE(!is_device_private_page(page), page);
+
+	return (pgmap->range.start >> PAGE_SHIFT) + ((page - pgmap->pages));
+}
+EXPORT_SYMBOL_GPL(device_private_page_to_offset);
diff --git a/mm/mm_init.c b/mm/mm_init.c
index fc2a6f1e518f..4a9420cb610c 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -1004,9 +1004,9 @@ static void __init memmap_init(void)
 }
 
 #ifdef CONFIG_ZONE_DEVICE
-static void __ref __init_zone_device_page(struct page *page, unsigned long pfn,
-					  unsigned long zone_idx, int nid,
-					  struct dev_pagemap *pgmap)
+void __ref __init_zone_device_page(struct page *page, unsigned long pfn,
+				   unsigned long zone_idx, int nid,
+				   struct dev_pagemap *pgmap)
 {
 
 	__init_single_page(page, pfn, zone_idx, nid);
@@ -1038,7 +1038,7 @@ static void __ref __init_zone_device_page(struct page *page, unsigned long pfn,
 	 * Please note that MEMINIT_HOTPLUG path doesn't clear memmap
 	 * because this is done early in section_activate()
 	 */
-	if (pageblock_aligned(pfn)) {
+	if (pgmap->type != MEMORY_DEVICE_PRIVATE && pageblock_aligned(pfn)) {
 		init_pageblock_migratetype(page, MIGRATE_MOVABLE, false);
 		cond_resched();
 	}
diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
index 96c525785d78..141fe5abd33f 100644
--- a/mm/page_vma_mapped.c
+++ b/mm/page_vma_mapped.c
@@ -107,6 +107,7 @@ static bool map_pte(struct page_vma_mapped_walk *pvmw, pmd_t *pmdvalp,
 static bool check_pte(struct page_vma_mapped_walk *pvmw, unsigned long pte_nr)
 {
 	unsigned long pfn;
+	bool device_private = false;
 	pte_t ptent = ptep_get(pvmw->pte);
 
 	if (pvmw->flags & PVMW_MIGRATION) {
@@ -115,6 +116,9 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw, unsigned long pte_nr)
 		if (!softleaf_is_migration(entry))
 			return false;
 
+		if (softleaf_is_migration_device_private(entry))
+			device_private = true;
+
 		pfn = softleaf_to_pfn(entry);
 	} else if (pte_present(ptent)) {
 		pfn = pte_pfn(ptent);
@@ -127,8 +131,14 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw, unsigned long pte_nr)
 			return false;
 
 		pfn = softleaf_to_pfn(entry);
+
+		if (softleaf_is_device_private(entry))
+			device_private = true;
 	}
 
+	if ((device_private) ^ !!(pvmw->pfn & PVMW_PFN_DEVICE_PRIVATE))
+		return false;
+
 	if ((pfn + pte_nr - 1) < (pvmw->pfn >> PVMW_PFN_SHIFT))
 		return false;
 	if (pfn > ((pvmw->pfn >> PVMW_PFN_SHIFT) + pvmw->nr_pages - 1))
@@ -137,8 +147,11 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw, unsigned long pte_nr)
 }
 
 /* Returns true if the two ranges overlap.  Careful to not overflow. */
-static bool check_pmd(unsigned long pfn, struct page_vma_mapped_walk *pvmw)
+static bool check_pmd(unsigned long pfn, bool device_private, struct page_vma_mapped_walk *pvmw)
 {
+	if ((device_private) ^ !!(pvmw->pfn & PVMW_PFN_DEVICE_PRIVATE))
+		return false;
+
 	if ((pfn + HPAGE_PMD_NR - 1) < (pvmw->pfn >> PVMW_PFN_SHIFT))
 		return false;
 	if (pfn > (pvmw->pfn >> PVMW_PFN_SHIFT) + pvmw->nr_pages - 1)
@@ -255,6 +268,8 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
 
 				if (!softleaf_is_migration(entry) ||
 				    !check_pmd(softleaf_to_pfn(entry),
+					       softleaf_is_device_private(entry) ||
+					       softleaf_is_migration_device_private(entry),
 					       pvmw))
 					return not_found(pvmw);
 				return true;
@@ -262,7 +277,7 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
 			if (likely(pmd_trans_huge(pmde))) {
 				if (pvmw->flags & PVMW_MIGRATION)
 					return not_found(pvmw);
-				if (!check_pmd(pmd_pfn(pmde), pvmw))
+				if (!check_pmd(pmd_pfn(pmde), false, pvmw))
 					return not_found(pvmw);
 				return true;
 			}
diff --git a/mm/rmap.c b/mm/rmap.c
index 6a63333f8722..3f708ed5c89f 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1860,7 +1860,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 	struct mmu_notifier_range range;
 	enum ttu_flags flags = (enum ttu_flags)(long)arg;
 	unsigned long nr_pages = 1, end_addr;
-	unsigned long pfn;
+	unsigned long nr;
 	unsigned long hsz = 0;
 	int ptes = 0;
 
@@ -1967,15 +1967,20 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 		 */
 		pteval = ptep_get(pvmw.pte);
 		if (likely(pte_present(pteval))) {
-			pfn = pte_pfn(pteval);
+			nr = pte_pfn(pteval) - folio_pfn(folio);
 		} else {
 			const softleaf_t entry = softleaf_from_pte(pteval);
 
-			pfn = softleaf_to_pfn(entry);
+			if (softleaf_is_device_private(entry) ||
+			    softleaf_is_migration_device_private(entry))
+				nr = softleaf_to_pfn(entry) - device_private_folio_to_offset(folio);
+			else
+				nr = softleaf_to_pfn(entry) - folio_pfn(folio);
+
 			VM_WARN_ON_FOLIO(folio_test_hugetlb(folio), folio);
 		}
 
-		subpage = folio_page(folio, pfn - folio_pfn(folio));
+		subpage = folio_page(folio, nr);
 		address = pvmw.address;
 		anon_exclusive = folio_test_anon(folio) &&
 				 PageAnonExclusive(subpage);
@@ -2289,7 +2294,7 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 	struct page *subpage;
 	struct mmu_notifier_range range;
 	enum ttu_flags flags = (enum ttu_flags)(long)arg;
-	unsigned long pfn;
+	unsigned long nr;
 	unsigned long hsz = 0;
 
 	/*
@@ -2328,7 +2333,7 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 	while (page_vma_mapped_walk(&pvmw)) {
 		/* PMD-mapped THP migration entry */
 		if (!pvmw.pte) {
-			__maybe_unused unsigned long pfn;
+			__maybe_unused softleaf_t entry;
 			__maybe_unused pmd_t pmdval;
 
 			if (flags & TTU_SPLIT_HUGE_PMD) {
@@ -2340,12 +2345,17 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 			}
 #ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
 			pmdval = pmdp_get(pvmw.pmd);
+			entry = softleaf_from_pmd(pmdval);
 			if (likely(pmd_present(pmdval)))
-				pfn = pmd_pfn(pmdval);
-			else
-				pfn = softleaf_to_pfn(softleaf_from_pmd(pmdval));
+				nr = pmd_pfn(pmdval) - folio_pfn(folio);
+			else if (softleaf_is_device_private(entry) ||
+				 softleaf_is_migration_device_private(entry)) {
+				nr = softleaf_to_pfn(entry) - device_private_folio_to_offset(folio);
+			} else {
+				nr = softleaf_to_pfn(entry) - folio_pfn(folio);
+			}
 
-			subpage = folio_page(folio, pfn - folio_pfn(folio));
+			subpage = folio_page(folio, nr);
 
 			VM_BUG_ON_FOLIO(folio_test_hugetlb(folio) ||
 					!folio_test_pmd_mappable(folio), folio);
@@ -2368,15 +2378,20 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 		 */
 		pteval = ptep_get(pvmw.pte);
 		if (likely(pte_present(pteval))) {
-			pfn = pte_pfn(pteval);
+			nr = pte_pfn(pteval) - folio_pfn(folio);
 		} else {
 			const softleaf_t entry = softleaf_from_pte(pteval);
 
-			pfn = softleaf_to_pfn(entry);
+			if (softleaf_is_device_private(entry) ||
+			    is_device_private_migration_entry(entry))
+				nr = softleaf_to_pfn(entry) - device_private_folio_to_offset(folio);
+			else
+				nr = softleaf_to_pfn(entry) - folio_pfn(folio);
+
 			VM_WARN_ON_FOLIO(folio_test_hugetlb(folio), folio);
 		}
 
-		subpage = folio_page(folio, pfn - folio_pfn(folio));
+		subpage = folio_page(folio, nr);
 		address = pvmw.address;
 		anon_exclusive = folio_test_anon(folio) &&
 				 PageAnonExclusive(subpage);
@@ -2436,7 +2451,7 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 				folio_mark_dirty(folio);
 			writable = pte_write(pteval);
 		} else if (likely(pte_present(pteval))) {
-			flush_cache_page(vma, address, pfn);
+			flush_cache_page(vma, address, pte_pfn(pteval));
 			/* Nuke the page table entry. */
 			if (should_defer_flush(mm, flags)) {
 				/*
diff --git a/mm/util.c b/mm/util.c
index 65e3f1a97d76..8482ebc5c394 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -1244,7 +1244,10 @@ void snapshot_page(struct page_snapshot *ps, const struct page *page)
 	struct folio *foliop;
 	int loops = 5;
 
-	ps->pfn = page_to_pfn(page);
+	if (is_device_private_page(page))
+		ps->pfn = device_private_page_to_offset(page);
+	else
+		ps->pfn = page_to_pfn(page);
 	ps->flags = PAGE_SNAPSHOT_FAITHFUL;
 
 again:
-- 
2.34.1

