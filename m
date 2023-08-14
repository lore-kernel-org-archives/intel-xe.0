Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1522FC001B0
	for <intel-xe@archiver.kernel.org>; Mon, 14 Aug 2023 15:06:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDD5510E21A;
	Mon, 14 Aug 2023 15:06:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 134AB10E21A
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Aug 2023 15:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692025563; x=1723561563;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Cg8etKotlR872H28Qbdo6kz3bB2ThiaDsxDsSME02j0=;
 b=P0djBoJY2bGbANHs2Ygv1q/WBZ2ucu3nkZHCiqZsz6JMTVXrc85iMdYv
 43JqPIACWeAPjnV6mUUvmJFtRKgtBvTnaEHZUnhAsWtNF6xqQhOiXOkyZ
 bseg6yGyAfF2xbtLY2k76SZRuvaW3FDy8t3s8SfSN5kP7cpFqVs582CXk
 R0FY9LmRall97E+wMPqgsFpd7MULMn3AGXyuVNjpaLii7eS3NONAJzr33
 QABpORJ1RKU+QWHXAyW6Demg3msZtxsJeU86oLZRRFmuPybr0voNyNnMA
 5af4K67AvdhKD+uQhTsc0fhgzv6Qx/Q2imCV7Wqipl6qffMAsoYn0eJ3L g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="351654479"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; d="scan'208";a="351654479"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 08:05:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="876967462"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP; 14 Aug 2023 08:06:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 14 Aug 2023 08:05:58 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 14 Aug 2023 08:05:58 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 14 Aug 2023 08:05:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oae82UdEPgiTqXMboaw06ui1iRwPzo0RCuS1YjE7s+XTWIZXCUbW1g3e4yDg69gmUtFAmPzVSprRHOFvAtGhRhXYV6/5n6lZPVk42lHFHzdX+JU1JUz2+uRZfRVWnGW6W6eMREeBL4nwHl4WhawzOtBf93GCml6lzHtWZIouuozBak9D7twEBCyxGYHmuDiG9WAS67o8wlOyVztT8ZZ83HBRg/FHyvsZaA0PT0wPx4CTThQ/8VM9QwVkWFUqybNjseTTHWGujMb1jdtvH/iT27OlX7RNP6xjIIVNzXvrNF8ktDYxqPKJhHksTJ+AuFsyJMyzV0eo0JYeclpAvNSZVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pntaemn5Ta5rX+u/dlCfzE0Xyw/KhrfIlIU1NuWgQHQ=;
 b=YT0aRErNaj8dhVW9BHf2bSog0Kgdj1eDEGXFx10p/IQ7Ltz9JV9AG+YG0U9i5cYwlW7BUORhomrK0Aq92hzU0X2tMb7k0gkLU2KQuSXISxOz0LRrYMoxQbEPoZEr3ZvAgaSxzb+J2VKmmUHfpqRTRGQMHWi+N+YtjdGLsjTXzARL1CfKWMsL9yt0LNnsgfw6blHMu9e9RbqW7fGh+DFJ7XNEIxoIF4/wI53DfjS07sIdzvIvhDd4gLyIFwBljoKvVyvDYntGWZNh9ZsG6uu3WvqW7JJNoPXLy1lv99RM7I7gJAhf3B/DZyB/nZ3AvGLEN+PQxTAaDiFqFq55FVIHRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DS0PR11MB7334.namprd11.prod.outlook.com (2603:10b6:8:11d::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6678.24; Mon, 14 Aug 2023 15:05:56 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41%5]) with mapi id 15.20.6678.022; Mon, 14 Aug 2023
 15:05:56 +0000
