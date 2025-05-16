Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C942C3ABC9
	for <intel-xe@archiver.kernel.org>; Fri, 16 May 2025 19:00:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFF7C10EB72;
	Fri, 16 May 2025 19:00:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UFy6uHDS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3E6210EB72
 for <intel-xe@lists.freedesktop.org>; Fri, 16 May 2025 19:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747422028; x=1778958028;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6EV9q4zmSbXG0AA+MLFE3tUTTVWiosNmEmDaPb/tuCg=;
 b=UFy6uHDSNJRCp54Scc0taJIGf2bvB1wTn68Zmb8eo+3xxCLJb744EzmK
 /aq+JE2saHiBMyjj49Lb7g7ByZ19NGRNafkCJPjFUr0LeWpmDNvwkUktB
 wp81sdcWx7XNYQgqX/YlgTAAVCgxb2xr3JE2dVPje1SjfKje+U05imGsG
 TwwdOK0fnox+52sI7PTqsE3RT+gqIHrMqFF7p1VTfQRfQ0VOmF+ywR8h0
 4PU/N63ZK6HsDdZKCMY3y4P2HWfEpr/bSwoQOnG/9HPtETh/pOcsH487l
 FYsfKZ1zRE2eldIjENIgBQxb9TFJwBP6/hCwQXuxhYN3a3UxD69QqHZNX Q==;
X-CSE-ConnectionGUID: j01djCfgRxa9uA81XsszFA==
X-CSE-MsgGUID: QN7LD4bRQWyUvahHrWwPDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="60795128"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="60795128"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 12:00:24 -0700
X-CSE-ConnectionGUID: u/bvWE7/QW2Vd+aqS8NUMw==
X-CSE-MsgGUID: cBesX0HST06s4JMf1LUZYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="169701665"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 12:00:24 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 12:00:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 16 May 2025 12:00:23 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 16 May 2025 12:00:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=unpcC2uSbdX8B+0x2y5XuEZhQPyy5DrRMMM+Wo3y8HdpBWQwUFD4P8O3q3d03ImZbam54Q5Vp9FOrFoLiJsClb6Hz/IgGjWhvTPkPL5iC5FLccy87FtKAX6gZT0auDT+eNtDrkiGe9Yw7EqNgM57imwov3t6NxWammjRWv/AtSP2ok/MjAbRdbG8dtagpKpSctWd0EUQ+39SxniIXKiD3FkBq8WrKR+VuZgbRDlF2AHsY8OXJrWfcNMP3SWN11aQZ8rdxYUFEfdEMWa2Q+BbWbW+vBOoJI7ENzYGBR8elSlnGidmoM2k1fn0mxlNyJb7TgvEjftHX0fiLuyH0oazVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XVfcYx4otHx9YCCgC+SkONyZ+DD3vw45fBHw3WA5Uwg=;
 b=YvS7hfNgpVpYUodPb8C2t2TkMUJ3p1gFsJjW/qpHA39wnVrusqeBGpE19vmrie4NUl2HZJDIjwqDIMOcNtRbEpItxe1O7G75Xx/lRIz6ah9sPBp/ROL8zHhZLGgc8h+C8hezgviIFDhmXXRU+HGb8jY0OTM+ZnQKt1ISTpt1IxWdOiomsBmyWvzaPE+fawP88ZrEFXy/5b75wXOwVDm0cFHFJw9EyAzaxl/jNOpDAZCh9ZOVO8tesIClxxCBFSlqs0BgMBk6kFKImw91D0MSDBbsKEVhh0e3meWNqJTV3E/G9RMpF1FnVNcMcLQlnrCYtiITKA/GglTPiJhHuODbmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ0PR11MB4912.namprd11.prod.outlook.com (2603:10b6:a03:2ae::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Fri, 16 May
 2025 19:00:03 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%3]) with mapi id 15.20.8722.031; Fri, 16 May 2025
 19:00:02 +0000
Date: Fri, 16 May 2025 12:00:00 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>
Subject: Re: [PATCH 2/3] drm/xe/xelp: Implement HSDES#16010904313 workarounds
Message-ID: <20250516190000.GL5080@mdroper-desk1.amr.corp.intel.com>
References: <20250516074412.46863-1-tvrtko.ursulin@igalia.com>
 <20250516074412.46863-3-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250516074412.46863-3-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: BYAPR05CA0048.namprd05.prod.outlook.com
 (2603:10b6:a03:74::25) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ0PR11MB4912:EE_
