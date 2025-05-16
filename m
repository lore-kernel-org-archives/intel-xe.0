Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86DEAC3ABC9
	for <intel-xe@archiver.kernel.org>; Fri, 16 May 2025 19:07:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A30110EB77;
	Fri, 16 May 2025 19:07:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cozAAzQR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFBD610EB77
 for <intel-xe@lists.freedesktop.org>; Fri, 16 May 2025 19:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747422443; x=1778958443;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7aKjXSg902/uvqY+Y/Dul//LGHsnyg6NRewnKqwfvt8=;
 b=cozAAzQRepN7xDVfFPJRbLqJ8VHVW+OATkOXFPacG2wddK0rbDFNR/bW
 kUcZVgSC5ygXH2achXm08o5yfiKUSnNBrJ2/RNTq7N3kYKbBuRfx6umMo
 qg7lkPpQORFL2CZtExQIrRDbzzp7TVb0AHd3ASSrKnoJjPcHxgwPW2XRx
 nSCRgCUktAls9bT5I4ekH/hAQPes6Jgw6IWd4UEVAEv3y2z/YO7lIKmsm
 J2TtU7QgSbXxpT2F7M84M37EQAe/XT47cmvOBYy+/W2m/eqriE8O9UR5M
 vEOhnvw17xQdmNemtPqtWSs+70StUCIebAhqSLMDA1SH2J/BTTlb0J5Lk A==;
X-CSE-ConnectionGUID: 4fF0asCpQ7Gnq2DdCAOGZw==
X-CSE-MsgGUID: gG8UXJR7SPKQzhfEmORong==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="60431228"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="60431228"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 12:07:23 -0700
X-CSE-ConnectionGUID: jJUlALfAQradYoVcucuErQ==
X-CSE-MsgGUID: ZORPkY7PT9OMwn7ZIJRCLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="143651350"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 12:07:23 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 12:07:22 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 16 May 2025 12:07:22 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 16 May 2025 12:07:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nA72BLSXqDqKTthiFBw1pIlU2ePgzkfg7qkLePvcXHUEO/NI0OWd3BsC7ibFR7Wo1TsteAJhSce0zI7ayzJif8MH5JGOUiR1/yYOsBVRN2gcN80p2n0wjtdegElpvuZ4dFp2ju2AvSJY2Dd3ktxKVdeBfq5QXpcrKN/VgVvlEwY+YH1EtDsELoSgt41Nbtn2SQ2FQUOpR5oMsO0h3mhlBzwjMk58vtuaFnA5dNrQ+bW59kpASklqDu0fUVrYfCaMaaWf/IV8YWucx0BrbhcctOVpYZC9sMj7c3JD8G+SrFH4N2d415E0QHqgCM6b98Vp+zXZHHp0E2VWOndxztiXNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Plbm9cYg2wUgK6oMNFa18d7CWRDhBdPQWwQirVmaEoo=;
 b=nSK0vU02EOzsnpqbzqSOUVb9yiyvmeZZPdND7dKjMZj9pziKJmgwEOpUcQtb1M9GTU98/ajYG/tS+5WXmsdEUXDpkLir9ZZSlw7kkTFjBn7DYMDdIir47IUtG+T1HziUx+6fwXjb63GUaRZZzgmZn9UMJmiB57u/iCpghIVdBcr/N6SiPBq0WWiH06Bgvh2eV8Aj/pz2jFLQXLIP4TorJB7FC475KH4DI/k6ROBbEZ7Y0/nrB2wbm0g5mlMZcRGoOnPrntdmxN0Kvp6lhXhH6m7dN8rQhD+fX+zTMO1AHWxgNHjDmwGAByyMrl6gf09XuWOEsiGaYoyu6874Dg9dpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by BY1PR11MB7981.namprd11.prod.outlook.com (2603:10b6:a03:52f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Fri, 16 May
 2025 19:06:54 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%3]) with mapi id 15.20.8722.031; Fri, 16 May 2025
 19:06:52 +0000
Date: Fri, 16 May 2025 12:06:50 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>
Subject: Re: [PATCH 3/3] drm/xe/xelp: Add Wa_18022495364
Message-ID: <20250516190650.GM5080@mdroper-desk1.amr.corp.intel.com>
References: <20250516074412.46863-1-tvrtko.ursulin@igalia.com>
 <20250516074412.46863-4-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250516074412.46863-4-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: SJ0PR03CA0361.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::6) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|BY1PR11MB7981:EE_
