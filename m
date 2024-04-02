Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 415AACD1284
	for <intel-xe@archiver.kernel.org>; Tue,  2 Apr 2024 15:45:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFB8310FDFF;
	Tue,  2 Apr 2024 15:45:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gj7fViw5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B1C610FDFF
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Apr 2024 15:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712072729; x=1743608729;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=y8lWEJubpEQESlVO4r/KqIfF624RqUWY3KOitCRbwNM=;
 b=gj7fViw5Ghbwj90iX3F0ZQFHh62A0G5X3U7jvRszLrkGSRoPZ4ZwROd1
 oexhto0E1Hrz1isrr9pD3ml2OrlcurbhO2EBihlvZUsb856HsYOFgAb6O
 0p2MR0dDCvLjWZ2FQZrD4EX6Rdf+73JlObUFWkQhmC2QtwAoHZQ39P0xA
 Ml97uII8zFF5PwtDSxn/Cn1YGin+b5na27JaBYB33gp2ToY54acEXBYHZ
 UZ3uvnZbqO8ZgB2eNupk4ipjHb4eHtSs0gd+eVuCgCRLZC5FNyjr1XZF4
 vl2aAeHLUHutHtgJw0ZGxzu1DARZT4AMDRqOjvKD/703BmscxPpKmRKlI A==;
X-CSE-ConnectionGUID: rR0Vz3xKQb60rJZzl5m+ow==
X-CSE-MsgGUID: Meeuj/cgQ1+o1bqikDP1Mw==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="18610194"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; d="scan'208";a="18610194"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 08:45:28 -0700
X-CSE-ConnectionGUID: ZPW+BGh+TdOsAAk5ZTcpWQ==
X-CSE-MsgGUID: o0vPI71qTyWavCMI4tRwUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; d="scan'208";a="18228934"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Apr 2024 08:45:28 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Apr 2024 08:45:27 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Apr 2024 08:45:27 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 2 Apr 2024 08:45:27 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 2 Apr 2024 08:45:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bp4Av7aJj4aFjf5xLJK6lmr/7B80OG5qskG/vU6MgiPUxAUk3yA/R5lWZgUR4PF8GReJL+JzWaUqDXHupsW6Ymu07e/5hqZynarPNDL9I8ec+gEJ2rXrymVG/YZta0StjI8nY1XFpWsiYyMeKsdOsdL+0LQ0t48MqCp07Pc3sjrVerOvwMSDa906i6F9l+fLywxDuPZgRN9Y4KFGteZwZUsFt0rcj9E0I1HFcmlRmziIjYL8nJK7NTrXkQDWbrvOigdEIFdbT1Fkn7at+vx9N5vnynWjZZIPXmAH2YRAFm8008WRBO5xbHTilShyhg9DC8AzugBmm4X0kbPQpGpCuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hOBtBtrar5uLSfCTRmKJfKY3epkqw7IKfit3N2l+70w=;
 b=P2DGfuS3U924n5Rvxwf2XuQQAqe2ovjy6bXBbgt8fcVWYA1kWYxzenOKx6XpmMfJx+677DtcRQXtew59gHQOgLcoaPw0s/ymA7GjKy82zNihKpEQDT34ZLNuuNyrL5z5N6ATwBQiovqawMslekm/O84Y1ZP/w++IEh/UhooDEciN/eeIzg+AvtXeLwW3Sz+ZeSNa1aCBSXqlgLX2qXU94VOI+7O5TubhyMMCBZJvQanHHntxreZgmEOWWuLzaeiStn2hLJIsxYA0NYfmIrPLb4HISCMpGCQ13ap+CmqLLX6rt3bjpRWuWTho/MP3SZ2DEUcLQSrU4JMPuloNkAhi/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ0PR11MB8295.namprd11.prod.outlook.com (2603:10b6:a03:479::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Tue, 2 Apr
 2024 15:45:23 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7452.019; Tue, 2 Apr 2024
 15:45:23 +0000
Date: Tue, 2 Apr 2024 08:45:20 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH 09/11] drm/xe/xe2hpg: Add initial GT workarounds
Message-ID: <20240402154520.GF6574@mdroper-desk1.amr.corp.intel.com>
References: <20240402124724.1238122-1-balasubramani.vivekanandan@intel.com>
 <20240402124724.1238122-10-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240402124724.1238122-10-balasubramani.vivekanandan@intel.com>
