Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7626FF8875
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 04:07:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 974B310E08B;
	Thu, 30 Apr 2026 04:07:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YfwAF+nX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C64410E08B
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Apr 2026 04:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777522051; x=1809058051;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=RlnZjg0s2pmRFtrPMPm7by57X2youE5ThIgY+M4guwQ=;
 b=YfwAF+nX8ido/IN+oqnGQD6aXX4H6D94SuSfCF6x1Um0YkmRi8g7V1lp
 u/pW7SYh9u3l7yLfLS+gq9Jsuo++aHAY91aqIcNnsouenuaX+lbLjsmA6
 S/+4N5C24mUlRVuTZVnCr54Go/Amk2eiezDZ5Y4H2/JIDXphzazmxrxBx
 rw4atTkRsIMXGnOs1rRv3PK3Q67ukGcchzFCf2plwIus/4oZgwZexkql0
 d7BTe8qcjc0kAlfcbqz1oNJoxrvHhkGgCxLEpo4noT4b3PhY2tKvUEcYD
 tkHqGwsU+bWe/1CViRVEdF93HHw/gUYDx+Zk1irj1cKNpElRPKdBxUNm8 Q==;
X-CSE-ConnectionGUID: 4GnlmEUHQnW5Unz4GeETug==
X-CSE-MsgGUID: gt1PWsOlTWiE7LsTPKz6yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="81036968"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="81036968"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 21:07:30 -0700
X-CSE-ConnectionGUID: UHB1q+MMR9u8bllN11DXjA==
X-CSE-MsgGUID: ToYpXNyESx+xd/j4WoF8fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="231322648"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 21:07:31 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 21:07:30 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 29 Apr 2026 21:07:30 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.69) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 21:07:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JplFIDPFbebaWAPJkNOdZkEd8cgNGinvWRprwsFaHh/EoxLb7E4oV5e7LXpfYr5uZortp9ZjFbudRIEdVq11e9NQD6Aku3theaRhX66np9ZUjVTmvm0905jViu8DQZ5d8t0Jr5+xPh5rC9981jIgN7eVGh0F8bNdwkY6XTml3s3MKsDvXdllJK9Z2isYMf4rSssYYWeW4Pt5rSmVC6ske+U7UatPYwqBsjAdY0MN7YYasCZt+nM+B3kBPg/lYAYJg7w0MQNjkzCBrShz+NbZZ20W8UouyGHjtNGUeMTNM/H2FaSGu+3foUohh0t9jKIWq6qyz+VhbkXrP4AaO+F+rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lLYw+yPj6b+18IoRJbZOq/2RisQq5bLZ1GdT9wWMRiQ=;
 b=NcVn5nCUb9kxrEifHuFqC6FNJBnb7wJxCDJXhLbuowBlioPJtnR8ARrlGHWtcL7c16BMJHYPftXpxPxHP90wUjNAy71vv7Zm/UWtBKpd4tl+rZPK/eAFsZr08+LpM/BIlbQRh97xUgfH1Hk210N+BzVLbqdfAEcm7XTdBqrn+HdTIk+Kb4etBlT5FqirVeWsBY6p+4/g0OMNTNOb4APPRsz5WIZ3tekRs9U8leg8m4NY9wQD17kF7LjmNCHFNSNZvyKMIxQiIebiUvQbx/xOhNqEATL1vsJxD5/kBylOxCX5CLd9golkipJDwtzu9k2u46BocBznR0cM/kEKq9Ni9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB7155.namprd11.prod.outlook.com (2603:10b6:a03:48d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 04:07:26 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%7]) with mapi id 15.20.9870.016; Thu, 30 Apr 2026
 04:07:26 +0000
Date: Wed, 29 Apr 2026 21:07:24 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [RFC v2 1/7] drm/xe/vm: Track CPU_AUTORESET state in xe_vma
Message-ID: <afLVfDml8ozfA6Te@gsse-cloud1.jf.intel.com>
References: <20260406085830.1118431-1-arvind.yadav@intel.com>
 <20260406085830.1118431-2-arvind.yadav@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260406085830.1118431-2-arvind.yadav@intel.com>
