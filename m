Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96453CD11C2
	for <intel-xe@archiver.kernel.org>; Thu, 11 Apr 2024 02:50:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE81D10ED3D;
	Thu, 11 Apr 2024 02:50:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nFdwxOY7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC64910ED3D
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Apr 2024 02:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712803835; x=1744339835;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=5cjWvI138fPcAZy1PbD5EsuLK8vl2tAO3xe2LXckJAw=;
 b=nFdwxOY7kpg0gZx5TT8EW+ddQjOkENWda0HNK2gsx1Dsd1VHM9R81Z+V
 WglvVnO243KlNFl/h8z4K7sSSRh11ygP4ZFQMHH46NFiXPw1UoMGR2NZW
 1ojUTfgK4wz8wNsAhhcKUvXIGBsmrVyb4YpCLjryR1Efsv7Kw+DxKTej1
 Gktd80bBD0hFH80B4iz2vEYljGHjfj/D5ZQkClbjCxyI4+wgJYxdeuPoc
 +8ooEoX+djy/8gJLvRe7dPtAyEKBkKzQWn4AQVHkFeTLICJC6riesNkh7
 PXcJdTFoMOgnTciofrOoZGSkFCG3mpPEFFEwV6izl8JWpGM+Pu9wiJ/o5 Q==;
