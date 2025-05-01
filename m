Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31254C369DC
	for <intel-xe@archiver.kernel.org>; Thu,  1 May 2025 19:48:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D83610E0EF;
	Thu,  1 May 2025 19:48:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QHVmLkTw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48FB010E0EF
 for <intel-xe@lists.freedesktop.org>; Thu,  1 May 2025 19:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746128885; x=1777664885;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jURRdPHPaSzgTpjBPwkcds0xO2wOzlFopLSwa1q7LCg=;
 b=QHVmLkTwcFWAcQbFMd/+riBrIkN+71NvKgJ/VYjJhUSP4E3nvr67VZ5y
 bT7J0KZ4Jku+sKRHO7UHCFOx1qrxJQ7QdyFE7cij2JAenS73pO/y9HKuN
 L8tpa5p7x6QNdXMEsqQ/6q9Ohg4kpt8/o3vkl7lf+kn/JyKAmmdXVJ6XV
 iAtDsXmHBSmMEGqs97SA8bPzbnHFPVWGetAYHhCLdD5tB4MLjFC0Yd727
 0Pi7qdEqB64MMWIlbWe06g5OyBaPRwsV31NLXVnrVoAHPqSgn+w0m/nJe
 SLoisFj2eM43j7wGzulN5YOQCvWh5vOeIMlFA+lHE50kaeCbEog9URGZv w==;
