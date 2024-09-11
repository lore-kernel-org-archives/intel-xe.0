Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE34FEE57D4
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 20:35:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A5E110E1AB;
	Wed, 11 Sep 2024 20:35:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H0jY+2pM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE2F810E1AB
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Sep 2024 20:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726086916; x=1757622916;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UBHiB7gWTUQIskzRo6md7nwROCj2Ns7F0AQByA5Jw70=;
 b=H0jY+2pMPqvB2qEmIgBqaV2QLoS3SrdQStLUGh6nigmuUIRxaQXIEY4r
 epEAD2hisJ6Mz50JyDwKAyBaJwZg5SFSN2OXLEnRNp59LnKOla/V28DWd
 78eHBmiuCenEpoplIVEQE5kR6IL/1/UqOzLfqFwXOpVQeZuGZsqio74YX
 nNziq8HEnXt4GjK7oeDt5XhIuRPjEw3lx87b6lj/sfnCOkUAL1+F50PDt
 zF2gRXvv8XaaqBY4UcnNRRciyNoaIupBVrfJb67tZiO31cd2blO+oYQT2
 TXFXJ6dgLQlptYy1SvsjXLVDc+SUTpjLttaNEIwZxpGhuz38kmth+7jc+ A==;
X-CSE-ConnectionGUID: Aa/pJkpyS/ScKyMq95SSoQ==
X-CSE-MsgGUID: FPFlRw8/SNaCcBTzneDN7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="36047513"
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; d="scan'208";a="36047513"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 13:35:16 -0700
X-CSE-ConnectionGUID: ds4lW0tKRJmWWDMACqttGA==
X-CSE-MsgGUID: wAE7zFYRSmuDsshmJk1THw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; d="scan'208";a="90734209"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2024 13:35:12 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 13:35:12 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 13:35:11 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Sep 2024 13:35:11 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Sep 2024 13:35:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lKhaxg6hs7ETBegqj8QH4dlvEu9k9UDVvQlvGy5vmfm5AL51MriHT8oXyTCoKIudSgkYrVZbFLuPyek3gPEyBYTvSA4vZH4NRA3+Fx3kI/PWaCgVx8QzmUom11ComCWERjuLgbapWXS1pgbsGsX1vGx/ton/rERuW54F0QcshCqv+6Z6HY/4hHGvyORi52MUohdiwAcXIYSRcVBMAaMdUDajAZcTf75lhUCgben1ps//oVZQp1qgyHkl/nJVGmnA2/wxvHRSSCofnphweTfxUZHrgi2OyDTFGcRYFf0IXo4kit87tQuuXEXkszdShOaKAeITh86rBTWzD29GenL0EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FJvGUFwQDYvoewlDInu2IwekaRz/zfQrii1MvNPTZEQ=;
 b=dnQ7TBTSzZUOV8Mh/llmY41X/F6sD3KVCpnkEke31ZynV4GOrD5Bd9ZNRD4gaP1mTm+kTkb2JsVFfGo5r7Ep+dAYAnXhmjYAMis5YpRlo3EYlQxvhKAkTHfrZWLMYjoNDIi0xk/Aknz/W1jiCn7YKk/DNuZDAHkX9rXkwu6YszrLIjztTsF5b2I2+sfUrUPw71gO/v5RLPzRRwZ9G+YesDplokaU9Q0YcMQh7iWzRg48r59LMHtVI3m4XP2VrxgipCZvQxfrbJYIt+QcPkCnRyNweHZMxaub1/DTrxUZ0kQUOUkExFPUUTlskJxKXTklAKbJ3INICd+L03kVyeoaww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH8PR11MB7967.namprd11.prod.outlook.com (2603:10b6:510:25e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Wed, 11 Sep
 2024 20:35:09 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Wed, 11 Sep 2024
 20:35:09 +0000
Date: Wed, 11 Sep 2024 16:35:06 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 21/43] drm/xe/guc: Convert register access to use
 xe_mmio
Message-ID: <ZuH--josF07_gOTB@intel.com>
References: <20240910234719.3335472-45-matthew.d.roper@intel.com>
 <20240910234719.3335472-66-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240910234719.3335472-66-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW4PR03CA0086.namprd03.prod.outlook.com
 (2603:10b6:303:b6::31) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH8PR11MB7967:EE_
