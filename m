Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D205CA5FDD
	for <intel-xe@archiver.kernel.org>; Fri,  2 Oct 2026 18:16:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAFC210E636;
	Fri,  2 Oct 2026 18:16:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZqVCBiLr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DB7710E636
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Oct 2026 18:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790964962; x=1822500962;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=8hfEPkPD088irnHsKa2J75qqIb9CUzztX/QkZnPoQh0=;
 b=ZqVCBiLrG0HLl4ZzZP+fAIkWa8ra+So+HOzJJDA8KMnpd05m6YnjzhRM
 eabVbO/488a/IaYL8cLPcdjiyH8z0X0dd+aXqhfyaWWJIp0k6fQjTyQZ6
 UljeqrH6LEXPQVw0FGWZ+7HFCfWv5+TqQ40xM1WIYmRqmgOaUAcvHv0xK
 DJH3AIQWokauSjnMOAn5eTneVKnj3vWE15HFx4h6Xi+bT9kHswLTZ4yec
 tv5hOnoNbZtGSGG8zfdEm82ffZhecbJGfBldJ51A63SWfE0fB9OSLEoAY
 SfDzdhxYA2n6/9Ol9lEg8GW6a200JodDHOA/XuxCrY3LFem5av4YDWB47 g==;
X-CSE-ConnectionGUID: ZwGYIIi1Qw+/aH9uM/zi+g==
X-CSE-MsgGUID: hriB70tAR3+b0MxwXbo2NA==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="103107899"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; d="scan'208";a="103107899"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2026 11:16:02 -0700
X-CSE-ConnectionGUID: Q1Mmj4rFRiCyocrZjH8y1Q==
X-CSE-MsgGUID: Fr07HcRXS56RC5L4C9Etng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; d="scan'208";a="275852260"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2026 11:16:02 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 2 Oct 2026 11:16:01 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 2 Oct 2026 11:16:01 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.33) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 2 Oct 2026 11:16:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tBHNXbT+FXs0kojUjDnD01/t8mC8XA30HJ23Ux0wzlgN2YY4OEgfnbXmVZhC+fBYNt7LrCVHxhinTpOyY8iV/kfJkNrxqovQR+rzOyZVF0Jrztoy2avSvJ6qPj8MP5Rk0pksliZapg3AV7fHKSNL5QLkJWCY5LXY57EEt41ZQQU9/uTCDFsYiBkBzmbSlbQF1PpvLYSX8a3u67pz8lw783ALOiHu3n95wsp00vQ2H1Gq3R8oQpmdprWGSo1OU8ZsPTaj2Fxawr6wa+tCb7FRaD2o1NWljPDzbSnQWnfMQeMze2JrPJs3L9SgnY3XPyzF+/pbtdbjqNSd3lMUvHIYlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RJhE5AfFhCNLFKuHkZ1KVtedspygXDWcH17QrgJJIns=;
 b=VXLVZUyE8rSRIgAgNVG1QL0vqzUz9Fa+j85d8T8s8xhNtq0EipII6Z76g9Nb2bXBQLKLJcs5q247kUDPOuiMh51Ej191gKMLSGRUsn0RRXtKlLIpr0CiMKwFbWjWWkC4CaCFzJF+mtPBGw1XrGxzAm25pVyS4g9xD34+ruMf7R+R9W1Kc8PAHaXwdPMBSYbIW9DcMMGB3gSSPqxHzW5vx/rY/8DBFsnugPkWUjVYZzsSZdM1+RPbNrCklUIrD63G/c5SGytiAL/n50VwObi3fvOw1W2MwyMqssv18QZd0othnNVTiOELcChodwZ013Hl4P0lspJBY/2IzTPrWcPoVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA2PR11MB5100.namprd11.prod.outlook.com (2603:10b6:806:119::11)
 by SJ2PR11MB7475.namprd11.prod.outlook.com (2603:10b6:a03:4c9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 18:15:58 +0000
Received: from SA2PR11MB5100.namprd11.prod.outlook.com
 ([fe80::2e36:25c7:b8d7:1a67]) by SA2PR11MB5100.namprd11.prod.outlook.com
 ([fe80::2e36:25c7:b8d7:1a67%6]) with mapi id 15.21.0472.015; Fri, 2 Oct 2026
 18:15:58 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v2] drm/xe/xe3p: Read resource copy presence from fuse
 register
