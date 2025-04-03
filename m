Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 190A7C36014
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 22:00:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5C7C10E2F6;
	Thu,  3 Apr 2025 22:00:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TRotA+DN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4382F10E0CE
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Apr 2025 22:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743717623; x=1775253623;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iNoJtuHa9dxBz0HHGwwkEa70n5wXGLrdTj0f2VDaqAg=;
 b=TRotA+DNLxUdfAxTdJcElNknJfAmQn2XuOouIwJBQ/TWE/I/HqP3VKrz
 hmdJtZhT4ccCuR5cR9fDnbhVyygmg+bh4DFZ+yI5lFYrm3Ae3losV/f0S
 FOeJvaWW8Od0i8yd3JI7/oAydauWtKwidtdZsOVHR/LI5rJ8Pwxo8HcNM
 DxFiy7Nx+bOCQFbV8qmi6gssBjcwNJu1Zh4bsV+07fp2eF6qyAfdlkr+X
 mDpQ16pibxLBfd3ujI20PvEBspiAiBhML2+5ykQOCYGFI/IhhJtawchfp
 cxJSkRrKM1cFj65AyXN19JMWmmF7CDh1HPZQYfnMa29kAjIg5Zu+fjY89 w==;
X-CSE-ConnectionGUID: aedDkbN1RdaNYFZOWR9LDg==
X-CSE-MsgGUID: XHLeNvmtQJ2sOIOg9+vLBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="56518918"
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="56518918"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 15:00:15 -0700
X-CSE-ConnectionGUID: 8iLZiUvdRNaNKzbFA6tx6A==
X-CSE-MsgGUID: BtzV/LX3Rim3aax5tYZ2wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="132345602"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 15:00:15 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 3 Apr 2025 15:00:14 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 3 Apr 2025 15:00:14 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 3 Apr 2025 15:00:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KMjT3rZYkk3XhHw1Xs5T7fzpZ9dWwyEjeH1P0RWPgsn06O1HycBn3IHRz037fEKbsp805gyvsCNs8DCzzTvBU+AtjzWI0FMOuOijs4CHwB69X+Dhj45ph0XOBaifAErDX6owC28TZU1qgKr++sicSHvKpzVWk+XjmPM92DwvTXGrAmgYuQpm4lZuA+3PZXjQ+sbjAn1bVZv1xXAFmkZW7PH5CBgJXGxLUIqPCvCFgH5ZAOD4gF/wFArfnsjRxa/r0frTtX1Xh+sRAeSPNMJAHqyiagL9cnbWddkgiA9aoUbl+JEz6sJ43txFdgXkN4eLzX87/CwC1uOO3fYDxsgCjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=79injwaSoXHscYD5eJC2YhA5sVX3xAN/Qo6yEs1uvQ0=;
 b=ar8Ahw2wB/7hlI7E19FgvOKv4a/0BjHkcmrX5GIOcWkED0DIzCL7qSl4pBNB79n/HQQo4RyjS8no0t8U469GhXVcUyO7jOEcDe5qWq6phqQPKAtZJiXpf8XDa3IwpgLZ0RY7hW6cnJQ/sKcPXdEH1RituBt6yeU/TojChequpxRCfDS5l2cvia3zPyVkzKB5DkPyxU4ygUUK2ONzCih/EBQBgyEdLB/6JBxwpnEWFjRR+6CQ9fW3Z6oGST+w9kfZIzKIHULxGEdTG22zStnZCi15MBk2nUITEX0SFd+pxoqXr4aFnW2SNq+oM2uOHxhuwb/lB9dj4rwte22viBWbyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MW5PR11MB5905.namprd11.prod.outlook.com (2603:10b6:303:19f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.41; Thu, 3 Apr
 2025 22:00:11 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8583.041; Thu, 3 Apr 2025
 22:00:11 +0000
Date: Thu, 3 Apr 2025 15:00:08 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v4] drm/xe: remove unused LE_COS
Message-ID: <20250403220008.GU3175483@mdroper-desk1.amr.corp.intel.com>
References: <20250401205703.4179906-1-shuicheng.lin@intel.com>
 <20250403034608.332548-1-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250403034608.332548-1-shuicheng.lin@intel.com>
