Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 839BFFF8875
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 04:26:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45CC110E0A0;
	Thu, 30 Apr 2026 04:26:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VWZ/+fQp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6213D10E0A0
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Apr 2026 04:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777523216; x=1809059216;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=pg9gPJSZM5IDsLEXQWnvpyZp7WTd2Ma6u0bnIWaeXZw=;
 b=VWZ/+fQpWjrErVfO8BsGZjiyyjGZg8paBnZVl6BGQm5kuxiZze8RHM/Z
 52u/sKzLNtsZ+A1q3fsid73mVd9U+sL0qVcvaYlV6lprHxDX6dKhdwaiO
 TaXXnPdGOmQ5m41B0P4bF0s6T9oHYSwYeGWtDv2nOtNcU/KXVN6yL5YW7
 LFKjRE8sWOtl3+KxpcIR3Q1Y4+6hb4hrSgh8wevgWEmKPbAcbbsjfhn8P
 OOjgXgzQ96eC3l+j2E4EzABIrecRoqrYq2N44cxEUZScsTqD1jj3BVf7P
 ECiVtt+VYRUCd0Qyyyr//z+n/bM2b6zQvUWvd6Q2jR5GTp3mwjXgQUhY+ w==;
X-CSE-ConnectionGUID: i4RYBE3gQnWb7CN60YKxTA==
X-CSE-MsgGUID: tiB7gtu7TtyzzT6a+GmVlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="81038531"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="81038531"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 21:26:56 -0700
X-CSE-ConnectionGUID: owwrueOrTNyRevNFJrp2cg==
X-CSE-MsgGUID: o0TclfZ4T5m0KGd9N8f+rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="239490752"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 21:26:56 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 21:26:55 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 29 Apr 2026 21:26:55 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.61) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 21:26:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lAVqCg+FUaE55WyAADmSev3m9FKn6291o5pxm14QOwQIOG8+wWcdvPnTUzoRAc+yUqgYor1dOglrufgmpoutbPvYxXc5xeB6XPlPE52KMh29AnIfhlhO3bT4r5ZPAokMfEq5f+QnuAE3L5M6mgUoCA7LHg+s0LzJLHd7ib9D6sN43XEy4NpewefXm8z2hQiPFEdojRmKXNGQVtz/9UX8czi6seCJmFGuRXDtBrK6lpheB2vku31Z7OyJqYyptwlcKKWFOD0Qv0eSNlNLulwCwKJgFwY8n9I/uZcgAMSmQDdTHNqV0NLT5EuL3SY1bZYDc4jr61io8lR0L25zZzeeoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AFoW0fKvU/Skd8Exznae5Z5FFOmBGLxDudU/hdVEPa0=;
 b=Eg9Ak/UwiadJsD7bUgV7vFsQ+ZsJGozuNiMfmGG3alT2CJ3+g7p0jKLt1NaeqFQfY/P/mBWfezFXyjj6Beigu7J3GgYuKLUDplp1PtTC9tg9Xgsr+PGGa4fso+o46amOtDUBdO0I9+WioebcFgtcU8kV/mo0cLWnkryB9bmQw4IEA1vmQBwPoUGGSgLWZ6DxBaCSUtD4Wu7GEW6RnKB0CwNMqoasxyszR4SGhu0l6Nr5Unvv1zbPk0XcIi2O4syBZSUfi4I3WkvW44R1WBY03P1Oa8Kz76dRLo6wS8XbNjpz38B41NMMpWmfZIFLJ8O+LsWjcqJJpytNWcHEkgYqFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DSVPR11MB9889.namprd11.prod.outlook.com (2603:10b6:8:45d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Thu, 30 Apr
 2026 04:26:53 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%7]) with mapi id 15.20.9870.016; Thu, 30 Apr 2026
 04:26:53 +0000
Date: Wed, 29 Apr 2026 21:26:50 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [RFC v2 3/7] drm/xe/svm: Clear CPU_AUTORESET_ACTIVE on first GPU
 fault
Message-ID: <afLaCi80ZDcEFKB+@gsse-cloud1.jf.intel.com>
References: <20260406085830.1118431-1-arvind.yadav@intel.com>
 <20260406085830.1118431-4-arvind.yadav@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260406085830.1118431-4-arvind.yadav@intel.com>