In-Reply-To: <20260930-res_copy_fuse-v2-1-60444264f666@intel.com>
References: <20260930-res_copy_fuse-v2-1-60444264f666@intel.com>
Date: Fri, 2 Oct 2026 15:15:53 -0300
Message-ID: <87bj9cynmu.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ2P221CA0013.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:a03:5db::8) To SA2PR11MB5100.namprd11.prod.outlook.com
 (2603:10b6:806:119::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR11MB5100:EE_|SJ2PR11MB7475:EE_
X-MS-Office365-Filtering-Correlation-Id: 776eda32-6afb-47bf-5a71-08df20b134fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: U6hdKTFzlhwlL0BI4jq/Zg17p/P1Z0TUA2/3PGwCYMAqM7ln6IsL014cnNB5sdJH4vDK9rlWHSQadtzItUwycKyB0ouvpQ0etXgL9FsU9Zg4mCAsZJmQA2aGBr7BqDk9LPLYYR0jZur994KApS+7Wb7ax6Mwdr5jPLjucmo4HwTSxGhfXNFjfxHswrQGkxri/qabfASonaBzLKkyb9pEcaXEITa1rya2ZYmYYr4YA2YiikgrEsT0CvN25Atpx05SpFSgeXiLReBWkXOOzAw2J24aFBfL9PBKhWNPlKZPSV8MrEmNTnBpzRfyugomksUyYjvPW36oh9LVGtFU9emCzctRuEIIqAYPBCnC7ef7wHx9aZDtrI7F80Ve8LrPM2892feHg9ZkkHNsJFXEZp9lp6ce5MhCW6TImwTxU62VR2hmkV+dzkwtQ+9DwfXh6wDR6eBIt/wOJZ27qAk/WN74I1SM2AC3mzPZDb3bJ8TmQLbPsEgJ6jPyhW1OC9aIIxMGJLzvAHfQY4IZbzYYeaZAiavFhddYPfFcDTeTJMT9x3rpYVzG574bamyCXDMtrSgYWPQbKgQ6yK2aWGq4dC39zeJ20CEccZjx22y7uhBVQ+UFIaVzqch27qO3fD3g/XyMVfvqHES9kuP18ilGfq47UZrF/XOTq0E8vOJS3FJKFQQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB5100.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Dts6c7Jo023QfQXmw9FXKIa2PKLFHICT25b2u76ngE31ip0VNjHEqJbPPKQ2?=
 =?us-ascii?Q?U3SOt5fv1ce6LR8sI6L3IOElHJizDCu5Krm4rWpSc65cNQTwfMeEKlZAbPm8?=
 =?us-ascii?Q?IjZp3e1/F/BrxT17DTNCo1dpK/6/351rYVfVbQrg208Ga2NZ8acOgCmg/PJj?=
 =?us-ascii?Q?OLFw5MarghfY7g2OOKTDt5Ew6p/Rg6oLc0B097AOn981ST+LLv9rZPkKuE2I?=
 =?us-ascii?Q?/rYnYMeVKHjpEpgbtEbBB22S52tCPFET5NX9jKCzSGhTzOYgNk3gYR0kKz/R?=
 =?us-ascii?Q?Cm+daNRBXD+waUyQTCw3DcRnfbZISEodHtNiw/tmeZIltH7jTu9rWNEIxH75?=
 =?us-ascii?Q?BMvYSPVlunv4BaKyROZUZyaBnex4fTkuM0/3e08TZSZS4PVm7qSZrESPwoX1?=
 =?us-ascii?Q?7TM6y2iQtd0L7xjZj48HEeradlRmZg71dFk/2op+J+P4305CYex+VkIn+mrd?=
 =?us-ascii?Q?mhTqaWNanczfKJh5ANx+vGV0pyhvsIYedlM46ZaSQ6UziD2QxjBZCcMs5JNv?=
 =?us-ascii?Q?X1HBRSIj2S/Rirj+fLzqqGs1OeDC3bY8LkcywhlgTXdYhl11aze5HlVpccvi?=
 =?us-ascii?Q?hMXhETWSm+lxo9vFP3XqkszbVFrDWBAzccmWwmCt74iz4U15qZ9T6fia4laO?=
 =?us-ascii?Q?Kg1JASE5YEiwTyBaIb8O9CtT/NerY+OqowTkTmAJegTYMJxyZjpSecARSLR9?=
 =?us-ascii?Q?E1H4wMBLOs10muHWN7bxNg8pK4NJcYa/dbl0HRw3CMArxx9qoHwyVKr0613Z?=
 =?us-ascii?Q?PT9UVEpvEbfbJCPQbq6nIuCB+le90XLVsI2vYVZBeAXx0A2nNFwxxF8eWLw4?=
 =?us-ascii?Q?DU8DY5AnZu34M2O89zvRzcYG3oWSLDj6hXNl8vE5DRCwX5EPtlsxT/sVk4gb?=
 =?us-ascii?Q?wxq3oxBQXPF9ANgvihtN0o2g9F5vt2yhSrgb+4vo3iyKssGIGcVFgtqwzbuF?=
 =?us-ascii?Q?Y16rew9chkPs0X37819mPYJ56S4b4+ukFg9iO/Owpg79fY5J8dv82Dtd/0/+?=
 =?us-ascii?Q?wSLzL1hGyKGMRRbaLJwb9I+6gllnX++2FFRPRxWXai9k9P4GzvrYyiWDStp8?=
 =?us-ascii?Q?ATH+YQAUP6fLaKwCi64pKevfWm1EhPGUhcxhWErdYcGobXtLEUXPKFbd6pRy?=
 =?us-ascii?Q?8FvKb6L/rfCKBp+kuLv0MBS//BRZMJOFgUmGH5nhoxC8yOLpj6kus7o60yoR?=
 =?us-ascii?Q?/g+qaNhCN0Jb58EqZhm7rJwryBW3g0qM8HCM62ZQo82xy8mEx4gurAkorW2v?=
 =?us-ascii?Q?vU4SDC+3q/DrunXDtmztBOfJqYUJsQoKW7uJhdDxJV3mJ+bWx9kWokRU2WNa?=
 =?us-ascii?Q?sAPGdctVful0/J5m4Zru0RmOMCPxgjKkroNdf91uZt51BrA7fMIMwVDndb7A?=
 =?us-ascii?Q?B/coEEDtd9fK3FrIhgwe33Q9ECLKuL8smrmpuUKHQ1pLkByEtAukf2nQzbyC?=
 =?us-ascii?Q?FX6CnClNe3ufQLWqTo5seM+6/Afgc1ol1X9AB0kFLHpBkud8NvZ4intGW8i/?=
 =?us-ascii?Q?igqYOPyHV0Yh1wNBt3Ox9aI6W0sAEjZsZvaWkJT8SgMzCDs1Zgk23fsBPYBy?=
 =?us-ascii?Q?pZ5U9eW1iB8G6B5pySMSC7Y6pqirGJeRWlrK3RQ7l0uwJrh0rwOvgxIy9IuW?=
 =?us-ascii?Q?fFPXqkjR4R1QmBsUWfQsCE/Cn1WpBu/5tZ0R1nPEXBJTWPha3EtMseVrPAJx?=
 =?us-ascii?Q?PLC/0NuE/SoCulrfR72eIFTAdZmvfX0HMtIf304Tfoa8n6TImrBLbgmOouCK?=
 =?us-ascii?Q?rhKXLZ4/HQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: h2NNOfi0Nx7eS5RAUQG6fo+aoK1vZzY7nKYp9SiazaGD6ZdFU/b9+RIr4x6p0pPQw0G/SuVTpRlpvHiEv/n0eAkOGnAUFFmcK7KftCqmycSSJtjUrdHPtMc/0J/pbnPbMT9p0+uAQURgl+uipAGX/p4Msfr1KGHX4g5WK5/rkQEzDKaMn82RtywtIurIIdSYTpYHCxIsixauft74toNHd9nMO2qu2i3NgOSW+E/Ny1B3W9kCKmHlzQ5XTgLfdpjrioYycykLHCv2VMRrSuyycfpRN5lkL67z+BWDSobkx5q3mMo0bzCiwHXLeaV9V8BTHMa8CKBRizrk9zEKFOvivw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 776eda32-6afb-47bf-5a71-08df20b134fb
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB5100.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 18:15:58.2066 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8hi06I2W9UVAMjcALpDeEmyguiCsSvvNdaVrqaME8Rivrgp/XbscPVkBdf5twW50pno7vEsZKFB/wWpAl5eERA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7475
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

Matt Roper <matthew.d.roper@intel.com> writes:

> As with service copy engines, Xe3p also introduced a fuse register to
> indicate whether the resource copy engine is present.  Somewhat
> confusingly, the register field is 16 bits wide, even though all current
> platforms only have at most a single resource copy engine (BCS0).
>
> Bspec: 74623
> Cc: Gustavo Sousa <gustavo.sousa@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

> ---
> Changes in v2:
> - Also add fuse register to ver_35_runtime_regs[] so that the PF will
>   share the register value with the VF in SR-IOV setups where the VF
>   can't access it directly.  (Sashiko)
> - Link to v1: https://lore.kernel.org/r/20260929-res_copy_fuse-v1-1-80876dba05db@intel.com
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h        |  3 +++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c |  1 +
>  drivers/gpu/drm/xe/xe_hw_engine.c           | 37 ++++++++++++++++++++++-------
>  3 files changed, 32 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 650f117c3e13..f5cd3a94e47f 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -301,6 +301,9 @@
>  #define SERVICE_COPY_ENABLE			XE_REG(0x9170)
>  #define   FUSE_SERVICE_COPY_ENABLE_MASK		REG_GENMASK(7, 0)
>  
> +#define RESOURCE_COPY_ENABLE			XE_REG(0x9174)
> +#define   FUSE_RESOURCE_COPY_ENABLE_MASK	REG_GENMASK(15, 0)
> +
>  #define GDRST					XE_REG(0x941c)
>  #define   GRDOM_GUC				REG_BIT(3)
>  #define   GRDOM_FULL				REG_BIT(0)
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
> index 6586df2fcb91..fba2d5e1e94c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
> @@ -114,6 +114,7 @@ static const struct xe_reg ver_35_runtime_regs[] = {
>  	XE3P_XPC_GT_GEOMETRY_DSS_3,	/* _MMIO(0x915c) */
>  	XE3P_XPC_GT_COMPUTE_DSS_3,	/* _MMIO(0x9160) */
>  	SERVICE_COPY_ENABLE,		/* _MMIO(0x9170) */
> +	RESOURCE_COPY_ENABLE,		/* _MMIO(0x9174) */
>  };
>  
>  static const struct xe_reg *pick_runtime_regs(struct xe_device *xe, unsigned int *count)
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 9680d2a5adec..265f95c0c899 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -875,23 +875,42 @@ static u32 read_svccopy_fuses(struct xe_gt *gt)
>  			     xe_mmio_read32(&gt->mmio, SERVICE_COPY_ENABLE));
>  }
>  
> +static u32 read_rescopy_fuses(struct xe_gt *gt)
> +{
> +	u32 fuse = REG_FIELD_GET(FUSE_RESOURCE_COPY_ENABLE_MASK,
> +				 xe_mmio_read32(&gt->mmio, RESOURCE_COPY_ENABLE));
> +
> +	/*
> +	 * Although the register field is 16-bits wide, we don't expect to ever
> +	 * see more than one resource copy engine (BCS0 in bit 0) enabled.
> +	 */
> +	xe_gt_WARN(gt, fuse & GENMASK(15, 1), "Unexpected resource copy fuse (%#x)\n", fuse);
> +
> +	return fuse & BIT(0);
> +}
> +
>  static void read_copy_fuses(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> -	u32 bcs_mask;
> +	u32 bcs_mask, svc_copy_mask, res_copy_mask;
>  
>  	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
>  
> -	if (GRAPHICS_VER(xe) >= 35)
> -		bcs_mask = read_svccopy_fuses(gt);
> -	else if (GRAPHICS_VERx100(xe) == 1260)
> -		bcs_mask = infer_svccopy_from_meml3(gt);
> -	else
> +	if (GRAPHICS_VER(xe) >= 35) {
> +		svc_copy_mask = read_svccopy_fuses(gt);
> +		res_copy_mask = read_rescopy_fuses(gt);
> +	} else if (GRAPHICS_VERx100(xe) == 1260) {
> +		svc_copy_mask = infer_svccopy_from_meml3(gt);
> +		/* Only BCS1-BCS8 may be fused off */
> +		res_copy_mask = 0x1;
> +	} else {
>  		return;
> +	}
>  
> -	/* Only BCS1-BCS8 may be fused off */
> -	bcs_mask <<= XE_HW_ENGINE_BCS1;
> -	for (int i = XE_HW_ENGINE_BCS1; i <= XE_HW_ENGINE_BCS8; ++i) {
> +	bcs_mask = svc_copy_mask << XE_HW_ENGINE_BCS1 |
> +		res_copy_mask << XE_HW_ENGINE_BCS0;
> +
> +	for (int i = XE_HW_ENGINE_BCS0; i <= XE_HW_ENGINE_BCS8; ++i) {
>  		if (!(gt->info.engine_mask & BIT(i)))
>  			continue;
>  
>
> ---
> base-commit: 332faa4cbc2e48ba71db4b3f45c981248f089b2d
> change-id: 20260928-res_copy_fuse-24781ce19c95
>
> Best regards,
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
