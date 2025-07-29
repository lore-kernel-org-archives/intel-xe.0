Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D5C7C87FC9
	for <intel-xe@archiver.kernel.org>; Tue, 29 Jul 2025 05:41:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60B3910E1C8;
	Tue, 29 Jul 2025 05:41:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LHIajv8R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58C0410E1C3
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 05:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753767679; x=1785303679;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jGxXyKOGTHAI1S4nvC+Shgj+YkUhGYjnhpBLsELv4tw=;
 b=LHIajv8RSrCXuqdPAuBehIbCGDAyXmDg1MwRpo9rgqFCalWOoOY6qeTw
 nyhGYLTCgNCwjCFAHvmXK3EV+FJkzyYLA3yeOldYqhom9kF6uzO1IMwG6
 pIaNL/CkH7ubU/wdvqt03hb+ClBD6F+VC4xpWgo4YAJysG6TZQCycu/+U
 +4FiMYk0xIzjDg4O4Ck4Ru4bHevPT66a7Tn1/Dz3ju6dlug5gfULY0+ds
 7NX4iOUU2RQaxEnLT4GMIV8yyl8lS0KocDn9YcOhY88ppbQUUCWuh9Oag
 bvs5gvMKmqGRhEIL/zbaH6sxQ2Nvv3r8H4jPT+XYyBZFyltGy6wkxlrUZ A==;
X-CSE-ConnectionGUID: lej4C4QYR12ecsc5tzomwg==
X-CSE-MsgGUID: PfYVKC7jRsaVB0TXOv75nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="67462566"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="67462566"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 22:41:19 -0700
X-CSE-ConnectionGUID: vXgNnWPWRhepm9USIoPkfg==
X-CSE-MsgGUID: gO1PCwXfRRaHzwtVEhEcNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="168012828"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 22:41:19 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 22:41:18 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 28 Jul 2025 22:41:18 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.67) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 22:41:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g82ywhLeQku2OQz3LMVj7vah6YhFlezAP4GwMsIyEK5BWMxAE1/7uCu7FaXJfYd0gcXIxcKr0HDM8GJK1RqLsbqM4fXS9vWU/BJ7C9xNKtyf+xwkVVzJzIItvCLBuly9Mgg7FOyf4WTaMkVx8XGMP0PDAvFiR+1phGPDpYfn2BYrD0+Ttdnl8lhPEmYQiSWE26OGXAHrCJLYUQjf2lFWRJn+vPjKh7+hpO+LtNb/udwVuIX4iNdvQu+XgufGEqK/Jh1k5QxSe53hyuPBULPai87xLPB+CauMeTNd2Cv0Ir3fE7glxih0m7zcOggFrWEtQVbgNJoBdwPH/pj8DNm/lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z1VG2szWnlXoQIzgP2jRwb/rVeFyJVXjixxfpKRFjKE=;
 b=Zs8NuwOAFJqCyxnBZltqSBAW4laJxUeqr+9SyeJgczwJhpTeDo00wTs+kd6h7VS/+VrZfSXIXOMl4gkjYpQ9LqUNUee3KxCQEPF2GdDz4QcxeuUQXrhXHJ6YZUdY1uUOphe9v17Sshz4VHVW02WgcJhQRDmsOKcSSlSiim62BNEXFcDIybwgc755ExHSh4YEs9dOVurjKuxLd7kPzV7oD25TFt36Xv2wv/f/JJlIORteDfazVC5h6gYDe9CZTkhjwceP9VBfkTi53AIZ3NuVr8GvkhMTktd2Mr6yPeKORdCmKGcUOjBc0pnCsuVezc6bDpYpIDDoj9wnC4f3SuT8iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN0PR11MB6301.namprd11.prod.outlook.com (2603:10b6:208:3c3::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Tue, 29 Jul
 2025 05:41:16 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8964.026; Tue, 29 Jul 2025
 05:41:16 +0000
Date: Mon, 28 Jul 2025 22:41:14 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v5 20/23] drm/xe: Reset VMA attributes to default in SVM
 garbage collector