X-ClientProxiedBy: BYAPR05CA0010.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DSVPR11MB9889:EE_
X-MS-Office365-Filtering-Correlation-Id: 1435c2d0-f1ec-4380-27d2-08dea670b497
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: 221n6ES94hZhjDnPtKkpE8VAQLbPPDPuplNipadCPf8LUyHkp5L9WLFpDZYxFpqkvbOCj0Z/wmwl6GyUH0kxZRKffj7ZLlujrfnIHCU/INJP01pC5RIukzjsi2juBQ8V9t5+gnN4FWhkEWYpEOqPZ4vmF+uODHvaJx0e1A+Ni+MdxAgCEzJ5v9kxoYQ89pmV8KSXu4uS29GxIcbAbmkpQjsIosLy3Xj/Tavn8vXGRqajuvNT12xO9Go/lp4q/T+Jy6hqGLV0rkdDxLmmmDqLBhV/0EXkZPnbE3h3fAV4IjUIyLK6TAVIrzyOi0FEKNVnZ26T6K6Sq8QVUdYnkLqYEmhLivc+3Ge80tcMjcugITqI8LkLBaETK4Y+iKbVdLl5Fk0eyZCfolgX9U0OAIFWQpblIOm9xmteGW0aZTb/aUajW14KP5/4M4jHwPi0al9iTgLxONieqP4qmawBqO3ZluGjFcI9kV1YHXDO+IwLo3lfmvMeguQ0dIhHxDAoZTOhzpcqnwYlmffyvHw1qv96IdYYKV/RNVITmMxlKqoNTigZfcv2v4BLIfwVaW3WmZ3dvfxE5GluVJWKkKAZFCujrbxJq/5LmjdfZ8CsmwqC5G8SwPTlMGCH+e+jzCB1ZcyiLOklI+l3Xo1hhnwtVbkxP17Vo7mYiv0bb2KllusA73BLg5Kj7/Q6n+KNpc6gmL7E
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Pn821vlkQpzw4BQBFRClBLOdsOuhfsC3zpmIE22/owutIrlooSJPag6Mrb?=
 =?iso-8859-1?Q?hOLF2BqVeunJAhgvq6MwfqVJ3NKwwLBS7huBk86ZSmZ+KBDIIBQTSQdq4I?=
 =?iso-8859-1?Q?fYvxe2SMuQTsX2FfWGrqiKk/r1MkWFJV4GMOSEMNGhOyOoA2p9vspm5azW?=
 =?iso-8859-1?Q?83fnLZCUZsIxFxLOJ1DCO+3RQILgGTOxW12xsb8HOIZXoDM7jCNQATCfXa?=
 =?iso-8859-1?Q?P0ZezlUyY2WOYdrYvjq1mrUNuztKpGAaVKKHfkWspM1Q+lVYzTWiqMvs7q?=
 =?iso-8859-1?Q?rf2yliSq3oiHToKDiuXu91rwsHqDFz0GWXRHvlR5kl1gbYq9ezKFNeh85Z?=
 =?iso-8859-1?Q?RXofEsXfwJ1C/hShCJ+aKisc/pDTRAjdPJm5UseRlWnm5yg9uS3M/5TWxT?=
 =?iso-8859-1?Q?p7lyY2zjeVkDN9p77kHje7rX8Q3o1jYGZtrPanQFn2gwkE2KAemr9a19kV?=
 =?iso-8859-1?Q?hr175FIjZEcMCGhHhvFRLTrk/ORDbacurS09zbFQ/cxtVzHLEtkjzzUSTC?=
 =?iso-8859-1?Q?7mkhqm7GjTHOqa+iAGg6kvHXwGSrtN7wE+ndLL+kRhG72jDs/W/zb5fydG?=
 =?iso-8859-1?Q?yNrQh7SHma3lTIGNCaKW94fB5aASNSV8R+VXbL1jkjgVAZPFH4QRLfo/+Q?=
 =?iso-8859-1?Q?VFi1rSc00yVVoHTpQOKlxcowT/3jzCdRh7ypuHSQ8G3VwZLeV1auVmJS68?=
 =?iso-8859-1?Q?9FzVYk7thjJ6Ww6ERf0oUow70vzyTReIQo8u+z27wOjmR4OGlmlcQXLlFe?=
 =?iso-8859-1?Q?oTuUXzHwcaJiEW20gq4un1+Uai8IRoMV7vCOgZb/iovfY/E1eof6APdLoJ?=
 =?iso-8859-1?Q?NnNAluk4rZ8a8xoiJ7EecPJtLIDoeesja/1OUOhhFHw2vnm3D2t8iE5xyv?=
 =?iso-8859-1?Q?ghzoAK1Q5NTYu5FqvrRkPQCVLanxz8wD7zoYh/VFl7VNYH2vrBbACgV8Ev?=
 =?iso-8859-1?Q?iRJegYmBcSmk1WoIkopwkI3OnGg4J65ChPhQ56RTFm2U4RWnYK7thD72lR?=
 =?iso-8859-1?Q?FGj+mogzwudKUsd2kuNwobZI4DlbNWN5xzKN/K7YgwitfgJZGPutprwB5I?=
 =?iso-8859-1?Q?GKCnIAVNAND0f8UQIykCUrV7KYWNRf5vqQj27d27dIWXKOJzh5IV15UCcW?=
 =?iso-8859-1?Q?z4aw8oNMNSwLrHUUNmowDYNwyi5+Vtv3nGCBY3KrmwUUK+/TQZEKRGlvbs?=
 =?iso-8859-1?Q?6bG9H48OAcH27fQH+1WQE9vAC96o9bEFut4LnPKlAjHai/W5d4ju4atinW?=
 =?iso-8859-1?Q?GFV3mN7+NjEa90Bl8BSqSiwRT33BZgUkBtBrGe0qBJ5ZCaTVApLqkD+oAt?=
 =?iso-8859-1?Q?P7Tu7Zk7FYpBW0GRDS9wdyNAhVOqBgdNOChkOpCCt7r+Yl7fdgpMTrl2UT?=
 =?iso-8859-1?Q?HUMP2Y4PQbd+eHpdTfZCVHwUZXUUoN2n3tHSoxszwfqSMuqJo8a8e4Hxo4?=
 =?iso-8859-1?Q?ccZgEvd+mc5OHWsjoVuY0fpvQQbB1Zd+74/JTFvCp1zgVy2pSnlhBmpe9g?=
 =?iso-8859-1?Q?1hHRLye5wg6zJOGt84+XgkrEhW9oFJS7tJrSGY5Dxjxq291ltaqfEXL0pA?=
 =?iso-8859-1?Q?2H0kzonv3vanYJ65Gu4LEqquWLad7TdFPIcj/CT/NaUlY9lkH6ih22uW4w?=
 =?iso-8859-1?Q?1CR20RAS0d3VjpOPjbBZvQUaSLAf0MLYlzWwmV3Hu/zVricMXMFAMgcvVG?=
 =?iso-8859-1?Q?JQn0lQJQ6gMXmQMW6OXtDw2LaUHAP6+tzinBKkTjSIJTq8OJSUJXaNikZj?=
 =?iso-8859-1?Q?nNl1hJ2FiTiBzSxzVe3pOBOYwaSxxe7rU7xjlvma5G8QXPnXhGuzIZGHgU?=
 =?iso-8859-1?Q?PNW279owPBW3UYNA+zkkrsadhNaRfEs=3D?=