X-ClientProxiedBy: SJ2PR07CA0021.namprd07.prod.outlook.com
 (2603:10b6:a03:505::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB7155:EE_
X-MS-Office365-Filtering-Correlation-Id: 619fea3c-836b-49bf-10ab-08dea66dfd5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: c5Dx5Fg04JFExPV4ZlT6v4UZf6XpQSH8HYrXXPjeAuIBOPnatINdYMd/fQUwkGUN1Tiy6Zxpx1dFHtHBn7CKjrrNZfew0B+Das1BjDj6LAb3ZccrFnRnfOWyAP6jXufRmeRfJZCreV33qyKrzzMApQFdECEeSqyJhl9iSywU70BPDqaRhzGc6D+wzw+knAjvLfV024udDYpYRn3GApY/St+dItSmdYm4a9UJH8TECpkYxXWUwZ03nahhy46gegQwtwnYpY3KtWq8I3EBb45dQQPSsDRqxlye1sPFAp/j6NP/J9U0ZUbxNmKjrTVHn7uEJmPKDmBe3aWyjWFLclrDBa1IOYo9Zz2W7F82jRzz0RSn1JYp0qLKr7mE1wSbOZ11vR6a91q858SKvM344wB/9gi+zB//0+mD5d1jS00XLvz/KZ6LFZYCXg1Wqx+swxYWDI8wAYWKVNy11XHSZvItfXKexysYU1bTIJr1oHxLU1cfcqwqainQfiIpv5EiBI0gsjrqEjHVXfXTybZBXHt2pd6tOi7gLdtCAckmin9zCGUuviGqFNUmD3ILVrFCTWSvvlu2IDo9QWLNM3tSJF8s16fia71f9jkxfrc7RqxhMJsfi29DSzY2gc8eLaVwgPo+wdxaDV/0RlG0+isx52qPRcsbALgn38JQDY/uGUcq1OjKHqYJFxmA1w+tuKAYCHdB65oUpCgmh//TEdo2jFcyu8wNBQlaifBvsuDsxc7wwmM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Jtb3eIh/8H5PALCQVSpu3+6hgFs6zJ7o6gj6b51hWFagAKwMz6RUXSNu5x?=
 =?iso-8859-1?Q?Gn4t7DvKTd3KDQ5VuUTr37vMKZImf97EeerNJHDkT5RbT2BNdZMTv2vCUD?=
 =?iso-8859-1?Q?TL2iF79DljDs/ffVcclGYxShbtgCnJVpOOYGKRj4l93vc9HCXLJj7M+9eT?=
 =?iso-8859-1?Q?VVZo3HI96dMzU1EaqrhwRe4dUw7uesk7ATapLVOQzGiNmLger4i+UFJRUV?=
 =?iso-8859-1?Q?ZXF+o2d5iJi2KgOnZF9ioGWQbDspCBmWH2YXDvD/3ew5fQZ6vswtasZpEP?=
 =?iso-8859-1?Q?C5hF7XndVKymPkIHcFVziyR0SGuwQWEMxUFRCtbYiJFO/drub0ofQM/lFd?=
 =?iso-8859-1?Q?2iNUYF4tIvtbJuJC0pvpprxWw2rd4bwW3TSEjT1SFyUMVVE6k1mmfzfIKQ?=
 =?iso-8859-1?Q?eyjxlyfb9hbFThSwRMYpQ89LnAudsQ0y3mC8la03Vf848gVrPqwlKY/1p0?=
 =?iso-8859-1?Q?06NEkhJfJoyB7P+USSqRaBek/qfxf3Oa2SuXBZtYEGwmtoY7XGldjfFbWc?=
 =?iso-8859-1?Q?tFdpniQHPr08XzOU1EudN+nCwx3fjTlENmX/87SM1kGicIeFeq/PBSxiU0?=
 =?iso-8859-1?Q?Oes1lwj1Cy0UzrIY5dbeVtKWygAgniFEiRGmJvfNPKP9NiZ4DKR4cCpJiq?=
 =?iso-8859-1?Q?rfyf/UFeSLu52VaQdlv0xDDs/2KEoI/8b3IRXYQLDRB7QPi7eSb10bTnCA?=
 =?iso-8859-1?Q?JjBhKSqOVGuCmS/X6RQwgn8S1TxBUQcxJ49mkJt4l643bDrCLsEqTz9ANm?=
 =?iso-8859-1?Q?mS28gOSEnS766pflMZZ9SCotbq5YYqcMkVj+V1XC+i4QvKkJZcj7JaFzBU?=
 =?iso-8859-1?Q?DdWLjhlyDMnsCiK9ud/S84VIC5CA5Rb45yaY4tKMTUmHGNSM+5DZ0LKk18?=
 =?iso-8859-1?Q?tRzWB4QPuhmCfJSCPop04mXLfwyFUQrhCLhDPffl1TPOB2GbciDxAeEIFz?=
 =?iso-8859-1?Q?kJO6aeGXZ+8guepp1h+9E1kXEeNsboFJDzkQFuu7Vxx4YbbXlA+wA934yz?=
 =?iso-8859-1?Q?M2uCQInsDeKxR/VGULu8PhP1rQEaMfghIhHuB/PudiVBVSemulshyqQ4kJ?=
 =?iso-8859-1?Q?L6c0iXKpFqkz/f1tF74bn6elfA1mpmMAa7Y3QfeeOpkUYLG7KdpHk71CHR?=
 =?iso-8859-1?Q?MK4hGUwypY6fM/589swgCJtNr1mdniA4O6nAEE5xXgiDLxGLvZu4jxMg8i?=
 =?iso-8859-1?Q?nnkcVr+sFnUSw6K7OXspxaQipToWhALocWSgqvut4KgH/sqB3T4paRVrqj?=
 =?iso-8859-1?Q?RHMe31hkNfipI6O0Y91j0r0rBttfNOa8bnxRxAYYAfI7Oq8QAUEKhWOOWC?=
 =?iso-8859-1?Q?Au82WknF6/OSP00WJk3YgiJfkiTVExr7HoFjpB9Semjkbhlslj1B/zidVw?=
 =?iso-8859-1?Q?3SRNwWMQmn3pbA2/POKFmh8RLkhLykMYUmlowU2xhY/eaBhopiqWPvAH3x?=
 =?iso-8859-1?Q?WXOKaxOWAT7i6m69wajZpBfwVJSa/s0IZ+fv5BQwFSlKNra1HBjL7Ufilz?=
 =?iso-8859-1?Q?VkV2DNT5v7F4MlOa8zkPbiAmr1nsVM2GAL/xfxuQvq+PU4qJD0RtW42HSQ?=
 =?iso-8859-1?Q?l5fE4+P0dPgZIDXQTURV9E3yOOPY2Tx04HDin+zHcry5lrVb869hPl+GF7?=
 =?iso-8859-1?Q?akeoJVyWG45Adz1P/rhIPvILx3fQwWg3r3u0Di2o8zN4t8pUkwKqY5svzw?=
 =?iso-8859-1?Q?Lhx7O8kiEwuOSAIDuG5ODPFCW99g3RRwMtVrI3fEfGQ0SfeM5XCRaooZX9?=
 =?iso-8859-1?Q?HHZ6BuiUZHObh47o7bh07TZnpXIQhPQ2lRBL0EYPO7Q7xLmdDc/GdFawT+?=
 =?iso-8859-1?Q?HNjCyaDPdp1yO7pUXENudnUa/d/XCAQ=3D?=
X-Exchange-RoutingPolicyChecked: wXyIVGEwSF6uq4k7c8iXoSTAAWfdl0djHmjaf3PqkTE5gJ2NnEc1rU8rN9zEIDsUN4XMu90I3kcGinGZ/cJfflctBVDNCAxsTMVrdzs86Va9iP1FfhphF7+l3epbhzoIbVjTaYneJC6qAl+3WN6bAG3Z692WNNK4aOWwMwslPDENKXJom6hyqt+igU0ZbdaA2mZuHqChlomE8nkTnPLQtciCRlUWvkf2ewPLN3yRgx8ouPp5gopfpWy6B3YKrhGshnmQgNwSosEAvdd/EqQi7PhqBfV/Vc+grYmx/mY7VZtoLNO5u9RyQwgCaofkGrNG5WHZA0VoprLhGlrXBw/Wcg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 619fea3c-836b-49bf-10ab-08dea66dfd5c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 04:07:26.7508 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ymUyFC41ihNXmMsLc3brEYRjLRjIBokZD9tnphml5zAjsev+OZvj1MZGRGJcVHtBXyfUioL3s3ITl/VNE5DMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7155
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

On Mon, Apr 06, 2026 at 02:28:24PM +0530, Arvind Yadav wrote:
> Track MADVISE_AUTORESET CPU-only state in struct xe_vma with a dedicated
> cpu_autoreset_active bool.
> 
> Add XE_VMA_CPU_AUTORESET_ACTIVE as a pipeline-only bit to carry this
> state through MAP/REMAP operations. Runtime state lives in
> xe_vma.cpu_autoreset_active rather than vma->gpuva.flags.
> 
> The state is set at bind time and cleared on the first successful GPU
> fault.
> 
> v2:
>   - Move runtime state from gpuva.flags to xe_vma bool. (Matt)
>   - Keep XE_VMA_CPU_AUTORESET_ACTIVE pipeline-only. (Matt)
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.h       |  5 +++++
>  drivers/gpu/drm/xe/xe_vm_types.h | 10 ++++++++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index c5b900f38ded..bdf42083da86 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -181,6 +181,11 @@ static inline bool xe_vma_is_userptr(struct xe_vma *vma)
>  		!xe_vma_is_cpu_addr_mirror(vma);
>  }
>  

