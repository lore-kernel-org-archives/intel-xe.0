Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F563CD11C2
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 21:58:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1228910E9F7;
	Wed, 10 Apr 2024 21:58:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E5zWTtSv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D7DA10E9F7
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Apr 2024 21:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712786287; x=1744322287;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mXrn3IaxCpa9fVp2L0f/O3LASukZlCzE1LeJnrWpbz0=;
 b=E5zWTtSvHdQ7H0l2tP2PFCy8oaHw4DlT2Mawv0pwRuXZEfTW9VWmsL4k
 pzT0mrtYZH28oIZx5q3ntp+893Ea1hEiZvHtLyVDISBvdOJ26/qjRvak7
 ZK+QafgqowN5Z/qDOADB8+AzEgiMNIFP3P5BA1uyB4O1x7cHau1ocrZYX
 bdoAMhBOig8Tsg6oRW/gfFPznnblzJykI8SsvtucY2Wx7ymD61rcdxtZ8
 S87fgy34/L06cpL4LJo7x9YiSLAFVYXECusqxnTuD4JEXUAouE/h1Il+a
 B8e19xltMGQueB40/U5S86BHPuurTtlmnscx9X3ABFmkuvzyJs98NO05e w==;
X-CSE-ConnectionGUID: 9wl7MhhpTH+heCQW+L+LjQ==
X-CSE-MsgGUID: E/GkevgWTvyLR1rkpMgaxg==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8030626"
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; 
   d="scan'208";a="8030626"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 14:58:07 -0700
