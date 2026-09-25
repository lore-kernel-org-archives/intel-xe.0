Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDB08C9830E
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 23:16:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DEBE10E193;
	Fri, 25 Sep 2026 23:16:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dWdS3yK1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2205410E193
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 23:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790378216; x=1821914216;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RjLVcYHlO1Qt4xS6hRBOU+sW6OTY5+87ynyxWR25jiA=;
 b=dWdS3yK1KPaIJz073Hsy8HlfE7M37WNPw/uK4IKl0T1UlgQtFT8AHtIw
 nOd9qgVVI02T8zH86PieakuaGGT96bJA7hvyug0B1RdM7L2OIuJX78Hfb
 eONBqMD/0+D9exeU7yawtqhdNufeoYjaHUt5Uugoq4TA17XjjMPczH4YX
 iklSXF9/s6UA/Kziyws+ZvW/TFmoZp0gCvPE8vTMgSK1KzS/G29NFxDR1
 zvOAvtPtALnHExvZXWN+HQVXsm/n47rhVKv6CVvpqvcoKgtP8sfE+mI1L
 /z7aaVLDFymKtvUV1R52y+uBWIYpV2V8qib+c8t5VoHBW7EAvJTy2fr4S Q==;
X-CSE-ConnectionGUID: VteTDI/ASWyXsqP0bnjY5Q==
X-CSE-MsgGUID: zayzXoFFRny2bqd3Wu+3jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="101743323"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; d="scan'208";a="101743323"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 16:16:55 -0700
X-CSE-ConnectionGUID: AQHh0V2bQqSYPpijVN9l5w==
X-CSE-MsgGUID: paHGvhVNQlC9/4kcp8ucjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; d="scan'208";a="303964127"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 16:16:56 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 16:16:54 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 25 Sep 2026 16:16:54 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.27) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 16:16:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kMXtdjPbzRBtSgtYelDdfjZBItC8xyXp4gcHDsYWLdUy6Kkx4pJdYsD5fIv8ahWSPIu3EWZEg0HtPSYZ7sIs9ncIFUrLch3AGVv9nqGChmSqzGp477hPEW9j6Eas0zlwskOR3JIQmftporyPx6olKx3S4Ylt0Vbt+Vj+lB33gg54JQRvSIBVmHO+wInopcb7mOH/kAq2TZWOCgFGyS8ODLpYEbLAIVYPLMkHdlSOk6WuVDzWSDZ6wOSxxvr/KpL5dUpiMMjoua+sVA2Av+hHjYJ+7YWJhMNcnBFTY/hKl5wjPWV0F7gfUrKwmnQqB3ovPGNglZCp/s4KMTJe8n8yaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OOpTyWKTlnWHs9V4SBymW/0IijbMAPI/kAkTTnutvKk=;
 b=g5zC58Q7kft/8TSNewc+gupaApF6Y9L8pNJXNygh4BZ+aJTYSPxIJU2rm5zfSeMOJfm8x3ve+BQ2/pTkVafyQeK+nAs47Smgrb552m55CGfthFishWK83sqx1mmIH3wFGQBMg+jECwypvJ4MJ2mvo/U8t+OIfHbPf9tT3RxWnJ4VhU/BwTHC6XGTdph3fZIb5mYZIZLf2rKIoxMpvoXlUkWE0goxPJkPG+Rz1rh4c9j9d5qAu0KDx/pLrpuh+ZP+rlFxKFoyvPxjTuZh+hRnEcouBKb8TEju54JqvUicjCXkOQwJrQDLAVZNWL2pKM2VI4FZ4RhP+T7r5q447peEtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA2PR11MB4970.namprd11.prod.outlook.com (2603:10b6:806:11f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 23:16:50 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%6]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 23:16:49 +0000
Date: Fri, 25 Sep 2026 16:16:47 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Stuart Summers <stuart.summers@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <gustavo.sousa@intel.com>, <daniele.ceraolospurio@intel.com>,
 <shuicheng.lin@intel.com>
Subject: Re: [PATCH 04/16] drm/xe: Require CONFIGFS_FS
Message-ID: <20260925231647.GK730887@mdroper-desk1.amr.corp.intel.com>
References: <20260924230120.389685-18-stuart.summers@intel.com>
 <20260924230120.389685-22-stuart.summers@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260924230120.389685-22-stuart.summers@intel.com>