X-MS-Office365-Filtering-Correlation-Id: 09da5e13-2807-4001-dbcc-08dd94abdd26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2p2Rf+2gjG3cUC4Hv6/t6Bd/HswMPdtLxXNIkCLc/cwpsH16wubwjtgOxpRC?=
 =?us-ascii?Q?Tz7cWRMDJWlT3dmbm0KfhUBKHi9Jk3u3fNEp6BFRDmcpPJ5p+lzFcqKWvgMI?=
 =?us-ascii?Q?j1LotpEzM5JCoTGgtLPNtq89eN+4/+w0+pIsSxVa2ZmKnLGDH2EUaWhJHTO2?=
 =?us-ascii?Q?UAMSq6KY+LXAdFtEU46z9Jv3doHYdGxZyET3O/OE/4r2x7mmSxN4fRc2v1UU?=
 =?us-ascii?Q?pRawF9DzoRRZ2kdYLYG3BuTC82fqCXkCzioYzBSf0j4vh/m5MTInq36f/gLz?=
 =?us-ascii?Q?Swz5cqX/oFLe5Z2NWREQnNhAr9a5/57ehazTUt8Riy1tlBfxbW+IEe/8/gcr?=
 =?us-ascii?Q?qGSNQQWgcWW0le9OvL9jWSuakXrXux7TzHulnDHr8BIC+wkhPROGiYU0mzuR?=
 =?us-ascii?Q?7xb4cBUOBYHutHCxWstcRwmdve+pSlo0oxy2gZIWLP6t3kuID1J5Fnh9Rk6F?=
 =?us-ascii?Q?EIR0yrdtA5jwtj+ZPoCJk52Y6Fzy6J1FGOPaBaorWdCIthIQV5Jvq8UHCY+k?=
 =?us-ascii?Q?qNdb/yFKybxFIhjd/TP6LgKvfe4H6Kqvt2TwnyOGzKAtpoiyxv315eIcqrFc?=
 =?us-ascii?Q?2LMHqviGqaLxnV9H8oCzw6BYKKO3i11nbUCvAP0k0Z7o04RhH9BZjjLYRKg9?=
 =?us-ascii?Q?hK5yigFL60UdzxFyVIcejgC+hFHNfrk0PPkiUtpfMKoHl/PEA6/LHInh5vlA?=
 =?us-ascii?Q?DOY7n3M7OrE+MKFThjyYm/5iGcjZe2ECuxyUyw3HYWsjzJOZdX5ipw6KbMqK?=
 =?us-ascii?Q?1iOWmnQTpq9oEZdiNyAHKBNpG+b3m8bUtWYAiQEYZDyQbBLM9FzmdTFLv8LG?=
 =?us-ascii?Q?+evRdXa8c6UokvXHAAagN0lqGE4GJUY8WGiD5pUYA2PkOv7otDT5v8hIGS8F?=
 =?us-ascii?Q?Nxyj6rRT1n+XX1pTSNFbcBRphAcIPeueJn5kSL2wWzbsp7CpDxaywiDE2CH9?=
 =?us-ascii?Q?uWaFAPTPGXNSYRLajtj+dIWvEgaCG8MNAgzT7RakzA5Bhfmd3bMv7dQGHi8e?=
 =?us-ascii?Q?2fyOqP1puDzlCRRi0XiFLk2fRpAJ3RKHCEH8dIqEjf4ZeZN9Wkevh8RyDgj5?=
 =?us-ascii?Q?tyd9zoRtuYvScwkuz90rOB2C3DGsBx94jMmvrHSQXgDOYb9sFcFtVLFmBNPT?=
 =?us-ascii?Q?g6idN4DlDMjBpE78bGqF7NAFmbCB7+6Ez6JsA1WYa8bHflPBZ1Qqe20NXHT6?=
 =?us-ascii?Q?9lCnjl6lW8j/upT7fpiiuzwP23uiKQxaZ8+AjGOUkdlt6++a/auh149wMh7B?=
 =?us-ascii?Q?tL2N8WvEETi4ac90ykE8scwICiKo1H5PC+PIN+oDw/1KGKEu6gxHHfrRV4Eo?=
 =?us-ascii?Q?sZdPJz22qsdQB4jayEvEQsYYsRZdciYgX04j6LfiR6nPR+Z+BytwU4tOBZJl?=
 =?us-ascii?Q?26DrDLAzVypqR9OeNSTksjUJjxXwUAHgIVm9YWUmxxLt7X4rsh0FfNjPfsSr?=
 =?us-ascii?Q?Z9ZuWac36QQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6SiXrwfi7JHxNlgI+R2dckfXphYCOVrq/pYOPD2OwnNdFrbbHu0LrR0OhG8v?=
 =?us-ascii?Q?nFG3iKPnypWC0cJrkfBsNU7VP02ZifB5Q/176n9Tjxivlmos0jyu2GRF151D?=
 =?us-ascii?Q?P0f+Gp3RcXEDnEzO1lPX/lMBsawamxEMiK0fZU5QWSyMWGl2EAss9jBbvY+S?=
 =?us-ascii?Q?td4lzhjOoN7mPUwlasny7g5p0LgD/j09npR59XR9lMmRUvBMi6xAAVgVt9gQ?=
 =?us-ascii?Q?d0wsVeyL+LObC3jKq5/bt4FDmuUxa8D6104h1EtYbtFA3ejXfW1uYfA5BcTy?=
 =?us-ascii?Q?aFDmkW7eR8ef6BQdKEhaXkJ/7nFqZsE0qE8obNUhQtt6s14eZi9HLGPkDr8p?=
 =?us-ascii?Q?Ubmokvc5uYFKo1HTBgTup8lwUaUabX0eczimp7wq6jNNk7v8PYzMpiNxqdns?=
 =?us-ascii?Q?GG7eSWhdoOoxyNIjrg7hrexEzEDSWaeeyHRn03JQWZ2ur67eCcuz2Si0hkdk?=
 =?us-ascii?Q?DBj3vDYsQcalKaiF2yzRiRenAfsIo9cJJTpGc7FlUR6nE4v1mR/czWTkbY43?=
 =?us-ascii?Q?DgmxibNaIcXlQOCU5mXZVArM3mgIspgxG/pRAFtELHoBZxgScBe5E3me9VP6?=
 =?us-ascii?Q?k7qhGJwrpwfNaj8/5BKZVryMBVjCYDEhixN9V/s7jAJ0s2AQ8XgO7hEtFPI3?=
 =?us-ascii?Q?zmq8fsNdgReDx66unrn4JtHNRg10CpPm3p4KFyJBCp3cN3LItcI9jIbeAhaZ?=
 =?us-ascii?Q?tXn/gVgXk2CrUKY0IlxGs8e7MFyFT+BQTqHj3+/TQTxpQCs/qPugcZS3Pdly?=
 =?us-ascii?Q?px3cucbmbzVqXabQt7qGfU/QR9Ty4yo7vS7eYYmdfwV9mmzcZJUve6HRss3a?=
 =?us-ascii?Q?g9qMQD4gpjF3IWVyXVltiC049T+HM93Amit+meQpdMNrc4UcYasnGxnYOUaB?=
 =?us-ascii?Q?A6ZZKrtAZI983EDTwg5zdU0Mmn/NiXTB5LLSEvTcoOb40WujPMKNec9cDDw0?=
 =?us-ascii?Q?i4A4IMbZh0JV7TXcWa5t2mnwftHULMK7jOkOtZIKS1Q0kXXIG7imDr8HH859?=
 =?us-ascii?Q?9suBz0bdMRbCfPGwbpRtjHiGot1gx6FyHTed6shbaMlDq9INi4KW6som+SZy?=
 =?us-ascii?Q?9vwqnITqvVxr3fis3ZKnaErnqXeYd6ik2vOrJM9YXytySLxSb20F2MkFUgvZ?=
 =?us-ascii?Q?4dOPFIhzTPn/6PV9y1cu/dI0j7A1rqS8YfX2Jm/8oZWVC/6/dQowdjnvLyuk?=
 =?us-ascii?Q?vjwuWISuSIIQM7uepCekAU4/1dWJWHyhgeJ1YNDeRxc6HVqYcPTO/edv09xr?=
 =?us-ascii?Q?FXZ9YbJK+1m0idhWz1sPfD0D0C6Vso2qlz15Zeq74KhLC88UBfMxrcBta+cQ?=
 =?us-ascii?Q?bK82SolJ2HZ+x7KPOuist4nCcqzx41YP0ETDwXOAumr4DwPbkCou7i2fl2Sj?=
 =?us-ascii?Q?+3dswBq3ZQV/7LKUhQreUWDpum/v12Enqo8wc/RTs/AotiTw5rIcVS7UR1CL?=
 =?us-ascii?Q?y3JgZfR4cODN29HxNnG6bCLjMW3eyFCA4aobL60pb8unZsu95B/mkxpTip6i?=
 =?us-ascii?Q?v7EK/fE3+pUswH9Lx7/MMvahMqxqWWloyOjOxdd7DvIRLDJcLW12p/EGsyss?=
 =?us-ascii?Q?u+/vwkDS+HLftoZDTQTvdfysrMkxnJq7u7Jv+sqDie28pBD4ogGZ70etbNLi?=
 =?us-ascii?Q?QA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 09da5e13-2807-4001-dbcc-08dd94abdd26
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 19:00:02.9110 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B+FEmNk7vNgV9kpaVc8+mYJhb6Fptpr6FqJZhZZ3+/HZw1D7bd3dv8d7o1kKwYVPRdSU23Q/tmH83AlNtRnQvCgXMy8HR5FzdlftVi/iAFU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4912
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

