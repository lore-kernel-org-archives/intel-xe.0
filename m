Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CAA7C636F0
	for <intel-xe@archiver.kernel.org>; Wed, 28 Aug 2024 19:13:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F115410E5A4;
	Wed, 28 Aug 2024 19:13:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZXCwian5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 036B510E5A4
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Aug 2024 19:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724872426; x=1756408426;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/tPyu1ALWnLyQaC07er7SItb4CaIwM56rOcfvKUTLLk=;
 b=ZXCwian5BsdAVuzNTiLTB5TFRjYfNuwQpNdLBmcuIcRT6EBQO4RUwbKD
 kRtWylaWyLuq3JOG40q55AiPSGiGtntfeC/fTv5nIZqtD6Hqx0jqw5Dec
 2uLVnAEyfY15QzVUAt94A4rgOt4tTilONbLQiU1lHkF/fFms0zkcrwZ3H
 BWJzPNQGq8xLtJ37CWWGnP66qxLn73vxMJQqCLaczlsG5juDsuNLjzV4m
 jBLSjCnDbvGTiIvEP4gog5nH/fEf8IJbfSll4kYa4RHH6quWSaxzXQSVg
 WBpuAHUCKnOjjM+YhDLUPdeSuOXzIh+S1QMyZ7am4VFjpXZdwBo+/CMU/ w==;
