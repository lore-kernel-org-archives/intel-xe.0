Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB6D2C6FD1F
	for <intel-xe@archiver.kernel.org>; Tue,  2 Apr 2024 15:56:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 826D910FDD9;
	Tue,  2 Apr 2024 15:56:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="latHLkXM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1279A10EB70
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Apr 2024 15:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712073372; x=1743609372;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CAuGn5glJMORnkdcUZzNHuR/pmLFBWogtXKThFFVOdg=;
 b=latHLkXMy8tMkr6IvmCh8QWeoX5KJaUm8JLWBls7FQnQAuE/xrz80TDQ
 18i2ZkaLMMuDp7GRMo+ZeCRKDllqTxwrDvyjSnjsvfl2YURIhh3BMnJOU
 DNZ3hfkGM3l3/g33NqdA6A7Ii5lgi3VSaJNadF7r2i4wKvk2YPqfSdeTB
 W3wlSIBoz5xjS9kNjXtp+SZWlEqkjiiKUM5QIqrFrbXhzrR17Pk83evVX
 7V0pL700K2gHGUTqL1MPK8Yv2ef4POUml2OfhKTS6KNlelXUsQfVLFyfy
 CVvxiA4m0QoUALQj3Oz7N5wmoEk1NQ/jioirRCxO5BiugqAzJN9SYRujs g==;
X-CSE-ConnectionGUID: IRlYBvLPTnWZhoBBTrxW5Q==
X-CSE-MsgGUID: dFnh1kVNTOKmiVw9juiCow==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7410625"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="7410625"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 08:55:57 -0700
X-CSE-ConnectionGUID: Vqsih2DrQh2ZmUo23LZ/Kg==
X-CSE-MsgGUID: hjml8HkxRlC9dSgSewC0aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; d="scan'208";a="18158473"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Apr 2024 08:55:55 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Apr 2024 08:55:55 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Apr 2024 08:55:54 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 2 Apr 2024 08:55:54 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 2 Apr 2024 08:55:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TfRfYp/i1FaQuIMb2pIHEaD2BmqYM7q+tn5Cs4u6ViNtzhDqTIZaJiA/E3hzCkAhMtZiuv9mt3J4NTYFBN7mOLuskaS9xKanODDKmGw2lAMVldvMWt0hYqgUb9fiGP8OfoQIdcCW5F/XghQrZ9KcXmSi/ptCToCggZ4/wBQ8uWCXSfugV2XC51RL9XvhezrIhpmz18wujOi+LE4DmKEncf0fG2KQkDeGvfBw0mPaT8QaH/w6+uW7qcpK9ktaDl5DYRbIVc6cTIc8CxhmPCCbyEiBl1Ui0JhdAh5wG22vKMYNvVysX/XwKi2iuKpykv/UCc3v7jzV5/BpjRIQnRklFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJWKUmBcGDnHY+FbmeQ2cz1znMqyhvv0lnmalvMk5z4=;
 b=b8Ar82pCPRxjAqtjcw7nwqV3OycMG02BLnIQvtqsabqDCcSyqKHKPtjKth7WfDCtp/l7jfsHSbTSLS32TpJ/JIN9PCKLN7D1Do7wLuMjLv8gzZNOY0fe7AZBShuF3EK7r1nTO/vMNQP7SGaDaIaOYHFF46poSEOpL9cpfjg8DD03uIklE8jj5ZoJ2Qz0CtQ6gtZoGbUyo6nhtjyH/gU7OCofjc2vZI9iumOL8pEktVT+SH9Ep6R2gymGperfYw6grRHf+y5tBNvMdm9xkP5tuC07HHADts0Knz3Y0k5O70sdYUegniHSTOKtr2J4I2kiLTIbG5s1MBLZbUxIqMx6Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by BY1PR11MB8126.namprd11.prod.outlook.com (2603:10b6:a03:52e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Tue, 2 Apr
 2024 15:55:52 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7452.019; Tue, 2 Apr 2024
 15:55:52 +0000
Date: Tue, 2 Apr 2024 08:55:50 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH 10/11] drm/xe/xe2hpg: Introduce performance tuning
 changes for Xe2_HPG.
Message-ID: <20240402155550.GG6574@mdroper-desk1.amr.corp.intel.com>
References: <20240402124724.1238122-1-balasubramani.vivekanandan@intel.com>
 <20240402124724.1238122-11-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240402124724.1238122-11-balasubramani.vivekanandan@intel.com>
