Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B83ECD11C2
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 22:25:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 172AC10EA92;
	Wed, 10 Apr 2024 22:25:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J6JTWysz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4998010EA92
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Apr 2024 22:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712787909; x=1744323909;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=hTui/iixnMImnXr6YYjOx7RLOxPvnmDpWlMN7evciig=;
 b=J6JTWyszerG8RuRciLIFXmPLgFv00u6/c5Oo1ZWrABMoN7y/qKzOEC32
 fjdWdEBEZaX8FNsaNfmKgYO+pGhbk7/a4luqpTVSXTwY51U0peOsWyvOA
 4kOA1Hi2y+xBcaAhUjtz+5mMbgT17f5jD3xOlD2HKx0+fjFCGA6ESglML
 92tRCRtGLN/3v8MZyRb3ENOFqlBe/CQM8aSIiBgVwkeIJeSIzmk06OdmQ
 vO0b7utPDo4Ug9JZC0fOMAXI+TddZjJfoia/LvOn4GXORbZeA7SMdvooC
 x305j4lC43tkXI1u7TZynQfczE49gJdtfpQfctgEyW0Ewu5oqff+nzLUZ Q==;
X-CSE-ConnectionGUID: qO92y3zrTG2Jvxg73pMoAQ==
X-CSE-MsgGUID: Z74ggVFRRiqPyHOS1NQ7ng==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="18889853"
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; d="scan'208";a="18889853"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 15:25:07 -0700
X-CSE-ConnectionGUID: G92DV2i2TTeWwQC17Ox+xw==
X-CSE-MsgGUID: IV+gyRwoRamjxR47uTfbeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; d="scan'208";a="20781869"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Apr 2024 15:25:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Apr 2024 15:25:06 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 10 Apr 2024 15:25:06 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 10 Apr 2024 15:25:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DyiByU7ri05y0UK6z5vS9CBYaVvv5z4gjTnwm4Hs+Kh+z4hnaklaiwyeaZtZ0HX5Z6D4zICJB7BiHUt/jg5xNi9CjZqgrZtUpj8rRuhIba04us0sdYLWrjVuGYcT+YA/+WVCgr2ZtYu8NmKpM1+eCo8U3OzYpsbGNPlMgwiJuPWauk0d9XSxc40lLpuhel+5CFRx8D1TbUxtoTAPsoawrqmPb11CWtvlqM3Le+IDtdFn87ZHehd19jjSYlJ5pzVP8KOBa2qiPXmNWX4aixrREjs2atinKQ29SLmUsLVNw3kiOIv++EALmJYP0kmesSfuhkyPxubWp8F6ADU9Gh+/lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=chp700s9Ci3g8UKgLYnvQT/eg6dxs92hLJpgsdTga28=;
 b=ZCOEPGrGCxZdX03O+trD9MSEZszG0tiPESruUSPkCr89W9LFYE+9yHK4XW6thGYzBqKS9t0FP8eNLOsEMSKvvTFH/ixNchA7OAslIeS7rVSjfyCjirqyOkOrnev4ASCSU3JLa49DtwYfRQ29/Zaa6KGkedzRoEbCDfzDy3N7K2JqsBwRLzPVuAS+nbw65PYq34TsURvmtqLW/R+hXneR+MnmS1jDtzOVJvRswGNNtjMaSUA2nmCwtOk+Tch4gCESp9NlZvuc2N5qQatqOIxNHE6bjliSjho8o2HR4go85TOWnx06Ux1vF0q2EgQTweBxGjOSKnM5Di/PRtDiMaz8DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY5PR11MB6463.namprd11.prod.outlook.com (2603:10b6:930:31::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Wed, 10 Apr
 2024 22:24:59 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7452.019; Wed, 10 Apr 2024
 22:24:59 +0000
Date: Wed, 10 Apr 2024 22:23:51 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Oak Zeng <oak.zeng@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <krishnaiah.bommu@intel.com>, <Thomas.Hellstrom@linux.intel.com>,
 <brian.welty@intel.com>
Subject: Re: [v2 22/31] drm/xe/svm: implement functions to allocate and free
 device memory
Message-ID: <ZhcRdy+QnvrA+sye@DUT025-TGLU.fm.intel.com>
References: <20240409201742.3042626-1-oak.zeng@intel.com>
 <20240409201742.3042626-23-oak.zeng@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240409201742.3042626-23-oak.zeng@intel.com>
X-ClientProxiedBy: SJ0PR13CA0224.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY5PR11MB6463:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: csHu7+dOWWspg5s8uxvWjyvIy4SiTIbqZEwoAvgrzDxwsJ3jANwPDoQ0CNRbr2aw55bkDwBnVXn1jeUsRf/i7+himO9NoE69b0FA8qRp6epElAZeKu59Z8kRfT7XSRiATDOQZ4ogExE2Dn+TMvwcDq5GXzycTHOsxIlNcU8RJdq/GwbZEJ2P1OkgbHDG+pUa8rZmuHNnzRWc+hgJVwXh6TEvnUiKbPQt5AF8lopc9M7g3LSOFNAP38896K1l/V/0jLfUKxC+A9QjDWmpCcFnRt4ARWigPYjZtjNbecEDglDBJjgol6qkyDiGvruB2OHMOci76X9ImYyYgUSzArTtj24K+XreLALGhRenl31lG40LXV/aJFOYdL3+OIbfOHUnN1K/BfMCx9kR+87vpLYYeNH6OSfWBTFOHiC+z055LwoY+X+WyllG3hi6e7CyZImI9tPZzajTwU6uutlJI/05YOc8GAcm+46AzRxhNes/LOmaxT5PWeOKoJqQmOtqHx44BDGn3v4WWFDWOzeUDIJv8qBcYruhyfWadMFyNnd0SSxU4c3+0wm4MAU2VzdaYpeoNs6vYIAsMGpXCQtMYo4W6WEFklzqneNiDpxRNeN43osJNRZN+5/PL4Yyb0loNldKfh/tZzgu28iBbaegYyKCwgk1F6LQZmypePo+P0JMuak=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?9h7gBU9K394aBRlOykkdhRWg9nLLExqBBag+1ZVXD71mit0HdBR67/s1JE?=
 =?iso-8859-1?Q?l9Y2AFSH5XcelZlAfyeBXRQ61GWKJNjd6PxlsZYbrlDni6hU5LbTIhgy9C?=
 =?iso-8859-1?Q?Os9dihjqARXcYidipH9Us5iY9bdXCiqwjph40loAc9U+16NcMqN+PLlhgX?=
 =?iso-8859-1?Q?VUuE4m7BtkyEwFg2v1UKRbrodFl3cL/OUECbnltBwljvJsUYWc9NHC/HlP?=
 =?iso-8859-1?Q?az5cHANxOqYyzljhRD3kuVnmJ7NBIblQVOWw+AmEtINoL5HCDDEDVYuewO?=
 =?iso-8859-1?Q?8bERBkWRGGPF92e4MZj1McDtL/8fjPytsTle7EMuLTS6uNoeaUxLdAMwZ+?=
 =?iso-8859-1?Q?3nq+N4+Z9oO2by7bbaBYqHQdjp6wTjx8j6lCaKZoNP+/wJofwxtT/YqG9i?=
 =?iso-8859-1?Q?/L2r8jpiUhUw35S2p1wwhVzKQBXXJa2B6nQCRKNgTZP5ljb5twMmgFFTHV?=
 =?iso-8859-1?Q?lZavSdSBf8iEPUVBlo3GzKcCR7nXTjv8frT/2VRtjS5x7IaqBNRE+bmdqR?=
 =?iso-8859-1?Q?FUp48wTqo61HtJjL1KRAv+K0Zc3AEnkP/vIv1bZd3mZIGPB+FoEu9pk+pQ?=
 =?iso-8859-1?Q?Cz+0PKcbiZtrmbEjD0HAU9OkIvBt22ArdgX9r11Vg6Nu7z2TfeMX1Y24zc?=
 =?iso-8859-1?Q?+FDDcCIE9uF3/sf3URL4RvoKieQshF8bwugOtARfOY9/H8TOaZLtg4kfG3?=
 =?iso-8859-1?Q?wFZURStDuaMJwRhawwsox3DYgaGsdxEXcZ5Jo9WovAqJBR6sCfU2ILu6D/?=
 =?iso-8859-1?Q?G7fxz18ibT7yvdRK58T2TjvuHwNYPExudxghisn+wJKr/CMYG/u5k+aOFY?=
 =?iso-8859-1?Q?a+80/mnriMGp0k/uL26hVmbuqlRNaCFonpxMJ/lUlv0a5XwGOcM390LqYd?=
 =?iso-8859-1?Q?nZATC9JSpGTLaKAQExz7Q8ImeIGDbPAEyuuN5ceKpvrayvQJp2bWfgkbfZ?=
 =?iso-8859-1?Q?8xl8KpTkhVNB2stYEE736cDn1znDDvcbNeHKIbquDQRRC+KWhesZWVMlrM?=
 =?iso-8859-1?Q?udhRcZqdHgGfzZG2tGiSUPsYhJ+x+efhzHX2mpWZ1CqwyaezdKkW1gZzSg?=
 =?iso-8859-1?Q?ieAxpEgay7yw/hLEaJtaeZd3LYwMGvt3IyTBtX278b0VP5RqtZrDbw6FmN?=
 =?iso-8859-1?Q?773HJVngCAi9JUkXxr1ICInev/MfyH52t0wmzlU0FAJ1OQOBULeMIOTpro?=
 =?iso-8859-1?Q?RZ4vBvJd3othJY3NRBkXoDDDff2ejKhqUyC0NF/hiNcu9fuo0y3K8mBW4x?=
 =?iso-8859-1?Q?628BDZuk0JeDxGoLg79sGqHCfgB1Kmq5hLupq5iDxxhUoTRd5MEOUEAuGx?=
 =?iso-8859-1?Q?Y6Rxbnzbor4emFV8j87C1qPDxPBVlvI+wltflJMtol5bgjLotFb06Z28Pi?=
 =?iso-8859-1?Q?b15CKvlq9txrK1Qt2Iabp0ibQ8ZBMRsF0W615b+wmYSjl38sIUaSgTEazI?=
 =?iso-8859-1?Q?OYT3X4PRQDJBJe2eWXYSs5X8FA4t1Joq5NkCB0KZ1Q8ZST9F4sqWnDk4VQ?=
 =?iso-8859-1?Q?fYB8SYGiOzpqyK+7vhSoadxF23RQi/jAzh/jM/TF4zY9HvIRX/dYcAUGpa?=
 =?iso-8859-1?Q?sgBMIYSrHNo4NPpdQv+jGVt3ui9JoaSRc9sRRVxdfUNdv3PYl7vDIxdqLv?=
 =?iso-8859-1?Q?s1y1LyqmPgRrvIqQ1uiFYB6Gu7edSNgetbY+f+xNBwLQEb2TXr45qNxQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d489348-fb50-4f5b-fdb4-08dc59ad0e97
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 22:24:59.0457 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KeL1dDJN1Oh8tNq/yMKtv4tH1nyuKCCk2TaTWcAEPibUQ4EIjRNK1b+UJQiYmocPFM187oqYIXxEaxqZ4GJJwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6463
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

On Tue, Apr 09, 2024 at 04:17:33PM -0400, Oak Zeng wrote:
> Function xe_devm_alloc_pages allocate pages from drm buddy and perform
> house keeping work for all the pages allocated, such as get a page
> refcount, keep a bitmap of all pages to denote whether a page is in
> use, put pages to a drm lru list for eviction purpose.
> 
> Function xe_devm_free_blocks return list of memory blocks to drm buddy
> allocator.
> 
> Function xe_devm_free_page is a call back function from hmm layer. It
> is called whenever a page's refcount reaches to 1. This function clears
> the bit of this page in the bitmap. If all the bits in the bitmap is
> cleared, it means all the pages have been freed, we return all the pages
> in this memory block back to drm buddy.
> 
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> Co-developed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@intel.com>
> Cc: Brian Welty <brian.welty@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_svm.h        |   7 ++
>  drivers/gpu/drm/xe/xe_svm_devmem.c | 147 ++++++++++++++++++++++++++++-

See comments about file in previous patches, they apply here too.

>  2 files changed, 152 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index 624c1581f8ba..92a3ee90d5a7 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -46,4 +46,11 @@ static inline struct xe_mem_region *xe_page_to_mem_region(struct page *page)
>  	return container_of(page->pgmap, struct xe_mem_region, pagemap);
>  }
>  
> +int xe_devm_alloc_pages(struct xe_tile *tile,
> +						unsigned long npages,
> +						struct list_head *blocks,
> +						unsigned long *pfn);
> +
> +void xe_devm_free_blocks(struct list_head *blocks);
> +void xe_devm_page_free(struct page *page);
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_svm_devmem.c b/drivers/gpu/drm/xe/xe_svm_devmem.c
> index 31af56e8285a..5ba0cd9a70b0 100644
> --- a/drivers/gpu/drm/xe/xe_svm_devmem.c
> +++ b/drivers/gpu/drm/xe/xe_svm_devmem.c
> @@ -5,18 +5,161 @@
>  
>  #include <linux/mm_types.h>
>  #include <linux/sched/mm.h>
> -
> +#include <linux/gfp.h>
> +#include <linux/migrate.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/dma-fence.h>
> +#include <linux/bitops.h>
> +#include <linux/bitmap.h>
> +#include <drm/drm_buddy.h>
>  #include "xe_device_types.h"
>  #include "xe_svm.h"
> +#include "xe_migrate.h"
> +#include "xe_ttm_vram_mgr_types.h"
> +#include "xe_assert.h"
>  
> +/**
> + * struct xe_svm_block_meta - svm uses this data structure to manage each
> + * block allocated from drm buddy. This will be set to the drm_buddy_block's
> + * private field.
> + *
> + * @lru: used to link this block to drm's lru lists. This will be replace
> + * with struct drm_lru_entity later.
> + * @tile: tile from which we allocated this block
> + * @bitmap: A bitmap of each page in this block. 1 means this page is used,
> + * 0 means this page is idle. When all bits of this block are 0, it is time
> + * to return this block to drm buddy subsystem.
> + */
> +struct xe_svm_block_meta {
> +	struct list_head lru;
> +	struct xe_tile *tile;
> +	unsigned long bitmap[];
> +};

