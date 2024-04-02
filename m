Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B9E4C6FD1F
	for <intel-xe@archiver.kernel.org>; Tue,  2 Apr 2024 16:08:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 246A910FE3C;
	Tue,  2 Apr 2024 16:08:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lGkmMKoO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CC4F10E3CE
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Apr 2024 16:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712074138; x=1743610138;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6gcZhJLib7WHtioB/w5aJ+oRUKiJ8WZpKJfFM7nz9OE=;
 b=lGkmMKoObaKC1EeEZoiM2+dyJCLbzNn/e6u3stjNYJ0dZB6b41VTNsfJ
 Vq+GuXJWFpFOODyWpiT/C6zln9PQRaynIx5N1hbNgj3rUE4a1LGsaAiFe
 PjUjPNDxTcgV+49y/IBG4THsfHstBTOB4PWl2Ry+jtNIPTuGJWTsWuuPG
 t1gdfoXOAJOTs8IgCDxhycJyNRnnXelO75MZiQx7ZBKJEs9Tb2pZsv0kO
 XvZ2DnPO4z+YStvVEOf6sRLaObsgX8bUqS1iSyoW/4Yot+s82lJ4rVIn1
 x9G7FY33lyZSZpJNhqToU4eWdIyBANTAzUq/xQsN+ZdlaFX0KCttFfz6S g==;
X-CSE-ConnectionGUID: Ztrq+jsgS4a83Y5tUkCwWg==
X-CSE-MsgGUID: RdhA4IggRpyBfMUPZ+EMhg==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="18616665"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; d="scan'208";a="18616665"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 09:07:13 -0700
X-CSE-ConnectionGUID: rc+CfprNRRimGrxCPwMG+g==
X-CSE-MsgGUID: OUcJQUkpQPWIZcsQAytZKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; d="scan'208";a="22819848"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Apr 2024 09:07:11 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Apr 2024 09:07:10 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 2 Apr 2024 09:07:10 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 2 Apr 2024 09:07:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FUoxuotINMqNfa14k5yXgRX6nSfxvv3yBqt/HCYcUbbHySf2r3qXaXqw8LXWPg0enXrfsAJC94KprfmEoDB+9Y6FVRWK/1hOThVyx5200/WYWL2lUfofmb/KlOQeIw3E3hBVgZj8BKJPH2x143vqY3FIs1nI6lK00+NYTsw6GxabQD5z5mvbkFWHb4tS1VYc8xgja/yLdbSgtbhyseKi3Kued9OyPp9D1ob5nx/DnJLwf7N34BRNi+sCYJBRPDQGLGEjo5AOw2TkIjFlNgqK4QRTiRl/AAzVytMxyCPUYgdTNOqwC9Oc0BV/DmzbzCZxfPsOlBUydF7CNU0lU68O8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XnVjxoYDCWrrfvz7v+tFbxupsIXYyt2FNiTe/YVzqFI=;
 b=UrHVkBtfE9Ywy4qAPKFvnMszXKDvLicW5zzt9PjeX155pw/BRsep7loVkzqC6be9EM+BIw6bNU/v99SYlvct6EhsCzEBRjzayCw3YjS5fonTfxhsbb85LGyW1Kbu9Hk5TrPPEfVcTrUeb5Jwg0FzXczNKmqIcryVnTAqKbU1kcTtgCFWiMI/4kP0vgxC9SWqhTCDEAKdg5pabQfco+cEvQv8O/kcEU8X0qjCCTimAIUS269fYwptRY1g/b7SR4kFU0seKKcjBtsvuCM3u26mksSKXay7cV1ZjfhI9en91SStHwOrh3wJrCYyEkg08RNXuLyURLWpc2/O7qKKIDhq6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM4PR11MB7398.namprd11.prod.outlook.com (2603:10b6:8:102::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.22; Tue, 2 Apr
 2024 16:07:08 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7452.019; Tue, 2 Apr 2024
 16:07:08 +0000
Date: Tue, 2 Apr 2024 09:07:06 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH 11/11] drm/xe/xe2hpm: Add initial set of workarounds
Message-ID: <20240402160706.GH6574@mdroper-desk1.amr.corp.intel.com>
References: <20240402124724.1238122-1-balasubramani.vivekanandan@intel.com>
 <20240402124724.1238122-12-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240402124724.1238122-12-balasubramani.vivekanandan@intel.com>
