Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15205D1489F
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 05:38:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD33210E68F;
	Thu,  8 Jan 2026 05:38:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="LZ8321lx";
	dkim-atps=neutral
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012063.outbound.protection.outlook.com [52.101.48.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1E6910E27B
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 05:37:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bJtWvsOCBLM2ePpRlu/TXwOcnIUHbT55tc0DM86Vj+dxof0/fyN/6csWWPsN1GHT8egW00mn5H698L1YVclQ4dZLeGJ7LfS5fReiG/iFBGoD2kuxV61NW+WcwRcsUT1xXbKR6xZUm96+sUq6pMm7Ycz2psQEfS4WhK1kHpKfy5k2HHCAPp3kY+EU02y/VI/pg7Od/MToX8zBV06+WUHonVYg7/BVpS/wldjGctVLCUHGwaORDjX+oVhNG0tCKa256eXiepFiHcVM9cYXGseWBGOzAEiiCoK9Hh7UVKkjm2ExLJ2lfQjbN7GP4/BnwP0Jcz/+VxlyIrqOK5KLDNQjEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yOuoIQTsOtpL6KNE83MzKdpl48aBxC+ZlMxCVX/Hyeg=;
 b=KWvmnvRNSMS3ZyaJFhl5Rh7zVAvhU/HUH6aM8ade7Gk1Ytf5PrueI4ngvPeqfDuQxQ0ne8aDhFAIEHlZ8RpB1zJpw/JFWIK6D1/UK8jlKw4MV/o19prAj9C0VhvrY/PkU8pjosCqb4IQ5LRXnbYs5OzBOeGCxMyJL3OxFWgDb6MTSAdbvS8NEC331/ezzV6IxD/nIRvUcpcV4ITH5RwuCNYsoZKL++OBtQdEbHyKGoJ0j+NZiNMzLjrXnZ1L8z2MVCfSYw6JQCg0Z8CUQuccYJO04o27JcoTK6TogCG8qjengALfMpeYh+uOEjfM1ip2rj13cRxGTtrmo8LMvnHZag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yOuoIQTsOtpL6KNE83MzKdpl48aBxC+ZlMxCVX/Hyeg=;
 b=LZ8321lxkBnv8u2T1SEhDagzb3m8NaztZ0/jXmhjt2EMvnVh/Y4xZADxq7Hujy0d5VIewLiLAJM8IV8jXVpqhspu9IBP902DjfRrGxGfuLpHJXo4KTapI5P710l8N0JqXTZ/milluJsJcPNpjVSUKAPMURzq2JAq1uZ6I2qVl76BTrjWhrI9F+mM5c/kI8HNjET6ETov4tVbUdTMnBqjZGYE/a/Blt0bLsyGjuTKZMNOq6tl7202HW+UjHSxHRGFvFAu2YF498uxqa6HYT0VAWD/iSVTlxIh6sxUq5FDUQgCVU5aurRGcjhftHNZ0r1n4/tpoiiuRDoGrzIWQ0YY7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 LV8PR12MB9451.namprd12.prod.outlook.com (2603:10b6:408:206::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 05:37:56 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 05:37:56 +0000
From: Jordan Niethe <jniethe@nvidia.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [RESEND v2 00/11] Remove device private pages from physical address
 space
Date: Thu,  8 Jan 2026 16:37:30 +1100
Message-Id: <20260108053741.38802-1-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR04CA0036.namprd04.prod.outlook.com
 (2603:10b6:a03:40::49) To DM4PR12MB9072.namprd12.prod.outlook.com
 (2603:10b6:8:be::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|LV8PR12MB9451:EE_
X-MS-Office365-Filtering-Correlation-Id: e0d733f6-eee2-4a5c-db02-08de4e781389
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bfJWxoGK3p933IQewi/cLegOBbtNAStdgA05pfioLNp0ANgUDkp/6tULP0OK?=
 =?us-ascii?Q?LmAOUlok7R+/Y+8L4HrexoP7uNLW1D1koyPDtJ3t4RBr+vY76tFmRY4U+3du?=
 =?us-ascii?Q?lY79ISr4gmgv+RN9+oACtyYMeCWvwQ9TOQd4QFugI3twpp+jW20WkccuDwUx?=
 =?us-ascii?Q?XY63t7ZgLUqL/wINthFJL0lmwT7hfCR3X+i/EdQWPlVlz2gTlfKuEWCgUTyN?=
 =?us-ascii?Q?bWhFSyLAPkicCTsKG+pLFrrHErjMxmr1oimFZ4re2LE0LW/sOpaR0lwXL8C8?=
 =?us-ascii?Q?0BRkpBwjZow/PIDsgKp+PzXN5aqbUZQhiN4JBxfGCFrcDazGJlmid6XCvmu3?=
 =?us-ascii?Q?r62eV88x1ElbTAjHCCO3s5/knKZNY6mfvryCKdoyRzqpv+Bm40TZ96vdUw+I?=
 =?us-ascii?Q?u4jrb1s367zas/E20lCMVlf8famqVQN7BwkWsDC1+ru+Ju6yYu8k7QIbXS9z?=
 =?us-ascii?Q?wI41be0M5Kf0Qm1yGS5ryKekwzL02LZSzPoqzHWkCP19ZKEU9bvlTirDvtja?=
 =?us-ascii?Q?Nv8fYh9+pLWjzRSMBrQrB31xzHr1QcNvPUHScxD/r1Hd2ZoSiBLY9Ys272u7?=
 =?us-ascii?Q?PFb+C5vI+MDrubUpnFgmdNF5KlGV0YArWYO98exbIQvl7OqAvBKCjKnrlZ/E?=
 =?us-ascii?Q?abmK6jU0oYf/LHBBcMw5p3X8aQ1bJ2WzG8MlQKQE15mJtIhF8LiYGoWKjXQ/?=
 =?us-ascii?Q?hMcno+botULQifZ5w290QW47Zkl/Ema1J6iL3V9Q2eMdCH0x/byextjImngp?=
 =?us-ascii?Q?KUREl+yZy7xiLasdPGvMFXCbn7aEhC1mKbMZoDqSL2g5UFIVZkNV2p2cA4Cf?=
 =?us-ascii?Q?BlSqdgpwqViigYzwG8Ia6TrdPaJ6TqVIedFVB963rBdJeNhQJ7BOwklhPv+M?=
 =?us-ascii?Q?WDflrkabuCs9q8vSWJgUCmCZxaqNGYKEPtX0nXldNrXVvQ//VcGApJko3G+6?=
 =?us-ascii?Q?eZCMPC0NHUuIx2Gxpwk25gQCDFXRG18JTKefnoUGKZrMPDkPmG9SUFOT0Irp?=
 =?us-ascii?Q?Tq9ANOo1sUS3YIdeTr5VpzsJcdvrHGHS8PiEGAKnZ0SS/q38xlAUNzYboBlC?=
 =?us-ascii?Q?MCwUeruqVSy3rr6ZzaG+Jk/zZa7Y4XlzyWjJK1IU3ytomWstrKfGMIYCIrWL?=
 =?us-ascii?Q?2Q9Ur024fF7YhrTXHGRb1W6fd1afcV7DB0y2/Du2ryOwU975Am5/1BDyi9A8?=
 =?us-ascii?Q?twIU27ec2Gf9shqMCINGVTUWdm/1nhKZyrr1GRPo6LhG/dCbS/H3h90+4KYz?=
 =?us-ascii?Q?YeHlexttzS8qalWhUSSBu42RV1CzZy/J0APAI6AkOvXo4ERUFHkHcpQs7Wip?=
 =?us-ascii?Q?SpNsMHObiNDCmEJdwzf8WTE3+5t6hQ+mMh+pZlitg6b5doQXACEhmE2l5ZSw?=
 =?us-ascii?Q?niLSa4uQ69FreigkyVIT64SO6UY+tuuTHBZiq9nS1TUFyTS1wQJIEBqWLpxY?=
 =?us-ascii?Q?kOfUlISxa2av7m6aK+q/nI7gwaLbZEJSN9Wjk/KEF6bM8Hdmc5Kk2g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB9072.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0moxXP5gMRoXEDMzkRxoK+ZSg0+f4t994/ehCjJdePAV8/PbVHc/Ooy9IncT?=
 =?us-ascii?Q?HWH06ShufPzCt7JaBW9nrhUWyzaf/LkOr7qx1fryB+/CVbRi4F0IYLWpemhi?=
 =?us-ascii?Q?nyoEeCDmbiCEGJZDKw50f8EhRvbmQWsdY5gC1HorZe+HANC8vUkBzmzp4DO+?=
 =?us-ascii?Q?3zT/j0TZlnJ54R5+DibH75bckjZFBssvyGSNALXapO8oRTKUkATkfLj0h77U?=
 =?us-ascii?Q?2dDFQ4qz9KdqpqaiHcEZN6EVGpk3DjOmf5G4FmU0GOnhnkuCdWQf1njoMcfT?=
 =?us-ascii?Q?uwc/h4jM00vdwJ+H4riDGvfc9jETjc8BGKsrmvOSNuINZDlanMkJIUQWE4Yr?=
 =?us-ascii?Q?5sd4qF4kM3Y0R6Cl8r9n2B/g7OBuGmmiQ49XVpdqa+N2xwMm2zd6NlGLD7lq?=
 =?us-ascii?Q?p9+yHs6oPbmfbalMf4Mq1JYEhYTb38gpHp7l+f8LmrZ8kJs+MR5Hc+2N8nOB?=
 =?us-ascii?Q?AKes2PM53O3+Yza6HvGFD/Ew+vEiIssEvZgxKoV8Zdp9QEGEMS84teEbogpx?=
 =?us-ascii?Q?5SwdDiP9vVSt7hWE4S3AnTicMU8I2av5b8sKiJc1XoiR1wfOhhoggOnodmqx?=
 =?us-ascii?Q?QsHPJvEz6yuql6wZqZaJKyLc1MrxUtUGvxEhCw/2c4xG+DR9stJiZOsZCArS?=
 =?us-ascii?Q?9sABDgSUw0vRAkL0g/Facp5EYVR1hKvXQ+SVONbNoejb9RQm7B0pwxxHw95L?=
 =?us-ascii?Q?h3/JD1qicEClAaBb1rxUcR0D61+JK8/V3eMCTGI16sUX7AfjmZAoauq1KnDD?=
 =?us-ascii?Q?YZ+vhec9b2y3M8YW/ItvkFmdONqR7ZEV3mL4+E0lXqLk1fnugDZQYE055e3S?=
 =?us-ascii?Q?P2sNy4MzJg7gHrjgzsDNEKZFL22gcczc7mxff9DTwGA0ml7zawIHTmUsf3nu?=
 =?us-ascii?Q?8RRVlczrlqUHM2ZOiTFmUBIbJjelcPynUKzBM+FY8ny68jmV2wsexR6kzrKF?=
 =?us-ascii?Q?FzbIylEeFpOafrC3pk6PbS2qT4651iYIl2u1Ht9F3gb2+Yc9dWg1Dlf/TjbQ?=
 =?us-ascii?Q?hA3h1jHPrfurSanRdlkDae3FLA2qCWWwxX1n5waAEX/6ud6ofrBEb7QmK+qT?=
 =?us-ascii?Q?3XbQqAO9V23Y5X4KpcTlNnwaqQgdovuV7MB0BYNbZbMcPY3qIVrpLAxkhHII?=
 =?us-ascii?Q?34c8MACmB7BNQHhc3oDysbN7x0K3C7Z7nGL4AKjVYJ7+R6vWsvP4YSgR+SSr?=
 =?us-ascii?Q?nHN9eEgnqK5ufPPo6XxoffNIacmkplB1HhUZ8EYznQVCDAFmmlHbwPXI1ynq?=
 =?us-ascii?Q?+JmObwb0ZPQB/N64PDs2ZVhgEeNbcqC6TWYhPLraMqrG6/Ic1GD5O9qp91QA?=
 =?us-ascii?Q?ky4MIwyH1NXMv962Gfe57Qa7VHQdzLHutTB0eINR/hdi2wjk8KbcUgS858od?=
 =?us-ascii?Q?yxv9e8NIOrjmJAnI9KXdpRY/gpxqWQ8hLrxxG2fY4QgNE6oBU2LibJt7vfYM?=
 =?us-ascii?Q?7RxxQTD2iC+QRgaXX+Z7bWMkEGyWePFNf/pRM/5olCizW3T1GpSFr4t6ZYks?=
 =?us-ascii?Q?/+tsu0+rGmRdmII9DrCPdHL2NYXdVCCIyxyIjiJSMaldY6DJE4ipOfrJ/acZ?=
 =?us-ascii?Q?CFP6cs9dVDvvmGaJFVYkywK+daLQ9SfQR/KoGkyRxxHm0Vf+d22t7fUPaszP?=
 =?us-ascii?Q?o2lq0uBsAxBwJQsa2Kq8BASepKhIr945AE/w6qGg8l6x5Te0/pyXJYBN7pRU?=
 =?us-ascii?Q?rs71x5i+vzu2jfW7KYUOU5QIp6j0Jw1qoDjzWfBmdj8ZKFBgjRIUn3Q5o6Hi?=
 =?us-ascii?Q?6wgK5bxcGw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0d733f6-eee2-4a5c-db02-08de4e781389
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 05:37:56.6575 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rREmsYeEvPw1gOtfCzPtqLerHBo2m20zG21b2lTSr44ECWr/3u2Qzc00UtnnWpVq8SUqN3fThgNyqOTJRiaXtw==
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

Resend of
https://lore.kernel.org/all/20260107091823.68974-1-jniethe@nvidia.com/#t
rebased on drm-tip

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


base-commit: 25815d6185d3efe226238025baddf01299c4b070
-- 
2.34.1