X-ClientProxiedBy: BY5PR20CA0023.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::36) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|BY1PR11MB8126:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cms/4dPV+zz5alS0R20FhoOCodeU51HbcUCuOc/f7cOTKqQSGlya4p16MNpX/JlabyTmhaYjX2ekHhNTlDG9KMsfLxByt6HlhKtycCVMLTTEO5O7Oqae3xexUdKQwbzw+p4lWfD0R48OAHRb0nwAgaRW29oUVh4dfLxAAFJT99zFEFEpzlbjo3PStCJ5FhAiZgwbT+xCJkVKbGbiG6xoLg4MkgDd3HM3x+p78Raf3GeNVsf6AmNKrWyCt91N6t9+Hb90zizv9ROpefoJy6jnB87NlQVDZKiHdNMtGordoJd54ZF6NMIoTzM8YcNx0gMrxJ8u2fwDOT+PKr6Mm1TaHGGPzqJOw8juZPMy2eRemsB+wvanEDTo0riw8WalPdzIzZiCyVqaltXYMCEq6Oqbpw7Nr76Ovnapi8rk5QsQM+mnwADwpbvwr2jRV1FDGEotNGdu91/rX9U4Nrr7TTrMOtmrT3JagO4YR0dcvxYT4Z9N8sKPTv2jtjz+gohi7pqPC9/eUfjhiTqiUoLb7g43kajXoIzUldCf6MWJMTUw9GjssgzkJ5UNFGH2NjBDRnrE6zFxA7ojzY891ebP9QGP054LLuGM/L87rVezs+9ESQBWOxSMpeadeLPp9OFLnji45TTCwPRA064V/MA5yBZijBf4PtDTb7Z/zmGeaKdy2GE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?93xqaiX+hq19RgE28vzwzLq09y/6kMASk8CWzPknveiZu/bCMDr0cKxbSFgC?=
 =?us-ascii?Q?GXdNoMqWRtZa5HyTFq4C63GdNadF3pvmfL+88rgSv3iGFQS8AhEeAcygJAs4?=
 =?us-ascii?Q?LOroHDhWVweg4WxHw+kt5Rj1aby1nSImeGmyTiMk5hcBdCdIE54XlMdeaRhU?=
 =?us-ascii?Q?w94OiuG4HiCOaJAzrQZ4cpswQdHUCboumvtrw47KmM8WEONA3Hp3zfN6Z8/y?=
 =?us-ascii?Q?lIIAYLYEgqK89PbJrpVCEp3h9ZLX0FR0h5dO4Bw78ll9hWl+EFFZoQWKkqwM?=
 =?us-ascii?Q?pcHdjz8is09hH/xUveIEmAn51oSISqhxKiUG6vkMYpozsG/k47Fvk8nnhEkf?=
 =?us-ascii?Q?PmU27vzcrrEUCC6c7wn010TViO/snHuiWp3+8caFnV3U25iztE3yP6yvCix1?=
 =?us-ascii?Q?bZKp2/A7kpb0JexImTiXI6fZmk60v8RKTLcVBx+H+RLNjQ3YiN9R665Q/AbB?=
 =?us-ascii?Q?ejjFaSK+HAzae59shQ3q3vtC72vBxxvcf5fxVm2tVd2Ui5aGlmDInIqMQncy?=
 =?us-ascii?Q?nDrwcVvg3kDxnlo8FoX8dBIOVbfBTHo3XABmBkgewS9gaKBtVUPy+dsPxwDf?=
 =?us-ascii?Q?8NTYYoKgGlWvwo24sSrbdNdGvlstgwEAjTtbAB8e9KYYyylrJ5JvP2xrKnx9?=
 =?us-ascii?Q?vamF5DpvLRMKVjzbXrB1r8KDfN2yfbeTRAOVYKzTFJc+famlDxEdlj13aI+3?=
 =?us-ascii?Q?q5U3GyASHXf+1aVdlcS0GkyDSMyyde2Ly2Gyh7sirO6+7VrP0okJexwoNMLg?=
 =?us-ascii?Q?OJyfke5jqrkZKho6/45RtLU+mhukjdcWiPd1Qrx13/zVKxy1q9gEeovppuMg?=
 =?us-ascii?Q?0vl0A7pnQ5bATMlhjuMIo1mBQr04HILgQ3htXUN0uFFEzKSyzJqRQgNtUc3N?=
 =?us-ascii?Q?5wnssTtRVCnQh0urfOfnyx/n51lBtWg/uBL9tU2vUMoNWkVA1xCQmhV5GdI2?=
 =?us-ascii?Q?4L5TxUltBhbjQ4sVaioPoZl4jOtz0sGoH1gfREz1MO0eG4gTZYkGfWXUxHBH?=
 =?us-ascii?Q?uTUhzFF5EGRjLCiwtRx1Ufp/XhC0a8K227ddZU7NgBvM09y/XiPpi1P6LMiM?=
 =?us-ascii?Q?rwGgVkcvWyG+PsjgQBSfNdBHj7w+LEhvDzI5quqRk2QSAru39rxETygcYgLp?=
 =?us-ascii?Q?s7BTmthM4/eSvBezpKBiPNJrfF3DGtYinHTV5MhMJV9/J6ckL698ZANBHxYx?=
 =?us-ascii?Q?cXEd0fvGld4jYfrITRHAGJOwj4lGdU6y/5fRTjOWCc7eeoPshzwwMtIJdVZR?=
 =?us-ascii?Q?Vu62gWBuYvZHWjwzH0KZH0O1urvm9MFf3aJyOQze0OAAb6/oi8zz6H/SOPt3?=
 =?us-ascii?Q?Ld3gJkdmyxJuUKwuCXhK9mmxfwvVJc0KZ0A6S9pWoDsDRjxrN4JLibLvDc96?=
 =?us-ascii?Q?jl/PD/4j9LgxYFJeRyTDUD3+4GEv0hq/7dq7F46J0KHmi/soVR++SXJe8dRT?=
 =?us-ascii?Q?qfQDCaV3oUEj5bl/5w+JungFQJIF2JwEc9I5WNtjsjpFR1xcl7Ujx7VzjQ+o?=
 =?us-ascii?Q?W0rHLnZzWxCrK2B7daXqP1ud9ljxBzbhVL3lFcDD8LKX2WgK8GswL0/XqLsS?=
 =?us-ascii?Q?a7xQA9w/fbfCH+oWJKcXwmizel2hcC47bg0xMGF8xwT1XqJkiWOIAAkA3ypA?=
 =?us-ascii?Q?3A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7415fb6d-1a0f-4da8-6b02-08dc532d5fb8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2024 15:55:52.5740 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2KU9SFjazIEIMVc7qUqOlHpfOxnhSqFQzihZUuQDtOylGdo7EqtfGtgkOvDZxNMDSnAoiF4gqGcrCRYXq3spgK7K707ihHNN13fyduS1GKc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8126
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

