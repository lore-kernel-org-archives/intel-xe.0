Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B37A1C54E71
	for <intel-xe@archiver.kernel.org>; Fri, 22 Mar 2024 18:52:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76CB31123CC;
	Fri, 22 Mar 2024 18:52:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hm+LJzSN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBB7110E934
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Mar 2024 18:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711133576; x=1742669576;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=LttqQUPgGngu+kg1BvKrWqIGszmi+6qozlbxvqDYIyU=;
 b=hm+LJzSN08nxuHUFLV5Zuwl+bvfjEuf9vo4PS+aXvfn0CRVGbR4x5/IP
 L9EfAv9qjUYXS37wMFN+G9Lg3nHqM1tqjPTH+SUICUcjl+RddT0gemSy1
 7dLeJi5y8j6twVU+IvTfn87OMG5LTbgxlYsNjoOLztoKI09uaziJkvFec
 5FOBFmHj0mrsAxw/lcoPhFEhLY5gC+74Vr57HNRuRJCqrSmTfbI04dses
 4cvyagvb0b0+VA3/5vmKDPAtbIKz21vMEpf2IRSwzk5ADpzYCFP8EzpLa
 jyC1CBVuOPuVuwEvisItxhvBr1eC8SrltQ/KnGbK9SNCQZ1q8g7PcN6y7 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="28675044"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="28675044"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 11:52:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="14982128"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Mar 2024 11:52:55 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Mar 2024 11:52:54 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 22 Mar 2024 11:52:54 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 22 Mar 2024 11:52:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gqv/QkTIzz6iUGtTMGILn5WoNGvXkQIdtRasz5RX3wqvs/vdG8giTu5dZ7lC0noJrcAlf8cbA0eJSX54DPVYeeJxMua/MVb4beYtDkGLO279TUUMvqZbKH3zaBJ/7PyeFMmFmKlmSoY8IdB14xmH/ZRTpmxMIT8b3ZAo6Rvsu1QLN18LbZLG+DKTiAgXK57E8K8PuWXHA5rFJhSlRtU18+/q04sShNJwV9uNdN2UNQsaYDO18HZxTmi6gNR+mmtYTC6NLikD55HCtM9dLtpiUhjsQO9KvXbOLKVS4S/jb7pEGhKr1Ww7VIKr/AS19bhcCQlVfWBUUq8lC+PNpl8UIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3+NeyNOpReOsDRncycgdfByXu6F0NSJyjIFFnYDUjwM=;
 b=Vn5vht1CeOyp4WzDWXo2kg8N+uf9WOLSreZpy+BW0lCISS6WrvF0CMMtFiHyWDRknPT6RkISEg8yfffthy614CnQWSzgys9ZptDZKQprwF8jIDichwG2jc1KkZFSZn2oa1oWJpOtAYXQoaaWtpF5nUl9NwDSYmNIfrTlPfCStRdXbawB1LxJSBFbHh9oalCtdmhtKK4SJF/IUiMOYJn+2yIl0Vv/lp3tAxROP9wWJfZhBo1RrQGtouTWsfY3fSrgY0LY+Y3C3tak4Qq719DXu8J8jduIRC1a7vh88uyBRBj9IAfNMa/k5zqFpPItqlB/iGbWxUIF/4H/xX2DE7jswA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN2PR11MB4725.namprd11.prod.outlook.com (2603:10b6:208:263::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.24; Fri, 22 Mar
 2024 18:52:44 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7409.023; Fri, 22 Mar 2024
 18:52:44 +0000
Date: Fri, 22 Mar 2024 18:51:49 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Oded Gabbay <ogabbay@kernel.org>
Subject: Re: [PATCH v2 6/7] drm/xe/bo: Forward the decision to evict local
 objects during validation
Message-ID: <Zf3TRcMJiT14JCGe@DUT025-TGLU.fm.intel.com>
References: <20240322090213.6091-1-thomas.hellstrom@linux.intel.com>
 <20240322090213.6091-7-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240322090213.6091-7-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0298.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN2PR11MB4725:EE_
X-MS-Office365-Filtering-Correlation-Id: 8718e4e2-cfb9-4faa-7cdf-08dc4aa14281
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EozUQOowKzyDb/4mzPKOdp8JxoCwLedd8DKU/lYOnSKZrzLQmkCmMR4RV+IjG05P8ksX482beI1nTFwZtZxKGZGcT36o12CTH6Ld5RKUhsdYJov8rpHR8TjfKChjCsVQf5nIaEf9Y1LBQYnBcEB0oubFUZlCqMhoJYZFmGkuvnU9VawLokZSRrO9eU2EBP/b2PVh402bVTLg14upeRPRA2snfnAj5fDXRod0BDguc9xS9oe8SmQWKhaFHNiW05uRMykqtAygm30oX1Ckh16l528rijcconqTB+KIVql3tWV++2i/vk0Gax7t6xsg4MXSFGjNzmwvE6MaXAsTIR+KpYCTBid5Y4qYkJcwTTHOZtT79sxYlWqNfmWml6dXaD0igXpv/CR2ZKd6fBqtajDpjzNeO1mIoTdpg8Z8qony7+bI1gdFGsTrbcaR7nGYArssIbGpgO2DFLqtxcXOX8qKqMWw79Fz7gJlq30rFx9Pwk3C+gE1TaQGmqUSKWlK1AKZGuUSQw89yDlwdwtCdZmXA0yRLqSjCW0670LU1Pqg/Fu54fgJ5sqUhuB8vdXhST3bveHs03HHugKVS64U1BVj5oQNed01Ih7pueeFVDEm/iDY7k7EijhpW+zun47PbGR1eSnxd/ods0HjK19IxMbPEVbI6701em9b/Znx8A9juTI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?3EM7yH/MKOU7TrHBLdRS31l/xFDaTtdFh9bUGYourmKpLv4WZNjlTKzGfo?=
 =?iso-8859-1?Q?UVYSD+Q5R7x+RxNn9ZQ9ZZuW1SGVLav7hRgSVniDPPxoHbColXLHGzwLoK?=
 =?iso-8859-1?Q?31umPwZDKo1EMA+o5hVyZjtdoqO9WgNeEvQhZ1FXLqE1VYUwg51N5l5oVl?=
 =?iso-8859-1?Q?LGWdBc9O0lCJLlU8/auHzMc+Ph+DDUUyHTL2vpiW55NC5JwJO011Kba21t?=
 =?iso-8859-1?Q?87eoe08NdvpFTv9OsF2mDMNjHKsQ3naz9CxUDym17KVDSVYrAWA2FRss/h?=
 =?iso-8859-1?Q?cX8KQrgW8BM0+ZmXj6qCnBvsDFeoEnvP+Rvek9wgyOijxdAgs8fTkRfeV8?=
 =?iso-8859-1?Q?eNGxbsy0v14a2pVg+ERiQYywDNskyv6l+HJkdBXGOqXgALWRycqVQLw63j?=
 =?iso-8859-1?Q?KgjzLKptnDbwFnUZ0lwdFW5CO6m1oOIJvSbN6SgfLiUqNg+tLP+t0RPf/m?=
 =?iso-8859-1?Q?AthW3LSdYYxyF/o3rc9Mm4uBOA0VPlr2hYCPYNWZlxKPWhQ2v4VVZpPp7P?=
 =?iso-8859-1?Q?ZYXEnVJ+cXymewkw7egTGm1m3xTEmwbkWLZzQwXRPTlckP/5zASTWgSeKp?=
 =?iso-8859-1?Q?Prb7dUAt9CnMKI8ij0qqbbf+gmEWOYj+hERy6FLX3PkTyQgNla2XWO6pyt?=
 =?iso-8859-1?Q?fxjydpqLP1ogJpRlSZLrfDtpb7PVaxz+gGoCNZlhqlP0bogBjAR8gCuH1v?=
 =?iso-8859-1?Q?4SHK0z8bwlPCb8OhEVrCwiOIp4yeNMqN/yoBmxTUmijOiJIHjkOj1XQran?=
 =?iso-8859-1?Q?8z9wumwUKMayrD/5Ymqw5lYKpe2xAddJovK3MBdLtnBNkpGoWLKSjgsIQN?=
 =?iso-8859-1?Q?IyuSAPF7RFJvVmm6IZvBWPDZeY+9+rcXxOuweh1gAabV6t0lG66DOT0+UX?=
 =?iso-8859-1?Q?NXjV9DZ1l8ew9DySldCjdPCqEHQbrjJc60SQdRJHSg443o/1/HraTrI1Gr?=
 =?iso-8859-1?Q?C6z+jdvPmY1wi48bsue/h4Bffvwjt0rf+WU5RtsOUZRySdp5GhjyAnZFnG?=
 =?iso-8859-1?Q?UuMUo9CqXZbIqH+sxycK6FXIvMWny/gp3dUMgyKVYmChJ4h/Rz8dbDQm3S?=
 =?iso-8859-1?Q?hw9VL45jZEDx7cF6h2KSy5srH5Hp9oBJCThFvkrw6Qnjmb9U1Y3Do+lh38?=
 =?iso-8859-1?Q?N0jsfVmSiXOOsWObfpJ7N4K4XLp7daFJrnfCDeDtXME6NuSJB5RVoeBojO?=
 =?iso-8859-1?Q?urnIn5q/7ctjaXELSGQU0Qu9DaCx8OEp45i/tP/+6tS6mJBPKmq4Y7VS/6?=
 =?iso-8859-1?Q?WIrEv26xzOmsU1Mj1uC9Fwl1JzTb+Ox7D5ZI5obQT3lAQlm+A33pTnlnGl?=
 =?iso-8859-1?Q?b/TOsraFQIVuPAF4+Wewb1vurVQEWf6DAt7NczALazwU5qbyFQrhYx6Zwb?=
 =?iso-8859-1?Q?IP+uOmD7Jc3Fcahbo85ytKpNUrfb33lHhis88jKFBbL815hi18/HOpld/w?=
 =?iso-8859-1?Q?HohP8ESoxE98+rZbE4kSqY644EoWmCMSD3f88eioqsQT9//ofO0+j61sQl?=
 =?iso-8859-1?Q?0xOzT+1uQVb0l2wd41umL1WFc5wbHuiK3mZ31yp3lobzvobOJGWSnQLiz9?=
 =?iso-8859-1?Q?MuQ7aNUno3aNek8MTmQaqMid+Vu4EzVAvHe1y+vZ7DzV9Z5pRk2hUm6WJR?=
 =?iso-8859-1?Q?CidTgBCSBMlVUeafRMuqxTrL4S6CvEsEhirhOAFBnxtt9Vjoaxk/zn4Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8718e4e2-cfb9-4faa-7cdf-08dc4aa14281
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2024 18:52:44.7126 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NYzPK33s3vUbFSn3WXf1RkNss4toKZQdxi2TPn7oj7b8K9q9ELa2gXNGhghjAjEfNWqPXLZLT1YmXKiLIrNIWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4725
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

On Fri, Mar 22, 2024 at 10:02:12AM +0100, Thomas Hellström wrote:
> Currently we refuse evicting the VM's local objects. However that
> is necessary for some objects. Most notably completely unbound objects.
> Forward this decision to be per-object based in the TTM
> eviction_valuable() callback.
> 
> v2:
> - Rebase.
> 
> Fixes: 24f947d58fe5 ("drm/xe: Use DRM GPUVM helpers for external- and evicted objects")
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Oded Gabbay <ogabbay@kernel.org>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/display/xe_fb_pin.c |  2 +-
>  drivers/gpu/drm/xe/tests/xe_bo.c       |  6 ++---
>  drivers/gpu/drm/xe/tests/xe_dma_buf.c  |  4 +--
>  drivers/gpu/drm/xe/tests/xe_migrate.c  |  2 +-
>  drivers/gpu/drm/xe/xe_bo.c             | 36 ++++++++++++++++++--------
>  drivers/gpu/drm/xe/xe_bo.h             |  2 +-
>  drivers/gpu/drm/xe/xe_dma_buf.c        |  2 +-
>  drivers/gpu/drm/xe/xe_exec.c           |  1 +
>  drivers/gpu/drm/xe/xe_ggtt.c           |  2 +-
>  drivers/gpu/drm/xe/xe_gt_pagefault.c   |  2 +-
>  drivers/gpu/drm/xe/xe_vm.c             | 16 ++++++++----
>  drivers/gpu/drm/xe/xe_vm_types.h       | 10 +++++++
>  12 files changed, 58 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> index 2a50a7eaaa31..1bf50f694110 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -288,7 +288,7 @@ static struct i915_vma *__xe_pin_fb_vma(struct intel_framebuffer *fb,
>  	if (IS_DGFX(xe))
>  		ret = xe_bo_migrate(bo, XE_PL_VRAM0);
>  	else
> -		ret = xe_bo_validate(bo, NULL, true);
> +		ret = xe_bo_validate(bo, bo->vm);
>  	if (!ret)
>  		ttm_bo_pin(&bo->ttm);
>  	ttm_bo_unreserve(&bo->ttm);
> diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
> index 0926a1c2eb86..5410cb1780a6 100644
> --- a/drivers/gpu/drm/xe/tests/xe_bo.c
> +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
> @@ -28,7 +28,7 @@ static int ccs_test_migrate(struct xe_tile *tile, struct xe_bo *bo,
>  	u32 offset;
>  
>  	/* Move bo to VRAM if not already there. */
> -	ret = xe_bo_validate(bo, NULL, false);
> +	ret = xe_bo_validate(bo, NULL);
>  	if (ret) {
>  		KUNIT_FAIL(test, "Failed to validate bo.\n");
>  		return ret;
> @@ -274,7 +274,7 @@ static int evict_test_run_tile(struct xe_device *xe, struct xe_tile *tile, struc
>  		if (i) {
>  			down_read(&vm->lock);
>  			xe_vm_lock(vm, false);
> -			err = xe_bo_validate(bo, bo->vm, false);
> +			err = xe_bo_validate(bo, bo->vm);
>  			xe_vm_unlock(vm);
>  			up_read(&vm->lock);
>  			if (err) {
> @@ -283,7 +283,7 @@ static int evict_test_run_tile(struct xe_device *xe, struct xe_tile *tile, struc
>  				goto cleanup_all;
>  			}
>  			xe_bo_lock(external, false);
> -			err = xe_bo_validate(external, NULL, false);
> +			err = xe_bo_validate(external, NULL);
>  			xe_bo_unlock(external);
>  			if (err) {
>  				KUNIT_FAIL(test, "external bo valid err=%pe\n",
> diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> index 9f6d571d7fa9..37bcf812f3ca 100644
> --- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> @@ -80,7 +80,7 @@ static void check_residency(struct kunit *test, struct xe_bo *exported,
>  	}
>  
>  	/* Re-validate the importer. This should move also exporter in. */
> -	ret = xe_bo_validate(imported, NULL, false);
> +	ret = xe_bo_validate(imported, NULL);
>  	if (ret) {
>  		if (ret != -EINTR && ret != -ERESTARTSYS)
>  			KUNIT_FAIL(test, "Validating importer failed with err=%d.\n",
> @@ -156,7 +156,7 @@ static void xe_test_dmabuf_import_same_driver(struct xe_device *xe)
>  
>  			/* Is everything where we expect it to be? */
>  			xe_bo_lock(import_bo, false);
> -			err = xe_bo_validate(import_bo, NULL, false);
> +			err = xe_bo_validate(import_bo, NULL);
>  
>  			/* Pinning in VRAM is not allowed. */
>  			if (!is_dynamic(params) &&
> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
> index ce531498f57f..97735a3c66ab 100644
> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
> @@ -120,7 +120,7 @@ static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
>  		return;
>  	}
>  
> -	err = xe_bo_validate(remote, NULL, false);
> +	err = xe_bo_validate(remote, NULL);
>  	if (err) {
>  		KUNIT_FAIL(test, "Failed to validate system bo for %s: %li\n",
>  			   str, err);
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 9298546909b5..db4cd1da8ef3 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1019,6 +1019,23 @@ static void xe_ttm_bo_delete_mem_notify(struct ttm_buffer_object *ttm_bo)
>  	}
>  }
>  
> +static bool xe_bo_eviction_valuable(struct ttm_buffer_object *ttm_bo,
> +				    const struct ttm_place *place)
> +{
> +	if (xe_bo_is_xe_bo(ttm_bo)) {
> +		struct xe_bo *xe_bo = ttm_to_xe_bo(ttm_bo);
> +		struct xe_vm *vm = xe_bo->vm;
> +
> +		if (vm && !drm_gpuvm_is_extobj(&vm->gpuvm, &ttm_bo->base) &&
> +		    vm->is_validating) {

To make sure I understand this correct, let's say we have 2 VMs A, B are
trying to validate at the same time.

This function is running in A's context. If A is attempting to evict a
B's private object here it already has B's VM dma-resv lock thus
vm->is_validating will be false so it is free to evict it?

With that, couldn't the lockdep be moved out of this if statement and
above...

struct xe_vm *vm = xe_bo->vm;

if (vm)
	xe_vm_assert_held(vm);

That would make a bit more clear to me.

Assuming my reasoning is correct and with lockdep moved:
Reviewed-by: Matthew Brost <matthew.brost@intel.com> 

> +			xe_vm_assert_held(vm);
> +			return false;
> +		}
> +	}
> +
> +	return ttm_bo_eviction_valuable(ttm_bo, place);
> +}
> +
>  const struct ttm_device_funcs xe_ttm_funcs = {
>  	.ttm_tt_create = xe_ttm_tt_create,
>  	.ttm_tt_populate = xe_ttm_tt_populate,
> @@ -1029,7 +1046,7 @@ const struct ttm_device_funcs xe_ttm_funcs = {
>  	.io_mem_reserve = xe_ttm_io_mem_reserve,
>  	.io_mem_pfn = xe_ttm_io_mem_pfn,
>  	.release_notify = xe_ttm_bo_release_notify,
> -	.eviction_valuable = ttm_bo_eviction_valuable,
> +	.eviction_valuable = xe_bo_eviction_valuable,
>  	.delete_mem_notify = xe_ttm_bo_delete_mem_notify,
>  };
>  
> @@ -1631,7 +1648,7 @@ int xe_bo_pin_external(struct xe_bo *bo)
>  	xe_assert(xe, xe_bo_is_user(bo));
>  
>  	if (!xe_bo_is_pinned(bo)) {
> -		err = xe_bo_validate(bo, NULL, false);
> +		err = xe_bo_validate(bo, NULL);
>  		if (err)
>  			return err;
>  
> @@ -1675,7 +1692,7 @@ int xe_bo_pin(struct xe_bo *bo)
>  	/* We only expect at most 1 pin */
>  	xe_assert(xe, !xe_bo_is_pinned(bo));
>  
> -	err = xe_bo_validate(bo, NULL, false);
> +	err = xe_bo_validate(bo, bo->vm);
>  	if (err)
>  		return err;
>  
> @@ -1772,19 +1789,17 @@ void xe_bo_unpin(struct xe_bo *bo)
>   * xe_bo_validate() - Make sure the bo is in an allowed placement
>   * @bo: The bo,
>   * @vm: Pointer to a the vm the bo shares a locked dma_resv object with, or
> - *      NULL. Used together with @allow_res_evict.
> - * @allow_res_evict: Whether it's allowed to evict bos sharing @vm's
> - *                   reservation object.
> + *      NULL.
>   *
>   * Make sure the bo is in allowed placement, migrating it if necessary. If
>   * needed, other bos will be evicted. If bos selected for eviction shares
> - * the @vm's reservation object, they can be evicted iff @allow_res_evict is
> - * set to true, otherwise they will be bypassed.
> + * the @vm's reservation object, they can be evicted if the
> + * xe_bo_eviction_valuable() function allows it.
>   *
>   * Return: 0 on success, negative error code on failure. May return
>   * -EINTR or -ERESTARTSYS if internal waits are interrupted by a signal.
>   */
> -int xe_bo_validate(struct xe_bo *bo, struct xe_vm *vm, bool allow_res_evict)
> +int xe_bo_validate(struct xe_bo *bo, struct xe_vm *vm)
>  {
>  	struct ttm_operation_ctx ctx = {
>  		.interruptible = true,
> @@ -1792,10 +1807,9 @@ int xe_bo_validate(struct xe_bo *bo, struct xe_vm *vm, bool allow_res_evict)
>  	};
>  
>  	if (vm) {
> -		lockdep_assert_held(&vm->lock);
>  		xe_vm_assert_held(vm);
>  
> -		ctx.allow_res_evict = allow_res_evict;
> +		ctx.allow_res_evict = true;
>  		ctx.resv = xe_vm_resv(vm);
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 52e441f77e96..18776a70c843 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -193,7 +193,7 @@ int xe_bo_pin_external(struct xe_bo *bo);
>  int xe_bo_pin(struct xe_bo *bo);
>  void xe_bo_unpin_external(struct xe_bo *bo);
>  void xe_bo_unpin(struct xe_bo *bo);
> -int xe_bo_validate(struct xe_bo *bo, struct xe_vm *vm, bool allow_res_evict);
> +int xe_bo_validate(struct xe_bo *bo, struct xe_vm *vm);
>  
>  static inline bool xe_bo_is_pinned(struct xe_bo *bo)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
> index 5b26af21e029..f1dc2bc5179b 100644
> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> @@ -102,7 +102,7 @@ static struct sg_table *xe_dma_buf_map(struct dma_buf_attachment *attach,
>  		if (!attach->peer2peer)
>  			r = xe_bo_migrate(bo, XE_PL_TT);
>  		else
> -			r = xe_bo_validate(bo, NULL, false);
> +			r = xe_bo_validate(bo, NULL);
>  		if (r)
>  			return ERR_PTR(r);
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index f442ef495235..59092159f4d3 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -313,6 +313,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	if (err)
>  		xe_sched_job_put(job);
>  err_exec:
> +	vm->is_validating = false;
>  	drm_exec_fini(exec);
>  err_unlock_list:
>  	up_read(&vm->lock);
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index f54523d7d03c..312dbfcf9de5 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -406,7 +406,7 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
>  		return 0;
>  	}
>  
> -	err = xe_bo_validate(bo, NULL, false);
> +	err = xe_bo_validate(bo, bo->vm);
>  	if (err)
>  		return err;
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index fa9e9853c53b..090f38848b23 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -118,7 +118,7 @@ static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
>  			return err;
>  	} else if (bo) {
>  		/* Create backing store if needed */
> -		err = xe_bo_validate(bo, vm, true);
> +		err = xe_bo_validate(bo, vm);
>  		if (err)
>  			return err;
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index b1d0df178a2d..6629900b2cf5 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -474,7 +474,7 @@ static int xe_gpuvm_validate(struct drm_gpuvm_bo *vm_bo, struct drm_exec *exec)
>  		list_move_tail(&gpuva_to_vma(gpuva)->combined_links.rebind,
>  			       &vm->rebind_list);
>  
> -	ret = xe_bo_validate(gem_to_xe_bo(vm_bo->obj), vm, false);
> +	ret = xe_bo_validate(gem_to_xe_bo(vm_bo->obj), vm);
>  	if (ret)
>  		return ret;
>  
> @@ -504,23 +504,28 @@ int xe_vm_validate_rebind(struct xe_vm *vm, struct drm_exec *exec,
>  	unsigned long index;
>  	int ret;
>  
> +	vm->is_validating = true;
>  	do {
>  		ret = drm_gpuvm_validate(&vm->gpuvm, exec);
>  		if (ret)
> -			return ret;
> +			goto out;
>  
>  		ret = xe_vm_rebind(vm, false);
>  		if (ret)
> -			return ret;
> +			goto out;
>  	} while (!list_empty(&vm->gpuvm.evict.list));
>  
>  	drm_exec_for_each_locked_object(exec, index, obj) {
>  		ret = dma_resv_reserve_fences(obj->resv, num_fences);
>  		if (ret)
> -			return ret;
> +			goto out;
>  	}
>  
>  	return 0;
> +
> +out:
> +	vm->is_validating = false;
> +	return ret;
>  }
>  
>  static int xe_preempt_work_begin(struct drm_exec *exec, struct xe_vm *vm,
> @@ -640,6 +645,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
>  	up_read(&vm->userptr.notifier_lock);
>  
>  out_unlock:
> +	vm->is_validating = false;
>  	drm_exec_fini(&exec);
>  out_unlock_outer:
>  	if (err == -EAGAIN) {
> @@ -1875,7 +1881,7 @@ static int xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma, struct xe_exec_queue
>  	xe_bo_assert_held(bo);
>  
>  	if (bo && immediate) {
> -		err = xe_bo_validate(bo, vm, true);
> +		err = xe_bo_validate(bo, vm);
>  		if (err)
>  			return err;
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index badf3945083d..0d286da148c0 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -268,6 +268,16 @@ struct xe_vm {
>  	u64 tlb_flush_seqno;
>  	/** @batch_invalidate_tlb: Always invalidate TLB before batch start */
>  	bool batch_invalidate_tlb;
> +
> +	/**
> +	 * @is_validaing: Whether we are validating the vm's local objects.
> +	 * This field is protected by the vm's resv. Note that this
> +	 * is needed only since TTM doesn't forward the ttm_operation_ctx to the
> +	 * eviction_valuable() callback, so if / when that is in place, this
> +	 * should be removed.
> +	 */
> +	bool is_validating;
> +
>  	/** @xef: XE file handle for tracking this VM's drm client */
>  	struct xe_file *xef;
>  };
> -- 
> 2.44.0
> 
