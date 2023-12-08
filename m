Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEBF0C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 19:35:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A51510EB07;
	Fri,  8 Dec 2023 19:35:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D63010EB03
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 19:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702064128; x=1733600128;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZSmMKQNE0FzpPOT7XEq7vhzpJVkgJ3wiBMPYOhrJkms=;
 b=ie5jo5HB2y8IeDZ0cC+r0z6jfww70HrLZpJlYI5F0rdUMuKGoY/btAkN
 Tq6cHEdD/ItX67vumJAwlUjn6BAGrm7GCmLoQsggvG0wBkctE8hRcRMu3
 7PG20X3lrQbalCGMwkrtEMiJGEewxgiCLSUh8zdtEf0iKplEanXlFTpEW
 l5OXplUy7e8th6otNc/RItrbbejv8IZEo/UP5cOOkp2/XTPLKfTki/nHr
 6e9RMn5up3QqFiLelcJaQV5brMPI2EN4/8ipQSFw7JvDMln0aVp8jBnvG
 GgLpLut9RoE1Igd2iyO06I7QAQO9IbFBUaUHCSANsg10oCpFgUvpBxtAP g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="480647057"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; d="scan'208";a="480647057"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 11:35:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="721965626"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; d="scan'208";a="721965626"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Dec 2023 11:35:26 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Dec 2023 11:35:26 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Dec 2023 11:35:25 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 8 Dec 2023 11:35:25 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 8 Dec 2023 11:35:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CY1t8YsJV1HopAnqMBnAKX/Uzf34B/lawFh5+oe2ro1yaHcJB0SNd8++j7vbFSoRmQNkMT6MzgSz8EaxjhUQVw84Pia+jds+HPCzxtYSMhBiyASSB2HoTu5sHifPts+k4czJNmvPpKWMRlS2K/f6CPzQKCTjQ/VDpuQkQGC193k+IPr8eK3+PZt9r9rre8EAZeERCsBH2CmcbmhV/ivkCN1wZZetuN2XwLokhuapSjAhnz97NrKh2b0uZtlRl6Xu/n2MXViYlAnI5WSiBJi4r4flpo61Eg20Jr5T4Hnpd0Px+M3+3bIoVvceDoJsfvnekBOQBgecsFqSnEzAn+OwKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jCa0rGwL1/WyPeZyuAW6gPP3bbSJeaP0bsuzrRcpKgg=;
 b=igAu2Rx45nsQ698fCsgjIUNSEVH85lRrxq8yyTCwSE40MBXzgjM2TM9NBwezIjVOorITGSP4oNQ+6DqLl3pM4R/AsjE3kyZ8Q/jgBZ0piGJU9/rO6w2SB0zQ/R8HDJal4op8goJvjIrbbQKB5WtBPpdXvQZQu0EOJV9SRiXpFyabd1r1+9U+U1P0gsnOxwFH6FdnoKvGPFyor4hvLRaac9pTLG+0ILTQuXfoJAR8B9ClNtgCDWz6n7MoTWl4X2g2NgcmUqru7qdnJX1XK2DR3ufJvAdi2dLr2e3alEJsJoTNBEMcr3KbZx2VjCeVmbl00gbvetsDFrLY8oQK3nqtKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB7013.namprd11.prod.outlook.com (2603:10b6:806:2be::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Fri, 8 Dec
 2023 19:35:22 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7068.028; Fri, 8 Dec 2023
 19:35:22 +0000
Date: Fri, 8 Dec 2023 12:34:23 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Subject: Re: [PATCH] drm/xe: check mask in xe_wait_user_fence_ioctl()
Message-ID: <ZXMNT/GYt5sn56k+@DUT025-TGLU.fm.intel.com>
References: <20231208143427.7-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231208143427.7-1-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR03CA0375.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB7013:EE_
X-MS-Office365-Filtering-Correlation-Id: 869824ae-af41-4cea-f366-08dbf824d1d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4+ZgW2+RPfYX20wfCgV78hPwAiLuq1OufbAF32LIl5yn1BHCKq/kueegag2vBM6KthwkVJb/s7GPSUb6zJI+ZNLJ+GlW4AfUV8fINidLQMTD/MZP4IN6wodaJ2l6Gxu0DwsNma122bC0cV0ZZR1NmdoIS/97vx3LD2IaHYMtGs2nBq9EXKTu9leG7AD9qDFSgTkyEXiIBtChbWCNZ6dveFIfYp66T12ZvwYQDZ35tHDYAWmMVeIX346wdG6On4dksZZ+nn4rVDsvOdSbMt7owVCzXemLfPO3ShvaCj8HrrpoYaAxvWDGal0rBAkw1lx559KeCnUtJrP7FJb9LZWYG5CBxJFPFli57fEN70otjp68h5OIQs14sBmtCp7+0r2jlM8PKUflPgwG0tGSZ4+cG0uJcIebjX7zs59IwglENbLzX1NBY0hdMefpuEU70BrWHIrUOwSNR/CeatZGXTE8yrEDsXuBz9RQagrA35gVs7zXJvstXN2zDhqNVtu8fwUROVyJC/A6sI47QXO4KhK8QeB8CD/aIN2jjhd6E4ACNfEPKJ0FB7fiuPDzAgXn75TK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(346002)(366004)(136003)(396003)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(6862004)(4326008)(8676002)(8936002)(2906002)(86362001)(44832011)(5660300002)(41300700001)(83380400001)(82960400001)(6512007)(6506007)(26005)(38100700002)(66556008)(66476007)(6636002)(66946007)(478600001)(6486002)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CzigIK9ZJwAVM4bj5tkOKZIMyXbQJ+aKZaORtyix8dvtMcziseS7oXeUaZzW?=
 =?us-ascii?Q?pgOSfC3VXuy0TdZZW0JExvBm4Wa51HnoLd6AIFxeQJgTRdty/W299kOsqsjo?=
 =?us-ascii?Q?fCXLarWwJIOfDN6cdHhTKHFETawIu6/ZUsfPRp81DQ7GYcmeyefG9aKmtyAQ?=
 =?us-ascii?Q?Hi+/Mjx/nZCl7+E3EdY/d+pyPtMs2ojQtKosQAT+JnZ2KP6GwKyVAnpyMYOg?=
 =?us-ascii?Q?WhhydAZ9hYbRvTN0q3zIs0FQtjpgUSZOgwgAsj5BH2dsZlhIjBnS0GAwCX83?=
 =?us-ascii?Q?Svt8xSmVbWUWYk57Xv+m+lIW09vBFqUQlFqEOrAlpKODcireH7T97eAzRxJt?=
 =?us-ascii?Q?QmKf8UxPcfuRbiItQbiv5Pq0bDb3Emo3FW4V0StrzcUWJPYjU3La605auYhD?=
 =?us-ascii?Q?DByqsiXah3v9YsLcTwwS/VzZX3dGHtxHFh9XABMdxuLBL0Bh8UITPFuf4EeS?=
 =?us-ascii?Q?KzG+zn75CnyZvlB7/iykdj3wh5mpmFjPREZwLk4eoG1rJQsAShbv4PtSNerk?=
 =?us-ascii?Q?wUr7p91estJDT5mlAtKE51WH8UDOEBdESPtzeuqKxXz6KxW+vtC/qtDM8qhY?=
 =?us-ascii?Q?6jk1GuLqK1elJSTQIyyLqo/a7qFG+JvVHaz2wB0Ty5ufL/CCEJfI36fI4gRb?=
 =?us-ascii?Q?GitmESARTEH/Y5uGI3cgG3UzxHB6iiwqdKGpD+QZGjhhTgoOXoJDkBStNac7?=
 =?us-ascii?Q?uhGMwhZ0ghfZY2ExYK6nqO+xHMFF22hJ8rZfBf+KX6kykSiaWSSCxSchMjru?=
 =?us-ascii?Q?vT9y8ak39Kew4OnnsVN4yR99WeJCOIBiOw3Tludw4F91QcYd7uc0fCfXARQP?=
 =?us-ascii?Q?p44DGZmV/r0+S+qR0WEjk+gC6HWoWNtYje3LT7y5Eao6gmP6LgWJOkkMA3iP?=
 =?us-ascii?Q?7OJfTEzL7NVinaSi4s50fpKHRW0dqr1d8e0Y/G1gInuIxhT6XYi6CTwsRrTu?=
 =?us-ascii?Q?JTbm8L/QHFoYIyiQMtdyA4CAUOlYliW/HEaSMLKrkt1XN0NicQt8IKSK3Vql?=
 =?us-ascii?Q?4ovN7Giv0RZlaXPUZl/86nYbw2wchn2fA8qn4DfaWtfoyeQndqcTXoex/7BI?=
 =?us-ascii?Q?gYgl7Ppi6ycu4TE1FPQZQACpWVcc0z5GuFufV2sjhDoMW2Pl0bA7Z/GAGP4t?=
 =?us-ascii?Q?SUkxlvT5Nl3CmQGpXLP/Hc9PcJIEKk23dask0aPsssbn9HLDAjYk5BXW5r0M?=
 =?us-ascii?Q?FTmT31+KEcNxt4Ox3LJJ6ZRCJT8y/b0ReF5CDAp5mr0Rnvspp8eT6MgpKbDM?=
 =?us-ascii?Q?bDRem/Gd35/U1h5MCZZp5JNHvkF2Wb6zoOXGBSCeNcjiGtWbyFaTA2tETImY?=
 =?us-ascii?Q?1fCkMBZCDcujBV/Nf4Dvhf6UClFiufuodaKcqziXuL+bbnzqx5hg6eAxqEf4?=
 =?us-ascii?Q?3QrpG2TGXQPtm4Ona+bfuki4n+n4yXGZGpl2Gdfg6a5BGeXKqsInOghNPA7E?=
 =?us-ascii?Q?7scwnwe2N21U3+IPeEH8CwpUvi9LKkKUtYqx7FTGivV0X+G+Krn1nNMMeCx/?=
 =?us-ascii?Q?uS46oAoF9lA6tUpItVzxJltz1h3O6LcjvwwKT6L7u8IRFwDGf7mRku4vsuPI?=
 =?us-ascii?Q?8fdn56VQIkK39oXE04fl8vPFH5P6waQ+Tn4bHz1tJBCsSLkYfNsiUiFkCQhe?=
 =?us-ascii?Q?Tg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 869824ae-af41-4cea-f366-08dbf824d1d0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 19:35:22.7454 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z7NgHaGbABbJ+ic2/e3ziMkA5rXhUAVEBlZ/xD+qNiQAztJifRWkEM4Nr6wHeOQkXFGleOendYv+r9anQW23Ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7013
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Dec 08, 2023 at 02:34:27PM +0000, Francois Dugast wrote:
> Check the drm_xe_wait_user_fence mask is one of the allowed values
> DRM_XE_UFENCE_WAIT_MASK_* provided in xe_drm.h.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_wait_user_fence.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> index 4d5c2555ce41..a73139fe3fe0 100644
> --- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
> +++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> @@ -164,6 +164,12 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
>  	if (XE_IOCTL_DBG(xe, args->num_engines > XE_HW_ENGINE_MAX_INSTANCE))
>  		return -EINVAL;
>  
> +	if (XE_IOCTL_DBG(xe, args->mask != DRM_XE_UFENCE_WAIT_MASK_U8 &&
> +			 args->mask != DRM_XE_UFENCE_WAIT_MASK_U16 &&
> +			 args->mask != DRM_XE_UFENCE_WAIT_MASK_U32 &&
> +			 args->mask != DRM_XE_UFENCE_WAIT_MASK_U64))
> +		return -EINVAL;
> +

Why do we need this check? Looking at do_compare() I believe any mask
value actually works. Would it be better to just delete
DRM_XE_UFENCE_WAIT_MASK* from the uAPI?

Matt

>  	if (!no_engines) {
>  		err = copy_from_user(eci, user_eci,
>  				     sizeof(struct drm_xe_engine_class_instance) *
> -- 
> 2.34.1
> 
