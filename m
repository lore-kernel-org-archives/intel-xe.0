Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF7B4C4345F
	for <intel-xe@archiver.kernel.org>; Wed, 17 Apr 2024 21:40:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 236B410F734;
	Wed, 17 Apr 2024 21:40:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I1ZJpY5R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59F1410F734
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Apr 2024 21:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713390043; x=1744926043;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XTT3JN+pDIg/P0cX/UY6HaUFj6Lln3doPdfKjIdaeQw=;
 b=I1ZJpY5RfuCnJk6KQEkBOWG/RHPVGAKoufPSobmGPQYWl1wuvpwjteRm
 jh4w6ap0ud+tmxCRBcxx/2xbLDVl1zvTfbGGzxIfWHcHHYW7zQZ7C4qdn
 mds56sWHqXZVbtsdtAyiVCq/UhRIdblwRFkOhY1Binpe+s7sVtGQadFge
 mQav8WPqK7vUbwD/K6CUW/36qn6RZpQk5qUyBcbTJwyC/iovoTpRs1+11
 dfBGyb84pevDZMcdzFC56SmaoBB7lB9b2jTEJyVSIV28PFscdgJLYEGtg
 UeuzcdvQ7qVH864gRfLVB4oxMc+5QoFfuR6WReYaL5Ajo7w9vmIjZNYpR w==;
