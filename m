Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E5D8CD5BD0
	for <intel-xe@archiver.kernel.org>; Wed, 27 May 2026 15:47:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5CBE10E22C;
	Wed, 27 May 2026 15:46:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tg2zgIJP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ED2B10E22C
 for <intel-xe@lists.freedesktop.org>; Wed, 27 May 2026 15:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779896819; x=1811432819;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/Ch5k+RU46+B3nI/7VcAGdxpW+OR5mAgUGuUIGcnlX8=;
 b=Tg2zgIJPxyEdsJB6p0f5r/EpUGYJPfvIdDYMZ6yVG4opkHPasm2LCRam
 bNi0C6Z/bher43EVVuFf26AAYmpNu76nEpoIpUbGbP0AQkwLhmHfHg/tE
 FsL54GLlEIxF1+aqJdvc5cvmaaaTJ5Acys1xZYJo8/D0P3df9WtvOiCBG
 BXwqL7LDU5309Ze0Y17SJ0l2Vb6W0M54NbgOwJx6NXV0TAwfyn7fdJ35c
 F3EcETLbCEzn2WilpdkHHCph001+7GcrbPRnrZ9rSoH3wVbojdfTokHJI
 sGSeMpcJKVSw24Vn09jR+HiONp26ch3OX/YuE1ZeeHV2E0fUUdRBq4Rz/ A==;
X-CSE-ConnectionGUID: LBgYEYfeR1SW+N6et42cRQ==
X-CSE-MsgGUID: UgAabf24RteUYB6CxFmrEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="80917959"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="80917959"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 08:46:58 -0700
X-CSE-ConnectionGUID: 8z9qN3o5R+e5uWgSDq+sIQ==
X-CSE-MsgGUID: a66wWyHBQtu9KgMM33SBgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="247229697"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 08:46:58 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 08:46:57 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 27 May 2026 08:46:57 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.44) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 08:46:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NJiyy54k9aWe9wQ6iI8EV9e3+pxqKa+eE2ifBodAdQ+uGSuerljrr3P2ojcyL/sLHxlhnoXaiPDXyYEy79P/v/lYdr8MMre/nICO++y+E1WFBp87ExoUCZdS3A1GJCh5I31nqR0W/6+y6GrK6T4HvkKDkytogqCHbM3LyVwbUpEardVOSwbuz1m+YbHWFpuuAkCgNCOW3IbT/9fUpaZVs97K6U4kFIH12e0elyQddcRaSoInytRI5vNVH0RFRLP3TPBaLXrqcz4Qpl+Gu95c6H2Qlu0fPIFWP6xYK6feoiCt6Ab6GmMB58/gGy0YZj9x/23CDIYRdY5iKzo0OecokQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Oq4EHgEqDujRjgHxpy9/y/zf8Slxqn3HAPhcT0NFO0=;
 b=qoXUKU6x3KFrQ+KyiqxVhoN4X60+e++Opbup5hN5TEc4fpoxBarxw5wCy0tIB2GFMaktD6nbbhWHEh2LdRxo98bAhucSiuDyZoNqoq45UhKM+iV0muJba+eaeQQAGNZCnVHyDeZ1GUVsnAIWPXiho9/7RoWmS/cV20zsbR8YPslRhVoQbHnF05dgovU8GaN5kiTybr+4R+BxL/h+hcdMbnBrNy6M0nsUrHqzD7uKxUtH5U0ipgPZtt/PFeEszqGL6FFvcrLTlpV8JaG2j3FjlvS7BEjQJahxPlMliipcwofwIHibT4NeOBnUJyEGN9ePE/kpyHqFldpYVBJmItJhpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by SA2PR11MB4924.namprd11.prod.outlook.com (2603:10b6:806:113::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Wed, 27 May
 2026 15:46:51 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%4]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 15:46:51 +0000
Date: Wed, 27 May 2026 11:46:47 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 5/6] drm/xe/pm: Don't access device in init_early()
Message-ID: <ahcR59C-xRrCCPu2@intel.com>
References: <20260525160529.15890-1-michal.wajdeczko@intel.com>
 <20260525160529.15890-6-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260525160529.15890-6-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR05CA0165.namprd05.prod.outlook.com
 (2603:10b6:a03:339::20) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|SA2PR11MB4924:EE_
