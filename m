Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D46FE77180
	for <intel-xe@archiver.kernel.org>; Tue, 10 Dec 2024 21:56:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC95E10E187;
	Tue, 10 Dec 2024 21:56:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GHcdbwX6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7DC010E187
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Dec 2024 21:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733867762; x=1765403762;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MKSFYQu60+fNloLUXuI32uTkYCypVqGW1b+bTdoVvY8=;
 b=GHcdbwX6UIKVv7AJJoVs3oKjFSB3ZOVXUDip44PX+qZEJlhBlMgiCWpO
 e9ntMXEV/mkmItwulMiYXIMo2sz9Ddb2Jnmf4MkLZKNOTZ1Qyw3XHBHgT
 D2yVub88K5KQruV5MmI8TVpBVF6cGz3/LYpP8NO/h4uBEEIYjqGhR32qy
 Cz0CfG8pNdgBJnbzn+cfgmB7ayQVuPKZ5aJYi8WsmVV7Fxyv6tVoiEVMm
 Qt9N6e1qfjvqer7/Or3CbjKHNsTY2iNVG9vS2JAZb+NU91pdYd6oZg7Kw
 dnxt9ri0YV8g1xKutl/5OvM9exvSPtDt2xKsorS6LfGVP4GQU8+qGjVUT g==;
X-CSE-ConnectionGUID: 0qxrKj6jS3GpqJBxS4pH6Q==
X-CSE-MsgGUID: VsNZ7ba4SeiJNwocRKQ9+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="59624994"
X-IronPort-AV: E=Sophos;i="6.12,223,1728975600"; d="scan'208";a="59624994"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 13:56:01 -0800
X-CSE-ConnectionGUID: EcbMTLVdTtGWkRQubWgdVA==
X-CSE-MsgGUID: TzlGO21uRAa2rsanSNVg/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,223,1728975600"; d="scan'208";a="95360984"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Dec 2024 13:56:01 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Dec 2024 13:56:01 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Dec 2024 13:56:01 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Dec 2024 13:56:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l44h4oplDtbFUBqvRYATompSg7vDcM0oCj7XjMpnJUIkT/aAZjBYBH2vSIFdrtKYQuaNYnNyJLye8pmXF7oThR1ruE3Zr084c/73aGPawixGo4EvUSG2CWveyiNdQx15TVVTQodtn//bJr594r9yxYV0SuDXiMvbhj+uRKU9f1NUZqapl1nSXMpsiPsgYyyZoUvfibnCVsyfgL6nD04tiqZndrGn4cYsqJy/E/DeHnmQI8V8gEyua0zvCK2hrpZxcLfystG0d9tgRBhQfROp3pbXKVFRMxk/u/Lm60f1P36bQG3KrfBK4637VOittGHKzCmBKJI7g96ONWFqd2tGGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BsywJwEVfpufFA3TsAG3HVsHHCIbvc6wqJrfNQ5frNo=;
 b=vG6Yx9tFclebhj1SlTZPnNY23MhX8Eb9SOTNrfh2npCBbOB2EWwZpdWLL8BEbYnO+2s4qcCBT1iWXK95aNAkH2PUy068ocsh0T5hBb7C7xt+cxwISOLMioqGuf8mMk0vTufXXUh8drjAtoiEGQ919zlRL1FZ3tJparhWlWCZcnkOt0IB3pplkMAgPOgPkjK8dgWyEKHvW7LBkwwkk95iwF+Ve+ggs/L/WqWMioIfDwr+yCGgES0jgU30d0Jl2mxS9nmr2O/Ve4rPEG/qTdjE9ITVbVzPGxvtqPaPJza1KPOX5xHP6xv1kmKxxwn5Enh6T1tAL/sQAjXuLNY0HMDadA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CO1PR11MB4898.namprd11.prod.outlook.com (2603:10b6:303:92::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.20; Tue, 10 Dec
 2024 21:55:52 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%5]) with mapi id 15.20.8230.010; Tue, 10 Dec 2024
 21:55:52 +0000
