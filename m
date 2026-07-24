Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 095DEC531C9
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jul 2026 21:19:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A707510E1B8;
	Fri, 24 Jul 2026 21:19:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z9y7asDb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7494010E1B8
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Jul 2026 21:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784927947; x=1816463947;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=y56xFeZfw33eOG+rXrTWLK3Zr0VVivK48pl4Q+7KhU4=;
 b=Z9y7asDbWERe8lsO/zRIYfU6VXqPrMAV7e3btCdLopYxCo1kfXbZHtq2
 p3TW9MGvJHHL4HfdvUgaEA73UAehYxwsmh17+8PlaOk7VBSKsLcP0BGrv
 D8qlHFhBeoQSaDQ8k90iEBYkuUOL94TJlCBwxguEEPy9p/VVqhaphZoXi
 XMNt7tnUlJcCZXr1telDUKwR8WNpH9CTG4MSBPb3VEO5aHFU0yoYO1qzV
 gVpf9L0jvk4uHkWjacOvB9IX9wrl6qAjWgVfDsbSsHpuHa4grQAQMhK3o
 8voWkSB2y7XSiYs6pwYH4JJulrTXfUEg/5gb4NvofArfQIw9077+NJKyR A==;
X-CSE-ConnectionGUID: u69a2fhpTRK/npVpKcs2IQ==
X-CSE-MsgGUID: RotZVsdERZqJYwwpuyUNgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11855"; a="84725919"
X-IronPort-AV: E=Sophos;i="6.25,183,1779174000"; d="scan'208";a="84725919"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 14:19:06 -0700
X-CSE-ConnectionGUID: wbg63JhIQkueA8DS7tqYKA==
X-CSE-MsgGUID: xdXyxxVsRxCTZ9B1hcg7Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,183,1779174000"; d="scan'208";a="263118908"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 14:19:06 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 24 Jul 2026 14:19:06 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 24 Jul 2026 14:19:06 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.54) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 24 Jul 2026 14:19:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IqRaKKOWXLMsGZXMnjmNRuj7j+JrjeyzXmxl2oNXNHydbZxyPkPyMqoEZD1wuOjhm4ZyjE6PzYLU1Oj7p0+UNBE9flo1HzUbgt5DLNITeSgNk6+ficwgOqW3TH5OkMnrNIIMi8WL+cWVtcHpoxqad75O6JpWou0j7+NvUwBqDqdypFKgM9SOVepUPYvx/AABeG5lTYNoUNMMCQIQO74fMnOvbK+AVQI6oUdHWI6EUkwu/0ZuSL8yZv5awmet+t+8gZZRPIRVTcrp++AQcDtlX9kic0iuc6CE4k/mOOTiH794edrd+aO5ugKACOthrxFCTlsUJcEXhG+1sYs02wlueg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MvTC1bMvNS1RyGCil9o71uhziXEd76am4ICdSMRphmo=;
 b=rZ+5/d7I4VLCSiBn+5ZDZ7/WpRNH0YyjpHs1kKw2H10NtdsSXp7kyxJ80MKgFf99RWCVMxYBxf1wjO9F91M42gntUcKnwqX24LvQCLfWZ2uVQLvixkW2xl5M6rRkEbkDOKFVCziDbyeNg0nN5ZGtJdFUAJOazijPU8gGvUag16iQu04icWLszXiPgurNMBm4ugY7rhLVBRkjUejEyJ1GY8O6edQq0kH3E2ufHV+JbRAl+m/tO65ZfsQWo7K2z9g47Oz8JFFNHh9b4ZK/pnBwwv0Rw4Ja5+sVcXpy47FePJSfoW72Giy79B/3t2Gbu+HQKpy7tZt27M40X8s2hVFVcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY8PR11MB7134.namprd11.prod.outlook.com (2603:10b6:930:62::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 21:19:01 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 21:19:00 +0000
Date: Fri, 24 Jul 2026 14:18:59 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Gustavo Sousa <gustavo.sousa@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/mcr: Take vcs1/vecs1 into account for first
 media slice
Message-ID: <20260724211859.GH2327163@mdroper-desk1.amr.corp.intel.com>
References: <20260724201129.2814030-1-ashutosh.dixit@intel.com>
 <20260724201129.2814030-2-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260724201129.2814030-2-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR13CA0083.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::28) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY8PR11MB7134:EE_