X-ClientProxiedBy: BYAPR07CA0041.namprd07.prod.outlook.com
 (2603:10b6:a03:60::18) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ0PR11MB8295:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: crc7lY/Fg463cbEQmsCVlfz/6oiB98K3AidJ2QTZWKTHAegrGPfaKFOj4v1XhWiDYTq2dw6XohRTLOry9WC3qN7sFySF5IPjQh+mBFBwFNrLK9XH4uIgCvZqdER8UZ4U+ymZmDOCU65oPDU5qu4aVyIUBL50aNOuEonlPEBisiOHGg+Uli6qJQ29zIuQRLWFL36osHJNQp9mBWxcvXi/Zjdyzq1S0lHwWT2qkWm3EiqIts9ThaCfujGSf+PPF0figX9HzHSoT4qcovqOuVRptt2ygyyTEdA4ohgHfsg5XdHJ2nEeABjtPHlVbjLlj0qisrf6HFN8zQMGY/MUTWlmk+Sv8z2RuMCWFcxmTk3POw6erHdHCV3nomKnM7Ah0qZrDNklY5AMfGCdkh2gXJ5hCPTxYRHhhwtHfgnfbduCTZyYBBZ6BOMVbKv+s0oYbzLiHWkg6GjbH7afXw0k7sH1d+5EqhxD9SyjUAmfJxycLZUoBIR+uIFDUgCzdnV+PxyFlzyprISxFphIkFA9CHoztu+2trtNDKgLei0/zcLMDxVzyNG35tw6bShElPBiYoH7eKh9H9gP240QkJJkWVQbU5EAsh5b2IuBF5n1UJiauVlfeUbai1ebH1QoIZVNquQmf0wedA4VNW2anicy7MRWOuGiYVYhS7Y+zmwUKf+cjak=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2IwDdlQKUvat/Rl4qRvWwohrqI6Eej0Q65Mo9zY+/4ju7cnbFnOCUEbHQuLN?=
 =?us-ascii?Q?ojXr45NVtPOVYn1CNdS1rB8hP5+TFYigXM1RBv83cT1jLsYUw1QShFaDgrJp?=
 =?us-ascii?Q?OjKvUsnp+hld0T8tcWrrJXBYr5mFcESHzcKikcgG5uiABnY0V6e1/z/344Sh?=
 =?us-ascii?Q?KDp0fLf8m3vKV6KFLhMwAVH4c3lWfI3uqZli138DItktZ99luNux2rUJZbP2?=
 =?us-ascii?Q?oGvqU5xxW6F4q3FXRv5DrX59pIFdwEMeGwHHqufqHiUBPAvDG9acasWyFQKs?=
 =?us-ascii?Q?Xz1hDKKJLsRyzAz9SGv6RxYyhbgAjF5h/jO1L097L24EkSrHjftHofe3OgWi?=
 =?us-ascii?Q?kfQpTNPszDkbfBTtlX8NHEwxuHFOsHAhN3K/eJGcHouhGrxWHDJ4N/riOupc?=
 =?us-ascii?Q?f8lvIZaiBU3j6s+d01YU6y78dwmVgxl3tmJYcH12I1zPHU3vjEQIfWV8KGjo?=
 =?us-ascii?Q?V/bJYxLkBWauSR3zFzNXL+A6+Vk4kw4v6tO2uhFK6gaCjhzCFHPRBAB1+Z1n?=
 =?us-ascii?Q?LDmfyuCpNB31ae8fd0paKvzzautZVvZdMndG8UL4QEBFd3F6Id2yvna6PVmi?=
 =?us-ascii?Q?PZnwe4pOWj1ePqTWNeZrx8Opox9Uagat9Q0oNaIdNX4RAA0rybsoPDasIZ+K?=
 =?us-ascii?Q?kXyLLZJ0Na8TYbQVWQJ9JAob+GoLACNhoFIGkuLXH5neqHv4k3GkgbSYJedU?=
 =?us-ascii?Q?psv2RR5qk7vikbMyjS33vEaheU7qhwXtxp9ojWenGlJuvMckbQxbk/rBazYF?=
 =?us-ascii?Q?OZHhDSEJqkRT/6CEQd3j9glDjjwLlNtvpyUzM9Wod8oCLzsZ8VzfJKDi1HLi?=
 =?us-ascii?Q?EEWKnUCZy1vnBdMxwAU+yibt5xyVv/QRRXjgBxDZrZrvnM+dJhSwW8ZJtNiZ?=
 =?us-ascii?Q?lxHe1ry3wV9q3Wx6I6XjcMoFPyyB3SSdir6XF2UP24yDY5CMms9lXaMZqyS+?=
 =?us-ascii?Q?3juZgXuMykZMbTktNjyjW7GHNsDkFOhoIUSAkY/dchUvwCyW7VCykr4R4wgw?=
 =?us-ascii?Q?cHxYeVO0sO3lGkCBDpXWsZBnLIL+yV4Qq6rlPyuyA9LmEPRaPt0zb2kr/7BC?=
 =?us-ascii?Q?svvBwMN0tLIBrDJ7b9mIbNLpUIgRq+Yn9V0klbXQsopRQCs5xuu60kv9moRn?=
 =?us-ascii?Q?Yy57gBfnFcHgEAe37+/I6Rak35ooanUSLLHRj8bvbl1YCJYfKiP3Bve4zSFe?=
 =?us-ascii?Q?DxaZZh4nxGU2Gmnr2JxpZg1K4N/eIrqBM9ozuuPrNSFAD9skkL0UfpgcySXB?=
 =?us-ascii?Q?t+2St9PWMKG4x2T0cvK5ZL9Y0brszgPGYDHdGaD429HrDL2z75QpGzQzc73f?=
 =?us-ascii?Q?81lGd6bGMgJzhZOBdpgQHIWS1c1oPxo7S1FZJ9vNzIMdgfsDua1+5dQGweH2?=
 =?us-ascii?Q?YIfQ/Z0ITr9vvrqbNM4OdsO5ZF/Jp8AeOwzDUTvpTPXEobiPVZLXntQ++0hG?=
 =?us-ascii?Q?+YNHw/VzsiWaxwHEkePO/aepHliZxgEXo6OY/oq54sZmizFMSmWp/V1O7gxO?=
 =?us-ascii?Q?/ymFzzSsamqfJdk+yCv/m/24VF2HP/+2lXq2MzI2pI9tKMqF7rnJrCo3zcv6?=
 =?us-ascii?Q?rw/XdvegChF7CNlVgNL2+ED257O4qfVc2l/2Jx9Qv+GXxqBr9VOmzgHUZzlJ?=
 =?us-ascii?Q?8A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f1924822-d5fe-4724-e882-08dc532be8b7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2024 15:45:23.4258 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q23HESPg4yYAc1gjS8r56y3Ve2Ea+6nYHjtExMTrlU/mCcro0M05hGOLgP0azpmnHQmVf4iTOpYz6jFryvQqw9rBUjoi8kUdkwlFtKm9phs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8295
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

