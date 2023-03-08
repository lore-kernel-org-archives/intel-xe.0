Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF757C64EC4
	for <intel-xe@archiver.kernel.org>; Wed,  8 Mar 2023 22:55:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47A1110E5D1;
	Wed,  8 Mar 2023 22:55:18 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D92C10E5D1
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Mar 2023 22:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678316116; x=1709852116;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YxAkXKYuljGeD8Rir/VdEYykZQgvus0Lk56cijnNPa4=;
 b=nrwXV/9e7y7FltkIZmGTStM1F/S4jsGJj98jUk3PlL2lBmkBYgoBsjuw
 69zIy9QiENMoRljSez3sgA5/7zk/Xi4Y38WsffHCR35DS5oqGcjG1vjd3
 KfkSbbE/Ey9YKQcLgdMHFyiEviK5J984mJw7Gtqx6uDGbR/xd88HKAKNj
 +QaZLshdH9U/F7v5nWxHjGeOYYCWggC5sQTZmUC3DDgGmOmfhO09fnPCH
 syh1Ssz0qnBBgn9MJlqWHDULhT5Ohrwk7SJ9lOXiPotByb15COn+Ht60S
 TrCh3WGV23np7PnGk4Z1PeNYE8hIk58w54kjxLyaWU6zTQwpHaRADJ36m g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="316688722"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="316688722"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 14:55:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="709611705"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="709611705"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga001.jf.intel.com with ESMTP; 08 Mar 2023 14:55:15 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 14:55:15 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 14:55:14 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 8 Mar 2023 14:55:14 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 8 Mar 2023 14:55:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T0vC27oqaS3JMcemPRsoC8LfPjJxs4Lus2TfResJ0LCrLTSAk3uGQZFkz4K+ThLq14o5WAzjIadVQ6hNxf2lf6vgIulbGTzf/0Lg2KBgh8yfyq8rOZyK0O4k2ve0pGO/7GfEGtSbA5qH3oQTuzT3MutyLKKd8w4TNG7MrOUqciaT/vDFb1+FQvDtPxR80Wf7HgqW8p9qY8Oe5easPGb/Ye02mRsCbaEuJFsfV9TixWeXD/W0FVwgoIWUuZAQutXVcg9QIlqid+DB4+/FBsIDEqgju+IGm9Pjm9+CFAGcdM7CXhAV5N3Q/Qz68+qMFLZsXVwnJO0h7gfw/4R0CotGmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8GugnilpdYs1EqGix9GiruCDuPI2n0dg2kmHAXaFrVQ=;
 b=jCnpcNnTd2rlIKar4v1YMYB7XB4+GJy1JvhamQRtI72lrtCmU7jQjn0a0YGKJekB6Q3CuEjBTeKff8CjzEsK8IYUUThHLGnk3QHw59y8p38ImN37FzViDKWItJ7VikXnZGw9cXmeFTpYnsHsHfGojPXjId7hG+k/hW+fQ2lzAKyu8wxFk53wNcFCX5/vl9WQtALjdQqnUcbva0R6dSSimUJfQrTRaHjL0Ar40culPtopTVWKlG1Lm7TT6djntQN0zVeIJcrrnFUniV7hUbfSC7jBr38F0/il4ak8XR8G5Doj9vyVJxOduVbOBAgUFlg/e6ekWg+w18nd0ds5bWiFtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.17; Wed, 8 Mar 2023 22:55:13 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%5]) with mapi id 15.20.6178.017; Wed, 8 Mar 2023
 22:55:13 +0000
