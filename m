Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2384D59D77
	for <intel-xe@archiver.kernel.org>; Fri, 12 Dec 2025 16:08:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F23D10E908;
	Fri, 12 Dec 2025 16:08:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YXFx9iGo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CACA210E906
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Dec 2025 16:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765555688; x=1797091688;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XyKD3SZaOZkN+fii36vBKL/pzeRKoGZDMNiRZuSkgI8=;
 b=YXFx9iGoo/qi17Dp8tB/TLf+brHQkVzJkvJsti5fDSSU5Wx4/JpSZGVA
 Oc+XzgYXQ7T6jFWKFCSOx8j/S24BYLNa5aZEPoCZXgHmazCdt/TP22Bsi
 i666ovgUbonzHtgdmyYChS2UWxfT9MDLToGIqdpFn1jswdVxm58MkgHkT
 sgVy/tbX4e+I+nX2utivjn/uHiPclLmfr5Mw7+v3UDTYYJ6b3xoLNs2ND
 qASwhxgpTz3Bk6DoxDM93RkPFM9bBclysgGrVOtrqmv3B6d3OQI8OdXsA
 rEnyyXgd39W0OzzxJ094KbV6mr6I/q4TbbUSdA+DJoLfO/966igPx8ZT3 Q==;
X-CSE-ConnectionGUID: /FWle35oRzyUxDvANjAj3g==
X-CSE-MsgGUID: YUt5hUb2SsydVmThVMY78g==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="71407129"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="71407129"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 08:08:03 -0800
X-CSE-ConnectionGUID: 3/JNswt2RTSHtbhNYvgTRA==
X-CSE-MsgGUID: iFireGHQTCmPnW2V7+yTyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="227790765"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 08:08:04 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 08:08:03 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 12 Dec 2025 08:08:03 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.65) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 08:08:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n8jXnDXSvCLTG1g5EYhqqPYAmNNxX743gP9CnsuXmwctQ4j8kfOJIVPV0FrTxCBlSvGieZ2fElpWvXPEsZpEZvhpHZiCVD3MkmGAXhgcKHVFXwZAQEoDpYJqdA1gGrXDdLjcSbe6KuSK6HgE/3xRDTVMHDMxf9OLxK5CRGsmJwjDMcw2uYDGcbi4oQCooigaFIsBAIiMWyOMfRR5O1/FGW3mbmIJce+f3NaK//8/j078sqoScWJwnubHNAKkecHaKWhqBpQY4kTIcmHE5WJegnML2LMuUGoWmgTdn8pC3qMivLwUYj/fUcjXzriR2gt3eAHnjxsdlowmKRUMe8EvIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZHS98Lvn5BRzUETtlfE+lEuYTMJBAnMVFvbYrogMW3w=;
 b=GhYcsNV0l1vvySckC6mRJlWAj3htZhYyVJmH7rf/XUmEr8vq6JcHZw3dQr8XancRiXr9xkPd36Cg6C+N2hlLBtin+5dcpyKlhVZWLFDOiQ4R/8Hgm6IYcm4VT83jtTpCxqlMnxeKOZ73W2OEjxmsVM1v2chrAVK6XGb8HBCcsYcuoTUKzuTV0KfeXIWNXn4jMcOh/Fz1NlU0dfn8AdFN77e7Yed8lgDTLTB0AwALLmUAcF9x+IBx+BjWVtiSpEHoSOsfwnKflpzCu5Y0Pkdy8lhiNU6mZF0gbzUjSkXOOL7HQ+fCwRCLNC1axqfGv/nC2vy+a2KL+WBjR5EmSfS9RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by IA1PR11MB7890.namprd11.prod.outlook.com (2603:10b6:208:3ff::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Fri, 12 Dec
 2025 16:07:58 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%4]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 16:07:58 +0000
Date: Fri, 12 Dec 2025 17:07:53 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <michal.mrozek@intel.com>
Subject: Re: [PATCH 6/6] drm/xe: Add more GT stats around pagefault mode
 switch flows