X-CSE-ConnectionGUID: g4HQ9A33Ssq6pkZND3ozGA==
X-CSE-MsgGUID: CfVi1WtgThKwVx/aqVOa7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="23311845"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="23311845"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 12:13:45 -0700
X-CSE-ConnectionGUID: FWcUIEaoR3ubbtEb7ZDizg==
X-CSE-MsgGUID: XonX340ySVKOpPwMrcL2QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="63026560"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Aug 2024 12:13:45 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 28 Aug 2024 12:13:45 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 28 Aug 2024 12:13:45 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 28 Aug 2024 12:13:45 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 28 Aug 2024 12:13:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YtePCYOPybgRsOChD9oXQnAKXZ8IEVASVtUReKBdPnnN71fGB+coHRyFq7Hs4NZZSTkXaRHBFA0WYjgMBO52KR/6sKLExahrhwDfZrawZNXSoJ1Ks6D2okwql3M+GQgWIA6GdOiSWxtpbq7vSnZKnM2IJKGu9fD0GCO5eFTZVwUkMXW6knaefd5ehFSFTId7IuIRCdPn3R1VTGZ+FIBUBpxbz/EhFJtwDXHe87A65GW5/G4z9q6ESS0RzR3ZUvevpPsfIFevPYlcCh1XCj+KOdLYKEmC771hsAnVBrijFU1OB/7J4Q+daXXDYfvbCpmBOswyzM2xQsN6ats1UAR/Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4nU7rx+Stx03P+vIN+7TziOicILEhu6rziPinwRLxnc=;
 b=umPxofCU9teBkFgmRLti3pClCZ/7Wmm/sK7SvYxKE7nefikjzNPGmIp6puiTrDWRwfNVmQYm0ytwVrntWqtyB+bIVHl6rqrBUvPE3TtzXOH1CBfYZ3w7GrvY099UWxvDw6DlIvOKel4TGMczrkpK3MfHSSMmJ54fZtwb58z2UzNRMAKyFbumDUxda8AqOlTF0gjBTIo3+VwPXqrIf2zb41QeU4OgeV20suF02TV7eOm6rbPzgU76VIQGqiDaPqaFhOw5wX+u2uLkakkzlVW0RXNKR9wW8QOAnuGTUh8Unxnb4PG2mtePu7R1yFg8qFPixrjex/I/pWWCKrx1/ON5Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH7PR11MB7430.namprd11.prod.outlook.com (2603:10b6:510:274::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Wed, 28 Aug
 2024 19:13:41 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7897.014; Wed, 28 Aug 2024
 19:13:41 +0000
Date: Wed, 28 Aug 2024 15:13:38 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Vinay Belgaumkar
 <vinay.belgaumkar@ntel.com>
Subject: Re: [PATCH 2/4] drm/xe/pmu: Define and init a timer
Message-ID: <Zs924vLoxdmMIb5T@intel.com>
References: <20240827164107.47034-1-vinay.belgaumkar@intel.com>
 <20240827164107.47034-3-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240827164107.47034-3-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: MW3PR06CA0012.namprd06.prod.outlook.com
 (2603:10b6:303:2a::17) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH7PR11MB7430:EE_
X-MS-Office365-Filtering-Correlation-Id: a7c5c95b-fac7-432b-de30-08dcc795875b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?C+kMYUEkLHy2vWdGRqY5ot7CpkzId74L/5ckwg+uYL2W5agMuE/caRKDNUT4?=
 =?us-ascii?Q?rsUOiupg6GpsXFQIyTJEXtBj75W56+Y6NYJc2tWP2J4BgjcMroM/wsiQfR6c?=
 =?us-ascii?Q?3NW6dbhNr8foM0OuSgifPFMixt9w3o8UQSo6J3ngnTjxeNAU1k/XYmX5JrKW?=
 =?us-ascii?Q?GlVwAXqqVY8kIEXgDpNZ4BwXIlRK6cfnj5Btaf/zFaWQ2znTrv3V+pF2n6E3?=
 =?us-ascii?Q?c81iTt+DVuF/8XzJhjdslEee9vQU+p+t3d2ISmd2b5LVZ8GPB2/rjuTbmvjI?=
 =?us-ascii?Q?0INl7UeUl7x9fWn2hglxyt27KJOcaVhazuTAXm4PuxczELDE5FFV8bJpuDWA?=
 =?us-ascii?Q?v1G3GQ6tKqqG32nxXtIXDYbx8D3uTtwox7c0guv7ClcFEqc416fC2XuAWjNE?=
 =?us-ascii?Q?hynt4VyfKNyp5EfrzPKvRy9IhLIG5pFKg/SXu/hoFReKoekP6exAAbsT+6Cj?=
 =?us-ascii?Q?u60hOAt0eDwu62xX/EayOf9TlEjxpU4/GHmSoAyeRMYK9W8z16NV2MAYA4Sf?=
 =?us-ascii?Q?eYV0x6h1OpKBt4+VrjVqtheoW/gXrTz5/jTF5wGM6nNIw+PtgCOi+FlLCsxw?=
 =?us-ascii?Q?kO51HbYGWpcpokRipgKfUbTHO0hjW6FTNw8XOXA7So/rJfQ9oF7Sa6hdl/J8?=
 =?us-ascii?Q?Ss/bR4IVJblSOwO+sW+0kwt4F4pOqILEz8WjVnqWHHAzs3RlERrg0ZxDQUV8?=
 =?us-ascii?Q?mLJpwK54XLX1BKRXAUBrH3bBgIzmye6jJDEHwm+3TojJxg/mpMBYBDHrSa+L?=
 =?us-ascii?Q?I9Opvyfn5ExDm+LtSRwbHwijubZZZue71pTe66pp0uiKpNsvZUBNl8E0y81D?=
 =?us-ascii?Q?sESPtVllX63yNNQCUwrKE5eLu9YksFhUlLA6taRW4U56PAhlLLJ0u663/2yT?=
 =?us-ascii?Q?zRSB/n28cYrt50xCkCw//9MDDA+6fs3Q4AajAGkk7QSNjxBA/p8CY42lm1MB?=
 =?us-ascii?Q?qo/U4Ul/BdEx4cRv6m58AnPAacVWCwdPbLx/NW9YReTCm8urKfSbytdZpIjM?=
 =?us-ascii?Q?3jkC+h0UIDmIyZy4VSdTAqnVLB2mWflI56pRrSUnfHLoDhORYsDFjJGmbmeP?=
 =?us-ascii?Q?O/VzElWivaIpRPrPpAVu0+97RidhnPqypVEGaCJQv7g2Gq1QA787O1iCnGrF?=
 =?us-ascii?Q?lxHZ0MOHZAgo+AbjpmMVRQ2q4kdWagvA5psxgIRo3XLN4/EfIZi+WvzMc0e+?=
 =?us-ascii?Q?p588zWtF6YnAS1ql26TFL4yTDkPA7OpCOcnsHISB4ODJkLjLUbK0IVqrI9do?=
 =?us-ascii?Q?RjGPLy75IBsVtYtHFpNZYorz/zcLpzpr3Pr7RBMkJDovD01cbfzI18otBygR?=
 =?us-ascii?Q?cAsFA0dnuh1aYT6Hy6txUMKA5wo3DTig8VQR8nVV56b5EQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GO2HAJHvtxeGVRbZigvbxYSooiBkxxDlnQjRgbrcdd7u/d6ycFwaGxV0OwWk?=
 =?us-ascii?Q?Lx3IPnczVxwouEuv0f/eNBSRoKeRSE6jLKFv5En8btqMj4uEcuVmjOUP5fAK?=
 =?us-ascii?Q?lCq1btTWkzDP5mHKd4UDqQGJtX06JV81nMyag8zVs7tWw+6c3qE4eLk5E36d?=
 =?us-ascii?Q?hGzLJnL+mJ+1oPsX+0wvnEo3hLn1wiwbjr+rJqyS2U9r9F/XXUJxSvhWxAfM?=
 =?us-ascii?Q?nkR9Lh77E2QuuDWfXgEcqKC8SOcFGiqCnBXISsl357vyDx4AonxaJnNr+itU?=
 =?us-ascii?Q?QtOmOT4kJaO3/Mxfp280MJhnngd7yblYYAWyFkdGdMZBT8p8jTstZKfWQtkm?=
 =?us-ascii?Q?+aFpKo9aBUUldA4zlUhtSuORWw5vSNwVsLqcUsPaqORqCYBxMmp5t95a+/Vi?=
 =?us-ascii?Q?DBGnlv9guNZLEic9d4hvQcrmSBnBbv1v89g93h1pUaTQSAxRam6RIU49fPM5?=
 =?us-ascii?Q?cOOS9GLjR1tF8zIoqOuqgV/XhivS2FUGMGsIpAQ0mnsxeOFYH0HqkjMPXhx5?=
 =?us-ascii?Q?pJf/OPf1M7hfoYmwq4L3Ku+wVeglNAP+IfB7G4x26843WmOndmv2/r1rXP5a?=
 =?us-ascii?Q?QVekDiHnjvk6aBJv8H1g8JDl3YaWrvBsrFGvkkkHq8UxPVnWppPkuymVyX0j?=
 =?us-ascii?Q?FM0AOAildhvVIJy3N72UmLcAUg1MKx3aX/4eY8hYoYZd/KOVPqkax2ERTPlA?=
 =?us-ascii?Q?Xu+E4eHHR+VzpsJAZEmqCg0tkkQdYm4nSJj5FGMZ+j3qqYXdVUUnRHCz6nVa?=
 =?us-ascii?Q?KVg9ZiTavrF5v0uBOw0uGCUngxA54IPlMtf56ViUtF19PCFtwOMILMe4uYg4?=
 =?us-ascii?Q?ZW/Bqwdy0qLwx2tQ6UhDVHgMQpp9nCBtmkrcI7TsLR1oLc3N5GuWvFSIbiqv?=
 =?us-ascii?Q?U89+yYpkjDZ/Vor22+JaRN+AQxJJ2zYRFRCRXWANvscVlHVBcXHrTBWvVZWg?=
 =?us-ascii?Q?QwMd6OrBXG2kGialf4FTeOraAJXadMXDTVoSPrYW17UWpUIWATanSvhwAiSt?=
 =?us-ascii?Q?TN+9oas+eJTebpUBYZZe8Rav8PFdnhrY57jMCxT15P5KiXEenj3e5EK/VIXK?=
 =?us-ascii?Q?UkQ1QzLDHHWkzw2JrjCkoOAwyR2CUHmLN6OagVilwnkoqJaqeWFk/Wk1FnYK?=
 =?us-ascii?Q?voi+vYmE5eVxAtxBvBLWKT9liAM8VfTFROi2VYoqs5Lzlf/6xw4xx7MNUelv?=
 =?us-ascii?Q?IHb1e70mivMGK/wVnSi9Bmx/fdFeihiPqTAkWpEQwfNnvkmkJ4SwZE5OG8y3?=
 =?us-ascii?Q?RSTgF2glccWLUjU3uSmjmeioeYuDFLBCMFcVOdJK6UUE2xWnfs55RTowRvJb?=
 =?us-ascii?Q?ejM6xsvd+BagJF1M/NBaYuMnxx5ugWaXyTZTV5vrCTn+dyEa+Lm90y/t9cbY?=
 =?us-ascii?Q?tTC1m1oKRNJaNhQxC+e/7Fd/j8QCXFKyjdln2SBNiuG4MmbvX6AQpocwXDHf?=
 =?us-ascii?Q?1GfRtqTGPe1Cpz9V4iHLchGuZAQzkL+J/FMxI//vYysMN77xNc/f5eL5WvcO?=
 =?us-ascii?Q?98/7FFB66YmA0KXB+Vvf7k43P1VtPvxKIZDaWrS6iwzd1xxT9lDEQz5y4Dsd?=
 =?us-ascii?Q?fw8XYABiip5oYXo8f1XFjrV9dVC5ByS4PGV8uLLYOvnbu6IsIR9qHtKgnD7Y?=
 =?us-ascii?Q?XQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a7c5c95b-fac7-432b-de30-08dcc795875b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 19:13:41.6403 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j0npXINHV4wc5C0ttbOJ/z3vIE8OhuhB11mYCGu2NVUldPilwBv3kSRgs/UtExQ2t7EmlGePVRhlAYZqfFpznw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7430
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

On Tue, Aug 27, 2024 at 09:41:05AM -0700, Vinay Belgaumkar wrote:
> This patch adds the necessary framework for a timer. Code
> is ported over from the i915 driver. This will be used
> for frequency related events. Instead of having a fixed
> sampling frequency, it now provides a modparam so user is
> able to change the sampling frequency if needed.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@ntel.com>
> ---
>  drivers/gpu/drm/xe/xe_module.c    |  5 ++
>  drivers/gpu/drm/xe/xe_module.h    |  1 +
>  drivers/gpu/drm/xe/xe_pmu.c       | 92 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_pmu_types.h | 51 +++++++++++++++++
>  4 files changed, 149 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index a95c771e7fac..e36c10c10af4 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -22,6 +22,7 @@ struct xe_modparam xe_modparam = {
>  #ifdef CONFIG_PCI_IOV
>  	.max_vfs = IS_ENABLED(CONFIG_DRM_XE_DEBUG) ? ~0 : 0,
>  #endif
> +	.pmu_sampling_freq = 200,
>  	.wedged_mode = 1,
>  	/* the rest are 0 by default */
>  };
> @@ -61,6 +62,10 @@ MODULE_PARM_DESC(max_vfs,
>  		 "(0 = no VFs [default]; N = allow up to N VFs)");
>  #endif
>  
> +module_param_named_unsafe(pmu_sampling_freq, xe_modparam.pmu_sampling_freq, int, 0600);
> +MODULE_PARM_DESC(wedged_mode,

wrong param here.

> +		 "Module's default policy for the PMU sampling freq mode - 200=normal[default]");

do we really need a module parameter? is it really neede to change the freq of sampling?
could it be a debugfs?

> +
>  module_param_named_unsafe(wedged_mode, xe_modparam.wedged_mode, int, 0600);
>  MODULE_PARM_DESC(wedged_mode,
>  		 "Module's default policy for the wedged mode - 0=never, 1=upon-critical-errors[default], 2=upon-any-hang");
> diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
> index 161a5e6f717f..b583579b0594 100644
> --- a/drivers/gpu/drm/xe/xe_module.h
> +++ b/drivers/gpu/drm/xe/xe_module.h
> @@ -21,6 +21,7 @@ struct xe_modparam {
>  #ifdef CONFIG_PCI_IOV
>  	unsigned int max_vfs;
>  #endif
> +	unsigned int pmu_sampling_freq;
>  	int wedged_mode;
>  };
>  
> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
> index 33e7966f449c..7140bf795cae 100644
> --- a/drivers/gpu/drm/xe/xe_pmu.c
> +++ b/drivers/gpu/drm/xe/xe_pmu.c
> @@ -13,11 +13,17 @@
>  #include "xe_gt_clock.h"
>  #include "xe_mmio.h"
>  #include "xe_macros.h"
> +#include "xe_module.h"
>  #include "xe_pm.h"
>  
>  static cpumask_t xe_pmu_cpumask;
>  static unsigned int xe_pmu_target_cpu = -1;
>  
> +static struct xe_pmu *event_to_pmu(struct perf_event *event)
> +{
> +	return container_of(event->pmu, struct xe_pmu, base);
> +}
> +
>  static unsigned int config_gt_id(const u64 config)
>  {
>  	return config >> __XE_PMU_GT_SHIFT;
> @@ -28,6 +34,32 @@ static u64 config_counter(const u64 config)
>  	return config & ~(~0ULL << __XE_PMU_GT_SHIFT);
>  }
>  
> +static unsigned int other_bit(const u64 config)
> +{
> +	unsigned int val;
> +
> +	switch (config_counter(config)) {
> +	default:
> +		/*
> +		 * Events that do not require sampling, or tracking state
> +		 * transitions between enabled and disabled can be ignored.
> +		 */
> +		return -1;
> +	}
> +
> +	return config_gt_id(config) * __XE_PMU_TRACKED_EVENT_COUNT + val;
> +}
> +
> +static unsigned int config_bit(const u64 config)
> +{
> +	return other_bit(config);
> +}
> +
> +static unsigned int event_bit(struct perf_event *event)
> +{
> +	return config_bit(event->attr.config);
> +}
> +
>  static void xe_pmu_event_destroy(struct perf_event *event)
>  {
>  	struct xe_device *xe =
> @@ -132,8 +164,66 @@ static void xe_pmu_event_read(struct perf_event *event)
>  	local64_add(new - prev, &event->count);
>  }
>  
> +static bool pmu_needs_timer(struct xe_pmu *pmu)
> +{
> +	u32 enable;
> +
> +	/*
> +	 * Only some counters need the sampling timer.
> +	 *
> +	 * We start with a bitmask of all currently enabled events.
> +	 */
> +	enable = pmu->enable;
> +
> +	/*
> +	 * If some bits remain it means we need the sampling timer running.
> +	 */
> +	return enable;
> +}
> +
> +static void __xe_pmu_maybe_start_timer(struct xe_pmu *pmu)
> +{
> +	const u64 freq = xe_modparam.pmu_sampling_freq;
> +	u64 period = max_t(u64, 10000, NSEC_PER_SEC / freq);
> +
> +        if (!pmu->timer_enabled && pmu_needs_timer(pmu)) {
> +		pmu->timer_enabled = true;
> +		pmu->timer_last = ktime_get();
> +		hrtimer_start_range_ns(&pmu->timer,
> +				       ns_to_ktime(period), 0,
> +				       HRTIMER_MODE_REL_PINNED);
> +        }
> +}
> +
>  static void xe_pmu_enable(struct perf_event *event)
>  {
> +	struct xe_pmu *pmu = event_to_pmu(event);
> +	const unsigned int bit = event_bit(event);
> +	unsigned long flags;
> +
> +	if (bit == -1)
> +		goto update;
> +
> +	spin_lock_irqsave(&pmu->lock, flags);
> +
> +	/*
> +	 * Update the bitmask of enabled events and increment
> +	 * the event reference counter.
> +	 */
> +	BUILD_BUG_ON(ARRAY_SIZE(pmu->enable_count) != XE_PMU_MASK_BITS);
> +	XE_WARN_ON(bit >= ARRAY_SIZE(pmu->enable_count));
> +	XE_WARN_ON(pmu->enable_count[bit] == ~0);
> +
> +	pmu->enable |= BIT(bit);
> +	pmu->enable_count[bit]++;
> +
> +	/*
> +	 * Start the sampling timer if needed and not already enabled.
> +	 */
> +	__xe_pmu_maybe_start_timer(pmu);
> +
> +	spin_unlock_irqrestore(&pmu->lock, flags);
> +update:
>  	/*
>  	 * Store the current counter value so we can report the correct delta
>  	 * for all listeners. Even when the event was already enabled and has
> @@ -462,6 +552,7 @@ static void xe_pmu_unregister(void *arg)
>  	 */
>  	pmu->closed = true;
>  	synchronize_rcu();
> +	hrtimer_cancel(&pmu->timer);
>  
>  	xe_pmu_unregister_cpuhp_state(pmu);
>  
> @@ -484,6 +575,7 @@ void xe_pmu_register(struct xe_pmu *pmu)
>  	int ret = -ENOMEM;
>  
>  	spin_lock_init(&pmu->lock);
> +	hrtimer_init(&pmu->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
>  	pmu->cpuhp.cpu = -1;
>  
>  	pmu->name = kasprintf(GFP_KERNEL,
> diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
> index ca0e7cbe2081..f718a5a2f44d 100644
> --- a/drivers/gpu/drm/xe/xe_pmu_types.h
> +++ b/drivers/gpu/drm/xe/xe_pmu_types.h
> @@ -16,6 +16,22 @@ enum {
>  
>  #define XE_PMU_MAX_GT 2
>  
> +/*
> + * Non-engine events that we need to track enabled-disabled transition and
> + * current state.
> + */
> +enum xe_pmu_tracked_events {
> +	__XE_PMU_TRACKED_EVENT_COUNT, /* count marker */
> +};
> +
> +/*
> + * How many different events we track in the global PMU mask.
> + *
> + * It is also used to know to needed number of event reference counters.
> + */
> +#define XE_PMU_MASK_BITS \
> +	(XE_PMU_MAX_GT * __XE_PMU_TRACKED_EVENT_COUNT)
> +
>  struct xe_pmu {
>  	/**
>  	 * @cpuhp: Struct used for CPU hotplug handling.
> @@ -58,6 +74,41 @@ struct xe_pmu {
>  	 * @pmu_attr: Memory block holding device attributes.
>  	 */
>  	void *pmu_attr;
> +
> +	/**
> +	 * @enable: Bitmask of specific enabled events.
> +	 *
> +	 * For some events we need to track their state and do some internal
> +	 * house keeping.
> +	 *
> +	 * Each engine event sampler type and event listed in enum
> +	 * i915_pmu_tracked_events gets a bit in this field.
> +	 *
> +	 * Low bits are engine samplers and other events continue from there.
> +	 */
> +	u32 enable;
> +
> +	/**
> +	 * @timer_last:
> +	 *
> +	 * Timestmap of the previous timer invocation.
> +	 */
> +	ktime_t timer_last;
> +
> +	/**
> +	 * @enable_count: Reference counts for the enabled events.
> +	 *
> +	 * Array indices are mapped in the same way as bits in the @enable field
> +	 * and they are used to control sampling on/off when multiple clients
> +	 * are using the PMU API.
> +	 */
> +	unsigned int enable_count[XE_PMU_MASK_BITS];
> +	/**
> +	 * @timer_enabled: Should the internal sampling timer be running.
> +	 */
> +	bool timer_enabled;
> +
> +	struct hrtimer timer;
>  };
>  
>  #endif
> -- 
> 2.38.1
> 