Message-ID: <aIhe+nJCv5PQ2Y1d@lstrano-desk.jf.intel.com>
References: <20250722133526.3550547-1-himal.prasad.ghimiray@intel.com>
 <20250722133526.3550547-21-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250722133526.3550547-21-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR04CA0071.namprd04.prod.outlook.com
 (2603:10b6:303:6b::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN0PR11MB6301:EE_
X-MS-Office365-Filtering-Correlation-Id: c19e49f5-846d-4af6-e9e3-08ddce628960
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Z0RYklVZeKGHIj6HhN2GwY1UblDiPgE4m5bMjy9/x46EpLMh5ZGMGZ5h+lzP?=
 =?us-ascii?Q?ebSIG8MVrFPuo0jzFOyPuRL7KcZ/kX+Dy+0FG8wwhZDDZQfzpMoT81PBGTGB?=
 =?us-ascii?Q?fEZVZkjo1j0npCeetiRVCOHraEEi6t9+ka2sNY7zK1IcB5Bp9PyBF7wZUdwj?=
 =?us-ascii?Q?IksGdmgFlzd9CUC3ufRrQXc2gzSqIvqpJr7i4gFBfdVC63FFTdHZMXhI+7ts?=
 =?us-ascii?Q?op4MQTNCbiBzTkCNxGIniFjqviOsyIXpyCdeiHjZymbiXv4Pztcoj19lEzX2?=
 =?us-ascii?Q?fWLnD4jMywd0/rmJo8CJn9tZ2/GCYCeFxnGOGBkoe3ewEMGgIzv41LW+bW2D?=
 =?us-ascii?Q?u/uZSyKm5mNoVEnl5dZsfAZUQYByUDs+I6+dTteeVyJ+2jiypivKZ/274MtO?=
 =?us-ascii?Q?et3PvxJeHjJE0sgi1D1t6BEp/IoIlJIbv3E1w2lSwZvvyRJjaN+nsC7fGc67?=
 =?us-ascii?Q?vzhSVHJEJKuQZkC+oGXs/BAyVvL7fzUNZVKM5UYPFHc1+dWTcznIq1rSG8Hr?=
 =?us-ascii?Q?XnjNPJ5dV8X0XNgPWRHFZEtavYN5FAZJfT2B0VO6160x3NzTBZpnNnV5BfnQ?=
 =?us-ascii?Q?F3C+IcYU0p3S89Ehm/JJli959asYRzZK+guPPTQvjwaSACS/kFgZn1DXgztm?=
 =?us-ascii?Q?Oke1MU7pC9tJmkEQxlwhH/E6XJss0smRIfhkMqRn+G/rXlEP+zGrjolCkz0K?=
 =?us-ascii?Q?+rr6upqFpFlbhoz3n5cuemQ6o1NnIvAITAN3fD1v6UxEHNV+AiUYVxbfhH3e?=
 =?us-ascii?Q?r1TS+WrQMgpT+e6HcxAFAgrZwnzp4cZpuCw8NTBzduDYsUI9P3/7wbKtHtNB?=
 =?us-ascii?Q?qEWLQKux5Fdq9yGRJRAyspzrsGC2BmPfp79BGTFos/VwzKRT4oqZOvToph71?=
 =?us-ascii?Q?QBF9BmgSW4OzglGSTnaHvl8urg37nYqUWrSTKCXwIABNl0aXyXRsHceaZ0EG?=
 =?us-ascii?Q?wYg6pNa5qu5zkhppUP7SV63mFfZkMHa7SUbU/q7G0dEqZ7IgkZ0jrDEUvCmE?=
 =?us-ascii?Q?iXHZ/f01BiJyidOjBrFFdva9jrb67411yq+PEB3+bA3dQqxsQnqPcouPinCu?=
 =?us-ascii?Q?TZdUbSo8YWON/clkRNRfxM1FcnvdFzyxlIzFibp3WR7RRk2eBpwzf74H60uH?=
 =?us-ascii?Q?ojA3ulxia6j5J1/lXB5tCw/Qe97wVciazlHZgllXFENFa3mgXUkwJzazHNt/?=
 =?us-ascii?Q?ZfaAkB2V43zM+0WUfaif/Dnb0tFdIidl5JiRS9u8hQGtrIBxbLb6IqcqMDkE?=
 =?us-ascii?Q?zfK+LsCVUFh/PQBZd+JGGetGOSVeBq/HNDMfxfGHiDii6RgPmPEiVn+w4PMH?=
 =?us-ascii?Q?hECIFTVT5u/DxBSARDkdoTfiA/cLU54/tvJRNvSNbH1e3cit7Tm/grnM3j7f?=
 =?us-ascii?Q?R8I2maOLqhu8ZN79c+8+a1XKip6SD+gzM7VqlMRLQZ9lnqPj5JBtoEJp5zt+?=
 =?us-ascii?Q?36xVN9eoAsc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YAZ3mg3KntOgZLXTN9wFimwwXiLM2kuzip2ObiDGvl7GMNgwP0YeGLuEShGK?=
 =?us-ascii?Q?wrhpxI9DjTXnMZO/rNCumHKyDeyN2YFJxjwQVWrlnIANBq82DAfltUkBQOpT?=
 =?us-ascii?Q?+tKsyIifUN83nF5Wt/13GZDOtfaKVBh5YVbSdJ2IzkKOxwApY/Y4xecnocfg?=
 =?us-ascii?Q?KK12MY8va1cbllIXoES9M7eW0c/1lAt1h2/3XiiCNwscrI48PguoWz5jRnwY?=
 =?us-ascii?Q?lOZObHvZAdnY55sEpeD5PyGg+eaCrhQWBSto1+JcrHmVQbf4J3c4vXBSroNp?=
 =?us-ascii?Q?tUjr4KyKycWwaFhmrdPyd2+fk6cyge1Yx0iokv5R9MBkD8dIHwojCjiWSbJU?=
 =?us-ascii?Q?pxkIR8kT+L9HBIlvc7i8yaYlW6lWynkP0WVf3UrRq37pfHOGo8ifvjB1fGh4?=
 =?us-ascii?Q?Qs7jionsNTVNoU3gXCn4mmm2bAzsv6YNnI8Z+2CriQruHrV80bnz5/58ZA2/?=
 =?us-ascii?Q?4NMLk/47G9xfMyKoYB/uc+P+2O3ODyt1ttD9AJb9M39wWzHISTJfVndCqJNR?=
 =?us-ascii?Q?p8afn9ahIWfbRYPvGSODLpfbWcdhmypBAJQFAjdfnSxNj2qKtVt2dJsZR+rt?=
 =?us-ascii?Q?awJpJIp+M5HotZDz3vCe8NQE1hN3V+YljfAX7yc+qMvjynfrgsoCtn/ONDhm?=
 =?us-ascii?Q?s9Z/jBXoVB3QnOuO4z0sGrt4dwPzkFqSNAJBiLcDgOqtf5CPJ+5FRJfcDnqj?=
 =?us-ascii?Q?7rjAwT+Tezidw1qOH3PO9bpBUzq/1kilivbWShdkbHCjRjGv1dVSf7bwEQ6L?=
 =?us-ascii?Q?82OTNSU/Y/GKxnIGr9vSQdgiQJZvyuqyMPBB/9FijWipwkPcFDdiR4N1U7OO?=
 =?us-ascii?Q?ZHkaVVq/sXTbQL4a/CtGgiHZNLl3s6i74F2no6ytqN/PkI8Rqc2XI1602GES?=
 =?us-ascii?Q?iMAxplYLt60+/73J+AAt/KJjQVhzfOpKY0tmfKHtNz6rhaiH2IA8AbI0uMse?=
 =?us-ascii?Q?zH+hfEFyyzxKc7MDsMzgO0Y8/Ti4dPu7CYbhH+HL0gDDpgC7I/ZH9xvkuYyf?=
 =?us-ascii?Q?jGZvgBBSU9vgYh2CYzFjxA8yN19TBSZyzFWtlKpj+HCY9gntbxjyl3XmLdBZ?=
 =?us-ascii?Q?/Twth+l+7ZTZgvRpzb2Z89Sr7rckqS3lb5VDMPqTPfemqbdlJrDM6FVYIqbc?=
 =?us-ascii?Q?PkozEGVMJc2SaxIxrmek9pNqZs8OjFmtNfkN68oqJbTIAzy+beD/3QM7N5Pa?=
 =?us-ascii?Q?eT1w1A3t25+m96MS97C1QqG3AvemfVEG+kSHSW+RpTl0dYGdEKNADWbjkhmX?=
 =?us-ascii?Q?eSgNv9td+VgtoMYJdvTS7vKu4uKAO6PEPPHx0Jvf3AAAgaoqgIUmyJCjkYCX?=
 =?us-ascii?Q?QkJTkyNWMhzjjPp4Sw8dWxzC2ZJbu4dgJ9MKZZ9phuULFsMMbpFLA5miUrRX?=
 =?us-ascii?Q?co6/BcseUgEAaXa+oz17y/xq4u1tPh3AJz9Ef25m9SoaU+TQgFgzfByxf2zg?=
 =?us-ascii?Q?m/FwZG8ZWoLU1s//7DwOeeUzJAEa0rduYGGpxa9O0G7JJz6Ix3gxEIcDRH4k?=
 =?us-ascii?Q?gEpwuKbZGvg0AjqRZRCgx9rK1osMpnvdJakyINmptcZSvijJivBFllmy30UT?=
 =?us-ascii?Q?rg+RbM8JPrI4Zbg6s6AvQoIeTaJO+GVQz9NbxlU4DuHEdAsZtQ+W38i7eVit?=
 =?us-ascii?Q?qw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c19e49f5-846d-4af6-e9e3-08ddce628960
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 05:41:16.4553 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yZGWuShbj/AXJcC0Zij3WnqSguaalfH6pdRtk+9/Zi0y7jm2WnYx6h8y1sn16qALwKitc/+3KFV/4DhssiUOeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6301
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

On Tue, Jul 22, 2025 at 07:05:23PM +0530, Himal Prasad Ghimiray wrote:
> Restore default memory attributes for VMAs during garbage collection
> if they were modified by madvise. Reuse existing VMA if fully overlapping;
> otherwise, allocate a new mirror VMA.
> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_svm.c |  34 +++++++++
>  drivers/gpu/drm/xe/xe_vm.c  | 140 +++++++++++++++++++++++++-----------
>  drivers/gpu/drm/xe/xe_vm.h  |   2 +
>  3 files changed, 135 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index ba1233d0d5a2..79709dc066b9 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -255,7 +255,18 @@ static int __xe_svm_garbage_collector(struct xe_vm *vm,
>  static int xe_svm_garbage_collector(struct xe_vm *vm)
>  {
>  	struct xe_svm_range *range;
> +	struct xe_vma *vma;
> +	u64 range_start;
> +	u64 range_size;
> +	u64 range_end;
>  	int err;
> +	struct xe_vma_mem_attr default_attr = {
> +		.preferred_loc = {
> +			.devmem_fd = DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE,
> +			.migration_policy = DRM_XE_MIGRATE_ALL_PAGES,
> +		},
> +		.atomic_access = DRM_XE_ATOMIC_UNDEFINED,
> +	};
>  
>  	lockdep_assert_held_write(&vm->lock);
>  
> @@ -270,6 +281,12 @@ static int xe_svm_garbage_collector(struct xe_vm *vm)
>  		if (!range)
>  			break;
>  
> +		range_start = xe_svm_range_start(range);
> +		range_size = xe_svm_range_size(range);
> +		range_end = xe_svm_range_end(range);
> +
> +		vma = xe_vm_find_vma_by_addr(vm, xe_svm_range_start(range));
> +
>  		list_del(&range->garbage_collector_link);
>  		spin_unlock(&vm->svm.garbage_collector.lock);
>  
> @@ -282,7 +299,24 @@ static int xe_svm_garbage_collector(struct xe_vm *vm)
>  			return err;
>  		}
>  
> +		if (!xe_vma_has_default_mem_attrs(vma)) {
> +			vm_dbg(&vm->xe->drm, "Existing VMA start=0x%016llx, vma_end=0x%016llx",
> +			       xe_vma_start(vma), xe_vma_end(vma));
> +
> +			if (xe_vma_start(vma) == range_start && xe_vma_end(vma) == range_end) {
> +				default_attr.pat_index = vma->attr.default_pat_index;
> +				default_attr.default_pat_index  = vma->attr.default_pat_index;
> +				vma->attr = default_attr;
> +			} else {
> +				vm_dbg(&vm->xe->drm, "Split VMA start=0x%016llx, vma_end=0x%016llx",
> +				       range_start, range_end);
> +				err = xe_vm_alloc_cpu_addr_mirror_vma(vm, range_start, range_size);

I missed this corner, if you call from the fault handler the VMA it
looked up originally could be gone, if you modify the VMAs you need to
signal the fault handler to lookup the VMA again.

Matt

> +				if (err)
> +					return err;
> +			}
> +		}
>  		spin_lock(&vm->svm.garbage_collector.lock);
> +
>  	}
>  	spin_unlock(&vm->svm.garbage_collector.lock);
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index d3f08bf9a3ee..003c8209f8bd 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -4254,34 +4254,24 @@ bool xe_vma_need_vram_for_atomic(struct xe_device *xe, struct xe_vma *vma, bool
>  	}
>  }
>  
> -/**
> - * xe_vm_alloc_madvise_vma - Allocate VMA's with madvise ops
> - * @vm: Pointer to the xe_vm structure
> - * @start: Starting input address
> - * @range: Size of the input range
> - *
> - * This function splits existing vma to create new vma for user provided input range
> - *
> - *  Return: 0 if success
> - */
> -int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
> +static int xe_vm_alloc_vma(struct xe_vm *vm,
> +			   u64 start, u64 range,
> +			   enum drm_gpuvm_sm_map_ops_flags flags)
>  {
>  	struct xe_vma_ops vops;
>  	struct drm_gpuva_ops *ops = NULL;
>  	struct drm_gpuva_op *__op;
>  	bool is_cpu_addr_mirror = false;
>  	bool remap_op = false;
> +	bool is_madvise = flags == DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE;
>  	struct xe_vma_mem_attr tmp_attr;
> +	u16 default_pat;
>  	int err;
>  
> -	vm_dbg(&vm->xe->drm, "MADVISE IN: addr=0x%016llx, size=0x%016llx", start, range);
> -
>  	lockdep_assert_held_write(&vm->lock);
>  
> -	vm_dbg(&vm->xe->drm, "MADVISE_OPS_CREATE: addr=0x%016llx, size=0x%016llx", start, range);
>  	ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, start, range,
> -					  DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE,
> -					  NULL, start);
> +					  flags, NULL, start);
>  	if (IS_ERR(ops))
>  		return PTR_ERR(ops);
>  
> @@ -4292,33 +4282,56 @@ int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
>  
>  	drm_gpuva_for_each_op(__op, ops) {
>  		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
> +		struct xe_vma *vma = NULL;
>  
> -		if (__op->op == DRM_GPUVA_OP_REMAP) {
> -			xe_assert(vm->xe, !remap_op);
> -			remap_op = true;
> +		if (!is_madvise) {
> +			if (__op->op == DRM_GPUVA_OP_UNMAP) {
> +				vma = gpuva_to_vma(op->base.unmap.va);
> +				XE_WARN_ON(!xe_vma_has_default_mem_attrs(vma));
> +				default_pat = vma->attr.default_pat_index;
> +			}
>  
> -			if (xe_vma_is_cpu_addr_mirror(gpuva_to_vma(op->base.remap.unmap->va)))
> -				is_cpu_addr_mirror = true;
> -			else
> -				is_cpu_addr_mirror = false;
> -		}
> +			if (__op->op == DRM_GPUVA_OP_REMAP) {
> +				vma = gpuva_to_vma(op->base.remap.unmap->va);
> +				default_pat = vma->attr.default_pat_index;
> +			}
>  
> -		if (__op->op == DRM_GPUVA_OP_MAP) {
> -			xe_assert(vm->xe, remap_op);
> -			remap_op = false;
> +			if (__op->op == DRM_GPUVA_OP_MAP) {
> +				op->map.is_cpu_addr_mirror = true;
> +				op->map.pat_index = default_pat;
> +			}
> +		} else {
> +			if (__op->op == DRM_GPUVA_OP_REMAP) {
> +				vma = gpuva_to_vma(op->base.remap.unmap->va);
> +				xe_assert(vm->xe, !remap_op);
> +				remap_op = true;
>  
> -			/* In case of madvise ops DRM_GPUVA_OP_MAP is always after
> -			 * DRM_GPUVA_OP_REMAP, so ensure we assign op->map.is_cpu_addr_mirror true
> -			 * if REMAP is for xe_vma_is_cpu_addr_mirror vma
> -			 */
> -			op->map.is_cpu_addr_mirror = is_cpu_addr_mirror;
> -		}
> +				if (xe_vma_is_cpu_addr_mirror(vma))
> +					is_cpu_addr_mirror = true;
> +				else
> +					is_cpu_addr_mirror = false;
> +			}
>  
> +			if (__op->op == DRM_GPUVA_OP_MAP) {
> +				xe_assert(vm->xe, remap_op);
> +				remap_op = false;
> +				/*
> +				 * In case of madvise ops DRM_GPUVA_OP_MAP is
> +				 * always after DRM_GPUVA_OP_REMAP, so ensure
> +				 * we assign op->map.is_cpu_addr_mirror true
> +				 * if REMAP is for xe_vma_is_cpu_addr_mirror vma
> +				 */
> +				op->map.is_cpu_addr_mirror = is_cpu_addr_mirror;
> +			}
> +		}
>  		print_op(vm->xe, __op);
>  	}
>  
>  	xe_vma_ops_init(&vops, vm, NULL, NULL, 0);
> -	vops.flags |= XE_VMA_OPS_FLAG_MADVISE;
> +
> +	if (is_madvise)
> +		vops.flags |= XE_VMA_OPS_FLAG_MADVISE;
> +
>  	err = vm_bind_ioctl_ops_parse(vm, ops, &vops);
>  	if (err)
>  		goto unwind_ops;
> @@ -4330,15 +4343,20 @@ int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
>  		struct xe_vma *vma;
>  
>  		if (__op->op == DRM_GPUVA_OP_UNMAP) {
> -			/* There should be no unmap */
> -			XE_WARN_ON("UNEXPECTED UNMAP");
> -			xe_vma_destroy(gpuva_to_vma(op->base.unmap.va), NULL);
> +			vma = gpuva_to_vma(op->base.unmap.va);
> +			/* There should be no unmap for madvise */
> +			if (is_madvise)
> +				XE_WARN_ON("UNEXPECTED UNMAP");
> +
> +			xe_vma_destroy(vma, NULL);
>  		} else if (__op->op == DRM_GPUVA_OP_REMAP) {
>  			vma = gpuva_to_vma(op->base.remap.unmap->va);
> -			/* Store attributes for REMAP UNMAPPED VMA, so they can be assigned
> -			 * to newly MAP created vma.
> +			/* In case of madvise ops Store attributes for REMAP UNMAPPED
> +			 * VMA, so they can be assigned to newly MAP created vma.
>  			 */
> -			tmp_attr = vma->attr;
> +			if (is_madvise)
> +				tmp_attr = vma->attr;
> +
>  			xe_vma_destroy(gpuva_to_vma(op->base.remap.unmap->va), NULL);
>  		} else if (__op->op == DRM_GPUVA_OP_MAP) {
>  			vma = op->map.vma;
> @@ -4346,7 +4364,8 @@ int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
>  			 * Therefore temp_attr will always have sane values, making it safe to
>  			 * copy them to new vma.
>  			 */
> -			vma->attr = tmp_attr;
> +			if (is_madvise)
> +				vma->attr = tmp_attr;
>  		}
>  	}
>  
> @@ -4360,3 +4379,42 @@ int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
>  	drm_gpuva_ops_free(&vm->gpuvm, ops);
>  	return err;
>  }
> +
> +/**
> + * xe_vm_alloc_madvise_vma - Allocate VMA's with madvise ops
> + * @vm: Pointer to the xe_vm structure
> + * @start: Starting input address
> + * @range: Size of the input range
> + *
> + * This function splits existing vma to create new vma for user provided input range
> + *
> + * Return: 0 if success
> + */
> +int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
> +{
> +	lockdep_assert_held_write(&vm->lock);
> +
> +	vm_dbg(&vm->xe->drm, "MADVISE_OPS_CREATE: addr=0x%016llx, size=0x%016llx", start, range);
> +
> +	return xe_vm_alloc_vma(vm, start, range, DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE);
> +}
> +
> +/**
> + * xe_vm_alloc_cpu_addr_mirror_vma - Allocate CPU addr mirror vma
> + * @vm: Pointer to the xe_vm structure
> + * @start: Starting input address
> + * @range: Size of the input range
> + *
> + * This function splits/merges existing vma to create new vma for user provided input range
> + *
> + * Return: 0 if success
> + */
> +int xe_vm_alloc_cpu_addr_mirror_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
> +{
> +	lockdep_assert_held_write(&vm->lock);
> +
> +	vm_dbg(&vm->xe->drm, "CPU_ADDR_MIRROR_VMA_OPS_CREATE: addr=0x%016llx, size=0x%016llx",
> +	       start, range);
> +
> +	return xe_vm_alloc_vma(vm, start, range, DRM_GPUVM_SM_MAP_NOT_MADVISE);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index a4db843de540..f7b9ad83685a 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -177,6 +177,8 @@ bool xe_vma_need_vram_for_atomic(struct xe_device *xe, struct xe_vma *vma, bool
>  
>  int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t addr, uint64_t size);
>  
> +int xe_vm_alloc_cpu_addr_mirror_vma(struct xe_vm *vm, uint64_t addr, uint64_t size);
> +
>  /**
>   * to_userptr_vma() - Return a pointer to an embedding userptr vma
>   * @vma: Pointer to the embedded struct xe_vma
> -- 
> 2.34.1
> 