Message-ID: <aTw92bivvBa2-1yc@fdugast-desk>
References: <20251211210032.1520113-1-matthew.brost@intel.com>
 <20251211210032.1520113-7-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251211210032.1520113-7-matthew.brost@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DBBPR09CA0029.eurprd09.prod.outlook.com
 (2603:10a6:10:d4::17) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|IA1PR11MB7890:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cfc5086-613f-4e62-aa0e-08de39989de0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IwrWlOA9Idl2EpJ2s0dcMQhnIpbZ1qmHX/BwFzYm9p9hdo7skYgnQnc5xyax?=
 =?us-ascii?Q?xHcvEx1uso2idU0dIRp579aOKAeUtj4zdKPZ/2n7lUUwx7HyDRMWqWrWDEtR?=
 =?us-ascii?Q?l50yVJARZWOxPbVnV3chczrB0XsxXdKGQC/PeGiMJfzz/jC2JGEfeQD3RaXT?=
 =?us-ascii?Q?WaZdTdV3Dl+s/X4E+nVUyxtRhJisp8bX6QvlG7eqIyZXQ5BhD4wC5G65kO0G?=
 =?us-ascii?Q?HQdLIYhDhtwAyZSew3lMHcxVm1aPrt2Pwoc929G0O1nkjpJQ6R5qFxfzjhR3?=
 =?us-ascii?Q?VReI3V9T9K3pTKhxZgWLRnN6++6bdbYUK9VYvPI1yyXS+7x4Bsbzbpfcvecr?=
 =?us-ascii?Q?A9n0kqdh1jMm/RpuJG9GjBIMjsl2OFRSW/Agy0j1+gnA3I0HBf76lubNiY3g?=
 =?us-ascii?Q?nN/CfMhYh4sZmIpHucVVWvrqy0scDqDeQpdnynfIxejFrn7G93/llEEQ/ZJR?=
 =?us-ascii?Q?CCFR0shy98RqOvnrS+6YP6ObsEFkaQPK2lT/u1CzM1DlMieIXBVclmdkyq1O?=
 =?us-ascii?Q?fZZfVHqhHKL71EwZhDwUiJ2x+zb4esOz4SrBDmONYJ/hQNsXub23YmRc3B69?=
 =?us-ascii?Q?GCGbaS6jfxi75ynRZ4rvkjE8omUJIOvmYlPhRwc5rJ1BEWs6HBVG2UsAb8U9?=
 =?us-ascii?Q?VJoLPjdc9rykF7fEXuX2KgbaMlISWvervIfLq6y80+c7hL+qOIf6sQJISMiG?=
 =?us-ascii?Q?h90ETTwYoGOdhVrABvnLqigbpCe56YQn9l0vjZUHWdPgLyHGgtjuM9luFPLB?=
 =?us-ascii?Q?iYR+RbHzPA76lVOQt/v+X3n3molobLhET2os4jAxkW0EsaSn/d6pxS75/uWC?=
 =?us-ascii?Q?dCENkzFBT1sjo9/vy8tN9P8WECdSJZfPE2BTs24BD7bL2LoHtg0s5MCTeK42?=
 =?us-ascii?Q?3X/BNq4WxkiaQVSoKyfR0jiMQ7osZrhTprf8M7B5iREZ+v7Q8KrBynq7GUym?=
 =?us-ascii?Q?MmjbRG9X9oHLYPs7s7IHCmMQJE8HCiOMirGAbCs/LAZVIyYbLMRfPeRqAneH?=
 =?us-ascii?Q?xeNkDLJxS3qjrm2hAQ1X2k8H+S5ryOnzNIwbeE8mH+L9Drmw8oU4a1aM/Pps?=
 =?us-ascii?Q?KcJylM5uEJgzOwoH8bJ0A5rErIS5jN2HJWTt0SyUFbNe1hgScd0m2SVYI6nL?=
 =?us-ascii?Q?V2ugDtv6ehNLWYAtOcAJSJWHj0Xf3POLWSUIDfKpvajYLVBuRlDP/I/hiHym?=
 =?us-ascii?Q?Kykk8Q2Bgv5+MxWOirxlbjmcVbBLbYPpP1jMtyukcpVkQ3aLASxenCM94s36?=
 =?us-ascii?Q?GRCYslJug6wTyPhY/eRlFMgNU/xaTl2bDLOq2K8KIF48+CfSM7+Mdq5bhY8s?=
 =?us-ascii?Q?JIeW7CUXhT30dK/IORgwTlUvZ0TEyv5F7a85AXKf7lyQshejmjprg+7VMIVS?=
 =?us-ascii?Q?n/XNBFxUgfDVtVy9pSfDVwEh2AY3FbSJ4DfYab9dJ0qvnh59SWXLblDDli4P?=
 =?us-ascii?Q?daSoLJPoyynbLGYF1VfjlsKiZqzzwFZF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?c2QRmVmR74VEwVIzE6LUy8UMR1rEPNAHrI4GDjn0K+3NP00neZDjqwbyeHJC?=
 =?us-ascii?Q?rYWFqoq2KHfV1O4wBi61jaYJ1UolNwVC0VzSOB0wvpJA5QxZocQgzk4KgHPM?=
 =?us-ascii?Q?zaTIf7DjsbHkPIn+gKYKb8Oh2OBCNJJloOq2TQ9+kUQL+cMXKxynm+OegMZL?=
 =?us-ascii?Q?TRo4XDTFAfKeH05iudKYeeyYLwG0VrvqKlXbrXxLQvVMSTJVROAZi1HFHzwV?=
 =?us-ascii?Q?Ybz+Y3GDUwFRnHCxlpep3otlBNWUJkKRCTAoFx8yYJW255uhMvemluJUQSWu?=
 =?us-ascii?Q?ZjsIEM+uzn7thYvXUro/wCWSDlgpsJa1y+/4qxfRylFJL59Q7cWks23fXTXr?=
 =?us-ascii?Q?yO6sonbrNh+cKKr1nxaolxnMS3hcVRIqfKdI0UXXHjh6RRT2QBMe+X2OZU4U?=
 =?us-ascii?Q?raly2s7myQUVzu+uy4y6MOsODGSUIzdkxVR/egu+wvm1ThB4zmvEMlT+sXFx?=
 =?us-ascii?Q?Lued2EjnCUZe0C9RqptnQvrOjoQF/DXrXMUTJLs6uPFEgm3Ez/oAc4oxj6z8?=
 =?us-ascii?Q?XpWIQ4jrGXmGmZ4rIUMTtkY4DL+7Yl3wdFrBxYf1GmCexgPUbjwWPRVi3edu?=
 =?us-ascii?Q?9UCAjtpxTXl8zl51J28LI1k714BofUgnPenr8hYbZ013TgPIfYPOkr09Or/N?=
 =?us-ascii?Q?NNxeFC4nqXq+PiZv+VOF9y1Q1mULy4XydkL7E+ask/yU1IhoEZtR7ZuHZ5MD?=
 =?us-ascii?Q?Mvkjm9oFd3KYv4BxwUt1iDXA+0x1hA1aOmwDOFGBqGwX+lhjpbeNopb0wgKQ?=
 =?us-ascii?Q?goTLCm07kKJFN0tYn9uvF/IhFTBCJwtg16HKsek7neKK6m0ZPZ5giBYZkTXJ?=
 =?us-ascii?Q?ecvYJbwaOr+dld1/eRRn+UG5LMxEh6yQ76YPFkeNu1jwbWFkXuHvKSmPjs3n?=
 =?us-ascii?Q?1BHwlhwaR+mGG3+1DGOIwHLL2Ij9FagXbO8E3CQA+1ICFrKGQHGDLT17QE8O?=
 =?us-ascii?Q?803V0lpLQISjTVzuJvK00ovuSG78i384Ctm4z9G77abVQ2p1+42nYNSba9aJ?=
 =?us-ascii?Q?BZwhj3YJBfoijvhzAfFP1uZ87tcmLPPaHBP4KELTHEvybWDXytv8PeXEkIgA?=
 =?us-ascii?Q?K5b/RHY5QDivG4e1nJ3Dl3bOQ81SgWDrC9e8qcv+DkUbnmvyCQHhUgKfT+hb?=
 =?us-ascii?Q?0Tm2DxT0o3YSh3bnz3Ra0O3z8CX5xGjdTGOVoh/fw2CDGwGCA2mKi4CIo2kt?=
 =?us-ascii?Q?c1xLHKMxy8POryV+dYxQN69pbm0l/1zurhYFb/fih+CM1FlzlVCE3VprYFom?=
 =?us-ascii?Q?k07IoOi7Mku9XFKteDAalRT7Q/JS6E1szbQsIe7Q135eDucw6swncMME+PCY?=
 =?us-ascii?Q?ozxv/cX7QKmQaDlU27d1NsIM/kpATWqwygt/CXaE/Ib/OvSfQn0SQcm76mLC?=
 =?us-ascii?Q?ea4CvRv96wWaZrSSn4JvB431PVnOcQezpipLlzf6DfvuhWo2d+kbCM34Na1H?=
 =?us-ascii?Q?S6wRYqxo2jFONQ3AzlNNl6+gyOPX9nk7rXnDbvy9tH/7u9KFHIkwJhRROmno?=
 =?us-ascii?Q?g7aR/MpG2ZotZqR+o/23gX983f4/fhx23u6kGUHjuzp3fKQE1IUnGz+dm6WT?=
 =?us-ascii?Q?MWfkX6iAvv89vh9PJUY45QheCH7cKRW5iYnxGquHroF6oLBzC3Fiv5mWoAWI?=
 =?us-ascii?Q?Zw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cfc5086-613f-4e62-aa0e-08de39989de0
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 16:07:58.1896 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pLN/hUpjx49/waEGe67rDNCkGRHCOhcGb1KW1m+2D0H95bbZDqwOqA81vB/5m6MAQT7fdp34M4K4RCF7OPH8wEsCdCCGWO/SLynHYnu2+yk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7890
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

