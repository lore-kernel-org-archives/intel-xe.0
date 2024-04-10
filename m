Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B258CD11C2
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 21:54:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36D6A10E9A1;
	Wed, 10 Apr 2024 21:54:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kxsGszAB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B042510E87C
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Apr 2024 21:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712786052; x=1744322052;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=49ENEUx2hjSy18p2Sf80cGBjhpOnVaBTG9M5foNe+Io=;
 b=kxsGszAB5Lvs52DFuzc34B4xTCkBBDA91vU1njx2T3h/cYCntWpwpRBI
 3/LyIWRtF30hTleJ+F/FbTJ3Bc0w0iYzp9rqQY0eSwJWaSfC04cPmkURC
 +dJfa9iM1dD1BYQ4tP9fbtBg6z8c4qKYHXVVy4zFkcZ83sTAEqnqQWj+W
 Me/+3r7ymZpf1yosPkfzYfk8Z1OBqEwFaoqHK6dEg/3gx3MuY6IhBxU1C
 oTcgGEee2K+eFNRZGWAV8RcDQho7KUMsb2TD9QWnB80+fV0AMdg+mnzsl
 nV2wzEeDAnpi5AJp7jEBnlBSHQMKkqOZQorOxeYvG00zjxPcIAtie4th3 g==;
X-CSE-ConnectionGUID: AY8ys1DAQQG+duKWOkhlSQ==
X-CSE-MsgGUID: V3blhhbhTESiHACOudXOQQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8052399"
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; 
   d="scan'208";a="8052399"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 14:54:11 -0700