X-ClientProxiedBy: SJ2P220CA0003.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5da::6) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA2PR11MB4970:EE_
X-MS-Office365-Filtering-Correlation-Id: cf682948-96f8-41fc-edee-08df1b5b1370
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|22082099003|10067099003|56012099006|6133799003|18002099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: 0fY9hGBWpWAgx+m4tfW7vT9MDB5EqO7ZgGuCJZe7lgW+ePMkDGIIyihVNWoEou8vXTnuL9W504AjswtV9CXJAl0PhSAlBOk5yZHcVE+uJMGX1n3dawK0veYDBG0cOQ1+OdNLNQ8VhXalNQdiFUIPgaQB5dV52H3IaWDSkNLM2C8zmUFTNoR3XTBy0UTudPtolBL12S78kj5IeZdQqnLS6vn2NY7LyCZgdYF8KxsmaNlcc7fS7CSYroX7I9jjCpTDQ6JtFXDfnyIc5P/t/yzRPwKUHHEWmYBPccIzLnXXCA4Hi5zmSFJUzo3AYoOdfiiecUkS7vTgQlhk36Cuwdg+EcycwF4TuJLTjPa0ONZtnER1aZyNSHAb+XslhD8VzCG4QO2EzeAiYbT1FRk7EysjJpEDCzhGKyaPq31INN/hARZsBkgiAHRo0DbwD/uVs3edVaXtK4nXfG4/32Sb/AhbuwWYNjTNJVDrSTdp7UYVxBeJPircSyLxZ6aGZ77CHkUF1Rx6lJyvMu+/9Ctjoo1/B6HT3KCyDRwCLgpaSFTk6FwZIJ7trGaKOkZv14CHGIGGVfRcSsaZGwf8T24goe00IVZZIWP2tnc0HF/6qiyBVOVELNJVkEq9R3NpGVtH/R63LGZI3l7TjVEtU1/7eym58tjy7CnqCuuf6H6B/6ADqvQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(10067099003)(56012099006)(6133799003)(18002099003)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XPQfBwL08Cmi7KlnIhHlsLwnwfZtOLOnBPgAdlpcP1tcaK2WAAg4BqaSU2ZP?=
 =?us-ascii?Q?4Ffo2WqBzRi2prFQiMl5gYn/Vv5w0PYhwZBgoDs0VmFXJE2W+AQsX4bB62T5?=
 =?us-ascii?Q?bJ9ZXD7eti24sH4mawszZxbQ2fU+FMTkbr0aTpGnSAwrc8k+mSnZ3cVDQZuy?=
 =?us-ascii?Q?2zDA3Y7As6cVl1V/TYddfvlM70WJpBLrKndAjmaa42MdwKfb/tL7065M7fRL?=
 =?us-ascii?Q?R4P93j/ZtX020/DuJdlwaleC7KrcAE/Xh6YYNnUnuWfFGAwBPmyak1Lh0dku?=
 =?us-ascii?Q?kbMjd/L/rr3/RsBIqE+/wiHC1yUkjOD1vZx0EVhLjhOdJErE/vFenzHp9EpG?=
 =?us-ascii?Q?5L7utcZ/8lRXzDm/FEcy+75atDpZEbwCoAGANn9PIQrKRW3L7DO6jF0xayrG?=
 =?us-ascii?Q?CpoTOxZqdUQtoHrn35C06j9XZwE2GXTIX4vfAPICbgG+2o+A4dXAQ3z/gboS?=
 =?us-ascii?Q?Iip+5lyvc9aTaQE1yCdIhurnmz6ao2AUtA0QRrukDjdZ9yhy+J2lahHZ9rQC?=
 =?us-ascii?Q?NEdcMevCpx4yfTwILguK2eYtcxWooC93MC5BtosH9NnnKeIbaIXUkPu+CA9T?=
 =?us-ascii?Q?hDdvQh7WlV5lsxoJdDcKcaMKOJJDv4F32iPWrz5c067ty9GrwojQrA6eXW0m?=
 =?us-ascii?Q?tpwm9cjwU1on6pbnANMhqjJ92yqP0kXrz1qUAocxGRKbb/wPiKxtXWyy3Wvm?=
 =?us-ascii?Q?4j+ntTYuaC/ai0QOnJMs1RhU1cdieLf/VCwmngr+YHMAnys4fjeF/NeDXDRg?=
 =?us-ascii?Q?zCXQCqWA0T9Cxu6jMccjae6h45m3PyTMzOIlJNhsHdO9swfkGHRURvcK02Im?=
 =?us-ascii?Q?OdAwK7TkXQtDjnOXgSXvyPROq238Cuy3+QdjBye9C5IIux/ki/4MLDvrjs0c?=
 =?us-ascii?Q?XukXhdxj4tef7dHYYXa/0sJavkRpNjYskisVDoLHCkV7yWbhItLx3ewwO2Bl?=
 =?us-ascii?Q?z3wrP0YMC+W+l2Gy5KalLHebYNuQB91atHDBPS1gbSj81a0J8Sqccw0ERK3v?=
 =?us-ascii?Q?9t038SsOZzn8cVgsKJsBzAtdXRnOSEPfVa2HNCj/+W0tmj+oeoEqyBnLFjkN?=
 =?us-ascii?Q?rNoM8IxkooMv8i0N28MvUT8DASpw/esefOB2ZbIIJY08oO6EfnuKFJx8AFkg?=
 =?us-ascii?Q?/fRb8PYgRUHg1Czkb2Lxbn7bPRAjrZGmZeexFjWFdaj9F69Ejrul1fonruEi?=
 =?us-ascii?Q?pxY9BjJnggSpWwho22/hE36M+5xtbaLRteWa/BsEPaaL+NLzLaIBOqmdo1K1?=
 =?us-ascii?Q?kl00Ow0gr6f52q/oEFlJN7lDquCGKk7jSwz1Y/JacUioENVRtM+XnVJglVn/?=
 =?us-ascii?Q?PmG7HP5knpG/Ce4HDfnyH/fyFnm8SOJMnxkUrAZzyzPIWE8p5bYx3RPZYX+m?=
 =?us-ascii?Q?fOxaZhH2qoDdgVFLQnDigkuuS1iz6+DxobG3rre3ZNNaxIBlI7T5l3tzAwOm?=
 =?us-ascii?Q?3AzX75BkYC16f+i0M0USkSp9ZEDbLrygrLPM4AJOo9dFPpIygi7vFlwEtyJt?=
 =?us-ascii?Q?mjniRAF+foIKyc3wwIp5V1wbcbnhwMBHIa+fqkq22+fm7Vq+qjksNTYr/vpJ?=
 =?us-ascii?Q?tIjC0MiAcrqhi6iJjMk10b3SOrGuQ+FCKTLaiEL2ybKtaiwK+JDiAZj/jaq3?=
 =?us-ascii?Q?ZO+4Zupeyp3Q2DK011Uyt3UfV61eJqvE2bwSTPgTI/K+FXobqK6PkvipcpWV?=
 =?us-ascii?Q?DliLK/wKLmawcLB1OkEmYO6slG9JJxrLFTav2wkQ35/cfursofxPbLLyf6BH?=
 =?us-ascii?Q?bvYBJtHSc392jY3O3hfMNxH4HxniXro=3D?=