X-MS-Office365-Filtering-Correlation-Id: 242444be-ae89-4c75-3ff5-08dcd2a13a60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?b8P/PUhZqTii+QdbwRSjP6FKdDq7RThiFe5AsnftiY+0M8rnBnHADjTkvqVb?=
 =?us-ascii?Q?Qxt1IT0HQPxNYoSVwimCiJPwu5hoke7sxvqPQL67m/D18KaqR+8i3Zry5dwh?=
 =?us-ascii?Q?wEia9f2vsNkn+jH+OVzW9m9GU0WWsJezQAQ5muI9tdG7ut6tuGFInpV9rbBR?=
 =?us-ascii?Q?aXV5s8W9fT0wWJCOZA1zXANffgD6gDmFS0oksUkoC6yqpfTaqgNsh893VYYi?=
 =?us-ascii?Q?VP3lFjQBSD6TOjOrcdcGXOsdfxt3SLOJvnGVwhyFzPjhT+IERSRqZke3w2AL?=
 =?us-ascii?Q?hwdCOeoDII9F4e3pYVYFZQ+aTpBpH+vef2P8KLFmItp3WBPLq8SjvS+cj5u5?=
 =?us-ascii?Q?gbKwNAJpcpSJtqa/vvtgUAVxkj4jJpVjYY1xnSzV6vj4egwK/arVuxi8FOgP?=
 =?us-ascii?Q?QnpiM23BNFH2v/bpfImg/HkI5D/m1D1KswoFw8WXTvCSBDW86FLKq8GmEuiA?=
 =?us-ascii?Q?GTKQUwOSgyId4RKMVgjOXKN2ooGnmFESbrVbNlOmm4XaYSXCTc26kFfa0vVM?=
 =?us-ascii?Q?NDKYPfuiQVik5JkZ/oI7Qu9ofSVMslsiWTv6Wi1mCDzu9CQTLUbYk/h1niUI?=
 =?us-ascii?Q?oQK/UXBxhmRjE2VVfbk9PONb0e8AxM5qJiIbtwJIqHhg7wGVZlDO0YD/c4oI?=
 =?us-ascii?Q?lGeg+FbyaG1x5DvxX2+m7ioOZguksnizFWg7F4G2wy7FtJ3gvYVUI9a71x8m?=
 =?us-ascii?Q?xz4DEpTQvXScbizphyF9taJd5nY/N6xu0pY0bRuDWMK7mKOAQyeh9ZguSHt6?=
 =?us-ascii?Q?J+NbevXCJN112ku/D6Ke6O5+Ljeci4TBtTz60okTS9lLRiJKJ39/GhlCPTi4?=
 =?us-ascii?Q?Rk7qsZCyiMfcsbaa3UWLje9m9icTOxip1CS38GCSYyh6FmQXPZnhRQrAVPht?=
 =?us-ascii?Q?H6mvHB+7G2Mtv4c6ztcFpXST1S/n+Nb/MvrmpTP77dNi0S6boE2h/ZLx9jH2?=
 =?us-ascii?Q?ssP1sQAOM9tHora1SDGH7XzG7PY40mYrmXPklBR4l/a2GdhKsaO9hHByUZLD?=
 =?us-ascii?Q?SiqpNpdP5dDIvYD+s1tiVfPDYBKP6itUkIZ8Cw0rk3yA7+Ps5poy/tTDJGnC?=
 =?us-ascii?Q?F9QXHN6sSztu9mQQGY/Xx/ZRlPqwo+sSSsUF2WVbaXLUIVvUA2sjl+sqOgtJ?=
 =?us-ascii?Q?8lvp0S5F0GhI2rAluK5e08oQ5Z0HbWBXCfWlzLwdzGfNd0sKGTIM5VroWd7u?=
 =?us-ascii?Q?s2eN2Gz4XOvWSWLZHOnuZHWlYBMS5h/zv8mUoNkdoBU6pBLjr3ct2X+kbxq0?=
 =?us-ascii?Q?2Wgcc35sTL+VJuZq2uq3iUB/eHtqhc2CtZQVGk8V3lcL5guiC8MUdndOviEp?=
 =?us-ascii?Q?hytCRk7kf7/VEkTTyDY6m1iVhVLkzlmF7hKwxvvgiZqKNw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AzV4SRuxncJ8QstBGtaIU3UjLT3o+i/+eohBgWwcvmm2Jigl3ckASLBzLs3h?=
 =?us-ascii?Q?GKmfVDnq9vZR52Z3Tp0KKuiPm4Ov2D/NwoR+7bgQu6LM7rTd1qUPlKbkJZGf?=
 =?us-ascii?Q?Olk5uvFvprXJc0Suml2M8okar7Np/ZB9b9vmMgdwxZYxKmwrxaF2GBj6kMEY?=
 =?us-ascii?Q?TCdcSR49KqChWSS6YA5vDYuKeQc/139Rdk+AfVSKOcCEc9u84GBKlxR2/fo9?=
 =?us-ascii?Q?yNgJQaIAUSo2Wd91WQHX3diyoDiipFpFXKZnV+F+sj98s7ibWgHRgzGJAtP7?=
 =?us-ascii?Q?yVzdco2UmX01q8SrXH6i98WqPULjHRttKNAzBvA49qz40ew+jNLS/tVipjlC?=
 =?us-ascii?Q?RyWXva9oIcSsSyRVJyFSl9986hVBEtZHpxECo6OkFTsscHCYcIkVd5H4tAVK?=
 =?us-ascii?Q?Gp4FMrveyeib8XX0ekLHUJLO0Sfn4UD2CwEBbTUIG60FQXigm5+gR7GWdaxl?=
 =?us-ascii?Q?3z/Du3jJtM5Q22LgVSKu0f9F1RFti/RrIrQZkQkcN1OI9uwJbZK0Zq8E2jxZ?=
 =?us-ascii?Q?y18RxkA21OQIifOrlX0c8ZkwL/H6dT1DC6p5I7cPCU+yHpUi3pISz7pLifi9?=
 =?us-ascii?Q?zjITmHKW4pAmO1gI3rOXBqgnj1M+jZiwPu0iQrt/tDtOKadP6DCRqgMyja1c?=
 =?us-ascii?Q?eEWnsPiNLCzzMIralvxQAstiIl4VQAZTu+k1FTKJg/cMhsP3edN8HehyHkPQ?=
 =?us-ascii?Q?as4tkaGY7+JssRXAOm9S40u4Yoe1iVF2xxM9zqQwLcg+b5CtZrhSrkQ3+wX0?=
 =?us-ascii?Q?A58fXSuAcUaluZTEMVwjdyMezCw9w0qaLrIblOxVzHQJ6o+6jUCJp4SsjUYI?=
 =?us-ascii?Q?PIYwCkhGXN35oODjvjsY+nnYhCcFOeuu3/lOf5+OXhdLGTY9q56GxKOq8PUM?=
 =?us-ascii?Q?0pq5nh4/LOjvK5fXqRECLncgrV8l7hRScptuMkOIrQNRuJ5ybW9x+ixOo3Rp?=
 =?us-ascii?Q?4RpsLf4LH0rEs6jSp26stb6jOhDCWZY5OKcMnpjM1oNBq284vObhTMrcsEIX?=
 =?us-ascii?Q?5igcsTFWTu9jTEv8l38UWP4iuT2dIWvxuIgBDAK+eAa/TBzc5mY43hHSW769?=
 =?us-ascii?Q?yynjHKbGDHgIhebMh+9TBpqsbhY1dj9T1GnwYWKGYv45ZxDuKpIAJLiXVIiN?=
 =?us-ascii?Q?xI8yu3KUr2ifPntzfkT0RrZr9j0MOTQVIAY8Z6/m3d9Uf5cuRM6cj8uNZx8d?=
 =?us-ascii?Q?fpmBCX+h8GKoMB9OXoD/Sey96eVgqXevTd6wZfgL4ZuIfCqFpSCblzMlw5XZ?=
 =?us-ascii?Q?SQZ+AWBqYNyluXmvWrsnsNz9EVoEKd0sXl63W95JADy1zJfDGFsfukPaG4mj?=
 =?us-ascii?Q?DXdW9OmWcfOmUvZOAr/zZ2mj908QHWTarrZNaHqW6nPyw8BBqVlOcLbzLqZU?=
 =?us-ascii?Q?8A2Q0Ll4iga5L/PUINBdJiwVNPtXEmxGkj7Gd+PVGOo0PodbQigiLEmuP2j/?=
 =?us-ascii?Q?pdmHs7Rk4VMGoJi7vIdYeIvuPm1Y06zHowDweIcGn4X/PRf3AbokolN4/6UT?=
 =?us-ascii?Q?mBuKOw0PSRI9tSmiV4nzHLwWH8R6erUopjTxPxP4KXHupLSh//gI9bDNaGp1?=
 =?us-ascii?Q?h/e5ufWVsqQe6K+XB3+GLRQD9xIG3JiCR/FGos7nxuSih6qvbAOCIGT6yoV9?=
 =?us-ascii?Q?9Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 242444be-ae89-4c75-3ff5-08dcd2a13a60
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 20:35:09.3110 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0zlothM+z9NtIHmf5iTduUr+7VueN60QU3+4bNtLnw4NSyjxwfUPaYnLsRglK9Y8C4U9GQ3g4nQ90AnughX6qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7967
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