X-CSE-ConnectionGUID: EvWwQp+kTwqF1gVk7/7bJQ==
X-CSE-MsgGUID: sCqmkoi3Ra6gAS+9BK7okQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="18907376"
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; d="scan'208";a="18907376"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 19:50:34 -0700
X-CSE-ConnectionGUID: Nj+GsXzHQaecOB3ZJtTbGQ==
X-CSE-MsgGUID: OWrRQP9wRyKxlXoGu5B89g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; d="scan'208";a="25532422"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Apr 2024 19:50:33 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Apr 2024 19:50:32 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 10 Apr 2024 19:50:32 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 10 Apr 2024 19:50:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iZcP79TDqt+LA85DxgOie3dWr2ZPW8utweSXdN1SzwUBGYDd7a3C4VPLpzvL2+4e0n0OCIZEjv+wu01g6o6a59k94e9AxDa/ISD30AtbMC3mjHCkOukKGGv4CvAznUd9xknEBaYGSDiDEIJmLbR+s0aOzu0rI8MWClY0XZgZUhI4O5SPfE1/jZ+pX/knKZQlgTEBFHNwIarIyrjDWlLAZyAYEBfaa/0qGSqimFCXOUXYuJrZkHGBJQIcJDeFJR0irnu+hw/0C3K26bBtZ/ocHFPDJ9Dz+HEt/mENGRIXUXODoC44yoKB9CNqFSLjnTeIlN9ZQXGqEvDyjJ0qEma/Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eNdiq/GpdmwZBKtbS7rO0Nl8EoQr8Lfksn/HmoBx8Yo=;
 b=eCnOCF9i8CwMD88lvmDRhB6XXexZ2j2mQt/cKvqoHg8SprIaHt3WDybW9UA/VDEZhWjYEQgm+yu2vYcAdvWY2yA5lH2qqEbkoNDCt6CjEsjyBalsnQzJ3fZD4EB1Kc6qw3lfE3EPVa9wZZU/59Lg3jnbLWd51T5w7wZM7ByJxAMX5QpTIx67/EdAckaWxtmyPoB1Yp908Appb30MgRywue/Ks2B6LHRv/8jbV804Ur/6jOMZ6R9/UdxzAroRopEJJ3XCqXBSjsN/LIpbBAJSQ8N36pnxR9K7aL/NRGAje4Q811b0sK43r0GQ87Gkvn5bgPWp0CPXAGw/6Ha/mwrKeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB6716.namprd11.prod.outlook.com (2603:10b6:303:20d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Thu, 11 Apr
 2024 02:50:30 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7452.019; Thu, 11 Apr 2024
 02:50:30 +0000
Date: Thu, 11 Apr 2024 02:49:21 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Oak Zeng <oak.zeng@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <krishnaiah.bommu@intel.com>, <Thomas.Hellstrom@linux.intel.com>,
 <brian.welty@intel.com>
Subject: Re: [v2 28/31] drm/xe/svm: Introduce helper to migrate vma to vram
Message-ID: <ZhdPsV/ou2DMQe3O@DUT025-TGLU.fm.intel.com>
References: <20240409201742.3042626-1-oak.zeng@intel.com>
 <20240409201742.3042626-29-oak.zeng@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240409201742.3042626-29-oak.zeng@intel.com>
X-ClientProxiedBy: SJ0PR13CA0232.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB6716:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +bBSOQat95xuIJ6As7/HuJrOuPzw26C5Tv5TlHECTzL8vd2hJ9XOXA90CZtdK/X8dfBbP7h2+UsxG5PrIY4nvQD6yjJqx1YqdJyPvQTwM9H7sr1pgVc8f+CsIzNZ2PnbLF169jD+YLDJUjIVCRdTh91s+9i77I5xASeRZA3G2vxcYK1so96Pwr+SzkpF1iwYcIGlGoBzDil9JxwBPyFbuUXjYdh1LerhllgNiLaC2h1aUl3kwk2KSpQVwUQX4TGW6N3HRxX9/h9gCvkNp3+lTRndEKIN/R0nnxDQebPNP9og8ba22ffs5Kl30LSa7q1toOo1Op6OazFXWkdPBPZifOGRMnh2tbhf57ypUuvn7ZPBicukXullDbuMRTsX5/Oh19pP+NquWxP2hjDDhX0l4CKMsZPR/3ptLo4h47ZfT73d3QvpAmXAoXvb55Laqee1cpqbPhDsEhLQp/gB3O3UUgsyvv4UofaZUZwNqb/I0b8L4n7N+wR9CnPuHUmxDWJHpUncTJrwuomN1GMeiBZyxABwU+nG6CMnOaQ4lUUS8zmIE5BhK4f/N9cQotbzewA1w2XGXAk6zL8TjAsnnNiHNJYrenySV0jBmxNXQRJcepd8jedDzQkxpCnjdFvMHLJI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?PDJKyFZPC9B8LRJ4sf3cs0kEPF2fHNO9bWthenZDz1cYis/3jUwLUHju9T?=
 =?iso-8859-1?Q?93H5FTeIGGoEpkZ8LQKjnY1euaL5TFeLh3hkmaM4n2RX4ag/SIe9azixeU?=
 =?iso-8859-1?Q?+ChIk5ClpMAHp4CmzGZGpkllUZP6BytHCG2iw3IJ9kLufT5wxw1gIqG+/V?=
 =?iso-8859-1?Q?RVguHOFYAypTGmzbaNMDavnuKCJmGSs168cKKMCkDRRZC25vd+aSFlv3fb?=
 =?iso-8859-1?Q?pWUqBH98yZB+qp75oDYPpkIx8COmsJiczFE0EFCaJ1BUjhstvkZks9RoVj?=
 =?iso-8859-1?Q?sgZE36MSbA2W7fTMXeYRVtZYfuHy6Yew/p5qnIh4y3QQMjUtq3TGPnGhhs?=
 =?iso-8859-1?Q?dSPc1cAzcGTSTRPcsLV3BySW/8Ki9X5zkFY9IwqfO1PKuAjpyfndlxRcon?=
 =?iso-8859-1?Q?b7QmQkxzKBe+XiOb6DIbPWK7Y2F+2imvUbBMxjBqxIewpZ5ZslgAWDW0II?=
 =?iso-8859-1?Q?X0SFrTDGjjqoaTiugdT9/GNE1lfWAR341S1Ol26+63eSjEUBOenGRM5knr?=
 =?iso-8859-1?Q?2Bt1O39mhvvOVSi0DrRZA+a/DWLp91WYPwa57KtH1OfZT/3WeIPAmbvC86?=
 =?iso-8859-1?Q?XLUm/w/IlSye2G9MehV/GoiPumVWjZBxxyTYfTfXD3Mr6LuS0mlYCQZ+0F?=
 =?iso-8859-1?Q?PyER2qRMVwhBUDuuGo+x1XTu2+e3o9ZxvT9ydrIx+Nu9JASprfcP1WV3/P?=
 =?iso-8859-1?Q?/Pw0dT6VX4QA3oB9fwye9q3C1QBcySbGFlefwSuWFUMEvhDPtDQNKOvxmL?=
 =?iso-8859-1?Q?q8FU/WwJ7tEPYSy3qZo2BqlPfDn1AhIMPZOhU6C9b/u02Ukskm1u3fQIu9?=
 =?iso-8859-1?Q?YPyxh3rfvNMi0dYn3tpImwqALKW+drbc98HpBrA0OMlV67EdnVQ/iw4qJL?=
 =?iso-8859-1?Q?eeQmmttEkHmH5ryrojI78TxhbeWDLHqbbqgG42nhJlLbkHWbl9/1BO7wAN?=
 =?iso-8859-1?Q?RxuYAJY+VGfyJ9Oy5KcHrxl3XwZtT3PnvXSk9cThZjeLz3ozYv8DXCAV0i?=
 =?iso-8859-1?Q?H7qRcE1tG0MiWUgcW9isTNjfquLNTO5Zra+YOqixTCPwdwFe9jVTS+tm92?=
 =?iso-8859-1?Q?bWMOVXn2qKUC+v71vPb2tSVFTRUEL07ermyjKztKf7hDIzUAhefJGYMLgi?=
 =?iso-8859-1?Q?mPyd5VrZMEA0BzuhJ+lFGjNMy5Tso4XUNV+hCovJzrYiMRLB8fN/VsQGDD?=
 =?iso-8859-1?Q?p5T93ZWtI+XDJMDoihtkpkWe/cSl+bXq4Oev21+m5fvMQRfpwsp57rYo/Z?=
 =?iso-8859-1?Q?WcFrynt7ky/mg5FXb8JUgqhJwDNUrb1Ok6ygAFwRbC4VqXIoN1ixlknlud?=
 =?iso-8859-1?Q?7ABfiCGibjrdXV9RdBey0vV6Sjo4xWmYloTz+cCo/TRlENFX89ZPcIffLX?=
 =?iso-8859-1?Q?w8wtqlSQIPl1kZ5MjI79TIqqsHSFywnI+x3eSnnH0iT8M1dIKB6UzxHgF6?=
 =?iso-8859-1?Q?oXSnspJqvyp8OIFtrBSwRu1uC9M7hUqjdhEkcPjEMAwLCFP1jpfEHMMeyJ?=
 =?iso-8859-1?Q?qVCZzsrKgPXZWBmO7tklb1ikaBa5UHYfJwCuBg4p8cHj4+9DgFK5db+bys?=
 =?iso-8859-1?Q?guu8Kbr6056V9iDCXd3n+owmJH22RG57o+HydEUCM/id7Y39dkezv9LglK?=
 =?iso-8859-1?Q?bW/utK7tFHCImMOAIzWBQIKLHiwS77573QQPh+xjyiy1ebH2lWKDiy/Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c734913-4e15-411a-df18-08dc59d22612
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2024 02:50:29.8805 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bh8nGai0Lezyq56Knke86VaxmUBmqwJJOzgkfH5Ra+Di2yUES4wAdfcrs3hYkb1KT4au+funyg+o/dTqv4srOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6716
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

On Tue, Apr 09, 2024 at 04:17:39PM -0400, Oak Zeng wrote:
> Introduce a helper function xe_svm_migrate_vma_to_vram.
> 
> Since the source pages of the svm range can be physically not
> contiguous, and the destination vram pages can also be not
> contiguous, there is no easy way to migrate multiple pages per
> blitter command. We do page by page migration for now.
> 
> Migration is best effort. Even if we fail to migrate some pages,
> we will try to migrate the rest pages.
> 
> FIXME: Use one blitter command to copy when both src and dst are
> physically contiguous
> 

Yep, touch in this throughout the series. Only vram needs to be
contiguous though as we dynamically create PT mappings for sram pages in
the migrate code. Getting this in a must and should be done immediately
IMO as this a very, very basic perform thing we know needs to be done.
We will likely have to tune this code quite a bit for performance so
getting known things done would be helpful.

> FIXME: when a vma is partially migrated, split vma as we assume
> no mixture vma placement.
> 

Agree we do not want support partial migrations. We likely want to
return -EAGAIN for something and fault back to a smaller xe_vma chunk
size which I discussed in [1] and add comment on in [2].

Migration should be best case too if we fail migrate we can always leave
backing store in sram too.

I do have question though, when do we get partial migrations? A user
having called mlock on some of the pages? I just want to make sure I
fully understand that case.

[1] https://patchwork.freedesktop.org/patch/588526/?series=132229&rev=1
[2] https://patchwork.freedesktop.org/patch/588528/?series=132229&rev=1

> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> Co-developed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@intel.com>
> Cc: Brian Welty <brian.welty@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_svm.h         |   2 +
>  drivers/gpu/drm/xe/xe_svm_migrate.c | 115 ++++++++++++++++++++++++++++

Same comment on file structure throughout the series apply here too.

>  2 files changed, 117 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index c9e4239c44b4..18ce2e3757c5 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -83,4 +83,6 @@ int xe_devm_alloc_pages(struct xe_tile *tile,
>  void xe_devm_free_blocks(struct list_head *blocks);
>  void xe_devm_page_free(struct page *page);
>  vm_fault_t xe_svm_migrate_to_sram(struct vm_fault *vmf);
> +int xe_svm_migrate_vma_to_vram(struct xe_vm *vm, struct xe_vma *vma,
> +							struct xe_tile *tile);
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_svm_migrate.c b/drivers/gpu/drm/xe/xe_svm_migrate.c
> index 0db831af098e..ab8dd1f58aa4 100644
> --- a/drivers/gpu/drm/xe/xe_svm_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_svm_migrate.c
> @@ -220,3 +220,118 @@ vm_fault_t xe_svm_migrate_to_sram(struct vm_fault *vmf)
>  	kvfree(buf);
>  	return 0;
>  }
> +
> +/**
> + * xe_svm_migrate_vma_to_vram() - migrate backing store of a vma to vram
> + * Must be called with mmap_read_lock held.
> + * @vm: the vm that the vma belongs to
> + * @vma: the vma to migrate.
> + * @tile: the destination tile which holds the new backing store of the range
> + *
> + * Returns: negative errno on faiure, 0 on success
> + */
> +int xe_svm_migrate_vma_to_vram(struct xe_vm *vm,
> +							struct xe_vma *vma,
> +							struct xe_tile *tile)
> +{
> +	struct mm_struct *mm = vm->mm;
> +	unsigned long start = xe_vma_start(vma);
> +	unsigned long end = xe_vma_end(vma);
> +	unsigned long npages = (end - start) >> PAGE_SHIFT;
> +	struct xe_mem_region *mr = &tile->mem.vram;
> +	struct vm_area_struct *vas;
> +
> +	struct migrate_vma migrate = {
> +		.start		= start,
> +		.end		= end,
> +		.pgmap_owner	= tile->xe,

Again helper to assign owner.

> +		.flags          = MIGRATE_VMA_SELECT_SYSTEM,
> +	};
> +	struct device *dev = tile->xe->drm.dev;
> +	dma_addr_t *src_dma_addr;
> +	struct dma_fence *fence;
> +	struct page *src_page;
> +	LIST_HEAD(blocks);
> +	int ret = 0, i;
> +	u64 dst_dpa;
> +	void *buf;
> +
> +	mmap_assert_locked(mm);

This mmap_assert_locked is ambiguous, we should make it clear if this
read or write locked. Doesn't it have to be write to do the migrate
pages?

A larger question about the locking... The CPU fault handler holds the
mmap lock in write mode, right? 

I'm asking as basically I think at least initially we want to hold the
mmap lock in a way that the GPU handler and CPU handler do not race.
i.e. From fault userptr create in GPU fault handler to issuing the bind
we prevent the CPU fault handler from running.

I'm having issues figuring out how to prevent races between initial
binds of userptrs and userptr invalidates on faulting VMs. This race is
seen any xe_exec_fault_mode for example... So preventing races between
CPU / GPU fault handler with the mmap probably is a good idea initially.
Likely can make the locking finer grained once this is all working and I
figure out how to handle this race better.

> +
> +	vas = find_vma_intersection(mm, start, start + 4);

find_vma should work fine here.

> +	if (!vas)
> +		return -ENOENT;
> +
> +	migrate.vma = vas;
> +	buf = kvcalloc(npages, 2* sizeof(*migrate.src) + sizeof(*src_dma_addr),
> +					GFP_KERNEL);
> +	if(!buf)
> +		return -ENOMEM;
> +	migrate.src = buf;
> +	migrate.dst = migrate.src + npages;
> +	src_dma_addr = (dma_addr_t *) (migrate.dst + npages);
> +	ret = xe_devm_alloc_pages(tile, npages, &blocks, migrate.dst);

Again as I discussed in [3] I think this should be broken out into a
different step with the blocks allocated before this, and here just
populate migrate.dst from the existing blocks.

[3] https://patchwork.freedesktop.org/patch/588523/?series=132229&rev=1

> +	if (ret)
> +		goto kfree_buf;
> +
> +	ret = migrate_vma_setup(&migrate);
> +	if (ret) {
> +		drm_err(&tile->xe->drm, "vma setup returned %d for range [%lx - %lx]\n",
> +				ret, start, end);
> +		goto free_dst_pages;
> +	}
> +
> +	/**FIXME: partial migration of a range print a warning for now.
> +	 * If this message is printed, we need to split xe_vma as we
> +	 * don't support a mixture placement of one vma
> +	 */
> +	if (migrate.cpages != npages)
> +		drm_warn(&tile->xe->drm, "Partial migration for range [%lx - %lx], range is %ld pages, migrate only %ld pages\n",
> +				start, end, npages, migrate.cpages);

As discussed above, we shouldn't support this. We should fall back to
smaller xe_vma chunk size until we find one that works or simply leave
the pages in sram and map those pages to GPU.

> +
> +	/**Migrate page by page for now.
> +	 * Both source pages and destination pages can physically not contiguous,
> +	 * there is no good way to migrate multiple pages per blitter command.
> +	 */

Touched on this a bunch throughout the series, lets do better than a
page a time migration.

Algorithm should be very similar to what I discussed here [4] but with a
few key differences.

- I think the sram pages can be unpopulated (page == NULL) if the user
  has not yet touched the page
- Also I think the MIGRATE_PFN_MIGRATE bit being clear is valid

In these cases this indicate we have to issue a copy for the pages we
are accumulating with contigous vram addresses.

[4] https://patchwork.freedesktop.org/patch/588526/?series=132229&rev=1

> +	for (i = 0; i < npages; i++) {
> +		src_page = migrate_pfn_to_page(migrate.src[i]);
> +		if (unlikely(!src_page || !(migrate.src[i] & MIGRATE_PFN_MIGRATE)))

Discussed this in the CPU fault patch, once we call migrate_vma_setup,
on subsequent errors we need to call migrate_vma_finalize to revert the
pages to the original state. At least I think if I am reading the doc
after this correctly.

Here on error we just free the pages...

Matt

> +			goto free_dst_page;
> +
> +		xe_assert(tile->xe, !is_zone_device_page(src_page));
> +		src_dma_addr[i] = dma_map_page(dev, src_page, 0, PAGE_SIZE, DMA_TO_DEVICE);
> +		if (unlikely(dma_mapping_error(dev, src_dma_addr[i]))) {
> +			drm_warn(&tile->xe->drm, "dma map error for host pfn %lx\n", migrate.src[i]);
> +			goto free_dst_page;
> +		}
> +		dst_dpa = xe_mem_region_pfn_to_dpa(mr, migrate.dst[i]);
> +		fence = xe_migrate_pa(tile->migrate, src_dma_addr[i], false,
> +				dst_dpa, true, PAGE_SIZE);
> +		if (IS_ERR(fence)) {
> +			drm_warn(&tile->xe->drm, "migrate host page (pfn: %lx) to vram failed\n",
> +					migrate.src[i]);
> +			/**Migration is best effort. Even we failed here, we continue*/
> +			goto free_dst_page;
> +		}
> +		/**FIXME: Use the first migration's out fence as the second migration's input fence,
> +		 * and so on. Only wait the out fence of last migration?
> +		 */
> +		dma_fence_wait(fence, false);
> +		dma_fence_put(fence);
> +free_dst_page:
> +		xe_devm_page_free(pfn_to_page(migrate.dst[i]));
> +	}
> +
> +	for (i = 0; i < npages; i++)
> +		if (!(dma_mapping_error(dev, src_dma_addr[i])))
> +			dma_unmap_page(dev, src_dma_addr[i], PAGE_SIZE, DMA_TO_DEVICE);
> +
> +	migrate_vma_pages(&migrate);
> +	migrate_vma_finalize(&migrate);
> +free_dst_pages:
> +	if (ret)
> +		xe_devm_free_blocks(&blocks);
> +kfree_buf:
> +	kfree(buf);
> +	return ret;
> +}
> -- 
> 2.26.3
> 
