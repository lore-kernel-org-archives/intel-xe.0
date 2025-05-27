Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11001C54ED1
	for <intel-xe@archiver.kernel.org>; Tue, 27 May 2025 18:25:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF74B10E061;
	Tue, 27 May 2025 18:25:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LcKb+5kB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E69910E061
 for <intel-xe@lists.freedesktop.org>; Tue, 27 May 2025 18:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748370309; x=1779906309;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HbZxfz/ZwHoSjqdp5qx/I8b4rQMWeQ9+z+5xjmYT/JM=;
 b=LcKb+5kBtFBPWWbV04/jszQjRnJLO26+Jb9eRx1NdTJ6vcs+wqIeVsjZ
 E31w2SARPFWNpsEH7t2rMqsPPN7+e+zhz//NPgIgX8jisRqqFbad2Bxyq
 Uiie3Eh7WYbQOAzhc+c3DaBtc26uS+Q25Nrj0/arX4K7G/xOh8lb0tKKr
 u/FJSOXuTIY5g6KgVdD1BsWWt8VkgOYnG4EC8vRWAqpmUD3sWh1Jpl2P4
 tPrj/ZmKFwhczoF/GWurOBb4ciySaEJxSrlPk8LMBMmXYhyGyk3NqXzuV
 1ItfGH2LWZ2HMUbnU7IiCSDGk76xFvr2BViHXdSpoAuFUM4B5ldNMgHNL g==;
