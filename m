Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52FD5C54E58
	for <intel-xe@archiver.kernel.org>; Mon, 11 Mar 2024 18:50:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6D13112C08;
	Mon, 11 Mar 2024 18:50:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R2hPwiq3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45034112C16
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Mar 2024 18:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710183043; x=1741719043;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=5MuznhCX+2cQS4+tgxa+IAsrmvcRvv19qJLqgjefuhs=;
 b=R2hPwiq30J0dYKlg42ZeBVzXbzgWMTDfoH+6h7JaiWZJYPMSKfTv1pX5
 Jb4bQbfqG5p4NUmjt8VcVk+r/lbPc/aCuEwEBQA3NZ8DEiYaqy5wPopYc
 FIXFHeamPXb25AzVCoa57PsGy+gTS3XJvnuz1OmUHo3NlfwTIK7XjXOMq
 Cupzka80jSgT1fxpJbPP2rFvp04KqHfwZbc7Pq9UDjXFG+5jDjVty/3tK
 GIi8Dym6ScaiLZchskGQ+Ko+GhKd630EvD7+lAJNH6rVPkgtEsZZLoEX4
 ILbgBHm+azf0xi8kOCRH1+RzAUQGD+vBAtGd6vR5i3u/kUfw1SocJbgqp g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="5468143"
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="5468143"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 11:50:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; d="scan'208";a="15752283"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Mar 2024 11:50:42 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Mar 2024 11:50:42 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Mar 2024 11:50:41 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Mar 2024 11:50:41 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Mar 2024 11:50:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mn2nlEPSIThxGx+pAE61vwHroKLxkvxrndXRmUavJGI3X2tH8qNCMWaIvdV0sclh90mz24bEXLzkN1dB66BI5iq7zqfrdpibppbSP5CotlzMeeJpov9n596oWGOpNst05by2+z5EZ6qwGLXCmgXAHSix5fVpVQRZIHkwr0xMeQyp66+8edjhAhrqWX6ZGg/iixg45ddkpe1NTG9q7WGHiXWnAcf4ZrtHVeBwic+cDc6Df6YrIAkF+n/FxKu0kxMrt3s/HFtpR0cAMKoLowBtR3NRbS1aWZAi+a/rlv0PXb1wQO+Xbqd6BW2QwxSPXiD2xUydYCID9chYj4JBoUm2zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZZBxh8om/N8jGh+hOAXrV5sa75pOg8D4jG/JR4hi1y0=;
 b=kv+EHswL5M0RoIlqHET5j8jybkEU2XQSVrvFhleZcf0GPEzwzKOxHdK5qwWEh9TWoke1ypE/A4qKml4oQg9l88aZTbSHX/w+bNpCxaiflU/jDDi9L/6Oqqwc8JA8pxDv4UfjQBtx4QraDzvSDLLG70LIT6FpncqGMTN/ijg3XXr/0h7WD5Yutek8npbVO02iBz7I9QIk6HCu6Dzawi7IN5WZFTv8DZNfDsMIoLZ3SL6X97DsD5kYnJc76p/9hRDFrZcthznZv3igHtaInC4bvk8k3sSTuGjtVuw1I/i0rJAXRzNl6ni4no4/jU14sTRFflTEO9uPhJi5P4OHMXNaLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB4831.namprd11.prod.outlook.com (2603:10b6:a03:2d2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.15; Mon, 11 Mar
 2024 18:50:39 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7386.016; Mon, 11 Mar 2024
 18:50:39 +0000
Date: Mon, 11 Mar 2024 18:49:25 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <fei.yang@intel.com>,
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/xe: Invalidate userptr VMA on page pin fault
Message-ID: <Ze9SNeu2Ifl+/vOI@DUT025-TGLU.fm.intel.com>
References: <20240308213747.597649-1-matthew.brost@intel.com>
 <8203b1a23e65a876d02a5929a8e489eb9ad387de.camel@linux.intel.com>
 <de53c4465285bb4cc25ad4ebd23a950ce1dd12eb.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <de53c4465285bb4cc25ad4ebd23a950ce1dd12eb.camel@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0261.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB4831:EE_
X-MS-Office365-Filtering-Correlation-Id: ff75f738-a536-4ef1-e0d0-08dc41fc257b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wXgEqOFd+BCFEkj/F7M1eyVBtoGb8BHnj96Gu5CKAR+C99gjg2IlJWXzIqhaRCYeU6MO/LgTFUvTicJLuKNv2uBzbuYLrit/gda4N9Cz0upYQSvdXOT9/hb/UTo4kzNDHBR7q9KcDNPaxA4l9OXE17HaWG+ZKpeeekmItiXKc+wHy8Gx3Is45T4nlOJZR4+SohB3sJnRi2YhPB41Y9QM0gGqdWPNUtYm5HdW5/hTYl0qb8pW1NCQ+ZS6d7SYWUpab64/BCcgeSnHPGSSQIpWMeZmi21HU8KK5j9nDJ+2wwisHQPquDv0GiWv088qXGjQioslGYvES63LPZ52D3bHA1EaPf0Y/NJiyxEmUxyAWwsZOaTEjlPo03ChmklA4duUiUCuWOFoG/uyIY7x721XyZC/alB4wrr2LWcVRK8eIqPD7s8HSifkttDXqWeV5n+Jczi6QiQuiyBKuLWjxW9Z6b+2tT7iZ/0hvaBqf8p8Z5pYOhClkhBQLa+MBNmAp6apooRdFk94SFQskyEoxUXgBOJNBKugShcGtnkd05HLDy8xx2JA8mB7S86p/4s7T0EIHKapWXssQWtRVoJUZj+iL/JKE3RrXY39yZGIq3XJFfDCZNq5HayxrhU8+v1x5rOL1DZyb931Mm1wqxyTjmGlmrIB5KnR898NrOV3SXc1eRk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?lszn87j6YJri/SQ7lhU5fyhv2SoakWJ08YPcnuY/9uV4lu+ydJJ2tpRi9V?=
 =?iso-8859-1?Q?lXF3+dfbYw4NfKMKDUULTwq1WbOiVzG+mVQacnZe3+MvC1YqlRyf8Rcx7n?=
 =?iso-8859-1?Q?6+BPAPDEn74agOuCigYX2XOXuJNDa5QJePT0/gvYHrW/rvpWeBaREXJ2Ps?=
 =?iso-8859-1?Q?TlM5MlQqvKGUEsN48KUftXNj3t8wrcir5cAmO+B03mYWLh0bDimTMDPSol?=
 =?iso-8859-1?Q?u97RPbckwbZ3FFc/TTjpQ8w5GDwnzkC8vBQFnPbpSrup1DKxgV+g2ZSe1e?=
 =?iso-8859-1?Q?X3U97ZgM9i17zx5i4sP//6FBEwlqoUkRTccq1IcQlAq2GpJ+dXpzoaMltz?=
 =?iso-8859-1?Q?GuMp9iUeFi3PZrZ02J2m7+1lWu9jQGAeslfQOZlSYRnSIe5RZVPLUXO5vX?=
 =?iso-8859-1?Q?SwgkjJSZq+KO6U6Dm6/sPY5w5uL4FOfcE1nAgWWmZSYwkhK5FrYcGVaAdQ?=
 =?iso-8859-1?Q?rw54+qNcQzAgjrJjilxk6TTXqE4dgJJr6PHK1NsPJmRmfMrGJCY7nhrtQc?=
 =?iso-8859-1?Q?3NeHiuBkYVZtplonJe1x6eefmKUsAwWA1CK+za8lxCqitFYtb5Z8lN61M0?=
 =?iso-8859-1?Q?UoRhvowENlTHgKRDxi7J7GSxSvKeT6IvwU1NhIroAboQjxwWoO+nvpE8J3?=
 =?iso-8859-1?Q?lVKq6xKw5Nvu6vcBfV05RJAUl3klKWg5vpuXz+HAw4zwTtDDt5SQDeiHqf?=
 =?iso-8859-1?Q?KPenarAPeLzGs53YTkX19a5GH2KVLDWP/vjkwikXm/D/eCYEnXEDx/1DQJ?=
 =?iso-8859-1?Q?r7lwQT4Fcpn/e3ZNt+9sB2sGu9H+wIUpp+6xZIRVXKduBRFnDQF+TjEdFs?=
 =?iso-8859-1?Q?g/bdv9AWguixYzODmR/QlgBkwrA9DRrC9WU1x5roQ98BFZib9PxugKd2uu?=
 =?iso-8859-1?Q?W6WMz2XWkk8cC+kZpeimF6UlCEVUNnngncwza/cHpo7AzCVQ8JGHcarg1O?=
 =?iso-8859-1?Q?vzn9s0aOQkL/7xm6/IBDw8hYlsOq8WwxzZ/YVCyU6aatJoAeX9ZW0JChk5?=
 =?iso-8859-1?Q?UXu5J3PnRh16b/FXNOJqhbKwWpHtKI2F20/hFQ/vsh3ii6kql4OlM7Hnjd?=
 =?iso-8859-1?Q?1Yr2B3uWPHIvW88BTe+3GbYquWsnvwrr94A4k+RmBFgdHnXUbY8x7R5FfE?=
 =?iso-8859-1?Q?rX49RqDW1X6ZPzD+DVwnHwo3IXC/lmmDpkWQ18AA2aQav8StYDoR90GAz7?=
 =?iso-8859-1?Q?SysKQVBMvfpGIrwo2+SBMEJjSjKEwhgCk5T9IPJdWpg2L46SUoMqvC5Cau?=
 =?iso-8859-1?Q?p+QiGqCwjIYl+UBAfsYqGcc6jyLji7B2QZErI/ePzr58nEo21U1A5T/wsb?=
 =?iso-8859-1?Q?o0q3BRoZ9x6MHxSWyCLzIpMBmC5s84HkGagMs+N9lDBmPmH8m1o32/Ytub?=
 =?iso-8859-1?Q?xVdF1n7qMmm8TG6Nz/BYRVs9FYOOKh7MU0cgP8MA4cYH1w4IvjiOVIYUQa?=
 =?iso-8859-1?Q?cKLBNVyQ3eDFLwEGtdGyN3DxIi8yf/hQMBjV1foO+Odt4OJgQlrQzNHf4c?=
 =?iso-8859-1?Q?4Bk3Eog7N9ISk1GVl/ewyP2vgfVzutX28D39aeV6ieJd2tsTbS9npptCja?=
 =?iso-8859-1?Q?S7FL1+f9GQKQrZuh6PC24o7jNMEZzaBKVTJBy/AHGKCgzxA0S8ydjRDY3V?=
 =?iso-8859-1?Q?27AEnI/w0klEbDmrI0FjaurjVbC/szQ3NUqxNKBP9+7uR4Reiw7QLTaw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ff75f738-a536-4ef1-e0d0-08dc41fc257b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 18:50:39.7581 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MuIEgxMDfEmllVi3gX0IApIlgOmhAF7JdvlybmwkkHiFLhWHMxf/s6ovfOERwYm7HIRcv4NDE5D2AoesPZubRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4831
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

On Mon, Mar 11, 2024 at 02:29:26PM +0100, Thomas Hellström wrote:
> On Mon, 2024-03-11 at 11:55 +0100, Thomas Hellström wrote:
> > Hi, Matthew
> > 
> > On Fri, 2024-03-08 at 13:37 -0800, Matthew Brost wrote:
> > > Rather than return an error to the user or ban the VM when userptr
> > > VMA
> > > page pin fails with -EFAULT, invalidate VMA mappings. This supports
> > > the
> > > UMD use case of freeing userptr while still having bindings.
> > > 
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_gt_pagefault.c |  4 ++--
> > >  drivers/gpu/drm/xe/xe_trace.h        |  2 +-
> > >  drivers/gpu/drm/xe/xe_vm.c           | 20 +++++++++++++-------
> > >  drivers/gpu/drm/xe/xe_vm_types.h     |  7 ++-----
> > >  4 files changed, 18 insertions(+), 15 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > index 73c535193a98..241c294270d9 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > @@ -69,7 +69,7 @@ static bool access_is_atomic(enum access_type
> > > access_type)
> > >  static bool vma_is_valid(struct xe_tile *tile, struct xe_vma *vma)
> > >  {
> > >  	return BIT(tile->id) & vma->tile_present &&
> > > -		!(BIT(tile->id) & vma->usm.tile_invalidated);
> > > +		!(BIT(tile->id) & vma->tile_invalidated);
> > >  }
> > >  
> > >  static bool vma_matches(struct xe_vma *vma, u64 page_addr)
> > > @@ -226,7 +226,7 @@ static int handle_pagefault(struct xe_gt *gt,
> > > struct pagefault *pf)
> > >  
> > >  	if (xe_vma_is_userptr(vma))
> > >  		ret =
> > > xe_vma_userptr_check_repin(to_userptr_vma(vma));
> > > -	vma->usm.tile_invalidated &= ~BIT(tile->id);
> > > +	vma->tile_invalidated &= ~BIT(tile->id);
> > >  
> > >  unlock_dma_resv:
> > >  	drm_exec_fini(&exec);
> > > diff --git a/drivers/gpu/drm/xe/xe_trace.h
> > > b/drivers/gpu/drm/xe/xe_trace.h
> > > index 4ddc55527f9a..846f14507d5f 100644
> > > --- a/drivers/gpu/drm/xe/xe_trace.h
> > > +++ b/drivers/gpu/drm/xe/xe_trace.h
> > > @@ -468,7 +468,7 @@ DEFINE_EVENT(xe_vma, xe_vma_userptr_invalidate,
> > >  	     TP_ARGS(vma)
> > >  );
> > >  
> > > -DEFINE_EVENT(xe_vma, xe_vma_usm_invalidate,
> > > +DEFINE_EVENT(xe_vma, xe_vma_invalidate,
> > >  	     TP_PROTO(struct xe_vma *vma),
> > >  	     TP_ARGS(vma)
> > >  );
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > > b/drivers/gpu/drm/xe/xe_vm.c
> > > index 643b3701a738..9a19044f7ef6 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -724,11 +724,18 @@ int xe_vm_userptr_pin(struct xe_vm *vm)
> > >  	list_for_each_entry_safe(uvma, next, &vm-
> > > > userptr.repin_list,
> > >  				 userptr.repin_link) {
> > >  		err = xe_vma_userptr_pin_pages(uvma);
> > > -		if (err < 0)
> > > -			return err;
> > > -
> > >  		list_del_init(&uvma->userptr.repin_link);
> > > -		list_move_tail(&uvma->vma.combined_links.rebind,
> > > &vm->rebind_list);
> > > +		if (err == -EFAULT) {
> > > +			err = xe_vm_invalidate_vma(&uvma->vma);
> > 
> > I think we need to check for FAULT_MODE here. If we hit this path in
> > FAULT_MODE, we already have an invalid gpu access and can kill the
> > VM.
> > 

Agree, will fix.

> > In preempt-fence mode, we should probably be calling
> > xe_vm_unbind_vma(), because xe_vm_invalidate_vma() isn't safe to call
> > outside of the mmu_notifier, and if there are still BOOKKEEP fences
> > pending- see the asserts in that function.
> 
> 
> Actually, xe_vm_invalidate_vma() would probably work if we grabbed the
> vm resv and waited for bookkeep fences first, and updated the asserts. 
>

Yes, I think that will work but is that even needed? We have vm->lock
here in write mode which should prevent any further updates to the page
tables. What are we trying prevent a race a against? An in-flight bind
job which touches the same page tables? I guess that is possible.
 
> But then xe_vm_unbind_vma() might still be better since we also clean
> up the page-tables.
> 

I think we do not want to mess with the VMA state as that should only be
changed by user IOCTLs. An invalidation seems to be the right call here.

> /Thomas
> 
> 
> > 
> > > +			if (err)
> > > +				return err;
> > > +		} else {
> > > +			if (err < 0)
> > > +				return err;
> > > +
> > > +			list_move_tail(&uvma-
> > > > vma.combined_links.rebind,
> > > +				       &vm->rebind_list);
> > > +		}
> > >  	}
> > >  
> > >  	return 0;
> > > @@ -3214,9 +3221,8 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
> > >  	u8 id;
> > >  	int ret;
> > >  
> > > -	xe_assert(xe, xe_vm_in_fault_mode(xe_vma_vm(vma)));
> > >  	xe_assert(xe, !xe_vma_is_null(vma));
> > > -	trace_xe_vma_usm_invalidate(vma);
> > > +	trace_xe_vma_invalidate(vma);
> > >  
> > >  	/* Check that we don't race with page-table updates */
> > >  	if (IS_ENABLED(CONFIG_PROVE_LOCKING)) {
> > > @@ -3254,7 +3260,7 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
> > >  		}
> > >  	}
> > >  
> > > -	vma->usm.tile_invalidated = vma->tile_mask;
> > > +	vma->tile_invalidated = vma->tile_mask;
> > >  
> > >  	return 0;
> > >  }
> > > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> > > b/drivers/gpu/drm/xe/xe_vm_types.h
> > > index 79b5cab57711..ae5fb565f6bf 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > > @@ -84,11 +84,8 @@ struct xe_vma {
> > >  		struct work_struct destroy_work;
> > >  	};
> > >  
> > > -	/** @usm: unified shared memory state */
> > > -	struct {
> > > -		/** @tile_invalidated: VMA has been invalidated */
> > > -		u8 tile_invalidated;
> > > -	} usm;
> > > +	/** @tile_invalidated: VMA has been invalidated */
> > > +	u8 tile_invalidated;
> > 
> > Add a comment in the commit message about removing the usm struct?

Will add.

Matt

> > /Thomas
> > 
> > 
> > >  
> > >  	/** @tile_mask: Tile mask of where to create binding for
> > > this VMA */
> > >  	u8 tile_mask;
> > 
> 
