Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 659AFCCA470
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 20:12:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 259FD10E45D;
	Mon,  6 Oct 2025 20:12:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q1YBzlyz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 330FE10E45D
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 20:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759781577; x=1791317577;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QWp+S+zBL/Lq8mXx/qUyKexNmO3VgOz1X6FpLY+OxBo=;
 b=Q1YBzlyzsltqMR2YtaAdG6yhruTleElMRL+3QaV7WNOaFM6X4nrsquU7
 Xka1TDisAHYpbWWtl50goeY11J3LFH9de7xFG5NL1sonqlgSfiqcexmJz
 pnLBROg2yTLVv+mArJV/k7cWiRuSZaKkdaXJ5Dq8XawKLayZ0hRukGQk4
 3PMc2noN/D1a4xeW+c/8sdBYIjd/JHS38rPWWFDcA5ed9APcMJ0+8WYqN
 FSpWFzhdRca3k5ciCem9iHqlp1vMAAJNPblpOPfppVQmRSumM+97qxu4R
 1gQYVYs7BzrqVGHhxe50fG8FwfH8QkZmY4v455Bo9pH5oP0XBoi+PtoW5 g==;
X-CSE-ConnectionGUID: /zFlsrlBTKWDem6TYqZIwg==
X-CSE-MsgGUID: UUv7Xs7YR9exa6r5fAXR1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="73385072"
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="73385072"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 13:12:57 -0700
X-CSE-ConnectionGUID: h9VfuZIESsG0ZzVLO0Dc6w==
X-CSE-MsgGUID: gmu8GQU4R5Cup23fw4hlQQ==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 13:12:56 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 13:12:56 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 6 Oct 2025 13:12:56 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.21) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 13:12:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e1ROJ8E5WT3YQoY7uSNkTvPmsMtR2MoKpUOSsWj88XLsI9xuHYLQf1BAmwguM91Jbf5C76BN5GD3SzPd8FkRp+0uspcDWqTCZUPmhq3V540eoWdqLlrCfi/BRH9pb476aVheOgD2Z+vInHt2IBVrbpTK71jz5S7v4rZ896haE3R3/v2dUuPqBU3MEmJkj48uTzaKmKdbndhOpTxPMO8I6B914JsMeD4Hlj419E8mw8iuMo4jOe8r3I+NtUl82nYHZYZDjNhBZy/Eq2o/FhK+A2NxMZ7lCpRLtCJZaU0w+tpSAN25Nx33KIiyRB7lp+QMBS99Xu+j/ZJhzQZZ9Q38tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c14fcqgfgW3N6bMezQkKxvT+8ffgOdfalAS+JnIWTbw=;
 b=nRY9RCGF204aD0OEnKesCY0HjBPovM49gjprLn9r7jvCdlRWaK+1Ojn7a5U5/leCfDA3o/0ZyU8+nUoopMwSLRgrwj6knA9x6j6M87Mcfv7AuUp2pWIQxtLLtHg4YrdGKPdcHcX4Zx3fomBA4yjtalQnZFKGR0U4JwdnWzp/RUQFvslmkHnR27bs8a7pJSH+UxD5tsrEcSvRm0vjbLmsCQ0Ca1r47wLeP/vlh24BuFAzzqUJqYos7pHHJ08xqTfpRdoG7l0uzr8H/IEFxFReFP0MhYKO1CIzSx4rWlL3AmFVD7+G6Y88QroS0UJWn0vx30cJ+htEfYzHzrgPdH+Qlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB6820.namprd11.prod.outlook.com (2603:10b6:930:60::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 20:12:45 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 20:12:45 +0000
Date: Mon, 6 Oct 2025 13:12:43 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v4 3/3] drm/xe/vf: Clear CCS read/write buffers in atomic
 way
Message-ID: <aOQiu9ImX79DLiLQ@lstrano-desk.jf.intel.com>
References: <20251006152443.12269-5-satyanarayana.k.v.p@intel.com>
 <20251006152443.12269-8-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251006152443.12269-8-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: BY1P220CA0003.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB6820:EE_