Date: Wed, 8 Mar 2023 14:55:10 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230308225510.GJ1543793@mdroper-desk1.amr.corp.intel.com>
References: <20230307092446.1263266-1-lucas.demarchi@intel.com>
 <20230307092446.1263266-14-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230307092446.1263266-14-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR05CA0141.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::26) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CH0PR11MB5444:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d390dc7-343e-4446-8645-08db20282cde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PDS6OlNslVQMQp0qmNsV11f8VxGk4x40rl7HQtaYEwhXCpWIC8DgGrsoudwXZHR+Tns34aLH/bHgF6x0jioGM+UrJZr1dUZpfqwQgr63vz8Q/P3kfrvAGNYQZpAjfj7vlzHmVi54LYRMfurADwsAlTtaKe3FCRviI3Pf5zEfz0hSEm7+Dq7EMUFW8IqEKvOOrhIRTCNVqQQwMoZxcC7qNX13TgqLsQfzL+S7ZwhMEGP3l3XRN5vXQgrLC1/G8BkP0pO9eZ3ycgjlz7+mlcKoR5/X0hDJ/hw+++WCzpOPwmkIpwih/gNkAlTjrKjq+EeQZqAbxErz7uU8hapxYvvdErIu7yWoawpbRJKVa3GnpxT/S9clPK1TtQHVPfvzCu38ktbkXnB9XdxYh8likgDKWkrBVyVxcrEMpB277v6UFmfwDZsMxKVW2/uz+Qu4fLuPwOLW6JE4pV9sBcNIaQzkLgCZLtXp4bgRS6cIq7614/70j1trA6+2JILrHUg+OKxr6SIxYfvsS0n5kKcnqX7eZDqmZbsaT1ut/6WD73FgTB1nEj5rHkOPyFOTzf4MSptJDNCRaVg6noTdlbzhdRNRLOuMsHNngj6PWHKewRffZ2RnJnYPvsQimjWykWdONKGSpFoad0IRB4Bi6Af5pq84VA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(366004)(39860400002)(346002)(136003)(396003)(451199018)(186003)(2906002)(38100700002)(82960400001)(1076003)(6506007)(26005)(6512007)(5660300002)(6862004)(8936002)(6486002)(33656002)(41300700001)(86362001)(66476007)(66946007)(66556008)(4326008)(8676002)(83380400001)(478600001)(316002)(6636002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2Fvzqw2sYiaX7SRsL+1ODLqhKjtbcJVyqU3U5KfuFBMACZI0b0eLw36OcelW?=
 =?us-ascii?Q?eTqA8GzYDT3e6+z5s9fuxfEcrRnZee9s+SlkoAoo9q6qgqbonjF0ThDBcNl9?=
 =?us-ascii?Q?Q0Uk/kT672o1SOKh9aaaAxgIy4YZ1kA7sriPci+yu0bI7gPaDvqy4U4QIULX?=
 =?us-ascii?Q?4RWZLOrcyCVD9I3alGkP+veHiRTMKKTI9QbZc3s/87LMe/fMl53kAt1Jl1Xc?=
 =?us-ascii?Q?7F8BaqsK69bgNmpbazLEX6yU9r+Kd6XUFlNmuMVj0z6ng5gGVOuZ1VL62e4z?=
 =?us-ascii?Q?47rLI8f/sLzcup3UGVkKOAYAP6Trl7ulgGHwiJgDzAPQr/JMDqnkWvUzwSeH?=
 =?us-ascii?Q?Cg7CEdk69HvOSXlkSjjsXsiBJnkzrtg1eg+jTJVP60oNefIBPcmzLrgwj/48?=
 =?us-ascii?Q?Tm/TnmU+drDqKwomIlLH+39E+unUslbf2EQah4f1u/Ix/A4LDSRB/Zkp8hfP?=
 =?us-ascii?Q?gJvcYKWaq/eB1AMMv65zl11VHjFaXS+EcIA/sFyvdJkzMWf499F/yWfCHpdZ?=
 =?us-ascii?Q?rwPi4l/B6UnjZnYS8p8Mfo7aMsLxeWNVKB908/3rL3z8DLMiTtI9sy0X0VhG?=
 =?us-ascii?Q?TTnqeDDbu0167RFQXvoWZVWhvtrFuo0FQKzeUuL5fasba2sN8Jig1tSf/Zei?=
 =?us-ascii?Q?gsn1k4MXN4zK6Rq/XsiqvJNi/UfUXNuEupSe7B5rodyYKqFhnA7xLdvKdbNt?=
 =?us-ascii?Q?5NgN6fWgAta+cVWzp+vrrn3NQeGjG2nY5aPeXfG9e/pWM5Ia8K/C46Zr7amD?=
 =?us-ascii?Q?qPWUrr8iOuvLis/9li2fplLt+TX3+bAE61fPJq57KbWT3dxUtOyxclk1tjcp?=
 =?us-ascii?Q?Myt/I476Ao7n1OTxJ6sXUTSzwk2n9mYbubjymdHnclJGQAYX8G2eF/DI77be?=
 =?us-ascii?Q?JKttsl42D2kY1NPqgSzi/WMUGUvuDmqa6/C4wIAxx7xEex1OlFg8gvllIuVo?=
 =?us-ascii?Q?D8uT5SFlhMWvbUwkIw1ljSx7wgN04CbU8prHXCVd0Beb6+rQrpbMreH5piaM?=
 =?us-ascii?Q?EjfOkx8HOwFMgD/pq+x+jMAp7Xfa7L9P5ObeRV3eJyvxVGDg1lzPaQZcL3T5?=
 =?us-ascii?Q?4Xs/I4NrYasJbX8HjWcm4vtyRtlAGxFjnXthS7n1UzeQ7nWYYLfBRNpIccYA?=
 =?us-ascii?Q?LyUxjc/cXs+COCEtIWhgP8dfa/XectM9Oqp5j8Fb+VtvMdklPhwt5s/3QJXd?=
 =?us-ascii?Q?hN1kqeDUhx8d0yNoNPzPAD/873IHCdx8x5ZezfvukofbP0POMFXY+3k+VzHZ?=
 =?us-ascii?Q?jpB35/LJDN5Nx9GhSJ7hlojIPQFLeTLDzM9ME0uO+5jOvxGIl45kotlSWSuI?=
 =?us-ascii?Q?z8xVoJWvs4pL1dbwfmw+6ihSSK2gBRb8USqcptF0ACGZezb30ZByv9XGY5zt?=
 =?us-ascii?Q?Xb3Ndwnrsk6tihN2v+G77fK1ZJkVRPALeaz2BccS+PV+fJYIDyH3X09lZ8Z+?=
 =?us-ascii?Q?vyJev37uvqiRud4Wi2Yh5J2xrUvmyzdyTDypxntj3WeK8GsDdlCztUj1LD31?=
 =?us-ascii?Q?6y4UA16CR4ZVQEJCpA49IhxW1MOI/UkDzZVZ1s3dIdVesJwcnpFAN+NXR3h7?=
 =?us-ascii?Q?R0uGNDruryi7Jmn7PYsiSzMVyQqfbrGprqhA4TdcHqJSti8x/wPYhOp5mq2P?=
 =?us-ascii?Q?yw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d390dc7-343e-4446-8645-08db20282cde
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 22:55:12.9118 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EwBNdzmBF3oq2PAiPoONWYht+8HHaG1T8va1nVSdqkm8ZC0ty/YxSDJPOEiyZdY4UzhSyWM0z2tJN/dsh2FeiigD5HzACR/a0cxZ17oMF7I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5444
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 13/19] drm/xe: Reorder WAs to consider the
 platform
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