X-CSE-ConnectionGUID: FpbImaiTRI28mdUE2lcMRQ==
X-CSE-MsgGUID: FsKtpruUTAWhF+rzekU4lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="50376614"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; d="scan'208";a="50376614"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 11:25:09 -0700
X-CSE-ConnectionGUID: fZbfKDDJT/SiqYZdyVMOyw==
X-CSE-MsgGUID: KE7NaSFVSfq8UfanNztU8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; d="scan'208";a="148207934"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 11:25:08 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 27 May 2025 11:25:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 27 May 2025 11:25:08 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.79)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 27 May 2025 11:25:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ujFQFWaZoAQ38kpX6ikAWYu15iOxf4LTMslFuC6027q619Uhg9ZjSS80AQcn09dS2TG90GtqLnc44F6lKCiuqd1kvuXzXTviW2OjXdjoZro5W9H3WrC0l+fE+ztbDRJXW1QgI3MXLFXUm2RooPwiKTpLwzb9T+veLJU+tOf7XrQ8/DUS4gIcdvQXt4TT2clSBZ7untv5tAuvxIhqHyrMAklVxaVtM7wI5JvSp8mdrf3/uZ8BdrsFUWtTkHV217bmgO8/2QSLvsQiXFFkZHivy8fBoR5668Q1qx49nC8Mq5xTx386XNNWM5x7Mxfb5nKYuBft0mdEtwk+jnfIa5R0Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vYoaAVoJDqIM/MZC4n/MKGfOkbD+YPWj9yFAHa2sUM4=;
 b=Xc+HMPO/wjNLCO9y3KN+3jhHaFIsDSYf3ZQFaBIhdO+AbQwxNJoby1g6sCBI00R9qCyd3a3HdiRsmxSlWuD4/zObhsnNDBPzm6n3X4pRHZhIh6Ka6e4usFrsfmUtB+ruTQl3+fwLQD2BtDEdhIU6b2CWfJPm+i3DTESyuaSKer01m6YzZJHzm6MtlmHoYeLBOvubS4qWnRooCoMVL4lzuP9D9BI5gBHTLYtpHzIEQyDFPB+xCAKhhhmxptZi7Ux9wibzXj+15JI6EwE6umoPOJsE9A/MC2vCUBLrQYWY54ZvyyK2B5yxJil8GKp1jfUifGBGMoXvMWPDlzzvsI6b5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB5119.namprd11.prod.outlook.com (2603:10b6:a03:2d6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Tue, 27 May
 2025 18:24:23 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8769.021; Tue, 27 May 2025
 18:24:23 +0000
Date: Tue, 27 May 2025 11:25:54 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Jia Yao <jia.yao@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Brian3 Nguyen <brian3.nguyen@intel.com>, 
 Alex Zuo <alex.zuo@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 "Maciej Patelczyk" <maciej.patelczyk@intel.com>, Shuicheng Lin
 <shuicheng.lin@intel.com>
Subject: Re: [PATCH v2] drm/xe: Fix out-of-bounds field write in
 MI_STORE_DATA_IMM
Message-ID: <aDYDsozeWc+kpEfV@lstrano-desk.jf.intel.com>
References: <20250523150418.168362-1-jia.yao@intel.com>
 <20250527163050.287042-1-jia.yao@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250527163050.287042-1-jia.yao@intel.com>
X-ClientProxiedBy: BY3PR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:a03:254::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB5119:EE_
X-MS-Office365-Filtering-Correlation-Id: da10e631-ed2f-4f0b-1cee-08dd9d4bb49e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KOwgxMrFGkcHUITpcRjoevOHj2UGMo5BnS2Lq3XLn9blm1NOS+CNSJ7bnGMf?=
 =?us-ascii?Q?3xVJWrEF9mMm8kNMbrBd6k1yh7qlTcK/j9oxMlrr924CuzSpfu1KAGYGLLt9?=
 =?us-ascii?Q?EV9nHIzzqQH+CkpM5RQnidXmiBdJk7QzXbKlb3drG47Ikkya9CiIJXU1kbrd?=
 =?us-ascii?Q?9poJZw+FQq/nCQrFVG0ELiV+ErGOLL5tjlYCdt7ER7vjvGDUJVW/lsyJPTIZ?=
 =?us-ascii?Q?3AH4rB/SrCU0o+b0BT7bXY6hmSTmkCvYA4c7aHmRu95rbS8ZYYZjGSScUywr?=
 =?us-ascii?Q?Is7fu9R1H1/ZihJq5XALeqOoczosjUi7OXZvyPlDEgQlJtLFS7wvjm+ab5DS?=
 =?us-ascii?Q?26mTOz6Agf+klgqY3rC+ciAawhuez5lizH6Nj8xlkzZAJMLcPUFXJOp1Ec4A?=
 =?us-ascii?Q?gMSnj4W4D5gep/fZD2uRFKQJ5r+PpCQXHLdMRT4DbxB5UYUQ5d9FoRVC4TmV?=
 =?us-ascii?Q?DUYHd2BwtbRKhWs0BtnUHKhgqWoMH+WEvneFDdqb+XtpJHPDQfmNMMgi4dff?=
 =?us-ascii?Q?qxNV41F5KO2X3P/MQLL+IB2Id2ULw5HRv/eDs3l5Ptk2UhvkKlDkLwQi+xBL?=
 =?us-ascii?Q?GtPJDorW2WGSsqJgcnw+iM2nqpmru9nSNph7IpBh9cnRgyjU29vgz0aUKcgO?=
 =?us-ascii?Q?Y+AejtjzjvyNz7D9JObCG/ebwrIpLbwHjfbkI+A4mIqm+//66Y1H24HA9Nr9?=
 =?us-ascii?Q?7DReCcrQ7ri8Jki/bRzvN1dq0wqx1DtygE4kXSRTd4iQODKrY0uAsEWabiwS?=
 =?us-ascii?Q?O3VdibvBOkBfURQmjeY7UjB63VOef5QEY7imZ40+Nai1iUcuygX1EqMc3/3I?=
 =?us-ascii?Q?LWnev/mNwSDdoemhprzrrxXeY9MSelRZ4bmNee3jBC7P+p+WWkVT2nR4n7bX?=
 =?us-ascii?Q?BUWgg81x3hsyh3HfdrcuTRt+4lg1VCRKEEouTBTf+YqdNH0ZsjkpXVGcsXdW?=
 =?us-ascii?Q?0oUu+DzxP1jNcTZTLYEmE82X1JRrmwfl3PtQPocKhlxGsLkR2EqU0v6wM/da?=
 =?us-ascii?Q?U4WXBF4BO7T146O4tL9+RHgJsEm73lWPt42atm6qkC/XVjwVgtQFWXM+bGXe?=
 =?us-ascii?Q?ni9g5qrNWuvhmfHqu/k+qy9Q1HFPgjc2Y43a3VU+xGpZfJQqMaC0TaTCC6WD?=
 =?us-ascii?Q?aBuAvMVaK9HdDH8FiiYbOgJZqGTLlHjQSiMgbPnzw5pIbbaKqSPb9B/aL64W?=
 =?us-ascii?Q?poShcrQYNFqlZ4dy6oJa/pgHbXTIxSE/SuzbL0pr85nLgTtCVp/LgZrkLXla?=
 =?us-ascii?Q?xkofFWMTIo3wVqLMWzlQj40d1OsK5l9nPsf0jbdB1GQu3tQp/oCNIJTiTToL?=
 =?us-ascii?Q?ksfTgCqP4scmK8VJOsxXLfRguXlMtWQ77G7m5KbmR72tE2UXAxUsx3SCsZKZ?=
 =?us-ascii?Q?fprWl4n7e40BRQADFOAvPN9+qDI8kY5DsCVvzXX5djaqkqZk2M4mylNh3t/j?=
 =?us-ascii?Q?QY+3UN8sy64=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jrl0qD1i/8koktco/K3yJgMg1JW/ZjkZ0qyAi9YFgtzd28P4ete07AnMQs4w?=
 =?us-ascii?Q?ZWTQHq8aGKCQV6aGhwgb3VhatbZFy92QiC0IwkkenvJdz+bTssnyjeZQfIKd?=
 =?us-ascii?Q?OgmKXhQDfSNpk7Eqqw7WVn3OV8viYGBWjdoNBdaDiW0R1C/r4Bcu3i4pVqLh?=
 =?us-ascii?Q?QZO5r5ALBpKTONkVlpw1Se43ZdCOXPzcdaj8xu6A9LI64xhcBNboox8xZIsu?=
 =?us-ascii?Q?CULmEycixRqobddJAgOdirIkenp6JnDk2Wlb6Cp/6iBi97Wwp/z6KJKP93Eb?=
 =?us-ascii?Q?8DGth/KjJG2z9FwJ7E1htx49pqDK4QnTXGad2Pd3axMGb+9PKer/wN76azeS?=
 =?us-ascii?Q?XLq1P1BMWaQiOs23gd/6MGRbR0hhfWTKyLX7b3ApOYoIoaG7NMs4YUqrEmew?=
 =?us-ascii?Q?W58KsxMrw14ohq8OQMJp6WtlZwbHW6dMIsBlZcXpnh9LwzXcZPqbHQz04yBb?=
 =?us-ascii?Q?83YuxR+Kxk64528JdLMgoL7O9inoPCQwmDvwjDsO155ebzFDcSbVgdamXzqY?=
 =?us-ascii?Q?BVl0k0ftQpLUe+HxcjZStEweevW067USjHpKmoNyQcpknQtz48cQQo3tFul3?=
 =?us-ascii?Q?EcQyCiSDqT/A6FWTWwA1/t2KDApqkKWgPmWI9G5Np6u70S9iuv4MBfhnpnJT?=
 =?us-ascii?Q?vRx/y5A4neLCX+KX6HL9tcJiuwwWBl1Xh8l09c+TiwqhU9A5CSUqaV2WK3cX?=
 =?us-ascii?Q?VSIQlTG8jMFs24Eiib4r+WUc+29pWf0tMQuvVfqwiIAra5w9E+je0cvOr8Vj?=
 =?us-ascii?Q?8WxfDs3Sb5jVQoMuuewjnQL4fqxcbbC1Uaihb6Qcn7OwxT6SQ8WkilBXo47Z?=
 =?us-ascii?Q?lO2Ul9yk9wIrBnjFtJGoOTFJ1J4Ca+smth2omMKhcjBXiR1CT2y1O5ccq1d8?=
 =?us-ascii?Q?7NK70aiTHEsgr6iUrLZ4zTzI/w057s0aBBkSi392oH40DRv4tZo6F79mnKUN?=
 =?us-ascii?Q?+kBE1Skz/rC3o+4wDYir+Y4Y+DVIh7J8vQH1I7ZVzMMPaDXNTuASOhxreL8n?=
 =?us-ascii?Q?N7H190RMQZDaKGes68fXHLBqqvxzETchHna3yj1lIpCLjbq328xEPpy31GOw?=
 =?us-ascii?Q?rdFd+ujbKDac/KOtR8KxXLbRvyQzkttxE2OEdR+BJ37Oe8H8yJwLnIbvuoFU?=
 =?us-ascii?Q?SyWEphv4T7yAuvU0IL01heVkt+4ItdoesQL0lMtRPT/f8i+3TSguv/jw8QUu?=
 =?us-ascii?Q?Yg9MnGw0Ft4x6Wl20JUCmEtuFziIsh6sNJ1BsfR7OCCTlRKZVbePzihBJ1sh?=
 =?us-ascii?Q?cDw+nm7VPB+6tfsEVPqJO/RWasHrRILQHwPYgaJYbG4gdDfOgWDLxoA9daoW?=
 =?us-ascii?Q?ZpK1i6OvjiVch2aiGPRW6wPhFR0MpD2iq3ponmq+14auvgI7rONempozZ3mB?=
 =?us-ascii?Q?CSSOykltWsp/newvhcrkabv5xv+pXXhSuVEWI5uqiSl8Nt9c5OiHBKzi61Ps?=
 =?us-ascii?Q?i8Zj62Rsj7CXv/VpozrO5sRoNLxg2XPj8gCRM/zbPhcCW90X//ESbTJg6pvd?=
 =?us-ascii?Q?TKaIUOFamfbGNtWMjBlyvrPS+w4sCyl1VWdlVjB2dQp3BQJYCkjqjQMob2Gb?=
 =?us-ascii?Q?Wl3Ng/PjnzOsKSt223fgLepe2b3mBTwy+GdG50Xq1dboz704rtaQFy+wyRrh?=
 =?us-ascii?Q?pA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: da10e631-ed2f-4f0b-1cee-08dd9d4bb49e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 18:24:23.6386 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8wNIAFqMeyHO7Yspmse0xz9GVG2bBM5Jl5R/z0iljWUaz84K3S8oN/jVhANQvFQFPSZwZkdbqfebphDugdPlLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5119
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

On Tue, May 27, 2025 at 04:30:50PM +0000, Jia Yao wrote:
> According to Bspec, bits 0~9 of MI_STORE_DATA_IMM must not exceed 0x3FE.
> The macro MI_SDI_NUM_QW(x) evaluates to 2 * x + 1, which means the
> condition 2 * x + 1 <= 0x3FE must be satisfied. Therefore, the maximum
> valid value for x is 0x1FE, not 0x1FF.
> 
> v2
>  - Replace 0x1fe with macro MAX_PTE_PER_SDI (Auld, Matthew & Patelczyk, Maciej)
> 
> Bspec: 60246
> 
> Fixes: 9c44fd5f6e8a ("drm/xe: Add migrate layer functions for SVM support")
> Cc: Matthew Brost <matthew.brost@intel.com>

Thanks for the fix:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Brian3 Nguyen <brian3.nguyen@intel.com>
> Cc: Alex Zuo <alex.zuo@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Maciej Patelczyk <maciej.patelczyk@intel.com>
> Suggested-by: Shuicheng Lin <shuicheng.lin@intel.com>
> Signed-off-by: Jia Yao <jia.yao@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 8f8e9fdfb2a8..1ede50780a14 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -1555,13 +1555,13 @@ static u32 pte_update_cmd_size(u64 size)
>  	XE_WARN_ON(size > MAX_PREEMPTDISABLE_TRANSFER);
>  	/*
>  	 * MI_STORE_DATA_IMM command is used to update page table. Each
> -	 * instruction can update maximumly 0x1ff pte entries. To update
> -	 * n (n <= 0x1ff) pte entries, we need:
> +	 * instruction can update maximumly 0x1fe pte entries. To update
> +	 * n (n <= 0x1fe) pte entries, we need:
>  	 * 1 dword for the MI_STORE_DATA_IMM command header (opcode etc)
>  	 * 2 dword for the page table's physical location
>  	 * 2*n dword for value of pte to fill (each pte entry is 2 dwords)
>  	 */
> -	num_dword = (1 + 2) * DIV_U64_ROUND_UP(entries, 0x1ff);
> +	num_dword = (1 + 2) * DIV_U64_ROUND_UP(entries, MAX_PTE_PER_SDI);
>  	num_dword += entries * 2;
>  
>  	return num_dword;
> @@ -1577,7 +1577,7 @@ static void build_pt_update_batch_sram(struct xe_migrate *m,
>  
>  	ptes = DIV_ROUND_UP(size, XE_PAGE_SIZE);
>  	while (ptes) {
> -		u32 chunk = min(0x1ffU, ptes);
> +		u32 chunk = min(MAX_PTE_PER_SDI, ptes);
>  
>  		bb->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(chunk);
>  		bb->cs[bb->len++] = pt_offset;
> -- 
> 2.34.1
> 
