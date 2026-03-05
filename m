Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D7ACF513E4
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 22:14:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF8C410E114;
	Thu,  5 Mar 2026 22:13:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ie7Rcy3o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61E0610E114
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Mar 2026 22:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772748839; x=1804284839;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CgrYMqzerT3Teiw9RaECt3JHwj+21TYngi7nS7csYgk=;
 b=ie7Rcy3oRhu+O6wvifwvrl6SP7VTI4cEcGrWG6YA5pfzhPU7H5RjxCsQ
 RZswq6EAVEBCLeetfdC48hBMdgXat7e3FyLCCHk+57K1UI14yYfwlG6kf
 I9OazZ01Y+BSB/GQsHzlrvPhLcSF6uQe6FjdLXuvZS+e+HvHjsrfTtgpq
 iRZCxTyubRJfCRQzbevUwKPQFqkIR2gttq+1hRL/CFs9VVAqkEtcjV7AB
 aQf+QNnt6dKD4YdyHtywuq7xADGI0V64M6iJupz1ZDPzfGE/wgcerMiG7
 RJ78eR0E0I8SufmMbRrFLOmNfbFjXp1PzTsfLvK0DQui0B1DDYwGWG21S w==;
X-CSE-ConnectionGUID: 43SAtnoCR22+A6sbVVz6Rw==
X-CSE-MsgGUID: IlfRCtGWQ/OtkTLgeqHyiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="91242097"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="91242097"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 14:13:52 -0800
X-CSE-ConnectionGUID: cv8DmzV6SCCfrR3aEABasA==
X-CSE-MsgGUID: BiR6a1KFSmGqg/9WTYZhnw==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 14:13:50 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 14:13:39 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 5 Mar 2026 14:13:39 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.52) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 14:13:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Te+MBPEBTIunUDtV31BUzHlMk8A+Oy/xFdImxWYnxO2yk1JdzVkpDEOn20CzAoST/aH7vtolWmFRSPdUYj6C0xebIirZ6uqvPBzoGgNXIPZE1urK4boIguoYaUX/TlCLSAM2m4I3NoUJ0kM9wrnOAnzcyjh5mjDcf2JGqXgTp0cUKFXiKwc4tpgGLYAD/2udyT6giMhx8ydQybKk8pQbJy71OVP313TbVV6+89IcuJudOJ1S2fLZRs0hZEfYNVTuit3mZiO3RMy93K1NUpliNFqN+jn1Ew6Z3XCdoZwXHuwzUffoeGwVOXvVJBaTLrcDPPV6Gr3bdUH4pTgJhGViwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pLdcgWf7s8K/zVOqX5s1qe+/fAXlL+nEfPPcdyANJrI=;
 b=iCXzFi9KbhLIq2D9uf5xRGiYwbTxN3JjkQIJLc1gnuWcRBitX8JiOagZLg0Z+Ghvvh0WdwJDhoanu9xm4rSR9x3b16yONWeI8Q6lA+cUXT51l5qBW24TXZ5Hfh8ejdbTABRmve9YILNN83vuJM0ljh3OAYjMmJhwpXtzIEOlrElskyfHs/Tr5eZqCPhmCcC/NoYltBJJSXDM2R9YGOWF8m7L4R0rEKjRtSf83Yt9tfu4DFcVk9SdRpeV8P33MocMGQa8eesbC60/wjMmzNHKdHrDq2KkTMFusQjrctz1HXrsBNaCrs0iT0kVEkbWgyqwpfrMJmchhkPwV7Zajb8waw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SN7PR11MB7489.namprd11.prod.outlook.com (2603:10b6:806:342::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 22:13:35 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 22:13:33 +0000
Date: Thu, 5 Mar 2026 14:13:31 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/7] drm/xe/nvlp: Read platform-level stepping info
Message-ID: <20260305221331.GR4694@mdroper-desk1.amr.corp.intel.com>
References: <20260305-extra-nvl-p-enabling-patches-v1-0-5020d5289dea@intel.com>
 <20260305-extra-nvl-p-enabling-patches-v1-3-5020d5289dea@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260305-extra-nvl-p-enabling-patches-v1-3-5020d5289dea@intel.com>
