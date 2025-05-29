Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3436C5B543
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 23:25:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A1A310E1CD;
	Thu, 29 May 2025 23:25:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gz+0RB09";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08FD610E21B
 for <intel-xe@lists.freedesktop.org>; Thu, 29 May 2025 23:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748561146; x=1780097146;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kkFjgA9fmKFZzfOpPX+58uLDKtfoB/NiW5TNDQr5fyo=;
 b=gz+0RB09Ww0E/sPygHs9dexLLGwvCxsfNW+CevTobV/a7b+t5zUCe1nf
 xrQ2yTbN1BQZDUrCnzRacREkowhOls1u6x4UaydNGlUwwiLrlEMYmIzak
 kBc7cfwBsbxAIcrFcza+7zpMFdTcluBRFzb0LBDKdL4UZIRlgTjZV34aA
 iV1yhaIMmoLZId+Yxyr+ZCFxs8Vatq7wS9xB8HHNbdYv46am1zUMouhCt
 ORXmBqogBkl4h1HjaWVsVstE0rhLv/e6EPduJkkk3kxWciMEx10EC3rFW
 QqF7lHWmW9fxqdJRvHMXWkHCbnzdPgjYFrsl7YFR7U7jU96jsU5I2y7sx g==;
X-CSE-ConnectionGUID: zk8oz2LwS+CXy0mm32+Z9Q==
X-CSE-MsgGUID: nxicLeLuTNuArIynNtNBBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="38271122"
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; d="scan'208";a="38271122"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 16:25:46 -0700
X-CSE-ConnectionGUID: ctYaSxZwRv2aXywRzXzsRQ==
X-CSE-MsgGUID: hhEjBLI7QkGUFr0W7JmR/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; d="scan'208";a="174704006"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 16:25:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 29 May 2025 16:25:40 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 29 May 2025 16:25:40 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.67)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 29 May 2025 16:25:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TsJ26ewbykwXRZ7UhItwIkad2XTrUmisXlQ6GKDJDUIW7cqNfp3FkYsnU7qlTfe9RpyRlLcq6Vpw9c0yK7ukpYS1hZIJxCwRb/ookEqXw/LDLHGzrusZJWDq0FJJT0lGmtqHJiN3S/g8cLirjBTYVjPb8kDbi7DRapdeRcjLVZnvOoAmnLIgtGxMtaAholTrF5aDKFqgJz5WewV+Rl3UuifNosASbbv3iOB5SNvaY3F6N9uZe8UyRjl16Hv9N/EcxSRVLPVxf8gHWjjQKFqx/IcDedWUFXuN3vUXe78U7gBiX6rc1TUhjXmPSPOR5JZxX+vqSG0ONsfEArWLJa6YSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3mBlg87MuIagVpopBjnMgtfowdgrBbX46FIw/xM9ZNo=;
 b=Cb1IVtxmEP4T/hpQcqTeYHF+7I++9iVa2+n1Jqsp9/5I60cciTisKJgFEz4BHQ+vpxvwCX538opT/GwPE0m/DQPo6nsQHcy/j6puoseHftd4yUQzfZzZMzaQvCdYKEQW+5dEQZ/ZermgbJlUNuBtE4gPLlDB+wwW3SPhett51v7YAVZJTO8oxsbp60e54bWQqLl4bkIaecnNDwPVA2y+yPhS8FqxKtcX9DIh35uvLqTL1P49nVoYmpvVP1GUgjNnLMjSYUa7pn9XUIAKLwkt+BDGKl4kvRAuiBRErOxvTink9mi6RwVszxSTEx2zCvgjzMEIrQL9gTjYlqYGeoQ79w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB6812.namprd11.prod.outlook.com (2603:10b6:303:1ee::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.25; Thu, 29 May
 2025 23:25:38 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8769.029; Thu, 29 May 2025
 23:25:38 +0000
Date: Thu, 29 May 2025 16:27:09 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 12/19] drm/xe/svm : Add svm ranges migration policy on
 atomic access