Date: Tue, 10 Dec 2024 13:55:49 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Gustavo Sousa <gustavo.sousa@intel.com>
Subject: Re: [PATCH] drm/xe/ptl: Apply Wa_14023061436
Message-ID: <20241210215549.GT3224633@mdroper-desk1.amr.corp.intel.com>
References: <20241210150621.781462-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241210150621.781462-1-nirmoy.das@intel.com>
X-ClientProxiedBy: SJ0PR03CA0340.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::15) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CO1PR11MB4898:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e1b3b1c-b0ec-40db-a1b8-08dd19656a61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AisQLGBiPhD8Ma64zTEdN+ez8d4uywMlcYh/xULAuQLikHPGUezB1ipKdxz9?=
 =?us-ascii?Q?09BI21XnIfps2aKKe3f1sa7ylLbiQI3Sl5rzjPfHO3igEuFwaeYVX8E7Gg4i?=
 =?us-ascii?Q?G1Qg5XyewK3ltHl9a5PsvHlSwL78G4/faNewCRA57i97MjGzxpmndlXVDVXe?=
 =?us-ascii?Q?6RkE9YbYiOCDCsn5SLLhXMrhtgXxDQdg4FGXOt9HqkePmvZyz5Jn1YWv2B/g?=
 =?us-ascii?Q?YiR3/rYBBrw3sMnSfhumWF721xSVttIlLn6RUYjOIdi/pO8NWhKz607RKHkc?=
 =?us-ascii?Q?R8ExX7VjIQyjdOOrEBtQG59NS4wHfb69R5W79LPtPWtnZ3wt8wCKO2vO39rp?=
 =?us-ascii?Q?oGQ1lA7jwA7xYmo60syzWFg56w5yxypEmTzgt6SthWAD8cqUNiWGv9ClyATu?=
 =?us-ascii?Q?6mm/AVUPoaOV1Vb5J4YYl0BMu2gRp7Tz3MdHeOx7NfbJzY3fiiiqEvn9dvHW?=
 =?us-ascii?Q?3EuryLoHDPmTrvUmDVjbBt4PGQBP793P3xVF64EIuFynIYXPsgwaseGPdweK?=
 =?us-ascii?Q?hMMQCcK/8kgip+YAUm1WC4SaV/co184pCV7rLYCrAC2iyGUaOJ6/Nwfe2Qfr?=
 =?us-ascii?Q?4VrOCcodMpmMQJU+ZTiRiVGkayV7djU1at9dgXjp+ylE7tc9SXjyBil3w3gH?=
 =?us-ascii?Q?8HGpJA8YcoIO//4SGy1cwzRu7e4aH3jYRHVXpxs0FKSNeSHQsYFb1AZdq21v?=
 =?us-ascii?Q?WNs9HeYyNco/inTu+4FqkuMU6B85CCgNekZGaewF28rrOJdK+zMiM5ruY78p?=
 =?us-ascii?Q?JFRkiCFgybg87e70Sltt9X5z6w7EMj51EQzU0gVVfC5GGOIc79rHWbhm1ZLv?=
 =?us-ascii?Q?tSqPnC9vzcldR5a55pTnfCD9FYmG/0QelZq4UJinkGBRQteGOhfCgjH2BEl5?=
 =?us-ascii?Q?lMrL76u9oV2y4GAlANBMRl4Q0s/xDGBu14mCYTVD0CXJb2TDnWmFzFuGi5hQ?=
 =?us-ascii?Q?3rz4eV1WV8FvDwn4OhET6Im/qHO67IXLW06nL4pHoUjZzZ4fVn7M6yNp8FVp?=
 =?us-ascii?Q?UJcKo45K+sdtRhmSgemxDyN3+LkSfJFG17HT7n8GFoBLgicHZI8dEgcmv36T?=
 =?us-ascii?Q?LXpIp1PgRiOZUJ170j0gRSixBSlRw6UDaTHR2aRoBJ7c6Vqw68T13c3EtdZr?=
 =?us-ascii?Q?wfMcm895PUYU77IBolzgQF9cPGsWwsjRXpE/ypeuVPYJcXt2cB8O51meVICs?=
 =?us-ascii?Q?ovyhgAHUsM9VS1a0sBzwRmsud57sBl8ljRwXpvKKa0s5+5U0lKnoKYES7qP2?=
 =?us-ascii?Q?7SXYHqSkeh7iHMS62aRGxMbmwfUimpJKDdBxlZ+mVqsHXmC59aGeSjsEYojo?=
 =?us-ascii?Q?CCbTgiwWFXGkYRefr/rzvxHtGIW+SVLGRL0j1Xifcs+iTw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0TfOzX50oXFqVbdVkQxZ/kOESS+z0KFDtKAM/ipcMNlkujPlloQsNLGWFgwl?=
 =?us-ascii?Q?JIfxUy9TU41JYgaN3fnfsrR+Fjh1MS37c2HbLq4soUDm9Z/ihyiIrHN1At+Z?=
 =?us-ascii?Q?7/h18/JfEPI4TsF6u+pyZvK5s0KoxsxCFc/kkiKoB4foXlW3LrQWsTxOB5Kn?=
 =?us-ascii?Q?8yGO9FwD4UK7IB+cyJfgzKI8vO2IP6b3YXRMAyDouvnp4Oyog2giTOX3OEiK?=
 =?us-ascii?Q?hZSGoAcW0YfqvABYZVbRZwLb8sxU5WZLlYSrptkFiF5qSZKmydS5qvLqrK8N?=
 =?us-ascii?Q?zft3LSVcdqAEW6b7wAAyoRY5+YZ16umsaqQojFgJABWykHIFbNmiV/1jHzrZ?=
 =?us-ascii?Q?Ltp8z5Z1M0O+m7dq5yPxA40mNuM1+b46ta95NzV+g4SYPK/3GOz6PpuqURSN?=
 =?us-ascii?Q?ivX67kpFu5dOjacfoxHQUHEUF4VPSeCtH8R+jyoZws9zmIgjWR+D+pJtcRgN?=
 =?us-ascii?Q?bI7a+Fb38llm+9lJO3gT0+mqCVukI2j653YKfTSk2pg4EIgGfnenkVJGiHyL?=
 =?us-ascii?Q?GLznhXdJXvTYCKjv69/Ar8VkUmuYde5VVln2aSuPSBjzS9scCBc0y5+p+eVs?=
 =?us-ascii?Q?ulAfGgdjXdUP2EzggbuBx6WB7ASyeBJK/utOOiCKdFcQ1YZ1CWVl27QV6cPh?=
 =?us-ascii?Q?//GG1LKfeWqd7UvkTGkw9Wq6UWq8nMqCjQYOBMNqGPmkAvEgNTRk9X1x0T9z?=
 =?us-ascii?Q?v4MyhD/cLLNjFJ36c8//PcHif/V1wPPtNGxYjDjhTKMjvDsrFlj//Qpe/Sm9?=
 =?us-ascii?Q?i5LUbTig/2/2exTF4iM94nYGMogy+lX4lEPrd0vtjlmrQYzFf36lf5/8ZhOp?=
 =?us-ascii?Q?YJEZK2EBajEo+3o2TcqwztgUv2C2D+A9tFdsNpb0yt+4B1MfuK1wcDybEVLJ?=
 =?us-ascii?Q?amYa/m1ODZd9LcomHq/Ul+IJqL5ofKeHMgOdZ6TLkXMc4F8pMJhrK/y+FYCt?=
 =?us-ascii?Q?LDMgAOzW0dugNfpgQm5UEgqLEEoArgKZ2zJJJuJSy3XswKjx8xGGoBOs9pIw?=
 =?us-ascii?Q?3cwgv64e2hOLI9Y8TwftNVU+xEOH2ezqHvGvqoB8AIeA1+THKzSxU190wLmy?=
 =?us-ascii?Q?D/pDCGAmBN8Qs2OBBQE03AFCH8QgRJOtWMuMQuy9k8BCFybCGiptUT73PW73?=
 =?us-ascii?Q?LoFLDp1daC6Az5jIJfgXqbrpuOe7qVYNM9fJYIhol7TAr2jw56o6gu8Hp/LV?=
 =?us-ascii?Q?LA2c4HUvFejWtfTsoOk22pdpLMCsMfJ9yw/oAWg0vtvmpLdysLgut0CFtncD?=
 =?us-ascii?Q?O+qYPA+PYGD+oeyCDXlOxTUAayxPOrDN2BEa+T0nmcuR0vHQBuLO6R9W2rXw?=
 =?us-ascii?Q?yyYqbHOPLzRrnVoa4h8JHyA5Wk8zQgV3g/zBqOjvvDIxPLWt4p24PYuBV5TQ?=
 =?us-ascii?Q?QHrtBh3dDUhKtdKYj814JVRTchGbWOdvew3R0l8dqb8r4cV7ojNqvsNlbwVE?=
 =?us-ascii?Q?ieaV210/MHaWT5GLO4aHUO/dJvU3syhYXmAtq1bUG40R9kKHUbIB2gXY+6/o?=
 =?us-ascii?Q?mDX9NiceyMlrwe8ROwvOTj/GlXYtnS+TolOpILgu3aQMyaxfFhSoLFQqTPHf?=
 =?us-ascii?Q?Xwdn9rLdXmCX3HxOAY3vAOkKHF6kjOqi78kXhhXs4M5dt9QVesKdGp1+Qw5u?=
 =?us-ascii?Q?7w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e1b3b1c-b0ec-40db-a1b8-08dd19656a61
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 21:55:52.6061 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DZXtpILJRYvwCi3cQ0WMVyiV+jGNfK2UAUrEW1/SJvcS+kjehhRPfV1smH8qyQoJKnzvfgY97upEtP7iT5IPUum+Ut7vMKdRltMAHHGTtPQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4898
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

