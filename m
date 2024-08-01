Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48B46C3DA64
	for <intel-xe@archiver.kernel.org>; Thu,  1 Aug 2024 20:35:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C50610E0C2;
	Thu,  1 Aug 2024 20:35:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K0yBY5sb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6094110E0C2
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Aug 2024 20:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722544557; x=1754080557;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ids1Y7H1I0jJ2/oIIpqkquHzruYaAEutKX7XqI1SvfU=;
 b=K0yBY5sbIU1iorvgIKxjBgQW2zFWOL/YJi7fPY/18uSjMSc8DaX62V9Z
 jBiXJmuaYhBwXOnRuFOewL6HxgLpl2GBxVQZIFYkXaR3Ud+bkSCpFej0R
 Q8jqziVO5QWnU843TMeFs00r/Vs1g6XE0oLvVzKi5zzMn268jHQiXnIkO
 2ufF79Xwj8DhmbrPsS70IJIu/o1tMNPl4Jd1FEvMcLUEqKD1hq1CO4SLn
 lcmeQoOmRmDth80W5i1Nt+L5ky/FqoBb5Z/yjg5BjeLM7Cqf3fzX9YDx2
 tS77M9PVhRK+QewIMJAhYIU8pyV6qmgZsXcze16Xivpbla8qLR3ILIiL5 g==;
