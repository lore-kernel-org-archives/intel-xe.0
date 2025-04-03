Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1117C36014
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 20:53:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B62A10EA76;
	Thu,  3 Apr 2025 20:53:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dzJtTTzJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C30210EB4B
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Apr 2025 20:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743713637; x=1775249637;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hRaDhIypha5MtYZw7HcKoO/8YyLak7JPqHAd2dBHOlE=;
 b=dzJtTTzJO5UqFbrH52aBTcKLvaKqwYIBiVb1jEN5Mwl4LwMt9KNJ6N97
 VvQ0PKCPlpHPVHwnVKR2t/JcfSc8opZ3OQAYy8Hk6q1Nmw9nFfkuBIl/w
 08+WR+eShSORq3u/P0iCGi59+/DR6UKajVtgoKrKecDp68QwkCNoqcngM
 U64dr2+EfYW7JnHTSB79uprogYEKjFFImU/zXgx8CQ6g73gJKR2aYWn0M
 WO7LZNaf2/Z4UzC+cyk4EG68uXWsBzkbBvNhCnWL7bgetv0SDd/dzqa7u
 fhKy3bS6POLYBFwWxpuQGbH4FM2UJu19dFPAXYV/uBjXTywOhQngf6i5i g==;
X-CSE-ConnectionGUID: z73RnPwhQXqsRrzRePB4Tg==
X-CSE-MsgGUID: uaiOv6siT1yTC3DklXLKGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="45287620"
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="45287620"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 13:53:54 -0700
X-CSE-ConnectionGUID: xUAzCeuyRNmBiRYtaCiRVw==
X-CSE-MsgGUID: EcEkaTHzQ2e7/uxtX0jrfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="131837762"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 13:53:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 3 Apr 2025 13:53:53 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 3 Apr 2025 13:53:53 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 3 Apr 2025 13:53:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EXK59Wcd/1NxB/4R6h+gl29ZgOue4z1XeUryHE10EhOlqKHBA/PAIqkqaYCEiId8qUgPM5BcBZgdQsZhB/3IblzFIeiQhuV6VgcUOG1yuj3m62MkO0kRnJyLbaKj4gloifh3svEfRRGe+w+0nT8SGBqMySOCF6PpKSCyRaX4e/EGTKrtXHRCnAuRCOfujdEFxHmQK+MbC1YKE0a/OEZc1adyOCsvsuG7Bfr0DLmjVS64YBFnRAHAODtrnyGV5bYi4KXW3t5ysD2hliY2ik+/4H34ytNCh4LezUWxW8avKiYJJJCSq6rqlWpDrdjGhJ+qc/XkyCf/EPnz34duf7Zl0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=199ySItqcDNipho5z1CTPhFgkUKaghnlCoNm4WEEGok=;
 b=j0e9ml7cRGF0nuAqsw+yuYEbFHAh0VqWw+ajb4vHQzIYFqj5bosUlr5dJ7Z9rMh/O9xAtOGrMkWzC0uo5mWETRo4XtVb7piaFtYSjMPi/kc2Kp2pMbI7aEn+A6CJhT+cpYRBwH8YxAGPjnzTZxq1+E6HjSYsbdvlUMdpLbvCiGoLF6NOBO+0403sv/4CzS5VCAl/kJia17Qp9m0Z4XUCd6oWt7MvLuFgaSr1ziYsA3pqux0YnFk45CHF16Xcgdtu/Cx53gnQ3JUg8ciDExK2YW7H8wRUeLUFv3VHvj3ie09jypOhszmKJ+KnLvmRXP+2vs3Vwn8S/6FxvB4yWywceg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.41; Thu, 3 Apr
 2025 20:53:41 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8534.052; Thu, 3 Apr 2025
 20:53:40 +0000
Date: Thu, 3 Apr 2025 13:54:56 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <oak.zeng@intel.com>
Subject: Re: [RFC 10/29] drm/xe/svm: Refactor usage of drm_gpusvm* function
 in xe_svm
