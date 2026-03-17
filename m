Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B0AFFF6E8B
	for <intel-xe@archiver.kernel.org>; Tue, 17 Mar 2026 22:04:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C27410E1C6;
	Tue, 17 Mar 2026 22:04:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d6YF1ZYq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7030910E1CA
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Mar 2026 22:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773785092; x=1805321092;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EHYdSxSjdwRb0aaAL9EpDIFkoZvWGwoZHyHdXWQOJuo=;
 b=d6YF1ZYq7xq38BjmXHmfDUjM+1x1iXOX12+W+2NSBq8/gXdos+PjPK3A
 d0RVUj1yxY5byPGJJU58NdI8SgJZYLLZ54TOZdKi+/dVxeB+GLed9LaZ1
 GZbQKqC+UPOdZvxFksNfi1IbOAdhM3qnun2XzfzlEBx1qOMgzhIUkhL9m
 MoibCKegBRYcFVdQWWLjlRaUfQMUlECxBy6CaT77YIBknRf1zYCzY79Hw
 26tClhqP+G5k/e7kVfLg+Q5xuMMVa/JC8i+Zy6o4Ru9YL+jXctmk3VYdB
 rIpq1MawwSZhy5m9S9rfXKOpF4OwAQmJ/F5Rprf1QOShTmtd+lMEMLrXk g==;