On Tue, Apr 02, 2024 at 06:17:22PM +0530, Balasubramani Vivekanandan wrote:
> From: Haridhar Kalvala <haridhar.kalvala@intel.com>
> 
> Add the initial set of Xe2_HPG gt/engine/lrc workarounds.
> 
> Signed-off-by: Haridhar Kalvala <haridhar.kalvala@intel.com>
> Signed-off-by: Clint Taylor <clinton.a.taylor@intel.com>
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> Signed-off-by: Dnyaneshar Bhadane <dnyaneshwar.bhadane@intel.com>
> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h  |  5 +++
>  drivers/gpu/drm/xe/xe_reg_whitelist.c |  4 ++
>  drivers/gpu/drm/xe/xe_wa.c            | 63 +++++++++++++++++++++++++++
>  3 files changed, 72 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index ea75c1f0ebd0..17cc9b6c9536 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -74,6 +74,9 @@
>  #define WM_CHICKEN3				XE_REG_MCR(0x5588, XE_REG_OPTION_MASKED)
>  #define   HIZ_PLANE_COMPRESSION_DIS		REG_BIT(10)
>  
> +#define CHICKEN_RASTER_1			XE_REG_MCR(0x6204, XE_REG_OPTION_MASKED)
> +#define   DIS_SF_ROUND_NEAREST_EVEN		REG_BIT(8)
> +
>  #define CHICKEN_RASTER_2			XE_REG_MCR(0x6208, XE_REG_OPTION_MASKED)
>  #define   TBIMR_FAST_CLIP			REG_BIT(5)
>  
> @@ -354,6 +357,7 @@
>  #define   THREAD_EX_ARB_MODE_RR_AFTER_DEP	REG_FIELD_PREP(THREAD_EX_ARB_MODE, 0x2)
>  
>  #define ROW_CHICKEN3				XE_REG_MCR(0xe49c, XE_REG_OPTION_MASKED)
> +#define   XE2_EUPEND_CHK_FLUSH_DIS		REG_BIT(14)
>  #define   DIS_FIX_EOT1_FLUSH			REG_BIT(9)
>  
>  #define TDL_TSL_CHICKEN				XE_REG_MCR(0xe4c4, XE_REG_OPTION_MASKED)
> @@ -384,6 +388,7 @@
>  
>  #define LSC_CHICKEN_BIT_0			XE_REG_MCR(0xe7c8)
>  #define   DISABLE_D8_D16_COASLESCE		REG_BIT(30)
> +#define   WR_REQ_CHAINING_DIS			REG_BIT(26)
>  #define   TGM_WRITE_EOM_FORCE			REG_BIT(17)
>  #define   FORCE_1_SUB_MESSAGE_PER_FRAGMENT	REG_BIT(15)
>  #define   SEQUENTIAL_ACCESS_UPGRADE_DISABLE	REG_BIT(13)
> diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> index 3fa2ece7d228..e674c8ad230e 100644
> --- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
> +++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> @@ -63,6 +63,10 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
>  		       ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(WHITELIST(CSBE_DEBUG_STATUS(RENDER_RING_BASE), 0))
>  	},
> +	{ XE_RTP_NAME("16020183090"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(WHITELIST(CSBE_DEBUG_STATUS(RENDER_RING_BASE), 0))
> +	},

It doesn't look like this workaround applies to Xe2_HPG anymore
according to the latest workaround database.

The rest of the workarounds look correct, so after dropping this entry,

        Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


Matt

>  
>  	{}
>  };
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 74b33a3845f2..a163a764d25e 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -459,6 +459,55 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, SLM_WMTP_RESTORE))
>  	},
> +
> +	/* Xe2_HPG */
> +
> +	{ XE_RTP_NAME("16018712365"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, XE2_ALLOC_DPA_STARVE_FIX_DIS))
> +	},
> +	{ XE_RTP_NAME("16018737384"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(ROW_CHICKEN, EARLY_EOT_DIS))
> +	},
> +	{ XE_RTP_NAME("14019988906"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FLSH_IGNORES_PSD))
> +	},
> +	{ XE_RTP_NAME("14019877138"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FD_END_COLLECT))
> +	},
> +	{ XE_RTP_NAME("14020338487"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(ROW_CHICKEN3, XE2_EUPEND_CHK_FLUSH_DIS))
> +	},
> +	{ XE_RTP_NAME("18032247524"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, SEQUENTIAL_ACCESS_UPGRADE_DISABLE))
> +	},
> +	{ XE_RTP_NAME("14018471104"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, ENABLE_SMP_LD_RENDER_SURFACE_CONTROL))
> +	},
> +	/*
> +	 * Although this workaround isn't required for the RCS, disabling these
> +	 * reports has no impact for our driver or the GuC, so we go ahead and
> +	 * apply this to all engines for simplicity.
> +	 */
> +	{ XE_RTP_NAME("16021639441"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2001)),
> +	  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0),
> +			     GHWSP_CSB_REPORT_DIS |
> +			     PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS,
> +			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
> +	},
> +	{ XE_RTP_NAME("14019811474"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2001),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, WR_REQ_CHAINING_DIS))
> +	},
> +
>  	{}
>  };
>  
> @@ -580,6 +629,20 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>  	  XE_RTP_ACTIONS(SET(INSTPM(RENDER_RING_BASE), ENABLE_SEMAPHORE_POLL_BIT))
>  	},
>  
> +	/* Xe2_HPG */
> +	{ XE_RTP_NAME("15010599737"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1, DIS_SF_ROUND_NEAREST_EVEN))
> +	},
> +	{ XE_RTP_NAME("14019386621"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(VF_SCRATCHPAD, XE2_VFG_TED_CREDIT_INTERFACE_DISABLE))
> +	},
> +	{ XE_RTP_NAME("14020756599"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(WM_CHICKEN3, HIZ_PLANE_COMPRESSION_DIS))
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