X-CSE-ConnectionGUID: eUorNZZHTJix0f5eJ9+8Lw==
X-CSE-MsgGUID: 0SePOj3jT32EdTidNhdJaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; d="scan'208";a="43982287"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Apr 2024 14:58:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Apr 2024 14:58:05 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 10 Apr 2024 14:58:05 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 10 Apr 2024 14:58:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JGoVD4XuvBxRL7+wrvUSSdvrFr8BgSy1m3pqYDqmYmQyfGnCy6TH2BrlVwmnYONxa2HMc6wui5o8++mW7qekSP55d8+IuAjyn/sMDr8d1b72WZlLbq4JIKa6zhJA7x4zuK5wld11MynvkcdWgLwShUM0jsL0GVDxrVgg67BZURt6Zn8ya45TMnLVL4m/yK7+CzF2kN8zCF482ojclG3YFIOilVN0TcFt+gE7UklW4IkLz6iCIn5roSgNXbohVrVk4a2NzWkoA+lC7wXWKBoDr4Ciu0XTy8xcxhTAT4/5fawg2d8V3U3Njq0T8ioldmWE4zwOU7w9eR6kkZOTyqzJ1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=et48jqmOYRXQiGNFat/vCtZax7tK0V/B60Tn3WUsHyg=;
 b=VnITxA6k8jvrrKUIvJl+uKJXufpFDR5m3yZV00JjDZ2P9JBhkKC+m8Ynn2cO5+unCt/oUj3Dh/d1BGwvymEsr0IAudqANhIdozfxi5FMsfhMHTUuD+6oNlgiw8AzU5Co17DVW7QMyNCnmwI38dEQ3xE4cWTIuO1Ch97VDmM/JQDT7F9hAIqR7TkRs4KGhl60d1TfQ5SU5zcz+RR3DPOXmT+JG0KmLLF3pOlvin+E5nkXz42mj6+zaRI9sUTxoLeVr7I9S+Is/u4GofxNAlS6fevRhzlVI0m4kD7GwkzCKr/EP3zm+XJccmo01L7WoubpZ9fDXPlrriLRqx2+3JCdmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB5888.namprd11.prod.outlook.com (2603:10b6:510:137::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Wed, 10 Apr
 2024 21:58:04 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7452.019; Wed, 10 Apr 2024
 21:58:04 +0000
Date: Wed, 10 Apr 2024 21:56:57 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Oak Zeng <oak.zeng@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <krishnaiah.bommu@intel.com>, <Thomas.Hellstrom@linux.intel.com>,
 <brian.welty@intel.com>
Subject: Re: [v2 19/31] drm/xe/svm: Determine a vma is backed by device memory
Message-ID: <ZhcLKQo+WJ3TUoqS@DUT025-TGLU.fm.intel.com>
References: <20240409201742.3042626-1-oak.zeng@intel.com>
 <20240409201742.3042626-20-oak.zeng@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240409201742.3042626-20-oak.zeng@intel.com>
X-ClientProxiedBy: BY3PR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:a03:254::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB5888:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E56ICBfRl0HKOWJ3ekx3PCpmd2hnXcFXaoChSMd/rFOews5Xjwvy95SPIHiodfeBblmnlHlJgcJVcxQeGUXHHuZ4zDtqO9gnE31dzu+M21GbX/SV6Nu67o3+FmAGu5vqh2SYk9MUWOS5qaMChAcp2Pz6R3ENKvlkUrAEBbF6oRYndy2s40MKAdkBFLfSbki3l0eM+mJDk5RVK6hoQYWEXEoxXWrye5lyw5PYG8eoEWJIB+krIg2E+jDm979Dixw+slnvU8Uqa/BfJkOAyXhFrW/oP9VecwjMwCpz/vrZCx6Q26ALoBstCcMp7hq6ylozo6PP7QKemcVMiQD6TfxpIMqiKjO5pPob2nk4Lpk6y1yz8pCUzjOx2/o8RofuSHzdBCpdTyNw2eovX0BN3zGQyrjKEHWqpKq4HgSsH6gwsLguV9ucXX0ICUKWcCcZwurNK2d2kxRa/vPz7MGxE2HRDddVl32s3jYehDGFJD6IRF9ZT2b9qzR59YU1KVVI1ZJpwfopKg80fv0e8f4PwkcSEeljftplQKDassuZepsEr7TqALDzBMUf31f44MMgLXfB4k1yIO1FYW2EfgYxNP4Afmj/WA4frMUwCRvDh2LGKS7zOG42CPAZzZHMWnwkoHBNtzAeLaz2zdtTpNu9fzAp5RjPXX/0XcOsPx+icDIHzeM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8KMFaL2wu9VGjgIB2YEg3+2RT6hHm09nFDzqds+sV6bxE235/T14PF1zO6Gw?=
 =?us-ascii?Q?lNpMH1ld7t1KbBh9G4UdhgAfQA1Rj340gVRuhToWB53O9r1g5g+vFPTb+YNj?=
 =?us-ascii?Q?PDbWeuW8nmSidyivB3z6CKHNiWCTyB0/qPYqDXa5nKZNpFoOCsGf3uOIeHsL?=
 =?us-ascii?Q?HYJsv2pdt8/JXQEKRhwXy6gxQONhAB8ZWt0EuuCGnhved2yZbj7DHVuTYkcZ?=
 =?us-ascii?Q?sc3DL/67wVlBUArbPUkF/XncvhCRyXRtUrVf+dYU5penGBRz6xnvzvjREfBx?=
 =?us-ascii?Q?XbilibtB4oVGsWLfxCnyu6qavNVhVLhcW/c5jCNjLeFeiKRgNdVfXCEn3ctW?=
 =?us-ascii?Q?dp5kB8yGI5S0zS+ugd6uYyc9ppDo+ivubU90DGAA3AXyFIfAOO3/7ZKBQn7s?=
 =?us-ascii?Q?HSybqUXUzqhpBj06oZoXahgZarwt79rlRR1Kb0Nfhdgki3HgEHmUVtLnPTIi?=
 =?us-ascii?Q?GbZ97y5SC/v/H4cw5ba1Z6Epo1CVB+ISNjnt/drElPEmq/zubsURUXIVtOj6?=
 =?us-ascii?Q?gRRzi9ZRaoIE/wvizKNkorza0S9UwH2CHPnpAf00W8x1+2hLMQ/QM7xCBhhM?=
 =?us-ascii?Q?rY+v7I9kBev8L1OBkAO15BhzeVj8T4w40K85S+lrT0Fboojp/rgUWaB+5mmp?=
 =?us-ascii?Q?Aqmrwn9ZJDiEZSamo3VLwfx15OIjTQWMUxTkPHScr3zBXOs0JL6EkHT+KCPc?=
 =?us-ascii?Q?q3BTQn5vDfi21p7KoCD9/CdNVh0DN1BPJxs53L5/IIp20NLceiF2KvbPIb1q?=
 =?us-ascii?Q?s7+L3kdZuVyYEx1XYV58bsAsYzEyXx3LRcIegIQwnD85Ln96dmoK/OVzWTJ2?=
 =?us-ascii?Q?05WNTZ8Z4DJAT5o4cqavWJ0vwikHrEiUoiy2t0QOWFi1uT4VlvWUdERxvt+1?=
 =?us-ascii?Q?TZ1sU9rm4QAzF70uJb4z+STvolSldcc47vc8aXCb88rM/NQEzaHqJSN+P/Xf?=
 =?us-ascii?Q?WDinlxb2YbO2MbqsvN/jZdwza4/OHtccRif8md9eXEoRY/lefsQaHNgOzwD9?=
 =?us-ascii?Q?kE7bxkpolmirVH0k+pLhSnuktR7w/4YGsXoUAaGBUYlXksJYy+tiRPWPLQDD?=
 =?us-ascii?Q?zJr/W457K+Ii1nxbByGizmfczdOsFnao+MOoflOR8XbHWnxUIKylUB15B7k7?=
 =?us-ascii?Q?kKCiIyv9JJdstCIioJ8C7zw/TeK/KLF4bDcEmD6np+TlOLlFsKO6byOw2qe5?=
 =?us-ascii?Q?Hi/U8AKkbEuPOq0Mzm0ihp5a+c5ZU+J2RR5kkppBKARb7yo20jrtqaz13fq3?=
 =?us-ascii?Q?GdFDYinm7dj2iZCqWlHsWo9jlA7kb6xYun2s17GTINmq+XNaDwOJ1YVXlLtv?=
 =?us-ascii?Q?uu9UePQV/6wpZvjLEUFdQ4IFBg/y9Md1eLqOh2VEPa4TyWOU8U3dE4bFkmGV?=
 =?us-ascii?Q?8etxEAxq9bEUqsFhY/vgHb26BGZrliHn4eT4HEqOAerbx0kfCl25JMD8Vb0B?=
 =?us-ascii?Q?yDY2AXZm+oXWD5Av8s4l0ETMEVHTPd7DFIAYE2h14US+XtBKqDnQMiJg/hB8?=
 =?us-ascii?Q?UrKdM0Ky1umZLCQGFwKAQK9CDglh0FaFuF9OwzmX7gTWGKz3sIH1U5XC2Y7A?=
 =?us-ascii?Q?6CXSc4WKGLn3goS7Wjzj/9QxfNfkX/CPcdb8eSZTV3BRlLwRqO3tE7mTHxzw?=
 =?us-ascii?Q?Aw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ef92361e-2831-4abf-e68c-08dc59a94c35
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 21:58:04.3830 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x7agFyaza9tZCG9a1/kM4w2ecwguTE/ulYWU12jcnBnga02xkONaHnEIxYZFUAUtRlfCjek/3ST7kIMVm49P0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5888
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

On Tue, Apr 09, 2024 at 04:17:30PM -0400, Oak Zeng wrote:
> With system allocator, a userptr can now be back by device
> memory also. Introduce a helper function xe_vma_is_devmem
> to determine whether a vma is backed by device memory.
> 
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pt.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 846e896edcb5..525092111be9 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -577,6 +577,17 @@ static const struct xe_pt_walk_ops xe_pt_stage_bind_ops = {
>  	.pt_entry = xe_pt_stage_bind_entry,
>  };
>  
> +static bool xe_vma_is_devmem(struct xe_vma *vma)

At some point we probably want to scrub the driver as we intermix
devmem, vram, and lmem nomenclature. I think in case we mean the same
thing too. Anwyays that is a little out of scope here.

> +{
> +	if (xe_vma_is_userptr(vma)) {
> +		struct xe_userptr_vma *uvma = to_userptr_vma(vma);
> +		return uvma->userptr.is_device_pages;

Helper itself LGTM. Maybe promote to xe_vm.c/xe_vm.h?

Also consider other options rather than userptr.is_device_pages flag
here (e.g. look for buddy blocks, check a gpuvm flags, etc...). Can live
with a flag but we can do without it, great.

Matt

> +	} else {
> +		struct xe_bo *bo = xe_vma_bo(vma);
> +		return bo && (xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo));
> +	}
> +}
> +
>  /**
>   * xe_pt_stage_bind() - Build a disconnected page-table tree for a given address
>   * range.
> @@ -601,8 +612,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>  {
>  	struct xe_device *xe = tile_to_xe(tile);
>  	struct xe_bo *bo = xe_vma_bo(vma);
> -	bool is_devmem = !xe_vma_is_userptr(vma) && bo &&
> -		(xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo));
> +	bool is_devmem = xe_vma_is_devmem(vma);
>  	struct xe_res_cursor curs;
>  	struct xe_pt_stage_bind_walk xe_walk = {
>  		.base = {
> -- 
> 2.26.3
> 
