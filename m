Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 048B5C43458
	for <intel-xe@archiver.kernel.org>; Mon, 13 Jul 2026 22:37:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B900B10EB5C;
	Mon, 13 Jul 2026 22:37:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MyNmVolI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7A8410EB5C
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Jul 2026 22:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783982274; x=1815518274;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YFsUgjTyxDBiW+7J71Oom2L/n+Zl8mp3L15hgmcnG8I=;
 b=MyNmVolI7cRLHdnnMFNEp6Xo6/awIARNpVCtPut/nwrOKWtlr1D1UHrB
 Co81LHmUT8JyV22TTFaxp5vNYTWSsLy5ITNRa4eQl8sL0GDFDIjeQ1ctX
 21qU8QxjyzrKhk/gvG/uniPJ6AnzeOTtiEWpTeFuFsCFj+ombgzUqxK2g
 Ryg0i4vBz2yyAaTe7UuYpG2eyrKS/BF5W42rJg/EECXwCgP2GPc6PJ5MV
 T/lI3V/EmMCSLtwShm2sjRlD5jQe1nLSBvNyVrt6dzuj6JXEnxS9ELqRC
 uZYPwLcNHbZ4+z4iRaUUoio9pV2fvna4gGu3zCitip7StPbs4fuV0Mqxz A==;
X-CSE-ConnectionGUID: vK+KADkmQ2q2bohAPPCycw==
X-CSE-MsgGUID: Z70+ZE16SmifNpTknYvToA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="88499369"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="88499369"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 15:37:53 -0700
X-CSE-ConnectionGUID: e4t61PpbRzCu7Eyy72tH6A==
X-CSE-MsgGUID: 67QikiOSSkShO/oT1ryMLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="259524581"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 15:37:54 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 13 Jul 2026 15:37:52 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 13 Jul 2026 15:37:52 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.52) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 13 Jul 2026 15:37:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C5SgTzNYuhQrobINUdAIo52G8Xw9oZng9URiAYWQjCPgQ852nf3DTetEF7Je8fxHc9aYOneBhNYIc1GsQS1g/hWfM3J3OnbTk8WEYMtRKpn7YDZPzJr2ltjWAzf+L7Nvz2+k7JwX2G2wwpfVLSZbDhkTlvFnD/hlc7rTvLaLs0mO7gKasjna81IsxTYkVUxUmakzvEFsv5Zm/S4hcRQhPEQwmYd2IksbraPLc7eE1+Qu+jPBW1CH6hXWMjDU4c1ADMee7+xHGJtm0/LvW5oOFQ1rbGv3JdNtpVZK0GtcAee4g+ZHYkjqTXDz/x4TCrbh2jGpk0TB7iPLBLFRNmtuYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4SlSIxnqAP2N0EBVUoRpHP4StxhFE62FnaKXlBEBxFg=;
 b=UDieFlnE0mC3Z3C/KoQm+CuwnzV0Yz0VYvFOq7hKn3pPrKXoxVBzk99vrlNg/9rzITJCj/CvXej+R5T9UmoqzYO3DrYC7JaGthgfUeZgy4hDMON8VEI2va0xkRnTQm5h9nyjXXd0jg0NuCymfNpOmRtDmIOfB3GcIE9t+Jy2tlcEvpp3QhvwtWkKnX2d+Dm5RYIXkNarNHTnuOdg2DS05IV2RWKEy0uztisu6tPisBtAy5XEDSTMu1p8FSHmQ7AHiP+xU6/MHpyTHc5BCtKwVetWmlCnzxjkkgcOffYRkyy6U0DFQrJXESxHFU/OQylohgHtpaws1tdhhQPaQiLPpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4979.namprd11.prod.outlook.com (2603:10b6:303:99::16)
 by LVTPR11MB9885.namprd11.prod.outlook.com (2603:10b6:408:3c3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 22:37:44 +0000
Received: from CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc]) by CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc%2]) with mapi id 15.21.0202.018; Mon, 13 Jul 2026
 22:37:44 +0000
