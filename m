Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D15DBC6FD1F
	for <intel-xe@archiver.kernel.org>; Wed,  3 Apr 2024 03:03:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69AA110F017;
	Wed,  3 Apr 2024 03:03:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AC/WqkuO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8575910F017
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Apr 2024 03:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712113390; x=1743649390;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=44nL895FuCYw+zD1g2VPs0mU3A2syn7u/gcI+hye6Y0=;
 b=AC/WqkuOUMDdev9/k0adt0GdMMVP04HhojuOSJpuRPcn3iq/t+tsC2av
 QMjjTjUVqv+tvKL2Yn2WywhG5TV0vkmajcH7HQjR2SJPwcwu+IU46pepz
 4hwotDoChf3Y7p6VySQkVM12AEoEqM4LR94mdokcXpzvWGI0Sr99wGwA+
 alOQVqGE+rFFc76+ibnQtQ7f4U8FUfZIb9A8DhorEyzkfeXKJoTdQTlOX
 +fa+tUdtE46YXgbhMDI4iuEwVI0FTFNfXdbORqsKKby9rPNiXjV45xw+r
 apGrdRv80QKUsVUf3v8h77zw5FgdgmkxIWeg8kAJZV2Pikt7dIcyZPyO9 g==;
X-CSE-ConnectionGUID: SiSfI9rITNmMKl+0K6XelQ==
X-CSE-MsgGUID: 2fDojcg2S1SHwdqZJ0zajw==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="29797808"
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; d="scan'208";a="29797808"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 20:03:09 -0700
X-CSE-ConnectionGUID: FCZF428nQPyz/oOdbTIlHw==
X-CSE-MsgGUID: 9b4eL2j9RhiKHe6b/ZOqig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; d="scan'208";a="41425233"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Apr 2024 20:03:09 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Apr 2024 20:03:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Apr 2024 20:03:08 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 2 Apr 2024 20:03:08 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 2 Apr 2024 20:03:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mw9strfd+ut2uKR/7wldIfRK3s4KSHckU51+zQ5YKxrGIwJ3TeodzAwDlSprllyIEcKdIGssvex6qaKMti7c5XuUuxmbh2/9jBNt2+61TGHE6yONvYX9wFXKTTj1uR1Wzx6bvcUliKH6CFmce5wgDAezzTyJ/jwUiUJxRq3QfGb/fLqICgxBGacx6STrbkM2fXXEnzFJCsWbaFkjvISGEbacq2g/wOUKhC/a9o35yBT6pHRoHR6P1gjtvAU0+A+vNtIKAmtWR5+ctue8C/MHgTLbvYlRt1zsp2BGMhUtFtVRS+Cal6ZJnvNBZZWHQlX1IHjoW/WKUBUBqpBlMCk/Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a+0UKEdlekHVO+Mr4+QodbG0bWDEVlvz/m3832Ay6a8=;
 b=lSNTsBSAzYNU/co1Asoe/i2ehczLgG+/gDpmmcPwZ6ByWmDMZVJqoeQzIsQz7legFiKfXsKTjDtDLW4BQPq9azL+XZQgw7KUXxLNklP5DiatNENvHqyNBrrrgSNm/6sRtByxqkYK3SjFWWUIbct3LIEm3EZmHrfz+gzTHKY5yIXrx6uGZ/fOLMZiPIGwqJSjnsWB+z5+eaguu87EDrB6yddJXa8QL4LoKc3C192xdco3qCmAxjEY4QoQyVjnPoF+Zv9R3lpSNHAJBZX/IO1HPgB10OzBONnBCFs8iIk1f0MRd3JJtrHA2U/ZqayZE0y5fj6ZDA9gjNrSmR3l4MktAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB6224.namprd11.prod.outlook.com (2603:10b6:8:97::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.25; Wed, 3 Apr 2024 03:03:05 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7452.019; Wed, 3 Apr 2024
 03:03:05 +0000
Date: Wed, 3 Apr 2024 03:03:55 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Oak Zeng <oak.zeng@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@intel.com>,
 <brian.welty@intel.com>, <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH 1/3] drm/xe: Introduce helper to populate userptr