X-ClientProxiedBy: BYAPR07CA0083.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::24) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM4PR11MB7398:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n1QpSTzT6xJ3r4mX9BxteV4USadFVe2WOaS9cuvJKisJ5VXr1rKcA2VjlbgxMfveHUSHPhR5+c96E8ZU/DzlWUmXx4qemO5CVw8zVzlxKR9oms1daKHX0I23P5x2b6Dx/RI+6O4tEUmWyAPOmteCSUzoZOtdP683BnljJy3oxPDN4GElJJOu0XZdVdgCJjWojJbhL1eHZYantcUENHEcGRI7Gqp/qk3EKZ3rgQK4iTtWKHztaV/EHV+XUtwW7iqm98KspeNqkCFAq2OZCPtH/ctaaKLTaldV4xXeIXvKFLFGMscY022q7WppugFP9xSE3F/jeytJcwvul7GUFRLxxI/+sAMk7uQl2Y4IqSwxRt0A8WjUwsmelvSSVrMJ1WqNwKZVsPleb+8E+lC7ZcUqOphUO64t/XgEze8rk394JYUobed58La1DWjoG2537b3m/oZQajRath/k9OVnR2VWIFesD75eF9eNpGBg+5QHpyKFjnj6AB39r7fi9DJ5m83hX7DZ+RuAI5e76H6jWCo3BN0BJlKQ/bxyy+bvW5X3ebangpkWkc4Enaj+QSjp9B7voVD72tKIF+WWwVgqiUgbvs/3jguQAr44QHXWc7cyV6ja3DyLTtVFi0PAc2xm34NjpQS05xRyDgLW1xVgVhH4A8H8nRiCN4EOGiNimFMimEw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NzyZaia6DfQetKKniYH1YPKdXrwcyxE+GY5LlSpMNUdRgSvX0O71BTKqvf09?=
 =?us-ascii?Q?8q/ef8VJL36MHdZTf75iTT63q3Fo5fxU1YDOpihTbS6bHv9BolSnHawMnc/J?=
 =?us-ascii?Q?6oNPmMPhjI642rY4FtU2v9n3oLjieWBVi4KST/YrtruMJQbpSF4XMdaNL+xo?=
 =?us-ascii?Q?gt+cFWSV6OMrM3AbEejecNey7Jehi84YU/4FTwr2ueQ/o5XrsYJJWpW/KgyZ?=
 =?us-ascii?Q?+oE9kzwgVRsKQ0PksPa8c+PM0EFfdHTAYyVWNS75xUgY/pSK0tG3sBbpZQAN?=
 =?us-ascii?Q?fqka1Bx3vALS5EM3vN8cyAngxK71OQQDxb7mMjw4KzUKKhYIUq8lWiNBV7cN?=
 =?us-ascii?Q?mNrjUIC9WhDtyUbsu5OG7dp7oqekmJ/7UaZjJ32mBduG3/fhbenj4fAvdcQk?=
 =?us-ascii?Q?OQJmO+BnCaJLojZobFwF966fpQMLHp3ONFaETDquSbkWhGV8Tm9smtFK2k4L?=
 =?us-ascii?Q?WTyZ7s8KSrnPB1eep6/Sy35KIjFvdM09rVRGM+mYgtZbqUVOhwqPtuFaZoQK?=
 =?us-ascii?Q?4maGboICI/KBpsukArWFXMMdxTa3/+20+7yaZF0y2RAQtCu8Tg4Cj4m2zoNE?=
 =?us-ascii?Q?Cbn7fe4A+5YnqwRA+h7kWbsm6PrWlDrNR090YF5I4MBJ2aEOPe5oV0hQVe85?=
 =?us-ascii?Q?RflP0SNFXHyqGren81e5ggWN7xfviA1zkhQocgiWaPQ0Iq/AjGtqiFBceJtG?=
 =?us-ascii?Q?fUIQ5kzcOFGMTKAgzXFfWjKVco4R2trtv3tJl55BKmUHz923CmF8JMxnWZFr?=
 =?us-ascii?Q?hIxNWYROX1JY7w4N+zAeaLBzi6rVtX4H16ZhVgIkUyNtUzBcxmme5OCrl2ru?=
 =?us-ascii?Q?7TFvv/cv+NU6btEp11rjjABDECGZQhKbh9HD9Br5RhhXjCj42H0tv9Nq6SAm?=
 =?us-ascii?Q?lW43OkFgse8Xxe8DuzsyBb601zpTutrJroAJ1wxk9+iZiiMky/Ov1Ul+dgrM?=
 =?us-ascii?Q?ZObXHokT4qUefH2gf5wUCdh/ARus81Wit6z2/cEhTulFHRBjS6+S5sYUnE3P?=
 =?us-ascii?Q?IJG74A1iverG2uRobHFa1MMjXl+DafGtTkCVqmgiN4c2KDwwuzOVXwlaj7Yn?=
 =?us-ascii?Q?E0zuMixTMSeovnvBf6tgR8tDjzaPTqNP3/OM4M98EBi3UO7Jj23EH24hlHam?=
 =?us-ascii?Q?BLEb+GyDre7jxYwRyHr6aGzapNZe67PsaSgLdAfKWAa8rvNjJKTdxEvDt7/H?=
 =?us-ascii?Q?Jf9NOHfvMqpumSjWgcq4LlgQwqqcgk3HCt6AimYnPqYzmIG7Y4hSpselRkJR?=
 =?us-ascii?Q?+dSbbEmhgQQylFgceKwHU081NnD3AQFHy056y5s3yqbUU4iplgg4EN0bei/T?=
 =?us-ascii?Q?YFJvjtguezTWVbTlHBcrepIRMPTOorNs05PI8S7u+Jjy+ifnCSNE0EgSPRfm?=
 =?us-ascii?Q?iVJNmpxiAYxWinjdSxSQxv0dT9H6oTu9cyyVg5HL9ptnJ7cfxAcCo8Ey9vXd?=
 =?us-ascii?Q?2Vr6t6u0/jMNfkPGyfxFu51sqae+xfkMzeIH9nQLGgAJEuOPFAY0JghRbWmN?=
 =?us-ascii?Q?H+aunFwbKKchqfeiqKlbX+eSdhpKNxo0vLxTANJzBahtqoBMCRXP2snT3eqR?=
 =?us-ascii?Q?NcBMyChQish4tUBqyD6hW/tXTiulejRzg/V17akLaIwYec0cDtVRILmQrlq/?=
 =?us-ascii?Q?DA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 397eef34-0d7b-46ac-0fd1-08dc532ef2a1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2024 16:07:08.5804 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yiJQPFbLYmyCBBecqd2B0GHfhXj0etxkdcDc3rDvxWKDUXuJwM7+flSBBPr/aMlnFDmQgvnK3Z8+DEmVaBaXEUGM+fJmVYjqtr5aD5Mt2w0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7398
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