Date: Mon, 14 Aug 2023 08:05:53 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Shekhar Chauhan <shekhar.chauhan@intel.com>
Message-ID: <20230814150553.GK209733@mdroper-desk1.amr.corp.intel.com>
References: <20230814150323.874033-1-shekhar.chauhan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230814150323.874033-1-shekhar.chauhan@intel.com>
X-ClientProxiedBy: SJ0PR13CA0183.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::8) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DS0PR11MB7334:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b3a4237-5893-4e53-2817-08db9cd7f625
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oY6OpI3xElcrMAnhmTQqrPSwMJ0MP3FEH2fyCHt+NSwZe3lm2K8cQhEKF50cetZqX8ykTmJTZ+rZZHeeCSiwtqy0CBFjBoQwgQ0hMbN5azRpRx8f7h1PjKQc0Wcc6RWvr1L91O4NlHNzEbjb6mC/0Di8cATRUmBOHLRb5Q1SDyqxugP5VNC2qWbuvHdyAx4HjPKLQTx0RYT5DExXNxRB8/OCL57EEi5hH+Cqs7brH6AKgIYDe71dLZlCfui2XhGZlw3HKCMeJbQ6Hw0fKEalnjSRz6KKhoAOyEKnqKZox0A0SmkeCTJvqXu9/hQqHmQkjM7tWBVjCmiE9EDO4je34wHUzxj9J3f6ITBfaouUhr9gAzGtOqyQ4e3bURaWuIn41ahK60LkMecKEDTr8fXlAPuZdW4LGgLWIoVQ5oshwJf5d1qkFb4ez6M4vDBLcq+Gecwo8U2chU+bJfFH7TGjnvqghHBEYCESakxpormR/o1NdOuPcly/HuTGwNLu2zgwt9lMyQ8jwLGnbc6S4nFt44FlCPZZQVvjNPJdupdq/0BnJ1RxrBSA0wmAriAQMmVT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(376002)(366004)(136003)(346002)(451199021)(186006)(1800799006)(66899021)(6666004)(6486002)(6506007)(478600001)(82960400001)(83380400001)(33656002)(86362001)(2906002)(6512007)(1076003)(26005)(66946007)(38100700002)(316002)(4326008)(6862004)(8676002)(66476007)(66556008)(5660300002)(41300700001)(8936002)(6636002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fjjPMdX9+d29puPia4b5ZsricrISRiQ1cpknU9wDPTmnSt4LV6vOqD+gjLfK?=
 =?us-ascii?Q?jvKJo2Zbz5NGfb0XkqlzUKTbSEXwMW1+VKM6V6P+WC5R13ZnA9GJkF3KAEx3?=
 =?us-ascii?Q?R4YXesrl6BuKMMilSimCX8FV57QFBq+0JH+RrK5myxVPKGlxesZe+7l0h9y/?=
 =?us-ascii?Q?63LnTlFTYB/+UZsZSNYUVn0t9Yhc5GNgrzN2FyH+kAwtCTF4a6tGi/qF0YeW?=
 =?us-ascii?Q?S9vgIP6Q5loeJij5Iwiy6+Lyt4NSj7WQaob0MiIKJQyO8xbneANrPKtRgxT+?=
 =?us-ascii?Q?p1/r2HZg6zq0JbCqMCJN32UKs0R7yiK8A62zobY5RwCPOE7yOfOTVLPk2CPs?=
 =?us-ascii?Q?bX9EtzeSVefLkhME3JsU+o6o6yh9Xqs4Rrld0dUEV09UqGeqtM0G8lX2P0Dd?=
 =?us-ascii?Q?5BVgXaOsGvMBOTZqgu3kn+T94icw5LVAxv7JSS1TtlBt4DooIdb9Sz3MHpBR?=
 =?us-ascii?Q?xlJsApAtPus3Q5VPGjnNJL/ZdN29e22u+G39WN+1SUbE9vOuwe1V6HeHleR0?=
 =?us-ascii?Q?7F7LkvwTQYDYn4hhvKqZZLSds8iiYfJ24hR0M24ADB19I/qONvUcdMrrwhbB?=
 =?us-ascii?Q?g+SSgIi7Dl9ugE6FEAE196WIXSuasAQ3/qAcVkOcgi+DaA4SQ9e8BaAMSW38?=
 =?us-ascii?Q?9VByae0ahzqT7RqBI4OBijOSzG9DQdyfZcMSuOjZkQA637IxHzMU5UAO2fXI?=
 =?us-ascii?Q?BwK72k7iFEvN5hqZABPYaVZz5VrbKW36olSEndKG2q/CxfV51rAPr6pz8lTS?=
 =?us-ascii?Q?ThQYQOPc0ikXVZFKqC2m44gsBYzDlLKbWuVvhJkpiqsQpZw7fhgWyUEZQqM8?=
 =?us-ascii?Q?qaJV1efrjLoG9YTdxP811FJz8OPB5wr+yWU6XtNR1vL0sUP2VdDbPRZd4asT?=
 =?us-ascii?Q?GXOh2WNHSQMQ8siG4AJgUtu3aBLGlzCMbH0ZIcJWdFTmTwtffkcpDjaa4lON?=
 =?us-ascii?Q?HJbQKzpLYZ3dgbD8swFkc+YUJpRE/qPeAwq9F8LZaRES2kvqCop9nq1nQo2c?=
 =?us-ascii?Q?bdoE1Y7XcEMhq3lQKfbsN4abtOvb3Jz+7mKymWXELWyxxCCpe8TFOuy/4MHs?=
 =?us-ascii?Q?m15oTt9U0wcdt7Qm9xheLJto23qJUz5ygufeVwv6hj2/fZHB8z9eiNEI3jNb?=
 =?us-ascii?Q?OAhEA+igUlsMTt0sxbfmYCN3U+qyowBIwMv6wxUTwlqeNh8MWJPQqo91KbMw?=
 =?us-ascii?Q?8N3yhfGt001DGlU2YuHnyifAbQeGNx8LDDN92GL4X962ODoKr+/4KDnfFX8q?=
 =?us-ascii?Q?GGKVQ9ZmkhtS6ihvgqmq5KiBhxQ/FQSzbeKdRofcb/lawGVpKqd93ECjRu+p?=
 =?us-ascii?Q?s1YSx4Fr+tt9R2Ww6f4ALAbB1h3w4CGsRac1y5OV56e+BfuIcHfMBQcBF/fl?=
 =?us-ascii?Q?3MaDfvPdnI41QyLquisVci+DRTX1J5TLGfUh31+l1aEZOesKj/RRKQRZ9/rj?=
 =?us-ascii?Q?1psSMfi7XpySuYU05TwF/4CdwWCB/iymI1x/3+GEOm4NXM6U1iagZ2qaj3AC?=
 =?us-ascii?Q?WUeQ2mFw5ZRIq1mc8o8T/ebETpWc2TXVo8moFbAFDzkENt6RIAvdXJM5KN9/?=
 =?us-ascii?Q?Ph26fbm2kFfKSRH+Y8OFGdvI8x5DJPU5mLSKgYShBMxZwGv0/6b5GBRuwC3K?=
 =?us-ascii?Q?9w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b3a4237-5893-4e53-2817-08db9cd7f625
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 15:05:56.6036 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xrrR4xfB/oC5mEQEWFYw+NWRjSH3GE1KQDH03VjcrIJ1u1uvWrIoC27VOX2HheOTLRQv2zepXvUUOCTqi2BRFvFAjVi1g6WjJ1tAEoPcjH0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7334
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/dg2: Remove Wa_15010599737
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

On Mon, Aug 14, 2023 at 08:33:23PM +0530, Shekhar Chauhan wrote:
> Since this is specific to DirectX, we don't need it on Linux.
> 
> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

Too bad the hardware teams didn't do a better job of documenting this so
that we would have known earlier.


Matt

> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 3 ---
>  drivers/gpu/drm/xe/xe_wa.c           | 4 ----
>  2 files changed, 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index c93d8f8cd93a..7590990599e6 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -90,9 +90,6 @@
>  #define XEHP_TILE_ADDR_RANGE(_idx)		XE_REG_MCR(0x4900 + (_idx) * 4)
>  #define XEHP_FLAT_CCS_BASE_ADDR			XE_REG_MCR(0x4910)
>  
> -#define CHICKEN_RASTER_1			XE_REG_MCR(0x6204, XE_REG_OPTION_MASKED)
> -#define   DIS_SF_ROUND_NEAREST_EVEN		REG_BIT(8)
> -
>  #define CHICKEN_RASTER_2			XE_REG_MCR(0x6208, XE_REG_OPTION_MASKED)
>  #define   TBIMR_FAST_CLIP			REG_BIT(5)
>  
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 5cf84a096302..e2b6e17d7ec4 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -599,10 +599,6 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>  	  XE_RTP_ACTIONS(SET(XEHP_PSS_MODE2,
>  			     SCOREBOARD_STALL_FLUSH_CONTROL))
>  	},
> -	{ XE_RTP_NAME("15010599737"),
> -	  XE_RTP_RULES(PLATFORM(DG2)),
> -	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1, DIS_SF_ROUND_NEAREST_EVEN))
> -	},
>  	{ XE_RTP_NAME("18019271663"),
>  	  XE_RTP_RULES(PLATFORM(DG2)),
>  	  XE_RTP_ACTIONS(SET(CACHE_MODE_1, MSAA_OPTIMIZATION_REDUC_DISABLE))
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