Message-ID: <Z+71oARy4v3t4UWc@lstrano-desk.jf.intel.com>
References: <20250314080226.2059819-1-himal.prasad.ghimiray@intel.com>
 <20250314080226.2059819-11-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250314080226.2059819-11-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW2PR16CA0066.namprd16.prod.outlook.com
 (2603:10b6:907:1::43) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB5073:EE_
X-MS-Office365-Filtering-Correlation-Id: b4814634-d95e-497d-6bee-08dd72f19d43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nmm2rMkP5RRvRfAgmoQrdfOPV/rssfds0lY+oiJ0gJXmw5Jtg5jX879/uxPB?=
 =?us-ascii?Q?eYOWUwa549DLULa7NHtlD6WbHvadkxuv8lLtdrvUTMhBfem4cH7UPXKgGxlm?=
 =?us-ascii?Q?RcMUET+SlpMjUvGx1SdbElfKxeYCMhu0v60MDeUH7PwEITIeu2pxHhPWjt40?=
 =?us-ascii?Q?q1Sa3NIO0w0+/yL/BSQ7lv1YRGQ+MqaoKQHXrYnw1xKKO+kcMNCvohw5Z35P?=
 =?us-ascii?Q?54Unwdz3dnnsdp8ZzRrXjNlRr00kk+SZhfqU2Jlr5LQbZsG25mC9ic3XORHH?=
 =?us-ascii?Q?jd+uGW9+/AqHM7JQJhaK0vrtEaRC03PeftE8WYfrmsMVu83PcAO4UjE5WZx2?=
 =?us-ascii?Q?6B5089VpJ4OVXNf3cwsVvToXrTyitbyPPT631HzAQTXuIBbDlsxAazkRrWfu?=
 =?us-ascii?Q?ZyH5C/ZwRCZrntBvjS0Ym93j8tXrryGXNdruji52w6jh73vWG/wIwxfmXqPP?=
 =?us-ascii?Q?yGKdNFR18aNQ6fkxG3Frwn5/y80sGg/WdOOdfxUEovRBpexIdT/wVkNvaCos?=
 =?us-ascii?Q?Sredt4YhFsJl+uXJSFHAzKCgRV0r9qBf7bN5PlAlL35jiu6TEmaiJMU7ahnE?=
 =?us-ascii?Q?miZvuQaJtmVYBkGq4PHt7OJ46WK1MAmrhwOEyK+YhaRNecHa4DdRzgiTT59E?=
 =?us-ascii?Q?r7lwJLvg8FMGYR8SlbPBvdu7RQX528zLYcsacqpVunTTD+Srse9zMzTtGzk9?=
 =?us-ascii?Q?DtVlj5lu/HzSqXAw6sDzoPbNB21JMofrb9XpYnydPLPz5/OuklkraLUpdSMQ?=
 =?us-ascii?Q?nbMmIW3TFzJh1fYzG0MKi/eq+XMsRw2bYSTLA4AL7lAjCFXyMfwXqK1DWmN4?=
 =?us-ascii?Q?nflqm0VHtd2h99/nO8SS3zPvSfhefWItbKe/p3Je6/N2XQPYtkxD4/OplCiC?=
 =?us-ascii?Q?lFR72+gabzuM+lgNfQjOPvhMSXw5MDJBDB8EuSYRyqBR6yTqHT6dmy2uwNU2?=
 =?us-ascii?Q?sxY3ZgqlefwKjAJ0u5JoXc6/pGHu8KibYy6Tjh86DmW21pEYn0JCWuuneaWw?=
 =?us-ascii?Q?tgiHd75P4eBwffgnnzv4SlDWFyKw2DLBzfEPNz7WLKx1FxBCcTCnFZ08x4gG?=
 =?us-ascii?Q?FWk1SXZhYouRJjFCZmKIbZN/RGSKaYz816f8hB7OXwurvhpA8Bskxfh+Ajas?=
 =?us-ascii?Q?9N1cZCWoQOKV6/5Tss0UWEaYMN4zQ2hNmZfaqCqPor2+r9kznI/JQRzfb/gq?=
 =?us-ascii?Q?CfR6bf7MvPr6u61TS4eK6Hg7j+1iuopHj2GM9m7aAuSo82Ctr/MKsEz0f5+J?=
 =?us-ascii?Q?b7wQgUJiT/b1oj2Yne0WOpcRouejPh5JSWqfWMbHjal5Y53HGyMbZnulL1p4?=
 =?us-ascii?Q?WLkgmVW4XkDtl0qODAQBu+PdfYNA29N6CKS25ctiulpave+FQqxrfastQXFI?=
 =?us-ascii?Q?kdfScwVFb8TIPq6GrOjTDut065Ly?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XZvc4p9DJb7N5gd2dMfD0J9DiP0a3xvEuya68FWiMsyP/4khwj5xf1xHBGv9?=
 =?us-ascii?Q?QHHOSboXy2FiBTIP2+bLha5AzQOy2dBkyZcH/GVjqM9bDiJD2h4Yvl2FUOy/?=
 =?us-ascii?Q?t246dT1Ldo6EwNkxfySm0iRLdUlFfyYhZz9EfnNFePwZwrCS5ksyCnwugWJi?=
 =?us-ascii?Q?hn5XMm1/KzzafuVWX7XgCC72D/hiETt4tJH1HY5aH0ndYqVCwjWOO6FcUd3n?=
 =?us-ascii?Q?oIsIoYPEJv4P0J3xGFqKW3NH6ndh/TdyvZVnPgDkF0/2yvCI9IYjThPTtJwq?=
 =?us-ascii?Q?HBxWeqKg8l0g2Rgs0dBdHW5/qulN/k5PAXSRBcjNueqIWg+ZffLSZepIl1VK?=
 =?us-ascii?Q?i4YHPayjBqmTp4V8O/aw+oNnv+bwyVASeR62F/jX5KCzp9sqZMx+g7l1ZHje?=
 =?us-ascii?Q?E6Uos+412sOLwCAoZkZIcqdDpULhEwwt1YhguBa5wMCrav38ewwARsF+Ux2y?=
 =?us-ascii?Q?HOW/sqHnRQzjbX24It6ptNAfaLzGgugJalBccnzTf4NmjV2KPwsYrszF7Z7W?=
 =?us-ascii?Q?31WKP4pQWjF73ngrz/eOgDks96NV1yEqPHqlJaw90wF/kET+BIxy8MO5qQKi?=
 =?us-ascii?Q?cGFkX6O6fGr/W+FQ5A0efruyCCumUvbMi8PR/E19ph0jUSwUb7v/jp/EZOXv?=
 =?us-ascii?Q?u005c90Qi5cYWQq7x5VlUdENpfBDMzYGkWWlhRaqqT4J1rGb025Dm0SJwcLc?=
 =?us-ascii?Q?osr75jcu3K5Lth9b+/uXu6NwCkk2Z8FghyqWJL6b3jSOMmsUgCdz6MWF2AoN?=
 =?us-ascii?Q?uS4NynNZ0FLLBeMCNQO1wSMN/wVh6rEsrWJBci86pbwpFU6IyAXxJF0qGW/e?=
 =?us-ascii?Q?Vbo7EqSX9Ez87IoVRNZLEQvDbHZOb0YKDFoGsNfMRGHBmc6PkFlvSUrftnwJ?=
 =?us-ascii?Q?65P0LLJ05o/yU3xNlu9Gu1JppvRx6v3LI0fyRd7sgZ3jGI0k/9H13c3/loVe?=
 =?us-ascii?Q?jyHj8tEo8ETQ7DyyzNmS94XVaUwaQPG4YZn4oUWlehQu3xlv+1gnStmoXbYB?=
 =?us-ascii?Q?SGF5LBh9/aJi4mWGrHUJnTZmZ6/mOMwMECvC+aB1fv6RrISDAODOa2/4d99I?=
 =?us-ascii?Q?dU9auUMPAieHT5PX7GLy8wnpgDZr+fUBU5Avv74fM4B4XIoPw+RglSuu1loj?=
 =?us-ascii?Q?SYA7gZ/1iWHRd0J4qI0mqskIkMj8mG2s0aXXbtuia0KuudtpzSG8Xn5haYHD?=
 =?us-ascii?Q?ze7y32Em0aMTzDlNsrJ/pGZ41zZ15cXq85xIBcl2+70TT8Wj15/MY+KpLqHi?=
 =?us-ascii?Q?kNwi7b0rT9pEXpWoETi/mfT+o5aTrOn5MCtdSK8711CEs78d+s8nLjUxxRjO?=
 =?us-ascii?Q?7znfWfCl2RMvgGt32nxQ1gvvmLKjRa17o0atyRQgUU98lrLjYBCL5YKcemBF?=
 =?us-ascii?Q?AM70SIszpcUMNy+Z5UkfAdGUqKRf+8fuBynNwhHkaggyfJYPzEXvw28phUS0?=
 =?us-ascii?Q?dY/KIizjKnAgtn9B61/94CWnK5EIYsFTBLXqa7QmPcVeFITUeV2IxGd1jMFT?=
 =?us-ascii?Q?NsODtupWY0CuobhFCr31LQ1Gq1/gUdvMrF8u3T6PMWfxeonLiNdWg+iCpuWo?=
 =?us-ascii?Q?09qZC5ZEk5YjiS0aq7SbhcdMhgqvfRKt/7+M8jmHLoDbmS9yMClolf/a1alF?=
 =?us-ascii?Q?KA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b4814634-d95e-497d-6bee-08dd72f19d43
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 20:53:40.9143 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fbxLARY7qEH8NUb6AA3pCfLzLa/qNYLKfCIff7onKNRK87tBpd4EQR5/fVCjjHFWNPQqbwwFTsir3rQYBEoahw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5073
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