X-MS-Office365-Filtering-Correlation-Id: 62dc19ab-4629-40f4-4477-08de0514b679
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Xc6tgqAA+pQpPzXl6Saerv/X9RjDP9sqVndXXmIsXn1+oAH9UENgzHxkCHJA?=
 =?us-ascii?Q?kwimQpcl7xWlDcH2Zu3MrbjXbh+MyXfzcgKK4gbW6Ixl6hD9BrOL9aoD9bko?=
 =?us-ascii?Q?E/Qc07QO/PFnw9Ct9uEpHX0y0D+F3LYgipXPvdnKyGbv4xioSjkBgQaBGhHF?=
 =?us-ascii?Q?2zG6/jUNEMqhRB2Ot5Q0iqicAFpXrcpU9r5CFVuRp6kw6ZUN6R6UBeEwpQob?=
 =?us-ascii?Q?6gfiv3fNBnqPUENN+0vAe6IU5/6xY8Ahddin/EtE4zBLCze2mMOfw4GtpfLo?=
 =?us-ascii?Q?8E17+wm61XaWWJLgMo2sFz4jfRDRJKyEYykrULw5HV06OAjWjzaucwd11N77?=
 =?us-ascii?Q?bTL5cxKP7FiyBjIoZ2eFs1mks156GstEuDNMZEoz1uTELobj5zvh3z8HbavG?=
 =?us-ascii?Q?1i7wvudsoLloOc3DL2ulCrKgTvFqHIIE97zKUyBSgv8ct14g+Ks8beff9eu/?=
 =?us-ascii?Q?Y6JKTHUMorqHV11M4r3P5OQkAmtwjDewKUCcSPM5S1tVDwwdw/ZEo3zfSrl2?=
 =?us-ascii?Q?8KiJ6FcS5zZQZfKg7K/ZEsjk6pkyaAOz4+YtbyRmPu+VkL4DGpI95Faho4Sp?=
 =?us-ascii?Q?y0xCPOVwtuWUd9mCAOfcxyB+9ARr23TRaTG89VhFuv2MhwLjd0+btfdTrj93?=
 =?us-ascii?Q?xli+BoKO/6NhGZkuowR2lqePkA7CNHmLWYAr+PyqADU5NQQr+PBr6+03qoyg?=
 =?us-ascii?Q?s5Pk1pKKDjykHNXQho/wsbPrkE7I1Y9lz5QNqCiqC8laSiHE4udrttuN8AZb?=
 =?us-ascii?Q?wVkzHWP4ZwTcT2dR9mOdC6qVALYRqzel9T4zfQO0okWvPzTAArAuJTzyzSZP?=
 =?us-ascii?Q?W84vxukrQnGiLMf/HF36DhRbzV0XmFBHjoqF8pTBJlRktKv8RAFxurdg1qJR?=
 =?us-ascii?Q?C8YpReOWrCLrQPzPc9xuIjqqVH3HZcvAxrlrbNyZvhuLQsVTQY2kRVwRZL9S?=
 =?us-ascii?Q?YMyd+yCd1bL8oqNFUI2J6edek0+fHzVHTimzxrQycxofa9SinrZzhDmjHVZl?=
 =?us-ascii?Q?NbznDLafkVv3vL3MfpdEAxzwTrx/mLrDIgpyCHNrHNLNu3CNbd378xGWcbUr?=
 =?us-ascii?Q?548VQdL/AXwMjXEviIRE5AipJxVPyxicX9a7ovxP2O76lQIPEm6HP/ydYZhI?=
 =?us-ascii?Q?k5lDrqzK4WWRAJVo90iHsGo1ZO6eoW5xy63qq6wlWFCnx66cd0piAKpr368I?=
 =?us-ascii?Q?AKnTpsTsmW3nM35l+UMmGUbivNJus+5QsFLuTqcJTytl3vPsBStqqNQIrNbg?=
 =?us-ascii?Q?jAWHeoSSKNRel/qqvvyxidaFcGSDGzS/+FeRYYkGq8+W0oxZXxm8Vc6lexnN?=
 =?us-ascii?Q?9Btz73JzY3CKaqy95IWsrSf9sr4ydFA2vX+YE9Geh6A7cAZontS4pMQX13Qs?=
 =?us-ascii?Q?UYJUY3Hh1rcs9eXRyT7REfZHNsck1FM23d9PPrlzAzVqhwpQsS336Qk4jnr5?=
 =?us-ascii?Q?WdUafYxGi7ZZlFQD6QKSd2dUPIsnzUmm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4ACP47JyTUo2XOskYyY4HtX0eb4P4zL7mL49awyCl+F4Qr4FjRuUTl4NbkFQ?=
 =?us-ascii?Q?yj0CZiDy5PDpNNP2yKXPw6EQAnHR7OxQhgV3gTvU6SSiZjkZ/y5wt89sNAWz?=
 =?us-ascii?Q?/hAefmXba9if9O+2wxvav1Qj7rLGn7hluDnM50Z19FFp5CSsaiegFcFq1JVR?=
 =?us-ascii?Q?A0uhx5SKZnHleaO5N4JU7WCoJ3A0ZpBlq8CA8T9ptFymgEMfAz51nrBlDLwZ?=
 =?us-ascii?Q?7g8+qDJkZArcmDD9l6MAcyp5LIw/y9IckX4fBx0W4kIN75EJJEyLl+OAX9i+?=
 =?us-ascii?Q?dMHGy3sgLy9TpJdCkDhD7yTfGre5Ly2JGTj1xSGuxOypK88mTz1dBKPkRAmA?=
 =?us-ascii?Q?B8OidN8uGOFSlgwpyIBCedNeow30pMMf6vNqONjI3wU2sP4BvAI2Kd9peXsm?=
 =?us-ascii?Q?UhGiMRBpdPaGrRz2FnDf/YCFC8LgyPEPjuB+yPSw9J9ii2cHw12RP/Dd1xnN?=
 =?us-ascii?Q?YJyeodkXsyx2stxipHlxCSrTLn/rFH/UK0fCVzBmW+yEKx+XEAfhCLv/18eF?=
 =?us-ascii?Q?HiTl5bDpcWjwJ7UOpFuqWwDJRS3OZ1m/TuWsbL0N+Bud1GZyAEb6loRbg0Dd?=
 =?us-ascii?Q?choDvE8qDl+4ucJ3OSbLUhVHirkH8r8vjBqIvJ1ifDtok+D0Z6uaHHzHx2B6?=
 =?us-ascii?Q?+mnoepC2SY68Giq6YtJcfcKtbduFZ9tm7IoXNRgPdJCiXj40AalgNS2MwSU1?=
 =?us-ascii?Q?6HGuxRN6LmZCGDqoz37oOw5hRhXrFCYGrlrlpgiRZS5IJntTsOkGoYw4hn4E?=
 =?us-ascii?Q?bINLOsNB/XeGsn4ZKdvTcQNdGH18OUb0YVGdutTIpviy8lzDY2C18On4aq4O?=
 =?us-ascii?Q?0fc6BhDWp4QLeTv3qAGHF93jMpari+vilc56tfA+a49Tz/6/DZpSuOQ5D82w?=
 =?us-ascii?Q?01CX8KoawO2IYXwKZTNXm2/eKrTi9fApfVDPsTHaLTmFLNhU5AsA1/0SROjU?=
 =?us-ascii?Q?wl/ed0KsWv60ut0gJ1QnATjigyHJ8nW4rRDjdcJ6Xv84N8TYpI0pw7Fhag6g?=
 =?us-ascii?Q?oPKnA+MvFA/+s1ZtJhu9e7rCJMi32mZPhLlrKTOHSXhVZVnIgaaQMC+odhdI?=
 =?us-ascii?Q?hxa8spJCBL13fJuZq2Tu/25M7941siE7epgRFeY0H8SrCREXmENsGHGUG6Qp?=
 =?us-ascii?Q?ZAkD4yKj4G6+m0NHhbXqlESWk7q1Cf7SJxh4GgC23DgNCfv9YDOOAO9HxeNB?=
 =?us-ascii?Q?uN74NciND3XALyhbXVB1gT1/yB6CKQP3FKEUhg0kj/qGeO2TnwAVpwUXSPtF?=
 =?us-ascii?Q?9cPQPv+6qIXv9wQKvUDJ2/7Pr1gUY9y6SDunUVGWxddaRepEPf5uIScQGxDm?=
 =?us-ascii?Q?w+TIZeH7GlyjcEnkd9N9IMqsfPWZ3IPBbAM6I32Q9GjG6LT5K4vkbxh8rSDp?=
 =?us-ascii?Q?9GGRzVZE9z8b5GKF+PCLAyLOBLKoGubYxw6XFanzrcMpAWb3CR5TyT3iSt3o?=
 =?us-ascii?Q?EkeaO6lUiGNzQPGwVmMlrHR69avizXaig0m37pn2F3Z04brGHQFPV4Oug8K9?=
 =?us-ascii?Q?q9G1RhJio8ky6l7ugcYOqxn1e6YlZebVdcO/IHcoig05f6XlNpQt/kwgsSXJ?=
 =?us-ascii?Q?/yeT4/gvYfdB4MyiwPyPII0eiah87bfp0B15+kNvg4eQYKzLYGzf7dr+0kD2?=
 =?us-ascii?Q?Fw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 62dc19ab-4629-40f4-4477-08de0514b679
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 20:12:45.3550 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hqdse7Ks20bfPrDm9DjZ0O8e/SNQrRaf4dJXfBz4cGs8SCAwrZn9rRlIM9T5veRcZvOvDMOJ61I/zbXDkKFMwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6820
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