X-ClientProxiedBy: SJ0PR03CA0242.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::7) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SN7PR11MB7489:EE_
X-MS-Office365-Filtering-Correlation-Id: d851b8f5-231f-4ef8-4665-08de7b0470ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: zFl1Kbrz/mpnb1W+irmDhVgIpy3o2TAblhB8+cBpkUHXyNAJ/fFmzXWb+1OjLHoxOD0GI4hQk5EpI8X95C4WWZqcNAU84FRk/7rT+IWc37KNGd6POFmv1N4vNrGC3p+YI6q8FkKIPzn9kfHJl3RkOkb71hsxSVvIbM/tQ1agozff/EiOfI63th5pNTGP7V4gEZXT2Y6cIrWmex0a/609XmenDTrtD/zGJwTQ7VciCjQe2l7VdXsyNymjYWofAn84QcSWrtQtpT8n3GAoHdypZFdSKMHJ1oJoY8Bz3xPoIoKcE2gDT+BbP5Ybzu+0gYWHGtXVJbvxe+YpkzghsrllRCAfO9KTt3cvLL2OUPloBeoxt4ComdpC8xL5MZlT8B4WV0kI0wdQu7dY6u7P41YpghFiCP0NutgVXivQ3PofZXitOuXElymANSMTPQ58HMURLLrPiATfsG11OsAkk+xvzhH2knbFQ86giEoFXvdCgSvcQ2lbKNLRNWbblvknNHz8Vnz6z+Cn5TiJ/ZZUjiYEmSRApt3tK6ahQKCFmpozsd/MUQCXNYe30JMRSoI5RkKGvjUOTm0jAtWmCZeTuJi6TbKrFfB/CFm0r5OzuUYAoO6V9zFdY7VWUBPa7M8nVbLNYrDmQCb9Dpb2roM74yFofZAsaYDc2Cvnc5cJDUaU6kMfcey2x5Qu0EsSJCHtRt/3yQhsy4+KAlYD1ENpJRFupErx8BKWaK4VSvccUz1jKRg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KKb3X48CjcLA6I3TTuUU0FEidYnDK4jOODf/lqIYukWtIcwjOSY4XjZod2dP?=
 =?us-ascii?Q?OvQIhU1DLkanzvp3XNvN3pfBi/kM9IxQ+2IG1lAW15o3ClcM1ek3OWESyYtI?=
 =?us-ascii?Q?pvRAgsR4CKsCLlJHvR3k5FaMALqEME9dc8z7oHUAGSOdjDieLA2/8EWkqDbO?=
 =?us-ascii?Q?xKTYhHDp7DT1Z0JZKxoU9s+fsIrDqi2TnZF7B1hBjUKvc7Br/K8RDXEBU+nZ?=
 =?us-ascii?Q?1h803eSXbYKjs6cGiIgOYHiTtfvqD53eCcFjkxgjwky3WmNnYDt3v2vbIPok?=
 =?us-ascii?Q?Dko6tEJk4gmJwb/a+T4ca0TJcDdCH/BdS0UZiTf3cwsvjchtRhZaA0KdYJ6K?=
 =?us-ascii?Q?FXPsYdc5zXnE3rmH36IpbdYxibWX9QjnzJZHfhQsfEhhatmX4Q7+FYG2Ubvd?=
 =?us-ascii?Q?rmCLskgT4JImIAk1+hCNkTqQSLZqExGQnfFKGX3I3nepysqw/iIAko3lyQTd?=
 =?us-ascii?Q?DYwUKir4P7+n14ZA+9kCrzb2YbIGFiH3cUsVYBCxva3LlNWGzr6PEm7k3Db+?=
 =?us-ascii?Q?KnSunuGy2VWl257njAY29cHnHCZfghmbZecb5CJ5CgzT2KbHlWHj1UoQ1lUc?=
 =?us-ascii?Q?DByvXsqdLcCegD52QuznzYw67qKz5/cS+RQPWL3zikqK/mNaZmTjj6hfuIYe?=
 =?us-ascii?Q?RUDVqoWFTxfNwWCqXtrfDcSNCKS9Y4e10bJWsrnN4oziGHkKcajnG0uGDS5T?=
 =?us-ascii?Q?9j7j0yBaCZQ2+7jJ+Knv9IMREZXxpNARPZroSoMRtAFw0uBtfg2Vbeysh1sj?=
 =?us-ascii?Q?h17QxoxiniudkhKS1zxf9XoFpS18iMzUhAL07scAaUERIVDGpqXd2688KXBv?=
 =?us-ascii?Q?S7ArRQDCsv1MM+GMSqrvSdZ9fjB+l0Gldnr262abDiULYXdXT23rxX1AKRZI?=
 =?us-ascii?Q?/BxEECWoKTkgWDvSibku2uwqsc0j05kCbnX1+xcI3ZIOj3TWopneJhpBCg7I?=
 =?us-ascii?Q?x8xgAhcbjWnshES4h4Ao29EK8dP9INUDJqzx/ZLy4OAqOHnidGrOziXKr3ej?=
 =?us-ascii?Q?5QxQ/s1c77O60nx733SW3FHeJGucsv+fYVSuYYSJPDXR8C+kzksXR5QsyTbS?=
 =?us-ascii?Q?OGCwcNfiCBngm7pJXFbuE77OzOaUqL8hnia881VIFwTrqkp4WNc1mLzfT6Ej?=
 =?us-ascii?Q?+dkn3fOzsc0gQ8U/AI/lmGdvI1+dzmvsG4fsXJ5AhP3CHgB829r6EHslu0//?=
 =?us-ascii?Q?Hey+bRUiSYWfH/LFTs/podZI2Y/TZAjG5AtNbcgJwYCQJjC8Fnt8HTI4LeSX?=
 =?us-ascii?Q?+0p/RBYdqtQtPVJurv113MwACxHwP1hC1wTadQM0tvowxzi9jme6+PDWNXOe?=
 =?us-ascii?Q?cEeHNRgNSIblPveTgyvPUOjqp3bPzRXsA7mlSEPHYqxUsPOlUSmha0a0XSh/?=
 =?us-ascii?Q?5ZFt6iWc8zH5Jsx/R26I9HgymRO69nbsprSEQewTrcmfriztD0vp616UIOyN?=
 =?us-ascii?Q?Lr6mIkv+A1IzjYo/K3wY03si34d2NMGGOw5ARbsI8eum47larkbeELHg6csd?=
 =?us-ascii?Q?gVHOSmSWg2bSTj2PKlFJKcfdJ/NkDTVcnC0pK5m6xfDzsH+vPghGWwsQBO9N?=
 =?us-ascii?Q?1/4TwS5VWaBPl+sINq2J482xgEHUar5YFdKtbLKCIoBhPa4mT5GLbwkIuzWO?=
 =?us-ascii?Q?7B7XxrpRf59zPo/tqMhU/MwkkXmCIpnWiXUxYym4JDyqxOOXWHl8UsGCbZpI?=
 =?us-ascii?Q?MDJ8+0GExYbeLZtacPYPfLHTlRmnseXC4VJiAc1YYCrXthvuTuB+7inRPFK3?=
 =?us-ascii?Q?jOKtdemkShgMLS+kkmAvJ/Oc17bw960=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d851b8f5-231f-4ef8-4665-08de7b0470ab
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 22:13:33.5457 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TngfM6yfgWD4qKQnJpwecd0mM4g2jmHva9plX7wYFSD4Se5uWanjOWS9gqUBA3WVz6ni2ix86pCYzl26bvYxrio9sTcx7a6xrkPiOnvJ1SM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7489
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

