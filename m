Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D856C5AD49
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 22:51:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9D1810E18D;
	Wed, 28 May 2025 22:51:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lkF3NEUY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0A4410E18D
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 22:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748472663; x=1780008663;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lgjd1KvT5VuiqqpjqBkAKWGZK4JRNbMXI8I80aJns+I=;
 b=lkF3NEUYEwmxyojodOvqeHvdUC6/mldwDZVmymg9CY9sfZV/nj/0VR8Z
 a7B7XlJECPsxy0DGih8V3+j6lcmgA0gWtKtQ6fKmWJGnQH3ElcMlmDWXj
 dUlYTM1oOkEFTMyJ09MfjkIAWEqZv1tGipI/XFm9+Y7HiyPaJ56yEUkov
 vGUkHuW2eF6vCOuZx6XLjj7eZmIOgq8zpIwNwm9FJuO8vJSdAOh8TBOBM
 znhgC36+fh31v35+SFulUbI6BUjvSAhhkS3ez5//UaAd44U7rmDTHaC77
 FoJe8npNBgx2NzxmOfPTheANMheiEuqpNs8XgMKhOrYdVWGgGvKawA3PF w==;
X-CSE-ConnectionGUID: X/DKThHYRFWea1W/PuN2mw==
X-CSE-MsgGUID: DNio3x7vT/25v436Xhdqpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="53143981"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="53143981"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 15:51:02 -0700
X-CSE-ConnectionGUID: QPF1jiqaQ76P0KPknIkCqA==
X-CSE-MsgGUID: elR5s8q3SPWHcH/f4V3B6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="143355310"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 15:51:03 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 15:51:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 15:51:02 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.64)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 15:51:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yd5RK4a5/nTcOSWrS799TmX7q7CeGZC4psci58MFpL0Qj6Dtd292J6aoWnRFRedAMSmNn3Xc+iiSwreHfoWtU4YWyzCNnm323gSnlUA+mYlGRy3BGnvJqLC3CAW6MTYyBxNkMXk930wkEuAWu4HQr8yd5b7XaNT6ZFdoSjvg3gg+t0wVuA3ukccCdNgBBtBThCxR3Q0iQPL+z+8YD/7drsJIhmQOePHhFGyHYM3mFKWgFTQhict9HQE7a+UlkRJxGIdKZKM/NXZ3/JnFw890Zaa6udQRQnqolKTb1j6/qbySlmRAzEosdCXnjoDudj2XKD4y4fB9eYNP1jc9TXHMuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5DqyVBVibcpVFiDrWxcoX8c5i/gOCgqG8tW9uAU1Dok=;
 b=m91pf3qYXncMvGS4xjRZDQf4SwZD+3b1zHnjpUIWhEZTb7C9mChVY0cmmkTeQ43r4CC/lAl4QHTNUrZt+dcJHAaJ28xTFqGAnBQ/TJEKmXlo5Cj1C+DFzIyVSIhyS6ot7SBegT37Y6yQSrU+V3wx/PNhwDiH05BeExkoM2BUxG8bPCYzsTR1vhcWv2R2n2QRGbp0yMRBSqWpKcZTRZCty88V3IT9Cboplp69QN9Ow+rKwfaSeqgetrEtqQNoNbiNAjP7MrbmeDjNO2PRMZletb7ffWBXWHmjZPBMtvN6Ep0etE4vaRcp3+gO/W3aCaILyxGecdKVwAWqsL67GzhJVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB5071.namprd11.prod.outlook.com (2603:10b6:a03:2d7::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Wed, 28 May
 2025 22:50:17 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8769.021; Wed, 28 May 2025
 22:50:17 +0000
Date: Wed, 28 May 2025 15:51:49 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 04/19] drm/xe/vma: Move pat_index to vma attributes
Message-ID: <aDeThYNk/P1hoGbI@lstrano-desk.jf.intel.com>
References: <20250527164003.1068118-1-himal.prasad.ghimiray@intel.com>
 <20250527164003.1068118-5-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250527164003.1068118-5-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: SJ0PR03CA0100.namprd03.prod.outlook.com
 (2603:10b6:a03:333::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB5071:EE_
X-MS-Office365-Filtering-Correlation-Id: 75ebbde6-7c14-4bba-b6c5-08dd9e3a042a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TnnRd/+iUg6IkfdILiF9E+rwdt6QfEF1RaDOamos/R3KngWJZ/RoNFPUa92G?=
 =?us-ascii?Q?mCJL1a/RHFUGpaB/Acf3dAXiRYazoM9xTwNA9V7EA2ZW0gbxe+6+aybQ64aJ?=
 =?us-ascii?Q?4uw1ucdHji2BHFufAFpJrJ3iFoxdow0iSimzHWgrsNTi6+MRu7yPEwtvMo4y?=
 =?us-ascii?Q?eaOOQE0hg8wkoPECvT6wFCRiEzhy+U+yzZVVrAwO1YpgLoKwqQwjTxJTzrme?=
 =?us-ascii?Q?hC5/QH/4VVmrfYa6/BY5+8dhhh6vwcsl/UDjkFpqStrlvF5fl6dWOBLoASeu?=
 =?us-ascii?Q?HgIogfGu+5LO3Jxg2QYDL89KBN+8k/OBsNEx4h5WBMIBeExI6dKCOkcfemLL?=
 =?us-ascii?Q?tW7lajX2KOKyzlqJ+JPOz9bQm/RIda8I3oyofrA58726rocjERV/pB0tdYff?=
 =?us-ascii?Q?29mqjqGYedXZlEwDrzPEnDfVXPUK2PLn9GRgFqAA/SKR8PKHBKFtqcUzmg9I?=
 =?us-ascii?Q?Bji9dytpIg1lIJfYwDCqkIjaV7u7ixBa3jVBWCuukqwZ9iG5mRnfBD9/32oZ?=
 =?us-ascii?Q?rXIEzCNJ0NfRy9lXS888EE6ut5WLeFxWw2qwLe7jQIbd6G7oAZmAlxrMpTIE?=
 =?us-ascii?Q?kPK+zEclx5/8zRfXfFmfQxXsUb6baAMqhyshUKvUdNIiF9mDEMQcn60Gn3GP?=
 =?us-ascii?Q?nsVAbdO8EshNaFdLLhCW9Y/YAlQKNYOyEOHOpSmDJLMWEP/04iKhw7KMd5fg?=
 =?us-ascii?Q?f0TiDVT0WfiHCo/OKGdgsTn7OViP7Hd5ex9znGuRtmrtD6M8HasaC9976ULy?=
 =?us-ascii?Q?LPrEC2fiIHxXFkK8iiW0Hhd25SqmoLk8rM8QVN2RaHOczsa5MgrevoPIZLSx?=
 =?us-ascii?Q?w0ucfCz7xaZ2fphRyeSyPp90/N9tRGZsuNTurKnXFl5ke+03/jnoBksazi68?=
 =?us-ascii?Q?/bH+g1NfBifVOMTsNtE6zw6Bp645XAfHW/Voaq0EdQgg33roSTwdOBSxX6rP?=
 =?us-ascii?Q?1UJFRG8TOzWMf18I2mAEAOGDbRiB4GRLOEwzxRNsxPBFXCPGU5ncFzTl9vK0?=
 =?us-ascii?Q?i1SZTiV7IZNyE9dlc/j2Hi8oCpBGizayTIs4FiR14ti50aR8nYX546lb9fNj?=
 =?us-ascii?Q?XBN771waQEH/vc6rNWvacEpI3E/YS9qoKRhTCCv0JwOvCA8H6v04lXjr7/YP?=
 =?us-ascii?Q?2e220Sf0LblMguxHFDTMxLs18sjWj9UaoDnfnfwu7SZBIcJWbdBzqg5Te0aS?=
 =?us-ascii?Q?/usbS/hxgEE76th8920MjHulvROs/kynmQvk5iONO7Wms7d+W2MVP+ZO5suP?=
 =?us-ascii?Q?QfW7FCG/ywwMorIL21rlRZgtO5APnT98DvWU/+ZXMFj/hBBmcX+P3FF2bofl?=
 =?us-ascii?Q?F+5cR3bXWeCFVaFdYwfY24eqKkhCvJ6dsxYX8YP7iYex2FMzl7XldSUjX1zA?=
 =?us-ascii?Q?EXF3Wvi3q0UXGGuYuGY6U+UOjJqIXRlicmhiCxq7vGxjO4PWAbGz3y8KcRMX?=
 =?us-ascii?Q?dzdhkZUfedA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nkUUT9upK5NUdNbget1Cvwk6wDfMgfqcBwu1YeIPMqbCahcxaYugpe+S2+mO?=
 =?us-ascii?Q?QhePSN4kVcoqAqfN+Fhz2Y6s9RDHbM0V5leGSKLEFTiavEOEvXMVJwzJjH4x?=
 =?us-ascii?Q?lEolZY15yN8ZS0a9dvslMKOI8RGHwG4bcASYrn5toHBawUm0+LREyAKSaCJE?=
 =?us-ascii?Q?l0Gc5RhF28oKMt0Ncd9LeuTvHfao9f0MeWFBKAFgN8EXM+vPTzIG6fJdBLKT?=
 =?us-ascii?Q?+DnaL9OudOhrJ3yrvQSc1OPPFkph5W4p1TthvmqnBuQUXmGI8WLYt3h1nSh/?=
 =?us-ascii?Q?OQX9DktPtue2S63E9Hslg+kPocjS4EOvxj8GOO86LZ/3zfVo42TnAu3uuxI4?=
 =?us-ascii?Q?P+QcImfWiIQWo0BOGwlqT27mOQjSzYGimvr9dhrg6s9MDr5ezgoW1vEDXwNi?=
 =?us-ascii?Q?oGVMlptg/kxpTCVLOW+ZQLMicOYpPz/OQAF5Amt6pzsPtUlWjYNP4b9ZLooF?=
 =?us-ascii?Q?VAuKJRhW9GkplGTY9FNnoMnbaPUYyJVPl7Abjf6WkWGxtVNIfKK9T5DQwQXm?=
 =?us-ascii?Q?03lrwkALDomsJBvBpeCvM8TfB37Jt+YoX2Yap6P91fIeo+iUSFkt8+4NTEHe?=
 =?us-ascii?Q?OF5S+F+X190Qc3044xdVeThIrh8BGo3bYEUzEnmH4KLZPuqAv990JTWLnyF9?=
 =?us-ascii?Q?Xb6hBVel25MHHThjfGNynbXrNHuWsiDZkKiVQ1wJPrazYasCIszVqYcGUxX2?=
 =?us-ascii?Q?ZUdA9v0w419TKnCrBdSjiWIrZfISSybfs+oZVR5n64tgrrw+7adG7gmR64vU?=
 =?us-ascii?Q?Z/IgR2hwa+JDlP6NSPppcbP8Z3vUmCH6+Li7dg9QwS5rfFYB1kbEJwp6+khM?=
 =?us-ascii?Q?1zGVY0yO4eTDblPkP2EH2LFUK8sKlZVdTvkvATpZ8a5kPlos3sNI+9wLvpst?=
 =?us-ascii?Q?xQzG0bddx7NRHiixwuGPSOPWRB23XN/9kVxSsKsl65DbizfYWSd5J4mA9shq?=
 =?us-ascii?Q?f/KZ00jVc/EESFu/C/BqW7abpBqSAqBLgROpAIB5vnKDkyNfFNKtNg5G8sbU?=
 =?us-ascii?Q?SO3Wh8fGmhy7OdkYd3XHy2mPi0AyHyWVyImR8MQ3I/SEOy+zWpHa9cPbcyRG?=
 =?us-ascii?Q?P9CurN76vVFlLT+KPNZOWcRoJ17lbzcAxDuQUNcInxS+dyOyuQ0LOOTfwJpU?=
 =?us-ascii?Q?GF745vBjme+URPYuGYgo5HEVxPTfGV+PLLR/86O5eHaT95pCg1H8LxdZ8z2q?=
 =?us-ascii?Q?WhQ8UXtsXaFw1JCAYPJmMRSlSPQ2krTnEwwAdiBGWXgLZUsmhksOcoCPM89R?=
 =?us-ascii?Q?NvxQ4Bjdtix5kvMBYiD8VFdTvqtoR18HmMDppVGP7Cn9+AJxOF2Qka+3NRQS?=
 =?us-ascii?Q?xbDS4xhHx/quuLo9ckSb+OVBQOWB5zsBAmpz8Da/ip1GD8PkDjnsn7O0v1bE?=
 =?us-ascii?Q?UzqeHPoW1JtnMpdgnP3R6tU5/FbxWtxqxVr4k/xCTxMug5h4y8g58y2yaPwj?=
 =?us-ascii?Q?Hbt6GPSzj1Ryj88Fj81kDMpumGbjRPCdy8fnWajrphVLgEGXvcOzvzjE0uQG?=
 =?us-ascii?Q?UokirzLlQDPXYZLpLJgYuzfEVuszcxE68ZErb/vTO7rc9i+zJKSHUFhrU/0/?=
 =?us-ascii?Q?5R1q0Ry7ZT7hJfBOANu1jiU2mb7/SBW6YyQows5FJ9GfryaAW0HczfZpGadt?=
 =?us-ascii?Q?1Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 75ebbde6-7c14-4bba-b6c5-08dd9e3a042a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 22:50:17.3633 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fnhgCYjj//gQP4DT3lEnkqJyz+Yy/1YlY8lcwcUY0agjPIDPnmmnmrPOVPN9NlEbNqRYga0DFO+nN6SzXk9iYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5071
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

On Tue, May 27, 2025 at 10:09:48PM +0530, Himal Prasad Ghimiray wrote:
> The PAT index determines how PTEs are encoded and can be modified by
> madvise. Therefore, it is now part of the vma attributes.
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pt.c       |  2 +-
>  drivers/gpu/drm/xe/xe_vm.c       |  6 +++---
>  drivers/gpu/drm/xe/xe_vm_types.h | 10 ++++------
>  3 files changed, 8 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index c9c41fbe125c..39bc1964089e 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -518,7 +518,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
>  {
>  	struct xe_pt_stage_bind_walk *xe_walk =
>  		container_of(walk, typeof(*xe_walk), base);
> -	u16 pat_index = xe_walk->vma->pat_index;
> +	u16 pat_index = xe_walk->vma->attr.pat_index;
>  	struct xe_pt *xe_parent = container_of(parent, typeof(*xe_parent), base);
>  	struct xe_vm *vm = xe_walk->vm;
>  	struct xe_pt *xe_child;
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 7dd8742f7cd9..a48e1bc8b76a 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1221,7 +1221,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>  	if (vm->xe->info.has_atomic_enable_pte_bit)
>  		vma->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
>  
> -	vma->pat_index = pat_index;
> +	vma->attr.pat_index = pat_index;
>  
>  	if (bo) {
>  		struct drm_gpuvm_bo *vm_bo;
> @@ -2666,7 +2666,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>  
>  			if (op->base.remap.prev) {
>  				vma = new_vma(vm, op->base.remap.prev,
> -					      old->pat_index, flags);
> +					      old->attr.pat_index, flags);
>  				if (IS_ERR(vma))
>  					return PTR_ERR(vma);
>  
> @@ -2696,7 +2696,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>  
>  			if (op->base.remap.next) {
>  				vma = new_vma(vm, op->base.remap.next,
> -					      old->pat_index, flags);
> +					      old->attr.pat_index, flags);
>  				if (IS_ERR(vma))
>  					return PTR_ERR(vma);
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 5d4bbe547d0d..2f58c7bb0a85 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -88,6 +88,10 @@ struct xe_vma_mem_attr {
>  	} preferred_loc;
>  	/** @atomic_access: The atomic access type for the vma */
>  	u32 atomic_access;
> +	/**
> +	 * @pat_index: The pat index to use when encoding the PTEs for this vma.
> +	 */
> +	u16 pat_index;
>  };
>  
>  struct xe_vma {
> @@ -131,11 +135,6 @@ struct xe_vma {
>  	/** @tile_staged: bind is staged for this VMA */
>  	u8 tile_staged;
>  
> -	/**
> -	 * @pat_index: The pat index to use when encoding the PTEs for this vma.
> -	 */
> -	u16 pat_index;
> -
>  	/**
>  	 * @ufence: The user fence that was provided with MAP.
>  	 * Needs to be signalled before UNMAP can be processed.
> @@ -147,7 +146,6 @@ struct xe_vma {
>  	 * and encoding of the PTEs for this vma.
>  	 */
>  	struct xe_vma_mem_attr attr;
> -
>  };
>  
>  /**
> -- 
> 2.34.1
> 