X-Exchange-RoutingPolicyChecked: Dk7msWfzKN1ttiuOSrO4IKdOnoDBPXfGLVTl/SbjqQt+ppTafF7ezIf/8qU5QaWy+KMxAbhrrk4LqUmiTqpJLwshLbtSPx1LFpyGNZ6erwtXVqzNHFh5bT6bumhzSB4uZSNSQ8WewyNdtMvIfxlGzXRSUwURCOM0Bidr2Lj1yEcjxrnhdmkV9DEWLAmFaiW1K5YAIStS42NeVAAoosR5QnQ9ROghrMToy0UU5I8+Q7xdEFdrwBQHAMpv+Jz5zZ66MldonPsDbQyK5iriGfCKQ4xo7+FtbJrSIVgN52yQn382G+yRw6rVQlanRvP1h7ubMXEVZKo5fe54nFFXF3YeTg==
X-MS-Exchange-CrossTenant-Network-Message-Id: cf682948-96f8-41fc-edee-08df1b5b1370
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 23:16:49.4682 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TahLN1kkV5u01A8tfFMbHN3M2kax+kjVL9fr7JSTlyUj2FAhP41wJpFYw9yjBe15hkF3DuyTL8jiztU07jvMfsU+f0s+LcaAueWrRQAiqPo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4970
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

On Thu, Sep 24, 2026 at 11:01:23PM +0000, Stuart Summers wrote:
> configfs is not optional for xe in practice: a growing set of device

I'm not sure I agree with this claim; the Xe driver is certainly usable
today without configfs and most users will never have any need to use it
(and most are probably unaware of its existence).  Having configfs will
give you a small number of additional features for certain corner cases
(such as survivability mode), and those capabilities might be crucial to
specific users, but they're not mandatory for general use of the driver
or hardwawre.  In fact even features like survivability mode are only
relevant on a specific subset of the platforms supported by Xe.  I'm not
sure if there's any end-user use case for configfs today on igpu
platforms for example.