On Mon, Oct 06, 2025 at 08:54:47PM +0530, Satyanarayana K V P wrote:
> Clear the contents of the CCS read/write batch buffer, ensuring no page
> faults / GPU hang occur if migration happens midway.
> 

It is going to take me minute to fully validate the algorithm given the
complexity but some quick comments.

> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> 
> ---
> V3 -> V4:
> - New commit added.
> 
> V2 -> V3:
> - None
> 
> V1 -> V2:
> - None
> ---
>  drivers/gpu/drm/xe/xe_migrate.c      | 130 +++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_migrate.h      |   3 +
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.c |   5 +-
>  3 files changed, 137 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 4c575be45a76..71c446e74d84 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -651,6 +651,42 @@ static void emit_pte(struct xe_migrate *m,
>  	}
>  }
>  
> +static void emit_pte_clear(struct xe_gt *gt, struct xe_bb *bb, int start_offset,
> +			   int end_offset)
> +{
> +	u32 dw_nop[SZ_4] = {MI_NOOP};

SZ_2 or just 2.

> +	int i = start_offset;
> +	int len = end_offset;
> +	u32 *cs = bb->cs;
> +
> +	/* Reverses the operations performed by emit_pte() */
> +	while (i < len) {
> +		u32 dwords, qwords;
> +
> +		xe_assert(gt_to_xe(gt), (REG_FIELD_GET(REG_GENMASK(31, 23), cs[i]) == 0x20));
> +
> +		qwords = REG_FIELD_GET(MI_SDI_LEN_DW, cs[i]);
> +		/*
> +		 * If Store QW is enabled, then the value of the dwlengh
> +		 * includes the header, address and multiple QW pairs of data
> +		 * which means the values will be limited to odd values starting
> +		 * at a value of 3(3 representing the size of a 5 DW command
> +		 * including header, 2 dw address and 2 dw data).
> +		 */
> +		dwords = qwords - 1;
> +		/*
> +		 * Do not clear header first. Clear PTEs first and then clear the
> +		 * header to avoid page faults.
> +		 */
> +		memset(&cs[i + 3], MI_NOOP, (dwords) * sizeof(u32));
> +

I think you a need wmb() here to ensure the above is GPU visable before
clearing the header instruction.

> +		WRITE_ONCE(*(u64 *)&cs[i], READ_ONCE(*(u64 *)dw_nop));
> +
> +		cs[i + 2] = MI_NOOP;
> +		i += (dwords + 3);
> +	}
> +}
> +
>  static void memcpy_vmovdqu(void *dst, const void *src, u32 size)
>  {
>  	kernel_fpu_begin();
> @@ -732,6 +768,17 @@ static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
>  	bb->len = cs - bb->cs;
>  }
>  
> +static u32 emit_copy_ccs_clear(struct xe_gt *gt, struct xe_bb *bb, u32 offset)
> +{
> +	u32 dw[EMIT_COPY_CCS_DW] = {MI_NOOP};
> +	u32 *cs = bb->cs + offset - EMIT_COPY_CCS_DW;
> +
> +	xe_assert(gt_to_xe(gt), (REG_FIELD_GET(REG_GENMASK(31, 22), *cs) == 0x148));
> +	emit_atomic(gt, cs, dw, sizeof(dw));

I think you need a wmb() here to the clearing of copy is GPU visable
before you start clearing out the PTEs.

> +
> +	return offset - EMIT_COPY_CCS_DW;
> +}
> +
>  #define EMIT_COPY_DW 10
>  static void emit_copy(struct xe_gt *gt, struct xe_bb *bb,
>  		      u64 src_ofs, u64 dst_ofs, unsigned int size,
> @@ -1062,6 +1109,19 @@ static int emit_flush_invalidate(struct xe_exec_queue *q, u32 *dw, int i, u32 fl
>  	return i + j;
>  }
>  
> +static u32 emit_flush_invalidate_clear(struct xe_gt *gt, struct xe_bb *bb,
> +				       u32 offset)
> +{
> +	u32 dw[SZ_4] = {MI_NOOP};

As discussed in patch 1 use EMIT_FLUSH_INVALIDATE_DW.

Matt

> +	u32 *cs = bb->cs + offset - SZ_4;
> +
> +	xe_assert(gt_to_xe(gt), (REG_FIELD_GET(REG_GENMASK(31, 23), *cs) == 0x26));
> +
> +	emit_atomic(gt, cs, dw, sizeof(dw));
> +
> +	return offset - SZ_4;
> +}
> +
>  /**
>   * xe_migrate_ccs_rw_copy() - Copy content of TTM resources.
>   * @tile: Tile whose migration context to be used.
> @@ -1186,6 +1246,76 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>  	return err;
>  }
>  
> +static u32 ccs_rw_pte_size(struct xe_gt *gt, struct xe_bb *bb, u32 offset)
> +{
> +	int len = bb->len;
> +	u32 *cs = bb->cs;
> +	u32 i = offset;
> +
> +	while (i < len) {
> +		u32 dwords, qwords;
> +
> +		xe_assert(gt_to_xe(gt), (REG_FIELD_GET(REG_GENMASK(31, 23), cs[i]) == 0x20));
> +
> +		qwords = REG_FIELD_GET(MI_SDI_LEN_DW, cs[i]);
> +		/*
> +		 * If Store QW is enabled, then the value of the dwlengh
> +		 * includes the header, address and multiple QW pairs of data
> +		 * which means the values will be limited to odd values starting
> +		 * at a value of 3(3 representing the size of a 5 DW command
> +		 * including header, 2 dw address and 2 dw data).
> +		 */
> +		dwords = qwords - 1;
> +		i += dwords + 3;
> +
> +		/*
> +		 * Break if the next dword is for emit_flush_invalidate_clear()
> +		 * or emit_copy_ccs_clear()
> +		 */
> +		if ((REG_FIELD_GET(REG_GENMASK(31, 23), cs[i]) == 0x26) ||
> +		    (REG_FIELD_GET(REG_GENMASK(31, 22), cs[i]) == 0x148))
> +			break;
> +	}
> +	return i;
> +}
> +
> +/**
> + * xe_migrate_ccs_rw_copy_clear() - Clear the CCS read/write batch buffer
> + * content.
> + * @tile: Tile whose migration context to be used.
> + * @src_bo: The buffer object @src is currently bound to.
> + * @read_write : Creates BB commands for CCS read/write.
> + *
> + * The CCS copy command has three stages: PTE setup, TLB invalidation, and CCS
> + * copy. Each stage includes a header followed by instructions. When clearing,
> + * remove the instructions first, then the header. For the TLB invalidation and
> + * CCS copy stages, ensure the writes are atomic.
> + *
> + * This reverses the operations performed by xe_migrate_ccs_rw_copy().
> + *
> + * Returns: None.
> + */
> +void xe_migrate_ccs_rw_copy_clear(struct xe_tile *tile, struct xe_bo *src_bo,
> +				  enum xe_sriov_vf_ccs_rw_ctxs read_write)
> +{
> +	struct xe_bb *bb = src_bo->bb_ccs[read_write];
> +	u32 bb_offset = 0, bb_offset_chunk = 0;
> +	struct xe_gt *gt = tile->primary_gt;
> +
> +	while (bb_offset_chunk >= 0 && bb_offset_chunk < bb->len) {
> +		bb_offset = ccs_rw_pte_size(gt, bb, bb_offset_chunk);
> +		/*
> +		 * After PTE entries, we have one TLB invalidation, CCS copy
> +		 * command and another TLB invalidation command.
> +		 */
> +		bb_offset_chunk = bb_offset + SZ_4 + EMIT_COPY_CCS_DW + SZ_4;
> +		bb_offset = emit_flush_invalidate_clear(gt, bb, bb_offset_chunk);
> +		bb_offset = emit_copy_ccs_clear(gt, bb, bb_offset);
> +		bb_offset = emit_flush_invalidate_clear(gt, bb, bb_offset);
> +		emit_pte_clear(gt, bb, bb_offset_chunk, bb_offset);
> +	}
> +}
> +
>  /**
>   * xe_get_migrate_exec_queue() - Get the execution queue from migrate context.
>   * @migrate: Migrate context.
> diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
> index 0d8944b1cee6..bd2c0eb3ad94 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.h
> +++ b/drivers/gpu/drm/xe/xe_migrate.h
> @@ -129,6 +129,9 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>  			   struct xe_bo *src_bo,
>  			   enum xe_sriov_vf_ccs_rw_ctxs read_write);
>  
> +void xe_migrate_ccs_rw_copy_clear(struct xe_tile *tile, struct xe_bo *src_bo,
> +				  enum xe_sriov_vf_ccs_rw_ctxs read_write);
> +
>  struct xe_lrc *xe_migrate_lrc(struct xe_migrate *migrate);
>  struct xe_exec_queue *xe_migrate_exec_queue(struct xe_migrate *migrate);
>  struct dma_fence *xe_migrate_raw_vram_copy(struct xe_bo *vram_bo, u64 vram_offset,
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> index 790249801364..2d3728cb24ca 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> @@ -387,6 +387,7 @@ int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo)
>  {
>  	struct xe_device *xe = xe_bo_device(bo);
>  	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
> +	struct xe_tile *tile;
>  	struct xe_bb *bb;
>  
>  	xe_assert(xe, IS_VF_CCS_READY(xe));
> @@ -394,12 +395,14 @@ int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo)
>  	if (!xe_bo_has_valid_ccs_bb(bo))
>  		return 0;
>  
> +	tile = xe_device_get_root_tile(xe);
> +
>  	for_each_ccs_rw_ctx(ctx_id) {
>  		bb = bo->bb_ccs[ctx_id];
>  		if (!bb)
>  			continue;
>  
> -		memset(bb->cs, MI_NOOP, bb->len * sizeof(u32));
> +		xe_migrate_ccs_rw_copy_clear(tile, bo, ctx_id);
>  		xe_bb_free(bb, NULL);
>  		bo->bb_ccs[ctx_id] = NULL;
>  	}
> -- 
> 2.51.0
> 
