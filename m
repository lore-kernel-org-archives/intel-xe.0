Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD8A6CD6E55
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jun 2026 10:40:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DD4E10FBB1;
	Wed,  3 Jun 2026 10:40:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D/95B5EF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FDD010FBB1
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jun 2026 10:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780483227; x=1812019227;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=3GoQ2wi4h6xy8uaRXJ5hodL7P0MXycdwP3NDinceGTU=;
 b=D/95B5EFQDEcQ+WGxQcG9carUyxH/5ign8guoR4t4OTsoRLTkF7dnnhk
 Zg0qX0rMw+wxcqSWGaKa+RrdiXtKWi0FziTDTi+HgzsvHtLeI9J/486GI
 fXif2ohOye7hdbuM9TLtFc9D1w+Uoinhh9/dXO3su1L8vDXuV6hrjJ/01
 9msIlIVGzePR0VtvBMBA38rURBsONzlRqx57nxZyPb9lNSnhfw8ypLnEm
 T9IDbPk/7wYhgJR+UfSCPzBT2PxDvw6OFQmSWOC8GGqEPf+bij9VbtBvT
 Mp6JSfMgyS1jA8l5Jc5bdhTYqAZLWIPwSNN4hHlW2WobKNwKkYABptzI3 Q==;
X-CSE-ConnectionGUID: 2BrIeNwKRH62rWtmDnxRAA==
X-CSE-MsgGUID: m2KUZ9OjTTCWQdRuzLgKyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81467351"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="81467351"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 03:40:27 -0700
X-CSE-ConnectionGUID: x0Io4eRzSoSrOiZk79qyNw==
X-CSE-MsgGUID: /ZQx2LNoQayaSMFoAD0q7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="267833794"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 03:40:26 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 03:40:25 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 3 Jun 2026 03:40:25 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.40) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 03:40:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BFTlCdm35dHeLeKkWXEhHZJHUl6aK0QkcKdJoHqwMSoi1blZKd+x4VCi0YUNnnnIWCb70ckyuTiMfoaODNHDl8dGPz/p/SVMToIbPxnGT7N/VzRygY7PrMeNyVMBXUWwJdzFuPPUqM3to53mra9enTiYhyY6A5mksTgYU5MSXcf0n/qa7cJRmWJ/DgbNSo8/emqSIkiUvzepbbmQqRTyw3X19gc9mUquLxL4+sh24peb9OVVp+I/wWoCbvG37frf6sDvuF0qkgEBQyObbcmTWiZYs9ZvhVvVYjZ7B3HHkEC8HoGQ2GDEK9mK08WMZzfHvgxxjv0h8g7YKDRn+Fbk1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VjHgT54soO0JGMMJ8hjObXjv1nHaBvr9ps/c+yKTuUY=;
 b=wxjJJmv48/JgPG3rTHZn0UDcGQH+hpYapzpI3BcXg1ENlU5BEj/cdSOvPzbTG22y+Ag87jpZcQRjmcs96kCV7Aheyz2yzSi792WE+jolS2qBEok5wXlfkl9GEbu7FQrMGD69lbRflspOO9HXS5zXe34wCY1K3q/d0IbNb4kMQcQAIlH4wndW8MxanBdEmSyFGDaX2uI3biO7lyt1iepblHWJG2lkdstoh0fndya9VecSV/H2QTBMY7niYfxVSKOsTkUkBhwGmrtZFROJtc1NVzug1eUKmSDJLBGmLSRlhmWwFHxgak+Jfvn8Fm5IGcqOIGFpezZUzTyydNd/MRYNfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by DS7PR11MB6270.namprd11.prod.outlook.com (2603:10b6:8:96::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 10:40:23 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 10:40:23 +0000
Date: Wed, 3 Jun 2026 06:40:17 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <riana.tauro@intel.com>,
 <michal.wajdeczko@intel.com>, <matthew.d.roper@intel.com>,
 <michal.winiarski@intel.com>, <matthew.auld@intel.com>, <dev@lankhorst.se>,
 <jani.nikula@intel.com>, <lukasz.laguna@intel.com>, <zhanjun.dong@intel.com>, 
 <lukas@wunner.de>, <daniele.ceraolospurio@intel.com>,
 <badal.nilawar@intel.com>
Subject: Re: [PATCH v8 09/10] drm/xe/pci: Introduce PCIe FLR
Message-ID: <aiAEkacJRi3Obwo2@intel.com>
References: <20260603101814.916948-1-raag.jadav@intel.com>
 <20260603101814.916948-10-raag.jadav@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260603101814.916948-10-raag.jadav@intel.com>
X-ClientProxiedBy: SJ0P220CA0009.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::25) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|DS7PR11MB6270:EE_
X-MS-Office365-Filtering-Correlation-Id: cb26560d-3944-44a6-ad16-08dec15c83f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|56012099006|18002099003|22082099003|3023799007|4143699003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: upeD/LHXhGUVNnm93f7my5xSgvKcQY2B/vei94uyTbn6FnK4FAEvQzFxabIKGzwlz5ZCvgX2y9DZKv5YfJ6RSH7U0u9dRTtmPER5umScM/lsSmaPtEIkoLiEZD+UjkZc8QnyTxQL8bxj48UJi+e7WnJzjizSwgibKaEEUBFwP8UhxnxDqyAh2+Ar0BD6NbjnTbhaB2z0GOK/og4ejTlPevKXYucuYkwKpyiyImbZPnHz2/S7o+9Myf2CKlO2/eq11qZVFlis+RY5EHQFk5iESsAS2uk8BbKT+5HwliJmp3m8oxURGxLzS+FBYOuG04rpHXKsqBiA5ydrd9rKPN+TTXJGQp68gMZkXY8TSuoRYzrJLJq8qlfBChFqNBWENbhh580dMj2Q6tUt2pgCq69E3IDgI3ZxyYkQiRefWuKNUnmvnpkEbR3NGtNSsbEexTQoayZb98fGnacxPLTyj1AJbnu42DyWghR/kLDtrXBFyr1XQ8i/xuWiO9aUR/wMy/+MEHnp43vfdCgMAEnxXQfdeYcR3rextTxrJrRq3AIFqrSPRu/l24jch2orR+QT0YTx/nG7ZFepnW3Aj1e3mnYz5bPbXWSp+aLHIe5wU8NyNX7GCYyJFosT1TOWI/B0pBMBKYtm/ETmL2hmGh79wMqff2u+8DdGTHaFtBIgAZ7MOSbJclLXQOD3k15OfMtKUfau
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(56012099006)(18002099003)(22082099003)(3023799007)(4143699003)(11063799006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?oS2zw9zSVpc3Qo4vL57gKF/rFGT0QTapUd+eLGEpDNg2F6HmnlRjrQwxFD?=
 =?iso-8859-1?Q?8V/GFRjQtO6xHA6MXcO/UDTiY5VTWY9QsEbVyQaIN6zG8g+1dr/eqwH/Uq?=
 =?iso-8859-1?Q?Ye0dqXm3ry18OHOJDmRnhY4Af/bS/K0yA7TYIdvVeTz9pk4bdnfx7iOBti?=
 =?iso-8859-1?Q?c/FkoOO0Oho+c0RCchtoKecsT4Zzq7Qb3zfB1C2hoy3auBOuHSAnARD1k4?=
 =?iso-8859-1?Q?hYUaIYIS+h1KG0KAxB+MlpF2gerQd8uMGQxDMX7u30sURe12DL/NxrYh2g?=
 =?iso-8859-1?Q?CJiQ1jaGtUwsOOBdF55bnoTSNbwbKE70lu4og+rdFWPcb31xGvg7aSz4yt?=
 =?iso-8859-1?Q?ZkX7CJYo8eUIs8nAs0PAWRrVZaePXfC7BDDHrnc8kLJBwqxJIp1+b7d7jN?=
 =?iso-8859-1?Q?IwEKR/lp6mhHbe8t5m2uIbiTG8WEs1GnlDVQ3A9EnOFWhAhsVt0bsoB0f0?=
 =?iso-8859-1?Q?4q+5oq4uNmkn2IFG1cenHHmnonEWyePynEQNqcCCKbi7hpMovvBjVsjwIi?=
 =?iso-8859-1?Q?2ZtIBRDKUeFwLvCfZWAfGwLh85hibpQJDLG5ksK+ujU+L7f4sM/p33h8nv?=
 =?iso-8859-1?Q?PXwNIhOvIjZIRfNVF243SF6Mm+UUL2Wg1CBCBENjYtErY5yx7n1Thu9HD5?=
 =?iso-8859-1?Q?MR69pfsJ5QW4AgU9ijBPP/pvqYIWAe+y6PpsTQ7fXTeppMSoAxNWoNFszt?=
 =?iso-8859-1?Q?Kbv5KnBG+ef/FIisncOJ0AZLVWYuVgEyGi3DotQr31LhnrEKQq3JDR+/PG?=
 =?iso-8859-1?Q?pbQYe7VmrkGW1x7R6hQy+6KLi6xgO7vewsuLwJmMEQ8WkDeq+L8fGIkIc2?=
 =?iso-8859-1?Q?ytV3AuxrRexmv26lebcPC35g9r5xEHxsq1vOoNRVYxiDojmnNqbvjoyoSp?=
 =?iso-8859-1?Q?dHFceuRYatfgtplPOEtfA3e9RW2GDLeFSH6+CXQGzfN1PAh83R3Kc31QMR?=
 =?iso-8859-1?Q?GBBszishhZzNeuee8stpB5fFNU99nWM+RYQwhymBiTFQcEiPWHj/jR6WMf?=
 =?iso-8859-1?Q?SfdvKnZIndh4ImeHENU84bTZ/SfAvvqKNoPF0zSGUTwL5ZwM1/45tkhnwA?=
 =?iso-8859-1?Q?3Al8yAUpCLYe5jZZcZ4lqC2O0tF/gjDOMtTxfd0B/3ZP4/EDyf2uC2EEDO?=
 =?iso-8859-1?Q?QAANXJ6cax7a1iVRZD+BjSGr60MdRuynRfvBcNXuKshCM24omKnOtVRWrM?=
 =?iso-8859-1?Q?UUgCCy3ffBlELnNY0K9sRirhNWH+irMeB74yiNTLmzomPElUa02TbzUKOS?=
 =?iso-8859-1?Q?ILECOrF+SVCY5y06XwAQVHvSxeHCgIlouJacg/VeoirbnvVms9HoT+DWgz?=
 =?iso-8859-1?Q?RQlrAG60qQ8eM+yCjU5OszDrnOhrhorCAtx+srVDVYiIfR/3w5E2ZWkLVD?=
 =?iso-8859-1?Q?L7uHzrymDTViPm1Ov54n8fKn7G08GtDdEcxttY1UuCYKFjVjxSRe7iy2M3?=
 =?iso-8859-1?Q?ZV/o6d474AzA+wBjxJTotfpUpw/JVmdtK/NiwMxSoAq3EGNiwyp4UHRwh3?=
 =?iso-8859-1?Q?9nRXoqnSavHT8QDNnqr3/T2D4twdW5G7qwo76dWVF4llbKHh4NPrtvzqPm?=
 =?iso-8859-1?Q?wkjNGoTI2CNlrkdBTnl4glZiKNEpYsZYnPAy4R8SzgbrzZTlq0m4exW9ad?=
 =?iso-8859-1?Q?TyyXWOj43wUZSdb+exlVk7UP4IZjGueI62zFGMlX/iMsDT9A8O7ijELxvg?=
 =?iso-8859-1?Q?hIcbNsxnQRLi68Dn0V2IjDD9AvvNTAWXZOgCJzA2Kl3N3eb8l15GYHWsYB?=
 =?iso-8859-1?Q?zf6MZXtslyoGfcXA59j0gE5d89mLetUcufouwwvzlImwgBxIYCS1s/WSI2?=
 =?iso-8859-1?Q?oIei/x1DwA=3D=3D?=
X-Exchange-RoutingPolicyChecked: hmQT6OwlhLiG0fhlERy2cE1pYESHNNyOyGZqNNbI3l1hFrWWIt4Bmtc7ho9QkTYLzv9L55gHHduijSQWehJCI86Wqk14iGIogQjSyVWmaO65XbUP5tEX/2vsKEZ82lNllnfyBHS+Mm1+IKXcc6MP1FGro8GkSwzdFJNFa8qrAQsTGJ27QkMj9JLthN5TNdqnsCTU4uaQ3F1Dp2qz22Vk8BUeAnq5c16andta2ywB9QrZYUkOWhk5zTj2Vu0kXnNBE3vRIo+ePhwX3MUDeDCcGjVYs5klJbQZXOd/uNIscZzaw3U6kxcdJNfsShIh0GIWmvrF+O5lGIwOzcF6B7zB8g==
X-MS-Exchange-CrossTenant-Network-Message-Id: cb26560d-3944-44a6-ad16-08dec15c83f3
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 10:40:23.0574 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AWEaspjqy4ZavWUvrkQwIcdtdvumbgZpFY/a+pQbW58R5tXt26bzlzhvyOL6l0EqhyzCFzWE+579AMC1gqLvpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6270
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

On Wed, Jun 03, 2026 at 03:47:09PM +0530, Raag Jadav wrote:
> With bare minimum pieces in place, we can finally introduce PCIe Function
> Level Reset (FLR) support which re-initializes hardware state without the
> need for reloading the driver from userspace. All VRAM contents are lost
> along with hardware state and driver takes care of recreating the required
> kernel bos as part of re-initialization, but user still needs to recreate
> user bos and reload context after PCIe FLR.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> Tested-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
> v2: Spell out Function Level Reset (Jani)
> v5: Prevent PM ref leak for wedged device (Matthew Brost)
> v6: Add PCIe FLR documentation (Daniele)
> v7: Refine PCIe FLR documentation (Daniele)
>     Introduce xe_pci_reset_skip() helper (Lukasz)
> ---
>  drivers/gpu/drm/xe/Makefile          |   1 +
>  drivers/gpu/drm/xe/xe_device_types.h |   3 +
>  drivers/gpu/drm/xe/xe_pci.c          |   1 +
>  drivers/gpu/drm/xe/xe_pci.h          |   2 +
>  drivers/gpu/drm/xe/xe_pci_error.c    | 126 +++++++++++++++++++++++++++
>  5 files changed, 133 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_pci_error.c
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 09661f079d03..091872771e98 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -101,6 +101,7 @@ xe-y += xe_bb.o \
>  	xe_page_reclaim.o \
>  	xe_pat.o \
>  	xe_pci.o \
> +	xe_pci_error.o \
>  	xe_pci_rebar.o \
>  	xe_pcode.o \
>  	xe_pm.o \
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 66e673e4e3e7..ddcfcf1ad0ac 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -480,6 +480,9 @@ struct xe_device {
>  	/** @pxp: Encapsulate Protected Xe Path support */
>  	struct xe_pxp *pxp;
>  
> +	/** @flr_prepared: Prepared for function-reset */
> +	bool flr_prepared;
> +
>  	/** @needs_flr_on_fini: requests function-reset on fini */
>  	bool needs_flr_on_fini;
>  
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 3165686e3e04..205ba01e713c 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -1351,6 +1351,7 @@ static struct pci_driver xe_pci_driver = {
>  #ifdef CONFIG_PM_SLEEP
>  	.driver.pm = &xe_pm_ops,
>  #endif
> +	.err_handler = &xe_pci_error_handlers,
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_pci.h b/drivers/gpu/drm/xe/xe_pci.h
> index 11bcc5fe2c5b..24e51a71a959 100644
> --- a/drivers/gpu/drm/xe/xe_pci.h
> +++ b/drivers/gpu/drm/xe/xe_pci.h
> @@ -8,6 +8,8 @@
>  
>  struct pci_dev;
>  
> +extern const struct pci_error_handlers xe_pci_error_handlers;
> +
>  int xe_register_pci_driver(void);
>  void xe_unregister_pci_driver(void);
>  struct xe_device *xe_pci_to_pf_device(struct pci_dev *pdev);
> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
> new file mode 100644
> index 000000000000..21d8a97e38cc
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
> @@ -0,0 +1,126 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include "xe_device.h"
> +#include "xe_printk.h"
> +#include "xe_sriov_pf_helpers.h"
> +
> +/**
> + * DOC: PCI Error Handling

Perhaps 'Xe PCI Error Handling' on this and on the next patch as well.
Only to avoid some ditracted doc reader to think it is a main PCI section?!

> + *
> + * Xe driver registers PCI callbacks which are called by PCI core in case of
> + * bus errors or resets.
> + *
> + * Currently only Function Level Reset (FLR) callbacks are supported. PCIe FLR
> + * wipes the VRAM and resets the state of all the hardware units. Therefore, the
> + * contents of all exec queues and BOs in VRAM are lost and the hardware needs a
> + * full re-initialization. The way Xe driver handles it, is pretty much similar
> + * to system suspend/resume flow with a few notable exceptions.
> + *
> + * Prepare phase:
> + *
> + * - Temporarily wedge the device to prevent userspace access
> + * - Kill exec queues which signals all fences and frees in-flight jobs
> + * - Stop the scheduler and all submissions to GuC
> + * - The fact that FLR is needed is because hardware could be in corrupted state
> + *   and access unreliable, so skip memory eviction due to untrustworthy VRAM
> + *   contents
> + * - Remove all memory mappings since VRAM contents will be lost
> + *
> + * Re-initialization phase:
> + *
> + * - Recreate kernel BOs due to skipped memory eviction in prepare phase
> + * - Restore kernel queues which were killed in prepare phase
> + * - Reload all uC firmwares
> + * - Bring up all hardware units
> + * - Unwedge the device to allow userspace access
> + *
> + * Since VRAM contents are lost, the user is expected to recreate user memory
> + * and reload context.
> + *
> + * TODO: Add PCIe error handling callbacks using similar flow.
> + *
> + * Current implementation is only limited to re-initializing GT. This needs to
> + * be extended for a lot of components listed below.
> + *
> + * - Proper re-initialization of GSC and PXP for integrated platforms
> + * - SR-IOV cases which need PF and VF synchronization
> + * - Re-initialization of all child devices registered by Xe
> + * - User memory handling and MM corner cases
> + * - Display

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> + */
> +
> +static inline bool xe_pci_reset_skip(struct xe_device *xe)
> +{
> +	return !IS_DGFX(xe) || IS_SRIOV_VF(xe) || xe_sriov_pf_num_vfs(xe) || xe->info.probe_display;
> +}
> +
> +static void xe_pci_reset_prepare(struct pci_dev *pdev)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +
> +	if (xe_pci_reset_skip(xe)) {
> +		xe_err(xe, "PCIe FLR not supported\n");
> +		return;
> +	}
> +
> +	if (xe_device_wedged(xe)) {
> +		xe_err(xe, "PCIe FLR aborted, device in unexpected state\n");
> +		return;
> +	}
> +
> +	/* Wedge the device to prevent userspace access but don't send the event yet */
> +	xe_device_wedged_get(xe);
> +
> +	/*
> +	 * The hardware could be in corrupted state and access unreliable, but we try to
> +	 * update data structures and cleanup any pending work to avoid side effects during
> +	 * PCIe FLR. This will be similar to system suspend flow but without eviction.
> +	 */
> +	if (xe_device_suspend(xe, true)) {

perhaps err = xe_device...
if (err) {

> +		xe_err(xe, "Failed to prepare for PCIe FLR\n");
> +		/* Allow user to retry FLR */
> +		xe_device_wedged_put(xe);
> +		return;
> +	}
> +
> +	xe->flr_prepared = true;
> +	xe_info(xe, "Prepared for PCIe FLR\n");
> +}
> +
> +static void xe_pci_reset_done(struct pci_dev *pdev)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +
> +	if (xe_pci_reset_skip(xe))
> +		return;
> +
> +	if (!xe_device_wedged(xe) || !xe->flr_prepared)
> +		return;
> +
> +	/* Unprepare early in case we fail */
> +	xe->flr_prepared = false;
> +
> +	/*
> +	 * We already have the data structures intact, so try to re-initialize the device.
> +	 * This will be similar to system resume flow, except we'll also need to recreate
> +	 * kernel bos and restore kernel queues.
> +	 */
> +	if (xe_device_resume(xe, true)) {

same here...

> +		xe_err(xe, "Re-initialization failed\n");
> +		/* Allow user to retry FLR */
> +		xe_device_wedged_put(xe);
> +		return;
> +	}
> +
> +	/* Unwedge to allow userspace access */
> +	xe_device_wedged_put(xe);
> +	xe_info(xe, "Re-initialization success\n");
> +}
> +
> +const struct pci_error_handlers xe_pci_error_handlers = {
> +	.reset_prepare = xe_pci_reset_prepare,
> +	.reset_done = xe_pci_reset_done,
> +};
> -- 
> 2.43.0
> 
