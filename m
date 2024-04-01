Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45E1DCD1288
	for <intel-xe@archiver.kernel.org>; Mon,  1 Apr 2024 16:41:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0857B10F2E4;
	Mon,  1 Apr 2024 16:41:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NISxNuam";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D621610F2E2
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Apr 2024 16:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711989671; x=1743525671;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sImKdlYEBfbR1ygpqV+bFV1CAqHCAo4ygd1kt8RInYU=;
 b=NISxNuamEWmT68zvbFYShyq1nTz1vB2zenAeWgB/9bJgFBVOimh5vqm+
 yctDzeSXu7BAggfRHy/KIOIDx+0UgeULdizixJkFgGluuswmC63roPQVk
 TAtstJ2JnZ244PZIz8lewXfCoExMRBjCLT48qkOZtiWQDJkDQzi43qyO4
 sGYO+3G2mGc1X5JkQ3eJQbs4QXesQWuORlV8+Vk77jrZViPILW7X9CFvd
 aaWA8dcMGwcautXjIFauUcDRaK3p3p+7Gg3VXWpKUaXmx0aenI6fwafw+
 VdDtgV10H6erkK0/cmLV8l8v+Wlfmj1a3dCMWTtnq3MVxm6z45buTom7R w==;
X-CSE-ConnectionGUID: bc50RokHTgyAnLEQ6zQXRA==
X-CSE-MsgGUID: Wibsaw3yTPqnyK6UqnUj2g==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="32526909"
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; d="scan'208";a="32526909"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2024 09:41:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; d="scan'208";a="22451121"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Apr 2024 09:41:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 1 Apr 2024 09:41:03 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 1 Apr 2024 09:41:02 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 1 Apr 2024 09:41:02 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 1 Apr 2024 09:41:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F/5EwJCWcb4mzTwxRqk/uMz84RAx40L8zukcvzDsgF476YjqXAOpkK/pPdLarEx1vk3GN2TznkV93qbivtPlgbAYkRTYvanQ3c1LeMyhWXN02nCkUde8ll56hpQOXQGniHS19rz0HsArWiizSiEaq85Nth3k70Ni+T+xnMBbWS4QKxhn+jPuYVdQc9/qmtaTSx72ATiaEpttSub+xTMXe44uLwPhQfWc03lzcpuWHNpgtv1DOg40sJ8mPmWixHxLnxqb9RE4DTZ5TLb3wkfR2rHVE4O3SBLHZ7P4esl9sRMzRooFqg2KRa+kLUC+JLBk2hWhlofNZbOH67UF00zPBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mqxyTO0VREUZkW3juJxo9BGlL0uBltdXdaSr8K485lk=;
 b=NrwW0ZQKnDDzcqDDsb+5YWBGexca7ewzkVk1uuC8qmmbjz5FY4Uw+ByaxPmov0B8+tGXqB7NaeXjDKCSxFOG2U6UE5EuUYGnJt4nQ8Hx+Y+lLNEWSaCneN4PQAonM8Pj3OeJyGqziqafrJvAM1qo3INSCCYpyrj27kDleipdU7tDOv4FHMIb0X/8zyy3hho9osZBXExUTxsjsvjsv9bEE/WQZKfLuSxZkjl5DWeg5RwMV5dNiwkk6R54EcQSHrPxtvQpxpCB2jQzxidcsaIPVKN1sax2Bd2phn3p6GxFKj8/wV/UKYzV7rBSkPAc+xiBN0/otkaf3GUqHxqpQueAHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MN0PR11MB5988.namprd11.prod.outlook.com (2603:10b6:208:373::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Mon, 1 Apr
 2024 16:40:55 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7452.019; Mon, 1 Apr 2024
 16:40:55 +0000
Date: Mon, 1 Apr 2024 09:40:52 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v3] drm/xe/xe2: Add workaround 18033852989
Message-ID: <20240401164052.GC6571@mdroper-desk1.amr.corp.intel.com>
References: <20240401163806.3821128-1-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240401163806.3821128-1-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: SJ0PR03CA0244.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::9) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MN0PR11MB5988:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xvQOIHXdXlquZJSVl4+EBgdaZgD1XzthBMupQbMtZfciS0eTdQogUeo/UuLZ2vvlE8/RciBNfTpO10tUMenj8MPsWEBflFjgaD8O/zQL7CRj0KX5i8INhP2aCcSd7S2W5FCqvBguPvxP2xbrr+5XKC1xaaOREYDh29p7QIOiboMmvj9xroasD4bexj3RG4hVThYhdv2b5mOX1GkvU4MMCtQ7tD2F5kikZNmB3tWu1+FDuimuHsarVX5wTBrNm1nvotjJwkA59mZXsNJAN4480MmIbgu3HBCOjF2Oa6bkxUc60QiTn8TxdpokE043+KHVzRePpL1JfV6EApg738wUzycMj+vIoT6nvsSNpx3zulMYQdrp4JBLPvy5gQNFuF9Tg5HTLuNxtpRiTWFudMWGHuSh6mlGKCgRl/oIerHRAnhSLF9bTHVs2XIcIUaB23xtkMw5qvLLsKOX/YfYDr6UXr2TPtiiFR3a+6xXrqjENOi0D8yRbkuF60nhykPy43FgPPKfECR9MUqJXxurUU2fm9LKHVC9jgqrfM7mJh3Q3SQCqasPXIgpIXACAM4SHSLejxGBBR/22rQXQZJHZwh6Q9xmLSLrqa2fqPrMYmKeoC6yUuFQaX+av6U3VX0Qf9BFTbJWjCAvUBTqtWTE2o/WXA2D8MeLVeUjB+nKr8uGUBU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?j6Nj3s/vtQ0vz1TwxTHjryRAPdqVkY4/At6bSA8GIP2Mt512+ISCk+yLIsqX?=
 =?us-ascii?Q?36hLti2cz5aiL1NE6GYw7+mWtWlm1po/KmpaJS68WIShyAQtl8T2co6IKyDm?=
 =?us-ascii?Q?f/H3Skxn+1t7LmxOLIbdxPBOtp5ra/jRAHz4h5UMyXMOt4+ovypbbCgMj/HD?=
 =?us-ascii?Q?pE50iuNBrMO1fBMVlgODJ5ygdoYMtH8HEIn/HrvLn5YuAqMOIjLYjqzKYd6s?=
 =?us-ascii?Q?RSLYnug+6ZnPhGmYAwKkAs7eY58rYfC7dF8u8bpi0OOYpeGodYgOmLco0iYH?=
 =?us-ascii?Q?HpIE9NxEu2dUoOjSmwMlM+jwHv6XmySFWW/A55558A7HauPwkMbHoMam1qXE?=
 =?us-ascii?Q?cvD0175MbvSu51I+KKqhBkxMBjY4+cJ1Lk7vFOx+5FcDPsGeZ5j/wuSry3zx?=
 =?us-ascii?Q?j2nYllUVhC9edTIX5CEKNtzSI9YcXuI39QaBcfNFNmcuV4XUgAvG5Rpq93Qp?=
 =?us-ascii?Q?+QZ+JVdIh0hKoonHWT/wDfo5FivBjpvK5Y4ygWMt4HDWj+VFwnLiVPXGnXAZ?=
 =?us-ascii?Q?NxMoUzjciXmSYlqq7RfCcHE4GjfndBpqRCrwkRAFjhR90i3pI3mCvhT1Nhrq?=
 =?us-ascii?Q?hNo2cSmIpGJ7JxMM6VNMQ9Zd7kECgH3UtmLIfY3iJOFdmiJ1gQlUWpoah4/A?=
 =?us-ascii?Q?FmsiusJANEBaf2ioc++5RhBlm5GKkk5ZAD2L9xd3WYkoVKC8YBO1W82TTsAf?=
 =?us-ascii?Q?AvAkRqk08CyeRtvNOQ/XcRYNXboXxtrBKETRmbVaYpCq9uSruhGcSold4tpI?=
 =?us-ascii?Q?jNGCrKz+GlqZRoagA9ybs20mJU9PnYPUp7Gfn9qsc0WeGisDSdODX1dIsQeg?=
 =?us-ascii?Q?QJqzkDx+5iM3pzb0juhWCc+F05vvUd6nxfzaGKqG7XhjcEq7iLd9hhX2eP2F?=
 =?us-ascii?Q?ThWdXofrb5aoVjT8iFhos4bD0l1uVxP8PgvAvVmMvCti58aC9txtoyHVJ5Im?=
 =?us-ascii?Q?NuT2J+JF4hKLyumbm7kpOAgBDTvTuO4n5rPxrs+ZmMBstS0MLx0sBjlevDf+?=
 =?us-ascii?Q?xTJISlH7TJ58xn1NHV9fzsHDDsuOGQ5Zly0YdjZKGZub9pIglFhUJjSWvrZ7?=
 =?us-ascii?Q?NzQ+IcXfF53lmmRMcfnjnnzUqMcEkAT3DDpbMmvNESVUgxFbsVZOnCGgbM05?=
 =?us-ascii?Q?BivFaKrZjQjxYXoeL27oNz7yGvLN070A1knlyYWesEiX8BBvtsE0xDT+GwKG?=
 =?us-ascii?Q?IjoCigwlHRm3gt3nfpdqNKz7gXEBtf8AAByJemtnel9wUu+/N7qfM3GixzKr?=
 =?us-ascii?Q?hVOwMtkNOfGr3JUKwefd1bVfWzq+OPMDGcebHQPZhCAgfc6KS3BhtdyL8Hcj?=
 =?us-ascii?Q?K6D+xfdOAg4IO5ULK5bQS3mC7YyGZ7dFxWigkg4NpyLZllhLLXjVArSHmMeN?=
 =?us-ascii?Q?+74kO2EBQ44YvSmv6IGgmL20as/XNp+OEtdu7iQLdixcwakYsCj4hYuG+CBg?=
 =?us-ascii?Q?yqozk50x6dEl2fHcU49gd98i2Vb0NyBrueG6hXN7zcFpcPvPQiEzz0Nyi6AN?=
 =?us-ascii?Q?wdYjeQu6nd44kImzV5eoHYPjimI1SsqoMwqXaA7h4MVAh45TJJORqWqDcfkI?=
 =?us-ascii?Q?YP37uMNRA61C4GqzEd4VBUGFFM1zTtjj+VCwOZu+KkMFmVHocIV1xXsE8m/+?=
 =?us-ascii?Q?qw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b4777a0-9716-40a3-728d-08dc526a8037
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2024 16:40:55.2318 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1qBEBfbiFHdI1Qanmc4a6qfw4twO8fYsBb+BvPGcp7U24f1zJ8DT8w+hYbfEWI9HMz4piNATvgM/JpZOVoo/zMUXiqargNIWRiXZ63ofqSw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5988
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

