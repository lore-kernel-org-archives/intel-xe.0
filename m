Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3916C04A94
	for <intel-xe@archiver.kernel.org>; Fri, 11 Aug 2023 00:56:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F156F10E140;
	Fri, 11 Aug 2023 00:56:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89FF410E140
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Aug 2023 00:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691715376; x=1723251376;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Ingyn1nhBT5tKB1wHbNyTa+p3wJ/4IY/FihON+scvOE=;
 b=FVxwPFKqLSWnnVSHa9q1qEnFgs/PZD0F7zU4m0ecahE1N7e2o885+vYo
 v0h/wS3cYdulVbSzel/0Y24svvd+maxVMMPPuppK40Uh734maYP3w+rb7
 /uZbQDee00sx3pvT6W78RSc1eDud/SjZB5k6pbE7QPqZGBE8FeJ8O9I3E
 u9Ofv2+PsIQFojf2iUZRfi2XkMpgkfsT7W2MnQlfeJhWnDumUiENJKAQu
 Jqa68UADo3a4ZKuWEu3nFUC1tDG3Sjom0YPGGowjhmbU+5h4ybTPlb6tw
 3QQH2p52+Yl1awPV7NPgfHRM+PARQNX0AKhJF9spuzC7DuzU0G2JjV695 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="369035413"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; d="scan'208";a="369035413"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 17:56:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="1063120279"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; d="scan'208";a="1063120279"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 10 Aug 2023 17:56:15 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 10 Aug 2023 17:56:15 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 10 Aug 2023 17:56:15 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.108)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 10 Aug 2023 17:56:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LNFPRVngty0T+L0MwtArrAbQrLPklUso/vQJSm2JUbIAFSDfzWoRVzDhf2TMdG9Wxnu08OyYpV9q+LwyqoSfCScvrunAKZcPMH6LNZVhW0Q/uxKdYcc24ziu/WFHlc2zb+f9BNfMS4sLIQcz36ycRts+FKu8SMvsKIAIPCuVNuaoDVqs2/zwlPAC3fEkSktHD7qOai7xjzYa8vR9P5DZ9M303YZASLrPNTll6z55rniyd+G8H4I3jEY9yHQYo+/JHyKa6Roj6XSf6b7J7bc7pcq3XKktS7+1zpCjBjocM1P0Knob7ys66/wr+XhrE66Ml8wFVt4wcOFpo3X+qXDXDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UROQmqLEIxW1rj6vWVC36GhVq6tY/yIPrKkPSU8Ynzo=;
 b=K7Uux5DHL9RUFm6GXN4sIZQpiRpWcrqyTRYTBr/c8YZ9/YLF7wE0y8lH6XqtrARledJ7kMRnVCbLn/Wso0yBF7PxfY65Kx+8C/c7ZhKQvKMWOG2vVc6us/SxSEmglP4MkXgs1+WW7JTlJ3LmPhnB0Qpzo7R/96gpqxVyogwbZeuEFxeMisgYZ6twPM68Qz6ZPs0L/B4QXU744qDKv2WhCcE202im8tBjc2nrJjzk0XWwGVYrBgheMnqiO9UNCZy4ZWi+AHgtpy/zSAia6siXdMqSsvyz9mVCEjMJqqlYBJRUolKObtZAZeYvZPrIpKVyKl9kDofi0AplgLhz23yfKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 IA1PR11MB6466.namprd11.prod.outlook.com (2603:10b6:208:3a6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Fri, 11 Aug
 2023 00:56:13 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41%5]) with mapi id 15.20.6652.029; Fri, 11 Aug 2023
 00:56:12 +0000