I believe most distribution kernels do include configfs support today,
so this support will usually be there if general users need it.  But if
someone makes a conscious decision that they want a very small kernel
and they feel they don't need any of the extra features offered by
configfs, then that's really their call to make.  There are a lot of
embedded system use cases where something like configfs just isn't going
to be useful because you can't get at it anyway through the interfaces
the device makes available, and including unnecessary facilities like
configfs can interfere with certification requirements, timing
requirements, etc.


Matt

> settings is only reachable through it, and the !CONFIGFS_FS stubs
> silently return defaults instead, so those builds quietly ignore every
> configfs knob. Select it and drop the stubs rather than keep growing a
> second, no-op copy of the getter API.
> 
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> Assisted-by: Copilot:claude-opus-5
> ---
>  drivers/gpu/drm/xe/Kconfig       |  1 +
>  drivers/gpu/drm/xe/Makefile      |  2 +-
>  drivers/gpu/drm/xe/xe_configfs.h | 32 --------------------------------
>  3 files changed, 2 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index 4d7dcaff2b91..a24b5e574699 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -6,6 +6,7 @@ config DRM_XE
>  	depends on INTEL_VSEC || !INTEL_VSEC
>  	depends on X86_PLATFORM_DEVICES || !(X86 && ACPI)
>  	depends on PAGE_SIZE_4KB || COMPILE_TEST || BROKEN
> +	select CONFIGFS_FS
>  	select INTERVAL_TREE
>  	# we need shmfs for the swappable backing store, and in particular
>  	# the shmem_readpage() which depends upon tmpfs
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index ba4404896f2f..aa5d6184713b 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -164,7 +164,7 @@ xe-$(CONFIG_DRM_GPUSVM) += xe_userptr.o
>  xe-$(CONFIG_HWMON) += xe_hwmon.o
>  
>  xe-$(CONFIG_PERF_EVENTS) += xe_pmu.o
> -xe-$(CONFIG_CONFIGFS_FS) += xe_configfs.o
> +xe-y += xe_configfs.o
>  
>  # graphics virtualization (SR-IOV) support
>  xe-y += \
> diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
> index f89dc0ffb884..ff902d7488ca 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.h
> +++ b/drivers/gpu/drm/xe/xe_configfs.h
> @@ -5,16 +5,12 @@
>  #ifndef _XE_CONFIGFS_H_
>  #define _XE_CONFIGFS_H_
>  
> -#include <linux/limits.h>
>  #include <linux/types.h>
>  
> -#include "xe_defaults.h"
>  #include "xe_hw_engine_types.h"
> -#include "xe_module.h"
>  
>  struct pci_dev;
>  
> -#if IS_ENABLED(CONFIG_CONFIGFS_FS)
>  int xe_configfs_init(void);
>  void xe_configfs_exit(void);
>  void xe_configfs_check_device(struct pci_dev *pdev);
> @@ -35,33 +31,5 @@ ssize_t xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
>  unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev);
>  bool xe_configfs_admin_only_pf(struct pci_dev *pdev);
>  #endif
> -#else
> -static inline int xe_configfs_init(void) { return 0; }
> -static inline void xe_configfs_exit(void) { }
> -static inline void xe_configfs_check_device(struct pci_dev *pdev) { }
> -static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return false; }
> -static inline bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev) { return true; }
> -static inline bool xe_configfs_media_gt_allowed(struct pci_dev *pdev) { return true; }
> -static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
> -static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
> -static inline bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev) { return true; }
> -static inline bool xe_configfs_get_disable_vram_page_offline(struct pci_dev *pdev) { return false; }
> -static inline ssize_t xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
> -							 enum xe_engine_class class,
> -							 u32 *cs, size_t max_len) { return 0; }
> -static inline ssize_t xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
> -							  enum xe_engine_class class,
> -							  u32 *cs, size_t max_len) { return 0; }
> -#ifdef CONFIG_PCI_IOV
> -static inline unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev)
> -{
> -	return xe_modparam.max_vfs;
> -}
> -static inline bool xe_configfs_admin_only_pf(struct pci_dev *pdev)
> -{
> -	return XE_DEFAULT_ADMIN_ONLY_PF;
> -}
> -#endif
> -#endif
>  
>  #endif
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
