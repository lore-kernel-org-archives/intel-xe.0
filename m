Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAA77C07CB1
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 20:41:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92AA510E678;
	Wed, 29 Nov 2023 20:41:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55C0E10E678
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 20:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701290500; x=1732826500;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=C6MzfV24OiFRp5KzoSkZ2ooRujHWK8nWtVBvwOu0h2s=;
 b=Aubn2D9e9/rgl9UoEhEJLPpXUtkpwrioTe3NWzAh5aSY0klgCaaHtTPF
 akpwmI3uCV9aoxrnGPZfYQPLIqCECNOf42ZzqdpWYAnPoKL11kPZEUBQ8
 /mc7ruK3OZOalMqJLS1XH0qcjcDY2VmjVqA+8GJaa7DddQRQ39AjeVEsy
 tkflggAl41GNRiiuWsKV+Xb7hQSrC56MTPsEJWVyUc8EHMKTq8uIaVeCx
 SvF6XTPpdkFj7DmGQDnVhJXV9jt1iBx+GQbHzLkpWuBpzCVPyqw5+m3hO
 TdY+z2Xnz/zCnxClaIEHGxHI9IrQEYXHYMdYynwOs+rNSZ6WAaN/ll3yC g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="6494684"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="6494684"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 12:41:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="886992542"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="886992542"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 12:41:39 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 12:41:39 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 12:41:38 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 12:41:38 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 12:41:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FLALr1nKNJ0o4TSyN4c7iLFAgQd5cyaIytl9aE6UmzEr/nyBDJtWUdJy24jpQ6+aegjkw3NLkBl2JXH8x7eAUruYtglj5FcDYXOuGGGzi3af0VEtcQYW/PuNVINpRrRKHEraTLqzvBH43IjiGzao5t9somgVtRIcRqxArNmnHv7TI46LhlJ4ySvw7t/aLRTrkC2wnFJgLbTUmYzjsaqu10XY9t52hp3VyEXGtgx2qURmIn0nAluwZXmTIuR5PMg/AQuPwM/LUQCkYMT9tS9Xg+VSjWoTJvq94/KUGZs+jqPUgREnm7d0IAHXmaGj1NgtqYNHBqNRk0xB7HqHqYtZlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cNH1vxsRFqMlaQyFgzBEAMLTRKF/ibpC9+qbAw3BPpw=;
 b=Xsj47q/16+XtmLB+u5EQuHOJS2YRfy36aA+U1bTEjNRb/DdO1H0PU9HP5atY+sRF9m/9QUh8HtZKEw7QpC/c70epyypkBC2zJA2mYxuvHgdI73fpanpyjZtZPbO1IkBgdFV8CC2A4qMCubaPpf8mlpVJSZnG9Fh7YWfE90CK/JQA/j/1C6hcaDAOiGjoHu36yKAm0xnNCkPxliJ+jo+9hWFOz4u4VYYI/4QPyz5SIttqCDCii7bwOjD0ZXGNWgid7fkhXR4gGs62YP7w27MvD1D/38zy679w08A0I6CKMo36TKsNfLb/Wtbfl5+DqHnPxDPtViDJn63slgNA6H5ZQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ2PR11MB8404.namprd11.prod.outlook.com (2603:10b6:a03:53f::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Wed, 29 Nov
 2023 20:41:36 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7046.023; Wed, 29 Nov 2023
 20:41:36 +0000
Date: Wed, 29 Nov 2023 15:41:32 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Welty, Brian" <brian.welty@intel.com>
Message-ID: <ZWeh_OpTGsNaWRAu@intel.com>
References: <20231122143833.7-1-francois.dugast@intel.com>
 <20231122143833.7-3-francois.dugast@intel.com>
 <f8d95d48-74f9-44f4-8eac-ff4d925f51fe@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f8d95d48-74f9-44f4-8eac-ff4d925f51fe@intel.com>
X-ClientProxiedBy: BYAPR11CA0046.namprd11.prod.outlook.com
 (2603:10b6:a03:80::23) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ2PR11MB8404:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e353a4c-e435-4d5c-ad10-08dbf11b9479
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0a5ykv3NIqgCKwKhYhRkmIxuJ1/cPTt1WBMHtVsjRbEiysx5PHaYM/aGUuJnd8NwukIKajvq8dMj0It3+fgWPmsVhnk7TjGSzb8/Vny1s/EWk8lJ2ZtXVxlayQyWiNPW/StT1T2gghaLC2w/Iwhw6nYGFT3yacdhImlvDw9tMTMqAaRAZZAryFK9m80NOlQ/wzehpNeG72raZPv8Ykyou3PQ/7jch/8NRCT63wVdGqAteJSeP6vnjv5Z35YStUMJuo83csM6Os6aseRcb/tfbfGPcMHpbpXPvwqSj1IWG///3VluH3ba9OXBhPqysH6EbwOoFBVbt9mxO6VmqQt2plsW4RcRAIQtegTXQhJNJ/gMxXiMHfKw6pWhnzgFQn9236VvFpsOUisflbvj+RFkX5gfVp0R5Z8BdyZ2DAkSE3p4I3VUBTXGYgkxdiPGeh0jTT/dxEBX1feXVIXt/04JJYN3gcO4ZkQoVf65+7rvG2bFNv8nsoI0Bn8ZNwphiQuHfvlzAMC6Zppmj84MBZhqWn8b2ibH2rF+iEIfCd31XdQYohO7OChz/oLUPMgjY4ySzPhK8jkJ7AKMXzxay9loeuRt8h6p4+mHjE2IqoIjndrTx0dz3IMWIm1VBBO18I+7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(136003)(39860400002)(346002)(376002)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(6666004)(8936002)(6862004)(4326008)(8676002)(6512007)(53546011)(6506007)(316002)(66946007)(66556008)(66476007)(37006003)(6636002)(6486002)(478600001)(202311291699003)(26005)(86362001)(36756003)(41300700001)(38100700002)(44832011)(2616005)(2906002)(5660300002)(83380400001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wISMDJz2R5zh4aCNDM9/pgPdZ5BNxT5slq8ELskWLysq/4ODzpnGHJ2wynmt?=
 =?us-ascii?Q?Dx1YaIu8GwH2avosjEXEDNqcBEdx+Sje9wYDLYH5QA0cCihJGJhlawK/w+Y9?=
 =?us-ascii?Q?Vysar82akIFtxyuLLlztAZpAbNfnklw3qbsbrabb2UsmUKjRU0B/I5c7BHCQ?=
 =?us-ascii?Q?4tTo7hR6ktH55EbU16G26IoVedX9x/dct6WoNHr5d1ThPJJ2CoR/dzTNvOTh?=
 =?us-ascii?Q?kcqZUuBmViDEywT7dRgpmHt2L5+Zcgb9GKgJzv4xABAwNrHhIuzWPbZFFT2v?=
 =?us-ascii?Q?CHLVXPJ6x0S3izhMyCzKnRMCS6ZVPuGVKsYSiBykscprY6esimUhEqiau5gI?=
 =?us-ascii?Q?Rvf1OV1I0VbuxFndra7Gy3oZ4mFF804E3OcO68yT6UOffcAG4Qizfuf8/cl9?=
 =?us-ascii?Q?xqdesm32i7kYNcClujDzeqLVfGGRnJKsPNaDkVk5kcmtrDCGQsh4vEt244dj?=
 =?us-ascii?Q?QoJYX1iYlqO8/ZQ6Btj1Jm6cJ9h6ZbGhYUK/7h0iTCbnNg6Vj6FjCH2B8lI8?=
 =?us-ascii?Q?+9NtoqF/s1zoQCjdVK/gnDDIktGZtx5Uq8y92uheLg9p4Gflcb6ISbVJ2NTy?=
 =?us-ascii?Q?F/L+SC0ejIRWvSIu+V0Hx/wlR9+xvVvycgkbkuPCcgE5MH1MZnAsBTcBKwit?=
 =?us-ascii?Q?SiodTYxCEmk7mzCHRYqLztLV1C1WaO5O+WCk705sq4F53hcleOX+QGUTJ4JO?=
 =?us-ascii?Q?e8Sdat4w25SfulwUrZHBCOb17LR1qP1nbg/jq//xgPIaTUBmLFhsgj3sGCt3?=
 =?us-ascii?Q?TEYU4ddd/hkVy2vdouqRwDT9KmWmyxAR5kIAUzwde0PAZEiTLUdTQr6br7D2?=
 =?us-ascii?Q?NBIxAmGpzFIfzYDHUgDyAy5vN2Cl7vhknZAQmt1ufjVfCAIitVeglqJm2TH3?=
 =?us-ascii?Q?v1/DlqS5EpofiigLCaRivaUzv9qk41A6zjX4S3Txz35b4En2LDPFuMuNq73n?=
 =?us-ascii?Q?YPx8snAWlw/myRgKoU7mvEjjm9rFZfDAkF05AT5MZsKu8KO3fsGzn0sC6yyc?=
 =?us-ascii?Q?VlV0LFAsGnrO1aJg7m7IFQpuk4fLpwyHtA/6HIyAfKwWpUTsGz9o3tP+8RrP?=
 =?us-ascii?Q?jpjwPUDbCXim2eroVpAnDjRvcBmzr+fdWOAf42h+y34kX9AfyWPGfjYbhPog?=
 =?us-ascii?Q?YtwESHHLZxtxppQzGmoMF6+ph+WrhJQfcHjKsS522ow0OVpZkl61DCrqS6Ss?=
 =?us-ascii?Q?fxHvoSX9IKj8jG0eIcg39fw9i3ret0nyFJrs2UrIwOzpAXBtoJxaPyiQ4rbX?=
 =?us-ascii?Q?YSBhWb2n5pDcbsciX2w7YqZUSQfLwXKDGBCpUtC0f2brZilUw6f6N90ZnEGW?=
 =?us-ascii?Q?2yyB2PKlo1uaAlPchnH7aB1eioFcZR7z3DEVs+q4llEsbXTj4+c6D1+cMD58?=
 =?us-ascii?Q?Gbz0S0hKjVnjwKDP8H3LVKXj4i6e8nSCwvWdJBF2koMevGicS10O59Hj+B/F?=
 =?us-ascii?Q?HmGFuqqqFIxraQBzh+rl1cwyfFJUyxRos/erPZ1S5SLmyWpZF4pAoXfvgZjh?=
 =?us-ascii?Q?eDz+lLinaKKYiYnYmlQi+vHMKoaCfpCrUNpEExrL8mpgKJCsCpXHGkoB9GM+?=
 =?us-ascii?Q?nsqzLfX5Rn415j1rzb/MtpVx1dfCf4PJjS4plVDQ55r9Dow52P1Xg9Dzna0r?=
 =?us-ascii?Q?yw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e353a4c-e435-4d5c-ad10-08dbf11b9479
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 20:41:36.3580 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4CoBbGcurIZNZtvWDizd7ThppGvFgwInnkfmq4oa9PytGRpY+ri293tqPuLLUd2FLxSZabz/lDnQx/xOvof3Ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8404
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 02/14] drm/xe/uapi: Separate bo_create
 placement from flags
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
Cc: Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Nov 29, 2023 at 11:36:03AM -0800, Welty, Brian wrote:
> 
> 
> On 11/22/2023 6:38 AM, Francois Dugast wrote:
> > From: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > 
> > Although the flags are about the creation, the memory placement
> > of the BO deserves a proper dedicated field in the uapi.
> > 
> > Besides getting more clear, it also allows to remove the
> > 'magic' shifts from the flags that was a concern during the
> > uapi reviews.
> > 
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_bo.c | 15 +++++++--------
> >   include/uapi/drm/xe_drm.h  | 12 ++++++------
> >   2 files changed, 13 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index 4305f5cbc2ab..bbce4cd80f7e 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -1799,19 +1799,18 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
> >   	u32 handle;
> >   	int err;
> > -	if (XE_IOCTL_DBG(xe, args->extensions) || XE_IOCTL_DBG(xe, args->pad) ||
> > +	if (XE_IOCTL_DBG(xe, args->extensions) ||
> >   	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
> >   		return -EINVAL;
> > +	/* at least one valid memory placement must be specified */
> > +	if (XE_IOCTL_DBG(xe, !(args->placement & xe->info.mem_region_mask)))
> > +		return -EINVAL;
> 
> I think you are missing to test that args->placement is *only* a mask of
> regions.   Looks like you allow other bits to be included and those will
> get slammed into bo_flags below.

now that they are split I don't believe that they would get slammed below,
but anyway, good catch, you are absolutely right that we should check
for the real valid bits in a better way, like the one you proposed below.

> 
> Probably:
> 
>   if (XE_IOCTL_DBG(xe, (args->placement & ~xe->info.mem_region_mask) ||
> !args->placement))
>      return -EINVAL;

Thank you!

> 
> 
> -Brian
> 
> 
> > +
> >   	if (XE_IOCTL_DBG(xe, args->flags &
> >   			 ~(DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING |
> >   			   DRM_XE_GEM_CREATE_FLAG_SCANOUT |
> > -			   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM |
> > -			   xe->info.mem_region_mask)))
> > -		return -EINVAL;
> > -
> > -	/* at least one memory type must be specified */
> > -	if (XE_IOCTL_DBG(xe, !(args->flags & xe->info.mem_region_mask)))
> > +			   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM)))
> >   		return -EINVAL;
> >   	if (XE_IOCTL_DBG(xe, args->handle))
> > @@ -1832,7 +1831,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
> >   	if (args->flags & DRM_XE_GEM_CREATE_FLAG_SCANOUT)
> >   		bo_flags |= XE_BO_SCANOUT_BIT;
> > -	bo_flags |= args->flags << (ffs(XE_BO_CREATE_SYSTEM_BIT) - 1);
> > +	bo_flags |= args->placement << (ffs(XE_BO_CREATE_SYSTEM_BIT) - 1);
> >   	if (args->flags & DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM) {
> >   		if (XE_IOCTL_DBG(xe, !(bo_flags & XE_BO_CREATE_VRAM_MASK)))
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index b0d13bc6d9cf..1bdd20d3c4a8 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -500,8 +500,11 @@ struct drm_xe_gem_create {
> >   	 */
> >   	__u64 size;
> > -#define DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING		(0x1 << 24)
> > -#define DRM_XE_GEM_CREATE_FLAG_SCANOUT			(0x1 << 25)
> > +	/** @placement: A mask of memory instances of where BO can be placed. */
> > +	__u32 placement;
> > +
> > +#define DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING		(1 << 0)
> > +#define DRM_XE_GEM_CREATE_FLAG_SCANOUT			(1 << 1)
> >   /*
> >    * When using VRAM as a possible placement, ensure that the corresponding VRAM
> >    * allocation will always use the CPU accessible part of VRAM. This is important
> > @@ -517,7 +520,7 @@ struct drm_xe_gem_create {
> >    * display surfaces, therefore the kernel requires setting this flag for such
> >    * objects, otherwise an error is thrown on small-bar systems.
> >    */
> > -#define DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM	(0x1 << 26)
> > +#define DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM	(1 << 2)
> >   	/**
> >   	 * @flags: Flags, currently a mask of memory instances of where BO can
> >   	 * be placed
> > @@ -541,9 +544,6 @@ struct drm_xe_gem_create {
> >   	 */
> >   	__u32 handle;
> > -	/** @pad: MBZ */
> > -	__u32 pad;
> > -
> >   	/** @reserved: Reserved */
> >   	__u64 reserved[2];
> >   };