X-CSE-ConnectionGUID: CXjhW3y1Qj2lGMalg4mrxA==
X-CSE-MsgGUID: poFWPHSoRPqAQ2EhjrEN6w==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="19612026"
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; d="scan'208";a="19612026"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 14:40:41 -0700
X-CSE-ConnectionGUID: IZKsa9VdSsy6IxocLLh0WA==
X-CSE-MsgGUID: p+NZXM4UTzWDmQCgiwMJ+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; d="scan'208";a="22640262"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Apr 2024 14:40:38 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 14:40:37 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 14:40:37 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Apr 2024 14:40:37 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Apr 2024 14:40:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mj4ANHTcYyvyWuzSR5ZheSvFWVIybqqNLtAVr8kt2ROLRWStbpn9iewsW67SpXQBxwB16PEXKcYm3T+LvRW0LjeCQgf7ri3aqovMcpraK+Pss79esQMDjlP8bqTzKA/zbw9fEXl5FUiFn1Ktza/40OYfXroB+Gj2X1jTeHdwumMxn0pfYypKrcBh4iaydJOY+IWghDNTGWLxaDeBgLgSLY0z0ScmTDZEcpIGLI2aTp02XKkxyal2RORpMOdnPpsCWrz9OOsWsMPzcH/XKy2VYL9EoIozg7FsxRPBgLRQ2FtY5hBk7ajZX++u2hb+lIx/G8S+ZJcrA7BD2r76rnuMDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EX2sXIdFgsoSwNiCTfGDjqUoMNfErkPTxCBfwIZ52N0=;
 b=Yv7zna+nfgUUv+Q3cclfNgFjYEjdmwAujPFRDwCMwqX7nWGYgccSZxF+XyPYK8iZq5w5rwf0ERNfOwlD3XJ12C0aas6ny67DzFugCcmEEfnrRMc7yQrAPJuSyZWtSwdMhoTt53GFAYuR8AS1jPkD3Y/beZWgiQWa7h+bbMUi0UA/rGqV5lxfCLU/yanKDhxRTqWXK95wB5pd0zgvSNNENoDXTSmmVFO8zwllXeaDxSQCUz1zEjI80BEYZQFFXYfNgp5XWSb5CxDfyEO7mUwdxd1fDXsNWjr/ZUVg0umqL+GW6VtjZsgbV6GLBipuV1n+Yd/lYP+hJJ/MXw5H3dhN1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB6008.namprd11.prod.outlook.com (2603:10b6:510:1d0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.39; Wed, 17 Apr
 2024 21:40:35 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7452.049; Wed, 17 Apr 2024
 21:40:34 +0000
Date: Wed, 17 Apr 2024 14:40:32 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/xe2lpg: Extend Wa_14020338487
Message-ID: <20240417214032.GM6571@mdroper-desk1.amr.corp.intel.com>
References: <20240417212501.312346-1-gustavo.sousa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240417212501.312346-1-gustavo.sousa@intel.com>
X-ClientProxiedBy: BYAPR01CA0002.prod.exchangelabs.com (2603:10b6:a02:80::15)
 To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB6008:EE_
X-MS-Office365-Filtering-Correlation-Id: 8129b65b-82d5-4deb-3434-08dc5f270379
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5mzOzaFnFbFUFxUBUpNmz9Gp53vWUGaCJs2tc5L4Q7bviwyvYttc2ZV6s+DS?=
 =?us-ascii?Q?LL/SJN3Q72zkezJMZABytOlKhpNE68URXj3qkSiGBU9O55i1MlovuKINJdsB?=
 =?us-ascii?Q?XdMCVisSzITzRkgIthXRILBj6mXLtGHWExuDEisi73+ufewNti38dVgVhOCl?=
 =?us-ascii?Q?2Th6St1lWo7F/Etowa1HQxQnYX47vU5RCZyZ2QtP2aW+n6Gz9ocUTpNAoS4j?=
 =?us-ascii?Q?kBI92goqaT5nIZPUMa+fXe30Gmer5llO7Wo4iSMENXPlksX7u1JLKXpLgdET?=
 =?us-ascii?Q?Ipu3kan8/HlnV4/ncox5RhvKYe38pz1xBXmtDoYsYs2EKzYlHbsxKLp+OXwU?=
 =?us-ascii?Q?clntNfl4PQ18w5RPeYR7SE/Shl+82kohRai+DhMVwcklCeyF0d5yVax42a4o?=
 =?us-ascii?Q?roClxP/3YaDRIHMItXHOmUpAiL6et6QaE4WFR9pTMXOQyN//+Ey6gNgoidd2?=
 =?us-ascii?Q?SmjjMc96PA6EJVyGLojHZJjVGDOMo1p0KRrUw57KMnvceSJa87w6wNMgdYfb?=
 =?us-ascii?Q?JTP9m9p74LkjHlHYRlAAgg9DFulyTD5UPJPQwqUQt7Oq9EZQR+Bzg64KKS7z?=
 =?us-ascii?Q?JluchQFIeb5f9h3Oezz/j5oZFaEGdH+GIDnZXSalKRwm5/bwwueWZsYGFJYS?=
 =?us-ascii?Q?U7bt0GLDwtE1BTaohkFw9TYn+XFcEbxJAsSae3AfnxP/ozRq7gvAjaAoXBeH?=
 =?us-ascii?Q?GGWZXQoGyjCZ0VmP7vClkFIyUjfWHfA6yWDuOVDTbQyd5bLgBtqS0L7KjFLD?=
 =?us-ascii?Q?UHRa+WLqkKkA8ISrfGkJdQfCfxWgPFVtxm5nkdetM7dw4pORnbiTkZFiToxU?=
 =?us-ascii?Q?FO7tQBs3vPz+dqzRe15IIJYdXqZep6oDzqeKmufTKMc+MQDYGEzjbwcSG69P?=
 =?us-ascii?Q?00rVO0ND/uxSYcyMYlbA6vE2h6PRcZd667TrY2FixHVuKppOpAluAmlHUr+7?=
 =?us-ascii?Q?bq3JQdZd6Urx+h1WO26MHwUV09yzHasrBpnX2y9oMXzDnccpRrhaDwjRz574?=
 =?us-ascii?Q?mZ9hC0O0tyWEITImQEBlmc3z8qFf2nCLn/I1MERoO5FIK6GzQeNiobJJwwwX?=
 =?us-ascii?Q?vObGeHQYMORcJ07mecPWTE9U4NBd9/Ag9QaYjAn9yEhC/+0MIfN6sIKczqCE?=
 =?us-ascii?Q?nl4cZ1KG1UwQ2m9tCTtaDZ9xMRB11HJIjwpK1vv4GNKCrMIYdg7ZdsbdTjXI?=
 =?us-ascii?Q?Xs4KgWKfo7tcxUscM8HVeVgPBQFoLlGMxUyfu0UArtB3XOiGr9SENct80QzR?=
 =?us-ascii?Q?PFFrcwOD6+r13AIlTT6HOctg6w5K5gC5NBSRw5exNA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N5oD26R6nJA2s4VGGVl2gjiyQkDds1/pCdFun10i3o9Kwh4nGGRipLr5NF46?=
 =?us-ascii?Q?EAZAaHBkAKeblMgrScxszDMnNvkxyUtuE+XBHlBZpiCBJIULSiun4Q6E4+2i?=
 =?us-ascii?Q?TSAX3b6N1ODeKGZEUQAQ0oYIQKWJVGcyWiZmUAP5czw3G/V/JLRvoPSKr1Il?=
 =?us-ascii?Q?i+E+0xwuXDR9lf/qoMBtCxoPocgbHOX3UeO99u6MIrX4fQ/FRV2gi4Dt/Bk/?=
 =?us-ascii?Q?thxrzvxifou2fMBZeFIorPvUB6aIZ9O0KvyK0UhYHD3S+SBTROlAUnY3fAUx?=
 =?us-ascii?Q?i2bA/vOaLrpz3qnkfJm7NZrUcKDC7StcBEhtM0fAtx6L1E+nzTn/n136AmOk?=
 =?us-ascii?Q?mRgUHWdfLeJkyu+rM/PUmSHTeaJpxqPMLSa+/CgBPP8wxWtD8QExOtueV37F?=
 =?us-ascii?Q?mZEcaspScBOt7Wfq5y2zJm7qBkiwBX5xqdGm0aecDAkrIhzXpcLEPXNZO3rH?=
 =?us-ascii?Q?2cfrGFpxeanz+E2EMXV1pqUPUGvJpd2Y625K7UmG6t+2A6PXMpulCpUDPjph?=
 =?us-ascii?Q?/QQgQpMKB9q3zR0zQGNDsDIjK2jMGbyUoq545s/lGt0y55LMGb3SkgK7jb81?=
 =?us-ascii?Q?0LSnkF3Zun828xo41mYmPtSoXqKxymhRS12eDH1HKIUXR5zGaQVi876DHEl9?=
 =?us-ascii?Q?5GkVVTW55kGajXQzNJahfdbvgE98JNwtD3eVB805BJRulFeQ63c2/gGm0GLc?=
 =?us-ascii?Q?JM6AbWobQ3NEiQyYKrekV1xKwCpSXhSfpj3z+JrH1+nkPtvriNpCjoAWIaVb?=
 =?us-ascii?Q?EKON/CD2UvJUPA3UlAA+su0+ejRTZb9X2rsGnBmyijZaUEb5EvAW/AmQOzRw?=
 =?us-ascii?Q?sBgbJK+bsz4CcGdmxxHfZkvV1V2ypgoJO2yW89dlUcfsiXQIuOVf2Tt/3MzD?=
 =?us-ascii?Q?XntuVJbIPkRkeXIzJUtIB1gfKISgUwndPQXTZxomzDMyRIZpc43lPInfVumu?=
 =?us-ascii?Q?okucNUuYV7Cel0psaAfU497CZh6pgp5E6GaFIM/cTuVtOMwrIcfQk96CDyRZ?=
 =?us-ascii?Q?JvChTg0p6NJtLwElW47IoH19vH9JsPBk/kTgQ9ZxZirMaxnOfyxzxiyJXkjx?=
 =?us-ascii?Q?TowAQyC/11LCQVk50RZO5lOCxB9qjR9sEPhM6MVTxaxnylVHJySVCCtsIuUg?=
 =?us-ascii?Q?DV5HP63hH8n7LwprzFlXmYPADD6kywJUBsbvvmRnG3HJ+kdAUnd6UzmzMwhE?=
 =?us-ascii?Q?Zva9ifF8HfMvXm8d8hdm+TaTajuDqUbGZVwzqGoZ9Qo/pqqet11xF46uxODL?=
 =?us-ascii?Q?cWrV5zxtzzBuhaj3cSl2ZCEDnl7FAnd2wEoQ9k6wa9kL0mMOvipVgMZqFBNh?=
 =?us-ascii?Q?uLKKFEOTs8ShWDnLhfRl+WGt+6OCN2XP0FFmy5jvwph5awkzPskxkltswOxH?=
 =?us-ascii?Q?BpUGULPha2myH8gTVB4rGS4X0X08VBLXkpD44oqLnwmAKcK3uCT2fEg+rwlE?=
 =?us-ascii?Q?06TjFdtyVBmd5pxXBAC4KIsSrBvWcEDBpX74M+36oU6IUlkSF2NwtmEEdcsz?=
 =?us-ascii?Q?kKLqhVcMaPgNrZ0+NFN1gol3/h77OPw7iT5LIhC6dZWkOT7cXJMFd3ckzzgj?=
 =?us-ascii?Q?qB2L9TcysmNtYTahQ2zLqR4UeJr2XzRryfgQLEwLOBROw4NVSdKRmPyUZ8Ol?=
 =?us-ascii?Q?zw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8129b65b-82d5-4deb-3434-08dc5f270379
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 21:40:34.8795 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nBtM2wjotDZI8B7g/ADrhLEcOX1anHSgSDOio9OFoe0nOM8sW/a9dX7ve1eZBK/ezu6SWACDv6cx/8blC2Y/eWfTjl0gYBxI9m+JfXsFoCo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6008
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

On Wed, Apr 17, 2024 at 06:25:01PM -0300, Gustavo Sousa wrote:
> Wa_14020338487 also applies to Xe2_LPG. Replicate the existing entry to
> one specific for Xe2_LPG.
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_wa.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 632bd9066f8d..dcf7ed51757c 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -445,6 +445,10 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN5, DISABLE_SAMPLE_G_PERFORMANCE))
>  	},
> +	{ XE_RTP_NAME("14020338487"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(ROW_CHICKEN3, XE2_EUPEND_CHK_FLUSH_DIS))
> +	},
>  	{ XE_RTP_NAME("16021540221"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0),
>  		       FUNC(xe_rtp_match_first_render_or_compute)),
> -- 
> 2.44.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