Message-ID: <b0b848c0-3b49-4470-a332-2f38ae79cca0@intel.com>
Date: Mon, 13 Jul 2026 15:37:43 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/pxp: add termination on resume
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Julia Filipchuk
 <julia.filipchuk@intel.com>, Alan Previn <alan.previn.teres.alexis@intel.com>
References: <20260710222910.2997384-2-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260710222910.2997384-2-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0058.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::33) To CO1PR11MB4979.namprd11.prod.outlook.com
 (2603:10b6:303:99::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4979:EE_|LVTPR11MB9885:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ae26ffa-77b1-4672-71c6-08dee12f5b07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: +NFbYrVwMGX4iIeX8Jl/bh/lhpIg/AMmtIUvBG8q0vvd9Fpp31dujKSk/GP5y4EHzli4ftx2r2+HjwoDaVlcO9eJrOH5uvZBA7bXWUhQaXdgFoUkz2QktCOfHeu389NKMgfqqggGyPK2oRwjp+XpXfXYiSjDaZpgtoJGaIG1zzTNBrQvRpOs/HTuSJBiSUf4IBWmJU7hWacW76x7u6kkVSs5saS+DNAXU4N7hUMBRZswJFQKuTzBHF9dwI+evSTGGXRIhZoOmB9LgsJTK1zS00ioof1iAOMFTB7zogxjxoE//Tqa5/GIbMMPAujr0Q6OKJLWo8I8lib5Ny6dC4esakka2DPEk08wgc/LACmYCXS8TOEW0V73lQ+Eiy2PAiaZz1tIcWt6Owvq7NNbiIZeETevWOM9GDC4KdtRI9QzUu/Mm3OXKUFyBjdVOjOuQO/J8sLNJnOmw2uY3ihRzKSwoKJD6k+F4CNySQv7hXHVIyZCGMlsor+li8oRavjwRdFSBNE5Ud7hAGouHCFHv2G9Z7G2C3iPvqssMJT2dGJGvuLLCEZbgdFzmMpobgD9gYcXbmatJdw7/sMSPTZANecP7ApkQRjxPGVDb9s+is0OCJs6Bq2rY7CHsF0j5dBu1RYqJQ9g6H6ZYzXgxVtq2Vn9/R+Xmx01YTmAOO7P008KQ8Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWNranNFaDdmWE1abVd4ZE5JVkxCNXF2NmJBdUJCQjBpTFJzR3QwSVlDd1la?=
 =?utf-8?B?M3g0REpoTDMyZkJENlIyOVdTSkhUalJCc1hYclRTM0tDSDNrL1E2WEF0Z1dC?=
 =?utf-8?B?ZVlVMytRMlduMDdSK1ZmVUd1MkVtbUZ5aWl1T1pZRFJZUG4wWW9wNnk0dzVE?=
 =?utf-8?B?cDRscDhYK1JNWEJ3cVcyN3N5MHV6b1ZmazBXMVJEMEdBaGhqNUJubGYyNHFk?=
 =?utf-8?B?MzBXazduZVVMY29xb0JjNzBrQ0pJclFUL2phc1dCNjJQZEFlVWRIOUdIMWpZ?=
 =?utf-8?B?ZHFEcEdVT1dYcEw4cjhmMmFLeUxkUnRpaHV5MXFTYjNERFBzNWRNR0h4T3lG?=
 =?utf-8?B?OUpEeW5kOXJVcXluY2JGSFY3R2gySHJ2OE1DS2Y0U2p0eUdrOWJWZEYreSs2?=
 =?utf-8?B?VVV1bEYyVCtHYThmMkJzSlBxNjNGM3B5anBFanVvbUVXTmRMWHRIZ1ZPekx4?=
 =?utf-8?B?RnBHaWY3T2dYR0RCUGNjdkZwL3A3aThJcWJuaUk2V3E4N3FaYzl1N3IvSlNj?=
 =?utf-8?B?ZEx6Qm9SVFd2MC9xaXdScStaMStNcTU4NnJselIxdFY0ckdGQ0RUeW0yQ01K?=
 =?utf-8?B?UWhxY2dWMFRhQUVjVDYzOHE1NWR5K296ZDM0MW9zcE9LU1p2cm9qMDUyVkNk?=
 =?utf-8?B?a0RhWnFxYk0yOWl1clZtZWc2STNyR3ZSTUJpeG9Zdm83SmFWSkZUaTNiMStr?=
 =?utf-8?B?R0FNSzZSK256OUR6cjRhc3FkMVp3U3lkVkl0TnJBNlpIbS9RL2pNaEJXaURE?=
 =?utf-8?B?V1gvN2x6aUJ1SmQwVUp5ZEJ5RWIxNWxzcFY5b01TUE5SK2d2anBoam45bDRl?=
 =?utf-8?B?S0xUcVg1ZUI1UmtYeEpYSnFJdGI5U0xmNHVkVTFMZkloUEhEUDF4VDhrcHhF?=
 =?utf-8?B?VnV1bG9JQUhIeGJUZllXSkZFQm4relhJN3B4Z21rano2bG9kOTZGUGtYd0Vi?=
 =?utf-8?B?Q3NOSkh0Q0tUTDBvS1R6MHdIY1ZyS3JueENNUVgvRUR3TG11SzVickh4RWsw?=
 =?utf-8?B?d1QwNVFxWXhtQ2FKdnp4RjF6b0VFMVBKOU1YK2U0V1JhSk1iK1l2emJvZXR5?=
 =?utf-8?B?VE44NVlPTjdlek5LeEVrdk5ZRzB0cWtXeGNycVJHQmVDbE5nWkVKeWg1Rjll?=
 =?utf-8?B?akU5NFZSZHEwaEhaZ0hKZ0hXOU5GRVRCNysrTVkzZlkraHFDS0tVVHNqTkFp?=
 =?utf-8?B?Wm8wSGpoNEpuM3lDZk96bmN1MFZFYXR3SjVzcStMNi9pWVQwSCtYVnI1V1NF?=
 =?utf-8?B?bFlhSFQySHBiMGExNTlMR1VqVkVlOTcvTCtHMGxycXo5RzVLSmdxZVRzNFNs?=
 =?utf-8?B?V0h5TE5VSnZPcXpDK2RUZUdJVDVROVJja0Q4eVFpeU16eGozT05qemgxRnNk?=
 =?utf-8?B?ZkhWQkRhWjR4Ykp5bGpIYW1aT1hHOS9Nblo5cENXUnlleEpjcTZhQXZoQjBD?=
 =?utf-8?B?VUVpTUVRUWtzNW1kUUVVaXdTSnpLdTUwZ25kWVdVOTQyY29pZERsaDlqYndi?=
 =?utf-8?B?QjVqZ3NscHhtTnJPWUhPN1FLSU50MWRWdEdWWXlhbUVuSXVYcVVzOEl2ZVlh?=
 =?utf-8?B?b2ZLT01HdStRWVRLbTdMb2cxbTZSTzk1b3RHcDhad3R2U2xtS3d5R0hENzJQ?=
 =?utf-8?B?S0o4SWRBM1k0L3g0SmpJNm8yaXNXY3plNGlwV2ZGWDh6eEFCaEpSVG9ERitT?=
 =?utf-8?B?M244Ym82R1JiNC9TR3BxZjNMd1lSVUp0QnJZaVZtczFvc0dVQVYrUDZnaU9O?=
 =?utf-8?B?QkgxWm00Q2taanlCVlFPdGlWcnVubFVieDdzei9ZSE9kRFJVbUNySGpYamV1?=
 =?utf-8?B?dWFyZHhPcnpVcE9SMlhyKzNWNkgvYS9YTlduL3lveW5TMlFtZnVWUVM1UDVN?=
 =?utf-8?B?VzV0dTcxL1hmZFpXQVV4bk0wM2YzOE9RcEFDSkJYM0FMT2I2SGQ5Wm5YbXUz?=
 =?utf-8?B?MDloOEp6YTZoampYRXpCa09Gb1QvaDNsTkswZ2cyVUdudnltbkM5TllBZWJO?=
 =?utf-8?B?djdqZ0d5UUY4UW9QL0pKSkhVeGlFeXFudWI3aEhzSytYVkU3VGl0TEZPTlVK?=
 =?utf-8?B?OHQ2QzZ3RkFjRFl3SVd6dmpvcU1rK2VNZGxtdGEyUjhTS3FkTmtpK3IxclRi?=
 =?utf-8?B?V1JmR3ZWaEQzVjl0aFNHS3hmcXFqM3NIWEFwL3R4cFN6SkF0bnFpVkZ2bzZH?=
 =?utf-8?B?QmFLckg0cStsS3VxdjF1dUZSYzNkb3NNVFBWMlI1b09xQ1BUdFZGVVJ3VFV5?=
 =?utf-8?B?MTZuMk5VczlIMGN2VnJuWHFjcjJzM2p6eStXQ0dYRWkxWjNBaTNGK3hsNzZm?=
 =?utf-8?B?VkxDc2Y3WjNnbXQ2NTBkUE9wZUJZRHZEM0poaG9tNXFLU2RrOUppc3BuTjk0?=
 =?utf-8?Q?2qX6dhUIreB9jNvc=3D?=
X-Exchange-RoutingPolicyChecked: QrtmhP5dO0ytoK+8hmzD+NG/OaoMaGWwBG1/jWF6ssHkgA57mXOGtAMbtX6U6y3nsxnOH/oF9a2GNs56hQgTwv1Btyt1uH4w3ba22THzZMf7gTbpNkrsCj4veJE42bKNhRYEbUjdr3wY/ntm0TlQGH3ghnfKgpzH8FTCHqd/oFAyvsg6HkfMEl55nfm2YK1P9OysJNMcULMJMjEzZRYWCJ5C+CKz3+eRLXH9GjAMJSqH9UmoMDacEBbGWKHEIpYHIEqDCk3lMBMCRDP+059jkV1DT3rIIo67dQuzseA4X+XX8XP/8KIVaEd6JTsQosHKQWgjDRMM5SiNsDmgBOgSpg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ae26ffa-77b1-4672-71c6-08dee12f5b07
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 22:37:44.1981 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9dxtHxXEpF/FMaZ9okpUOhF2QQa8Mwm6OFGWslEvGS7kfaFNd8YRJKjlIDFK+9MfAiz0zo+qWlKOwpSSILZlDLLXYf6Gd92TcVcJeJuPg3Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVTPR11MB9885
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

<snip>

> @@ -950,10 +983,40 @@ void xe_pxp_pm_resume(struct xe_pxp *pxp)
>   
>   	xe_assert(pxp->xe, pxp->status == XE_PXP_SUSPENDED);
>   
> -	if (err)
> +	if (err) {
>   		pxp->status = XE_PXP_ERROR;
> -	else
> +	} else {
>   		pxp->status = XE_PXP_NEEDS_TERMINATION;
>   
> +		if (pxp->needs_termination_on_resume) {
> +			pxp->needs_termination_on_resume = false;
> +
> +			/*
> +			 * We can't call pxp_terminate_hw directly from here
> +			 * because we're not allowed to do allocations within
> +			 * the rpm resume call, so we defer the termination to
> +			 * the worker that we use for the termination irqs.
> +			 * However, we do not want any PXP ops to go through
> +			 * between the suspend completing and the worker
> +			 * starting, so we need to do the termination prep
> +			 * immediately, which will mark the termination as in
> +			 * progress and stall PXP ops. Also, we want to avoid
> +			 * the device runtime suspending before we're done with
> +			 * the termination, so we take a runtime PM reference,
> +			 * which will be released by the worker after the
> +			 * termination is done.
> +			 */
> +			if (pxp_prep_for_termination(pxp)) {
> +				if (runtime)
> +					xe_pm_runtime_get_noresume(pxp->xe);
> +				else
> +					xe_pm_runtime_get(pxp->xe);

double issue here
1 - we can't call xe_pm_runtime_get from within the pxp lock because the 
resume flow takes that lock
2 - the rpm resume flow would call back into xe_pxp_pm_resume, which 
would confuse the PXP state machine

However, on S3/S0iX exit we should be guaranteed to not be runtime 
suspended because we do not set DPM_FLAG_SMART_SUSPEND, so using 
xe_pm_runtime_get_noresume in that case as well should be ok. I'll 
respin with those changes.

Daniele

> +
> +				atomic_or(PXP_TERMINATION_REQUEST_ON_RESUME, &pxp->events.pending);
> +				queue_work(pxp->events.wq, &pxp->events.work);
> +			}
> +		}
> +	}
> +
>   	mutex_unlock(&pxp->mutex);
>   }
> diff --git a/drivers/gpu/drm/xe/xe_pxp.h b/drivers/gpu/drm/xe/xe_pxp.h
> index 4fb6e0afffd2..d99bd2eb5bd5 100644
> --- a/drivers/gpu/drm/xe/xe_pxp.h
> +++ b/drivers/gpu/drm/xe/xe_pxp.h
> @@ -22,7 +22,7 @@ int xe_pxp_init(struct xe_device *xe);
>   void xe_pxp_irq_handler(struct xe_device *xe, u16 iir);
>   
>   int xe_pxp_pm_suspend(struct xe_pxp *pxp);
> -void xe_pxp_pm_resume(struct xe_pxp *pxp);
> +void xe_pxp_pm_resume(struct xe_pxp *pxp, bool runtime);
>   
>   int xe_pxp_exec_queue_set_type(struct xe_pxp *pxp, struct xe_exec_queue *q, u8 type);
>   int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q);
> diff --git a/drivers/gpu/drm/xe/xe_pxp_types.h b/drivers/gpu/drm/xe/xe_pxp_types.h
> index ec86306e16f4..b717a55101b6 100644
> --- a/drivers/gpu/drm/xe/xe_pxp_types.h
> +++ b/drivers/gpu/drm/xe/xe_pxp_types.h
> @@ -85,17 +85,20 @@ struct xe_pxp {
>   	/** @gsc_res: kernel-owned objects for PXP submissions to the GSCCS */
>   	struct xe_pxp_gsc_client_resources gsc_res;
>   
> -	/** @irq: wrapper for the worker and queue used for PXP irq support */
> +	/** @events: wrapper for the worker and queue used for PXP event handling */
>   	struct {
> -		/** @irq.work: worker that manages irq events. */
> +		/** @events.work: worker that manages termination events. */
>   		struct work_struct work;
> -		/** @irq.wq: workqueue on which to queue the irq work. */
> +		/** @events.wq: workqueue on which to queue the work. */
>   		struct workqueue_struct *wq;
> -		/** @irq.events: pending events, protected with xe->irq.lock. */
> -		u32 events;
> -#define PXP_TERMINATION_REQUEST  BIT(0)
> -#define PXP_TERMINATION_COMPLETE BIT(1)
> -	} irq;
> +		/** @events.pending: pending events */
> +		atomic_t pending;
> +#define PXP_TERMINATION_REQUEST_IRQ		BIT(0)
> +#define PXP_TERMINATION_REQUEST_ON_RESUME	BIT(1)
> +#define PXP_TERMINATION_REQUEST	(PXP_TERMINATION_REQUEST_IRQ | \
> +				 PXP_TERMINATION_REQUEST_ON_RESUME)
> +#define PXP_TERMINATION_COMPLETE_IRQ		BIT(2)
> +	} events;
>   
>   	/** @mutex: protects the pxp status and the queue list */
>   	struct mutex mutex;
> @@ -130,6 +133,12 @@ struct xe_pxp {
>   	 * suspend cycles.
>   	 */
>   	u32 last_suspend_key_instance;
> +	/**
> +	 * @needs_termination_on_resume: indicates if PXP termination is needed
> +	 * on resume. This is set if PXP was active when we suspended. Protected
> +	 * by pxp->mutex.
> +	 */
> +	bool needs_termination_on_resume;
>   };
>   
>   #endif /* _XE_PXP_TYPES_H_ */