X-CSE-ConnectionGUID: eUxfIC/JQXmH1cXUtANWRQ==
X-CSE-MsgGUID: 6fHZirdcQ+Gka4wIIUK7Hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="37994061"
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="37994061"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 13:35:56 -0700
X-CSE-ConnectionGUID: 3eJToS+CQHiAbLtPCv22rg==
X-CSE-MsgGUID: yOyGd8JgS968Gw21aWJPpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="55082025"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Aug 2024 13:35:57 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 13:35:55 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 1 Aug 2024 13:35:55 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 1 Aug 2024 13:35:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GFWU1BX+lKMKKOFgWmqAy3035fGWuYYhPTu0ZGjqPQHDPWtwxS7esdul0vWm8gp2hDAHns4ElC0PxwmpH1aIfUHjQRgKClIJVdljjZbj3WoECVyfpng8qcOWXRqChX5W7JJqeGuHH4Lhmsizg9tVkjxhRfKCq88Kw2XOFB2bmx28mnyyUBdP/EVhFwux48XWPr/N99bdBGpQV9mnzRSCbOcjE4aLTYy0lQ9j1gj/wrLKDjuZD4NQk+TcGQkK3ir+ASaEnbIZ7WkxNN4cmxiOmez1Qo7cUR4kwDimSbcw+zIG49uK/aqhbt+S8oXVxG9H8Ji4Bk8E8ES/Eo+CWYNckg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Owjg8hZbGKfLxhQT78WbOB3YE9EUHcmpYHc4ezkdb9c=;
 b=AoOl1yvoQACbdIR5JsvknZp13y8TATt70pBotXsk0b93ddIEQd5V2qH6A/vZ4G2VpPAguOd3zScCobDs40YxZqf576Vq2gi1O2JjMJhN+1/yVb+HVmDqu6/CGSKwIXkZ8edqyNoSVRoFqr3gZ+AlU7bPHNTqpYUw0pdXEHAjf8wqkHJOdQv8GEp5sTPwQI+2jKMugIeUxLGEXP9ZWjU/8PmKrkbM2K4jn1mzjwMcRt0E0OHMFsxvYJb8zB12u9a8Ec61d9klb/oZFdY3u4U3/eyo4eSL74oqTxdXRnKiRlJHmymRUuJvcBPF/v8K3KGbk7h5FKajkUzxtz3tliivTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA0PR11MB4735.namprd11.prod.outlook.com (2603:10b6:806:92::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Thu, 1 Aug
 2024 20:35:53 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7828.021; Thu, 1 Aug 2024
 20:35:53 +0000
Date: Thu, 1 Aug 2024 20:34:59 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <daniele.ceraolospurio@intel.com>,
 <michal.wajdeczko@intel.com>, <karthik.poosa@intel.com>
Subject: Re: [PATCH v5 1/2] drm/xe: modify GuC CTB enable communication
Message-ID: <ZqvxcwxbDdyseSxJ@DUT025-TGLU.fm.intel.com>
References: <20240801055941.1187878-1-riana.tauro@intel.com>
 <20240801055941.1187878-2-riana.tauro@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240801055941.1187878-2-riana.tauro@intel.com>
X-ClientProxiedBy: SJ0PR13CA0027.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA0PR11MB4735:EE_
X-MS-Office365-Filtering-Correlation-Id: 37995484-7693-407f-8603-08dcb26989ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7V81uzJwHZwXlOQPcF20MCDOaggbQAYc6JLqy24zRwHo6Gt2VE1qmF5nX3s7?=
 =?us-ascii?Q?y9IgMI8ArBHCKw4ycnHOE06Fju+kNi1rRfqOzrynDGl4LBJzGGNDDD/aIIKC?=
 =?us-ascii?Q?GCrZYH906sosXrzQLGWlnQuvFZ0xAGp/qoRmUr1Ww9ewrGXAvWbe7jkuLa9O?=
 =?us-ascii?Q?+0aQ6a+dUZMASPQiUcd314cjR0YUTE/lwdufbtdfWhHH30jWK1XWVsvjdbZ/?=
 =?us-ascii?Q?am2jEyYok+2PT0QrbRcbPkEqMBrSFq3pOqYnvw7mr7IMeqdxE5rIDSW0TaF4?=
 =?us-ascii?Q?oB5KAPutZV0H9qTougb26MFJLrWoZ/DkEby1kK7L1iiMmoSprO+52N+wQlpg?=
 =?us-ascii?Q?rOwINVFRa1Hlw/InQ5Ryl6DhVTHAGItPCs21EjYPCWGJSMgVS5a6LAAOkiK4?=
 =?us-ascii?Q?oxmm0GN8R59oZz7m70AFw2gwoQbWBFdskHAK1uRZUY4/KoQdoI0bs554uNXJ?=
 =?us-ascii?Q?kRG+1GZYlwsJONTIZAhxSBZ20xIJqzIZuM6/OMDQSHz1DY2KuYuVIpkJGVHY?=
 =?us-ascii?Q?kisNkrkN/2ahozZZwW9QEpBjlXDM0ksIa2gfUNY7yQjmWxnEhcxd5PW65RBe?=
 =?us-ascii?Q?JUXv4ye+bsmOeDo0n9/h8P82SKq7O74LzLXVR0z2Pf+A3J+j0ChdLb3ArpVK?=
 =?us-ascii?Q?h9ycEHzJ5x7ODMI7juFmtSeIw9i+GFXlqMKYyxaVEXUVm/iJS/hnJx+DLCqh?=
 =?us-ascii?Q?ketpa61lsglQ6miaTpgZZ3kajpFCJwhfMhFM12Jz0EV1+zx0h+x9v6PSFqBj?=
 =?us-ascii?Q?MnDQ2xRY4cs8IYvwWozTBYbrIr2be4T0SI6F9vYF1+t8Glqjv0sViswltnCd?=
 =?us-ascii?Q?9QEeqLhNx338nKsMsNw8EUg0987G7jjdFI+PdXg+r5kBoVk0177YVcoOVKH6?=
 =?us-ascii?Q?3WCe2jxia9/LCnZMm8KjWuMfOL019kniv4JnPAhyHHdhcYMZ9MAPRFIsxm0J?=
 =?us-ascii?Q?ypVbsuGdM584pctEhP4ehpODUEtw6T/3huduiHln7lqOP/25/ceWe/AKnnfj?=
 =?us-ascii?Q?kyXUtU4IQiRN4BYzNPV0H/jmyGL5ll2c7756vEWfojoM0T2f+NNoGvtViYIn?=
 =?us-ascii?Q?LoF/HSmOOKs1yP6zqDa1mHZIojq0KyQDvNYNpe33Fvf83dyuV+NtaHXCBP9Z?=
 =?us-ascii?Q?KLMym1kPLtzhE+6rES4stYb2eGVdGolmLSmcPNJyJNWZVv01r9TOaBh9HhcA?=
 =?us-ascii?Q?J4U0QnZ+BUSTUATs/4KZQm0hsTpToq1A85l3nY/o8FRAuyWByYAnoyZJTosC?=
 =?us-ascii?Q?d0zxRV7YrbGPgzl1UyMqybdKOSmGew/7w3IrxBMMEfjo4JaTNb03xVcLCy5C?=
 =?us-ascii?Q?2bAiG7DKqX2ylTIw+8uVYxEoDYrkUgSwPPLmMBxnYkeQNg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hpOhsIalPBgbgp5RxDi9PCjRv+Pnsh9oYmfrYJVT5/z0UkADrXPy1RcHzwmw?=
 =?us-ascii?Q?LilykJVJag+UWdx3bMmCvJ44Z51pFoovJRPrCrlMtmTX7OCIpxxhEdJNAT11?=
 =?us-ascii?Q?MGJdRI+FHphhej71jMpLKPACqsyx0y+iaLX0tUoNkZ4x1rSSn1yjtWDVmkcC?=
 =?us-ascii?Q?sIZ7y2MfpW9uWxx6W9fbYrUlxi4FLn2MXH6UOoPon2ZPfBmYKi0QBwN7AwF+?=
 =?us-ascii?Q?tRXq8nU+FRdf2rcamXzwc56p4CyBGZWlpE1wk9OG7FY6oCw/BEDLIExHfEub?=
 =?us-ascii?Q?2NhiejF0vMGwQnH7fg1L3ekZXft9rARjLPefEkUgxmegXzXWq+F8+lIFnWph?=
 =?us-ascii?Q?rnuVy8hW0ulIpg9OvK9hfe/uSnPgjcprok9hXIWy1e345KhK2JxP2N8Gw1Ds?=
 =?us-ascii?Q?Bm1qDntuVjrmdMIFBZoxWV6w4JoZayf8Q81HoexugGFtipcIxrEyo5Na6WvN?=
 =?us-ascii?Q?bj4ql3FTXeFmdWOaev15ieFSV3wXM099PCi5PJqvaClWW7/zGoIVB/RuqteQ?=
 =?us-ascii?Q?mc99lmoy+6RafDr+phpNn/qoBMRGMpekSQwUdOKwA2aFMsOyX7wWaG+9Egvj?=
 =?us-ascii?Q?F3DPFGggGCX4zgRSCBDVYemrcgfm2LPKS58UxpLeN5XCEEBh5QNlJQozw0m7?=
 =?us-ascii?Q?8Kto8NZ3BM0LjEojuem+sPh2XRg6WhaZ7cYT/K8R+p2rqLoflmaAlI+c800u?=
 =?us-ascii?Q?pFV3GyCx27twrU3RmpxSoQ7JsxjfYBiytgv80JWG0Cv3jZ1l2wIsYER/XKEV?=
 =?us-ascii?Q?75gqkLbmp4FlBU0AVnpg16gVv8HIL/NEJkiL6cIoX0xxkB0ZfIcldckVzkB2?=
 =?us-ascii?Q?Y6Mn0ckL5gpYe9OqDDY4xnPvpxwNXFD8r0S59r8HXmPDKub8hdvE1bK4zlym?=
 =?us-ascii?Q?5Jc+hSj2mNSODmzgEjrxfLLgDIsCCYzwrVdQpMPafC1qLiUjfyaW6cCm/Zmg?=
 =?us-ascii?Q?NzdTntK401GpJzrlab32+tB6xA2lFkPL8BkgvBw7weLWfMPo1I3/oNZZSXTQ?=
 =?us-ascii?Q?xbfd2xsil0xooUZL+CbWPycRjecxxfH4KqE5PXUT5ekX54Srwhza2r+caKfZ?=
 =?us-ascii?Q?v6gh5yfPsoC7e1Q6mkPawvBoy1rGZ/wjEZy+TmHuSU/oE2qpf9udCmBArOga?=
 =?us-ascii?Q?15VLnjyYmEAm6uz/Ue27QrgDt+bk4EdrqWUtYRDunnh/08vXxFkkkArS7mhb?=
 =?us-ascii?Q?4X3R6Lf3OZP20wN4XFD+D+6RevVOgC6pnAkw8Kd3S2ySmv1Irv3HV0Gyub5z?=
 =?us-ascii?Q?umD5lnbKwrbHtqvOXgg4Llhd0gKEn8FkFmLWLOBIrwsZTX6JauoKfyrr18ei?=
 =?us-ascii?Q?cebYULlbjkDXf6inmwTaqG3mZMP2Aw5JRjaDxHEG+v6s1/cwBlPUbSORKdS3?=
 =?us-ascii?Q?e6302j2P7KkMvNdgUMOGTQNShOPzKNg1FJPsZ5ysmf1IjVuSF8pG8scbZZO9?=
 =?us-ascii?Q?8EJ1Ehn6Hy1amee4hx+AI+O23ad8NL/7w2eJIRS+OFEATwZGsVirFa3KMVP+?=
 =?us-ascii?Q?Apks/g3isEO6vppDs4qvEIF0jWgDqqBCUZFQlruwL2ElsRrw2Mc9lLP2MYnZ?=
 =?us-ascii?Q?bUiwyujGOskBo2rhtVGZjI1EUWDVR6tVzkkqipsLwUJ4x9aFS7NYukZUqAg9?=
 =?us-ascii?Q?eg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 37995484-7693-407f-8603-08dcb26989ce
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 20:35:53.4557 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LOjBwt6t7qbZZITxof6ArS63cynN07HqkhY86zaUKSM3NS9T2WVqLvgRby0jWlDOxukrQQjgPfeTzsM9LuXPIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4735
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

On Thu, Aug 01, 2024 at 11:29:40AM +0530, Riana Tauro wrote:
> Modify GuC CTB enable communication function to only set the
> CTB state if registration is not required.
> This will be used while resuming from D3Hot where
> registration of CTB is not necessary.
> 
> v2: split patches (Rodrigo)
> 
> v3: do not expose internals of CT layer (Michal)
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc.c | 19 +++++++++++++++----
>  drivers/gpu/drm/xe/xe_guc.h |  2 +-
>  drivers/gpu/drm/xe/xe_uc.c  |  4 ++--
>  3 files changed, 18 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index de0fe9e65746..1ff49318f001 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -755,7 +755,7 @@ static int vf_guc_min_load_for_hwconfig(struct xe_guc *guc)
>  	if (ret)
>  		return ret;
>  
> -	ret = xe_guc_enable_communication(guc);
> +	ret = xe_guc_enable_communication(guc, true);
>  	if (ret)
>  		return ret;
>  
> @@ -800,7 +800,7 @@ int xe_guc_min_load_for_hwconfig(struct xe_guc *guc)
>  	if (ret)
>  		return ret;
>  
> -	ret = xe_guc_enable_communication(guc);
> +	ret = xe_guc_enable_communication(guc, true);
>  	if (ret)
>  		return ret;
>  
> @@ -854,7 +854,16 @@ static void guc_enable_irq(struct xe_guc *guc)
>  	xe_mmio_rmw32(gt, GUC_SG_INTR_MASK, events, 0);
>  }
>  
> -int xe_guc_enable_communication(struct xe_guc *guc)
> +/**
> + * xe_guc_enable_communication - Enable GuC CTB communication
> + * @guc: GuC object
> + * @register_ctb: true to register CTB, false otherwise
> + *
> + * Enables GuC CTB Communication and IRQ
> + *
> + * Return: 0 on success, negative error code otherwise
> + */
> +int xe_guc_enable_communication(struct xe_guc *guc, bool register_ctb)
>  {
>  	struct xe_device *xe = guc_to_xe(guc);
>  	int err;
> @@ -870,7 +879,9 @@ int xe_guc_enable_communication(struct xe_guc *guc)
>  		guc_enable_irq(guc);
>  	}
>  
> -	err = xe_guc_ct_enable(&guc->ct);
> +	if (register_ctb)
> +		err = xe_guc_ct_enable(&guc->ct);
> +
>  	if (err)