This looks not needed to me but admittedly haven't looked at the LRU stuff.

I am thinking roughly...

- I think we drop all this special tracking (kill xe_svm_block_meta)
- Have functions to allocate / free the buddy blocks, store buddy blocks in userptr
- Blocks are allocated before migration to VRAM
- Blocks can be freed on either CPU fault after migration or on VMA
  destroy (probably depends on madvive hints for VMA where we free
  blocks)
- Blocks allocated / freed at ia chunk (xe_vma in this code) granularity
  (conceptually the same if we switch to 1 to N ratio between xe_vma &
  pt_state)
- block->private == memory region so we can get pfn from block
- When we need migrate_pfns we loop over buddy blocks populating migrate.dst

Also I noticed the drm_buddy_* calls in this file are not protected by a
lock, we will need that. Currently it is tile->mem.vram_mgr->lock in the
VRAM mgr code, we either need to reach into there or move this lock to
common place so the VRAM manager and block allocations for SVM don't
race with each other.

Matt

>  
>  static vm_fault_t xe_devm_migrate_to_ram(struct vm_fault *vmf)
>  {
>  	return 0;
>  }
>  
> -static void xe_devm_page_free(struct page *page)
> +static u64 block_offset_to_pfn(struct xe_mem_region *mr, u64 offset)
> +{
> +	/** DRM buddy's block offset is 0-based*/
> +	offset += mr->hpa_base;
> +
> +	return PHYS_PFN(offset);
> +}
> +
> +/** FIXME: we locked page by calling zone_device_page_init
> + *  in xe_devm_alloc_pages. Should we unlock pages here?
> + */
> +static void free_block(struct drm_buddy_block *block)
> +{
> +	struct xe_svm_block_meta *meta =
> +		(struct xe_svm_block_meta *)block->private;
> +	struct xe_tile *tile  = meta->tile;
> +	struct drm_buddy *mm = &tile->mem.vram_mgr->mm;
> +
> +	kfree(block->private);
> +	drm_buddy_free_block(mm, block);
> +}
> +
> +void xe_devm_page_free(struct page *page)
> +{
> +	struct drm_buddy_block *block =
> +					(struct drm_buddy_block *)page->zone_device_data;
> +	struct xe_svm_block_meta *meta =
> +					(struct xe_svm_block_meta *)block->private;
> +	struct xe_tile *tile  = meta->tile;
> +	struct xe_mem_region *mr = &tile->mem.vram;
> +	struct drm_buddy *mm = &tile->mem.vram_mgr->mm;
> +	u64 size = drm_buddy_block_size(mm, block);
> +	u64 pages_per_block = size >> PAGE_SHIFT;
> +	u64 block_pfn_first =
> +					block_offset_to_pfn(mr, drm_buddy_block_offset(block));
> +	u64 page_pfn = page_to_pfn(page);
> +	u64 i = page_pfn - block_pfn_first;
> +
> +	xe_assert(tile->xe, i < pages_per_block);
> +	clear_bit(i, meta->bitmap);
> +	if (bitmap_empty(meta->bitmap, pages_per_block))
> +		free_block(block);
> +}
> +
> +/**
> + * xe_devm_alloc_pages() - allocate device pages from buddy allocator
> + *
> + * @xe_tile: which tile to allocate device memory from
> + * @npages: how many pages to allocate
> + * @blocks: used to return the allocated blocks
> + * @pfn: used to return the pfn of all allocated pages. Must be big enough
> + * to hold at @npages entries.
> + *
> + * This function allocate blocks of memory from drm buddy allocator, and
> + * performs initialization work: set struct page::zone_device_data to point
> + * to the memory block; set/initialize drm_buddy_block::private field;
> + * lock_page for each page allocated; add memory block to lru managers lru
> + * list - this is TBD.
> + *
> + * return: 0 on success
> + * error code otherwise
> + */
> +int xe_devm_alloc_pages(struct xe_tile *tile,
> +						unsigned long npages,
> +						struct list_head *blocks,
> +						unsigned long *pfn)
> +{
> +	struct drm_buddy *mm = &tile->mem.vram_mgr->mm;
> +	struct drm_buddy_block *block, *tmp;
> +	u64 size = npages << PAGE_SHIFT;
> +	int ret = 0, i, j = 0;
> +
> +	ret = drm_buddy_alloc_blocks(mm, 0, mm->size, size, PAGE_SIZE,
> +						blocks, DRM_BUDDY_TOPDOWN_ALLOCATION);
> +
> +	if (unlikely(ret))
> +		return ret;
> +
> +	list_for_each_entry_safe(block, tmp, blocks, link) {
> +		struct xe_mem_region *mr = &tile->mem.vram;
> +		u64 block_pfn_first, pages_per_block;
> +		struct xe_svm_block_meta *meta;
> +		u32 meta_size;
> +
> +		size = drm_buddy_block_size(mm, block);
> +		pages_per_block = size >> PAGE_SHIFT;
> +		meta_size = BITS_TO_BYTES(pages_per_block) +
> +					sizeof(struct xe_svm_block_meta);
> +		meta = kzalloc(meta_size, GFP_KERNEL);
> +		bitmap_fill(meta->bitmap, pages_per_block);
> +		meta->tile = tile;
> +		block->private = meta;
> +		block_pfn_first =
> +					block_offset_to_pfn(mr, drm_buddy_block_offset(block));
> +		for(i = 0; i < pages_per_block; i++) {
> +			struct page *page;
> +
> +			pfn[j++] = block_pfn_first + i;
> +			page = pfn_to_page(block_pfn_first + i);
> +			/**Lock page per hmm requirement, see hmm.rst.*/
> +			zone_device_page_init(page);
> +			page->zone_device_data = block;
> +		}
> +	}
> +
> +	return ret;
> +}
> +
> +/**
> + * xe_devm_free_blocks() - free all memory blocks
> + *
> + * @blocks: memory blocks list head
> + */
> +void xe_devm_free_blocks(struct list_head *blocks)
>  {
> +	struct drm_buddy_block *block, *tmp;
> +
> +	list_for_each_entry_safe(block, tmp, blocks, link)
> +		free_block(block);
>  }
>  
>  static const struct dev_pagemap_ops xe_devm_pagemap_ops = {
> -- 
> 2.26.3
> 