X-CSE-ConnectionGUID: nNRTM2pQTvWEV3RDRKfizQ==
X-CSE-MsgGUID: hTLBj2csSZa0cP9u9594eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; d="scan'208";a="25168680"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Apr 2024 14:54:11 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Apr 2024 14:54:10 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 10 Apr 2024 14:54:10 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 10 Apr 2024 14:54:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JWVB7WFkS87bgK6UmI/xZ6wJaXU0iXSPubFSt4SXDfceL4xE/HvpVRuNPX9klfzNXD6KMnKBaHV2MdpDf88/0SBMmOTtGQLUFT/2hyIuPTs5oxYlBh8Xk6Rz7Jjktd42wZLw2GMWikWM1MyT3tS/I/2WvWt8V6/u5e3qSDstmfkXy7pSyiHxronl6O8Uqwm/jDHYZB8G3lBwm9PS5mVSqTflKfLYc5cvHs/4LI9kC45BjSi1mDtFs8H2KqWSfUAwsFMuv8E+1655RnDxudfcUc2CMf1IUvShsUJj23M7M+ooYeqWV9KhyT/KVw7BWDvlxSEsA1DlGRQo6C18vtz0Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rv16RYqWPrSZa/zi2JqEaDr7FmcWVj3tlW/lMxRolxI=;
 b=eGkfhwG2AnHYiSLRgt0FWlYCz/Wj76jNoHYl+Tmmxhm51dgiqrZZQq+TNS5RCNcqaw3m9ny1Tcm2PS5Cm0HpnpVtmT6doOwCeU5c93C41RMsZ1SxcPqvtODkalEiHAfIBESrnyTUZLJ9nsPUFxSw+z+Ljm0hMcQJQC5yHCLk0U/DAOo+q0f50G25/DXPZgoKTXNe0z+Lj8suYmA5330zY+6UPOJic/sI1vie2gQeNyh3KQlxdN9q5nuLWUzl3dnfznx6qyrEFnCyD347ZsqZ4OedDsQXWL/UZVRCTASpEfQ46bsXjeR34nukWTfkICPIg9OnlfttIYJQUOIcEG4nhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB6264.namprd11.prod.outlook.com (2603:10b6:8:a5::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.25; Wed, 10 Apr 2024 21:54:06 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7452.019; Wed, 10 Apr 2024
 21:54:06 +0000
Date: Wed, 10 Apr 2024 21:52:59 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Oak Zeng <oak.zeng@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <krishnaiah.bommu@intel.com>, <Thomas.Hellstrom@linux.intel.com>,
 <brian.welty@intel.com>
Subject: Re: [v2 18/31] drm/xe/svm: Build userptr sg table for device pages
Message-ID: <ZhcKO0O+Xe0X7keH@DUT025-TGLU.fm.intel.com>
References: <20240409201742.3042626-1-oak.zeng@intel.com>
 <20240409201742.3042626-19-oak.zeng@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240409201742.3042626-19-oak.zeng@intel.com>
X-ClientProxiedBy: SJ0P220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB6264:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BEJGTFdiw9CnhSYlglg8fNJhgY0VVmRV3QPe5bA/n/rPFe2gHtXx4P3U58Xw4gudDwpm0CO2DTC4tbKS2OXNT1hoGhH4sk60Z+x6cz9R4NyNbeou7tC5hIwvgyFKnEJJFZluIrCBtuwsVONBFqjdu63pyOsn0cFrYIsxHNUnIkKtn1fXCmtLe339Zfp7DGF8AGNVhMe21Ahgkz32bqEwGPlg3DD5e9Tomvvafec8O776/Ras6icdNm31NmBRj038yzVE/sirn3580WitRY3b3NSY3aM7z2rnQQ02eUYqMSzmfrjYibb0isaCQt4LO8U3W003WUBAcdXzvXXX3dKqRuy81Ej8WA8qMJm08M40M2QV9Q4NNdXFFRrb7fD3LPDvnSdp6/uON+vIsbREVpUKQ/0+NOubumSJVUJeR9hamBrFvcGxKnsIZsU9qSAjqVhXQE8bRVjW6vroj1YlSajRiYqdwQ9Wghe33JQpnS8GX5SuqXd95Ndm9W1piFMNm+vEy1bEJn4aEjDjvcUhhM6gw5I9+uGMLUz3aPRlR1UrC/bj74qM2tKHsNI36ceCz8WSpsKJXhO15MAIVyfNnDSLJCBfWltThpOLF+yaVBwqtJQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Nj6QzkFOJ4oLHingOtQB1e2m7RpX13jQsFFf+j3rtyxwj0f6MEddXijHQwwy?=
 =?us-ascii?Q?9hEJeQ1P0EgomEV8qT7nCyK/cXty+3RVBchFyh+VinoWRzYQKzHN7iFP8Vij?=
 =?us-ascii?Q?NnSi25jFA/4M0SoBip1hpfA72LkmhnBMZK+SWnkot+fAAunQ5cikh3lYtR2+?=
 =?us-ascii?Q?P//7lR5icsz5xaOhv9yiAio47M3hM2OdEZWBjyBfAXrJatcKVQ1NW72REMYK?=
 =?us-ascii?Q?BemDt/unBQCs2iZMYBkCehTqod7alTEDIr8DEo/bwOREdeTg9FMytN8f8+ux?=
 =?us-ascii?Q?MXq/ZzB/zoNLgu1mJM1YVNwSzHDo9cQlzqnH79GsgQsQQSH24BobqEcwrztb?=
 =?us-ascii?Q?5KWgbArFzxyaMVBfj7ESfiEvYTFYyV6X+pj65oYZfZ26mIenbOCCGPPldAB5?=
 =?us-ascii?Q?GJbKBiQry4BykV2BEvG9i75bF9nZyEy8eLztL7wBqd4boTwaYNhdKMmXzVx+?=
 =?us-ascii?Q?FEvX34e1zl4ZUEWi4UC8oOkt0qV+G5aePFg56AbbS2BZuCUn5MjmGFMW4quh?=
 =?us-ascii?Q?SMXfMPLx39gMxI0G4ZX2gwRzRD5x7MXqRLZ1nFy7/CmDnJnKiadHVrDllQPM?=
 =?us-ascii?Q?4Vel5vQp/K62/+0go5EViLVhGkL6oYGvel6Kul4RCfQk47t//dfMLFxwWlEj?=
 =?us-ascii?Q?sJOumwqjIrZIKk1ItBugbvjeF2wgaRFDUMhIo205817VCisymoBBi2yxl5Nq?=
 =?us-ascii?Q?H3A6bZ5h+A5OLBLSZvbh/T5Fkr40LsQxZkLZc7qDmexpr/ZGwaAob5ZgNB4z?=
 =?us-ascii?Q?DiiaBcGIAIYgX19uwVOaShcZU14Rf+hWw0+MlGsMeIw/6nk5MvnNozgPHnoN?=
 =?us-ascii?Q?a3kSBu1XBzrxtxscXVUJIvis1ZC8Iq/B7bQrJFulBDySDsS+MjxigsrB2NIj?=
 =?us-ascii?Q?yz72UNXTZm25OvjuUbltph6NU+YaaUKTIaCUemuvuGysnr2IwqdU5oCgKXTo?=
 =?us-ascii?Q?YWhn91lnEkSnpQdpU3OWdPKXlJITtx6WvkOMIld45EDmZQ1rbSJos4O4oC65?=
 =?us-ascii?Q?H6zw5NxViWt/Pvflj2uuA7lzmJ/PdPS4nfoT3jmOPrHoAuMKjvExueejhfCi?=
 =?us-ascii?Q?zynOvzXlzOBuGhckkuPGBZGjZSM/IbErnZMXMkJsVoWRUZct61xmP/lzef4z?=
 =?us-ascii?Q?JNmZyu+rj3qBMwsiGOUuhqzldLl1xGi3eBcf3dLNRjftqTB3OTWcMw/FhZ9H?=
 =?us-ascii?Q?82kiL565DSnai5ASxP3/bv+XxTEg8yzI6mJWNYZ+/UfF6LDL0CjFpjBi+Vas?=
 =?us-ascii?Q?xl945qOgthiZxO7tTzBOvAVQ6B6IRwBKFmkGrUl2s/WNZNL5zSoxaG0pVPZD?=
 =?us-ascii?Q?JE7eNvv4Rh1SqAxWm0eucF8zP7TSiXVH12b31wdhfAgsJJ87OEcTTkIST17k?=
 =?us-ascii?Q?36YFm23ce+tE9ngay+rYnhWUWP+PO3VPVD+jdaCyKRmk/ZL0j4Dk1Z/X7xgA?=
 =?us-ascii?Q?FJq/1fB57erNRrHQ6+976bZZNLw1MOueQH3H3RFS8ghJPNqygQRo6C01AV2W?=
 =?us-ascii?Q?TYmWTyy7TItuNmVNG9RM4bl9HnefeIHTl/OSffklLa3bmswKXmb0hScI0jDc?=
 =?us-ascii?Q?/E60u+i2Fb1Tkb2yl3v88ZFZ3KGol77daAxpg4zQq+I+KE0Y6w7fkr7fqo93?=
 =?us-ascii?Q?sA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f8503ae-1b1c-464f-128a-08dc59a8be6b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 21:54:06.6712 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0pg+QjcfqcQqUS1U3H9FJgunl1VRYs71Wz7W/OCYES9lDtXpkyDD5kPh9IrWFI2Cw8h8X1NTQ9A/a6HAxxIr0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6264
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

On Tue, Apr 09, 2024 at 04:17:29PM -0400, Oak Zeng wrote:
> Previously function xe_build_sg only support userptr with system
> memory pages. Now this function is extended to support userptr
> with device pages backing as well.
> 
> For device pages, there is no need of dma-mapping. Instead, we
> calculated the device page's dpa (device physical address) and
> use dpa to fill sg table.
> 
> As of now, we assume each userptr is only backed either by all
> system memory pages or all by device pages. There is no support
> of mixture backing of device and system memory pages.
> 

I'm not sure if this required as per Jason's suggestion or rather
insistence to not use a sg list for a collection of dpas [1].

For single device we should just be able to the buddy blocks as the
cursor which I suggest in [1]. Maybe this doesn't work in a multi-device
case but it certainly should work for a single device. Since we are
working a single device first, let get it working without abusing a SG
list.

Matt

[1] https://patchwork.freedesktop.org/patch/574894/?series=128910&rev=1

> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hmm.c      | 121 +++++++++++++++++++++++++------
>  drivers/gpu/drm/xe/xe_vm_types.h |   2 +
>  2 files changed, 100 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hmm.c b/drivers/gpu/drm/xe/xe_hmm.c
> index 427c6bc49949..a261c1dd2060 100644
> --- a/drivers/gpu/drm/xe/xe_hmm.c
> +++ b/drivers/gpu/drm/xe/xe_hmm.c
> @@ -11,6 +11,7 @@
>  #include <linux/hmm.h>
>  #include <linux/mm.h>
>  #include "xe_hmm.h"
> +#include "xe_svm.h"
>  #include "xe_vm.h"
>  #include "xe_bo.h"
>  
> @@ -43,15 +44,90 @@ static void xe_mark_range_accessed(struct hmm_range *range, bool write)
>  	}
>  }
>  
> +/**
> + * xe_build_sg_device_pages() - build sg table for userptr when the backing store
> + * is device pages
> + *
> + * @st: sg table to build
> + * @hmm_pfns: pfn array of the userptr
> + * @pages: struct page arrary of this userptr
> + * @npages: how many pages in this userptr
> + */
> +static int xe_build_sg_device_pages(struct sg_table *st, unsigned long *hmm_pfns,
> +						struct page **pages, uint64_t npages)
> +{
> +	struct scatterlist *sg;
> +	int i;
> +
> +	sg = NULL;
> +	st->nents = 0;
> +	if (unlikely(sg_alloc_table(st, npages, GFP_KERNEL)))
> +		return -ENOMEM;
> +
> +	for (i = 0; i < npages; i++) {
> +		unsigned long addr;
> +		struct xe_mem_region *mr;
> +
> +		mr = xe_page_to_mem_region(pages[i]);
> +		addr = xe_mem_region_pfn_to_dpa(mr, hmm_pfns[i]);
> +		if (sg && (addr == (sg_dma_address(sg) + sg->length))) {
> +			sg->length += PAGE_SIZE;
> +			sg_dma_len(sg) += PAGE_SIZE;
> +			continue;
> +		}
> +
> +		sg =  sg ? sg_next(sg) : st->sgl;
> +		sg_dma_address(sg) = addr;
> +		sg_dma_len(sg) = PAGE_SIZE;
> +		sg->length = PAGE_SIZE;
> +		st->nents++;
> +	}
> +
> +	sg_mark_end(sg);
> +	return 0;
> +}
> +
> +/**
> + * xe_validate_hmm_pfns() - validate all pages in a userptr belong to one memory
> + * region, and populate the pages array.
> + *
> + * @userptr: The userptr to validate
> + * @hmm_pfns: an array holding hmm pfns
> + * @npages: number of pages of this userptr
> + * @pages: output parameter to hold the populated pages from pfn.
> + */
> +static void xe_validate_hmm_pfns(struct xe_userptr *userptr, unsigned long *hmm_pfns,
> +						uint64_t npages, struct page **pages)
> +{
> +	int i;
> +	struct xe_vma *vma = xe_userptr_to_vma(userptr);
> +	struct xe_vm *vm = xe_vma_vm(vma);
> +
> +	pages[0] = hmm_pfn_to_page(hmm_pfns[0]);
> +	userptr->is_device_pages = is_device_private_page(pages[0]);
> +	for (i = 1; i < npages; i++) {
> +		pages[i] = hmm_pfn_to_page(hmm_pfns[i]);
> +		/**
> +		 * We currently assume no mixture of device pages and system memory
> +		 * pages in one userptr. If it turns out this is not true, we will
> +		 * either split userptr into device pages based and system memory
> +		 * based, or support a mixture backing store in one userptr.
> +		 */
> +		xe_assert(vm->xe,
> +			userptr->is_device_pages == is_device_private_page(pages[i]));
> +	}
> +}
> +
> +
>  /**
>   * xe_build_sg() - build a scatter gather table for all the physical pages/pfn
>   * in a hmm_range. dma-map pages if necessary. dma-address is save in sg table
>   * and will be used to program GPU page table later.
>   *
>   * @xe: the xe device who will access the dma-address in sg table
> + * @userptr: the userptr that we build the sg table for
>   * @range: the hmm range that we build the sg table from. range->hmm_pfns[]
>   * has the pfn numbers of pages that back up this hmm address range.
> - * @st: pointer to the sg table.
>   * @write: whether we write to this range. This decides dma map direction
>   * for system pages. If write we map it bi-diretional; otherwise
>   * DMA_TO_DEVICE
> @@ -64,11 +140,6 @@ static void xe_mark_range_accessed(struct hmm_range *range, bool write)
>   * access memory. So if the memory is system memory, we need to
>   * do a dma-mapping so it can be accessed by GPU/DMA.
>   *
> - * FIXME: This function currently only support pages in system
> - * memory. If the memory is GPU local memory (of the GPU who
> - * is going to access memory), we need gpu dpa (device physical
> - * address), and there is no need of dma-mapping. This is TBD.
> - *
>   * FIXME: dma-mapping for peer gpu device to access remote gpu's
>   * memory. Add this when you support p2p
>   *
> @@ -77,12 +148,13 @@ static void xe_mark_range_accessed(struct hmm_range *range, bool write)
>   *
>   * Returns 0 if successful; -ENOMEM if fails to allocate memory
>   */
> -static int xe_build_sg(struct xe_device *xe, struct hmm_range *range,
> -			     struct sg_table *st, bool write)
> +static int xe_build_sg(struct xe_device *xe, struct xe_userptr *userptr,
> +					struct hmm_range *range, bool write)
>  {
> +	struct sg_table *st = &userptr->sgt;
>  	struct device *dev = xe->drm.dev;
>  	struct page **pages;
> -	u64 i, npages;
> +	u64 npages;
>  	int ret;
>  
>  	npages = xe_npages_in_range(range->start, range->end);
> @@ -90,19 +162,22 @@ static int xe_build_sg(struct xe_device *xe, struct hmm_range *range,
>  	if (!pages)
>  		return -ENOMEM;
>  
> -	for (i = 0; i < npages; i++) {
> -		pages[i] = hmm_pfn_to_page(range->hmm_pfns[i]);
> -		xe_assert(xe, !is_device_private_page(pages[i]));
> -	}
> -
> -	ret = sg_alloc_table_from_pages_segment(st, pages, npages, 0,
> -			npages << PAGE_SHIFT, xe_sg_segment_size(dev), GFP_KERNEL);
> -	if (ret)
> -		goto free_pages;
> +	xe_validate_hmm_pfns(userptr, range->hmm_pfns, npages, pages);
> +	if (!userptr->is_device_pages) {
> +		ret = sg_alloc_table_from_pages_segment(st, pages, npages, 0,
> +				npages << PAGE_SHIFT, xe_sg_segment_size(dev), GFP_KERNEL);
> +		if (ret)
> +			goto free_pages;
>  
> -	ret = dma_map_sgtable(dev, st, write ? DMA_BIDIRECTIONAL : DMA_TO_DEVICE,
> -			DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_NO_KERNEL_MAPPING);
> +		ret = dma_map_sgtable(dev, st, write ? DMA_BIDIRECTIONAL : DMA_TO_DEVICE,
> +				DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_NO_KERNEL_MAPPING);
> +	} else {
> +		ret = xe_build_sg_device_pages(st, range->hmm_pfns, pages, npages);
> +		if (ret)
> +			goto free_pages;
> +	}
>  
> +	userptr->sg = st;
>  free_pages:
>  	kvfree(pages);
>  	return ret;
> @@ -127,7 +202,8 @@ void xe_userptr_free_sg(struct xe_userptr_vma *uvma)
>  	struct device *dev = xe->drm.dev;
>  
>  	xe_assert(xe, userptr->sg);
> -	dma_unmap_sgtable(dev, userptr->sg,
> +	if (!userptr->is_device_pages)
> +		dma_unmap_sgtable(dev, userptr->sg,
>  			write ? DMA_BIDIRECTIONAL : DMA_TO_DEVICE, 0);
>  
>  	sg_free_table(userptr->sg);
> @@ -239,12 +315,11 @@ int xe_userptr_populate_range(struct xe_userptr_vma *uvma)
>  	if (ret)
>  		goto free_pfns;
>  
> -	ret = xe_build_sg(vm->xe, &hmm_range, &userptr->sgt, write);
> +	ret = xe_build_sg(vm->xe, userptr, &hmm_range, write);
>  	if (ret)
>  		goto free_pfns;
>  
>  	xe_mark_range_accessed(&hmm_range, write);
> -	userptr->sg = &userptr->sgt;
>  	userptr->notifier_seq = hmm_range.notifier_seq;
>  
>  free_pfns:
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index fbf6bfcf59a8..3b4debfecc9b 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -64,6 +64,8 @@ struct xe_userptr {
>  	struct sg_table *sg;
>  	/** @notifier_seq: notifier sequence number */
>  	unsigned long notifier_seq;
> +	/** @is_device_pages: the backing store is in device memory*/
> +	bool is_device_pages;
>  	/**
>  	 * @initial_bind: user pointer has been bound at least once.
>  	 * write: vm->userptr.notifier_lock in read mode and vm->resv held.
> -- 
> 2.26.3
> 