X-MS-Office365-Filtering-Correlation-Id: b98da27b-c2be-4592-5c0a-08debc072b8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|18002099003|4143699003|6133799003|11063799006|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info: yv/8UKkVqU+6VFRT19MCYm5Rd3X8IGX9cqaqoSn+WRzMDNBlfR+rGp3rXR1jplt8P46YucwFHIrOBsvkgtacQ0w8QBpyhnPrDsXod2e0PqN+lJcrTvZdgP9a4IvEro0Ad2Xg6YY2ct6uOuf2cr3oGU/7R3sbPhgQmwHWg+gG3cHNxDr/HSEP3GJZIEFeKWiH5YiXY7ktue4nd15hCZnXE4m8F6ZYS3FFpeGYpu2jyi7slha2Dr4XmkCwuDoHh7KzJNDjMonLGY+2WxhDIMU0XlS7N+MLnWzGQjAJpp1hg7Fk9wX94lCS2Nw3xaB8N7WoBIt4fYKq0qoXB1vMiOAeNgOPoacQFhjsqUuO0X/ueSyJnDlb5m3Jv7/tbg/WGKxACh6kEuCNWAsIEXFI0AMWmh9mRI9J/0VgwvCRxBF57HnCe3t9B7LzPQSaTIpVNLNVmfTzLDbTb146J5zeLYNIMCdaeyWJIoLbyIGeJzK6S7HNhRUxwu+HS4AmAC4hhTOu9FwDZ4xSTl7pdUCLXn2DuzQk6EPgd9y3v5V1i8oUMG8Oe0boYBv59rbLHur3sM07ddXT+3RCKlliMAjMWPzXURqRgMGe0m2W92TLoqReEotrdKM+6nk/7MAtaGiKGOl+7AL1AdOckgLY8zO7wXRo37XSM0NJYvrvMf43OXGC1i/qlxz/ORSu/oonMnrtd4Vx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(4143699003)(6133799003)(11063799006)(5023799004)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JpvG0c1bQH08RL6LCj3sxObId6Oa0J1WI6DiE6bHooQxyiZoupCOzxL5dy9e?=
 =?us-ascii?Q?tHFs9taQonY+upYlk5DU7v6uMHHFOboFYEZqmD3Se9dgQN51wPbH5jUoVBbQ?=
 =?us-ascii?Q?FFergHunZ4niUZcN3UN8JIHcH2fTEkuCB1+byLr3t8Cv0k24wyded+KBOx9x?=
 =?us-ascii?Q?VuK+8EuEIY6v8j3MjUMp5Utl6BHGEnxkVit3XCiyO8HSb8t2FpzlxfrhQT4u?=
 =?us-ascii?Q?e4JoAdRkFL8pY5SAUMJwXpSt/UZKmVvUH0gstWh7fQrt7JCGKsk27+ZBQVj7?=
 =?us-ascii?Q?DmJi4aF/SQhlXZPM4hg2y3qTr1t7FwyiW4CE35kw0vBsjzhdfODOx3Qg+CMH?=
 =?us-ascii?Q?WatN1udI6oEHl8J61XSZdZSEYSETMeCYiSlkVy9YxBEzyTRpCfvv1h9f9KAu?=
 =?us-ascii?Q?LGF4QIRRTvxHvLygvd0A/uy/nK7c8rDZASCEKzAXILYlUFc2azxCCx+G+sbr?=
 =?us-ascii?Q?Ny879M244iAcZWXFPWwSYEfv5KCSVvtKIoHLQaBwrdwphJKGOU5gXWmQFQdn?=
 =?us-ascii?Q?Q5sjBWvM8rVioG8wpu96gvkfRsgjx5qM7BKMZgx92dUZmMcexgV+rOt6Ijd7?=
 =?us-ascii?Q?VJ75nas3Um4mKpGfLBb3WHM/OxEWV/ZIwmHgTyUNPYv0rPQdgQOq33L1qWos?=
 =?us-ascii?Q?TZIUGzwd7rFdP0/ytvyB2a7lKd7P4MNbjyF0Hp+vcCm7uyn3GL1WQWfX8IJS?=
 =?us-ascii?Q?Fmx/4iqIrrD6+QJ7tmDfV6W9mpeLhDtoPRlxjQ/+WAZMwGHjoiiOypxUwLFS?=
 =?us-ascii?Q?jh6G8U9hoS0PkM5yPaSsfAjDlfEeN4XUFDrn6GTkMvWPPJt7W0iG7+2/1K5J?=
 =?us-ascii?Q?o4BUlSIevSF9BB/p8nhoXDByOrADDGPpz77p6gBY5MlpeGvnEn3DB9w7aSse?=
 =?us-ascii?Q?9Pi8vX0PLDyaqz4ESEN1Qv1vqs8Pj5AEzNKYNJBu8ZjpYf3rjIEBOw8yJhYN?=
 =?us-ascii?Q?6/wxwPxSBiEedggs9R8CTnwJI5IzSRphzdnwdxgylE+u4rpNDR3spVym4MYX?=
 =?us-ascii?Q?LR4FFrl/IsXilf8jn6TclEgBYd9XXKX14egZgjmHGy9Mmd4dvUrDvH/wrsjn?=
 =?us-ascii?Q?x3dC6iCW/KHzZKx5uz+Z2Fy8G6QuoO+IJgIZwgXMxrJvSRBitXClfcxFlqo9?=
 =?us-ascii?Q?TRqmuCi74r8f0xdoNEAUg+1TD6ZEJ53iEh586bqWF9QAIebi2ENLdc9GMR1n?=
 =?us-ascii?Q?XiOYYe9cmorSLVhD2JJGF4XkGlKkzIZEVC6Uw3X2r8jq8eAzKE8PnAmhZdcd?=
 =?us-ascii?Q?c3S0o2dfDhnb+q6Gf6VlAJ99Zb0WoqG4oJX4sUiulCwKT1i3RLwUx28uk109?=
 =?us-ascii?Q?9yJLQekHlWWKk4gCdmowbcX5frzFPUTngFOD0EYVl1yPe5qg8aqlJlIAm3/f?=
 =?us-ascii?Q?dr8lPa9cUD6fxAIRPyZZ3T4EoDXZBaR45zWDnkLZOUvTbmgP+Gd8A53qOlv6?=
 =?us-ascii?Q?THztIG8qEQjWoweZ6WqdNaV17ONPK9uxQnJBgOPQ7du2iWfiMfcI/xezbgX4?=
 =?us-ascii?Q?U1UJpN+0BQxkxjQ16/i78TsKNUGOpmPQmuUVmbnUqcTguY6eW3gvkHm+vAx3?=
 =?us-ascii?Q?c6YeHPWV4oFL5zLiuxINO7kSZoCwyU3hquLBnS7b/SweTMVFYtm5yZSfjHDE?=
 =?us-ascii?Q?ykyjeOUUJpzW6h+2uI93odAsHfEgwfqgfNDXtc4m6aX4Y0smhpN7qRp0Pirg?=
 =?us-ascii?Q?oyG/q3jATaZF4YPTyQPOijzke2wWppVxMsypVxyVPuxYZFV/ZoF3x3M6hrrG?=
 =?us-ascii?Q?3zsDv/tNXw=3D=3D?=
