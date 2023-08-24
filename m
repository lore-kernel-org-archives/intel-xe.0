Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F93DC3DA6F
	for <intel-xe@archiver.kernel.org>; Thu, 24 Aug 2023 16:08:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B31010E59F;
	Thu, 24 Aug 2023 16:08:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7988B10E598
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Aug 2023 16:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692893322; x=1724429322;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pFeDudL2GIso7b9O04+7kjUQQlS3p9RZ0xSTqHM5EMs=;
 b=n3BA/vqfyiC4NO1FKbHQPFUv0XYiyU5ulvOb6MQQET+jd74jjPncNNxI
 ciFP5k30BasQFABXjpyxIenpLi4HJyuT9HtF/uZjnO4t/GR1b88owyhmf
 7maroeiOxtgmDy57IfjsuTSeIQ9U9ixk8lbZDoUbuZT3jna5go/tWp96v
 L0krKpyRfDw0oOy+6DLr8WmFp28NX4XLwu30Kb18EJLxWQTjkeC5s3l/B
 6yT/du/q9t7hPYoqmCHfe6C5A6PA0l2hLYusGDvwXfpxB93aygFyYftKd
 yHtW4PCSu+XdrrVwz1SC65GjI/TCU/zQYSXdvY7kSEBtQz79LHuSv4KjM w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="405483339"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="405483339"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 09:06:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="807174362"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="807174362"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga004.fm.intel.com with ESMTP; 24 Aug 2023 09:06:59 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 24 Aug 2023 09:06:59 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 24 Aug 2023 09:06:58 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 24 Aug 2023 09:06:58 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 24 Aug 2023 09:06:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=icv35Tydzkm6y4qRQ+rsfK3fkgtmi/GPk5hUOSAQ+lVqsmVnz8LTIcmBwIokFKmZ5bdwTrk+fXJAjwRumU0l5LYw5wx5TYmRRbQfdE6FewkDVcXbUgC+kRIlYB2zIaW6z/7AjnattbGlxvaMl2yWmvA5ekfwGS8ts/EnWM0yW3YrdGpLW8ANZMzR+jkTlxGCgp9s9VQ9BpyMMv7YVQEki6MRg/YGtruonUVjpTKkY6//y2iSzBeqE+zCTlUL17fuqNfQwlyMPPWPbd5CekfjNlSdyL46oiEQ1u2OixEagXqcDR1PzyGUeZtzd5SvhpQJ+eu2f/PlQki7QRtXNXtlcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xJkPv3btGOF18EEBe/EgCK8P0hvaM1WHb0CsXP+ufyc=;
 b=lyFhbYAIedsOAVk3CWFIPDCnuvemqYcOrOA/9q5Kj4emzJQlYGRwf/bhqErYrV6fmOn8yI8rJPFBsVBRdKZrh6Mt13pUqlAp5ILi6u+X0AqTRpREvUwi5eHwRQwFzH8UvJQr0/e28x7YZIYwgSEt2IFkP3WqsM6YoVDtfNcqwwerCyNOIslwadtcfvN3X6Zi0yQ1qImqGmpaVRlyqTeLdTU2HDwHIQ5ZIOYdhQg//S/UA1E7jTZhzbZZnTfdQQ3ICLa0b2yj8hkJFbtiGKlGBCrpNVq9trJqGu3Bsm3uHPODAvNmMJTSKJvF26/m/KOggnMWn3bRcvXIVemZ1Pbf9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7854.namprd11.prod.outlook.com (2603:10b6:208:3f6::5)
 by IA1PR11MB7175.namprd11.prod.outlook.com (2603:10b6:208:419::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Thu, 24 Aug
 2023 16:06:55 +0000
Received: from IA1PR11MB7854.namprd11.prod.outlook.com
 ([fe80::c66d:c5f1:1ea6:74b7]) by IA1PR11MB7854.namprd11.prod.outlook.com
 ([fe80::c66d:c5f1:1ea6:74b7%5]) with mapi id 15.20.6699.027; Thu, 24 Aug 2023
 16:06:55 +0000
Date: Thu, 24 Aug 2023 09:06:51 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Message-ID: <20230824160651.GV1529860@mdroper-desk1.amr.corp.intel.com>
References: <20230823114040.31769-1-niranjana.vishwanathapura@intel.com>
 <20230823114040.31769-3-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230823114040.31769-3-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: SJ0PR03CA0171.namprd03.prod.outlook.com
 (2603:10b6:a03:338::26) To IA1PR11MB7854.namprd11.prod.outlook.com
 (2603:10b6:208:3f6::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7854:EE_|IA1PR11MB7175:EE_
X-MS-Office365-Filtering-Correlation-Id: abee1c18-da13-4335-60eb-08dba4bc22ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3mOY4Cy8av5lJIu5b4OQTeT7fCuCkME/ppsxydCpKrW2T47r5vN5zBh8QcWzQAYA1/Vr2ljbOQ0X8U1fmO0Z/IfUXtWpiEVPcktx+dE0Q4Ui2vjddaqzAC7JUEfnKMXL9w1pHiE5DWwK16M/rDMYbDB7bxozzEUTBQ6fAdLLB60Pe6Mw32Cyd3x1kBLvZrhEIqh/nOjUoBxBETEkmaEDrlV+eilxBXMlJ3ouAb5fBXO7eAlfHS7CeAohpwfWl2Jj8vbfNpCVxUORl6n1Znr2WL34NJNI/UO2Q07sjBBUoAoksrihw8ze/2Zcv578rlELEip8TGV36r/ZquAFrApsgO/Or1j3g2EBe+eh0WjJ/2++m3kfaLkr4RWLnQzq21ZM09JsLKee8ys4g2o/xtdxN/ennTd4Qsq1Cah1voHEMVIcXTMyGwIeiZf84X7xOq8KP7LMZfsFsoEYpznDVivPniL4nZ9Mtm3d0siKtF83hVcvZHNHo973D4K8j1fpoK9LFl/kLsUpMogAgoEFBeY2Aq/bfT1iR6vJcdL9Qc7CIP81q/Vm9FJwhL7cZv7UBy86
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(396003)(366004)(376002)(39860400002)(1800799009)(451199024)(186009)(1076003)(83380400001)(6512007)(26005)(478600001)(5660300002)(107886003)(2906002)(6862004)(8936002)(4326008)(8676002)(82960400001)(38100700002)(6636002)(66476007)(66556008)(66946007)(86362001)(41300700001)(6506007)(6486002)(33656002)(6666004)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9SPunER6l8uC8/4rY9qYmmwBgyHox/Ny5iY5TqfZHX3FH0Bx/aJxGB24ODPc?=
 =?us-ascii?Q?2bThkB5wuN0vyqDUo/uVuBX6AtLASJTWwGYPCbPFHcA4UsKqP+L9lJZwGba1?=
 =?us-ascii?Q?oiCc2Jp5CIobFhY8E006et+s22wdjeuh7z+goTFivXLjW0+wOVydTycfDUXj?=
 =?us-ascii?Q?fpyn32acjEkhiuk6XUF3adjBCOvF8HCigwSglxVXwpts6wTzmFpmpSC4GWSf?=
 =?us-ascii?Q?bFp6+pzMB0qgbgBrA0PGIDNrnhnjUzij3EHkRqf4+zmxUYnzCKxzJV1m2kEC?=
 =?us-ascii?Q?sW1h0LvGBr8U2ZgT6bYrx1PCA6f7mwpWq3b9U8BY7poiWcu2nTuW3+swJZeh?=
 =?us-ascii?Q?TsqgtbqjNBGxRfJ10oiUjTgReP0CDzsdnOXswHlTZPCXL7FXEtZ/XAJ7tqTi?=
 =?us-ascii?Q?nsZiRfs/qo7v8aOPXyKJm0bmV+DE8oro0iC1+iKQr+xW82HbOsJ655oo08KC?=
 =?us-ascii?Q?EmJtcaAp9at50Vzx6JCXoGFh1Vlpv9Buu/Hn2IBzihM01NmpFTre3UjwzSVH?=
 =?us-ascii?Q?GTkpP8g1ggH/1+p8r0JTtqzTrk28CG6OgOF9z3g3IMAHmkB2g6k5urQmte7Y?=
 =?us-ascii?Q?fTtrU88sGAbYRmElJ67YSU86B0K2YajmsKydyeNHBWvqoiqMM3a5p+NsbkIs?=
 =?us-ascii?Q?95z6DUEJQ5N/HcduRZZal5BrARa3C2RYgjBK04l5IqrC1RxNom2Vd/FCJjOX?=
 =?us-ascii?Q?3XuwnnC8/SjWsJqtNp1AStE5Q5HXaREqVqsWCmSc1tjqAmoSc0vns5s6Nbx3?=
 =?us-ascii?Q?FfCHR2R+vjAzDckBNKBpFPsBxRBAqH9P8qbkJ5RbL0BGfrL/fxqrXE0Fovok?=
 =?us-ascii?Q?CwZH5aKnX1mBSRcTrvvOJex41kLewHtO/ilu2paxDyabDKQLEwHaNLuu+avK?=
 =?us-ascii?Q?s1YNKUvxwIKnvHai5uVlcyHzR1vBiijPknEdz3uiJ+y0UdnE8C+SeydaQS7J?=
 =?us-ascii?Q?mXR9reCZMouSE3Oxpovq6e5pXZ7CHOKkGkwSQsOJlOCqQbDBpBXdfUQet7JY?=
 =?us-ascii?Q?rBIlXcSlIG7b/uJZT6MimlZn/Hx6mZw6IVeB1MISZjo1iOvz6kZ1IeWXl8EI?=
 =?us-ascii?Q?wQYDMen+rMFcCA4PjnXrOYPLwrSXuH6vgXTt+SEK2d1cBMJW1bCjdZh3yBVB?=
 =?us-ascii?Q?AIF8gXr9iFL/F5o4XfCtWUUnl09Oav6ejXzJyhMUcWMKsxru6Z+Xkx/Iigf9?=
 =?us-ascii?Q?VX3uhnRU9YAGsrFdm7SPuJ2zRrFFZmrXFnKUMpoc2nFUijdVih93bROcWXZi?=
 =?us-ascii?Q?FZf5uNDY11KzwLY1DpVP16tK4YxNlNFPNm4Qlub/yJr3SQ/flOKIUgz91x3c?=
 =?us-ascii?Q?jzZP/aBbwgfrVtsD0FqBP2EqEH11byGGMaqbYT0Ea078MvKH2HDiTr7AMW9g?=
 =?us-ascii?Q?BC5j6gSb3P6UOQM9qmfRbgH8625uBKN5GdiU8YfS98b/GsQhbFXHddkFNHc1?=
 =?us-ascii?Q?G/Ct0JgOeCK9bNpDGKHRkhj1L0F/ZHsdbdWbTAlRlBgMv1Pk8tUxWyYoMaWL?=
 =?us-ascii?Q?y1ZUBKOkf/1xZCeIogKG4dOYSdNOvVi31xKQwL4sowCG3jVpYDovBDgIQEYr?=
 =?us-ascii?Q?PhXvN8kFAn7RT2q8M76NPVuNQMpKv062o/S9KKit9v1LKEx2b1NCnVWDejXX?=
 =?us-ascii?Q?wQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: abee1c18-da13-4335-60eb-08dba4bc22ad
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2023 16:06:54.8041 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5dWlli6FPfR+xTcobysBkY70X2n5YkuzzH/hDAde1Dik93c+m1dSjUnIQpeN6W8i6keSMQQiEn+KW7V9DnvRmUaVogndAUn9M4xe5gXhkZ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7175
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 2/3] drm/xe/pvc: Force even num engines to
 use 64B
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
Cc: lucas.demarchi@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Aug 23, 2023 at 04:40:39AM -0700, Niranjana Vishwanathapura wrote:
> Wa_16017236439 requires that we update BCS_SWCTRL
> (via indirect context batch buffer) to set 64B
> transfers when running on an even-numbered BCS
> engine and 256B on an odd-numbered BCS engine.
> 
> v2: Move WA from engine_was[] to lrc_was[]
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h |  1 +
>  drivers/gpu/drm/xe/xe_wa.c               | 10 ++++++++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index 1a366d8070f3..806755f31241 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -64,6 +64,7 @@
>  #define RING_BBADDR_UDW(base)			XE_REG((base) + 0x168)
>  
>  #define BCS_SWCTRL(base)			XE_REG((base) + 0x200, XE_REG_OPTION_MASKED)
> +#define BCS_SWCTRL_DISABLE_256B			REG_BIT(2)

Minor nitpick:  we usually add two extra spaces before the name of
register fields to make them stand out from the register names.

Aside from that,

        Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

>  
>  /* Handling MOCS value in BLIT_CCTL like it was done CMD_CCTL */
>  #define BLIT_CCTL(base)				XE_REG((base) + 0x204)
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index e2b6e17d7ec4..f45e9452ba0e 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -604,6 +604,16 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>  	  XE_RTP_ACTIONS(SET(CACHE_MODE_1, MSAA_OPTIMIZATION_REDUC_DISABLE))
>  	},
>  
> +	/* PVC */
> +
> +	{ XE_RTP_NAME("16017236439"),
> +	  XE_RTP_RULES(PLATFORM(PVC), ENGINE_CLASS(COPY),
> +		       FUNC(xe_rtp_match_even_instance)),
> +	  XE_RTP_ACTIONS(SET(BCS_SWCTRL(0),
> +			     BCS_SWCTRL_DISABLE_256B,
> +			     XE_RTP_ACTION_FLAG(ENGINE_BASE))),
> +	},
> +
>  	/* Xe_LPG */
>  	{ XE_RTP_NAME("18019271663"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1271)),
> -- 
> 2.21.0.rc0.32.g243a4c7e27
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