Date: Thu, 10 Aug 2023 17:56:04 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Shekhar Chauhan <shekhar.chauhan@intel.com>
Message-ID: <20230811005604.GC3375865@mdroper-desk1.amr.corp.intel.com>
References: <20230809064213.375269-1-shekhar.chauhan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230809064213.375269-1-shekhar.chauhan@intel.com>
X-ClientProxiedBy: SJ0PR03CA0200.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::25) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|IA1PR11MB6466:EE_
X-MS-Office365-Filtering-Correlation-Id: 375a486c-e22c-4f84-647a-08db9a05c217
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ONZ+OB5whZcmAAMRGiQMTXv0k8Y4byD1AVCrZLKwPwfvjL2fQrLHKpBKTNfebcPMpE/NZ1ZpIBgL2ZN0DczZ68TcFDODYBdSypgiECLH0JXskjCQzhZr6cN0IXq0Zfi250+Hdec64SRPnB/OnF7nJjYH/kT6eiLhWobuhrWkX1mhGNDFxWcbfdamFRecF42Qi7Z/vkOao6ZlADFP5vJI2o22TTTZ5vAQprEv+tbrmkDZbu3Jq7HneHU9VIMw2Qkmom2KKda+wc+wql1zprowETjnBuFtjY47ZvV799hmhpMXvDYZEz40fy/kzaMvjDAE5j/0JrR+8w0RuHOcXDn/lesAyPYuBp0LhzRL6mih3SAZCxlZV1Tig8Njuf9ONQ17EY/9s1EN1SH7AufN5PFNW4NYytX3/91KuVp7Hy3fRDne4+g3FZzqaaXWqLWevtIMSRDhZlcI1VbBWVXE3IkLKBcpigJGql+Dy0AadQYYKTUZzFoY2LMvrCGLZmKpSy7saBRhY/w6EVKXptwQtmkmrqG8KDJ5cDjHSMA6JNhy1qT97MkJK0kmU24fcvo4vJ0p
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(396003)(136003)(346002)(376002)(39860400002)(186006)(1800799006)(451199021)(6512007)(4326008)(478600001)(66476007)(6666004)(66556008)(6636002)(66946007)(6486002)(316002)(66899021)(41300700001)(8936002)(6506007)(1076003)(26005)(8676002)(6862004)(86362001)(82960400001)(5660300002)(33656002)(38100700002)(2906002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PCboMep5VvxQjgHd+wGFuje07WLGJr12IONLCVp39MqEb3ZKTYQohqXNKzV0?=
 =?us-ascii?Q?R53KVcu64p6cv/B/CJQ5Uk/GDtMtW7sFMctRcUwShx33oMl+YWqxnhLfo4uc?=
 =?us-ascii?Q?THCWH/iw7cR0x8JuTqI1AfggZlv4XepTToncFXnsN6HOwhgPPgmvywJWG4Pk?=
 =?us-ascii?Q?3FBXOoiBRhSlMXIzxSgYiZwnDobK61xDPQFOlar93RPZgQwiUIV0QCNmVTzc?=
 =?us-ascii?Q?hiPTyEUKwiNWyLRRQ3I36NXAW+kYlDBKDhHmBoWwQfQemIF1YrOuCZSKyMAE?=
 =?us-ascii?Q?Qtb+WuDnmO2apvAsMU6PiJ4xTe/ocQtpIDtQiMQrwcjNSAdKiNU2I/WOvtMU?=
 =?us-ascii?Q?p8xdYXKbP5DSlkyByxbHEwW4IvuWrEioNBEetefrPDuhlgtKMG78OFYVWjYL?=
 =?us-ascii?Q?oh8Y7oxGn6CNWNoKlOg+mxzRWHLkXOj4yCgqTIad4qxjkYTewKJ6jyc4Rqgo?=
 =?us-ascii?Q?hTC15+/UYTia7bigiQyzuMjUm/72xnrfnVdmho280zMuZFaHFez3Kyn+H6KM?=
 =?us-ascii?Q?aMUPlDDDhG6JvXuJtFufLYhbfpFSPCQ0u9zglPvNw3STls3BkMmvyLT0t1vd?=
 =?us-ascii?Q?3WF8NGoPdMVr+ySvHXJf19sMo1shgt37UIMA2CcO4eAnCQFJp4HTDetPn6tg?=
 =?us-ascii?Q?gh1Y4DsUngYturk9ix01qWvmI87DRE/1P1qu9cWQ1nycEeT2KO7LU3ZeUXGY?=
 =?us-ascii?Q?9V2PyPT6S3ho+aA/ioEh9qA/Mh3d7nFS9ZMaioCAVPyihHFjbMmO+seOg29H?=
 =?us-ascii?Q?0qUVibE84t2F0hPPS1siyBXl8CbLSvkfFLQO1+Xinrcu/7QcTbk77w6E7IbD?=
 =?us-ascii?Q?78tGPVdDcH/cibSP2rlH0xcswZEXsD1bW8+aT5NAl0cwlRmTLUY/HSnXXabh?=
 =?us-ascii?Q?nXffKSsAxQJLgYIUAeceyBcRVxHsczrRdbiZm/jBaVFMQfGlx+y5yhJvmPBD?=
 =?us-ascii?Q?ek4KHDgVwy9PwED0QY7lRkJKxqi6ef7Z2Ik5oKJo5zAEsQw9PILh9T7X8P5w?=
 =?us-ascii?Q?WC2bwHtkEJK4moqLymQl5442ksHzUSI92iSvdh/DLJyQ7g3q9w0vcO/wXs5m?=
 =?us-ascii?Q?0XBlaqO17gmzVCuOZo9ZcmARKouuSEExjTY9P2K+b0DBLW/9fnUJ3wG/v1do?=
 =?us-ascii?Q?KLGLlcH9xQj13WQAr8kzYH6OcotpHFGEznrQAB+cXr/gzZyGsxTno8Z5yHku?=
 =?us-ascii?Q?XtZq3D2xBnPAdaQISsCamrpJoq7QV+KlIrzemcgOqywRjFRBOOSYz9c+Iid/?=
 =?us-ascii?Q?1P2kw4Unh0KdW4MUBfWBlbYGEUWWWOrjyFsFW+r5bIADTTxCFnG3hWcY9Fd3?=
 =?us-ascii?Q?8SIXkqtGMaaO4PSvEisVviIMlsotYWN8hoNgectWHFby2Q+q3SWjUNBt7DW/?=
 =?us-ascii?Q?xK/FBjZDexXv0LGm1q3EMAeGLtoorJ2P91lnbSjfNDsx7mrjlFsPtaDPZdJ3?=
 =?us-ascii?Q?8rBLbcd5fy4NcbZ95rVE6gB2BfPCRE01CC8BOKUTHOmRo7IRDoX0q98x7NUn?=
 =?us-ascii?Q?43ZeUH1woksemcSQKLOvSGm1Uk7AfN7KVwEAKVdu330nsEqBE951Uc8gNcpw?=
 =?us-ascii?Q?8XgowQYIy3/FIPd0j1mnILkKweVDaECXzRWTgMOcaXd1ZovRorIwkwaeFMsB?=
 =?us-ascii?Q?3g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 375a486c-e22c-4f84-647a-08db9a05c217
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2023 00:56:12.6379 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Unuu3KKMeqH06cCqUL38m2hlV/Hn2RZVAMbm2KWoc0R+pldB7u8o26quZGjj1H0as0WpSKxm4SsSsgtIuColdRo0iKw6whkT0fC3Nz2enK0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6466
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/mtl: Disable RNE in SF Unit
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

Generally for workarounds like this, it's best to just focus the title
and commit message on the identity of the workaround (e.g., something
like "drm/xe/mtl: Add Wa_15010599737").  Trying to explain what the
various chicken bits do isn't really advisable; generally they deal with
such low-level details of the hardware that the explanation doesn't mean
anything to the people reading the commit message and doesn't provide
any information that isn't already included in the registers' macro
names.

On Wed, Aug 09, 2023 at 12:12:13PM +0530, Shekhar Chauhan wrote:
> Workaround to disable the round to nearest even in SF unit
> 
> BSpec: 45818
> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_wa.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 36c80e9fb758..9e511ba69878 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -602,6 +602,10 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1271)),
>  	  XE_RTP_ACTIONS(SET(CACHE_MODE_1, MSAA_OPTIMIZATION_REDUC_DISABLE))
>  	},
> +	{ XE_RTP_NAME("15010599737"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1271), ENGINE_CLASS(RENDER)),

We actually don't want to program this one in the kernel driver.
Although it's not well-explained in the formal text for the workaround,
this workaround is only intended for DirectX9 workloads; it's not
supposed to be applied when any other rendering API is in use.  Since
this is a non-privileged register, the userspace 3D driver already has
the ability to update the register value and apply the workaround
if/when DX9 is being used (and on Linux that's probably going to be
"never" since even if you're running a DirectX program under Wine or
Proton or something, it's being translated into a different rendering
API where the workaround doesn't apply).

That does remind me --- we actually need to drop this workaround from
i915 on DG2; the details about the DX9-specific nature aren't super
clear in the workaround database and only came to light a few months ago
when I was having an offline email discussion with some of the hardware
architects about a different problem with this workaround.


Matt

> +	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1, DIS_SF_ROUND_NEAREST_EVEN))
> +	},
>  
>  	{}
>  };
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
