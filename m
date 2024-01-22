Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C75C47DAF
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 16:33:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36F3710F5F7;
	Mon, 22 Jan 2024 16:33:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C970B10F5F9
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jan 2024 16:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705941192; x=1737477192;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uQAp4X1dFlq5oZTucEplE2K6RvMAEkwEnV4K1Pohcek=;
 b=nv5cg4S+OnQXiWCRRMw5a9gG1oFjRJM2qNhvGZj4ah6TrQijgt6EFPv1
 yov31uj/MOR/H307dX3rgO60NrA8WfElBnLP/0kSRVhV4Uk+/vT6O/lHC
 UYxBrYxKBrlpHxuLJTS3SZVuRQYK5hAPksKf35ImDgHsYegSmzj46WDxg
 qcpfLq5JLltj8KvhwNtTUBBaguU8RaTJKBxbRki/J4NUBSmmDliisJpJw
 Vi9utBuM66xhGY+tCufXMjjAXVyGvqGe7DTEBIaQj3AVhR+DEcTzNILjB
 ixtnnoz6iHnLgRYKayL/Y1/dHXJCr6wdhJRVPH66imaQIl6kO8L0R4yQk A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="398407889"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="398407889"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 08:33:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="735217000"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="735217000"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jan 2024 08:33:11 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 08:33:11 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 08:33:10 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Jan 2024 08:33:10 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Jan 2024 08:33:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LNEhCTAfCNipre7ufjQ6crDRNbm5AxNq+Cs9LlVEKDjtXWOOz+dCvbzw59X4ZW+WSwE2RX/zfMNNiC+THYkGAGpmuQveUYlBxc3MpCLaUlk11GlPn0CSsL4XyK+jWa9O35+A1Uub75LF/ozWJrQiKjh5wlxoiHJdJv8sjNZLPR2JDYPMAVtoa4qXFsZPz6EaYDBFkQT1BqXg1fsU8Ka/Op4VFA6LPIItaXWexmSgElT3k4cOg0iMhgQPnx/OhsEwLIJn/gfNRFIBArwEICwIDw7cyxa6so607e3qI8gQR66dR0gSU/U3xqrp+s+X/SgXdHv6TQH+pNqiyE2ZfjndJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9KqrpSMWL3kTpx7HwcYJigXzdCrd06cRmUEzPpLBJQM=;
 b=F22KvK/Mcn7ignLuE7u5Sr75u4+qdHnNu+BzvLNAwb1lGek4yeF0B8KXTpP1yCLZNDBFY+uJvd0q0RknwbDgc+WXobylcs3ckiOWX7R4VeFs08SRuh5tzzx99eIAbbwYr+rZToskZG/un14t4da6HeLB9BgcWRY0WzTJmZRfrO8LBiayH1vBty5QFitV3PXuOwBy3qVngh3QuD661GYP1tmHP6EbRgbWosfSQxh/vs+Ro/i8St0GKqk8PmVNc0lblkU9uDAVqXjXPw8JOxU5k7Ry4hdu1l5yegf5Ch5rH/7UCJ9kVMOZ/CwGo9Nr5P0PklQLcGBGDOrk5dKoKDM2Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MW3PR11MB4665.namprd11.prod.outlook.com (2603:10b6:303:5d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.34; Mon, 22 Jan
 2024 16:33:08 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3%4]) with mapi id 15.20.7202.031; Mon, 22 Jan 2024
 16:33:07 +0000
Date: Mon, 22 Jan 2024 08:33:04 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Shekhar Chauhan <shekhar.chauhan@intel.com>
Subject: Re: [PATCH v3 1/1] drm/xe/xe2_lpg: Introduce performance guide changes
Message-ID: <20240122163304.GA5506@mdroper-desk1.amr.corp.intel.com>
References: <20240122054904.2111721-1-shekhar.chauhan@intel.com>
 <20240122054904.2111721-2-shekhar.chauhan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240122054904.2111721-2-shekhar.chauhan@intel.com>
