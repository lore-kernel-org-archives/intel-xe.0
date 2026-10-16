Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E14ACCC6B38
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 19:18:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E2BF10E382;
	Fri, 16 Oct 2026 19:18:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4EF910E382
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 19:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792178328; x=1823714328;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NluyFgxJ3TnIQDtswi3xafUrk08yUOsepbdhy1eQ7jE=;
 b=h6HWdVGaI2DGxk7nxup+AFFKCALKuzNcSYfIAtc+oSwEyG07WlZMOWGm
 2LHryGVlr0TG+HRKTZZduPZ7u5RjtCuccPAOBtybEfV8bAnC0zxuZYnMP
 EuPCQARaoV2PiSHuzGf/A48CRSrzNP2YOkadZFerq0tOa5EzcDm0KtA2u
 9YRKAFZW99jqVk8Cvkk5Bez76gDHyO6YAYTB3E+nqN+wjuyb4c0Hpfyno
 /rZNmEtlZdyaRQWPrcEHDeXMMf1TTEGcmNPLE3eUsd/p1PxRSVg31JL7t
 Gvew4qYh6/OqW7idx5MWhuBdQak4MTIEZu0iwpteY3VyckW1jqVP7ZLiq g==;
X-CSE-ConnectionGUID: 9CxeAqexRiWAYQ5BFNHbaA==
X-CSE-MsgGUID: Nwc2PyI3Q6SnMnnvNdhJUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11937"; a="1000228"
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="1000228"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 12:18:47 -0700
X-CSE-ConnectionGUID: +ohfTMgoSwiCOxdgRH1ihw==
X-CSE-MsgGUID: 59cvV+HXSqi+DP4Cn023/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="2024573"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 12:18:46 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 12:18:45 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 16 Oct 2026 12:18:45 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.55)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 12:18:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SYHkJNDRqWygBmtEa4h/XAPVESMzMeT4d/AFFFRnj4KL7Uh6rYa3MnLN31vCbuCfrERw6OYXlWbxvVZctFWnLjBvTPfp9xgbgKZ36VNHO961vpETp/5Hd9hWHjo6l+8b2Z0dXKOQocQyV8/5If19JDAltkPqV5kUtRXhDLlN3rF37qvgMgQZv8pXrGHiKvg/8k7Vfz6OTtuXDZkt+HDlgBARK2o935hISHnYKL15ypxiWNBJjnxpbC19zRpKzzE64EhiHBw+l95yaKbD+TKMRhaizX/MMwGM+H43OjehhYe2UUobeUHqD0iSxL6kV4hok0nXsKXu4DZP5WxdY0jIRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VijIUMqtBA+iUvDVl24LUANJpEGieO5SRfdFBTZ7yR8=;
 b=c1K3SyMXieNyFBkmAyG1OvHVTmRmJ/CpKdxr4dOFnAejZ+2I2HsZClDhrZ/rDH2jJLGwq2oasFsdJQNLSGfulDBRFn9CKPh7aC8QpG5q3vhEn2ZLQQSfPIpGVsUP4aTcIK8ZERWut8SnfFU1oXia3Q8IKcvcniI2KhMkz8kfRzY1TdpjLk2z9osBZJrehYcO3gjDjBZKtVOotaPWVrZiTeX/iu9zZ1EszgVBdYbCB6vR+7/2bqpivqJ1kGHJ3sUnVkBXQK/PQMxwZk7WcmYZgjwXic9/h+fVlTfXiqLqEquxY48ipiKP6jXnXH0D8662y/P5UQMCLkKtVF/F21mEPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ2PR11MB7456.namprd11.prod.outlook.com (2603:10b6:a03:4cd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.24; Fri, 16 Oct
 2026 19:18:41 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%6]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 19:18:41 +0000
Date: Fri, 16 Oct 2026 12:18:38 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Riana Tauro <riana.tauro@intel.com>,
 Stuart Summers <stuart.summers@intel.com>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] drm/xe: Fix build with DRM_XE=y and CONFIGFS_FS=m