On Thu, Dec 11, 2025 at 01:00:32PM -0800, Matthew Brost wrote:
> Add GT stats to measure the time spent switching between pagefault mode
> and dma-fence mode. Also add a GT stat to indicate when pagefault
> suspend is skipped because the system is idle. These metrics will help
> profile pagefault workloads while 3D and display are enabled.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_stats.c        |  6 +++++
>  drivers/gpu/drm/xe/xe_gt_stats_types.h  |  3 +++
>  drivers/gpu/drm/xe/xe_hw_engine_group.c | 32 +++++++++++++++++++++++++
>  3 files changed, 41 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
> index 714045ad9354..fb2904bd0abd 100644
> --- a/drivers/gpu/drm/xe/xe_gt_stats.c
> +++ b/drivers/gpu/drm/xe/xe_gt_stats.c
> @@ -68,8 +68,14 @@ static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
>  	DEF_STAT_STR(SVM_2M_BIND_US, "svm_2M_bind_us"),
>  	DEF_STAT_STR(HW_ENGINE_GROUP_SUSPEND_LR_QUEUE_COUNT,
>  		     "hw_engine_group_suspend_lr_queue_count"),
> +	DEF_STAT_STR(HW_ENGINE_GROUP_SKIP_LR_QUEUE_COUNT,
> +		     "hw_engine_group_skip_lr_queue_count"),
>  	DEF_STAT_STR(HW_ENGINE_GROUP_WAIT_DMA_QUEUE_COUNT,
>  		     "hw_engine_group_wait_dma_queue_count"),
> +	DEF_STAT_STR(HW_ENGINE_GROUP_SUSPEND_LR_QUEUE_US,
> +		     "hw_engine_group_suspend_lr_queue_us"),
> +	DEF_STAT_STR(HW_ENGINE_GROUP_WAIT_DMA_QUEUE_US,
> +		     "hw_engine_group_wait_dma_queue_us"),
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_gt_stats_types.h b/drivers/gpu/drm/xe/xe_gt_stats_types.h
> index aada5df421e5..b92d013091d5 100644
> --- a/drivers/gpu/drm/xe/xe_gt_stats_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_stats_types.h
> @@ -45,7 +45,10 @@ enum xe_gt_stats_id {
>  	XE_GT_STATS_ID_SVM_64K_BIND_US,
>  	XE_GT_STATS_ID_SVM_2M_BIND_US,
>  	XE_GT_STATS_ID_HW_ENGINE_GROUP_SUSPEND_LR_QUEUE_COUNT,
> +	XE_GT_STATS_ID_HW_ENGINE_GROUP_SKIP_LR_QUEUE_COUNT,
>  	XE_GT_STATS_ID_HW_ENGINE_GROUP_WAIT_DMA_QUEUE_COUNT,
> +	XE_GT_STATS_ID_HW_ENGINE_GROUP_SUSPEND_LR_QUEUE_US,
> +	XE_GT_STATS_ID_HW_ENGINE_GROUP_WAIT_DMA_QUEUE_US,
>  	/* must be the last entry */
>  	__XE_GT_STATS_NUM_IDS,
>  };
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> index 35966889c776..8236fdee0901 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> @@ -14,6 +14,17 @@
>  #include "xe_sync.h"
>  #include "xe_vm.h"
>  
> +static s64 xe_hw_engine_group_stats_ktime_us_delta(ktime_t start)
> +{
> +	return IS_ENABLED(CONFIG_DEBUG_FS) ?
> +		ktime_us_delta(ktime_get(), start) : 0;
> +}
> +
> +static ktime_t xe_hw_engine_group_stats_ktime_get(void)
> +{
> +	return IS_ENABLED(CONFIG_DEBUG_FS) ? ktime_get() : 0;
> +}
> +