Message-ID: <aDjtTXKvpuUdgSlT@lstrano-desk.jf.intel.com>
References: <20250527164003.1068118-1-himal.prasad.ghimiray@intel.com>
 <20250527164003.1068118-13-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250527164003.1068118-13-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR04CA0289.namprd04.prod.outlook.com
 (2603:10b6:303:89::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB6812:EE_
X-MS-Office365-Filtering-Correlation-Id: 524ba805-300d-4af9-c368-08dd9f081ec9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YOqF6uyiakP1arRf2Uh7az30ehhxzEkftfLTQYrYwIzMEDOT2HrKPNZyHNBc?=
 =?us-ascii?Q?0edgDXwZOH7mxyM5+EEvEngM/z1MnY2MTfl2fDKXDmlJ+JcFsnpEhOSQcsDS?=
 =?us-ascii?Q?eF5vJRHEXWC3Etx+jBP2EERwBNe4tBH7VAGT2C2ELaVRyPWmIEobj5vBsy62?=
 =?us-ascii?Q?eDHHT0INutxyA4l+74pQFTX2IoslNrPQffBlRLv3/9ZHhoKzgYSFL0VPWUtW?=
 =?us-ascii?Q?w+XhmfgmnPQxQTIHFx3MVNNIBXBN5ZAJG3JzG9vXMukECnzjj1DBeSlcjYEA?=
 =?us-ascii?Q?P8TeIIhFu2X2LZPy2Vz7mEPFojoRACmuabR/AvOYrU0yiAiTKgrXVENgIpQ8?=
 =?us-ascii?Q?f+lqixdZkQ9l8vh8K1pdTLiN05LvQkAxX060zbXjTfCNiZzQl+Y0xULTISVl?=
 =?us-ascii?Q?s/dJP/DRnewC4dtBlFFp6UV01EY057G2LEmqmCkxaaOqn/QI32n2rvMRIj3z?=
 =?us-ascii?Q?rYGLhVjQuJX0SZP6VMctVB+u22EKqxz3/NrCjw8bSXlwJiNpwnhDxhJI/t9h?=
 =?us-ascii?Q?KOJq1nWuBjx6i0yAGNfLi4ConqP0t/xZk2hOEK+OalDWuu1bGkB0sOPuThYf?=
 =?us-ascii?Q?HYp+Jr6wAa6seAVoLnEFGglJi3qZCYPR2TdP6r+4aSoTEZfWpOtHS9fK+KgH?=
 =?us-ascii?Q?fU6SUvScXMFodHw+EGMIZiyMK4RGI1vQkC4STyUn4TOEgbJr2s4QZr2KIDai?=
 =?us-ascii?Q?MlLzvlucydtAp9Efd/2uWjsFzHFc4hz19sL78tbpb5E2wEpklxFNGNcmnEqT?=
 =?us-ascii?Q?RnuGyA/FNoiruLIq873R/TUmjSJ1CO2O9F2VmCcCw4QKubPKYIcjIVO99TPu?=
 =?us-ascii?Q?6il/DbmK5YGO55Mb4I0118H7N2f9OmoeZ28gqvplRsBk4kbpHtf5WKlugpmW?=
 =?us-ascii?Q?JVHWPTwilsASDmTbLt+4mLgTdcBRCdErFWLwVtjr3BdA5GGPDgJAUt/gM03c?=
 =?us-ascii?Q?Mmf3IiKWDu6xHUYu6imtvub8bYcnY682wdytRuOSbb4y3pW4whblzE++PZ8y?=
 =?us-ascii?Q?Hq62UkMpG7uT+0CBOS4FyyevU9c87DPtULL9jqBrK1z7L6l0Iwn37xw9D0Cg?=
 =?us-ascii?Q?ug8Et3RRXO8KCRKIAdSE6ge2toghIRaJ3r4UzjkYTxuoF7Q6tjeakNKewQZt?=
 =?us-ascii?Q?OAxW3IlXJcQ5qTiGLTzuzSk4wznaLsVNHZ0QIMkeDRzOEnjiloE1tsrdsd/8?=
 =?us-ascii?Q?SsfNVprEGDRkTrllFhj7wfHjr6RZdKdmU0WJV3kq+5Z2UJ80r8PjQYIPJ6OW?=
 =?us-ascii?Q?35OTOsMF2B+mVKwlxLRvzqHhkLxE4MDVFtveQs/ar99tAy9FQ9XYgP097NFg?=
 =?us-ascii?Q?A8eLpAxo4xYdHm8KZw3mtFMxrxITci8tXY/VkkLinKIYLYw2HMKhE0je0nUF?=
 =?us-ascii?Q?AfcqL++tTY8Q8c35V+7m8kyd3hVOplFNPmv5ZvhMv1emr/dnSnNV0/CbwKIL?=
 =?us-ascii?Q?l92Bgw4bcW8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FOtzpOxQ5x0fNuToNablFUHlpaxviqWYeebKnnD2Mk+ER4Tr9+I/QkqODZKl?=
 =?us-ascii?Q?Xj412U70XsnGE3emrnMYUh5MOgQk+6d6X5OiWry828fzSxhM0sZHIB15CrL5?=
 =?us-ascii?Q?xbSxR768SjocXeGib9Qr/4v1bg9a80C86YPdGEd8V7tKECNVszvsWgJHydpx?=
 =?us-ascii?Q?wioO8DynSdPAw+YHzFDcnLa+pvqIdozhBb1uLV4EGY2HvyIs4zXj3DQTr+or?=
 =?us-ascii?Q?eSpv1t/SfAPfvtsSJC/u7ytQj8DDtaq3Y+gfClAd/gBYE+ifP+onUx7l3Tg4?=
 =?us-ascii?Q?IRJvkz6h1FpbrzuqywFZ/RJGzZhb7bDRYt9aZFBpdUN77Zs1MejdTjXdGe0l?=
 =?us-ascii?Q?oR7vJ7n0jVTqdudNrfVPMOSswz9FWK/cF6236wvnR3pWidpXYJypf9YV2Nim?=
 =?us-ascii?Q?bFm5uMklsYVv4GiKCqD9LfDxwqt8i7sS/8x+N/hjgYa1vFJiSo5qaZJwXM5r?=
 =?us-ascii?Q?H0RCXRcg7S98WtqV42slwwOmYTpsELZB1s8BtSSm9cR6sM0oCXEW26fyqIi0?=
 =?us-ascii?Q?jMsjDCRC8TCgzsZpt5ibjeInpuTRleixIKvgbV8mupMVyjmnK6TgN6Tq7CeT?=
 =?us-ascii?Q?/G229BjH6RgxGc4UP1jVeF7jTARDI2qMecoZSYhD+n0vs6biEzAm4YbEka4L?=
 =?us-ascii?Q?qx+GwQC7Q1ZPzbWh8XcQPebx4t3swKr4+3/rW1qz7A5r90sD0hqJmNP9I3u4?=
 =?us-ascii?Q?6WbikuDYBL9mXlsjtiIdDqtWMWc3vtaSIopV0LtgnvedyoIISSLZOtMcv1ga?=
 =?us-ascii?Q?EKFIgVslFDbl+XUfoCLCdVS/UJBamEXaxJdWzLWon+gUGFIsRvW0SRrCMd9x?=
 =?us-ascii?Q?QH7h/IsdplBsMR3uuLpa+HtWjvxNh7d/+HCot58zY+r+KflKmKzaBgkvefp6?=
 =?us-ascii?Q?f7tP12+MvRFh2lNKGQR+ULmhcum/qjwItVNDNUcs4eQwBHbBGiJZi/yJb7NS?=
 =?us-ascii?Q?YsMGgaOACk49Bb1fMJpf9zkQqtpxAcYpnz7Onmqh5Bkk2HkWSDOi6FA7qItk?=
 =?us-ascii?Q?E/d8NV8z/bCELaKPNouTNPvPlHiZPV3CpY9ULApTaF9d2v83MSAkBxZbH3on?=
 =?us-ascii?Q?uOxqytSIiCYfjjdV67JLxGxaIBted3j+e+3pccLLKo+8Cmxt1oJBIov9fYjV?=
 =?us-ascii?Q?TUdMnPjhuEVoJLuXMVx9UC6RjZusNW+HWDd76Gpx/nEIpGbGiFYo9CvL04mT?=
 =?us-ascii?Q?EI1NflwkDo+Zyq09kAAO1FAs7B/ussPamQ+urQt5/jT2WOXZaR2GspxbnJG8?=
 =?us-ascii?Q?fQAeKxbVGnvy4+bybObS/imISTCeeEnmEiRYmRVk7Ni75gv2R3SqzFEZ2pyb?=
 =?us-ascii?Q?Q/+oed82QuRURMZw9lyggpYzyTk6Na1icG1KMdajVhSyEJQp1VB2KhQCFQdF?=
 =?us-ascii?Q?00z/+Gs4U1FJKu+lPHoZUIayDe43uzK4NRKGNZCMpgtWXYl+YKA+S1dRh7SE?=
 =?us-ascii?Q?F8OCFMi/LcYyYQGgLjee5TRxpFwqV9MKfKGVpYYfPk2NPhz587qiSj0f1KJN?=
 =?us-ascii?Q?pNZVMxVpkWNwj3/skXr7t81QqSQQ27hRSBEotIhYLNRggAntKqET5Fbnkkwi?=
 =?us-ascii?Q?90T9c4TZlCUVLGj02U13O8hoqMGIsWiXMmAcL9RDPZ59+fwBhebFax8S3iJA?=
 =?us-ascii?Q?0Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 524ba805-300d-4af9-c368-08dd9f081ec9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 23:25:38.2920 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w3CL0Hfc15xLrI9QyvnOTMagMCQAJwSLxTsE0GU5BLWczopYumm22PIoBJTO2sKjq/fwM44W3oPsPHtMJlO8Bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6812
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

On Tue, May 27, 2025 at 10:09:56PM +0530, Himal Prasad Ghimiray wrote:
> If the platform does not support atomic access on system memory, and the
> ranges are in system memory, but the user requires atomic accesses on
> the VMA, then migrate the ranges to VRAM. Apply this policy for prefetch
> operations as well.
> 
> v2
> - Drop unnecessary vm_dbg
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pt.c         |  9 +++++--
>  drivers/gpu/drm/xe/xe_svm.c        |  4 +++-
>  drivers/gpu/drm/xe/xe_vm.c         | 38 ++++++++++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_vm.h         |  2 ++
>  drivers/gpu/drm/xe/xe_vm_madvise.c | 10 +++++++-
>  5 files changed, 57 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 39bc1964089e..ad17ded0ecaa 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -645,13 +645,18 @@ static bool xe_atomic_for_vram(struct xe_vm *vm)
>  	return true;
>  }
>  
> -static bool xe_atomic_for_system(struct xe_vm *vm, struct xe_bo *bo)
> +static bool xe_atomic_for_system(struct xe_vm *vm,
> +				 struct xe_bo *bo,
> +				 struct xe_vma *vma)

