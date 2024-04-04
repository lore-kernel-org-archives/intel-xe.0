Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA1FFCD1292
	for <intel-xe@archiver.kernel.org>; Thu,  4 Apr 2024 15:22:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F80710E8BA;
	Thu,  4 Apr 2024 15:22:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d8fOg1tM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C317210E8BA
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Apr 2024 15:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712244174; x=1743780174;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iRMmW5mTcNOtW8fnUlgz3NWVP2i+ufg65HifeJ1YWv8=;
 b=d8fOg1tMbSib9gJ+uPea11H8T1neJ1cFw9lIC4p6PHiwpEDY/3O7uk2N
 +Q+kK50A0ezRz6UlbyjuT+T6wP40lkzDaab2VJllBfpRyDVUd/QgFtpKq
 aZRLjg2LuvHsYAJjXzq38vLdhOop0hMG/I/tYx4t1YyZ30uHFW52fPSoX
 nB2vHOOmpR0nvx0Fq5kfJm0q8WwH9wusljVgq6m/rdwdXOTEs9726MDdc
 JfUuVUxcs2MV8gr/uNTZpv3t8/P/UOX680Mr0Ee3PVMH7UP+RQZefWSkz
 gtCrG4bkAjZQqF8n7hOtVuTxnAmjToKn+Kg29Cye5q2MxSiwqb2jRUsaj Q==;
