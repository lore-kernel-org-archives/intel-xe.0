Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F823C83F03
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 21:40:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F33A710E764;
	Wed,  2 Jul 2025 21:40:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kj+KO2I9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE06A10E764
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Jul 2025 21:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751492442; x=1783028442;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7vlgTqR9PdQAN1IPUvSYqL6MfifLkqjCcntyhmBj9yM=;
 b=kj+KO2I9VoCWCKEeDAa4WZil5HBFB1fwphVX6ltDiwtkFuT58fUMDxII
 3zvnzlgRnVKm8QPv8vL541L6rAXP5Ddrkm75uMZlQxFLBfXz9U+l4SCoB
 OnUtWO7NbqeOvLb1yjP+VIY4TXRMmAgbWIbZ39XIsblllRP+mYWx78b4f
 FRTehH4ReJHcLmwqX5z8Y0UR20ONe2EAm0aY4uBDlXgLEcwFBtSwccz7F
 Zpnheu7kq5vL0AZSgG5l2BuKjjM6k9oTDcBCnqWDEwnnCPSaA+kFCYb1e
 d5IR3qKgY3iw5EDMMC8pZbvwjwt3NjX7BGLITimDnQaddFJQd13jP2htE A==;
X-CSE-ConnectionGUID: FWA4CIrDToy54m2oSoctCw==
X-CSE-MsgGUID: oOFHpPXvR22qcrgUbEaf6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="71378068"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="71378068"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 14:40:42 -0700
X-CSE-ConnectionGUID: 6QoZfrd7Q5KLuR3r1arg3A==
X-CSE-MsgGUID: t54+AWl4QfiY1+NGq5f9Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="158473193"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 14:40:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 14:40:40 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 2 Jul 2025 14:40:40 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.75)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 14:40:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T2K7BpBWmdlYkXSxOcLpZQljHcI1H+p7BRcFQNOWi6V34kLxphLCgKX58VTv4unLVOc9Yk+9vaHhzyHxebqkSz+s7WnhCVnTOysRytv5jDpfAIL8WCGHA17oC60mwez6kR4I/8/UJ4cbsl5NdhHAN0vEsKiFCz/MZLgIFdbMmpM1vOv9ydwV9ISiRkt5TJfA/2LJowivn4nCwbYs8tWVEy4PTr/EJrK1MFRGCIeaPC0Ays6PlU10ISlBQYY5Nmrkq39e0tFUghwbHFNVVrpCZ2QPPtfEZ4LLbgY30ARsR3gWPJKOkGGpVkvQniH7eERdyywlB9QayYlErQCAYX7y/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zaGoMZ3GYF0DJvGHBemm9V3crKb5GV8AqK2AwdQ/Ptw=;
 b=U+RcaY4RqVf4m4PNP5PF8QNA2gF43s995i1dZx7taKjWj63xg5WImLSqky/ITUnki96b7UuKjWRqcke28nPamPZSukICLbM1TiP5CLVlosjU0VMP2TufwsU+I4whTMR3gWxAIlQ3mHu0eWuStMZKIUUHHqwqoMstuOMl+NB+Zw/Or5zxOGPnc/gVVdAnZvvoNM7getrr1lLtbPiLPEltLyw9RnUddBeXn7kV6WKs0gUVSVqcsm6ln/3XTz5ijSVsniwO7qXD+kColfdxghzW96NiyMYx1rz6uIfDbvuD9y1DjdhH0GbDxEEtPV17l5X/xdfKk9U9SLuQscqje2E2OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8427.namprd11.prod.outlook.com (2603:10b6:806:373::19)
 by DS0PR11MB8084.namprd11.prod.outlook.com (2603:10b6:8:158::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Wed, 2 Jul
 2025 21:40:24 +0000
Received: from SA1PR11MB8427.namprd11.prod.outlook.com
 ([fe80::b156:b61b:d462:b781]) by SA1PR11MB8427.namprd11.prod.outlook.com
 ([fe80::b156:b61b:d462:b781%5]) with mapi id 15.20.8880.021; Wed, 2 Jul 2025
 21:40:24 +0000
Date: Wed, 2 Jul 2025 17:40:20 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <raag.jadav@intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <frank.scarbrough@intel.com>, <sk.anirban@intel.com>
Subject: Re: [PATCH v3 3/7] drm/xe/xe_survivability: Add support for Runtime
 survivability mode
Message-ID: <aGWnRGeEeznxW4Xa@intel.com>
References: <20250702141118.3564242-1-riana.tauro@intel.com>
 <20250702141118.3564242-4-riana.tauro@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250702141118.3564242-4-riana.tauro@intel.com>
X-ClientProxiedBy: SJ0PR13CA0159.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::14) To SA1PR11MB8427.namprd11.prod.outlook.com
 (2603:10b6:806:373::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8427:EE_|DS0PR11MB8084:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bfb6367-fa20-4294-4f0a-08ddb9b10d62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YDWVfdWm79zTjhEq9QkqZW9Z14QmzOlF5uf9ewCWUt5MSYg5t+YuU4nNNeou?=
 =?us-ascii?Q?A5g0ubdbiEVG5YF4MQz9dk7CQHgf9gHgr1f2+pIInlERcoIwBlE0ZYAr+p7X?=
 =?us-ascii?Q?SbJnETKQDTQU1QiFwJLu43W1GmtFs0cjLGYurG16dKlSnSn2pfdCQ35S92HG?=
 =?us-ascii?Q?1f0WYwf1vSlq4NkhXn1X4fCm5fqZV1R+/wLFyyzftM0H2kknnrYcKiV4OC5G?=
 =?us-ascii?Q?0AWPvx8qYQN+SiSmTi6+2tXxL3f2Gaojy+rQg7JAA5l9cLHS7/Tl0SrXWMYy?=
 =?us-ascii?Q?KaFyHsqdxjN9AgdJTbzBARpZuyOyiUZ4psozSuT2QOrbCKPEbRAIroOhmzLa?=
 =?us-ascii?Q?N6V7I4C/qeF2mwJSNE+MBNrFxneBrqpx78d1Oavd3h6d3BO2dJ+zdFOMlpKl?=
 =?us-ascii?Q?vJ5Av7oP3guK9E9lrTJAbZfMFsUv7aAOrno8Q3nOWaWw+vNDcJoffVMaQSdo?=
 =?us-ascii?Q?gKga9++rddPV367+sOJldrOAkkD7Tg3YrZBIdJnHHd/iV69Ock9ysD8k3bzg?=
 =?us-ascii?Q?Pj0MGYm338wnVu/Emever1NFaCUArsYCwgmEq1McMwFHRpIFMriHEN0D2FXD?=
 =?us-ascii?Q?qjMg3xaSL7Qyz1HsJeUf9iW7NEFwGcXKiVLzYVNSXdOlZbYvTHCSl8R4DRBp?=
 =?us-ascii?Q?EvKNuEVlOfpbngU5Dd+oiucnF5BwbJgGRNHMseUgjXbfD+vLZ/Na2+0Vt/ar?=
 =?us-ascii?Q?5mk7XogrwxR2YbkUZn83SMidkr0Yp/qA0mmsExrck7CEGQG4kK9/uMKJSxvE?=
 =?us-ascii?Q?CljPU9l/OqF2YbaCIkXfwo7gTGcDdaMMtYiBpMF3QBv3MJkH3BcUvd7VaN7W?=
 =?us-ascii?Q?7Vdqi9msH2UYyrpByaJBv0o0OCZWq0tAj+1Ym78WK74nHkBfhLYYiwTi0Ygr?=
 =?us-ascii?Q?WFHIl9QJgx26GdXX5YB51LMa/9Yo5TYR5MYchI0Uzm6/pgOiJfDYFsJI9wRN?=
 =?us-ascii?Q?6zHOH6sdPQI6nOOaU9TuUfPpmasPS2PluDhlNGAE0ZnYIS41cW0O/it3FZ/D?=
 =?us-ascii?Q?97+6MWZGbDeEKQOMiTyMcOd2Zs3lA5YngQOpXUoz3Svuk/3cw8mgXThD9gnC?=
 =?us-ascii?Q?abG7s6NwwkhRMqViUoJSfvS3x4xxlytlPFuLf6v4c1IhCVfnB54QBGh4AB6f?=
 =?us-ascii?Q?w0iOEuRgkcbpsXOqaoYWK3e2qX+QzxpGBV8pyYW0jtjEZrELdy2/OoeeMHYo?=
 =?us-ascii?Q?La8PeNdWmyZP/XxIHFlW8Xug9KvF/pejP0Lgtt+oWgX1uWb1XWQXwQLxEf92?=
 =?us-ascii?Q?HAIXsFLAkhjGCdHJWk+I+WLyod9Tgam0NnYGhIoBxwrEsO3M2liVkzXecLNj?=
 =?us-ascii?Q?ugB58q9My9Q6fFOIAYIoAoyRhYCKK3d2+LXJUiYLjARSvdHATQJp3qBVfItT?=
 =?us-ascii?Q?6WfyjTXLUT8H95K1QDhwjSEwAquoOTPV1EA3J4SylUeJwbsG+yT4ALTufoNH?=
 =?us-ascii?Q?CemA5qdzS2o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8427.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LT88QO3RyWsR/c/pg3L7sePyKBkpaAiobViikuxsztnFsCxU14rPrbBA12r+?=
 =?us-ascii?Q?YAVTsuqXu7AeWKaFiBtAAJdWSV5MK95TL2fTCutnJitKQnH8g47cUHDT7n2X?=
 =?us-ascii?Q?QgqLdnidll+HQtjGjQHJe5YdjXczYqLLKDP6WLg+YzAM18g7W8+EuyptPo8M?=
 =?us-ascii?Q?SV0w89uKDtMDJZBVx2aRMNJqHKb/LdQwkwA/qwbN8LhLM5N0adQqBH75lFpo?=
 =?us-ascii?Q?I1r8vdm4NAVnofZTRwsRECWiCPyLiyZD9wHis9imGkR9kjB0BPc8p9f8+tTV?=
 =?us-ascii?Q?OvwArLIue5bhfO+2UohWiLoaDsZ4ZZjLZDRMFUjwxrMPQEeh49MTfps7O2FO?=
 =?us-ascii?Q?vrLleZzwyPuwE5iC2m1YcymkrUt9IlISSBZfo2DIoZpGbfC2alcYMPImnfne?=
 =?us-ascii?Q?aZdSMd8fpexHwD/MEszSDHC3XUW7Mv1BScF9qsB9FDxIVBdcw+QUIW4C79Hg?=
 =?us-ascii?Q?e5k0tjRG/CwbxRfdEsq/rs8XG68vwN2t9ac6K/3Bl+w7ss8euBApDXmtpXAD?=
 =?us-ascii?Q?TlEMWcZKTEqnraEge/H6cNtJWTfy4hzqwtXgqkajkdQZ01xCnDx77p8652S1?=
 =?us-ascii?Q?IvhQp3SvMVK4/v2UQrYpO0L3ioUSRkhOKJ0WNlT76Ht2+55Wnf9MYzuov85X?=
 =?us-ascii?Q?Smk8SuDXskUAJAesL5ZzSpXVzKTOmVx7NJMAsxc6DhVbwXbbu4dnb1q3EwE6?=
 =?us-ascii?Q?o480Ei+50XI89X9+mfxw8kkEUV/GoyVq0FxJlvrKZC/VVfRvysfp6BM4FXHv?=
 =?us-ascii?Q?m7LjgqRQ39xXtRRX74P0YCiXcFfdZKb2+focNEh5KGdpdz7z26B3smsmTLsS?=
 =?us-ascii?Q?eWfQv3xdidliyhl5L/NpW8lgJCNNF0byo27RU5D6yRtZae1gAngt6ETlgSL7?=
 =?us-ascii?Q?ByIw039+K+W0Mara19st1wOzMfT4DhVyhkIXpbdym2PFizai/PLxPb3kFR5K?=
 =?us-ascii?Q?41k7z6I4LtMIibGgKUG0Tk7eQXAJQDGGD+sQBt496gse8dit+o8WswRRgU7h?=
 =?us-ascii?Q?zgwYXkxYSxx22wSOW5vwV0WomGI8Hzh0aBwxOU4FAxN1n9Uy7Hl7z3cmlFTe?=
 =?us-ascii?Q?U0rr/eMtwtABW59Hz/cdUarWy11w9brhTrccAJquoEzK+5lR6UlSigEgNBsH?=
 =?us-ascii?Q?fCvOrqk1m3X6i+RBPrc04I9F/YtvluYxWizIV4y3BQ9jHE66vfuD7Dh1R9cJ?=
 =?us-ascii?Q?FBRpK6XFmVDCr80z2yiN8ysuc5QtfhRLacMQjfrI0eFFlDOZgp3UtUpZvv3K?=
 =?us-ascii?Q?7t/cPqCXMs8/WjLxSNQG1Ksf9x8pVKCYRHN3jVH2yqkD0FTuYsZjYRqXpSOb?=
 =?us-ascii?Q?LSP80/Vyt7gMFC1EtxXjR61OBh+oKWibwe+7n/OTg9YT8PGlsETqA82CIB8l?=
 =?us-ascii?Q?7dC1zLgmNEzU66gQykC1byRNS90Q7VgBMNKCBBB9MnUKLcy9C2sS2wSSG02n?=
 =?us-ascii?Q?At7xO46UNmSqBUKpG/Suo2uCNWg4Rua7F9CQXhuFHr8MxVUrV9srbyeay/h2?=
 =?us-ascii?Q?DcRNnEOEJ3VUAW5IYmKlQdfZjFhIk0lqRwoZJOJQadVLEUgwpDW+iTxQ/Yy9?=
 =?us-ascii?Q?0hf4EdQb9eiOFYd/PwmpVK1jggofH5HnXfzCLaPQ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bfb6367-fa20-4294-4f0a-08ddb9b10d62
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8427.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 21:40:24.4073 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 74gl6e0D/Yz5Sr3Di+Fuw6aVMucxM35U4DOelSH//sPupfPgQCI2ZHmZoTvykpZmswPfuv03VGPVvzNrQEFEKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8084
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

On Wed, Jul 02, 2025 at 07:41:13PM +0530, Riana Tauro wrote:
> Certain runtime firmware errors can cause the device to be wedged
> requiring a firmware flash to restore normal operation.
> Runtime Survivability Mode indicates that a firmware flash is necessary to
> recover the device.
> 
> The below sysfs is an indication that device is in survivability mode
> 
> /sys/bus/pci/devices/<device>/surivability_mode
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c                |  2 +-
>  drivers/gpu/drm/xe/xe_survivability_mode.c    | 26 ++++++++++++++++---
>  drivers/gpu/drm/xe/xe_survivability_mode.h    |  4 ++-
>  .../gpu/drm/xe/xe_survivability_mode_types.h  |  8 ++++++
>  4 files changed, 35 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 4a38486dccc8..5defa54ccd26 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -716,7 +716,7 @@ int xe_device_probe_early(struct xe_device *xe)
>  		 * possible, but still return the previous error for error
>  		 * propagation
>  		 */
> -		err = xe_survivability_mode_enable(xe);
> +		err = xe_survivability_mode_enable(xe, XE_SURVIVABILITY_TYPE_BOOT);
>  		if (err)
>  			return err;
>  
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
> index 1f710b3fc599..e1adcb33c9b0 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> @@ -129,7 +129,10 @@ static ssize_t survivability_mode_show(struct device *dev,
>  	struct xe_survivability_info *info = survivability->info;
>  	int index = 0, count = 0;
>  
> -	for (index = 0; index < MAX_SCRATCH_MMIO; index++) {
> +	count += sysfs_emit_at(buff, count, "Survivability mode: %s\n",
> +			       survivability->type ? "Runtime" : "Boot");
> +
> +	for (index = 0; survivability->boot_status && index < MAX_SCRATCH_MMIO; index++) {
>  		if (info[index].reg)
>  			count += sysfs_emit_at(buff, count, "%s: 0x%x - 0x%x\n", info[index].name,
>  					       info[index].reg, info[index].value);
> @@ -169,6 +172,10 @@ static int enable_survivability_mode(struct pci_dev *pdev)
>  	if (ret)
>  		return ret;
>  
> +	/* Only create sysfs for runtime survivability mode */
> +	if (xe_survivability_mode_is_runtime(xe))
> +		return 0;

I'm double confused here:
only create when runtime, but then you return if runtime?
why to only create on runtime mode? or why to skip here?


> +
>  	/* Make sure xe_heci_gsc_init() knows about survivability mode */
>  	survivability->mode = true;
>  
> @@ -189,6 +196,17 @@ static int enable_survivability_mode(struct pci_dev *pdev)
>  	return 0;
>  }
>  
> +/**
> + * xe_survivability_mode_is_runtime - check if survivability mode is runtime
> + * @xe: xe device instance
> + *
> + * Returns true if in runtime survivability mode, false otherwise
> + */
> +bool xe_survivability_mode_is_runtime(struct xe_device *xe)
> +{
> +	return xe->survivability.type == XE_SURVIVABILITY_TYPE_RUNTIME;
> +}
> +
>  /**
>   * xe_survivability_mode_is_enabled - check if survivability mode is enabled
>   * @xe: xe device instance
> @@ -251,16 +269,18 @@ bool xe_survivability_mode_is_requested(struct xe_device *xe)
>   * Return: 0 if survivability mode is enabled or not requested; negative error
>   * code otherwise.
>   */
> -int xe_survivability_mode_enable(struct xe_device *xe)
> +int xe_survivability_mode_enable(struct xe_device *xe, const enum xe_survivability_type type)
>  {
>  	struct xe_survivability *survivability = &xe->survivability;
>  	struct xe_survivability_info *info;
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>  
> -	if (!xe_survivability_mode_is_requested(xe))
> +	if (!xe_survivability_mode_is_requested(xe) &&
> +	    type != XE_SURVIVABILITY_TYPE_RUNTIME)

with this, the function name and its reasoning above is incorrect.
"xe_survivability_mode_enable - Initialize and enable the survivability mode"

no, this function is not doing that anymore. Rather it is getting log
from fw about the boot survivability, or at least initializing the
struct for that. It probably deserves a refactor with some better
naming on the purpose.

>  		return 0;
>  
>  	survivability->size = MAX_SCRATCH_MMIO;
> +	survivability->type = type;
>  
>  	info = devm_kcalloc(xe->drm.dev, survivability->size, sizeof(*info),
>  			    GFP_KERNEL);
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.h b/drivers/gpu/drm/xe/xe_survivability_mode.h
> index 02231c2bf008..559d1e99b03a 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.h
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.h
> @@ -9,9 +9,11 @@
>  #include <linux/types.h>
>  
>  struct xe_device;
> +enum xe_survivability_type;
>  
> -int xe_survivability_mode_enable(struct xe_device *xe);
> +int xe_survivability_mode_enable(struct xe_device *xe, const enum xe_survivability_type);
>  bool xe_survivability_mode_is_enabled(struct xe_device *xe);
> +bool xe_survivability_mode_is_runtime(struct xe_device *xe);
>  bool xe_survivability_mode_is_requested(struct xe_device *xe);
>  
>  #endif /* _XE_SURVIVABILITY_MODE_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode_types.h b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
> index 19d433e253df..01f07d9c4124 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode_types.h
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
> @@ -9,6 +9,11 @@
>  #include <linux/limits.h>
>  #include <linux/types.h>
>  
> +enum xe_survivability_type {
> +	XE_SURVIVABILITY_TYPE_BOOT,
> +	XE_SURVIVABILITY_TYPE_RUNTIME,
> +};
> +
>  struct xe_survivability_info {
>  	char name[NAME_MAX];
>  	u32 reg;
> @@ -30,6 +35,9 @@ struct xe_survivability {
>  
>  	/** @mode: boolean to indicate survivability mode */
>  	bool mode;
> +
> +	/** @type: survivability mode type (boot or runtime) */
> +	enum xe_survivability_type type;
>  };
>  
>  #endif /* _XE_SURVIVABILITY_MODE_TYPES_H_ */
> -- 
> 2.47.1
> 