X-CSE-ConnectionGUID: 1prfzVNUQfCCtruWjrYtlA==
X-CSE-MsgGUID: iVTleLrSQjCsMVaMVq7tyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="85464423"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; d="scan'208";a="85464423"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 15:04:46 -0700
X-CSE-ConnectionGUID: AOItEwqcQeuQBjk71g4seg==
X-CSE-MsgGUID: m4ItleF9SJeVBREcYCQV6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; d="scan'208";a="221633524"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 15:04:46 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 17 Mar 2026 15:04:44 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 17 Mar 2026 15:04:44 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.43) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 17 Mar 2026 15:04:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lwRmcTxo4juIqx1jceuJIJkeVprEz6lUTPTzC19qeqUWldxcP0TvO+vssC4IzijGIcReZXqvzU6GWmnDFV72RtAJV7jsEuWCM9CU1LRGNuJAtTP4V26JE4C+PwjUCfHwuiFuHfUVupYJqHEcEqPrZEqR1ER0SfVxPUDnRa0CKLPWURzW/q/oKWvdDpS088gDgKivqjjDX2EIP4L8xT07Aeg542iC/fRlwdE9cuYqLJN27q2BoJPT4ijgdJ4x8TLnGjAdQzxoaGtrH210VksE5nrwfOwPTt+cRMdNyMCien20q5o5SGMk4W5WzpuryzPmqBYHRJdDwURZ92nIQQlwDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LYZrToZ+QYYKsRb7lf0Kpf3+E0aguPGc/v4RWBoKVek=;
 b=PmgQ/WHsmR4RTSp4sTYweRmd8dMlMdzL/HwOoR+/ury55d6bonJUpcx0PqwR1wWmbQ6npaWiE4Pv8gIq2af62d+UQH/Kxyq1CRXZdhVrN9q0ei4zfCW8y7S/2zQHQbsVikjP789yL6FpKkKNC3TjELFEAd66w1y/Njsh2v/KvpFGeD7WGNdG+rZFwwrVHZeKpbRqiq79XwR0PZcoIWaXP7gXlqjgBDwfvzLGB+ZhJFIvWV4WCVL2MbyI0x+rjMafYz0Pb3dsBh9cmObOVMIMSefl/3malpyFIK80T8W4SLH8XDMAwSIgBkc+A9VaKFnt9sHxEJzf0rcijXXxfsMpog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA4PR11MB9417.namprd11.prod.outlook.com (2603:10b6:208:569::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.7; Tue, 17 Mar
 2026 22:04:24 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 22:04:24 +0000
Date: Tue, 17 Mar 2026 15:04:21 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Nitin Gote <nitin.r.gote@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Extend Wa_14026781792 for xe3lpg
Message-ID: <20260317220421.GH2729713@mdroper-desk1.amr.corp.intel.com>
References: <20260317080059.1275116-2-nitin.r.gote@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260317080059.1275116-2-nitin.r.gote@intel.com>
X-ClientProxiedBy: BYAPR02CA0047.namprd02.prod.outlook.com
 (2603:10b6:a03:54::24) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA4PR11MB9417:EE_
X-MS-Office365-Filtering-Correlation-Id: b1cf8d2d-376d-45b6-8034-08de84712618
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: I0y5/ANCH8BLHWe1+UtHg4Ql6h/50KJfpSFPyrO+fO825IO8ae0aDgYZIVePhL7pyZt8SMhW9t/GzB4ciUqR6cbN54/WigfabbRIzHHILtIEuxjOQN9NdbS0H/U3O7V7hKx+Vd+3ozquUSaS70PsOhN4KhnC5wHl4YMs/cli3AbjdP9pZb0jCbQ2qTMlQpbij1dxCTn8Ipa/9YeKo+L94e8+zZp5u1vkz3S0jGk1sdr0ZT7gCPppNL1EzZTXVYoi3T0tc2OM+SoL71Dkyuiej8sILAGZTadQ6+aHkYH0HstjX0Aej6EQAPz3CbPe1mjPA+04FwKtZMMS8cddKLK1uUfWIb3PB2ENshFgjIfkJQuBV1qY4XvPmjtTqyAXjniPg7+KuZlrWBTy5kCkl/h2/Vlk7d3P/QsGJVyIrHr2Gxm+SDymM0cit04he3vaiK0tpWRNx0iq/o4h4AqcZL5IxfH2DrrdQERO9b/Ai7rCz9VMNNcd6bV9MaPK8gBfNs3VvlQc+DKXbbVYA/fb64IwfzdrTm/c/kpZbP+UjGAaU56FalYcbvAvIqMvIc6Y4sUMaj/hTOL48/30SQoIl/Ty4yAdg/qQndeXnw5EEq+Wl4/08un3z26iu4s1P7p5lIJXLbaYFMnJtgZtJcPw1BcI7i2zbg6qnRJBILvGmxhhZodccnFngqAGcJrPes5UUm75NiOIZdozsyJIoGccYdwHooCd5zHW1AD8kVrMuM8pnLc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+0FCOWFhHkaES6jme+hR+bpoAIS0QA69jn9JMglBgPTiJHyvsdd+nJzw60jL?=
 =?us-ascii?Q?PId1tNplcYtkDrS7MmErs7nubmPatAbnGwtCwptbp7BYzXVRy+T5OCnIZz2z?=
 =?us-ascii?Q?yhyWfjKks2MNXQkQHyopUk04YJTOIkPuZg4ywzVngapc7ea8VlOHwp1Yyzqg?=
 =?us-ascii?Q?HkcJwFEPvVts7gnMBAcMoh4hC/gTzYUUNiqNoHXZg5WykBAN02iniBWwTCKk?=
 =?us-ascii?Q?lLRLdDHmSZb1Mx5ohfKxqJGdlcNudMmTJ7uX9WfdiJvLw9zCBFeOqZE9lrBX?=
 =?us-ascii?Q?oZS7kwSyXGJOMmO5YPThi3RygGlAQP20XcgkN4wPiGxJXmGvsKKo+1jjuZL+?=
 =?us-ascii?Q?HXAoJxv+Y6huKXncSmmHy5FYd7Rmg2F6Hx1ZXzoqsowr3e1h52fKnR54jKBu?=
 =?us-ascii?Q?y1gxP/c7Np50VIZik3QxWqft7XJn1RrNFuoUUazDzZc3KaZ/Pp2syE+ymWx8?=
 =?us-ascii?Q?eLum/djdThA3MvRwEzKb1SJzB+Sp99+GmZYB5ZAClkFKaMtO12ObOOd6TKd0?=
 =?us-ascii?Q?/O23clcWYfijeT+Bj+8GxH5KFbXNlgBl+Z5pYtuxPj95kAmc66+0vKDuGIXM?=
 =?us-ascii?Q?vrMyWvAlVKeYgckhYY/l4oGz6CUbNCNX3QTCKiART1ROQqcPRCNNu2sNxN9i?=
 =?us-ascii?Q?Q4BxXDPajIm7/d7sV9L0iKGcYN3Ls0g/TZPW86oYoVxndyWqQg/8+9Fio+8k?=
 =?us-ascii?Q?nWOALsCC5scEYshfC07/v36Q2YUQLcLiThLrCPqwCkApNA/K93Hic/ufI6ot?=
 =?us-ascii?Q?0M0AzuYRRpD2qCoAfH8ZZpdz4kc4y6NB4jdofZe79stRZMjmhBT5okRFVH2O?=
 =?us-ascii?Q?Rzft283NXVhdbsFJeF/ZB5lEF0tsY9szF3GdMzK0x7KxVbAX5cwPXq1pEraR?=
 =?us-ascii?Q?cLRrWq/GnqWmii0+jPT1P4Sxscjg7JCR504YH/KC2AlIWPnyh9Fklv8gIb5b?=
 =?us-ascii?Q?11d2Z28oSXHlwvUBwUZRYh26IC1uxpgQTl7vj6Fho3RBJKBwHFliQcTJ3wOp?=
 =?us-ascii?Q?EyGwr9zHPmm6Vd6AasnsiZVvlwlc12OTlu35I/tckCPv4Hd1jtTTBgUctLSl?=
 =?us-ascii?Q?rMhoW0o5vylOVYN3dKVnrcLcoPj40sU+zmNbDA/NXGLfoTfGXUvgKimSuUzH?=
 =?us-ascii?Q?LHxdcubw0ueprjNEo6ar1GdqZAitzVkvu44HvWqegu5EB/SrMOyFEnc9Gn7I?=
 =?us-ascii?Q?Dhzbi42FN0TMS1RX3kL6J1MIFEYziByqcP6nl6gjfLGHw2Vog+gpnTPwpCZi?=
 =?us-ascii?Q?rbOU3xL+a653sPazWWqcCT+RUuY24gpVvMqq5D2WP3Rlr8FtCjZz/B+oVh4n?=
 =?us-ascii?Q?CIuk5efanKzyPkoWp2LLwe06MMyS4chxMn0Q60oUD6AOgKOD2LgOiwUh/6Ir?=
 =?us-ascii?Q?GZzVsOGQpcVeVe9n0OgQInIDhTKraNkxI/pohOM7dDAW/2lXSrjz9qMF9hMe?=
 =?us-ascii?Q?eBRLDcjrjBrnPvA1h23L375tPZ13qR+6+qozQGVB0rv8e1SwrNN5pk3tkdEv?=
 =?us-ascii?Q?QcxzMLAd47ZdfUAUqSVXor0OgbPCaS7W1/Wnt+YzADReIhGwD/BbMsKOK5/g?=
 =?us-ascii?Q?pLgTXVlW1uKH5Oy9QtVC/XL5bucoRlfN/XJ7Wv6ywqg3xuIwQKbwHN2J1qLT?=
 =?us-ascii?Q?0LGRLNbpu7tyqZh4iNNyRmy94kyvqNkUQqFMZIGkyfT4TyYj0XGWah5M1s0w?=
 =?us-ascii?Q?jd0uNugGMZwZpNGJRdudcjbHSODWwm2exBzI0MbDzHdjsdcHW08bUleAT5qP?=
 =?us-ascii?Q?kudwfgFMwmxHWlKpiXGrqKAIRnVVI8U=3D?=
X-Exchange-RoutingPolicyChecked: XWQOwoEsi9sppNBBExUdHs2pV/woFqKI5z/Zut90HJ3uIE9TLKHqlDG7+muKHXMa0/TsZ9WkNRFL6ocECDG9YzjLgvzu7AvwGqX/dtFWh02259+7QaQRqCqbhKe4tI9osA487ZbiQJ6lyiA9uSLhnQog01BKDvU4ux/idujokUwOF1NJa8KZWDka/23mdAssw23Qx+oJeXHueT9gumdM7bsqocrm8JxJK+FR0girgRtevJHtJavcn4cEvr2+nu+qC9nKfprCbRbuCLbnPbqiWb/cmVqsZKg9muaho9eXGnFNTAdjnsiNMRQf0M+gBUGpVFdVvfBPQxsA9K8wPm6smg==
X-MS-Exchange-CrossTenant-Network-Message-Id: b1cf8d2d-376d-45b6-8034-08de84712618
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 22:04:23.9993 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ogyqSpbFGYVAChKMHqkvLhzjkLU4zh8lkjN4qCOZ2UgCuqRLxMenRUic8x4X+Ei9TdzZAi1q4qvCtiGk8PFV6hNJci08sRxfaqcmEuY/IkU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9417
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

On Tue, Mar 17, 2026 at 01:30:59PM +0530, Nitin Gote wrote:
> Wa_14026781792 applies to all graphics versions from 30.00
> through 35.10 (inclusive). Since there are no IPs between
> 30.05 and 35.10, consolidate the RTP rules into a single
> GRAPHICS_VERSION_RANGE(3000, 3510).
> 
> v2: (Matt)
>  - There are no IPs between 30.05 and 35.10 either,
>    So, consolidate this into a single GRAPHICS_VERSION_RANGE(3000, 3510)
>  - Also move it up to the top part of the table
> 
> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_wa.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 8c55cd187a0c..6905f3638c29 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -656,6 +656,10 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004), ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1, DIS_CLIP_NEGATIVE_BOUNDING_BOX))
>  	},
> +	{ XE_RTP_NAME("14026781792"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3510), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(FF_MODE, DIS_TE_PATCH_CTRL))
> +	},
>  
>  	/* DG1 */
>  
> @@ -776,10 +780,6 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>  		       ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1, DIS_CLIP_NEGATIVE_BOUNDING_BOX))
>  	},
> -	{ XE_RTP_NAME("14026781792"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(3510), ENGINE_CLASS(RENDER)),
> -	  XE_RTP_ACTIONS(SET(FF_MODE, DIS_TE_PATCH_CTRL))
> -	},
>  };
>  
>  static __maybe_unused const struct xe_rtp_entry oob_was[] = {
> -- 
> 2.50.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