X-MS-Office365-Filtering-Correlation-Id: 62b86f8d-6ab3-4c29-71bf-08dd94acd148
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1dQmql5RGZHyJTN9N+yiNOayp7WhUoH/laHxEYCjq94fNsPXsZcO/75obsxY?=
 =?us-ascii?Q?FVwhvjEIt9axiQE5srsnIj5ppPrA/vTmaU72riVGPWuRCZGdAnRdoi9CZOnX?=
 =?us-ascii?Q?ItRe092NtFh0KnuhPhBRvs5wCh5Fc1u+co6N1hs2AYs2UnhiIpJ1qUzSKQGb?=
 =?us-ascii?Q?aDx7YTE5hMW1ky7v177hSY9fuf2gZDVUIu9Lty8JWnlYhXY/TsbCJvM+h4w7?=
 =?us-ascii?Q?e6aPtH/GdoMa/YDKUd8AeA9M+1mnueM0iVxYKExsXz02a4ZOFluiLGPTg9Nf?=
 =?us-ascii?Q?4xCmT5ntX7dt5JM10J8KPoB/8gP+5UNlinWWRnm4d6PMQ5KPxNFDuFnWm5fe?=
 =?us-ascii?Q?yfLjJQBs8bjzUzF5kcOAKLoCuWsR1sf3xTMH/P3dbGTrz9/BsI4Eyh4z4znN?=
 =?us-ascii?Q?4FxFWlp9bhJkPjN5sxogfkTwF1mBwpIwt6DvNtae021MD3nCjfYMZ06e94x0?=
 =?us-ascii?Q?VmgSXVb2PVRidlRlbmlU+Ui705/HIOo/7BY2vKiiLoBGtoxeJBsgv8pX/Q8L?=
 =?us-ascii?Q?J5noumgtg1LskJ1zDskxg4SsnvDdoHfvAV1fkmVRh+Fs1OsRUhz5hjL1Fpg5?=
 =?us-ascii?Q?MUXx3NWOY/wkhZIyQTKvHK89hziWWCzwHNDDTY8siMWAqIbKgnpE86zUnQo2?=
 =?us-ascii?Q?9XVj9YpY3etVPLNm0e3lK6Z8tuprRHHFvw1F0CcXMnLz/sQGrm5aHP9Hz7xe?=
 =?us-ascii?Q?xLAA17g1T7/u1gbB6OLsy289RevUL/AbU116iIU+mquZMB7bZmJKbuk9hJVo?=
 =?us-ascii?Q?r0KsxbmPeTrWqbuh3jxBARM4DmIMfR9qlUAxd4+77beGTK5UovmYzpwbCq73?=
 =?us-ascii?Q?exzVY1grIx6XRSjj6WMUYeNK2MbGcCi8rrSLl+1/MtaVen+NuhbCsJjluFpH?=
 =?us-ascii?Q?vEM0eoZJTa78smx/H5b7sGQm6DB1K2Qqs12afYmVhnKWcANq0lE1xsZDBe4o?=
 =?us-ascii?Q?kSQ+6x61wtK0+pD+zB3hPV/BjjArC6w8/lMQiuz/U2HbI/CO9b0YQi4wuCy7?=
 =?us-ascii?Q?ZMqS0eNV+6lxcwqMioLVLk76YYiNLIEqJYEM1eXEvvpxnqBNEVkROkJIB372?=
 =?us-ascii?Q?KuG56+zL9P5pQbhT0ytS6wrKEwMUp2wDHwnPs7kRGVq7WQDbKg+07KFYTvqb?=
 =?us-ascii?Q?WJ8mrVvPTBmPmg8j++uuyaMFLG3YN8t7ba7ZtelH5b+ZY5rzp37n69UbV8Rp?=
 =?us-ascii?Q?mmzHum6R/8WFq6bXvNegk4GGeL2BOHXnUgIp+cyh82NIcDpXdGipzLRWmExm?=
 =?us-ascii?Q?rCJkNfauYgd/E+b7b74em6YpFnZN2bHP1rcfHtbWA7j/d/qO8okVsWqcNNIL?=
 =?us-ascii?Q?n4pfERIDy1wr1M0yrLhLRvUuWL1Pw6iFkyuV/a1ysNVqvyszlSRv+jDhOG06?=
 =?us-ascii?Q?pqfjH5vpidsQhC56M7xp6v5Iy4p8mPzkw9NCTu0X1xDH3OZ8vPSrGrOw2E8v?=
 =?us-ascii?Q?K3Xya/sdmgw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TK36tgVSjnDkMv/KAnRu4rZXA4vX45L616xeBaAXe39l1Ba8Gv6GYAgU+Inr?=
 =?us-ascii?Q?u1VsV/SEfRg8g50vukzaNpoGAtvwcR7/I/InYUNY+NRb9lGR68tMFSCSDKrh?=
 =?us-ascii?Q?4OXvJ62qwTcq9Q6hmC03rnUbmXNAI5US0ePQqXVik4B2spRVNzEIkExzhL4N?=
 =?us-ascii?Q?ZJnU8+UW8VdPPzS8rPby0bQMjd8hic2Jf+BSpu/yHB5CLdkHZU+Cclx67pJV?=
 =?us-ascii?Q?fbD4Ya4OidrtTVnhz9T/1k6OTKHCubbadWPwD19pLqrfzPlHwYncfFss2Zpb?=
 =?us-ascii?Q?oxxzEsAXXL+KU4AqlWXn6yxPn1BaJmRLVNE865L4FnzcM1LH9bMHZaD0zRW6?=
 =?us-ascii?Q?gbEkd2xPcwXtnMZJWFZgeMpLhN9wzcyjnnfUIxLpglhJ5OYH1vJH1VjJbV5t?=
 =?us-ascii?Q?N3COP9xpJyNw9WKZ/ebTHDPP1UjGAEhGuihLtaGkIu0FJd9tHx0t4zBOgshf?=
 =?us-ascii?Q?2zive4WTjVtbB2rYgRLUCUqx5imDaXpax9Bb9n1F0yifpD7PPeBWyTNDgPM1?=
 =?us-ascii?Q?HpmxPaC8fo7Faac0Xq/aW5hLTmq32D5paBBlCLBBHHuJJF9a4D20hILxbuyy?=
 =?us-ascii?Q?hPSsJE6iNrtvnuhkHjQaK7SlZP/1hrT6kNM9t9pkTruHo707dcLPdiuSTDTi?=
 =?us-ascii?Q?4hd5dYd30wu5J1rTB4240hWWM6JWB6AzR9xv0aNhUzqQ8bOtZO2g/L07SR91?=
 =?us-ascii?Q?FuM9khzzOIUkEMdS8qLjnfeDV6diOJ14PROeZKoxQJW0vcf7jF1smRtiGmxX?=
 =?us-ascii?Q?3laXmhMp+hDj0EacmjUrkRiXtPddVlWC8buOvI1jxrm8TAT9Ye5dF2wIdHMQ?=
 =?us-ascii?Q?gfM7sN3HtVDNo5Ge/BwhNfL5kcWa5EbNuaBAepJg/yiC91TmoEd4VUGrvz/A?=
 =?us-ascii?Q?jGapY8x+3J36/0ryPif6e0b8QaGZR7xHMnmzNE93+EhEIElQ1Fy97EFEjEPu?=
 =?us-ascii?Q?95gJLEsoa2yN9z/xKzByHSADbdZsJbVWVUQioBey7dDZOmlA1YesShDduAiX?=
 =?us-ascii?Q?KErvz/rigqVM3LvtwjxQqNVp/FZCi/vEfqZbl0Qj9Wwk6f7vrYXaHYKSOMk1?=
 =?us-ascii?Q?KACZDPG+v2NIKdBa6l+/DL4zUcqgglkSpjG7uH6NBElc+orRpQQfXwghHk5G?=
 =?us-ascii?Q?ZE7TsV2YPiE5Qn31Lhb5ViZwT0T144au5nYXUFhYMchjl7SsDkrl8h42GKfZ?=
 =?us-ascii?Q?Nioe8sZDUVAHWlmf1xKhvFO/BvIjVOuchCtMh2+QpI9RHmjbD5c1y8sM7ZHM?=
 =?us-ascii?Q?ef57DdZjbb26TKmS5iMQ2xq57etIK/CFVVQxGkH3qqIq3CTziNwEnf+D210Z?=
 =?us-ascii?Q?4d20UGT0rhKebu9ud/PAAQIOrWmnf4sl4M6ZWxokgmKBo0cAMAe4Dni7QfKy?=
 =?us-ascii?Q?LMdg4GzlCRGrry09nhPNsj9d26uq4FJ7SmabUGjkNQ/4GtWMN60C/exyxDHl?=
 =?us-ascii?Q?yqs+FkmAcS+Z33tyy0EScr9cMy9is2beBaFCH75E3jzIvTydu5lCBq/RegPr?=
 =?us-ascii?Q?ax1dZvz3NAvSR9HxRwpHET8YhYd1ql4D8NQl1zZWWw/cIZ/1RekvlSdYKqtV?=
 =?us-ascii?Q?lw97tjUcQeDz0qgdfrkw4FnAVFBFXWeamhc4w5/ByLsd8B2YV6yxoKzOX87D?=
 =?us-ascii?Q?4g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 62b86f8d-6ab3-4c29-71bf-08dd94acd148
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 19:06:52.4607 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ws1ZOA/JJ8RfmyH+ksvIvdfMANAgLAtda8AvOZN/8WLaIXdizHbRoO89O192AYO/z0ckSZTRgRJ5rRCyYK6MsY+bwM3+3eoasslmAZC2O1M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB7981
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