On Tue, Apr 02, 2024 at 06:17:24PM +0530, Balasubramani Vivekanandan wrote:
> From: Gustavo Sousa <gustavo.sousa@intel.com>
> 
> Define the initial set of workarounds for Xe2_HPM.
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  4 ++++
>  drivers/gpu/drm/xe/xe_wa.c           | 32 ++++++++++++++++++++++++++++
>  2 files changed, 36 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 17cc9b6c9536..126baed6a99f 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -279,6 +279,10 @@
>  #define FORCEWAKE_GT				XE_REG(0xa188)
>  
>  #define PG_ENABLE				XE_REG(0xa210)
> +#define   VD2_MFXVDENC_POWERGATE_ENABLE		REG_BIT(8)
> +#define   VD2_HCP_POWERGATE_ENABLE		REG_BIT(7)
> +#define   VD0_MFXVDENC_POWERGATE_ENABLE		REG_BIT(4)
> +#define   VD0_HCP_POWERGATE_ENABLE		REG_BIT(3)
>  
>  #define CTC_MODE				XE_REG(0xa26c)
>  #define   CTC_SHIFT_PARAMETER_MASK		REG_GENMASK(2, 1)
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index a163a764d25e..824481cd2247 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -228,6 +228,28 @@ static const struct xe_rtp_entry_sr gt_was[] = {
>  	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
>  	},
>  
> +	/* Xe2_HPM */
> +
> +	{ XE_RTP_NAME("16021867713"),
> +	  XE_RTP_RULES(MEDIA_VERSION(1301),
> +		       ENGINE_CLASS(VIDEO_DECODE)),
> +	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F1C(0), MFXPIPE_CLKGATE_DIS)),
> +	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
> +	},
> +	{ XE_RTP_NAME("14020316580"),
> +	  XE_RTP_RULES(MEDIA_VERSION(1301)),
> +	  XE_RTP_ACTIONS(CLR(PG_ENABLE,
> +			     VD0_HCP_POWERGATE_ENABLE |
> +			     VD0_MFXVDENC_POWERGATE_ENABLE |
> +			     VD2_HCP_POWERGATE_ENABLE |
> +			     VD2_MFXVDENC_POWERGATE_ENABLE)),
> +	},
> +	{ XE_RTP_NAME("14019449301"),
> +	  XE_RTP_RULES(MEDIA_VERSION(1301), ENGINE_CLASS(VIDEO_DECODE)),
> +	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F08(0), CG3DDISHRS_CLKGATE_DIS)),
> +	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
> +	},
> +
>  	{}
>  };
>  
> @@ -508,6 +530,16 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, WR_REQ_CHAINING_DIS))
>  	},
>  
> +	/* Xe2_HPM */
> +
> +	{ XE_RTP_NAME("16021639441"),
> +	  XE_RTP_RULES(MEDIA_VERSION(1301)),
> +	  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0),
> +			     GHWSP_CSB_REPORT_DIS |
> +			     PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS,
> +			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
> +	},
> +
>  	{}
>  };
>  
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