As they are not domain-specific, we could move xe_svm_stats_ktime_get()
and xe_svm_stats_ktime_us_delta() to xe_gt_stats.h and avoid duplication.

Francois

>  static void
>  hw_engine_group_resume_lr_jobs_func(struct work_struct *w)
>  {
> @@ -200,7 +211,9 @@ static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_group
>  {
>  	int err, i;
>  	struct xe_exec_queue *q;
> +	struct xe_gt *gt = NULL;
>  	bool need_resume = false;
> +	ktime_t start = xe_hw_engine_group_stats_ktime_get();
>  
>  	lockdep_assert_held_write(&group->mode_sem);
>  
> @@ -213,6 +226,9 @@ static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_group
>  		xe_gt_stats_incr(q->gt, XE_GT_STATS_ID_HW_ENGINE_GROUP_SUSPEND_LR_QUEUE_COUNT, 1);
>  
>  		idle_skip_suspend = xe_exec_queue_idle_skip_suspend(q);
> +		if (idle_skip_suspend)
> +			xe_gt_stats_incr(q->gt,
> +					 XE_GT_STATS_ID_HW_ENGINE_GROUP_SKIP_LR_QUEUE_COUNT, 1);
>  
>  		if (!need_resume && !idle_skip_suspend && num_syncs) {
>  			for (i = 0; i < num_syncs; ++i)
> @@ -221,6 +237,7 @@ static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_group
>  
>  		need_resume |= !idle_skip_suspend;
>  		q->ops->suspend(q);
> +		gt = q->gt;
>  	}
>  
>  	list_for_each_entry(q, &group->exec_queue_list, hw_engine_group_link) {
> @@ -232,6 +249,12 @@ static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_group
>  			return err;
>  	}
>  
> +	if (gt) {
> +		xe_gt_stats_incr(gt,
> +				 XE_GT_STATS_ID_HW_ENGINE_GROUP_SUSPEND_LR_QUEUE_US,
> +				 xe_hw_engine_group_stats_ktime_us_delta(start));
> +	}
> +
>  	if (need_resume)
>  		xe_hw_engine_group_resume_faulting_lr_jobs(group);
>  
> @@ -252,7 +275,9 @@ static int xe_hw_engine_group_wait_for_dma_fence_jobs(struct xe_hw_engine_group
>  {
>  	long timeout;
>  	struct xe_exec_queue *q;
> +	struct xe_gt *gt = NULL;
>  	struct dma_fence *fence;
> +	ktime_t start = xe_hw_engine_group_stats_ktime_get();
>  
>  	lockdep_assert_held_write(&group->mode_sem);
>  
> @@ -264,11 +289,18 @@ static int xe_hw_engine_group_wait_for_dma_fence_jobs(struct xe_hw_engine_group
>  		fence = xe_exec_queue_last_fence_get_for_resume(q, q->vm);
>  		timeout = dma_fence_wait(fence, false);
>  		dma_fence_put(fence);
> +		gt = q->gt;
>  
>  		if (timeout < 0)
>  			return -ETIME;
>  	}
>  
> +	if (gt) {
> +		xe_gt_stats_incr(gt,
> +				 XE_GT_STATS_ID_HW_ENGINE_GROUP_WAIT_DMA_QUEUE_US,
> +				 xe_hw_engine_group_stats_ktime_us_delta(start));
> +	}
> +
>  	return 0;
>  }
>  
> -- 
> 2.34.1
> 