On Mon, Apr 01, 2024 at 10:08:06PM +0530, Himal Prasad Ghimiray wrote:
> This workaround applies to RCS engine's context, hence added as
> LRC workaround.
> 
> v2
> - Fix commit description as lrc workaround instead of engine.(Lucas)
> 
> v3
> - COMMON_SLICE_CHICKEN1 is a masked register, add XE_REG_OPTION_MASKED
> flag. (Matt)
> 
> BSPEC: 55899
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 3 ++-
>  drivers/gpu/drm/xe/xe_wa.c           | 4 ++++
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index d5b21f03beaa..6617c86a096b 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -97,7 +97,8 @@
>  #define CACHE_MODE_1				XE_REG(0x7004, XE_REG_OPTION_MASKED)
>  #define   MSAA_OPTIMIZATION_REDUC_DISABLE	REG_BIT(11)
>  
> -#define COMMON_SLICE_CHICKEN1			XE_REG(0x7010)
> +#define COMMON_SLICE_CHICKEN1			XE_REG(0x7010, XE_REG_OPTION_MASKED)
> +#define   DISABLE_BOTTOM_CLIP_RECTANGLE_TEST	REG_BIT(14)
>  
>  #define HIZ_CHICKEN					XE_REG(0x7018, XE_REG_OPTION_MASKED)
>  #define   DG1_HZ_READ_SUPPRESSION_OPTIMIZATION_DISABLE	REG_BIT(14)
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 74b33a3845f2..c904e55ced9c 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -579,6 +579,10 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>  		       ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(INSTPM(RENDER_RING_BASE), ENABLE_SEMAPHORE_POLL_BIT))
>  	},
> +	{ XE_RTP_NAME("18033852989"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN1, DISABLE_BOTTOM_CLIP_RECTANGLE_TEST))
> +	},
>  
>  	{}
>  };
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