You can get the BO from the VMA, so I'd drop the BO argument.

>  {
>  	struct xe_device *xe = vm->xe;
>  
>  	if (!xe->info.has_device_atomics_on_smem)
>  		return false;
>  
> +	if (vma->attr.atomic_access == DRM_XE_VMA_ATOMIC_DEVICE)
> +		return true;
> +
>  	/*
>  	 * If a SMEM+LMEM allocation is backed by SMEM, a device
>  	 * atomics will cause a gpu page fault and which then
> @@ -745,7 +750,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>  
>  	if (vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT) {
>  		xe_walk.default_vram_pte = xe_atomic_for_vram(vm) ? XE_USM_PPGTT_PTE_AE : 0;
> -		xe_walk.default_system_pte = xe_atomic_for_system(vm, bo) ?
> +		xe_walk.default_system_pte = xe_atomic_for_system(vm, bo, vma) ?
>  			XE_USM_PPGTT_PTE_AE : 0;
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 5691bb9dbf26..743bb1f7d39c 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -771,6 +771,8 @@ bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vm
>  	struct xe_vm *vm = range_to_vm(&range->base);
>  	u64 range_size = xe_svm_range_size(range);
>  
> +	preferred_region_is_vram |=  xe_vma_need_vram_migrate_for_atomic(vm->xe, vma);
> +

I'm not sure about this. Shouldn't we just set preferred_region_is_vram
at the caller (prefered_vram || atomic fault) in the fault handler?

>  	if (!range->base.flags.migrate_devmem || !preferred_region_is_vram)
>  		return false;
>  
> @@ -812,7 +814,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
>  		.check_pages_threshold = IS_DGFX(vm->xe) &&
>  			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ? SZ_64K : 0,
> -		.devmem_only = atomic && IS_DGFX(vm->xe) &&
> +		.devmem_only = atomic && xe_vma_need_vram_migrate_for_atomic(vm->xe, vma) &&
>  			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
>  		.timeslice_ms = atomic && IS_DGFX(vm->xe) &&
>  			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ?
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 8208409485f6..e5fc2c2be8b2 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2930,13 +2930,22 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
>  	ctx.read_only = xe_vma_read_only(vma);
>  	ctx.devmem_possible = devmem_possible;
>  	ctx.check_pages_threshold = devmem_possible ? SZ_64K : 0;
> +	ctx.devmem_only = xe_vma_need_vram_migrate_for_atomic(vm->xe, vma) &&
> +			  IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR);

I still wouldn't set devmem only for prefetch as I don't think we should
fail the prefetch unless we absolutely have too. A fault will still fix
up atomic faults that are in system memory if needed.

>  
>  	/* TODO: Threading the migration */
>  	xa_for_each(&op->prefetch_range.range, i, svm_range) {
> -		if (!region)
> +		bool needs_vram = xe_svm_range_needs_migrate_to_vram(svm_range, vma, region);
> +
> +		if (!needs_vram) {
>  			xe_svm_range_migrate_to_smem(vm, svm_range);
> +		} else if (needs_vram) {
> +			/* If  migration is mandated by atomic attributes
> +			 * in vma and prefetch region is smem force prefetch
> +			 * in vram of root tile.
> +			 */
> +			region = region ? region : 1;
>

I don't this logic needs to change until we have preferred location is
implemented. I don't think the atomic mode has any bearing on prefetch.
 
> -		if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, region)) {
>  			tile = &vm->xe->tiles[region_to_mem_type[region] - XE_PL_VRAM0];
>  			err = xe_svm_alloc_vram(vm, tile, svm_range, &ctx);
>  			if (err) {
> @@ -4178,6 +4187,31 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
>  	kvfree(snap);
>  }
>  
> +/**
> + * xe_vma_need_vram_migrate_for_atomic - Check if VMA needs VRAM migration for atomic operations
> + * @xe: Pointer to the XE device structure
> + * @vma: Pointer to the virtual memory area (VMA) structure
> + *
> + * This function determines whether the given VMA needs to be migrated to
> + * VRAM in order to do atomic GPU operation.
> + *
> + * Return: true if migration to VRAM is required, false otherwise.
> + */
> +bool xe_vma_need_vram_migrate_for_atomic(struct xe_device *xe, struct xe_vma *vma)
> +{
> +	/* Note: The checks implemented here are platform-specific. For instance,
> +	 * on a device supporting CXL atomics, these would ideally work universally
> +	 * without additional handling.
> +	 */
> +	if (!IS_DGFX(xe) || vma->attr.atomic_access == DRM_XE_VMA_ATOMIC_UNDEFINED ||

I think DRM_XE_VMA_ATOMIC_UNDEFINED is same as GLOBAL, right? Isn't that
the default? Or global the default? We have been told whatever the
default is, just has to work for SVM so maybe set to GLOBAL by default?

> +	    vma->attr.atomic_access == DRM_XE_VMA_ATOMIC_CPU ||
> +	    (xe->info.has_device_atomics_on_smem &&
> +	     vma->attr.atomic_access == DRM_XE_VMA_ATOMIC_DEVICE))
> +		return false;
> +
> +	return true;
> +}
> +
>  /**
>   * xe_vm_alloc_madvise_vma - Allocate VMA's with madvise ops
>   * @vm: Pointer to the xe_vm structure
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 8151b1b01a13..edd6ffd7c3ac 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -171,6 +171,8 @@ static inline bool xe_vma_is_userptr(struct xe_vma *vma)
>  
>  struct xe_vma *xe_vm_find_vma_by_addr(struct xe_vm *vm, u64 page_addr);
>  
> +bool xe_vma_need_vram_migrate_for_atomic(struct xe_device *xe, struct xe_vma *vma);
> +
>  int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t addr, uint64_t size);
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index f7edefe5f6cf..084719660401 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -69,7 +69,15 @@ static int madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
>  			  struct xe_vma **vmas, int num_vmas,
>  			  struct drm_xe_madvise_ops ops)
>  {
> -	/* Implementation pending */
> +	int i;
> +
> +	xe_assert(vm->xe, ops.type == DRM_XE_VMA_ATTR_ATOMIC);
> +	xe_assert(vm->xe, ops.atomic.val > DRM_XE_VMA_ATOMIC_UNDEFINED &&

>= DRM_XE_VMA_ATOMIC_UNDEFINED, right?

Also santize this input before here as discussed in patch 19 and 10.

Matt

> +		  ops.atomic.val <= DRM_XE_VMA_ATOMIC_CPU);
> +
> +	for (i = 0; i < num_vmas; i++)
> +		vmas[i]->attr.atomic_access = ops.atomic.val;
> +	/*TODO: handle bo backed vmas */
>  	return 0;
>  }
>  
> -- 
> 2.34.1
> 
