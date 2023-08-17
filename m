Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC03DC3DA4E
	for <intel-xe@archiver.kernel.org>; Thu, 17 Aug 2023 16:23:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FF2210E52B;
	Thu, 17 Aug 2023 16:23:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7934610E4FC
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Aug 2023 16:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692289386; x=1723825386;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=AqkgLtdmNzf5VwYJR7vBL/mJSJwAxLkaDxifYWzdCCQ=;
 b=IjXqF7ajPfanN+JrTj7idYsuiCQF8tvEL/433U45updO8SJ/kXqC0jQu
 RwYyhWN1dacIng6adrXmRvx117BfmxwwgBGM3IhqRkfD3Rfwcck3s5d7t
 Llbluz38pTA2YDt3BQUc9dgFjT+aMs156sqVZQ6o0hz/MATaErhLoJ2/2
 jrbo/Cza+rBHbusDKVxlW3K8IvJHV9Au894wnbYLeXHaBV+GmKZvlt2Mt
 tCMJK/Taog4NHrYmnHU9UjmpoR+duQW58zwunCY26zT+6ty3e1bo+vp4w
 6Ie/YAV6o879c6TOz7lYWceHUqVAttng74FsBlSOwm7A8tzSwdjiRmJQY Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="403842443"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="403842443"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 09:22:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="734715954"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="734715954"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP; 17 Aug 2023 09:22:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 17 Aug 2023 09:22:25 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 17 Aug 2023 09:22:25 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 17 Aug 2023 09:22:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bMfdFf0HZTWwOkEUeEQB1Q9Fuokyh984MS1pEcUOfdkrqR8nOxNl8dV4PJd67s/9X7h6hJSrXOEp0ibyb/ah7bFLRG4WdSEOfsW+slCctRWtLHf5PGeB+KKviDHr8mvu0wHMMwvzg0vo+20RBxpUkLm7caWrAEWNeVpm6dLUeGQVZ7d6ay5W8MGUFUrA7BVai0u1YWz1B4xUmv1PLUKprOeuyvEfXx18Lj8ONF44pXFr4LpGlnrKsbFMrzixIhnTxDy8K+lq91eTFBXzS+477Ce7Pf1ZI+VWk+7WVv6l3wyQn/k0J6ihWARIdQ/jUcO3xqhcMrbSk+DM0G8Dk3HhEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jUWEcLG8IOHlcfN7m4AxIT409UfXx+3Hga1286n6BzE=;
 b=WxeZEGXiorFn86tlpRFIIi74zrL7bmefw+pJqOW/xnJ/R1958z3Atn849RuZrw1UtwNuN5eJjXZC2VYpKWp8e/95xux47zSq/9FeHCiqvEU/dtai4xeZjAETDWRHUCoq+qz/EfTq2rpSzkhv+3muUvTTwmxOouY3uvUasMJs0McgvI2SZDrJiXis2yfhy+ZlnmLI0cfmT9NWP3sVBk/VDHGP+VtpoZLxVJ7kWMmufB8ezKIAqgvzkrLSxfuHLqPxyZ+LM2eKohUrCWwVicwLfgYLeM36wUXYCTaQL1HKkPQ/2RIGJ/8UQm9gCBO1vcr3+TG0uqjU6RQ4sDeJdhtMgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 PH7PR11MB7049.namprd11.prod.outlook.com (2603:10b6:510:20c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Thu, 17 Aug
 2023 16:22:20 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41%5]) with mapi id 15.20.6678.031; Thu, 17 Aug 2023
 16:22:20 +0000
Date: Thu, 17 Aug 2023 09:22:17 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Message-ID: <20230817162217.GC3375865@mdroper-desk1.amr.corp.intel.com>
References: <20230817110352.7601-1-niranjana.vishwanathapura@intel.com>
 <20230817110352.7601-3-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230817110352.7601-3-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: SJ2PR07CA0016.namprd07.prod.outlook.com
 (2603:10b6:a03:505::16) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|PH7PR11MB7049:EE_