On Fri, Mar 14, 2025 at 01:32:07PM +0530, Himal Prasad Ghimiray wrote:
> Define xe_svm_range_find_or_insert function wrapping
> drm_gpusvm_range_find_or_insert for reusing in prefetch.
> 
> Define xe_svm_range_get_pages function wrapping
> drm_gpusvm_range_get_pages for reusing in prefetch.
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_svm.c | 73 +++++++++++++++++++++++++++++++------
>  drivers/gpu/drm/xe/xe_svm.h | 20 ++++++++++
>  2 files changed, 81 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 07511011aba6..5a4cb14d608e 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -714,7 +714,6 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ? SZ_64K : 0,
>  	};
>  	struct xe_svm_range *range;
> -	struct drm_gpusvm_range *r;
>  	struct drm_exec exec;
>  	struct dma_fence *fence;
>  	ktime_t end = 0;
> @@ -729,13 +728,11 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  	if (err)
>  		return err;
>  
> -	r = drm_gpusvm_range_find_or_insert(&vm->svm.gpusvm, fault_addr,
> -					    xe_vma_start(vma), xe_vma_end(vma),
> -					    &ctx);
> -	if (IS_ERR(r))
> -		return PTR_ERR(r);
> +	range = xe_svm_range_find_or_insert(vm, fault_addr, vma);
> +
> +	if (IS_ERR(range))
> +		return PTR_ERR(range);
>  
> -	range = to_xe_range(r);
>  	if (xe_svm_range_is_valid(range, tile))
>  		return 0;
>  
> @@ -757,13 +754,9 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  	}
>  
>  	range_debug(range, "GET PAGES");
> -	err = drm_gpusvm_range_get_pages(&vm->svm.gpusvm, r, &ctx);
> +	err = xe_svm_range_get_pages(vm, range, &ctx);
>  	/* Corner where CPU mappings have changed */
>  	if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM) {
> -		if (err == -EOPNOTSUPP) {
> -			range_debug(range, "PAGE FAULT - EVICT PAGES");
> -			drm_gpusvm_range_evict(&vm->svm.gpusvm, &range->base);
> -		}
>  		drm_dbg(&vm->xe->drm,
>  			"Get pages failed, falling back to retrying, asid=%u, gpusvm=%p, errno=%pe\n",
>  			vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> @@ -842,6 +835,62 @@ int xe_svm_bo_evict(struct xe_bo *bo)
>  	return drm_gpusvm_evict_to_ram(&bo->devmem_allocation);
>  }
>  
> +/**
> + * xe_svm_range_find_or_insert- Find or insert GPU SVM range
> + * @vm: xe_vm pointer
> + * @addr: address for which range needs to be found/inserted
> + * @vma:  Pointer to struct xe_vma which mirrors CPU
> + *
> + * This function finds or inserts a newly allocated a SVM range based on the
> + * address.
> + *
> + * Return: Pointer to the SVM range on success, ERR_PTR() on failure.
> + */
> +struct xe_svm_range *xe_svm_range_find_or_insert(struct xe_vm *vm, u64 addr,
> +						 struct xe_vma *vma)

I think you want a drm_gpusvm_ctx argument here. It is odd to duplicate
the context locally when the page fault handler has already set one up.

Matt

> +{
> +	struct drm_gpusvm_range *r;
> +
> +	struct drm_gpusvm_ctx ctx = {
> +		.read_only = xe_vma_read_only(vma),
> +		.devmem_possible = IS_DGFX(vm->xe) && IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
> +		.check_pages_threshold = IS_DGFX(vm->xe) &&
> +					 IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ? SZ_64K : 0,
> +	};
> +
> +	r = drm_gpusvm_range_find_or_insert(&vm->svm.gpusvm, max(addr, xe_vma_start(vma)),
> +					    xe_vma_start(vma), xe_vma_end(vma), &ctx);
> +	if (IS_ERR(r))
> +		return ERR_PTR(PTR_ERR(r));
> +
> +	return to_xe_range(r);
> +}
> +
> +/**
> + * xe_svm_range_get_pages() - Get pages for a SVM range
> + * @vm: Pointer to the struct xe_vm
> + * @range: Pointer to the xe SVM range structure
> + * @ctx: GPU SVM context
> + *
> + * This function gets pages for a SVM range and ensures they are mapped for
> + * DMA access. In case of failure with -EOPNOTSUPP, it evicts the range.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
> +			   struct drm_gpusvm_ctx *ctx)
> +{
> +	int err = 0;
> +
> +	err = drm_gpusvm_range_get_pages(&vm->svm.gpusvm, &range->base, ctx);
> +	if (err == -EOPNOTSUPP) {
> +		range_debug(range, "PAGE FAULT - EVICT PAGES");
> +		drm_gpusvm_range_evict(&vm->svm.gpusvm, &range->base);
> +	}
> +
> +	return err;
> +}
> +
>  #if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
>  static struct drm_pagemap_device_addr
>  xe_drm_pagemap_device_map(struct drm_pagemap *dpagemap,
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index c8add37614ec..6bb358bf62ad 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -76,6 +76,12 @@ void xe_svm_range_debug(struct xe_svm_range *range, const char *operation);
>  int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
>  		      struct xe_svm_range *range,
>  		      const struct drm_gpusvm_ctx *ctx);
> +
> +struct xe_svm_range *xe_svm_range_find_or_insert(struct xe_vm *vm, u64 addr,
> +						 struct xe_vma *vma);
> +
> +int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
> +			   struct drm_gpusvm_ctx *ctx);
>  #else
>  static inline bool xe_svm_range_pages_valid(struct xe_svm_range *range)
>  {
> @@ -137,6 +143,20 @@ int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
>  	return 0;
>  }
>  
> +static inline
> +struct xe_svm_range *xe_svm_range_find_or_insert(struct xe_vm *vm, u64 addr,
> +						 struct xe_vma *vma)
> +{
> +	return ERR_PTR(-EINVAL);
> +}
> +
> +static inline
> +int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
> +			   struct drm_gpusvm_ctx *ctx)
> +{
> +	return -EINVAL;
> +}
> +
>  #endif
>  
>  /**
> -- 
> 2.34.1
> 