On Fri, May 16, 2025 at 08:44:12AM +0100, Tvrtko Ursulin wrote:
> Add Wa_18022495364 as a context indirect workaround.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h |  3 +++
>  drivers/gpu/drm/xe/xe_lrc.c              | 12 ++++++++++++
>  drivers/gpu/drm/xe/xe_wa_oob.rules       |  1 +
>  3 files changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index d1d2592e010d..94d778d5425d 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -112,6 +112,9 @@
>  #define   PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS	REG_BIT(14)
>  #define   CS_PRIORITY_MEM_READ			REG_BIT(7)
>  
> +#define CS_DEBUG_MODE2(base)			XE_REG((base) + 0xd8, XE_REG_OPTION_MASKED)
> +#define   INSTRUCTION_STATE_CACHE_INVALIDATE	REG_BIT(6)
> +
>  #define FF_SLICE_CS_CHICKEN1(base)		XE_REG((base) + 0xe0, XE_REG_OPTION_MASKED)
>  #define   FFSC_PERCTX_PREEMPT_CTRL		REG_BIT(14)
>  
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 6022068ce6b6..9a07fc6d78ab 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1028,6 +1028,15 @@ xelp_emit_cmd_buf_wa(struct xe_lrc *lrc, u32 *cmd)
>  	return cmd;
>  }
>  
> +static u32 *xelp_invalidate_state_cache(u32 *cmd)
> +{
> +	*cmd++ = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1);
> +	*cmd++ = CS_DEBUG_MODE1(0).addr;
> +	*cmd++ = _MASKED_BIT_ENABLE(INSTRUCTION_STATE_CACHE_INVALIDATE);
> +
> +	return cmd;
> +}
> +
>  static u32 *
>  xelp_setup_indirect_ctx_rcs(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  			    u32 *cmd)
> @@ -1037,6 +1046,9 @@ xelp_setup_indirect_ctx_rcs(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  	cmd = xelp_emit_cmd_buf_wa(lrc, cmd);
>  	cmd = xelp_emit_restore_scratch(lrc, cmd);
>  
> +	if (XE_WA(lrc->gt, 18022495364))
> +		cmd = xelp_invalidate_state_cache(cmd);

This is another one where the official workaround description asks us to
use the per-context workaround bb rather than the indirect context
workaround bb.  This register is already part of the LRC, so which batch
buffer gets used determines whether this extra write will happen before
or after the standard write that would have been part of the LRC
restore; I'm not sure if that matters or not from a functional
perspective.


Matt

> +
>  	return cmd;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 9efc5accd43d..a32f5ee9e917 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -1,4 +1,5 @@
>  1607983814	GRAPHICS_VERSION_RANGE(1200, 1210)
> +18022495364	GRAPHICS_VERSION_RANGE(1200, 1210)
>  22012773006	GRAPHICS_VERSION_RANGE(1200, 1250)
>  14014475959	GRAPHICS_VERSION_RANGE(1270, 1271), GRAPHICS_STEP(A0, B0)
>  		PLATFORM(DG2)
> -- 
> 2.48.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