X-CSE-ConnectionGUID: nNQdow9hT96viOBMS6fJjQ==
X-CSE-MsgGUID: GVwOINliTXW3ok/k9bPdxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="58476863"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; d="scan'208";a="58476863"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2025 12:48:04 -0700
X-CSE-ConnectionGUID: 0jFmAJKRRpW9T6dT8uli7w==
X-CSE-MsgGUID: WSE0Pq2KQP6nSwZ5NBJH6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; d="scan'208";a="139451375"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2025 12:48:05 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 1 May 2025 12:48:03 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 1 May 2025 12:48:03 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 1 May 2025 12:48:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OYmUJt5755XwqAcCkSi/Qi6pbjwlJxPiFoJ9ntRCrK0zVKM2zlxb4RjXZGiDYs2kBut5Nv2WKmEpCbx6df2fDdjRIyHv35gPdgfMq38OTGVzvIS4wtOcgrlNztQ664u81KM788qJ1d5zF7GZr7AqLDE+xSy5zFCPP5S8IbDcoC2gv7zZeGAA3WRJ9QXWRg637r5we/545tyrVosmIbmtOlL2zkjVo9GYGaf4rnaJYq9rlskNG5y1V8USp6Rjj8SCcLyOPl2Dge/jRBDOnAxtN2p79pq+A/7zT4fBFhn+fjbfvsRTV/tRulYLTvLyNZgpa9ROZptFe912SjUFrykGIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CSsxl4sv9qlP9jqPX98re/GuRGJxYw4xf9HfMqM6jqU=;
 b=WoVJ/gaTu/1XnA3lE6Bc5bGULsCnl7X5yf39+zzHEib5nYLP7jo9iCaNbzeoMszjR2AFLsWE8XEpi/YOYSA8nBvEOb8j9/4cF93IfFPgk2CeJzODUGNsmltTVwpxqv9E03yVnqTFHCe6jP8RJjt1kKziQsKEtiCiKpNo9wBmw+VwJXdmYIflXny5TDqVLC1Qeh9SKlw018UH1CEvO6mNQJ6TKHdrFM0TY0tPB2nqJt8YohmfU/d6HXOfbEVDWc9hMTic02D5w9AYpDFdBzsWlCLkOd9ntrkz83KLskBCo7N1jcNpMgcV0kiDAf9oEU20JKn8XyyxQc8cXmRgE7gzTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB4866.namprd11.prod.outlook.com (2603:10b6:303:91::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.22; Thu, 1 May
 2025 19:47:33 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.012; Thu, 1 May 2025
 19:47:33 +0000
Date: Thu, 1 May 2025 12:48:56 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Stuart Summers <stuart.summers@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <lucas.demarchi@intel.com>
Subject: Re: [PATCH] drm/xe: Fix page fault queue calculation
Message-ID: <aBPQKJ1mjYBKRfNh@lstrano-desk.jf.intel.com>
References: <20250501183220.72097-1-stuart.summers@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250501183220.72097-1-stuart.summers@intel.com>
X-ClientProxiedBy: BYAPR01CA0022.prod.exchangelabs.com (2603:10b6:a02:80::35)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB4866:EE_
X-MS-Office365-Filtering-Correlation-Id: 770b41ae-6876-4575-9794-08dd88e903bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xk+twBvNmc6jXAHryNEr24NGbDZDGj1or/MG9+pbQnjOmnMNA9DfrLc4j4Et?=
 =?us-ascii?Q?ONbKMFZnGedDNrUFARBpdIooXItLQKdb02wwbXDntaHEoUF5ZORbZbh0W0LF?=
 =?us-ascii?Q?0Vht3oMYdSrD6TBGXeHdm8dMfNJt2guEOUA0k/udpJ5+W96gJsgvtkCTKwUk?=
 =?us-ascii?Q?HrhssMDTKkkYvJWev+u6EdhSD8lzQfbOxksTP/Jg9PrCOoowNxFcBNPHh75q?=
 =?us-ascii?Q?F7upAnPESMT7ZjP6/DdRfHHyRoL2hym8CMgf02E3Izrq/jQ1/NI1J18F0iII?=
 =?us-ascii?Q?TAWuKE9j7K+bUZtWZtSvnomp5RfMll+oHJADLkYliEDjoaOslJEYfmq99Ji1?=
 =?us-ascii?Q?dLKtyb8biGVVOfdjh3eQnIcvFZXDmBzh7e1vny+Kn2DudFcaNycBXDjrBN/r?=
 =?us-ascii?Q?FfePfNxQ3lNKmpSm/5a6Xa0w9nbZlYldCncK2UAENAvecbGx5XUQWZdt9c+I?=
 =?us-ascii?Q?PunMABaITAMk6u7ToUNDNjErZAx2uADQLPTDHdZQmBtK8TSfCGDOzM41lv3x?=
 =?us-ascii?Q?khQOZB1Ks9CRolwXO3adY8qAuVko9MtvmUr6G/7d2z7lVGingGPaqWsO3+Sp?=
 =?us-ascii?Q?Ms6GeNqWmUo+TdeaKFyuCgD/8CNF/ulTM+mV1z4pQpbKdH9X8UvJxk52v3IW?=
 =?us-ascii?Q?vUOC1+3ES0v/Fby0318jpAV3m3dvDN97rSRQzNczb5b68QSpF+Ieb4VD1ND5?=
 =?us-ascii?Q?ru2gz33leF6esKSQjBU1h8CflRb4JUdLBro3y3lUBZcdfPOXr2+MAHGP8BVX?=
 =?us-ascii?Q?wG05XOEVXKMWWnSj4tyONXEit+vIGumC/IOJ0MhAxlpGX+OzsO/AjHQ1NwB/?=
 =?us-ascii?Q?49WoYrbflzoIxnt3K94kEwxK48VgmHtr4zPNcm7nqKVOJmsc33LgXYK66U3o?=
 =?us-ascii?Q?jnO5l6JbCxMEsFwDwPRGoy0JXFt97ZaxDP7ueVeyPwYJHoMsPGgR3iptUYBG?=
 =?us-ascii?Q?VelquwaN4RLau8C1H4zxg3qdJ/J9BXbtVp8Rj7BNVEJyse83A6mhIDB+fsMb?=
 =?us-ascii?Q?55bI6JFQMuoyYVGU/mXjf9IwfXBj1larzeNeyXbDuHeIrFsrszOoA6tABWsp?=
 =?us-ascii?Q?7yPI0/1XdFnlheKiwR6oZTdp7U5QGwfIv3jdG3SCevh5nkYRgoWBgOUq4lMC?=
 =?us-ascii?Q?1HM7Z3L3tP7T8oT101euHwrEaSdjbMtX4ebpEZgAXAPQ9dKcquC7yQwmaHSF?=
 =?us-ascii?Q?cXs+Yrhvkii0D6Y0uuZ8fb68tlkqNsMoEp9jpEOWhKq71KSQSFVqWZewLqe2?=
 =?us-ascii?Q?gnxslW6cvLKux3d3g/Kz0dJizaq5H2Juntna4LL6muKnDEBO/bxQdMeqjpn/?=
 =?us-ascii?Q?atBBREopgC0q38dq7pVnXKRnuCV30efQShdwrX19x8I/iaOBvRbTr3eicxFN?=
 =?us-ascii?Q?D2ujvvJ3+LTaa2bAR4REI+e7N5vtOVwv1lE0hrsXrhMTLXcX9bBEaCRaWRgc?=
 =?us-ascii?Q?3UFpZWm+qHI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CwjTgimfjvhV+Tiw7Ou8wqjSjJbuBm2pVza72zwxTyO1wiKH85OUHAqGEv5W?=
 =?us-ascii?Q?iruIeKxrwRyZYpcTyYkJRFfKTmamVEBU78e78V6EjPQTuqsgU9YjCV3JBrCB?=
 =?us-ascii?Q?v0Vp4m7/ppGsua+CyywzcEbxB72uaH7ymzmX70aeN3VA26372SWjkZLHgfP2?=
 =?us-ascii?Q?j23VmcM3hSZKHvaKFR/lriDYsWcnUPU2O+VnEo9Wf86hZBLOEpHu1QFA9fSj?=
 =?us-ascii?Q?jnnjpjFVwWU248/Jrtbxf5TTJvOTqCVz4E991FFVH+H8uakuVB2ysBNNted0?=
 =?us-ascii?Q?Kzup4omNM3+uYTFPVOheYkE38YDLnWw9qC9q6z2DlgvO2esFqw8NTB2AkRPp?=
 =?us-ascii?Q?0mJFVql7y6nLaI4aY3dUL3ZsPuYP/Nz9UinKfr0jXE4+7XhHRhhLcVS69QXy?=
 =?us-ascii?Q?O1ySOpupSIdVCnTZ/MXkgD2AwPnjXJ63zJbCI9Vry4Qh5DUCbuwaz/Cab8To?=
 =?us-ascii?Q?kV/WejkESYyZ6N1drA+/iz08eXSnRnf2l1QWwLSuAD/9my09CtbOBRPzEWwt?=
 =?us-ascii?Q?v0tnKwxSjiW0bu3PrCcnJ03JrCKtL8qJvD60U3nbmfZJn6mzbpXuB2+lh6C1?=
 =?us-ascii?Q?OC9RHJGn9G01ujAgDVuGDABFk532uM5lrhfYngfuTtjXn3VaVV/xpWtjmlkx?=
 =?us-ascii?Q?C38ayKRiZOsspceHALHldvf66xnE7e5+Gd0JrjOuRZ6xsBVP4aC0Nh/zV6C5?=
 =?us-ascii?Q?HCoab6MZVh5Ax2c4pKwfPo2XQdOsYHixJZIlegbUktPxKLu1HF4p8hmvZ9n4?=
 =?us-ascii?Q?5aKrHtneLv7xcj0B50B1Ptslj1N7iC6qHPSdMyKN+chWqWC6lAUV9nPDl5CJ?=
 =?us-ascii?Q?z+KYVTSQ7ASE6lAf4o90rfQSA7Q9Sd2yN43HHYjhtDx77DHIlc/J7Frgxs6M?=
 =?us-ascii?Q?OcLkNp0A2Kg/1V/L7mHrZwfzJGRUTBtnpyVAdzvSMsk0ZIthe9sYIzbu71Er?=
 =?us-ascii?Q?bTZocto/fsn4580xS6ehxnSNfGv5lqgekZ1lYW3eOPdbtjmaToQ40YaNON47?=
 =?us-ascii?Q?Uzip2iearzahaFWsCUFnH81UnP5BlagKXET3c8oRK4mQOS/OujbkJExo0esK?=
 =?us-ascii?Q?8vmZphrqOjLGVjYMIwvHLgWaCzJ9+eJL5uT9lmBtE51M1Vc7lFx3D5XcRfCK?=
 =?us-ascii?Q?VSv8Ue+IYPDYbG5B905mUqmN/7qDzuTRDfBMHxvzWSjIPxF+6YxVdnyday3e?=
 =?us-ascii?Q?M9i0+uzvUxxd1+1HaTRIrTQxZTs1GHjvxewT+sVXQaBgI5Ig7bXrcPFlhWpj?=
 =?us-ascii?Q?0ur6TJ60blbXkSQoDwvWfW/IHHMl4DPLwvt1uHZZ6qN0IzO0qnuyEmGHgaHB?=
 =?us-ascii?Q?plkohNI4Zm1Ti6ZUgyE6c174QeuS0buVqnqBvi75HuH2lHHJCw/Y5PRrQ01R?=
 =?us-ascii?Q?r+dPDXoOTKvrEV5elfg1HXtkmYWFSjsJbcNwzWmLhXrWcCUOYdO9WICAvl6I?=
 =?us-ascii?Q?xSl69ezDJa2wB2EPTDcgbyBNpDYdcNNgXmANfDWv0PXnHhLkJeDZa7pjqk/0?=
 =?us-ascii?Q?TsaXFMnYNcP3VreVGzEudp7Jqax28H4rxqizKMBXefxb88F+6fTyJfsYoFDm?=
 =?us-ascii?Q?jLf1Args3B5eGsY3uSC6wWoe/YdxA3uW2AwdZ0xw7xPlHxlK+G5lB9Gx1CzF?=
 =?us-ascii?Q?PA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 770b41ae-6876-4575-9794-08dd88e903bd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 19:47:32.9627 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vzGcfsViFBouFCZUInnSZNzX9+hgBPrCpT4doHDibCopRLmNSka5Hz7w4Az+SxMnuw306AC4iEuEVUxpTxmaRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4866
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

On Thu, May 01, 2025 at 06:32:20PM +0000, Stuart Summers wrote:
> We followed up with the design architects to have a more
> precise calculation for a theoretical maximum number of
> page faults we might expect based on the number of TLBs
> available in the system. Fix the original calculation which
> did not take the number of TLBs into consideration.
> 

It would be helpful if we could get this information into the bspec.

Anyways, thanks for following up here:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Fixes: 29582e0ea75c ("drm/xe: Add page queue multiplier")
> Fixes: 3338e4f90c14 ("drm/xe: Use topology to determine page fault queue size")
> 
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_pagefault.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index 10622ca471a2..80a816c3837b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -436,15 +436,20 @@ static int xe_alloc_pf_queue(struct xe_gt *gt, struct pf_queue *pf_queue)
>  				XE_MAX_EU_FUSE_BITS) * num_dss;
>  
>  	/*
> -	 * user can issue separate page faults per EU and per CS
> +	 * Each TLB can report up to 32 faults. The number of TLBs is
> +	 * equal to the number of render/compute/media engines plus twice
> +	 * the number of copy engines plus the number of EUs.
>  	 *
> -	 * XXX: Multiplier required as compute UMD are getting PF queue errors
> -	 * without it. Follow on why this multiplier is required.
> +	 * Reserve enough space here to ensure we are able to cover that
> +	 * theoretical maximum.
>  	 */
> -#define PF_MULTIPLIER	8
> +#define MAX_FAULTS_PER_TLB	32
>  	pf_queue->num_dw =
> -		(num_eus + XE_NUM_HW_ENGINES) * PF_MSG_LEN_DW * PF_MULTIPLIER;
> -#undef PF_MULTIPLIER
> +		PF_MSG_LEN_DW * MAX_FAULTS_PER_TLB *
> +		(num_eus +
> +		 hweight64(gt->info.engine_mask) +
> +		 hweight32(xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_COPY)));
> +#undef MAX_FAULTS_PER_TLB
>  
>  	pf_queue->gt = gt;
>  	pf_queue->data = devm_kcalloc(xe->drm.dev, pf_queue->num_dw,
> -- 
> 2.34.1
> 
