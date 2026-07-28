Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B18BDC531F9
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 03:28:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E60C10E509;
	Tue, 28 Jul 2026 03:28:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gg26+VG0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3916510E509
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jul 2026 03:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785209303; x=1816745303;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=68qmtbjX9Yaex9Lq61MBFK3iKCznOgaTObqhrKV365c=;
 b=Gg26+VG0RLhGlPHlblH4XLpL8UsldsXDyX6sbk4KR25xFLBG1K3ZbDwy
 z58xaS/CdcZ0coDYp2F8T0o54Ek4CCVGEyYMG77KDT5uAt+qrXaP+u7x8
 ynq8tzpb5qft0sDnjAyo9TMn6+Z/2Hxn6nZTYFKgWZ60LsyPcjqHy283G
 9NfZekwvGV5O+L7x0TsAYaoCKr+Q1uGp0M2V4EUG/naaeXUP83fpBLWmd
 dlH5tu2g67QxwRFhmRxfAB9P5+HprArD4FCokt2P2p+aFcEAJQdopvVSJ
 JAIabsyj0zPVTsQvatQJfR94Fqj1lkYjd+V9Qh85OnmoMeGmrEWMdkTva g==;
X-CSE-ConnectionGUID: lnC/eWcqS0e864rdwCvxvg==
X-CSE-MsgGUID: Ud/txWd0ShmztaOaN74oAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="85976508"
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; d="scan'208";a="85976508"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 20:28:22 -0700
X-CSE-ConnectionGUID: V6DZgaLMQ1SOGx/5JagHeg==
X-CSE-MsgGUID: lPyp7dbnTUu2idQBrdFrZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; d="scan'208";a="297818367"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 20:28:22 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 27 Jul 2026 20:28:20 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 27 Jul 2026 20:28:20 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.62) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 27 Jul 2026 20:28:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ry2EpGmEpL+RdSX0X4FVE2BdxuRww91dads2VKm8AnmNDH1epi81+xLYq7dZMSutHweqfOtd02/s+d4T4x/9gEJozosfIJIg2J3BA/4DOdU1w3aWFLB5To9I901t5lVe/wRP/3IAX4K4O4O9xSllgfuZOjS62vIZxNtHiksqRd0VntIcDJUTVU/cHm+dRVut8A6TrNhKcAJjDqj8Uo2JS2FtnVjZgsrle01QXMlq9ixswIpV09UzT+Yllo/SaDL0cilGQPp/2Zzq8FItYu7KNIZ3yCZL+y6KcI+6L4P7mem93ayb0wgtoYiItuORFDpNPmBEYJbUEG7AAIrbjYapeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+qC9nFuHUa7ZMjahtzevMVq9ESScB0qLlrSTaDcB1Z0=;
 b=PXDq1yPszBfn+U+dgIFSB5q7xisKHsRuhS66XPeubPm4S0BLeaG6idV9ua3TFUICdt+lA+znuwzwnwg0it2tqIl3i+4WiFjKxwFq/keJJ4IkIE8vLzNKZPkTGQSDRzuBE9/MOPB83iuCa7iSx2trXzDz3PUtRB5uhp299kXp9gWze41au/7bsDmu4C1KVobwLwy/AdtOQg/NyTKzCjANyScQGpod64c5KVgkWp7QiIGQO/f2aYwDmL0wUkXfuGfibkJDtCtCD+06OSVs+rh/L/qk1ZcnhK4N+SaTWYmoF+TA4ihOfGOQkefo92TE+pwuC4CX8oOxnATVTVxZ6ntEGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY5PR11MB6212.namprd11.prod.outlook.com (2603:10b6:930:24::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 03:28:18 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 03:28:18 +0000
Date: Mon, 27 Jul 2026 20:28:16 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v2] drm/xe/pt: check no-DMA huge-pte cases before DMA
 segment test