Message-ID: <20261016191838.GH578251@mdroper-desk1>
References: <20261016172937.2980310-2-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261016172937.2980310-2-rodrigo.vivi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0057.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::32) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ2PR11MB7456:EE_
X-MS-Office365-Filtering-Correlation-Id: f4d29042-fbed-4c71-f95a-08df2bba496b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|261009220027099003|6133799003|22082099003|18002099003|10067099003|261009223327099003|261009223027099003|261009221227099003|261009221727099003|11063799006|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info: KfdZHuQHKnkLIE7bXi95mp3XMFoS9WfcyLx7SBr4Yi36B6TgIaJ1Q/kB9Q/xeMpSaXVXHhRTO6eIyqA5yGwVa0UdnM5CVh2Dq59TcCQOymbif18GBxIzS+hjcJgHnMoNq+050LYpPFAckuIWK1ud/Jw1nz31Jp2LcsfXHp9efgWyji4qkk8ah6U9aM+28NfU/hmOC3s0yhFCJi3fyRnfhZs56eEwHUWg3MyOumUf1OKCLmAxfOfN7dcrXuDL/7B0V/bCUfdOaNGs1hMMd5kTNUOGaFINetGDMtlAbJsxZaF8MmEy8PaXje2ZEGNWjrR7aJ0zv+GQJ6KmhG1j7/trxO//sD3FV+Fuls65GBG0L/8Ur6KumIQq34b2lJgzxiTYABhoO1sEpwdOxS8SlJwZsQ3w7ZgXhJwSxM/uX33O6kcs85mn6fQV5rp2krmFDtd4n7r7kgqBDimNgmRu3QKkRO4aC9NnNbkTa6QXst9IW2l9ZGedxD1YcrQ4DxAEo6B91aShtNYGbTFbcUc/LlCCGklHCr3Yf7+y+gz47dDxBLHoKwa3ZQQ4kN/2Ptu6JTGFeD2HBTZ4ZcmCwo1K0OtJRfS3ekBsS7PWArTVMTWwjTbHNWJSsjW3BKNfUp/IKKME
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(261009220027099003)(6133799003)(22082099003)(18002099003)(10067099003)(261009223327099003)(261009223027099003)(261009221227099003)(261009221727099003)(11063799006)(5023799004)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yJH9403mNbNvgCiJT43OuM01xvoTGv94HwWOvMznj79pctstYIo4pClEvWwy?=
 =?us-ascii?Q?e7pMNyf23Jzn5cCz4RhERrQX80D0RqopZDoGJ9Opy1tnqmfi152snYkmDwPo?=
 =?us-ascii?Q?h0R0KDgJpd2wIjzQE6GFHDFXYBuRWTVx9Xa4VVhHTMSDJPJHsgHiXG1A0eBw?=
 =?us-ascii?Q?7XPpDUpSF3s/K9BuQf7VF7VhC+1dK/p11yzmlPjzQTRy5LLkX8DpHKfhcxLP?=
 =?us-ascii?Q?8E5Rg1um7LO0gc84yoPh2Z7bV6jCP3LM1YTicmcj65EcBSJR84vjWGeMkvn4?=
 =?us-ascii?Q?vWZWxy4iEwMopg7PBatqwT3wufISLhG9HXogyml2f6ocSgFGPKf5sRmyL+3d?=
 =?us-ascii?Q?6XJwHP7X5J3k4sSAod34BBvnKdTBKa4NYHhXk/LCrBNT49hvfC3Xb5cfOlMt?=
 =?us-ascii?Q?s1WlTVKlwgIDXTfqUTMgOxM4J/IynYUevKj+UOChkTNUpkQkT5yi976OHJK9?=
 =?us-ascii?Q?on6fktM2RWxWP7tdEfqeH8dy49pjmdfXy0kydZ5H8WC7FWxuTqqDHIyyFvT8?=
 =?us-ascii?Q?3EurG3wUKkLvBDvkJjRjoq6jpL+Sf+V8hX6tcFXgpRFocyq2kuj+etR/Uh5R?=
 =?us-ascii?Q?9yurWe3SZd/MaNqmdXskqto4yVjg6IIKsaUm/r1//rVFXhM4V8pp6zahZ3AI?=
 =?us-ascii?Q?JGLsDw60bVitr0MeXzJ1LezCRFciDLsu2iaevSEzE9kfP/BO+SlG8AZzRkyc?=
 =?us-ascii?Q?D+A+VeKX7FmnMXosd0gJvMj6wctiiJy/MMlFXyv6BdEY1lQUwBeapWXyJV7w?=
 =?us-ascii?Q?MSDDf1ZuyBTwUz+LQEDzMH8USE92jpDdeYsg1dL5SDHAmJXhEuBzUrmes0Is?=
 =?us-ascii?Q?J0v+X2gXPg9nrVI0avxMAFMEnrQA+0l3GUy5iyCUKYFtUtidzNmJOHA9E2Zz?=
 =?us-ascii?Q?5f9itzrlz4IWsSPi1fPrlCjk103Vt4SC6RY5rmWls/5RCkM3MH0sys5egHPp?=
 =?us-ascii?Q?Ea1gWjRR2jiWCI1yMCj4Gwz2+8nXeYXIKX5fbzZbgEkUzOQq9Z3SiOOdEz9L?=
 =?us-ascii?Q?vVuTbLfKvmUXomokP3PmaUA7OWySBkjnX4iLaUi/5jHmvR5Of31igWDbiqQh?=
 =?us-ascii?Q?7Q66pynKODesd1iBE45IH13Gk1R2Fk2aek9A8PVij91oeeXwMmB4qTaFfdcc?=
 =?us-ascii?Q?lYNeSV9WgDgnNSo5VW4hajC7rg2Dy+qo6XCoBkJL428KVy6y4a8w9N59NBpe?=
 =?us-ascii?Q?0xwFoYcOqf5md/2/aysYby+L0ScVtzqewndb0UF7qvXNSyHOMD3ViMwWwmTk?=
 =?us-ascii?Q?a6YfenEySCd//s+UxKA/QMJl4axln/AdTghSyb1WfCx3lbK+s3D8LWpJoJia?=
 =?us-ascii?Q?Pdmkp2Bnnywm7fOT0bcCSTKUpPeJckwKpTiJgt/39wJUotW5y0Dsw2wFagy5?=
 =?us-ascii?Q?u/WnM9R+OuzFYV8Sv5HwxZ9y1n8ceI8bjxMDjbbzeLesManEp9VYnpjUCdQ3?=
 =?us-ascii?Q?UF2m/aBq0A5RSAj4q6e9548M0mbpTpHYMwIRTkfXjOan0Msex4LPHCiJCsfe?=
 =?us-ascii?Q?F3sjpvLBjxmUJcJqqo3oSpSdAr4/IsiGfHkZ5cQz6FBwkrlRq+AXYUckrQab?=
 =?us-ascii?Q?yiUvPbT6N009FfUGRSPQD0u/HBvJ0Ev7B6/GUl6zSIMaCifvZFNC09WfCXt5?=
 =?us-ascii?Q?shviPOU5uucKWc5MS3Y6UFI84J7OyQwPg8HJsRFEHFpmKSMVt2t9TGzZq937?=
 =?us-ascii?Q?D6tAJhxxTpZ62O/ECZw1ZhdNaxMvRTHaRDNLs8FA2f78LEZVeDLsNtFY1Ndm?=
 =?us-ascii?Q?FsSj/TZks2l5iB7KyTcyYKOZk207dfk=3D?=