On Tue, Dec 10, 2024 at 04:06:21PM +0100, Nirmoy Das wrote:
> Enable WMTP for the BTD kernel to address Wa14023061436 by setting the
> proper TDL Chicken Bit.
> 
> Cc: Gustavo Sousa <gustavo.sousa@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 3 +++
>  drivers/gpu/drm/xe/xe_wa.c           | 4 ++++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 162f18e975da..6829fbed1803 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -496,6 +496,9 @@
>  #define EU_SYSTOLIC_LIC_THROTTLE_CTL_WITH_LOCK	XE_REG_MCR(0xe534)
>  #define   EU_SYSTOLIC_LIC_THROTTLE_CTL_LOCK_BIT	REG_BIT(31)
>  
> +#define TDL_CHICKEN				XE_REG_MCR(0xe5f4, XE_REG_OPTION_MASKED)
> +#define   QID_WAIT_FOR_THREAD_NOT_RUN_DISABLE	REG_BIT(12)

e5f4 > e5f0 so I think this needs to be after the XEHP_HDC_CHICKEN0
definition.


> +
>  #define XEHP_HDC_CHICKEN0					XE_REG_MCR(0xe5f0, XE_REG_OPTION_MASKED)
>  #define   LSC_L1_FLUSH_CTL_3D_DATAPORT_FLUSH_EVENTS_MASK	REG_GENMASK(13, 11)
>  #define   DIS_ATOMIC_CHAINING_TYPED_WRITES	REG_BIT(3)
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 570fe0376402..2889d6f65f51 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -637,6 +637,10 @@ static const struct xe_rtp_entry_sr lrc_was[] = {

I don't see this register in the RCS engine's LRC (bspec 65182), so I'm
not sure this is the correct list.  We probably need this on
engine_was[] so that this will be saved/restored properly around engine
resets.

>  	  XE_RTP_RULES(GRAPHICS_VERSION(1200)),
>  	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN4, DISABLE_TDC_LOAD_BALANCING_CALC))
>  	},
> +	{ XE_RTP_NAME("14023061436"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3001), ENGINE_CLASS(RENDER)),

Given the above (that this isn't tied to one specific engine's LRC) and
given that the register doesn't fall within the dedicated RCS range
(0x2xxx), we should probably also change the ENGINE_CLASS(RENDER) to
FUNC(xe_rtp_match_first_render_or_compute) here.  For PTL (the only
platform that uses these IPs at the moment) it doesn't really matter,
but if we wind up extending this to some other platform in the future
that lacks an RCS, then using the 'first render or compute' match will
ensure that the workaround still gets applied properly in the absence of
an RCS engine.


Matt

> +	  XE_RTP_ACTIONS(SET(TDL_CHICKEN, QID_WAIT_FOR_THREAD_NOT_RUN_DISABLE))
> +	},
>  
>  	/* DG1 */
>  
> -- 
> 2.46.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