X-Exchange-RoutingPolicyChecked: tL63h0aoqMURXz2S2+mX4dsutxGLPiDQXYP8WwKw8Tb2j7fjPFZ6exunIfDXIPxyZkv8RsGta1bHt7q0lyHDLCkl8hb/tmcISoJ1PEe90SdmlOKkbgZmFB4Eb5wlAJNC6h1KuKC17PAYEZ8zrQBpMXgxEycOMRErWrB7SK0qiXtcWmtrCO+dhsH93k8ADGyaMwB8ZHaRK9HFmCXUt9u0b6JY7OLzc3x9hAZCB+vltxR4xYzNR31fNcVWwnMZXaEuYUNVQjP/KCY4iIK661BalMleorv30jO5ZEaQcfYn3IpZoet0LNcuz3iEP5SgxP/TWZXgHEMUM32MF6BJi7jeBg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1435c2d0-f1ec-4380-27d2-08dea670b497
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 04:26:53.1590 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rb4jQGtBmzZKzE26A04a1PSjCUuc6s2Rwf6JzVBB5accykmtR+nQnCXH9QH47bcmjdNWXC3FuLF9/AI0IVMuLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB9889
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

On Mon, Apr 06, 2026 at 02:28:26PM +0530, Arvind Yadav wrote:
> CPU address mirror VMAs start with cpu_autoreset_active set, indicating
> they are still CPU-only.
> 
> Clear cpu_autoreset_active after the first successful GPU fault so
> subsequent munmap follows the SVM path instead of the autoreset path.
> 
> Do this in xe_svm_handle_pagefault() on the success path only.
> Prefetch faults that install no PTEs must not transition this state.
> 
> v2:
>   - Move xe_vma_gpu_touch() to the success path in
>     xe_svm_handle_pagefault() so prefetch faults that find no range do
>     not transition the state. (Matt)
>   - Add xe_vma_gpu_touch() helper in xe_vm.h and use
>     vma->cpu_autoreset_active instead of vma->gpuva.flags. (Matt)
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_svm.c | 11 +++++++++++
>  drivers/gpu/drm/xe/xe_vm.h  | 13 +++++++++++++
>  2 files changed, 24 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 5933b2b6392b..fd57c9d41db8 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -1388,6 +1388,9 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  			    bool atomic)
>  {
>  	int need_vram, ret;
> +
> +	lockdep_assert_held_write(&vm->lock);
> +

This looks unrelated... and will change here [1] to read mode.

[1] https://patchwork.freedesktop.org/patch/707294/?series=162167&rev=4

So I'd say drop this part.

>  retry:
>  	need_vram = xe_vma_need_vram_for_atomic(vm->xe, vma, atomic);
>  	if (need_vram < 0)
> @@ -1406,6 +1409,14 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  
>  		goto retry;
>  	}
> +
> +	/*
> +	 * Mark the VMA as GPU-touched only after a successful fault-in.
> +	 * Prefetch faults that find no range must not transition this state.
> +	 */
> +	if (!ret && xe_vma_has_cpu_autoreset_active(vma))
> +		xe_vma_gpu_touch(vma);
> +
>  	return ret;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index bdf42083da86..8d45f896f90b 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -441,4 +441,17 @@ static inline struct drm_exec *xe_vm_validation_exec(struct xe_vm *vm)
>  	((READ_ONCE(tile_present) & ~READ_ONCE(tile_invalidated)) & BIT((tile)->id))
>  
>  void xe_vma_mem_attr_copy(struct xe_vma_mem_attr *to, struct xe_vma_mem_attr *from);
> +
> +/**
> + * xe_vma_gpu_touch() - Mark a VMA as no longer CPU-only
> + * @vma: VMA to update
> + *
> + * Clear cpu_autoreset_active after the first successful GPU fault-in.
> + * Caller must hold vm->lock in write mode.
> + */
> +static inline void xe_vma_gpu_touch(struct xe_vma *vma)
> +{
> +	lockdep_assert_held_write(&xe_vma_vm(vma)->lock);
> +	vma->cpu_autoreset_active = false;

Write mode VM lock seems fine for now, but will likely have to change
this to vma->fault_lock with [1]...

Also IMO the caller adjusting this is too late. Adjusting auto-reset
likely should be basically be the first thing handler does, moved to the
xe_pagefault layer... I noticed in [1] the VMA more than likely needs to
be refcounted but that's a different issue.

Lastly - when we call xe_vma_gpu_touch and go from cpu_autoreset_active
1 -> 0 shouldn't we remove the auto-reset notifier [2] [3]? Keeping
notifier around is a non-zero cost as these are entiries in interval
tree the core MM walks for every notifier trigger, so I think deleting
the notifier part makes sense if this is possible - still wrapping my
head around [2] [3], so take this as a suggestion.

Matt

[2] https://patchwork.freedesktop.org/patch/716552/?series=161815&rev=2
[3] https://patchwork.freedesktop.org/patch/716553/?series=161815&rev=2

> +}
>  #endif
> -- 
> 2.43.0
> 