X-Exchange-RoutingPolicyChecked: A/oM5fEG4X4U0zfBo9aC/CXhZlGODS8WzieNwo5MeCwaHCvVw3/HXeQ6nPRXAfWwReIZYV6o3DMUxHpq+1Juv+RMsusvs9jxw340W6NvhXv73qXQggwuqf24uQQD1eajLa6pfeFMFgDVi9BoUIjJ2Y9O4AnLONGMQeLt8OcoNlFt8/224Pxb2idSlRPOj6zLu0LtKxP1nOZNVF5HSF1dKgC6DoDPBWiWLyl0Pcfcn1OZrQINCjsNwrOVMbfOMdb69iWHI+H5IERmfI4WMqzD9j/guWWAZiJk66yt9eGeMpQ7Vp/DXfIBYSd+G8qvLJy9CgVmu6pjw10XXYRbl4ZRTQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: b98da27b-c2be-4592-5c0a-08debc072b8d
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 15:46:51.7803 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YTaWA93aZtcBaypqOA7JhZe4aE4mwk6ij6Klyh6094xaUC9FhTpTJTi5Trs6z8IqM/82bwDxBWQvJ8a1jWa8JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4924
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

On Mon, May 25, 2026 at 06:05:28PM +0200, Michal Wajdeczko wrote:
> We should separate software-only state initialization from anything
> else that requires access to the device's hardware. Extract d3cold
> capability detection into a new function. Add simple kernel-doc for
> updated functions here.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device.c |  4 ++++
>  drivers/gpu/drm/xe/xe_pci.c    |  5 +----
>  drivers/gpu/drm/xe/xe_pm.c     | 27 ++++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_pm.h     |  1 +
>  4 files changed, 32 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 7ba407f73a02..d224861b6f6f 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -594,6 +594,10 @@ int xe_device_init_early(struct xe_device *xe)
>  	if (err)
>  		return err;
>  
> +	err = xe_pm_init_early(xe);
> +	if (err)
> +		return err;
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 6b1a4cb7ccb0..35e611cd2e29 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -1167,7 +1167,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  		str_yes_no(xe_device_has_sriov(xe)),
>  		xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
>  
> -	err = xe_pm_init_early(xe);
> +	err = xe_pm_probe(xe);
>  	if (err)
>  		return err;
>  
> @@ -1179,9 +1179,6 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  	if (err)
>  		goto err_driver_cleanup;
>  
> -	drm_dbg(&xe->drm, "d3cold: capable=%s\n",
> -		str_yes_no(xe->d3cold.capable));
> -
>  	return 0;
>  
>  err_driver_cleanup:
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index d4672eb07476..5d1a3a26cb6e 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -24,6 +24,7 @@
>  #include "xe_irq.h"
>  #include "xe_late_bind_fw.h"
>  #include "xe_pcode.h"
> +#include "xe_printk.h"
>  #include "xe_pxp.h"
>  #include "xe_sriov_vf_ccs.h"
>  #include "xe_sysctrl.h"
> @@ -349,6 +350,15 @@ static void xe_pm_runtime_init(struct xe_device *xe)
>  	pm_runtime_put(dev);
>  }
>  
> +/**
> + * xe_pm_init_early() - Initialize Xe Power Management
> + * @xe: the &xe_device instance
> + *
> + * Initialize everything that is a "software-only" state that does not
> + * require access to any of the device's hardware data.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
>  int xe_pm_init_early(struct xe_device *xe)
>  {
>  	int err;
> @@ -363,11 +373,26 @@ int xe_pm_init_early(struct xe_device *xe)
>  	if (err)
>  		return err;
>  
> -	xe->d3cold.capable = xe_pm_pci_d3cold_capable(xe);
>  	return 0;
>  }
>  ALLOW_ERROR_INJECTION(xe_pm_init_early, ERRNO); /* See xe_pci_probe() */
>  
> +/**
> + * xe_pm_probe() - Initialize Xe Power Management
> + * @xe: the &xe_device instance
> + *
> + * Check d3cold capability.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_pm_probe(struct xe_device *xe)
> +{
> +	xe->d3cold.capable = xe_pm_pci_d3cold_capable(xe);
> +	xe_dbg(xe, "d3cold: capable=%s\n", str_yes_no(xe->d3cold.capable));
> +
> +	return 0;
> +}
> +
>  static u32 vram_threshold_value(struct xe_device *xe)
>  {
>  	if (xe->info.platform == XE_BATTLEMAGE) {
> diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
> index 6b27039e7b2d..6d5ab09cb769 100644
> --- a/drivers/gpu/drm/xe/xe_pm.h
> +++ b/drivers/gpu/drm/xe/xe_pm.h
> @@ -17,6 +17,7 @@ int xe_pm_suspend(struct xe_device *xe);
>  int xe_pm_resume(struct xe_device *xe);
>  
>  int xe_pm_init_early(struct xe_device *xe);
> +int xe_pm_probe(struct xe_device *xe);
>  int xe_pm_init(struct xe_device *xe);
>  void xe_pm_fini(struct xe_device *xe);
>  bool xe_pm_runtime_suspended(struct xe_device *xe);
> -- 
> 2.47.1
> 