Kernel doc

> +static inline bool xe_vma_has_cpu_autoreset_active(const struct xe_vma *vma)
> +{

	lockdep_assert_held(&vm->lock);

?

Matt

> +	return vma->cpu_autoreset_active;
> +}
> +
>  struct xe_vma *xe_vm_find_vma_by_addr(struct xe_vm *vm, u64 page_addr);
>  
>  int xe_vma_need_vram_for_atomic(struct xe_device *xe, struct xe_vma *vma, bool is_atomic);
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index a94827d7fbec..6a19ecca5518 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -52,6 +52,8 @@ struct xe_vm_pgtable_update_op;
>  #define XE_VMA_DUMPABLE		(DRM_GPUVA_USERBITS << 8)
>  #define XE_VMA_SYSTEM_ALLOCATOR	(DRM_GPUVA_USERBITS << 9)
>  #define XE_VMA_MADV_AUTORESET	(DRM_GPUVA_USERBITS << 10)
> +/* Pipeline-only bit used to carry cpu_autoreset_active through MAP/REMAP. */
> +#define XE_VMA_CPU_AUTORESET_ACTIVE	(DRM_GPUVA_USERBITS << 11)
>  
>  /**
>   * struct xe_vma_mem_attr - memory attributes associated with vma
> @@ -157,6 +159,14 @@ struct xe_vma {
>  	/** @tile_staged: bind is staged for this VMA */
>  	u8 tile_staged;
>  
> +	/**
> +	 * @cpu_autoreset_active: CPU mirror VMA is still CPU-only.
> +	 *
> +	 * Set at bind time and cleared on the first successful GPU fault.
> +	 * Protected by vm->lock.
> +	 */
> +	bool cpu_autoreset_active;
> +
>  	/**
>  	 * @skip_invalidation: Used in madvise to avoid invalidation
>  	 * if mem attributes doesn't change
> -- 
> 2.43.0
> 