X-MS-Office365-Filtering-Correlation-Id: ace53d58-63e7-4a06-4281-08db9f3e2165
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 57heNABYqW9c6btsVPUhZFHdc4mdTSybT51v71mC6HEQK67WZdL4GHk7BMEMta7V0/UNMYJNrV4eG8Kz7VjfuXJbYZyW8Lm7B70SQ+LetMNk72lXOnDcWLaHsOo7QikB3fqmRBwXUfaCiY2FHwYAvhw7eHBDOW+7cNw+sdRcYbCBOXR/z4ggXm+YHkVO4NDooGlzy5t5wI3Y/hPLvalk//VrGbedbFi7wrO1ShlR0IKPN6f1pK+/uhX2TKdRsNoprVuEtcSM52y/tlg1+rmX/U4Ct/XG2DOPAAYzVOCfhdPufEuoxM0mykzAHtxPMfaLcbw2Qm7un5L7APGvhEltPjl+yzeylehWkqXLHDnfbbwdftWnQ/CTfMNFxpLuimbXwRvJAcyKHVrIkwZ938jLDhqCxJnWUdydAoO2WFlpoVY23XOyQC/yGHRbBMdh8+uqijCOmtURRmsQql4M27ITnwRHaRGBM9t+7+aEfWnVrte2NaQ3ADIMDw/AaJDVT7XbW6QmxpPQLzRsswgcmuQCRiU7QX3IjJt69fUMXUAuv7CYbxpCeRb+mAb7T6441//v
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(346002)(39860400002)(396003)(376002)(451199024)(186009)(1800799009)(86362001)(33656002)(82960400001)(38100700002)(5660300002)(478600001)(107886003)(66476007)(6486002)(6506007)(66556008)(66946007)(316002)(6666004)(26005)(6636002)(1076003)(4326008)(6512007)(6862004)(8676002)(41300700001)(8936002)(2906002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/jpT3CjNpk6ZjsyZMFFOvZvhmorpbZJ3TX7ggN+yxldUI7O/2Dy5zRefujZC?=
 =?us-ascii?Q?H274tEotIsUpaKxWORcLH+7nt/6ZX/xSzq3Lx3KZfObFy04RIP4d9YDMTIar?=
 =?us-ascii?Q?TLw7S6nV1SSzOreIzhpyks6+zKxYCdhEqufyDryEpVRzVcLsXgN3uhq0+dww?=
 =?us-ascii?Q?IzdsKTaSanjO5sYMbu2rWrtL8nEetWFjO7N5yt/7Ka/k5BOwUiel/Xy7T268?=
 =?us-ascii?Q?8tgVWAwkUKl5lJIu1ENhGmZ/RtICrzqy4wI0lNMr7bkJdzYWtDs1GEKhTYl7?=
 =?us-ascii?Q?G+3gnm7aaJr4ynw4oZEvgJ48Vi2dwO9TjEWhar4QyNOCO5OKfrXVsgn86OX4?=
 =?us-ascii?Q?QA1/iDamrsnkFKhY9bI1nUUP1YdoTQZ5KXcz/OEQK7/3uj+V4vrF9esUeNhY?=
 =?us-ascii?Q?VKzdsTpsLcZhUo0tPVKfhdIuxDJRzNGZ4NIml+EkOsMw8XVaOvGIY90/+fS2?=
 =?us-ascii?Q?liS5T8pupQb6x7EKk+BHbwB9gtsrIyJiNOofQ9pdGBdors2xN7Wg6NLcyXGo?=
 =?us-ascii?Q?zwzyT04q/Br0i1aRI+D0l0Nn1y+WzzSv3NOHePdynqGx/i+ZgwuICEXZtvGD?=
 =?us-ascii?Q?txKnCyU5AL4hxyaC9h0K9aejazm26p6kJXsb8ksEQORxP9zVVW6O1061RKq2?=
 =?us-ascii?Q?k+XSoL6CRCD+ToFPbFu+6UAPzjTsN0Cm9uWhCazRpWl6sy9thhO6+fL6fGYj?=
 =?us-ascii?Q?BIDEBbw2CgaOV6jyfNOXO5L+zDw9w+FNnnZDtajzu375JJC1MjyLwfYFMaCK?=
 =?us-ascii?Q?ieU+NvPFyUFlnJOuzAzQJMT22pYZIBFkn8va4ldKpS++88R+X6Qo0ugBOHQn?=
 =?us-ascii?Q?nwXJUeuKKcG9HW/tt2r6nya77OVVb0oKWsEz3WD61TgXYjBDLfUZ9PmqJEbU?=
 =?us-ascii?Q?ko0a5Eu8kFkcSjyL1JGmOOiIyIpq7KOav8Ow9GwoWD6q+szOp7lXM1Wp4uCQ?=
 =?us-ascii?Q?QikqIwRyfCr/b/AQS7CXhDC0C5S51Z7HCBl0mffzKYVdv4bqRsmBPny6D2h/?=
 =?us-ascii?Q?kvp69MbR6Ud1MiSC6QqYwfCNcCLy122JUiNw6fHJV7LSpieO+Prd8FO9qmLl?=
 =?us-ascii?Q?S64rZwcZs0yR5wGGk9DUGUl9CoQNcKO2wG9F+URZ479agExRp4fdS8sV+Kzk?=
 =?us-ascii?Q?RvYFfk+HeUJMrhw8M5c8y1H96zDh7Xmx1Z+MWujImJdpiI5/35dvdyPtNJa9?=
 =?us-ascii?Q?o/bds92CtmePswJJA5ONf4zpXD/HJZn9Y0SzVpkgP7qFXObgg29Sy3S42Ku0?=
 =?us-ascii?Q?JO2dFZJY9UalSyBjrX0jLM3SAiJD4CR3GToQeWjVocoFuepOdep131ARzeFd?=
 =?us-ascii?Q?1wb9nBH7Utxud+Fw5FOttr9tw1LJwQhfBy0TvtorcfSc8HTy1RdFP1S4J29g?=
 =?us-ascii?Q?zsOpPfBStfiVZkJfvxx0vdbineCqEy18S1YIvGP2V++PgtqWQa8L7LnU0Teg?=
 =?us-ascii?Q?sDvv+wGdIT0x95zaABTZB6m04JEnYNyjprTtvPxsph3PJZ/E/vnBe7aPmyu1?=
 =?us-ascii?Q?is9d5hEye1JV7f6FNT3zbGJ8ggkvd3yAZ6k5rCebXbM2ENpH32gmVJjmDuPU?=
 =?us-ascii?Q?FwNtAOC/RdCGJcs+vrLUfJZJNsDI/MI9Fig5wHsWlrFMykCTTYzESy3RC1vv?=
 =?us-ascii?Q?gQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ace53d58-63e7-4a06-4281-08db9f3e2165
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 16:22:20.2061 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lnr04s3TOosUTItLLrF8v2Vl9euoJrYpb/B0Oi87RvMGt1W4eUvPJGOdJYVQ4tQMTlwGgn6fPe0+cu241Osm2SHKrYQlCEN8tgnS6e5m+e4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7049
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 2/3] drm/xe/pvc: Force even num engines to
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Aug 17, 2023 at 04:03:51AM -0700, Niranjana Vishwanathapura wrote:
> Wa_16017236439 requires that we update BCS_SWCTRL
> (via indirect context batch buffer) to set 64B
> transfers when running on an even-numbered BCS
> engine and 256B on an odd-numbered BCS engine.
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h | 3 +++
>  drivers/gpu/drm/xe/xe_wa.c               | 7 +++++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index 79873bf64e8d..8e488cbe332b 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -59,6 +59,9 @@
>  #define RING_BBADDR(base)			XE_REG((base) + 0x140)
>  #define RING_BBADDR_UDW(base)			XE_REG((base) + 0x168)
>  
> +#define BCS_ENGINE_SWCTL(base)                 XE_REG((base) + 0x200, XE_REG_OPTION_MASKED)
> +#define BCS_ENGINE_SWCTL_DISABLE_256B          REG_BIT(2)
> +
>  /* Handling MOCS value in BLIT_CCTL like it was done CMD_CCTL */
>  #define BLIT_CCTL(base)				XE_REG((base) + 0x204)
>  #define   BLIT_CCTL_DST_MOCS_MASK		REG_GENMASK(14, 9)
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index e2b6e17d7ec4..e7b8cbbaf002 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -515,6 +515,13 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  		       GRAPHICS_STEP(B0, C0)),
>  	  XE_RTP_ACTIONS(SET(CACHE_MODE_SS, DISABLE_ECC))
>  	},
> +	{ XE_RTP_NAME("16017236439"),
> +	  XE_RTP_RULES(PLATFORM(PVC), ENGINE_CLASS(COPY),
> +		       FUNC(xe_rtp_match_even_instance)),
> +	  XE_RTP_ACTIONS(SET(BCS_ENGINE_SWCTL(0),

According to bspec 53978, this register is part of the BCS engine's
context (when searching the page, they spell it as "SWCTRL" rather than
"SWCTL").  That means we should add this change to lrc_was[] instead of
engine_was[].


Matt

> +			     BCS_ENGINE_SWCTL_DISABLE_256B,
> +			     XE_RTP_ACTION_FLAG(ENGINE_BASE))),
> +	},
>  
>  	/* Xe_LPG */
>  	{ XE_RTP_NAME("14017856879"),
> -- 
> 2.21.0.rc0.32.g243a4c7e27
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