X-Exchange-RoutingPolicyChecked: c/RsHsQkXJW8WyNqlrBRJECk924MeaHGP7PSp/2R/CmCuQ4VNSpXt9H5RmiIz1zKfF9VZ+mz4FydDKDUvWoC4bXzxafy3KiySp/XkfAEqIkALRQjyIQKcK9J+7HJtKoYKhPvGnQaffxBKIsHuBtTr/9rvElNDcQpFAQbRcSip5dhes/T1No2yhBvWsAsULeUvZuAWgUhaYMlTFICq0ssB36c9RJtDL3LGyh3JOzu8CpcAhSG3l21IeCxxEWW5Ou29BL8s8CyehzeL/CYmcpFmleHcgpYRRtf9yI1BM8CuYxJkij14jkn/vhn0kVTXRz2ByJ9aWDH2Dn8Eup9MJNFNw==
X-MS-Exchange-CrossTenant-Network-Message-Id: f4d29042-fbed-4c71-f95a-08df2bba496b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 19:18:40.7900 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eypwBLJcguue2b5UE2yC593v2UnGTKFXUBSRi7ORxHP2HDadWwtzF0Kqj9zLhZLxRbhJdwS5dViJ07Zf/aO0BJf4aSpuClhxZyzDmdiKWYc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7456
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