On Tue, Apr 02, 2024 at 06:17:23PM +0530, Balasubramani Vivekanandan wrote:
> From: Shekhar Chauhan <shekhar.chauhan@intel.com>
> 
> Introduces performance tuning guide changes for Xe_HPG.
> 
> BSpec: 72161
> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_tuning.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
> index bb6db2817ada..d02492cb0fe8 100644
> --- a/drivers/gpu/drm/xe/xe_tuning.c
> +++ b/drivers/gpu/drm/xe/xe_tuning.c
> @@ -28,7 +28,7 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
>  	/* Xe2 */
>  
>  	{ XE_RTP_NAME("Tuning: L3 cache"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(2004)),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004)),

We might want to just take the opportunity now to switch this over to an
open upper bound (XE_RTP_END_VERSION_UNDEFINED) as we already have for
the other tuning settings below.  For now it's simplest to assume future
platforms will continue to use the same tuning.

Aside from that,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


Matt

>  	  XE_RTP_ACTIONS(FIELD_SET(XEHP_L3SQCREG5, L3_PWM_TIMER_INIT_VAL_MASK,
>  				   REG_FIELD_PREP(L3_PWM_TIMER_INIT_VAL_MASK, 0x7f)))
>  	},
> @@ -38,11 +38,11 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
>  				   REG_FIELD_PREP(L3_PWM_TIMER_INIT_VAL_MASK, 0x7f)))
>  	},
>  	{ XE_RTP_NAME("Tuning: Compression Overfetch"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2004, XE_RTP_END_VERSION_UNDEFINED)),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED)),
>  	  XE_RTP_ACTIONS(CLR(CCCHKNREG1, ENCOMPPERFFIX)),
>  	},
>  	{ XE_RTP_NAME("Tuning: Enable compressible partial write overfetch in L3"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2004, XE_RTP_END_VERSION_UNDEFINED)),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED)),
>  	  XE_RTP_ACTIONS(SET(L3SQCREG3, COMPPWOVERFETCHEN))
>  	},
>  	{}
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