X-CSE-ConnectionGUID: ZvTgTvAcR9ekzgO/GPY0Ww==
X-CSE-MsgGUID: v3n3ng9dS0eDv4PnbHLtQA==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="32931609"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="32931609"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 08:22:53 -0700
X-CSE-ConnectionGUID: 1d9f3VamQ92z4xnXocUJRA==
X-CSE-MsgGUID: 3dfGoUjyRvmRQ/iypk+KsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="50042546"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Apr 2024 08:22:53 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 08:22:52 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 4 Apr 2024 08:22:52 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 4 Apr 2024 08:22:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NYgQ7pZyp4waSy0ECATC4IXPdNPC5wpb5GMS4Ar+sRnQ5ZOLTxDTkrLFpTibwy5dy3vOF3of3cohKpQqVOGyfyTTYAzFWudyCK0koHi7aH+7778l3QHt9freoBQA3t8TCk8uK/JuX6Uv/Htsyum3R1oV8VS8/vG6fcm29xa0f1GGRWrW7pm0rhnl1WCKlzenwcLBRUyYrARbB5GAuhU79anSkBJY7DGyzVGlzeEYQhk6epNmviRBRAtBqt3JsT9XGgE8GYh1MvBvaKi5DG+mmnHjkjGY8HXW3sI4A6HOeMaToV1T/8okYJZ6FLrbHL6qcshaVMOrTAUpgFExYm/sxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I42CN1nMuzWZfdJEdQ4N6q7Na2vzFx2ZF2HhL5xy6Fo=;
 b=jy4A0yQr8BA2Pty9mbk0f4Qqfv0xYmm2rledP5F1pJ8Vv0pLmUI91yxtLKSQSU7eMXjmU7dcKNP2sHdNx3YQAIuTTHuWhR42DLHjoNSxGDHhWjllxAjefknaWLrH+75y/Rm2TYIx3+359gZDlEDgZm8ezQhAUyYGuI+jnpRDVLEoJ3E0s4xjxMQ9pjz2FuSkUNecFTbt84qy0JiVomM6xeYo3r+Qz8OWAOHAzzb7Dan+qdRMAtJ/nhEEwM70/64IL0CuO0OPe2YvvOvd7IZIYqQJL/bdM4dbnKKciHdiYthW6784bK2rjfECD04EYuX8K9D6vMweC3MdXxYrTuacfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA2PR11MB5033.namprd11.prod.outlook.com (2603:10b6:806:115::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Thu, 4 Apr
 2024 15:22:50 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7452.019; Thu, 4 Apr 2024
 15:22:50 +0000
Date: Thu, 4 Apr 2024 08:22:47 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Zhanjun Dong <zhanjun.dong@intel.com>, "Mika
 Kuoppala" <mika.kuoppala@linux.intel.com>, Dominik Grzegorzek
 <dominik.grzegorzek@intel.com>
Subject: Re: [PATCH] drm/xe: fix multicast support for ADL-P platforms
Message-ID: <20240404152247.GA958162@mdroper-desk1.amr.corp.intel.com>
References: <20240404-mcr_adlp-v1-1-d13aa64245d7@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240404-mcr_adlp-v1-1-d13aa64245d7@intel.com>
X-ClientProxiedBy: BYAPR08CA0017.namprd08.prod.outlook.com
 (2603:10b6:a03:100::30) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA2PR11MB5033:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /k2dDAWV9AkBLALD5fmYRBKjx6jePLSMuY1pv/R9qo6vXBu4WgaMeO1Ya0t8PQucqvONKfG8BKWzhEzTvQRqumXH1RIiehB3VwtRC4NA97nJndA9PmVzQp7KmVkcCG3zhIBS+lJmvNyk/HT5QthMagZ5YCpt6NCWP/jpUftJvkv4yUbJcZH65SNXaAcl6hLnzWAOj/IbgAvR9TiGVNaMfa/NG6XsLiIAVII6n0ZfMtZer2wS3017F2fsV9P210CfKH8KvUAPd6L4mUDu//A2zVhc4nHkVyiIeLfBNfFXuDH5iqkoMUi53y5SKPTQyWwSAYvsSzi9mClQgIhR4JuxuMvAD9l7pyxKBmQQ6ZY+0xZq06WlodCmufW/YI6L0jl3RnhO/uiU/OLXMQYBMdhluC5Kmbtehmpre0nnhKAbls4gSo1WjiFPIBb7kjmA5z+KQKCP84EUxlI8w3v6VkXHSZgEVH735KwZhDeTj32DYpu4sCu3o4BetXLi/ICpzUsdwPu9KHU/fJPdZ1E5qXM7DFFS9v8ivawQwE/qlmXAtvIh3rMM/MMe0JjUCHVGbPcly/YIin1Pe1hYa91jAzI5VFIZ/eNAfYX+AiYGroTbPG8QF5Rslr4SqJ7zwB4973bsCgM1EqZ1eULGSQXL6EGa3sDQ2tt0x+RDFGmgfc0g0ng=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fgRQtdHJaG68ml3zJEmjyNpTk3A35Yux5TfHXA0B4fYsngXT0+S00tLHXQ4L?=
 =?us-ascii?Q?gPSV/e6XdxHCb0dP08Vf2kJrjc+YdE7xm1RbV5DRLmqX0X4v+O0CZDqPXrP/?=
 =?us-ascii?Q?TuPUQl1E/Cwh7jnjMXHIuD3WRHqbnYsfZz89yiufx0c072v/b8+es9c2rpB7?=
 =?us-ascii?Q?rNBbjAkvHkR88WkSUxGew5sofZtcNl3nKlt0XRopx60W9gNsGVD9onmk1S5c?=
 =?us-ascii?Q?I3n2qFsCmQJ5dG9KpvuDmbPeaguD2ND8rVRUa0GbNrJiXwhtYhQIlPEx3oQe?=
 =?us-ascii?Q?BX4gWIxNLRU7/Cpjf9EeyXGOiA9ucaCb6oNdAqNiOAiT0piJBoRrtI3GQUbm?=
 =?us-ascii?Q?L6ziUwet3zQ1WbczCxBkcAi0K+/xesEzstWLcwDO32pWoA2qQZ9KjCTQJ67A?=
 =?us-ascii?Q?/x5/Qavjm8a4nBWP781D3Ww6qjNk4zcgcclG62eLnEdrMFPYTrEiv83oSQ0W?=
 =?us-ascii?Q?ulCzHmL0SBv+YoMit4lt1yFfFaESTuyFAqmcnEMI64iRzavzMIWDbFknxV5D?=
 =?us-ascii?Q?o4F/K7tINZed4GeOH3QoG/mdHxlS2w6xIITeqa9R34g4czvlLuwpH53prjsV?=
 =?us-ascii?Q?l7Y0kqF2gT6zz2xpZ2umCLJz/CtouL27IjK/hufbczCc3rCOx8AjQgGYCatd?=
 =?us-ascii?Q?I3CNbwli0Cy971ic2ISkrTRKwo2bWGnbHU3tIUHSjY5CMfTmwDeDVwVbrsjv?=
 =?us-ascii?Q?gtuPeuy6LvkRBT9gjqWFUKGki28qO62adriDRM8/6gBZYbxjBd89UHrchaXl?=
 =?us-ascii?Q?JS6tuuRv6pOAKR1B00jeCALrHcrjlOTx5PAIrl7qCwN2pvxNlxhCww3hnfHn?=
 =?us-ascii?Q?7UkbmOE+QIYIL6oEcIjLaxovEH7dAOstqcLWtlxtUF/Wzoy3168cqnLZFES1?=
 =?us-ascii?Q?IOIhmd/u6/e85uWXJ/UtXsgGJe+C7ydDMNlmYSj+9hcF2vpzKqtUh59hJq4B?=
 =?us-ascii?Q?SIElnsK2gBnpbFp8RnBc9apCnv+HjWI8uJmgCsO+L38Qrqbz3j+39VFEugEW?=
 =?us-ascii?Q?RpELnCXeRVxAMChIv/NVmur9GOg4GAF0hkZ1DPGX7su00ox4N/gC0USMTQ4k?=
 =?us-ascii?Q?s4Vztf1eJIGhYfj/nv5ckEcuESraVbo+/MLWZ13xN34271Z9WPNRCirUbrv7?=
 =?us-ascii?Q?qEONrDANuKLLUN2k2cfN7eXvyqnrvFLNWsEk6UhQ6c96skkMfoYCfB8eoE3W?=
 =?us-ascii?Q?vR6kPZkyptCrPJAYxVGhQ0ezYKLDb0oLDVRcWw8pBHvHDyBUhcpTVvz55PKW?=
 =?us-ascii?Q?Eneb0MkdvCOonPG19TkiejEkutd91yYEI5DWtg4yw0rMSWMs59lvkALcDlWb?=
 =?us-ascii?Q?Q+iV2tqGp7Ls9jpvHVernz4ZPg3/xWMORT0QAipe17YciFhr8gkHxpPq0SLq?=
 =?us-ascii?Q?MBG6DWJHGrC7y3m8meF3ignc6/UxFQ5w2RZTpCZjQxcWVchB7Kv7snNQtAgn?=
 =?us-ascii?Q?dfkIJ4F4RjeQNy9TdPa9431OPlD/JEOY3bKTiMcrMDDyA22NYxQEtbheU2E8?=
 =?us-ascii?Q?pXKsaUdxCWT+e0IY7nNm/M4rbdUk2Fs5lVnAwuRjLVsXxmdCG7VbMWFyzp4R?=
 =?us-ascii?Q?O9BE5PPi8tOVHOo86M0cij2u87FKEmopOsDC9Stm92SFRYbAB7tKysba+3d7?=
 =?us-ascii?Q?/g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 41462292-9a75-4d1b-1343-08dc54bb16be
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 15:22:49.8773 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 28xy6I3RR40kKMdAJjPJEIemP/E5BF9XKydkTt7O5fQafzrATrrDyztqhvblLZ8uK75doea0NlloGpH8IO4gtwAoF9jziTG8awFHokmdw08=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5033
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

On Thu, Apr 04, 2024 at 04:18:29PM +0200, Andrzej Hajda wrote:
> ADL-P has six sublices per slice.

The code change is correct, but the title/commit message shouldn't say
"ADL-P" since this is actually a fix for all of the Xe_LP platforms
(TGL, RKL, DG1, ADL-S, and ADL-P).

So with an updated commit message/title,

        Bspec: 66696
        Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


Matt

> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> Fixes: bde5d76785bc ("drm/xe: Add helper macro to loop each DSS")
> ---
>  drivers/gpu/drm/xe/xe_gt_mcr.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> index 866bbd26ba3f..577bd7043740 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> @@ -297,7 +297,12 @@ static void init_steering_mslice(struct xe_gt *gt)
>  
>  static unsigned int dss_per_group(struct xe_gt *gt)
>  {
> -	return gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4;
> +	if (gt_to_xe(gt)->info.platform == XE_PVC)
> +		return 8;
> +	else if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1250)
> +		return 4;
> +	else
> +		return 6;
>  }
>  
>  /**
> 
> ---
> base-commit: 34820967ae7b45411f8f4f737c2d63b0c608e0d7
> change-id: 20240404-mcr_adlp-cf548bc8b633
> 
> Best regards,
> -- 
> Andrzej Hajda <andrzej.hajda@intel.com>
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
