Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 618A0C43458
	for <intel-xe@archiver.kernel.org>; Mon, 13 Jul 2026 21:01:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14A3710EB0A;
	Mon, 13 Jul 2026 21:01:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QsDZsMaA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB40C10EB0A
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Jul 2026 21:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783976470; x=1815512470;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JSmJ2UOnyg2ld/BUBpIz2T+z1oxktSVKoickiAR/0VE=;
 b=QsDZsMaAjN0z1b/8uBhPKDjBDhzqR2xqy1EbuiHyY/skMO6/uKTiqdh+
 gV7+NUqrc9cunn0SdRf8qp5J4XEaeGsNjaqY1uZItvDtdFIDEh30jrKRz
 i/naITzYor9t4Yj+3bc6DMXKXG93Zgj+CcDIPZmgxWcWtO9NW+5xH0kxE
 DS6T8Uv/Bw0MDfkf0cutFWoTL2tqD7GhxGoXirYZDe6mFmnvz34fEwmdh
 /dpP6JKQOjmR7rAdDfA8j/+YCB5G5p34p6nKMT0vsuF3aVv5wSiBgmQc9
 IPns5kpwEOFUrVw+vK5hAPGQ+6dGuf9UOILULsNadk1fCEVr6btiOACzO g==;
X-CSE-ConnectionGUID: eEfmoBNjSYK098ib4xbFKA==
X-CSE-MsgGUID: Klj2kHHXQ+e/rA/mYNr7rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="87135045"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="87135045"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 14:01:10 -0700
X-CSE-ConnectionGUID: tNznffcnRziFubgoyl/SzQ==
X-CSE-MsgGUID: XSpYly2rQ7qL8ZnhBNNlNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="251229310"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 14:01:10 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 13 Jul 2026 14:01:10 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 13 Jul 2026 14:01:10 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.53)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 13 Jul 2026 14:01:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XCqh3xFbFBqSsbMAWdxOmBLmfbUbm17A/5xuc98D1PmO+QUXmhnSertr7kKmNciubGCrJCGRROSN4Kr7f313RezY9yN0UnpAofCQ8NFrhe4sPII2zD4qqD9bKqlDqtDhblvT1NyhRvyhkRdxSnmIMQuPPB+ItkZZFDR5mHkP3hIVmbVTOXeobj+WK9QQGBY+J/lW7i7/Le8jKEQAn15/P+nAuCgTT5VvgZx4uz4ylWAUekdSNxL16nD1hDedYA6Yu4qJ7ufDeGkXiC9SJ1nl0HBWwliC0+mL7MtTpx359qqwX1k5DtCKfVODK2GTaK/ci0+Yq6FE/dKwU3jSJ8W/9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BSPiFZ66rZhfCB2WBiNzQyYRLWlr2Mat8Q1XrscWoD4=;
 b=XMwmehgw22B9jl6bhfS4E+TcsrnS7LVG88mQlxa9Ur0GPsdVTuqzxOZantIybQeocA7c2PyIjGUthwh1KjyQyuNGIXUPj1IU4/OhN+E/oDJNewd1LWpQlpG9xsqEoCNiVwfDl5qQsYHvlpyi4SWZl09diHBe4BzvL9iB5ufK4tqXjyg/5kcx7RfRIYpW7mZuFlef2RwP2Mni8TxZC1OYh614XGFyU+hI8xXDjYdTymBMNI8PLvbvJiGLlxRWuTHISg0TIA97zqxOjoYYJCDSIHdHfDCbtPa6OslZt64//53x8t/Z5fzjnAXFgUFgT76JGxO7ZJRcFzIAMOw6+bm+/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL4PR11MB8821.namprd11.prod.outlook.com (2603:10b6:208:5a6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 21:01:05 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0202.014; Mon, 13 Jul 2026
 21:01:05 +0000