Message-ID: <ZgzHG+Qfqvb6ARlu@DUT025-TGLU.fm.intel.com>
References: <20240322035520.2382600-1-oak.zeng@intel.com>
 <20240322035520.2382600-2-oak.zeng@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240322035520.2382600-2-oak.zeng@intel.com>
X-ClientProxiedBy: BY3PR04CA0028.namprd04.prod.outlook.com
 (2603:10b6:a03:217::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB6224:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cSUh1OlAR02qTljQHQ3c++qgbYwa3KZHW6xQJ2QigWJzJjNKpZmrwHVlkwrixxXIZMb7QQaL9xYMusiGrZHCtCjstm3OPBZSjZ7pJokclegZTvUOPnSmK4hLuo2pRCXjgQjK5CMM/bIUftFvM+OnI7/IOb3Ir7nuqKDkQb/uMG2bWDiYA3Xr3Se9fdvU7JROimM49a0OIHTWaERkwLC9y+Z2Y7+VlfX2AnavrfHTEBhs6hQfwLrTQZKB4f8jiPLe28Zz2gylnRV8URgox2cwkLSsyfqDY2i4JT2kt9lOZewTOfl9RQOMeqasvdZDY7ZwRM7sTCwuCs/fz68TY0RxQOv/3MOIYyvNMFhYhrB31PUDf/GDHw++ZANTySor1C0EQcPO6CiXh12KG+fV2MUzPtEd3dbpwBSvsVwfqFY+j0UoENGOVM3Cv/BUpG35Ro+hEoVjDUBuyNrtryvEUIy3p2OzFAWNZaDdvwip5eh3lfQQQgLNfSbD/E2lmiZ4YluzTMnVTUYBmTwqyD8oJU+tDOIudcOQHjZPPiFGAaMGcebXQ/K1IcM7Vj+iSWYXMlsujnfhGD2lbrs9bmY7vufaZZa6FjaE/AEjkVfEvR6lrOAlHfC3IpMO8bUaOSRpoDJqKKwrOX7V0uz92BveiTJY/JT8WLWgYf7F9AkGTYgU/Bk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?EVSp0D5PEmBPDr49mq99pvQtdcMJInHPV8ApACsotO8egKKOCCREQd0KDK?=
 =?iso-8859-1?Q?KnYhbJE72zVkyanl3gBWYzcAide+9uY2ZpYSNg7nSeXn0tP14JqDp3lcJK?=
 =?iso-8859-1?Q?gfqrGxDODHnIe7p1MIT5Po5BiKg85cfIFsCE1Ux5dWsW03GPjJYwuQeCd7?=
 =?iso-8859-1?Q?g6Qp4iL891OCwEVJJ7KH6QpijrtQGWkbsgXXCT8Wnak7Z87NUzrfqNH8wb?=
 =?iso-8859-1?Q?sGL26edMzt1cWRmEY9wHijHA7kgLpWETIJ8rrWZz1klbf6/ohEsjver4Gt?=
 =?iso-8859-1?Q?H06THoVTheoJ7e0GVHL9KkjspvoHVwJuVTOzd3m7BKwHEDMQG9ix2r9OJG?=
 =?iso-8859-1?Q?WrAME9DIJ/moz35oyWwPiCGuUCnihOaPsv5Ngc7yN8iz16K7780wZRy3DE?=
 =?iso-8859-1?Q?SQpiQoW8Un3AEKVPelfoY0OkVlV3iT80lNkNBMPra4Ct+TJwqZ04AWYVui?=
 =?iso-8859-1?Q?SextHe8aJJStH1JRCT+nusVoda1nxhpLQQp3MEC1rYrzUcyvT7saSbwOZO?=
 =?iso-8859-1?Q?98Ed4F+kru3VnZtyoJ+iZZ+ONcokfDJCIYLrAi+luFccapnUvOnki3MVmz?=
 =?iso-8859-1?Q?CKW+38mfttuDcQtFi+ryTR29CwCZv0LTSpM+DFBfGOQyQ+0erpZP8j4Nb5?=
 =?iso-8859-1?Q?+uOzVmssSh0uVRkhs9c/YLGefJwgtBQSpwQ3IvpHofZm/KnPHjkJJAdmZX?=
 =?iso-8859-1?Q?oI48J29lyUNKau1IIHd4jpVcLWQxcFmUGh5SWyaeVk+vC4GynRFEh4VgAY?=
 =?iso-8859-1?Q?EjLtOMdWBOfynGd15HtZv3nL5PQ7mgIqlZnILKnQX52BiT9dyH2Swnn71Z?=
 =?iso-8859-1?Q?wBXs5MvMFeTxreKyYe4RCkpqzFPsU/L5Qy+cQEi+tMGDdbDGgpXm8rvj3V?=
 =?iso-8859-1?Q?L6wOW/qTRbLgbq1X4vbpKCkh6wW+eczt/t0bMGBc3x/yAYFxiNidGOxz7l?=
 =?iso-8859-1?Q?pZFzu7ywQTuc5O1qmarcr0C2gRY2YEFprYXN7gyLKxrRgN9edj0UeGfBPP?=
 =?iso-8859-1?Q?unVkt6eH1EruWY9F6hnNl/zbZfI5kVaRSRj87G+wz/tGP/p4tb5HVaxZvm?=
 =?iso-8859-1?Q?K2x0esfQzyrDdJXCXE0z+8trOermYRqkdXELkdMaCVvkgGHgII3SIMf3uy?=
 =?iso-8859-1?Q?W3/Zq12hLkliiEIgfqNpwRiNG7U8YFA1XCHc+ng3/5mzi3U+JuLJnjvmn1?=
 =?iso-8859-1?Q?faaHAiGe1GHZekRB8LQX8OdQaiK0y26ys1ZaswccXKH3X+C9bUk2Vc0WjB?=
 =?iso-8859-1?Q?dx2Jqnrr3SKO3yymfjnlWXBxh1FzwJqxKm1qHhmLnowNtOtKFzdj8vhT7D?=
 =?iso-8859-1?Q?lnS6zAB/pDbGQbirZHEmk2Ze3x53b1cbAGKO4nZhM24CgLCb2A9MaTpv6k?=
 =?iso-8859-1?Q?i4RfWl0xvsqY1PP+okKIR8/mGPQFBmHccYj8mLzHo64TXgSmKU44znKbmA?=
 =?iso-8859-1?Q?AsbfuP3nMeDPCPK4LrPb0OhpnxWmJKtmPEQOF0uVTGo05cXG5TEye8Wzar?=
 =?iso-8859-1?Q?DWoxVnhkelXJyxJIWxs/InI234GsI6I+qI8K8OdpbEHb2YpCWZDjl42AMl?=
 =?iso-8859-1?Q?CsdjvRgGVFjzVCKTWOkXCYwhv8kZOVnYiqiJxmA12lc+YQ1swZmmyjOReD?=
 =?iso-8859-1?Q?G+gD1rQXOJ7p4GOsEgkdfBj/Qj8IdbwC/ngHeSzlBdgUCjkXINQxDhMA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aef1c07-afd4-40aa-a223-08dc538a9518
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 03:03:05.3643 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b9q6lqcMgWb1jNyQsduK60cW/L8S+iiGxt8pViZS9fj8xhl1Dwm3OXymmUsCPB++BYgogHhkji6s0qqACouzJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6224
X-OriginatorOrg: intel.com
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

On Thu, Mar 21, 2024 at 11:55:18PM -0400, Oak Zeng wrote:
> Introduce a helper function xe_userptr_populate_range to populate
> a a userptr range. This functions calls hmm_range_fault to read
> CPU page tables and populate all pfns/pages of this virtual address
> range.
> 
> If the populated page is system memory page, dma-mapping is performed
> to get a dma-address which can be used later for GPU to access pages.
> 
> If the populated page is device private page, we calculate the dpa (
> device physical address) of the page. This will be handled in future
> patches.
> 
> The dma-address or dpa is then saved in userptr's sg table. This is
> prepare work to replace the get_user_pages_fast code in userptr code
> path.
> 
> v1: Address review comments:
>     separate a npage_in_range function (Matt)
>     reparameterize function xe_userptr_populate_range function (Matt)
>     move mmu_interval_read_begin() call into while loop (Thomas)
>     s/mark_range_accessed/xe_mark_range_accessed (Thomas)
>     use set_page_dirty_lock (vs set_page_dirty) (Thomas)
>     move a few checking in xe_vma_userptr_pin_pages to hmm.c (Matt)
> v2: Remove device private page support. Only support system
>     pages for now. use dma-map-sg rather than dma-map-page (Matt/Thomas)
> 
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> Co-developed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@intel.com>
> Cc: Brian Welty <brian.welty@intel.com>
> ---
>  drivers/gpu/drm/xe/Kconfig  |   1 +
>  drivers/gpu/drm/xe/Makefile |   2 +
>  drivers/gpu/drm/xe/xe_hmm.c | 224 ++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_hmm.h |  17 +++
>  4 files changed, 244 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_hmm.c
>  create mode 100644 drivers/gpu/drm/xe/xe_hmm.h
> 
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index 1a556d087e63..449a1ecbc92a 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -41,6 +41,7 @@ config DRM_XE
>  	select MMU_NOTIFIER
>  	select WANT_DEV_COREDUMP
>  	select AUXILIARY_BUS
> +	select HMM_MIRROR
>  	help
>  	  Experimental driver for Intel Xe series GPUs
>  
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 3c3e67885559..a805a543056d 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -145,6 +145,8 @@ xe-y += xe_bb.o \
>  	xe_wa.o \
>  	xe_wopcm.o
>  
> +xe-$(CONFIG_HMM_MIRROR) += xe_hmm.o
> +
>  # graphics hardware monitoring (HWMON) support
>  xe-$(CONFIG_HWMON) += xe_hwmon.o
>  
> diff --git a/drivers/gpu/drm/xe/xe_hmm.c b/drivers/gpu/drm/xe/xe_hmm.c
> new file mode 100644
> index 000000000000..4011207630a5
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_hmm.c
> @@ -0,0 +1,224 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include <linux/mmu_notifier.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/memremap.h>
> +#include <linux/swap.h>
> +#include <linux/hmm.h>
> +#include <linux/mm.h>
> +#include "xe_hmm.h"
> +#include "xe_vm.h"
> +#include "xe_bo.h"
> +
> +static u64 xe_npages_in_range(unsigned long start, unsigned long end)
> +{
> +	return (PAGE_ALIGN(end) - PAGE_ALIGN_DOWN(start)) >> PAGE_SHIFT;

Nit: start and end should always be page aligned.

> +}
> +
> +/**
> + * xe_mark_range_accessed() - mark a range is accessed, so core mm
> + * have such information for memory eviction or write back to
> + * hard disk
> + *
> + * @range: the range to mark
> + * @write: if write to this range, we mark pages in this range
> + * as dirty
> + */

Doesn't hurt but kernel doc is not required for static functions.

> +static void xe_mark_range_accessed(struct hmm_range *range, bool write)
> +{
> +	struct page *page;
> +	u64 i, npages;
> +
> +	npages = xe_npages_in_range(range->start, range->end);
> +	for (i = 0; i < npages; i++) {
> +		page = hmm_pfn_to_page(range->hmm_pfns[i]);
> +		if (write)
> +			set_page_dirty_lock(page);
> +
> +		mark_page_accessed(page);
> +	}
> +}
> +
> +/**
> + * xe_build_sg() - build a scatter gather table for all the physical pages/pfn
> + * in a hmm_range. dma-map pages if necessary. dma-address is save in sg table
> + * and will be used to program GPU page table later.
> + *
> + * @xe: the xe device who will access the dma-address in sg table
> + * @range: the hmm range that we build the sg table from. range->hmm_pfns[]
> + * has the pfn numbers of pages that back up this hmm address range.
> + * @st: pointer to the sg table.
> + * @write: whether we write to this range. This decides dma map direction
> + * for system pages. If write we map it bi-diretional; otherwise
> + * DMA_TO_DEVICE
> + *
> + * All the contiguous pfns will be collapsed into one entry in
> + * the scatter gather table. This is for the purpose of efficiently
> + * programming GPU page table.
> + *
> + * The dma_address in the sg table will later be used by GPU to
> + * access memory. So if the memory is system memory, we need to
> + * do a dma-mapping so it can be accessed by GPU/DMA.
> + *
> + * FIXME: This function currently only support pages in system
> + * memory. If the memory is GPU local memory (of the GPU who
> + * is going to access memory), we need gpu dpa (device physical
> + * address), and there is no need of dma-mapping. This is TBD.
> + *
> + * FIXME: dma-mapping for peer gpu device to access remote gpu's
> + * memory. Add this when you support p2p
> + *
> + * This function allocates the storage of the sg table. It is
> + * caller's responsibility to free it calling sg_free_table.
> + *
> + * Returns 0 if successful; -ENOMEM if fails to allocate memory
> + */

Kinda verbose given a static function but guess that is ok.

> +static int xe_build_sg(struct xe_device *xe, struct hmm_range *range,
> +			     struct sg_table *st, bool write)

Weird indentation, use look at checkpatch.

> +{
> +	struct device *dev = xe->drm.dev;
> +	struct page **pages;
> +	u64 i, npages;
> +	int ret;
> +
> +	npages = xe_npages_in_range(range->start, range->end);
> +	pages = kvmalloc_array(npages, sizeof(*pages), GFP_KERNEL);
> +	if (!pages)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < npages; i++) {
> +		pages[i] = hmm_pfn_to_page(range->hmm_pfns[i]);
> +		xe_assert(xe, !is_device_private_page(pages[i]));
> +	}
> +
> +	ret = sg_alloc_table_from_pages_segment(st, pages, npages, 0,
> +			npages << PAGE_SHIFT, xe_sg_segment_size(dev), GFP_KERNEL);

Weird indentation here too.



> +	if (ret)
> +		goto free_pages;
> +
> +	ret = dma_map_sgtable(dev, st, write ? DMA_BIDIRECTIONAL : DMA_TO_DEVICE,
> +			DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_NO_KERNEL_MAPPING);
> +
> +free_pages:

The SG table isn't free'd if dma_map_sgtable fails.

> +	kvfree(pages);
> +	return ret;
> +}
> +
> +/**
> + * xe_userptr_populate_range() - Populate physical pages of a virtual
> + * address range
> + *
> + * @uvma: userptr vma which has information of the range to populate.
> + *
> + * This function populate the physical pages of a virtual
> + * address range. The populated physical pages is saved in
> + * userptr's sg table. It is similar to get_user_pages but call
> + * hmm_range_fault.
> + *
> + * This function also read mmu notifier sequence # (
> + * mmu_interval_read_begin), for the purpose of later
> + * comparison (through mmu_interval_read_retry).
> + *
> + * This must be called with mmap read or write lock held.
> + *
> + * This function allocates the storage of the userptr sg table.
> + * It is caller's responsibility to free it calling sg_free_table.
> + *
> + * returns: 0 for succuss; negative error no on failure
> + */
> +int xe_userptr_populate_range(struct xe_userptr_vma *uvma)