X-MS-Office365-Filtering-Correlation-Id: c17bdbda-33e4-42c1-381d-08dee9c92e49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|11063799006|56012099006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: wNEOoBYOyE9y+YhOp0OC9iHXtvLiIaEZsCKFhzM3RWRtt67YVthBxZ9jQOWo/uK+riYfNzMVmGQidErRuDtiqSwzHIOnm9+npiwVyej2R4UzbQCzVcDGL4Ez0cU8EiPbWToclZxqxF8R36U5J6TjDtXijzk7A4S9G5HBV8jOqXghO6aMbk1R7AgU/z40wj7HEPAItyWr+2pc2CdWDSnJJsu3qqQ/FhvA77Q8vGbnjKUA7nKudafj7e5KUW1QAB/ZzfStUlAvuEsL2EEh0ff6Lm32eNtR2iiugLRMzkpLkqHZPTA8RHPl4weRuzi4aVGmNk7aARk1pcBBbIV7xVg00Zt0IG7eEEPs2R5eYWSXDInpN3yIOIg47EZOEocruq4+CQvjtNZvGTyqgcREt1LLWwJswkNYBVD7Mj8wij8oOCWqmeQkGE4MHLUKOfxRruX8Nxn0Nuago9Kzri/y6KwvRkrREb7ylS8SHaGJrbzqcEA+YlZWYSKmicg7Y7/bS8V2oz85EXPHDhuNFgRl57QqyM9ybTKzXxnPVKQksMmhLKVgT0cFRezozgvZ6qob8K65f7ZgHydulx/G0xyVWc3ReDfO1yyzEJj8d5vVWunng7/dwC7zn7VrdLPqExIbu7fFpvZKK5m8rkttllj042ou+Gmztk/anQQ5U9OSpsyRlDw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(11063799006)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9KSJXvlSPO1gQD3chGrPgD1d5yK57+eNCnkYIH2H7pcferjiavsqUS1yt/UX?=
 =?us-ascii?Q?m9HsjMioCSpOwIJIUmc8IE1eag6u8eln8CmSK8D8FmMxAoTtWKT1IJRbyaAd?=
 =?us-ascii?Q?NLhLjfpPhcl2QHcW+pVYJArskYZN5VSOYj6ly0P+Gzq1chvwa06NSAi54ckJ?=
 =?us-ascii?Q?ijkLsuOowqgyuwMJTtfX24XAqZBTNQzpcGB9YtquFsjRnbkmK02AUZWm6R0M?=
 =?us-ascii?Q?Ub04J/CMRzlLGSUwp9A2lQhzoDVb+OT8Da9lbgMULKJy4lP0Hi/9araeYG/P?=
 =?us-ascii?Q?eSQXgXoGvgLGUgrXvf4Iv+4tfG3I5xGWwN0iPUXitcY4uwp8wqvXfY8h9YMB?=
 =?us-ascii?Q?aRuhZgIRw384wG9CAi3+8bxa+oaLosPAMUlT7OP/BqITOEFJV0BHrNb02KIZ?=
 =?us-ascii?Q?alyeB+OTJDgx5JPI44TZ4oCV/5Hmj3+6/8KqiT2OUFXTtWDF+bbUz1lFO2nw?=
 =?us-ascii?Q?M7lsqqqQl4g6Ic0xtB4E5zY6PIzLMoSeZ1MpjfIji1M81MvpsllgPGrpRtXW?=
 =?us-ascii?Q?YK7RPnM/sbBBZG3hJSE90NWmxMxdgPTmlXLQoj0QQjbNev729LPBUCX3c8AQ?=
 =?us-ascii?Q?hWS5XaOrsnE2pJkR2aF1eFxmFN2TVjB1PCWAMSN5NLOX4Tn9ncmUDQ6esR8+?=
 =?us-ascii?Q?3Z32g+qlj4EU+qTlbUjd2nKxzyh4YYBMWdHDzHmQlA0VdMcef+OF9HbRN8lw?=
 =?us-ascii?Q?+FnIKf8HOiNkGXZszRg944d79o5NH+5J79JZUR3CCB2XCx5/zZvI1lk4VmGf?=
 =?us-ascii?Q?Im+URyUqW03N8Aj3OAGhsx1BqM8rrOJC64494fTr9VL1h50j2wHA0rGQmCiJ?=
 =?us-ascii?Q?YS3jiR8at9A+AWIqjmWLsanErU6FipYIFp/fmvqrrcjMVGnuu3z2VS5pxHdA?=
 =?us-ascii?Q?RQOk3O3kvNJmX5aQGLX5h7wnPXqqSvuERgrSBtp9FhiUE0qcineK6iIbRFNS?=
 =?us-ascii?Q?EZV5a9CDjXo74Jpxr/t74yn3GWXvh7wMNW/SaBXaGBcUY8ncukv1QfvdODjA?=
 =?us-ascii?Q?hHjsxLSHfjleacXAKOs8eFfvX1o7x5W1Kie7H2cDtWirmTzMmfYdVAuQGN3P?=
 =?us-ascii?Q?aAdDaxxq9McxG1bckGqZSmnzzD+hFF4hCHC7d5bsIP1kgNUAQ3tydq8y5QCj?=
 =?us-ascii?Q?YqAGS2DhfWFoU0pY5dzLZNtNsODeodeiuP2SHZiMJC0BqElTE9EjPmSoDZRJ?=
 =?us-ascii?Q?y+RIDH4waOJyJ6aZjfU3ct7M53sURoht2pHqm+XwF+2sAEq41+oQPm9ZkTR3?=
 =?us-ascii?Q?2smpcm0/UYkwo6OLk+l7jDOcIMkLvBAjDM73CRWnPxuYvXMeF+AUZLRfFf0N?=
 =?us-ascii?Q?hlZUvh1xFBSEqkfy4o8RtJdlZkpfSnKpOYwVfr6ix3BHUw0g2Z6rwQSDhdsh?=
 =?us-ascii?Q?p696imWgabGdSkmRvAOI7EnO05pV4v1JmfLg5EpUV5SVuldNKshb6dI0pl+t?=
 =?us-ascii?Q?YpBH0dCR+RlTQdV6NUWE/wq5FZA6majOFziLLiqA8MX3wM0nB7RgbslRV/m4?=
 =?us-ascii?Q?68u75j40EpbK2VIEwuiP71s1CyO/Aq0gLiI10DwUM1SHWo9yNP1GK9EymlEA?=
 =?us-ascii?Q?0hm2Y2qOiQnRD2TyHUKKuXnxmu3MLEqE7Q/jFBhllpQGF1efpsCuLjeisr/G?=
 =?us-ascii?Q?ufZid2rJjFm3fL9YXRzBXNvxrRSv4jlzdhuutk6CM0Uw51diUxXBvLb9SgfL?=
 =?us-ascii?Q?Pu5KGhpgWZmCGN/XdJHRY/UkdX8nKZTbXM9GxrYcZcXm153IYn8ucqNQUr+w?=
 =?us-ascii?Q?94ChRFO3SeMCq8j2+iEurUpzx/6En50=3D?=