X-ClientProxiedBy: BY5PR17CA0014.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::27) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MW5PR11MB5905:EE_
X-MS-Office365-Filtering-Correlation-Id: c95b7dfe-f9a8-4094-45d4-08dd72fae7dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fYDUj+smThBpPpRl31/4XbIhpItPZia1ZK/y2U+tibH+rzHUTtoGLByFuWMf?=
 =?us-ascii?Q?3EeJfA8346b7qkMqFfIhNiy1kOohcfUs+VnDme4j24U8k7qAql1+pjhCLRou?=
 =?us-ascii?Q?GkEkOPmjjpdiJCY/4llYRr7CLoeAnDdj6+kGhZcb8wvhPA5YZeky0KbTya0o?=
 =?us-ascii?Q?WVU76i1UlbUXWNTBL1yTv+A/tV15kU/AahFYQlJiJIfvyxCRSpE4Yy/Fekda?=
 =?us-ascii?Q?peOWRqJX0ldpU6aSYwp9NnEcL1p2wVx7Dt2O+XFLV8qiCtEy7npOI2Xvbt47?=
 =?us-ascii?Q?8Yu8ZYRh+yw8ofNqPaeWmkqC0KsiGFQps42/OyeiRjd9CzhPtHwCtcKP/82k?=
 =?us-ascii?Q?a3mFQ5MB5iFhLccly3GGaYKh+silqbnHjVczvzTwpnao6+mWQhOdt6kKoSCT?=
 =?us-ascii?Q?NuyqufbLIAZVIVJpFXPUR5cfT0BvixRQGTz7iFO14mJdp2wCS7c3rNNG/9fC?=
 =?us-ascii?Q?zIREuXkOz7dcYAickJKFUoJp8zlmRvLs9X635qMztK8Ti0xAybmuxiNHHPLL?=
 =?us-ascii?Q?1BrrO1rGAFGGfa0x5vP0kT1qA+Ozss8NcP/huW4oTc+oSwP7zACHv84r0aYs?=
 =?us-ascii?Q?Xg0v6BzsmH8rdICc1WbKUXI6nJ6fQBvlcbnpiot51eKJVzNhmxXSUFs2opoP?=
 =?us-ascii?Q?EAUunIXAeNdk0FSjxJzr9DBjrFXO3e5WDJ8Bxr5GW2zXKTx/9GCtm0tqEAmj?=
 =?us-ascii?Q?rNJ0Xg1wpO6Dg1xyVtQFUGRObleFjJSvjCnd1RPqgpHBckK2kHJdLVdM4bW/?=
 =?us-ascii?Q?GhH/p8f5SEpkJmbJEMJ/2gEzw4d/S3JN3vwVJNPuk0cfOcDAqXDdTZDT5Tma?=
 =?us-ascii?Q?vjNTQseVz+6fbTSoZ3ZYvjl1/KmUlge36Y/1CaEOF7jYhZ5g1g6Iud/cl2Kv?=
 =?us-ascii?Q?eVZ/YIax2hD3JwDDAdBo2SMhLSCp3fkPxGeUsUyKNtDvLiT8hNOvzw2zNwHm?=
 =?us-ascii?Q?XR9DcsB7/xPs21FzZsE7mq9JmmtDVUIV12RQO8SCx3lUVMcKp6LVXrhOqIJ6?=
 =?us-ascii?Q?MdD67sR51u5z9NERvxIyWRbEsiIXRbgJ+F3Q/2o6eY/mnmQUDehfEuEIQ9HV?=
 =?us-ascii?Q?cZ0G3dGM9Fp6kY7Z8bnMOrBwWDhGV5mP5wJkWojJz9CuzSYamzk4OqxzObrc?=
 =?us-ascii?Q?Y2N9hVFf+bZyCOpNAgtrsBzQaoVQakRLCJEPspiVF5nsfEhzXPUHThpTGFbZ?=
 =?us-ascii?Q?LF2fAZEXlTGodWwucESoU7kKSpFGFfb/ew4oo7lxb6M++NfLVe7o6LedbXxv?=
 =?us-ascii?Q?n+YUTcqh+1AzKuDMC9G5kOUZW21lZwDgaeYNAhKNHpGS+Vg+7Oc3ppZhArOF?=
 =?us-ascii?Q?sRdoQJxGA8OijQnZ2fFyiwVog/a9Obmv6xgZwHU5m3XzFu4/zsQKOwXQwKJd?=
 =?us-ascii?Q?4nBYCfY+mxuUsc4UXj9OZwbNClkL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dIkvnVodrjMJl9Y7zqqUAoApxnYDi5bLERFtxxLF3oPo6xv1GYAB1aJGOd8S?=
 =?us-ascii?Q?AlHIo4RnuNnIkSEnD6CfjEADWIzy4QE92uwKK8hutwW9GVhlK5s04qJAkTwg?=
 =?us-ascii?Q?55u1aNzY8FuL6CY8umpZmnDnCg+e7wj28UYUS+mjO/kVLza8jB3LUYt+zjtZ?=
 =?us-ascii?Q?keiA31+kNWBWidS73A59WICyeZ5JDVneRjO/uvxwDsj6ZJCetijjjqiFoSDi?=
 =?us-ascii?Q?xq5u4cJOL8Crzd7JcB8d3pChFfDGhWIXwgM704Dbzn2IOgUvJp2Rk2S2QrE8?=
 =?us-ascii?Q?8+hifoT0RLZwrqHeITf+g0QvEupataKQK1eBSqxI7+oFBmpEZKSiqNMJ8dzm?=
 =?us-ascii?Q?sjBt1IoCQW64Mwqk/Cwu2voSzmu4/YFmuVoBnz3ir/HRIrwDjMCJIjI8GHrt?=
 =?us-ascii?Q?5MzoD1eX59+ssitFeCoEab02Wj5laHQ0izBhvBnPNBQwckIU3GGrUFITuuJW?=
 =?us-ascii?Q?/mrTZxncAHMT9Go6wQbagc6UkGlqGU7nUgRhtuQxl+TNYYvJ+SnDs3kytYL3?=
 =?us-ascii?Q?5nb9USmYCGY1n9ZJYXzkCOhFRKz8dG2ZwX47mTB9YEd38m9vSEhLQOuUTos1?=
 =?us-ascii?Q?dPSLHBJw3UIncIJRJp8RBI8henDrCSLTN7s3f4WM2saKv/2nMyr3vGUeqJWQ?=
 =?us-ascii?Q?I5LybQPntD0FVvBfDKak3kzMdb3EEZOBMU7/tiPoh6qP2XV4/kPa4SnNr4dK?=
 =?us-ascii?Q?BTyEJ8xumI8o6PhbL+wTaAM+Chxxy+zNRbqstEK2XS9t0pFMBADS3bLOsxON?=
 =?us-ascii?Q?FPpOfaZzufheYN8A/Rrj6vJvFDt/dvf1nMbuoW5V0m/Q8FG6Gx+xTZvZ21+X?=
 =?us-ascii?Q?6qduPs4znphpzoWg7JB2dtryIxEGpIsY37uzT0hLpD65tFSS88ynnrKpF56k?=
 =?us-ascii?Q?m5VC727uXrLGV4NZF5OExiMVpxzM85ASfTsT1BcLlIzll3i6u5WNN8Epapuc?=
 =?us-ascii?Q?y0UjNU5/7WDN3/Z5qzJAykH6FPWoi+HLj8OIkodimWk08hvw7JUTTHvApneG?=
 =?us-ascii?Q?mRA0JL+HIDni7v232RFPUxuDLXblcxsnM7ixFNbM79CjMCmDXXRrEpnTLh0F?=
 =?us-ascii?Q?16Gebk0ovCAnGs0WsMvNpg9qpO3GDXzOAcYGpxqvyz4zAZcdsNuzEb1YDCgf?=
 =?us-ascii?Q?OYoVlLlzDyPdFNjBtI31VBNtm+IEcsT0WUqgBuBuk5VwTkvD8YH6AU4j38J/?=
 =?us-ascii?Q?jsh5VZD5vTAXNhhEyquqUemAl9i9pxO0iG932xIwYJu1NS++LUTcFNizTRSt?=
 =?us-ascii?Q?4B9GjY55JUwKzmRXtwS7uuD4WbsJav0ttHrC+/Cc0uUc5XgriYnKuGle+rOv?=
 =?us-ascii?Q?V30i0/vT+jdrfVU74J/h9iEjWTm4jl6KGfMvEJsXCKyTx0kC8iiC5p0SeIc2?=
 =?us-ascii?Q?DEyvA9nTGzx95IxTnDLBgz3BI/+5iI39WwOLRAzYSSy56wcg32iNWH5KyawJ?=
 =?us-ascii?Q?4Z0yX0q+fP68KbyBuM9kmF8nh6bSt/p5VATwrTpiNtopXL8QSL0PBQz+d3tW?=
 =?us-ascii?Q?bmZlPHTYATSPMEm726cPjsI28JOGK8UbzBC+y9Pxl8Q+iJPWnHlHeMAxNx30?=
 =?us-ascii?Q?4zFx629gVn9UKvjTAqG13PQM+NZ61WUvtHVsa9IRLy7lLcZBBlEHBdzPlikf?=
 =?us-ascii?Q?IQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c95b7dfe-f9a8-4094-45d4-08dd72fae7dd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 22:00:11.5389 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DaAKO/YaIlWwo1x51kXp1aTLiCvg4tkkleY50/SbWYIBZ8S28hmi+UVEt9eXga7zrxiFPMVd1lbZx6W4nyLY7/ZbWzl9fY8yeharw1GWpMg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5905
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