X-ClientProxiedBy: BY3PR03CA0014.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::19) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MW3PR11MB4665:EE_
X-MS-Office365-Filtering-Correlation-Id: 63801d42-dad9-4847-ec70-08dc1b67d09d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LzEGbMgaOg8yl4pGuD4jjp+EgEQvXbt3sr/K9hLtnn41OyW0k7xC1sDh5hczIziRpdYSmpRvxJd3lnuXf5SheboNwGwx2uwNn5xZcjtfS5PDaJs+psILWjeD8t5dnHCTAmKSHYoAtCt0GOjugfjH4Adriml1Vxn6U2kJFRJknesZoopdyv8J537MmijuHSERo2rw7idv9zUe+SnAFIPQwz03vgAW36Oi7EUuprovUl4t6xLEd71a2itPl5hpWHjMXLX9PV7G2lYS/1CVsPFqQJLKkJ8/6f8LSgL979VTEm8jKI22vFBEKkd2s8vGh/nbUV5/XOJX2D4k5aIfZyCE2cevWkOkWNURpQLQVfpDmbELeEHKGHDB+h+USXJi8csXp86SmHPfJEDeDVLvMZBLzv1sPGocyOyvdMKLuS7mka8qLFw1PUUS4LIsm7V5XP4iX2Iji64cdv3XC6dh6+66WW5T49rrmN6Goj2Tdp+z42ZEjMnlhYBm7266E7qXhLOJ8RxTJa7Dn930r2lMo0JGkHywnXxBFtcClbn7X6wizvYvtEPhYZlu1xJlhB0b+RMz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(396003)(346002)(376002)(39860400002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(83380400001)(6512007)(26005)(1076003)(38100700002)(8936002)(5660300002)(8676002)(4326008)(6862004)(2906002)(478600001)(6506007)(6486002)(6666004)(66476007)(66556008)(66946007)(6636002)(316002)(41300700001)(82960400001)(33656002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VObBECRPE6+ofPubGGucq3+SFvpE7uHnxaQ/cA8ItimQOb3FjW1NwZnmTguQ?=
 =?us-ascii?Q?pvmNSyn1hvCyTQ4S7OObNaf6l1jNU1AVHZyiIIlCwd/N/R/MMy4XiG/7YHGd?=
 =?us-ascii?Q?oBs4PmGQgmBxvDACleu2Y27lQCmyyZ7yaNhT1atjswOR0Ckh13k4+E3sJddn?=
 =?us-ascii?Q?ibDk1xpfbzPYJwjT6Nx1dcqIJ4cJ5ptLolVDxWtfn8Yent3aJeQDZ/pKcuut?=
 =?us-ascii?Q?17S06HDJDLs5Fo8Q1cUWBY1SXFOiPbWsGANRu1N4/dRHXcTIZQ/5KLYKc1+o?=
 =?us-ascii?Q?pmDoDhX57d+/hr9CWyRK4KOJYw8v9FlzO4ETCgJOBKp1lvNO7mq9PktXUIBy?=
 =?us-ascii?Q?3Ns92H5dAFcr+0tZNMh8duPe1bilE5vMywIG54RZskXP8jDF9+dyjbPVz+EU?=
 =?us-ascii?Q?+OTjiKwQas/O2gIqDZr+MmcvFl+qgrfFIHXU7kfwBbvJw7ZpVP7CsMilBm5l?=
 =?us-ascii?Q?Uf6vvj3l+VxDu6gVAmjTv9InPy29JdRuvlj3EGIXlvRcP1GQOr2nZsJotod5?=
 =?us-ascii?Q?XJ5ZuRTz1xyFAWG7tp63T9kAu+khXaWLzoPLJkaUVDbtK12FNEXxRYpAYkB3?=
 =?us-ascii?Q?HErOxr73L2rT0Sy/bZMyjpSQBJ8D6xzFs+DKiSCaXh8h5QrcRLVhsX3SjoHB?=
 =?us-ascii?Q?tQwBPkJRhqbv0gHAsTtCDwbqAhSQowXxC43GkYHSjw1+5UyZhFVTZd84xNsQ?=
 =?us-ascii?Q?ujvOjqNjjV/3HvJRdo2e+tTjuHZHdp6cV+06HHpXaWD+DNnRxhjO8CtCQwRK?=
 =?us-ascii?Q?PCK2fKG3JHuWIXTZBMw1RhG2NOqpsMuHZZnFV/s5bGbh0VEyFMyaZUnqPVDm?=
 =?us-ascii?Q?8YWFUEEZz2GhoYWK0kmUQ/42v1fvmqmNLhNu47PCz+Ux6xpBA8SpmTwS59yi?=
 =?us-ascii?Q?prhWmppVzfDfmHVe5zpUM+2wP+l9iKIGKMLP3MxiHruyvKQM4r28gw2ePEe4?=
 =?us-ascii?Q?u1clY8Gvw2bSgRn536534FmWWM4Qi7zS5WdvIxTe5dnKy12Ud4JEWjRW2TS7?=
 =?us-ascii?Q?HfftSgS6GylkRvw9SEHzqk2iVWtSESTKOC9e1EbnbYHK05Alaek48WwFipAF?=
 =?us-ascii?Q?hisi7ZS3ge/4hKIEnQI/fEuOAb969UU/qq4tcz+ohoOR2UuOSt+J8gzzHqez?=
 =?us-ascii?Q?GTIFraMAk3ROaVAkiHExVTfve8sNqwxlXnddbh+OVBHisBRSA2KUVg+b1UMW?=
 =?us-ascii?Q?3veUqDOQPiMtD5P96Zvz1VeKxsKcb1VktgTkZ+sZFQvsemRbo7xX7vXAEnYg?=
 =?us-ascii?Q?h5ojQv3WFnxfb0PDb+V92eRgRxpswrQfaFP5F70ektUyRuhHaTNuUfZ1O3Qg?=
 =?us-ascii?Q?KU8iVJyfWDTh3ugRGjDa/wxsS/DKXUzSIJzJyhjaGJulBMZsBklTU6NVe6kE?=
 =?us-ascii?Q?NvZPn8dUAxwYH5CcDAxpAaEDSuNCDwvfJQJ5DLhoDCDIGvsVKP40Wm5NsyT9?=
 =?us-ascii?Q?oBNtC3e3skbAwiS0LbIuLNXSymKbLgcimGfn3jMUicGRpBPEponnGuCWRYx3?=
 =?us-ascii?Q?yfEhooBGa+nGQokt8LK5fWimwIs3TFaSeYCE9YneDhDd3lu4NbZAQ1Akeqnq?=
 =?us-ascii?Q?WB8H1qZwsfmhixEAxbSaCu02CQUp38hbbAhH2EYNGphFWGMzPdzdXXskbS4n?=
 =?us-ascii?Q?zg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 63801d42-dad9-4847-ec70-08dc1b67d09d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 16:33:07.7504 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2R1kuILCiMbVVlSnrEmXpTf+Nx02lGagITQp8ie9VVZpmeI13KFuc9cvTSmrKcCD1AZRS9+g1UNzF5LWDiakBMlG6uld9tTEqJlj4q2RxzY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4665
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Jan 22, 2024 at 11:19:04AM +0530, Shekhar Chauhan wrote:
> Add performance guide changes to Xe2_LPG.
> 
> BSpec: 72161
> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 6 ++++++
>  drivers/gpu/drm/xe/xe_tuning.c       | 9 ++++++++-
>  2 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 0d4bfc35ff37..cd27480f6486 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -144,6 +144,9 @@
>  
>  #define GSCPSMI_BASE				XE_REG(0x880c)
>  
> +#define CCCHKNREG1				XE_REG_MCR(0x8828)
> +#define   ENCOMPPERFFIX				REG_BIT(18)
> +
>  /* Fuse readout registers for GT */
>  #define XEHP_FUSE4				XE_REG(0x9114)
>  #define   CFEG_WMTP_DISABLE			REG_BIT(20)
> @@ -289,6 +292,9 @@
>  #define XEHP_L3NODEARBCFG			XE_REG_MCR(0xb0b4)
>  #define   XEHP_LNESPARE				REG_BIT(19)
>  
> +#define L3SQCREG3				XE_REG_MCR(0xb108)
> +#define   COMPPWOVERFETCHEN			REG_BIT(28)
> +
>  #define XEHP_L3SQCREG5				XE_REG_MCR(0xb158)
>  #define   L3_PWM_TIMER_INIT_VAL_MASK		REG_GENMASK(9, 0)
>  
> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
> index 53ccd338fd8c..3ae1c0622c32 100644
> --- a/drivers/gpu/drm/xe/xe_tuning.c
> +++ b/drivers/gpu/drm/xe/xe_tuning.c
> @@ -37,7 +37,14 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
>  	  XE_RTP_ACTIONS(FIELD_SET(XE2LPM_L3SQCREG5, L3_PWM_TIMER_INIT_VAL_MASK,
>  				   REG_FIELD_PREP(L3_PWM_TIMER_INIT_VAL_MASK, 0x7f)))
>  	},
> -
> +	{ XE_RTP_NAME("Tuning: Compression Overfetch"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2004, XE_RTP_END_VERSION_UNDEFINED)),
> +	  XE_RTP_ACTIONS(SET(CCCHKNREG1, ENCOMPPERFFIX)),

I think you meant to use CLR instead of SET here, right?  Since the
setting we want is the "Disable..." line item, which turns off bit 18
that the hardware already has set by default.


Matt

> +	},
> +	{ XE_RTP_NAME("Tuning: Enable compressible partial write overfetch in L3"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2004, XE_RTP_END_VERSION_UNDEFINED)),
> +	  XE_RTP_ACTIONS(SET(L3SQCREG3, COMPPWOVERFETCHEN))
> +	},
>  	{}
>  };
>  
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