On Tue, Sep 10, 2024 at 04:47:41PM -0700, Matt Roper wrote:
> Stop using GT pointers for register access.
> 
> v2:
>  - Don't drop the _Generic wrapper macro for xe_mmio_wait32_not() yet.
>    Defer that to the final patch of the series instead.  (Rodrigo)

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc.c     | 60 ++++++++++++++++++---------------
>  drivers/gpu/drm/xe/xe_guc_ads.c |  2 +-
>  drivers/gpu/drm/xe/xe_guc_pc.c  | 34 +++++++++----------
>  3 files changed, 50 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 5599464013bd..1eb5bb7e8771 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -236,10 +236,10 @@ static void guc_write_params(struct xe_guc *guc)
>  
>  	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
>  
> -	xe_mmio_write32(gt, SOFT_SCRATCH(0), 0);
> +	xe_mmio_write32(&gt->mmio, SOFT_SCRATCH(0), 0);
>  
>  	for (i = 0; i < GUC_CTL_MAX_DWORDS; i++)
> -		xe_mmio_write32(gt, SOFT_SCRATCH(1 + i), guc->params[i]);
> +		xe_mmio_write32(&gt->mmio, SOFT_SCRATCH(1 + i), guc->params[i]);
>  }
>  
>  static void guc_fini_hw(void *arg)
> @@ -425,6 +425,7 @@ int xe_guc_post_load_init(struct xe_guc *guc)
>  int xe_guc_reset(struct xe_guc *guc)
>  {
>  	struct xe_gt *gt = guc_to_gt(guc);
> +	struct xe_mmio *mmio = &gt->mmio;
>  	u32 guc_status, gdrst;
>  	int ret;
>  
> @@ -433,15 +434,15 @@ int xe_guc_reset(struct xe_guc *guc)
>  	if (IS_SRIOV_VF(gt_to_xe(gt)))
>  		return xe_gt_sriov_vf_bootstrap(gt);
>  
> -	xe_mmio_write32(gt, GDRST, GRDOM_GUC);
> +	xe_mmio_write32(mmio, GDRST, GRDOM_GUC);
>  
> -	ret = xe_mmio_wait32(gt, GDRST, GRDOM_GUC, 0, 5000, &gdrst, false);
> +	ret = xe_mmio_wait32(mmio, GDRST, GRDOM_GUC, 0, 5000, &gdrst, false);
>  	if (ret) {
>  		xe_gt_err(gt, "GuC reset timed out, GDRST=%#x\n", gdrst);
>  		goto err_out;
>  	}
>  
> -	guc_status = xe_mmio_read32(gt, GUC_STATUS);
> +	guc_status = xe_mmio_read32(mmio, GUC_STATUS);
>  	if (!(guc_status & GS_MIA_IN_RESET)) {
>  		xe_gt_err(gt, "GuC status: %#x, MIA core expected to be in reset\n",
>  			  guc_status);
> @@ -459,6 +460,7 @@ int xe_guc_reset(struct xe_guc *guc)
>  static void guc_prepare_xfer(struct xe_guc *guc)
>  {
>  	struct xe_gt *gt = guc_to_gt(guc);
> +	struct xe_mmio *mmio = &gt->mmio;
>  	struct xe_device *xe =  guc_to_xe(guc);
>  	u32 shim_flags = GUC_ENABLE_READ_CACHE_LOGIC |
>  		GUC_ENABLE_READ_CACHE_FOR_SRAM_DATA |
> @@ -473,12 +475,12 @@ static void guc_prepare_xfer(struct xe_guc *guc)
>  		shim_flags |= REG_FIELD_PREP(GUC_MOCS_INDEX_MASK, gt->mocs.uc_index);
>  
>  	/* Must program this register before loading the ucode with DMA */
> -	xe_mmio_write32(gt, GUC_SHIM_CONTROL, shim_flags);
> +	xe_mmio_write32(mmio, GUC_SHIM_CONTROL, shim_flags);
>  
> -	xe_mmio_write32(gt, GT_PM_CONFIG, GT_DOORBELL_ENABLE);
> +	xe_mmio_write32(mmio, GT_PM_CONFIG, GT_DOORBELL_ENABLE);
>  
>  	/* Make sure GuC receives ARAT interrupts */
> -	xe_mmio_rmw32(gt, PMINTRMSK, ARAT_EXPIRED_INTRMSK, 0);
> +	xe_mmio_rmw32(mmio, PMINTRMSK, ARAT_EXPIRED_INTRMSK, 0);
>  }
>  
>  /*
> @@ -494,7 +496,7 @@ static int guc_xfer_rsa(struct xe_guc *guc)
>  	if (guc->fw.rsa_size > 256) {
>  		u32 rsa_ggtt_addr = xe_bo_ggtt_addr(guc->fw.bo) +
>  				    xe_uc_fw_rsa_offset(&guc->fw);
> -		xe_mmio_write32(gt, UOS_RSA_SCRATCH(0), rsa_ggtt_addr);
> +		xe_mmio_write32(&gt->mmio, UOS_RSA_SCRATCH(0), rsa_ggtt_addr);
>  		return 0;
>  	}
>  
> @@ -503,7 +505,7 @@ static int guc_xfer_rsa(struct xe_guc *guc)
>  		return -ENOMEM;
>  
>  	for (i = 0; i < UOS_RSA_SCRATCH_COUNT; i++)
> -		xe_mmio_write32(gt, UOS_RSA_SCRATCH(i), rsa[i]);
> +		xe_mmio_write32(&gt->mmio, UOS_RSA_SCRATCH(i), rsa[i]);
>  
>  	return 0;
>  }
> @@ -593,6 +595,7 @@ static s32 guc_pc_get_cur_freq(struct xe_guc_pc *guc_pc)
>  static void guc_wait_ucode(struct xe_guc *guc)
>  {
>  	struct xe_gt *gt = guc_to_gt(guc);
> +	struct xe_mmio *mmio = &gt->mmio;
>  	struct xe_guc_pc *guc_pc = &gt->uc.guc.pc;
>  	ktime_t before, after, delta;
>  	int load_done;
> @@ -619,7 +622,7 @@ static void guc_wait_ucode(struct xe_guc *guc)
>  		 * timeouts rather than allowing a huge timeout each time. So basically, need
>  		 * to treat a timeout no different to a value change.
>  		 */
> -		ret = xe_mmio_wait32_not(gt, GUC_STATUS, GS_UKERNEL_MASK | GS_BOOTROM_MASK,
> +		ret = xe_mmio_wait32_not(mmio, GUC_STATUS, GS_UKERNEL_MASK | GS_BOOTROM_MASK,
>  					 last_status, 1000 * 1000, &status, false);
>  		if (ret < 0)
>  			count++;
> @@ -657,7 +660,7 @@ static void guc_wait_ucode(struct xe_guc *guc)
>  		switch (bootrom) {
>  		case XE_BOOTROM_STATUS_NO_KEY_FOUND:
>  			xe_gt_err(gt, "invalid key requested, header = 0x%08X\n",
> -				  xe_mmio_read32(gt, GUC_HEADER_INFO));
> +				  xe_mmio_read32(mmio, GUC_HEADER_INFO));
>  			break;
>  
>  		case XE_BOOTROM_STATUS_RSA_FAILED:
> @@ -672,7 +675,7 @@ static void guc_wait_ucode(struct xe_guc *guc)
>  		switch (ukernel) {
>  		case XE_GUC_LOAD_STATUS_EXCEPTION:
>  			xe_gt_err(gt, "firmware exception. EIP: %#x\n",
> -				  xe_mmio_read32(gt, SOFT_SCRATCH(13)));
> +				  xe_mmio_read32(mmio, SOFT_SCRATCH(13)));
>  			break;
>  
>  		case XE_GUC_LOAD_STATUS_INIT_MMIO_SAVE_RESTORE_INVALID:
> @@ -824,10 +827,10 @@ static void guc_handle_mmio_msg(struct xe_guc *guc)
>  
>  	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
>  
> -	msg = xe_mmio_read32(gt, SOFT_SCRATCH(15));
> +	msg = xe_mmio_read32(&gt->mmio, SOFT_SCRATCH(15));
>  	msg &= XE_GUC_RECV_MSG_EXCEPTION |
>  		XE_GUC_RECV_MSG_CRASH_DUMP_POSTED;
> -	xe_mmio_write32(gt, SOFT_SCRATCH(15), 0);
> +	xe_mmio_write32(&gt->mmio, SOFT_SCRATCH(15), 0);
>  
>  	if (msg & XE_GUC_RECV_MSG_CRASH_DUMP_POSTED)
>  		xe_gt_err(gt, "Received early GuC crash dump notification!\n");
> @@ -844,14 +847,14 @@ static void guc_enable_irq(struct xe_guc *guc)
>  		REG_FIELD_PREP(ENGINE1_MASK, GUC_INTR_GUC2HOST);
>  
>  	/* Primary GuC and media GuC share a single enable bit */
> -	xe_mmio_write32(gt, GUC_SG_INTR_ENABLE,
> +	xe_mmio_write32(&gt->mmio, GUC_SG_INTR_ENABLE,
>  			REG_FIELD_PREP(ENGINE1_MASK, GUC_INTR_GUC2HOST));
>  
>  	/*
>  	 * There are separate mask bits for primary and media GuCs, so use
>  	 * a RMW operation to avoid clobbering the other GuC's setting.
>  	 */
> -	xe_mmio_rmw32(gt, GUC_SG_INTR_MASK, events, 0);
> +	xe_mmio_rmw32(&gt->mmio, GUC_SG_INTR_MASK, events, 0);
>  }
>  
>  int xe_guc_enable_communication(struct xe_guc *guc)
> @@ -907,7 +910,7 @@ void xe_guc_notify(struct xe_guc *guc)
>  	 * additional payload data to the GuC but this capability is not
>  	 * used by the firmware yet. Use default value in the meantime.
>  	 */
> -	xe_mmio_write32(gt, guc->notify_reg, default_notify_data);
> +	xe_mmio_write32(&gt->mmio, guc->notify_reg, default_notify_data);
>  }
>  
>  int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr)
> @@ -925,6 +928,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>  {
>  	struct xe_device *xe = guc_to_xe(guc);
>  	struct xe_gt *gt = guc_to_gt(guc);
> +	struct xe_mmio *mmio = &gt->mmio;
>  	u32 header, reply;
>  	struct xe_reg reply_reg = xe_gt_is_media_type(gt) ?
>  		MED_VF_SW_FLAG(0) : VF_SW_FLAG(0);
> @@ -947,19 +951,19 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>  	/* Not in critical data-path, just do if else for GT type */
>  	if (xe_gt_is_media_type(gt)) {
>  		for (i = 0; i < len; ++i)
> -			xe_mmio_write32(gt, MED_VF_SW_FLAG(i),
> +			xe_mmio_write32(mmio, MED_VF_SW_FLAG(i),
>  					request[i]);
> -		xe_mmio_read32(gt, MED_VF_SW_FLAG(LAST_INDEX));
> +		xe_mmio_read32(mmio, MED_VF_SW_FLAG(LAST_INDEX));
>  	} else {
>  		for (i = 0; i < len; ++i)
> -			xe_mmio_write32(gt, VF_SW_FLAG(i),
> +			xe_mmio_write32(mmio, VF_SW_FLAG(i),
>  					request[i]);
> -		xe_mmio_read32(gt, VF_SW_FLAG(LAST_INDEX));
> +		xe_mmio_read32(mmio, VF_SW_FLAG(LAST_INDEX));
>  	}
>  
>  	xe_guc_notify(guc);
>  
> -	ret = xe_mmio_wait32(gt, reply_reg, GUC_HXG_MSG_0_ORIGIN,
> +	ret = xe_mmio_wait32(mmio, reply_reg, GUC_HXG_MSG_0_ORIGIN,
>  			     FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_GUC),
>  			     50000, &reply, false);
>  	if (ret) {
> @@ -969,7 +973,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>  		return ret;
>  	}
>  
> -	header = xe_mmio_read32(gt, reply_reg);
> +	header = xe_mmio_read32(mmio, reply_reg);
>  	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, header) ==
>  	    GUC_HXG_TYPE_NO_RESPONSE_BUSY) {
>  		/*
> @@ -985,7 +989,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>  		BUILD_BUG_ON(FIELD_MAX(GUC_HXG_MSG_0_TYPE) != GUC_HXG_TYPE_RESPONSE_SUCCESS);
>  		BUILD_BUG_ON((GUC_HXG_TYPE_RESPONSE_SUCCESS ^ GUC_HXG_TYPE_RESPONSE_FAILURE) != 1);
>  
> -		ret = xe_mmio_wait32(gt, reply_reg, resp_mask, resp_mask,
> +		ret = xe_mmio_wait32(mmio, reply_reg, resp_mask, resp_mask,
>  				     1000000, &header, false);
>  
>  		if (unlikely(FIELD_GET(GUC_HXG_MSG_0_ORIGIN, header) !=
> @@ -1032,7 +1036,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>  
>  		for (i = 1; i < VF_SW_FLAG_COUNT; i++) {
>  			reply_reg.addr += sizeof(u32);
> -			response_buf[i] = xe_mmio_read32(gt, reply_reg);
> +			response_buf[i] = xe_mmio_read32(mmio, reply_reg);
>  		}
>  	}
>  
> @@ -1155,7 +1159,7 @@ void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
>  	if (err)
>  		return;
>  
> -	status = xe_mmio_read32(gt, GUC_STATUS);
> +	status = xe_mmio_read32(&gt->mmio, GUC_STATUS);
>  
>  	drm_printf(p, "\nGuC status 0x%08x:\n", status);
>  	drm_printf(p, "\tBootrom status = 0x%x\n",
> @@ -1170,7 +1174,7 @@ void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
>  	drm_puts(p, "\nScratch registers:\n");
>  	for (i = 0; i < SOFT_SCRATCH_COUNT; i++) {
>  		drm_printf(p, "\t%2d: \t0x%x\n",
> -			   i, xe_mmio_read32(gt, SOFT_SCRATCH(i)));
> +			   i, xe_mmio_read32(&gt->mmio, SOFT_SCRATCH(i)));
>  	}
>  
>  	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index d1902a8581ca..66d4e5e95abd 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -684,7 +684,7 @@ static void guc_doorbell_init(struct xe_guc_ads *ads)
>  
>  	if (GRAPHICS_VER(xe) >= 12 && !IS_DGFX(xe)) {
>  		u32 distdbreg =
> -			xe_mmio_read32(gt, DIST_DBS_POPULATED);
> +			xe_mmio_read32(&gt->mmio, DIST_DBS_POPULATED);
>  
>  		ads_blob_write(ads,
>  			       system_info.generic_gt_sysinfo[GUC_GENERIC_GT_SYSINFO_DOORBELL_COUNT_PER_SQIDI],
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 034b29984d5e..2b654f820ae2 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -262,7 +262,7 @@ static void pc_set_manual_rp_ctrl(struct xe_guc_pc *pc, bool enable)
>  	u32 state = enable ? RPSWCTL_ENABLE : RPSWCTL_DISABLE;
>  
>  	/* Allow/Disallow punit to process software freq requests */
> -	xe_mmio_write32(gt, RP_CONTROL, state);
> +	xe_mmio_write32(&gt->mmio, RP_CONTROL, state);
>  }
>  
>  static void pc_set_cur_freq(struct xe_guc_pc *pc, u32 freq)
> @@ -274,7 +274,7 @@ static void pc_set_cur_freq(struct xe_guc_pc *pc, u32 freq)
>  
>  	/* Req freq is in units of 16.66 Mhz */
>  	rpnswreq = REG_FIELD_PREP(REQ_RATIO_MASK, encode_freq(freq));
> -	xe_mmio_write32(gt, RPNSWREQ, rpnswreq);
> +	xe_mmio_write32(&gt->mmio, RPNSWREQ, rpnswreq);
>  
>  	/* Sleep for a small time to allow pcode to respond */
>  	usleep_range(100, 300);
> @@ -334,9 +334,9 @@ static void mtl_update_rpe_value(struct xe_guc_pc *pc)
>  	u32 reg;
>  
>  	if (xe_gt_is_media_type(gt))
> -		reg = xe_mmio_read32(gt, MTL_MPE_FREQUENCY);
> +		reg = xe_mmio_read32(&gt->mmio, MTL_MPE_FREQUENCY);
>  	else
> -		reg = xe_mmio_read32(gt, MTL_GT_RPE_FREQUENCY);
> +		reg = xe_mmio_read32(&gt->mmio, MTL_GT_RPE_FREQUENCY);
>  
>  	pc->rpe_freq = decode_freq(REG_FIELD_GET(MTL_RPE_MASK, reg));
>  }
> @@ -353,9 +353,9 @@ static void tgl_update_rpe_value(struct xe_guc_pc *pc)
>  	 * PCODE at a different register
>  	 */
>  	if (xe->info.platform == XE_PVC)
> -		reg = xe_mmio_read32(gt, PVC_RP_STATE_CAP);
> +		reg = xe_mmio_read32(&gt->mmio, PVC_RP_STATE_CAP);
>  	else
> -		reg = xe_mmio_read32(gt, FREQ_INFO_REC);
> +		reg = xe_mmio_read32(&gt->mmio, FREQ_INFO_REC);
>  
>  	pc->rpe_freq = REG_FIELD_GET(RPE_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
>  }
> @@ -392,10 +392,10 @@ u32 xe_guc_pc_get_act_freq(struct xe_guc_pc *pc)
>  
>  	/* When in RC6, actual frequency reported will be 0. */
>  	if (GRAPHICS_VERx100(xe) >= 1270) {
> -		freq = xe_mmio_read32(gt, MTL_MIRROR_TARGET_WP1);
> +		freq = xe_mmio_read32(&gt->mmio, MTL_MIRROR_TARGET_WP1);
>  		freq = REG_FIELD_GET(MTL_CAGF_MASK, freq);
>  	} else {
> -		freq = xe_mmio_read32(gt, GT_PERF_STATUS);
> +		freq = xe_mmio_read32(&gt->mmio, GT_PERF_STATUS);
>  		freq = REG_FIELD_GET(CAGF_MASK, freq);
>  	}
>  
> @@ -425,7 +425,7 @@ int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq)
>  	if (ret)
>  		return ret;
>  
> -	*freq = xe_mmio_read32(gt, RPNSWREQ);
> +	*freq = xe_mmio_read32(&gt->mmio, RPNSWREQ);
>  
>  	*freq = REG_FIELD_GET(REQ_RATIO_MASK, *freq);
>  	*freq = decode_freq(*freq);
> @@ -612,10 +612,10 @@ enum xe_gt_idle_state xe_guc_pc_c_status(struct xe_guc_pc *pc)
>  	u32 reg, gt_c_state;
>  
>  	if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1270) {
> -		reg = xe_mmio_read32(gt, MTL_MIRROR_TARGET_WP1);
> +		reg = xe_mmio_read32(&gt->mmio, MTL_MIRROR_TARGET_WP1);
>  		gt_c_state = REG_FIELD_GET(MTL_CC_MASK, reg);
>  	} else {
> -		reg = xe_mmio_read32(gt, GT_CORE_STATUS);
> +		reg = xe_mmio_read32(&gt->mmio, GT_CORE_STATUS);
>  		gt_c_state = REG_FIELD_GET(RCN_MASK, reg);
>  	}
>  
> @@ -638,7 +638,7 @@ u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc)
>  	struct xe_gt *gt = pc_to_gt(pc);
>  	u32 reg;
>  
> -	reg = xe_mmio_read32(gt, GT_GFX_RC6);
> +	reg = xe_mmio_read32(&gt->mmio, GT_GFX_RC6);
>  
>  	return reg;
>  }
> @@ -652,7 +652,7 @@ u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc)
>  	struct xe_gt *gt = pc_to_gt(pc);
>  	u64 reg;
>  
> -	reg = xe_mmio_read32(gt, MTL_MEDIA_MC6);
> +	reg = xe_mmio_read32(&gt->mmio, MTL_MEDIA_MC6);
>  
>  	return reg;
>  }
> @@ -665,9 +665,9 @@ static void mtl_init_fused_rp_values(struct xe_guc_pc *pc)
>  	xe_device_assert_mem_access(pc_to_xe(pc));
>  
>  	if (xe_gt_is_media_type(gt))
> -		reg = xe_mmio_read32(gt, MTL_MEDIAP_STATE_CAP);
> +		reg = xe_mmio_read32(&gt->mmio, MTL_MEDIAP_STATE_CAP);
>  	else
> -		reg = xe_mmio_read32(gt, MTL_RP_STATE_CAP);
> +		reg = xe_mmio_read32(&gt->mmio, MTL_RP_STATE_CAP);
>  
>  	pc->rp0_freq = decode_freq(REG_FIELD_GET(MTL_RP0_CAP_MASK, reg));
>  
> @@ -683,9 +683,9 @@ static void tgl_init_fused_rp_values(struct xe_guc_pc *pc)
>  	xe_device_assert_mem_access(pc_to_xe(pc));
>  
>  	if (xe->info.platform == XE_PVC)
> -		reg = xe_mmio_read32(gt, PVC_RP_STATE_CAP);
> +		reg = xe_mmio_read32(&gt->mmio, PVC_RP_STATE_CAP);
>  	else
> -		reg = xe_mmio_read32(gt, RP_STATE_CAP);
> +		reg = xe_mmio_read32(&gt->mmio, RP_STATE_CAP);
>  	pc->rp0_freq = REG_FIELD_GET(RP0_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
>  	pc->rpn_freq = REG_FIELD_GET(RPN_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
>  }
> -- 
> 2.45.2
> 