err could be unitialized here and I believe some of kernel test robot
scripts will likely complain about this even though it is impossible to
hit in this patch or once the following patch lands.

Matt 

>  		return err;
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> index e0bbf98f849d..13e75573f7d0 100644
> --- a/drivers/gpu/drm/xe/xe_guc.h
> +++ b/drivers/gpu/drm/xe/xe_guc.h
> @@ -20,7 +20,7 @@ int xe_guc_post_load_init(struct xe_guc *guc);
>  int xe_guc_reset(struct xe_guc *guc);
>  int xe_guc_upload(struct xe_guc *guc);
>  int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
> -int xe_guc_enable_communication(struct xe_guc *guc);
> +int xe_guc_enable_communication(struct xe_guc *guc, bool register_ctb);
>  int xe_guc_suspend(struct xe_guc *guc);
>  void xe_guc_notify(struct xe_guc *guc);
>  int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr);
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 0d073a9987c2..fa98e9f22631 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -154,7 +154,7 @@ static int vf_uc_init_hw(struct xe_uc *uc)
>  	if (err)
>  		return err;
>  
> -	err = xe_guc_enable_communication(&uc->guc);
> +	err = xe_guc_enable_communication(&uc->guc, true);
>  	if (err)
>  		return err;
>  
> @@ -194,7 +194,7 @@ int xe_uc_init_hw(struct xe_uc *uc)
>  	if (ret)
>  		return ret;
>  
> -	ret = xe_guc_enable_communication(&uc->guc);
> +	ret = xe_guc_enable_communication(&uc->guc, true);
>  	if (ret)
>  		return ret;
>  
> -- 
> 2.40.0
> 