See my comments about arguments in previous rev. Still would raather
have this layer accept arguments from xe_userptr_vma rather than that
struct but can live with xe_userptr_vma as an argument I suppose.

But s/xe_userptr_populate_range/xe_hmm_userptr_populate_range/ given
that this is file xe_hmm.c - exported functions should try to have the
'xe_hmm' prefix.

> +{
> +	unsigned long timeout =
> +		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
> +	unsigned long *pfns, flags = HMM_PFN_REQ_FAULT;
> +	struct xe_userptr *userptr;
> +	struct xe_vma *vma = &uvma->vma;
> +	u64 start = xe_vma_userptr(vma);
> +	u64 end = start + xe_vma_size(vma);
> +	struct xe_vm *vm = xe_vma_vm(vma);
> +	struct hmm_range hmm_range;
> +	bool write = !xe_vma_read_only(vma);
> +	bool in_kthread = !current->mm;
> +	unsigned long notifier_seq;
> +	u64 npages;
> +	int ret;
> +
> +	userptr = &uvma->userptr;
> +	mmap_assert_locked(userptr->notifier.mm);

See my comments about locking in an eariler rev, while it may be true
the system allocator code has to call this function with mmap locked it
certainly non-system allocator code does not. I'd rather move the mmap
lock around the hmm_range_fault call for now. If the system allocator
needs to hold mmap, probably add locked argument (or *_locked) function
with the proper lockdep asserts / do not take mmap lock around
hmm_range_fault. 

> +
> +	if (vma->gpuva.flags & XE_VMA_DESTROYED)
> +		return 0;
> +
> +	notifier_seq = mmu_interval_read_begin(&userptr->notifier);
> +	if (notifier_seq == userptr->notifier_seq)
> +		return 0;
> +
> +	npages = xe_npages_in_range(start, end);
> +	pfns = kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
> +	if (unlikely(!pfns))
> +		return -ENOMEM;
> +
> +	if (write)
> +		flags |= HMM_PFN_REQ_WRITE;
> +
> +	if (in_kthread) {
> +		if (!mmget_not_zero(userptr->notifier.mm)) {
> +			ret = -EFAULT;
> +			goto free_pfns;
> +		}
> +		kthread_use_mm(userptr->notifier.mm);

I think this can actually be dropped as hmm_range_fault takes the
notifier (and the MM) as an argument. Do you want to test this out?

If we can drop kthread_use_mm, we blindly (no kthread test) probably
just call mmget_not_zero.

> +	}
> +
> +	memset64((u64 *)pfns, (u64)flags, npages);

See my comment in an ealier rev about using default flags. Still valid.

> +	hmm_range.hmm_pfns = pfns;
> +	hmm_range.notifier = &userptr->notifier;
> +	hmm_range.start = start;
> +	hmm_range.end = end;
> +	hmm_range.pfn_flags_mask = HMM_PFN_REQ_FAULT | HMM_PFN_REQ_WRITE;
> +	/**
> +	 * FIXME:
> +	 * Set the dev_private_owner can prevent hmm_range_fault to fault
> +	 * in the device private pages owned by caller. See function
> +	 * hmm_vma_handle_pte. In multiple GPU case, this should be set to the
> +	 * device owner of the best migration destination. e.g., device0/vm0
> +	 * has a page fault, but we have determined the best placement of
> +	 * the fault address should be on device1, we should set below to
> +	 * device1 instead of device0.
> +	 */

I'd drop this FIXME, I prefer not to predict the future in comments.

> +	hmm_range.dev_private_owner = vm->xe;
> +

Longterm, probably a helper to derive private owner. Likely just
something like:

xe_dev_private_owner(xe)
	return xe

But it help avoid bugs setting the private owner to the wrong value in
various places.

> +	while (true) {
> +		hmm_range.notifier_seq = mmu_interval_read_begin(&userptr->notifier);

We set hmm_range.notifier_seq above... maybe set this after if (ret ==-EBUSY)

Again see my comment about locking.

> +		ret = hmm_range_fault(&hmm_range);
> +		if (time_after(jiffies, timeout))
> +			break;

Maybe also move this under the if (ret ==-EBUSY) logic too.

> +
> +		if (ret == -EBUSY)
> +			continue;
> +		break;
> +	}
> +
> +	if (in_kthread) {
> +		kthread_unuse_mm(userptr->notifier.mm);
> +		mmput(userptr->notifier.mm);

See comment above about kthread_unuse_mm.

> +	}
> +
> +	if (ret)
> +		goto free_pfns;
> +
> +	ret = xe_build_sg(vm->xe, &hmm_range, &userptr->sgt, write);
> +	if (ret)
> +		goto free_pfns;
> +
> +	xe_mark_range_accessed(&hmm_range, write);
> +	userptr->sg = &userptr->sgt;
> +	userptr->notifier_seq = hmm_range.notifier_seq;
> +
> +free_pfns:
> +	kvfree(pfns);
> +	return ret;
> +}
> +
> diff --git a/drivers/gpu/drm/xe/xe_hmm.h b/drivers/gpu/drm/xe/xe_hmm.h
> new file mode 100644
> index 000000000000..91686a751711
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_hmm.h
> @@ -0,0 +1,17 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include <linux/types.h>
> +
> +struct xe_userptr_vma;
> +
> +#if IS_ENABLED(CONFIG_HMM_MIRROR)

Do we need this? Don't we just require CONFIG_HMM_MIRROR to build our
driver?

Matt

> +int xe_userptr_populate_range(struct xe_userptr_vma *uvma);
> +#else
> +static inline int xe_userptr_populate_range(struct xe_userptr_vma *uvma)
> +{
> +	return -ENODEV;
> +}
> +#endif
> -- 
> 2.26.3
> 