On Thu, Mar 05, 2026 at 09:02:30AM -0300, Gustavo Sousa wrote:
> There will be a NVL-P workaround for which we will need to know the
> platform-level stepping information in order to decide whether to apply
> it or not.
> 
> While NVL-P has a nice mapping between the PCI revid and our symbolic
> stepping enumeration, not all platforms are like that: (i) Some
> platforms will have a single PCI revid used for a set platform level
> steppings (ii) and some might even require specific mappings.
> 
> To make things simpler, let's include stepping information in the device
> info only on demand, for those platforms where it is needed for
> workaround checks.
> 
> Bspec: 74201
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

This will leave other platforms set to 0 (STEP_NONE), which should be
easy to catch as an error if we try to match a stepping there.  Looks
reasonable to me.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


> ---
>  drivers/gpu/drm/xe/xe_pci.c        |  2 ++
>  drivers/gpu/drm/xe/xe_step.c       | 22 ++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_step.h       |  2 ++
>  drivers/gpu/drm/xe/xe_step_types.h |  1 +
>  4 files changed, 27 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 72d4131e9775..b9000b5d3ca7 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -904,6 +904,8 @@ static int xe_info_init(struct xe_device *xe,
>  	int ret;
>  	u8 id;
>  
> +	xe_step_platform_get(xe);
> +
>  	/*
>  	 * If this platform supports GMD_ID, we'll detect the proper IP
>  	 * descriptor to use from hardware registers.
> diff --git a/drivers/gpu/drm/xe/xe_step.c b/drivers/gpu/drm/xe/xe_step.c
> index 064b604b5b94..d0f888c31831 100644
> --- a/drivers/gpu/drm/xe/xe_step.c
> +++ b/drivers/gpu/drm/xe/xe_step.c
> @@ -108,6 +108,28 @@ static const int pvc_basedie_subids[] = {
>  
>  __diag_pop();
>  
> +/**
> + * xe_step_platform_get - Determine platform-level stepping from PCI revid
> + * @xe: Xe device
> + *
> + * Convert the PCI revid into a platform-level stepping value and store that
> + * in the device info.
> + */
> +void xe_step_platform_get(struct xe_device *xe)
> +{
> +	/*
> +	 * Not all platforms map PCI revid directly into our symbolic stepping
> +	 * enumeration. Some platforms will have a single PCI revid used for a
> +	 * range platform level steppings and some might even require specific
> +	 * mappings. So prefer to err on the side of caution and include only
> +	 * the platforms from which we need the stepping info for workaround
> +	 * checks.
> +	 */
> +
> +	if (xe->info.platform == XE_NOVALAKE_P)
> +		xe->info.step.platform = STEP_A0 + xe->info.revid;
> +}
> +
>  /**
>   * xe_step_pre_gmdid_get - Determine IP steppings from PCI revid
>   * @xe: Xe device
> diff --git a/drivers/gpu/drm/xe/xe_step.h b/drivers/gpu/drm/xe/xe_step.h
> index 6febb7fac476..41f1c95c46e5 100644
> --- a/drivers/gpu/drm/xe/xe_step.h
> +++ b/drivers/gpu/drm/xe/xe_step.h
> @@ -12,6 +12,8 @@
>  
>  struct xe_device;
>  
> +void xe_step_platform_get(struct xe_device *xe);
> +
>  void xe_step_pre_gmdid_get(struct xe_device *xe);
>  void xe_step_gmdid_get(struct xe_device *xe,
>  		       u32 graphics_gmdid_revid,
> diff --git a/drivers/gpu/drm/xe/xe_step_types.h b/drivers/gpu/drm/xe/xe_step_types.h
> index d978cc2512f2..43ca73850739 100644
> --- a/drivers/gpu/drm/xe/xe_step_types.h
> +++ b/drivers/gpu/drm/xe/xe_step_types.h
> @@ -9,6 +9,7 @@
>  #include <linux/types.h>
>  
>  struct xe_step_info {
> +	u8 platform;
>  	u8 graphics;
>  	u8 media;
>  	u8 basedie;
> 
> -- 
> 2.52.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