On Thu, Apr 03, 2025 at 03:46:08AM +0000, Shuicheng Lin wrote:
> value is missed for LE_COS.

I'd expand this a bit more.  Something along the lines of  "The LE_COS
definition missed passing the value parameter to REG_FIELD_PREP.  This
didn't cause build errors because the entire macro was unused."

The rest of the commit message and patch looks good.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> The value for this field is universally "0" for every MOCS entry on
> the old Xe_LP platforms, and the whole field has been removed from
> Xe_HP onward. Just delete the line so that we don't have an unused
> definition.
> 
> Suggested-by: Matt Roper <matthew.d.roper@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index da1f198ac107..c1590e322ef3 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -62,7 +62,6 @@
>  #define   LE_SSE_MASK				REG_GENMASK(18, 17)
>  #define   LE_SSE(value)				REG_FIELD_PREP(LE_SSE_MASK, value)
>  #define   LE_COS_MASK				REG_GENMASK(16, 15)
> -#define   LE_COS(value)				REG_FIELD_PREP(LE_COS_MASK)
>  #define   LE_SCF_MASK				REG_BIT(14)
>  #define   LE_SCF(value)				REG_FIELD_PREP(LE_SCF_MASK, value)
>  #define   LE_PFM_MASK				REG_GENMASK(13, 11)
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