On Fri, Oct 16, 2026 at 01:29:38PM -0400, Rodrigo Vivi wrote:
> When xe is built-in but configfs is a module, xe_configfs.o ends up in
> xe-m and is never linked, while xe_configfs.h still declares the real
> functions because IS_ENABLED(CONFIG_CONFIGFS_FS) is true. This results
> in undefined references to all xe_configfs_* symbols at link time.
> 
> Adding a "depends on CONFIGFS_FS || !CONFIGFS_FS" to DRM_XE is not an
> option, as it creates a recursive Kconfig dependency through INPUT and
> USB_GADGET. Instead, add a hidden DRM_XE_CONFIGFS symbol that is only
> enabled when configfs is reachable from xe, and use it both to build
> xe_configfs.o and to select the real or stub interface in the header.

Isn't this exactly the problem that IS_REACHABLE is intended to solve?
If Xe is built-in, but configfs is a module, then the configfs code is
effectively unusable from Xe and we need to treat that case the same way
as configfs=n with stubbed functions.


Matt

> 
> Cc: Riana Tauro <riana.tauro@intel.com>
> Cc: Stuart Summers <stuart.summers@intel.com>
> Fixes: 16280ded45fb ("drm/xe: Add configfs to enable survivability mode")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202610160935.Qk4ZxBxY-lkp@intel.com/
> Assisted-by: LLM
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/Kconfig       | 6 ++++++
>  drivers/gpu/drm/xe/Makefile      | 2 +-
>  drivers/gpu/drm/xe/xe_configfs.h | 2 +-
>  3 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index 0d87251c5d7c..9479340b5808 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -116,6 +116,12 @@ config DRM_XE_COMPRESS_DUMP
>  
>  	  If in doubt say "Y".
>  
> +config DRM_XE_CONFIGFS
> +	bool
> +	depends on DRM_XE
> +	# configfs needs to be reachable from xe: built-in, or both modules
> +	default y if CONFIGFS_FS = y || (CONFIGFS_FS = m && DRM_XE = m)
> +
>  config DRM_XE_FORCE_PROBE
>  	string "Force probe xe for selected Intel hardware IDs"
>  	depends on DRM_XE
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 10930c924070..588091c529e8 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -166,7 +166,7 @@ xe-$(CONFIG_DRM_GPUSVM) += xe_userptr.o
>  xe-$(CONFIG_HWMON) += xe_hwmon.o
>  
>  xe-$(CONFIG_PERF_EVENTS) += xe_pmu.o
> -xe-$(CONFIG_CONFIGFS_FS) += xe_configfs.o
> +xe-$(CONFIG_DRM_XE_CONFIGFS) += xe_configfs.o
>  
>  # graphics virtualization (SR-IOV) support
>  xe-y += \
> diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
> index 10a00d6bbf8f..063e73fe01d5 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.h
> +++ b/drivers/gpu/drm/xe/xe_configfs.h
> @@ -14,7 +14,7 @@
>  
>  struct pci_dev;
>  
> -#if IS_ENABLED(CONFIG_CONFIGFS_FS)
> +#if IS_ENABLED(CONFIG_DRM_XE_CONFIGFS)
>  int xe_configfs_init(void);
>  void xe_configfs_exit(void);
>  void xe_configfs_check_device(struct pci_dev *pdev);
> -- 
> 2.55.0
> 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