Date: Mon, 13 Jul 2026 14:01:02 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>, <stable@vger.kernel.org>
Subject: Re: [PATCH] drm/xe/vm: Reject invalid prefetch region for non-SVM VMA
Message-ID: <alVSDlVhQBy59KlF@gsse-cloud1.jf.intel.com>
References: <20260710021700.3611909-1-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260710021700.3611909-1-shuicheng.lin@intel.com>
X-ClientProxiedBy: MW4PR04CA0205.namprd04.prod.outlook.com
 (2603:10b6:303:86::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL4PR11MB8821:EE_
X-MS-Office365-Filtering-Correlation-Id: cc652fce-ee97-4274-988f-08dee121da80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|11063799006|6133799003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Pty86VZMl8BanNmYehOopNlKdCV0/leF5+rfMma7vqkEqbMedEE+af4zzlkFwcKq69buWviswBVNp6hqny7bgI4q3jsfrvJAYfKrvRwSDjHRl5aawat8rKumUrCxf+LOE8Ho6jvhTk7tyezKBeV0dc81X51evzWK4zZ6jLRymjoYmwmzpXCKXHx3aC3KxBktDhbAxpZoLgRrPHG48BfHA4F77WHZljJGZYu4Yjh1I2H5LcB76ZdUmttXeGgQ2fy7g/5AClZAWacAjoe+KLKb8QX6V1cKrsX6LM2TeR7B/hlzdKGBvHTqityoJXJVcvgJqWMH1Tc7ODzvt2BgLL0VkpsO/k9kT9w//kYzKzjaFKo7S+KMj5f2IjZr2lBb2E7iBUb8a8e3J7MRBIKGY7sLHi61h1Px5TlswahEjOwtccX7fS1lBkigM3qv5pFPsv+oOvi1o7NkZGAHFrdKRVWdkOeDJ0E4Hm7uiv2E0zU34sY6GLHGXFDga2YTMyGZoLQmyBj09HUWnLp3EhpUALHzdTy2AZwBAdO5b/zH6sTn08fMk4p13ddYw2cWUDltlKdT/rOfoomrOHJFcyC7xI8FXev0qsGf01DgqhFRrGmSuLDxbYeQumH8YNMqoNopEpmX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(11063799006)(6133799003)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cqi1m9mjNTbPlCD+RZr9w0edLubLAmwekqC4Kay0C2fmqQRBPOMdy87aEwjI?=
 =?us-ascii?Q?51dIdwHH7oZPnMleh2vO7jLrCiSEOHmkrIgVB4iLegQiDXWYHP2S0EKzeJWg?=
 =?us-ascii?Q?W7s4XEbgG7WbOCvN1pIYjMG41/kRY/fNvvwHa24hs2rvcEy351OMVwBDBmR2?=
 =?us-ascii?Q?mZgKwS7lb5NghnVlM0vSpF2cPXbQXndd4Na/4UcjCb4X8CFkIk4WaSTceWS/?=
 =?us-ascii?Q?jgIMxLlzVZqr2w88PhHetyMBZgalid+h7optOu01JdSgAUhqxI8qEOtbUT0B?=
 =?us-ascii?Q?4NDPPFxwma3vocBBM/+nq6Ka+Jz+HK57DH57eY2nuzo4gE9TAT267D1bQ+ve?=
 =?us-ascii?Q?cMs3sky7piLJcXF1Bm70CBXn5RXT6DeuVx//Gx1DQji/ntMKCM/w5R9ENH37?=
 =?us-ascii?Q?3ULwKveMB5es5JUiKjx33SAvcCubaxgy7RuXsBH3dzOpcWrJdUkfcfa8aDGw?=
 =?us-ascii?Q?tXMAVDEQ3aCaFT2YDSxMKRM124nxfxw7T+5NkE8SWdYST2wjRoQOOueeRhFw?=
 =?us-ascii?Q?UbiOHoq+d9ZHMQL9fwLtsMXyr+FZfnCWVHlBluzwU1eGx/H/RDQqo3+/Qj/w?=
 =?us-ascii?Q?NlzWS/9L7AzVEym1rdXWCl4jK+87KdKMTgOWOyALTmz2JZtS//vxTBAJpFvq?=
 =?us-ascii?Q?3NntVlGlc0H8Q2tXlezLRhbg8Z1zCrt1R4vQ0x5GqhOwAP+0sc7ANj3jCkpq?=
 =?us-ascii?Q?/2K69pGU4q58OeJfaWPMGpiPmnX8uLirHH1+8U4fCwNkiQbfauIV3tPlmL85?=
 =?us-ascii?Q?yARvozKsFoGbTTpeHwCo/Ik71e2nMdV71fXrDjy+etW1DjLKFFrbAW/ibafN?=
 =?us-ascii?Q?gZbnQOGNkEJM57N7jd9uQo+HqKUSVizv9kFlP4WJYgpMB9FPgKf04yfredJT?=
 =?us-ascii?Q?dkwjDN40aF07UPplruWOMRqTpslj5YRyJ6aHa8wgl8FVSmDvs1KLnti0IU8P?=
 =?us-ascii?Q?bL5EAGjt7mWQbQ5iJb58iEOWuBeGB8EOlH4/wYQLAzIKwtWaEIGq6IXE34ea?=
 =?us-ascii?Q?yzeXLs13DAKoc9eNMw2nPNXWpS+2K9DtfpxW9aNqbavlH45EkCIX11pOrc02?=
 =?us-ascii?Q?lFzTS3aWX9rbBGDmFym72oa38tC1giKI65Rfqg4A3V5HO5jIHIavDdaa5CWE?=
 =?us-ascii?Q?8qkFU5p7aeUA8j+962wvqa0DdugnVK6p/le1doKXoH+ADbRHC3QKqMQSdArb?=
 =?us-ascii?Q?8SjnqiA7IHf2oX/3yiMMeGTALzjhl4ae4kQ0lbYR6cMZ4JbLWc1E27xtvzOr?=
 =?us-ascii?Q?MKIR2Uhs++cEyXEjgujhEHnfM8LlWcy5n2RCbYqgDlRrnR+MO2yt4EOwHjKa?=
 =?us-ascii?Q?+qbwdXYzdIByhZytuBqL2VXFKXdLlf+R4UzvdWQmX97wlrnvYG23AFzIEhip?=
 =?us-ascii?Q?rnsQsTj/FAvRIcYbMuEo/gPiVFhYdzBJX3ZV+LMNv6/nFINkCD6WLQpgMjA/?=
 =?us-ascii?Q?zW+6XhG1uKcLSWVJ55cDlho9pozxt3F5eKFLwyi1eAmwHo02OVbINMADFVAA?=
 =?us-ascii?Q?jJoUA5Zjhg0cRF6n1KP/dLLpqkOOR8Dl+8hGJ/Lr6MeBCP3Zz0q0zQLVMiUm?=
 =?us-ascii?Q?vSVcmpw793JGv5EJrpC2MVaUjQE44VJXara8pYWvsS7mKiw/Hz2GU3CaPaXB?=
 =?us-ascii?Q?IQ5ZCxGLQzeXiUwYpXRunqfcyGE7I89hftUqqjF43tt0krUtLgovGt4y5DTJ?=
 =?us-ascii?Q?/6YqEt7RJGLpad54eujSsDKe6t7N2e4J/aMuM4frtRZeIddEQMu0V0Q9y6wE?=
 =?us-ascii?Q?LwvT25sGWdD/9eV1gO34d3xO4b5tnRc=3D?=
X-Exchange-RoutingPolicyChecked: EiSo3q+pGOQwulsLlHhCAJFo9QZCIS8yKPv6K3SksxWTrNAaGR/W8IzGDzFi9yrbCdnXuNmXNW00e0TDZvys7p0h9u1ZVKhJMWwqrOxeM0oozqI0N7SJ+j3TVvjckCtytDe0Fomi8PmKbMHAYM00Go7URAkKW4d0o9w7YrM6TO5alEAJSgpJgAfpy4I+5PMP70OhpGdVQWKA+DnFW1RgEXjbxGjMTrFOdsRna4Tp7Zel1251JcCZ85ONPaFbd2Kt1wtZTifIGiCaKMsDoXQMZAC88XErHn5cIT0Ol0DN4fJs+oP98bf8vf4uxP7yZSLP4gX5DbQWbYE67LhfTK1txA==
X-MS-Exchange-CrossTenant-Network-Message-Id: cc652fce-ee97-4274-988f-08dee121da80
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 21:01:05.0688 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P7ozk8NaV540QEA0dRPt7IJ+tklZhL7HLkUUCV6Sm0ty5u/jZ/DPeE3VWuByspa+3jsh/e6zO7G+zD40cLfVfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8821
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

On Fri, Jul 10, 2026 at 02:17:00AM +0000, Shuicheng Lin wrote:
> DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC (-1) is only valid on a
> CPU-address-mirror (SVM) VMA. On a regular VMA the value is used as
> an index into region_to_mem_type[], causing an out-of-bounds access:
> 
>   UBSAN: array-index-out-of-bounds in drivers/gpu/drm/xe/xe_vm.c:3260:28
>   index 4294967295 is out of range for type 'u32 [3]'
>   Call Trace:
>    __ubsan_handle_out_of_bounds+0xa7/0xf0
>    vm_bind_ioctl_ops_execute+0x9b0/0x9d0 [xe]
>    xe_vm_bind_ioctl+0x19f1/0x1b10 [xe]
> 
> Three related changes:
> 
> - vm_bind_ioctl_ops_create(): For a non-CPU-address-mirror VMA, reject
>   both DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC and out-of-range prefetch
>   regions with -EINVAL. This is the primary fix for the OOB.
> 
> - op_lock_and_prep(): Tighten the xe_assert() to
>   'region < ARRAY_SIZE(region_to_mem_type)'. The
>   DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC exemption is no longer needed
>   since the value is rejected earlier, and '<=' was an off-by-one
>   bound (valid indices are 0..ARRAY_SIZE-1).
> 
> - xe_drm.h: Document the CPU-address-mirror constraint on the
>   DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC UAPI value.
> 
> Fixes: c1bb69a2e8e2 ("drm/xe/svm: Consult madvise preferred location in prefetch")
> Assisted-by: Claude:claude-opus-4.7
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

I think Himal at least fixed the memory safety problem later in the
pipeline here [1]. I'm unsure if he merged that one yet, but I'm
inclined to say this is a better solution.

What do you think Himal?

Matt

[1] https://patchwork.freedesktop.org/series/168913/

> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 12 ++++++++++--
>  include/uapi/drm/xe_drm.h  |  4 +++-
>  2 files changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 080c2fff0e95..9430b2be18e4 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2495,6 +2495,15 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>  			u32 i;
>  
>  			if (!xe_vma_is_cpu_addr_mirror(vma)) {
> +				if (XE_IOCTL_DBG(vm->xe,
> +						 prefetch_region ==
> +						 DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC) ||
> +				    XE_IOCTL_DBG(vm->xe,
> +						 prefetch_region >=
> +						 ARRAY_SIZE(region_to_mem_type))) {
> +					err = -EINVAL;
> +					goto unwind_prefetch_ops;
> +				}
>  				op->prefetch.region = prefetch_region;
>  				break;
>  			}
> @@ -3236,8 +3245,7 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>  
>  		if (!xe_vma_is_cpu_addr_mirror(vma)) {
>  			region = op->prefetch.region;
> -			xe_assert(vm->xe, region == DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC ||
> -				  region <= ARRAY_SIZE(region_to_mem_type));
> +			xe_assert(vm->xe, region < ARRAY_SIZE(region_to_mem_type));
>  		}
>  
>  		/*
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 509202a7b13e..e159c44e380a 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1075,7 +1075,9 @@ struct drm_xe_vm_destroy {
>   *
>   * The @prefetch_mem_region_instance for %DRM_XE_VM_BIND_OP_PREFETCH can also be:
>   *  - %DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC, which ensures prefetching occurs in
> - *    the memory region advised by madvise.
> + *    the memory region advised by madvise. Only valid when the target VMA
> + *    was created with %DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR; rejected with
> + *    -EINVAL otherwise.
>   */
>  struct drm_xe_vm_bind_op {
>  	/** @extensions: Pointer to the first extension struct, if any */
> -- 
> 2.43.0
> 