X-Exchange-RoutingPolicyChecked: VNt7DBZzPP4ofUoSVQCbWi8Vt7VG0eYOieFJ0xn1D11Xw7JDivdPan9XnHM5w5tb3yKOnZ4vAkUf/p6HgHJtMETh5EF9HstrZvjV4Ga/gaoIAXy3NVAZESlLFT9lSgg8SX0WunKjEyRHs11QuNS2knAo0O0rLNgAou0h5c+xOOv81DhGpA2QiaW6dMk0Rp1CmOMvrgLS+oYWp+LwsT1I2sATpBvdJP4Gc7Wnvv0nmVVPFns6qiQ3HVJNTA8zh6yZljWzthCeGv6JFqEF27WjAQhhw4+dnuFbx3WyCrsfa0Vmsr58Rl8iuA1V2GBByqEhr6Fl/firfigudeBQuxcVcA==
X-MS-Exchange-CrossTenant-Network-Message-Id: c17bdbda-33e4-42c1-381d-08dee9c92e49
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 21:19:00.8899 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4QbPv+aMu61uARedxZiv3Kimfp2t9Uyzf8JSLn6pmlVJRCRPphIyxJe/K23LzEG9rV9htIRGH1QRlAQ1S6ka+yzt3bNBRiRjoLKOzDQC09c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7134
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

On Fri, Jul 24, 2026 at 01:11:28PM -0700, Ashutosh Dixit wrote:
> vcs1 and vecs1 may also be present on the first media slice, so take
> vcs1/vecs1 also into account when determining if the first media slice is
> absent.
> 
> Bspec: 77977
> 
> Cc: Gustavo Sousa <gustavo.sousa@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_mcr.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> index 9799ffadf85d2..d069d141b54d6 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> @@ -454,9 +454,10 @@ static void init_steering_oaddrm(struct xe_gt *gt)
>  {
>  	/*
>  	 * First instance is only terminated if the entire first media slice
> -	 * is absent (i.e., no VCS0 or VECS0).
> +	 * is absent (i.e., no VCS0, VCS1, VECS0 or VECS1).
>  	 */
> -	if (gt->info.engine_mask & (XE_HW_ENGINE_VCS0 | XE_HW_ENGINE_VECS0))
> +	if (gt->info.engine_mask & (XE_HW_ENGINE_VCS0 | XE_HW_ENGINE_VCS1 |
> +				    XE_HW_ENGINE_VECS0 | XE_HW_ENGINE_VECS0))
>  		gt->steering[OADDRM].group_target = 0;

This change could break other platforms.  E.g., a BMG card with VCS1 and
no VCS0 would steer to SCMI 0 based on this, but on BMG each VCS/VECS is
in its own SCMI so we might be steering to a fused off instance.

We may need to add details about how many engines are grouped into each
SCMI to xe_media_desc and then use that value here.  E.g., Xe2_HPM is
1/1/1 per SCMI (bspec 67103) whereas Xe3p_HPM is 2/2/2 per SCMI (bspec
77977).


Matt

>  	else
>  		gt->steering[OADDRM].group_target = 1;
> -- 
> 2.54.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