On Fri, May 16, 2025 at 08:44:11AM +0100, Tvrtko Ursulin wrote:
> Add XeLP workarounds specified in HSDES#16010904313.
> 
> To do this we add the context indirect workaround page to the context
> state and set it up using the i915 as the programming reference.

We should probably split the general indirect context setup/prep into a
separate patch from specific workarounds like Wa_16010904313 and 

> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h |   1 +
>  drivers/gpu/drm/xe/regs/xe_lrc_layout.h  |   7 ++
>  drivers/gpu/drm/xe/xe_lrc.c              | 115 +++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_lrc_types.h        |   3 +-
>  4 files changed, 125 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index 7ade41e2b7b3..d1d2592e010d 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -75,6 +75,7 @@
>  #define RING_ACTHD(base)			XE_REG((base) + 0x74)
>  #define RING_DMA_FADD(base)			XE_REG((base) + 0x78)
>  #define RING_HWS_PGA(base)			XE_REG((base) + 0x80)
> +#define RING_CMD_BUF_CCTL(base)			XE_REG((base) + 0x84)
>  #define RING_HWSTAM(base)			XE_REG((base) + 0x98)
>  #define RING_MI_MODE(base)			XE_REG((base) + 0x9c)
>  #define RING_NOPID(base)			XE_REG((base) + 0x94)
> diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
> index 994af591a2e8..82723f9783b1 100644
> --- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
> +++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
> @@ -12,6 +12,8 @@
>  #define CTX_RING_START			(0x08 + 1)
>  #define CTX_RING_CTL			(0x0a + 1)
>  #define CTX_BB_PER_CTX_PTR		(0x12 + 1)
> +#define CTX_CS_INDIRECT_CTX		(0x14 + 1)
> +#define CTX_CS_INDIRECT_CTX_OFFSET	(0x16 + 1)
>  #define CTX_TIMESTAMP			(0x22 + 1)
>  #define CTX_TIMESTAMP_UDW		(0x24 + 1)
>  #define CTX_INDIRECT_RING_STATE		(0x26 + 1)
> @@ -30,10 +32,15 @@
>  #define CTX_CS_INT_VEC_REG		0x5a
>  #define CTX_CS_INT_VEC_DATA		(CTX_CS_INT_VEC_REG + 1)
>  
> +#define CTX_GPR0			(0x74 + 1)
> +#define CTX_CMD_BUF_CCTL		(0xb6 + 1)
> +
>  #define INDIRECT_CTX_RING_HEAD		(0x02 + 1)
>  #define INDIRECT_CTX_RING_TAIL		(0x04 + 1)
>  #define INDIRECT_CTX_RING_START		(0x06 + 1)
>  #define INDIRECT_CTX_RING_START_UDW	(0x08 + 1)
>  #define INDIRECT_CTX_RING_CTL		(0x0a + 1)
>  
> +#define XELP_CTX_RCS_INDIRECT_CTX_OFFSET_DEFAULT	0xd
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 08835e36a60d..6022068ce6b6 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -39,6 +39,7 @@
>  #define LRC_ENGINE_INSTANCE			GENMASK_ULL(53, 48)
>  
>  #define LRC_PPHWSP_SIZE				SZ_4K
> +#define LRC_INDIRECT_CTX_SIZE			SZ_4K
>  #define LRC_INDIRECT_RING_STATE_SIZE		SZ_4K
>  
>  static struct xe_device *
> @@ -47,6 +48,11 @@ lrc_to_xe(struct xe_lrc *lrc)
>  	return gt_to_xe(lrc->fence_ctx.gt);
>  }
>  
> +static bool xe_needs_indirect_ctx(struct xe_device *xe)
> +{
> +	return GRAPHICS_VERx100(xe) >= 1200 && GRAPHICS_VERx100(xe) <= 1210;

I don't think any platform/IP inherently "needs" indirect context usage;
it's just certain workarounds are implemented using it.  So it would be
best if we implement each of those workarounds through the OOB
workaround infrastructure.  Then this function should just || together
XE_WA checks for all the workarounds that result in indirect context
usage.


> +}
> +
>  size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> @@ -79,6 +85,9 @@ size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class)
>  		size += 1 * SZ_4K;
>  	}
>  
> +	if (xe_needs_indirect_ctx(xe))
> +		size += LRC_INDIRECT_CTX_SIZE;
> +
>  	/* Add indirect ring state page */
>  	if (xe_gt_has_indirect_ring_state(gt))
>  		size += LRC_INDIRECT_RING_STATE_SIZE;
> @@ -974,6 +983,106 @@ static void xe_lrc_setup_utilization(struct xe_lrc *lrc)
>  
>  }
>  
> +static u32 *
> +xelp_emit_timestamp_wa(struct xe_lrc *lrc, u32 *cmd)
> +{
> +	*cmd++ = MI_LOAD_REGISTER_MEM | MI_LRM_USE_GGTT | MI_LRI_LRM_CS_MMIO;
> +	*cmd++ = CS_GPR_REG(0, 0).addr;
> +	*cmd++ = __xe_lrc_regs_ggtt_addr(lrc) + CTX_TIMESTAMP * sizeof(u32);
> +	*cmd++ = 0;
> +
> +	*cmd++ = MI_LOAD_REGISTER_REG | MI_LRR_SRC_CS_MMIO | MI_LRI_LRM_CS_MMIO;
> +	*cmd++ = CS_GPR_REG(0, 0).addr;
> +	*cmd++ = RING_CTX_TIMESTAMP(0).addr;
> +
> +	*cmd++ = MI_LOAD_REGISTER_REG | MI_LRR_SRC_CS_MMIO | MI_LRI_LRM_CS_MMIO;
> +	*cmd++ = CS_GPR_REG(0, 0).addr;
> +	*cmd++ = RING_CTX_TIMESTAMP(0).addr;

This doesn't seem to actually match the documented workaround details.
The workaround says we need to do three back-to-back MI_LRM instructions
to read CTX_TIMESTAMP into $lrc+0x108C.  The first two are supposed to
have dw0[21] (i.e., async mode) enabled, and the third should have it
disabled.  I'm guessing this got implemented in i915 before the formal
workaround description was finalized, or the hardware people updated the
description after we'd already implemented the workaround.

That will also prevent us from clobbering the GPR register, which will
let us drop the restore_scratch function.

> +
> +	return cmd;
> +}
> +
> +static u32 *
> +xelp_emit_restore_scratch(struct xe_lrc *lrc, u32 *cmd)
> +{
> +	*cmd++ = MI_LOAD_REGISTER_MEM | MI_LRM_USE_GGTT | MI_LRI_LRM_CS_MMIO;
> +	*cmd++ = CS_GPR_REG(0, 0).addr;
> +	*cmd++ = __xe_lrc_regs_ggtt_addr(lrc) + CTX_GPR0 * sizeof(u32);
> +	*cmd++ = 0;
> +
> +	return cmd;
> +}
> +
> +static u32 *
> +xelp_emit_cmd_buf_wa(struct xe_lrc *lrc, u32 *cmd)
> +{
> +	*cmd++ = MI_LOAD_REGISTER_MEM | MI_LRM_USE_GGTT | MI_LRI_LRM_CS_MMIO;
> +	*cmd++ = CS_GPR_REG(0, 0).addr;
> +	*cmd++ = __xe_lrc_regs_ggtt_addr(lrc)+ CTX_CMD_BUF_CCTL * sizeof(u32);
> +	*cmd++ = 0;
> +
> +	*cmd++ = MI_LOAD_REGISTER_REG | MI_LRR_SRC_CS_MMIO | MI_LRR_DST_CS_MMIO;
> +	*cmd++ = CS_GPR_REG(0, 0).addr;
> +	*cmd++ = RING_CMD_BUF_CCTL(0).addr;

I don't see any documented workaround asking us to do this restoration
of the CMD_BUF_CCTL register.  I suspect the i915 implementation was
either something for pre-production hardware that never should have
stuck around in the driver, or it was hacking around some other driver
bug.  Are you finding this to actually be necessary for something today?

> +
> +	return cmd;
> +}
> +
> +static u32 *
> +xelp_setup_indirect_ctx_rcs(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> +			    u32 *cmd)
> +{
> +	/* HSDES#16010904313 */
> +	cmd = xelp_emit_timestamp_wa(lrc, cmd);
> +	cmd = xelp_emit_cmd_buf_wa(lrc, cmd);
> +	cmd = xelp_emit_restore_scratch(lrc, cmd);
> +
> +	return cmd;
> +}
> +
> +static u32 *
> +xelp_setup_indirect_ctx_xcs(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> +			    u32 *cmd)
> +{
> +	/* HSDES#16010904313 */
> +	cmd = xelp_emit_timestamp_wa(lrc, cmd);
> +	cmd = xelp_emit_restore_scratch(lrc, cmd);
> +
> +	return cmd;
> +}
> +
> +static void
> +xelp_setup_indirect_ctx(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
> +{
> +	u32 *start, *cmd, *regs;
> +	struct iosys_map map;
> +	u32 ggtt, offset;
> +
> +	if (!(lrc->flags & XE_LRC_FLAG_INDIRECT_CTX))
> +		return;
> +
> +	offset = lrc->size - LRC_INDIRECT_CTX_SIZE;
> +	ggtt = xe_bo_ggtt_addr(lrc->bo) + offset;
> +
> +	map = lrc->bo->vmap;
> +	iosys_map_incr(&map, offset);
> +	start = cmd = map.vaddr;

Isn't this going to be a problem if the iosys_map is holding iomem?  If
we're going to build the indirect context batch directly with CPU
pointer accesses as the functions above do, don't we need to do that in
a separate buffer and then copy it into the iosys_map?


> +
> +	if (hwe->class == XE_ENGINE_CLASS_RENDER)
> +		cmd = xelp_setup_indirect_ctx_rcs(lrc, hwe, cmd);

This also deviates from the documented workaround.  According to the
workaround database, INDIRECT_CTX should be used for RCS/CCS, but we're
supposed to use BB_PER_CTX_PTR instead for RCS/CCS (both are similar
mechanisms, but INDIRECT_CTX happens somewhere in the middle of a
context restore, whereas BB_PER_CTX_PTR happens at the very end of the
context restore).


Matt

> +	else
> +		cmd = xelp_setup_indirect_ctx_xcs(lrc, hwe, cmd);
> +
> +	while ((unsigned long)cmd & 0x3f) /* Align to 64B cacheline. */
> +		*cmd++ = MI_NOOP;
> +
> +	map = __xe_lrc_regs_map(lrc);
> +	regs = map.vaddr;
> +
> +	regs[CTX_CS_INDIRECT_CTX] = ggtt | ((cmd - start) * sizeof(u32) / 64); /* Size in CLs. */
> +	regs[CTX_CS_INDIRECT_CTX_OFFSET] = XELP_CTX_RCS_INDIRECT_CTX_OFFSET_DEFAULT << 6;
> +}
> +
>  #define PVC_CTX_ASID		(0x2e + 1)
>  #define PVC_CTX_ACC_CTR_THOLD	(0x2a + 1)
>  
> @@ -997,6 +1106,10 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  	lrc->size = ring_size + lrc_size;
>  	lrc->ring.size = ring_size;
>  	lrc->ring.tail = 0;
> +
> +	if (xe_needs_indirect_ctx(xe))
> +		lrc->flags |= XE_LRC_FLAG_INDIRECT_CTX;
> +
>  	if (xe_gt_has_indirect_ring_state(gt))
>  		lrc->flags |= XE_LRC_FLAG_INDIRECT_RING_STATE;
>  
> @@ -1127,6 +1240,8 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  
>  	xe_lrc_setup_utilization(lrc);
>  
> +	xelp_setup_indirect_ctx(lrc, hwe);
> +
>  	return 0;
>  
>  err_lrc_finish:
> diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
> index 559c7c831212..9ce7d02ef210 100644
> --- a/drivers/gpu/drm/xe/xe_lrc_types.h
> +++ b/drivers/gpu/drm/xe/xe_lrc_types.h
> @@ -29,7 +29,8 @@ struct xe_lrc {
>  	struct xe_gt *gt;
>  
>  	/** @flags: LRC flags */
> -#define XE_LRC_FLAG_INDIRECT_RING_STATE		0x1
> +#define XE_LRC_FLAG_INDIRECT_CTX		0x1
> +#define XE_LRC_FLAG_INDIRECT_RING_STATE		0x2
>  	u32 flags;
>  
>  	/** @refcount: ref count of this lrc */
> -- 
> 2.48.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