On Tue, Mar 07, 2023 at 01:24:40AM -0800, Lucas De Marchi wrote:
> Now that number of platforms is growing, it's getting hard to know the
> workarounds for each platform. Split the entries inside the same table
> so the workarounds checking IP version are listed first, followed by
> each platform. Next step when it grows too much is to split in smaller
> tables.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_wa.c | 93 ++++++++++++++++++++++----------------
>  1 file changed, 54 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 67539f9d70b4..155cabe16e2e 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -99,6 +99,24 @@ static const struct xe_rtp_entry gt_was[] = {
>  	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F10(0), IECPUNIT_CLKGATE_DIS)),
>  	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
>  	},
> +	{ XE_RTP_NAME("14011059788"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210)),
> +	  XE_RTP_ACTIONS(SET(GEN10_DFR_RATIO_EN_AND_CHICKEN, DFR_DISABLE))
> +	},
> +
> +	/* DG1 */
> +
> +	{ XE_RTP_NAME("1409420604"),
> +	  XE_RTP_RULES(PLATFORM(DG1)),
> +	  XE_RTP_ACTIONS(SET(SUBSLICE_UNIT_LEVEL_CLKGATE2, CPSSUNIT_CLKGATE_DIS))
> +	},
> +	{ XE_RTP_NAME("1408615072"),
> +	  XE_RTP_RULES(PLATFORM(DG1)),
> +	  XE_RTP_ACTIONS(SET(UNSLICE_UNIT_LEVEL_CLKGATE2, VSUNIT_CLKGATE_DIS_TGL))
> +	},
> +
> +	/* DG2 */
> +
>  	{ XE_RTP_NAME("16010515920"),
>  	  XE_RTP_RULES(SUBPLATFORM(DG2, G10),
>  		       STEP(A0, B0),
> @@ -162,47 +180,15 @@ static const struct xe_rtp_entry gt_was[] = {
>  	  XE_RTP_RULES(PLATFORM(DG2)),
>  	  XE_RTP_ACTIONS(CLR(GEN7_MISCCPCTL, GEN12_DOP_CLOCK_GATE_RENDER_ENABLE))
>  	},
> -	{ XE_RTP_NAME("14011059788"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210)),
> -	  XE_RTP_ACTIONS(SET(GEN10_DFR_RATIO_EN_AND_CHICKEN, DFR_DISABLE))
> -	},
> -	{ XE_RTP_NAME("1409420604"),
> -	  XE_RTP_RULES(PLATFORM(DG1)),
> -	  XE_RTP_ACTIONS(SET(SUBSLICE_UNIT_LEVEL_CLKGATE2, CPSSUNIT_CLKGATE_DIS))
> -	},
> -	{ XE_RTP_NAME("1408615072"),
> -	  XE_RTP_RULES(PLATFORM(DG1)),
> -	  XE_RTP_ACTIONS(SET(UNSLICE_UNIT_LEVEL_CLKGATE2, VSUNIT_CLKGATE_DIS_TGL))
> -	},
>  	{}
>  };
>  
>  static const struct xe_rtp_entry engine_was[] = {
> -	{ XE_RTP_NAME("14015227452"),
> -	  XE_RTP_RULES(PLATFORM(DG2), ENGINE_CLASS(RENDER)),
> -	  XE_RTP_ACTIONS(SET(GEN9_ROW_CHICKEN4, XEHP_DIS_BBL_SYSPIPE,
> -			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> -	},
> -	{ XE_RTP_NAME("1606931601"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
> -	  XE_RTP_ACTIONS(SET(GEN8_ROW_CHICKEN2, GEN12_DISABLE_EARLY_READ,
> -			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> -	},
>  	{ XE_RTP_NAME("22010931296, 18011464164, 14010919138"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION(1200), ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(GEN7_FF_THREAD_MODE,
>  			     GEN12_FF_TESSELATION_DOP_GATE_DISABLE))
>  	},
> -	{ XE_RTP_NAME("14010826681, 1606700617, 22010271021"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
> -	  XE_RTP_ACTIONS(SET(GEN9_CS_DEBUG_MODE1, FF_DOP_CLOCK_GATE_DISABLE,
> -			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> -	},
> -	{ XE_RTP_NAME("18019627453"),
> -	  XE_RTP_RULES(PLATFORM(DG2), ENGINE_CLASS(RENDER)),
> -	  XE_RTP_ACTIONS(SET(GEN9_CS_DEBUG_MODE1, FF_DOP_CLOCK_GATE_DISABLE,
> -			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> -	},
>  	{ XE_RTP_NAME("1409804808"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION(1200),
>  		       ENGINE_CLASS(RENDER),
> @@ -217,6 +203,30 @@ static const struct xe_rtp_entry engine_was[] = {
>  	  XE_RTP_ACTIONS(SET(GEN9_ROW_CHICKEN4, GEN12_DISABLE_TDL_PUSH,
>  			     XE_RTP_ACTION_FLAG(MASKED_REG)))
>  	},
> +	{ XE_RTP_NAME("1606931601"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(GEN8_ROW_CHICKEN2, GEN12_DISABLE_EARLY_READ,
> +			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	},
> +	{ XE_RTP_NAME("14010826681, 1606700617, 22010271021"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(GEN9_CS_DEBUG_MODE1, FF_DOP_CLOCK_GATE_DISABLE,
> +			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	},
> +	{ XE_RTP_NAME("1406941453"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(GEN10_SAMPLER_MODE, ENABLE_SMALLPL,
> +			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	},
> +	{ XE_RTP_NAME("FtrPerCtxtPreemptionGranularityControl"),

This one probably doesn't belong in this file at all.  It's an
i915-desired policy rather than a workaround.  It should either go in
the tuning file, or in a new policy file (if we decide we want "tuning"
to stay focused on the bspec-documented suggestions).

Wherever this moves, we should probably copy over the mega-comment from
i915 since it was explicitly requested by the maintainers that we add
that explanation.


Matt

> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1250), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(GEN7_FF_SLICE_CS_CHICKEN1,
> +			     GEN9_FFSC_PERCTX_PREEMPT_CTRL,
> +			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	},
> +
> +	/* TGL */
> +
>  	{ XE_RTP_NAME("1607297627, 1607030317, 1607186500"),
>  	  XE_RTP_RULES(PLATFORM(TIGERLAKE), ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(RING_PSMI_CTL(RENDER_RING_BASE),
> @@ -224,6 +234,9 @@ static const struct xe_rtp_entry engine_was[] = {
>  			     GEN8_RC_SEMA_IDLE_MSG_DISABLE,
>  			     XE_RTP_ACTION_FLAG(MASKED_REG)))
>  	},
> +
> +	/* RKL */
> +
>  	{ XE_RTP_NAME("1607297627, 1607030317, 1607186500"),
>  	  XE_RTP_RULES(PLATFORM(ROCKETLAKE), ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(RING_PSMI_CTL(RENDER_RING_BASE),
> @@ -231,15 +244,17 @@ static const struct xe_rtp_entry engine_was[] = {
>  			     GEN8_RC_SEMA_IDLE_MSG_DISABLE,
>  			     XE_RTP_ACTION_FLAG(MASKED_REG)))
>  	},
> -	{ XE_RTP_NAME("1406941453"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
> -	  XE_RTP_ACTIONS(SET(GEN10_SAMPLER_MODE, ENABLE_SMALLPL,
> +
> +	/* DG2 */
> +
> +	{ XE_RTP_NAME("14015227452"),
> +	  XE_RTP_RULES(PLATFORM(DG2), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(GEN9_ROW_CHICKEN4, XEHP_DIS_BBL_SYSPIPE,
>  			     XE_RTP_ACTION_FLAG(MASKED_REG)))
>  	},
> -	{ XE_RTP_NAME("FtrPerCtxtPreemptionGranularityControl"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1250), ENGINE_CLASS(RENDER)),
> -	  XE_RTP_ACTIONS(SET(GEN7_FF_SLICE_CS_CHICKEN1,
> -			     GEN9_FFSC_PERCTX_PREEMPT_CTRL,
> +	{ XE_RTP_NAME("18019627453"),
> +	  XE_RTP_RULES(PLATFORM(DG2), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(GEN9_CS_DEBUG_MODE1, FF_DOP_CLOCK_GATE_DISABLE,
>  			     XE_RTP_ACTION_FLAG(MASKED_REG)))
>  	},
>  	{}
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