Message-ID: <amgh0E2u/wcy/Xm9@gsse-cloud1.jf.intel.com>
References: <20260727061342.562020-2-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260727061342.562020-2-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: BY3PR10CA0015.namprd10.prod.outlook.com
 (2603:10b6:a03:255::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY5PR11MB6212:EE_
X-MS-Office365-Filtering-Correlation-Id: 05401428-2148-4f4a-7923-08deec584451
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 4z2h2jfwWf4sZAUTqpSHtBdsqGIl6fykRv4dt+nyljkAIqtiffs3uuJd4SlO+d9OUq5c4WfKVLj88sKBF4JuSGRIwwTKPtZ/1/8Yf24kPjUDBgThiGrj7h2oib0X7+T14b4jQOwlOJWBnB5nD9OCaNcrHZQlAhU7dS3OTLGR0MboUnowGrg/wtNCeyeEXYV+YN0k3yudmW0e37NxGKbvVcya8/RlqgGggkbiAorgDshHqc1SXP+AbgDVd469lhlqiUENzvX/laogodQCJXXwYtzylSWvNOS2tvbKBCeV4hzCgiKgLKTLQZB2sixWGDE3uJmbJrX4jC9NqSTtqcR1lbrIN8dmCPC2HFLBhsCksrqYWuLOpdQXRmYfWrWmNMIDJ+FgFTHne1A//elEy5oP5mcF33WXSMVfVJj5BKEW5vg0KhNjr/AcZVfzn2h9T6y1JYe+JoYTF2Ir74hC19SCQnoixwuvHVa/w8uav5OAfhNotblWY8qfMsMOsS2YWPvalQi19KSmjT5scqS8BX8SXEne3/Tz0FUhFANERXE+J8wE6iqjw8O3QHg0fwRG8lQzskLdxkqKJiRK496pJcu9M7LNXdWxvFCxR0VMpLytWAsiJFSrFSErvq2Wcc1rFiGdgkuPB7xWBYYY2f/ujCF7/0T+U9NFxG7bMsat/XvcOY4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xncqbVtsncupzmwIrTwEUFVWgT9dr4CT5LtAa+NkFdMEOJ3IKXSm2So6nMI8?=
 =?us-ascii?Q?TIMGbbQcjQm6WzqNTPx8HS0lh13DIY7z5salo6h7wX2PTiOLUQ8cePbEbp+H?=
 =?us-ascii?Q?HgLcBnK4iBSheQsmXWeYzEUr3/NIjL/qfL3XuzlPKR8LUqpD4SIKPJ+qvfeA?=
 =?us-ascii?Q?WDkQXOwBZh6xQTvA71MwPMXeRtPex6rrAmbVI5Xba0qOR2AliTS93tOANiDN?=
 =?us-ascii?Q?DiqwFs4JoyVF7PDLB78dM+/R+TLQyXkrW1MxpRrbarXyD0SyctMs/x6deOiN?=
 =?us-ascii?Q?0PiAntDp7oHXaTdSICR2QdzvAkblWP/9Wmo7G0Be/T1jwXnIAZ1EFW/+r1aB?=
 =?us-ascii?Q?Dt2eztVn21Bo/8JkUIIB/ly6nipuJuqeObfXztyIYCTze6HHQEp2+Oxz2eel?=
 =?us-ascii?Q?i9Jm9z1IdPZGUnglm7aAQdjYDnwukpBPkpw8sOczFDwwWYZEM/Xsrn7kYBmH?=
 =?us-ascii?Q?slMX7W/M2zPkjhicKjQBhmAXX4mAT3wr5+ReVNLX3Yx7K/qs4vJ+fNqKCO8q?=
 =?us-ascii?Q?OMlO5UavkF0UcPL3ctBkyip6OJQphOWgPB0idnleLw8+Rw8lrBXrcuAKE60B?=
 =?us-ascii?Q?hfwWMAK9KRBxJrhdyCtIsuS+Zuqtf+SieWsNH1IU2+kGFxW50xycUO+pdoME?=
 =?us-ascii?Q?NnOeyno4lY4TUNkD613tGsHRHpJ8/kosevgD57J8WKNIXcsecf0Ya6O7pptu?=
 =?us-ascii?Q?BKVVK80ATs3N+COCH6XOPj9PL9uv6pI+gvNr/toCHOW4VOwE01jWFuVoIwQK?=
 =?us-ascii?Q?OLJRJmEEBYM8rGIPS1m2H0aZmL/hEivjb0cl0luRQOqbgtwoSe/I53m+fwrr?=
 =?us-ascii?Q?iP/Nt61KFvPIkFKLCTpMUPgaQdL0Ha3mic6OMjv9/nXs5emubUPXy1hzF2rk?=
 =?us-ascii?Q?tP39w6JOtZdTaxNormXVQiFG/8u+L4S2+dwObNXKPxVchrV8l81qsfa6p4hr?=
 =?us-ascii?Q?wzdzeRI4XYATA7tcyvMRZH9PKDDGDev8+seTH1vcwUMx+KoSRPZsADYMmbUx?=
 =?us-ascii?Q?sRgskLdAs3ZL9rc0PJOPfftUwK0sxS83GNxfArC3G0FB0rFu3j7WtSMkOqyL?=
 =?us-ascii?Q?cuS4i6Sx1yRKgkEKrKjwNfkdRBgNl1mgN0ETXaHdZpSEjb24TllDk/Nr7JGc?=
 =?us-ascii?Q?9hq1jUWjPq+6ncqdXr1+FrJpNhAUeQEBcUt2+v8xdDVwk4yww98ZQV51mmi2?=
 =?us-ascii?Q?lq6GYqF/NCE6Z1CzIYjIDc9QcHhpyi1Z/mublpoH+rPzWH/8XLoT9svzMlDU?=
 =?us-ascii?Q?Yb2RChxyHw3Oy8Y1eY2XEFkYPmmsky7s9uNVeMOVM3uEShhb4De10lsbSk7i?=
 =?us-ascii?Q?GB6UgPAsaLkZ8OqQreoClANgATUusAunVWQ7YIi6sxcrr8teSQ9dkST7ucNi?=
 =?us-ascii?Q?wNVJZ2TyUfmaU7LTNttrjfJ+cb1Az7XqcXkAxgpJHdlVcjQ/EeG5e0naEO6i?=
 =?us-ascii?Q?4FqePYoyZCutOeaki4CCTk/cuuoe8KocaAjyWNUbXQE/kfd6mHN25sSvI2Z5?=
 =?us-ascii?Q?PqIFWNTQzUnVAZ7RlQnrBiDnxFEAUD34wsecCj7yE5I8YckkdiYunbNwAOeN?=
 =?us-ascii?Q?T/NtmiO42zKfILSY9xDwITY/LBl4SaD5nDWw4JW3l/VKjjm5Asgl81mfjTfI?=
 =?us-ascii?Q?MnNHZ+dUu5c+1THEZdGrA44J5cnaYOHbvQMNOHCCN2DSlLEBRf8lstcJStKf?=
 =?us-ascii?Q?ClwRCV0XX002W2fEtl0F5kdPVO1oxxUMRFLe+J/03ROA+EG9Z7zKPinlq9s9?=
 =?us-ascii?Q?8hMPzTVBWw=3D=3D?=
X-Exchange-RoutingPolicyChecked: o3O8O0pJ9Imz3yfCLIw43zZEtzdhcDqVPS8aM+r3unZ2lBgE35z7ER8DvLY22P7jkknpXTlTg8+62wy3ULkLDNzXvbRQ43G5gLhUOw9uVvwPIA+L/OcVjRStO28bua+X48iSne2XaWibgx27O6cBNfsrPqft3Iu5Vq/0bW/xYUtppV/1cpRETG1WlVZu1jKFPotc0BepJFZ1V2VkG+LG7W0Jp7CLwZ13ZUwQmySNaBCFyHG9kabm7Y91qjasAk+ioha8JP5nzg7ZRCyULylSsM0sbraJasyRF9PqaXHqCArSvQxu6z7PCS8VqnHBnSP13zVeBYSsrAPGeV9J51WWrg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 05401428-2148-4f4a-7923-08deec584451
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 03:28:18.2796 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eR4vlf0553vyUKqWOuJDymb2jfRE8dUYn2RN+Aq5wqziiXV14CXmgqHB0HuLgVG9cLCqIMhfkzB4rX7VpIQ68A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6212
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

On Mon, Jul 27, 2026 at 11:43:43AM +0530, Himal Prasad Ghimiray wrote:
> On a non-range clear, curs.size is never set, so the segment test
> (next - va_curs_start > curs->size) returns false for every level > 0
> before the clear_pt short-circuit is reached. The clear then descends to
> level 0 instead of forming a huge zero-leaf, wasting page tables and
> risking -ENOMEM on unbind.
> 
> Move the null-VMA, purged-BO and clear_pt short-circuits above the
> curs->size test. The bind path always sets curs.size, so it is unaffected.
> 
> v2
> - Also set curs.size on the clear path so the cursor stays meaningful
> during the walk. clear_pt is only reached with range == NULL, so assert
> that invariant. (Matthew Brost)
> 
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Fixes: 5b658b7e89c3 ("drm/xe: Clear scratch page on vm_bind")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pt.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 598c6b2571e7..0e9d669620b9 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -443,10 +443,6 @@ static bool xe_pt_hugepte_possible(u64 addr, u64 next, unsigned int level,
>  	if (!xe_pt_covers(addr, next, level, &xe_walk->base))
>  		return false;
>  
> -	/* Does the DMA segment cover the whole pte? */
> -	if (next - xe_walk->va_curs_start > xe_walk->curs->size)
> -		return false;
> -
>  	/* null VMA's and purged BO's do not have dma addresses */
>  	if (xe_vma_is_null(xe_walk->vma) || (bo && xe_bo_is_purged(bo)))
>  		return true;
> @@ -455,6 +451,10 @@ static bool xe_pt_hugepte_possible(u64 addr, u64 next, unsigned int level,
>  	if (xe_walk->clear_pt)
>  		return true;
>  
> +	/* Does the DMA segment cover the whole pte? */
> +	if (next - xe_walk->va_curs_start > xe_walk->curs->size)
> +		return false;
> +
>  	/* Is the DMA address huge PTE size aligned? */
>  	size = next - addr;
>  	dma = addr - xe_walk->va_curs_start + xe_res_dma(xe_walk->curs);
> @@ -775,8 +775,11 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>  	}
>  
>  	xe_walk.needs_64K = (vm->flags & XE_VM_FLAG_64K);
> -	if (clear_pt)
> +	if (clear_pt) {
> +		xe_assert(xe, !range);
> +		curs.size = xe_vma_size(vma);
>  		goto walk_pt;
> +	}
>  
>  	if (vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT) {
>  		xe_walk.default_vram_pte = xe_atomic_for_vram(vm, vma) ? XE_USM_PPGTT_PTE_AE : 0;
> -- 
> 2.43.0
> 
