Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8DE9C3ABB2
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 02:48:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 721A710E6DD;
	Thu, 29 May 2025 02:48:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DEqubPEM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4B3D10E1C6
 for <intel-xe@lists.freedesktop.org>; Thu, 29 May 2025 02:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748486922; x=1780022922;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WutI45MZeVzSDNx4mIyQ0IwdO0P0cP8rjM5JS1IUL1A=;
 b=DEqubPEMhwLx/bU82838amIzqAs6irY6ySaOwJf5yCmdzhn1hzw0/D/R
 4q8NS8iDic2lQuqXso1j8VMhVcs4GoJHOz7tHZc33wnU4B/xSa4OTQprL
 6kSR3/In5ZBU0z+Km2+y4Rw5civ44a0mA+tfVlFIfUwbmZvpXtVlqGzwk
 aC/Bd+UbUOiUlaQCAsp5CIPO6USLPvHfG4Co4G2Ysui7IK+wl7zLpCKPd
 pvde4FHVx3YjxRvD5K+c/M0gyeR35Vqfl9GdEqklm8YNeSZG7dCJ5GuRN
 CNLHYawD7FgNr2PfqZ6r+30rmQ2JbPlANIeLas2prEAFGdbIaSNdnidyB A==;
X-CSE-ConnectionGUID: 0JiNk+QDTw2wcRUdFb6lmw==
X-CSE-MsgGUID: 2+Q7CmuITyqwMDtG4Zo3og==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="53160050"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="53160050"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 19:48:35 -0700
X-CSE-ConnectionGUID: fhoiGs3eTOeTWvtFf/VsoA==
X-CSE-MsgGUID: g9qfA2FORUyW9Oz8CVI2EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="148286420"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 19:48:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 19:48:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 19:48:34 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.50) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 19:48:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rKilhZ5jqwiNsnJbdYtw7nrPVFOlHQ/LH77lj/hxfXQaD1wdguFKfLkk+9pGxxW0ZIKns7umHXPDu8ze87vNoAFl8GKkCz/Hzr9TomQvjJX1Vo17zkgm/n2oSbZrw2rcevMirOfBn3bZ8IeZnxHELYmsb1WsmQ4f01PRThZMHAa0lzzOtbAdt5Fk7WYJbV0R39zyQMvhLJLh5AuLHV5Kve/Sp4C7LJLfSO7uwfJguOeQBrE+DAoh93LzwfVsu5cp7Yp83bUfhm5Wj1bv8o+oxyAXLhd5ZFTSMqdUuFGDoCHAOWEdHVly9oiho85bBEMnIyGiBMoZSGa7wQPAVDQ54Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PXrDWyM4E7TCJMqVEwzsfEKtN61PuEQgaLTG/Qb7510=;
 b=zOzrbnYpKetfuzBC1KDnP9EGbHTp7EBvNo5EnAyOmYLDmgio25BBbJX9GVnKbNZK5WJZdDA++TrB39sNYAtRzK3Oi6PC+BCNTK5Sxr1qfZoKFdKj/XeNwB+xSKoI4pPv3dfmam2LxugGAvOCbpMDvuWOpS6wRF4+d9cgULAihoIn4TNDHNb9pdN1BG2zwnMFoTsRNfKKmEad1WIicPMKiu/ClpGCedYNIIcIuljuHI3yC8qLeXjUhjRihjWDQGCeEgvvxxRm/vhHhRqRq74Wt1K+KaKVc44ck9dM2CEhfnvbz1OaoLBY8kYucDpAckbHozdDsqcq/hufor3e+HQ41w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA0PR11MB4590.namprd11.prod.outlook.com (2603:10b6:806:96::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Thu, 29 May
 2025 02:47:50 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8769.021; Thu, 29 May 2025
 02:47:50 +0000
Date: Wed, 28 May 2025 19:49:21 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 09/19] drm/xe/svm: Split system allocator vma incase
 of madvise call
Message-ID: <aDfLMTBTEsxVLO6C@lstrano-desk.jf.intel.com>
References: <20250527164003.1068118-1-himal.prasad.ghimiray@intel.com>
 <20250527164003.1068118-10-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250527164003.1068118-10-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR04CA0073.namprd04.prod.outlook.com
 (2603:10b6:303:6b::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA0PR11MB4590:EE_
X-MS-Office365-Filtering-Correlation-Id: cf67b869-8a84-45b6-7bca-08dd9e5b3384
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WMHqgoBV6da7b3V8V0AvSLrN6qazb5ggHoHoM5vdTX9rLKd3dzbykFWMbh9c?=
 =?us-ascii?Q?2ht/9l4VxwcG0ygOyGjqyy4mgZoM5bhqwBb0yvIVTuVSQY6PURSKUj3tgqSC?=
 =?us-ascii?Q?ArubVEzrapH90WjtP1m2epWIGQROxsjW2qEYos0TnTKFfRn8ifscPescHLCy?=
 =?us-ascii?Q?LwJe+qCYMomXmGshIDxi7EoeIbZyKxHE+I07Vy8pPmQmw5GCXddxMY1Him2m?=
 =?us-ascii?Q?kAwyv6bohlp7m1FLwsiDGdh/yMb9FnFNZi+hHP57GLK3izW9Ljs26XoZOUpD?=
 =?us-ascii?Q?xadwGfT0hHindIJvyBhmTsDGOmfZMvjN4kth77z+HQ0JxozRrnvEKQL+ApoM?=
 =?us-ascii?Q?tJSg+IY7nS8pXSt6xtF/mnz82ksJSkZ1mf2Dpks2rHuvIo8gDGT810qtzYfr?=
 =?us-ascii?Q?MPdt45liUQUULwU8Vi2BMoQCqO+G9+qIHS2vLcaKMyoSAqt6BJ4Cs8Q5PUQg?=
 =?us-ascii?Q?jh/MtJfOmaOfyN4IFsK0Y1J12zpFsYR8J0INNV9/vSYq5+Vm03GH3jUYt3H8?=
 =?us-ascii?Q?2xGMvvKCkp9q+XEvtbVIkDXtWpKXYZmVFkDTX0FQEB2HnCHWuwU36uzjvnCQ?=
 =?us-ascii?Q?+3Z3ZDWMFiJ6wlFqls1FQ8Ql4c+4hIW28Vq1ot9GglWxlodt5Cl/+t+FYuaT?=
 =?us-ascii?Q?1s93xAX7UY6OxZofzOPvZCbRdStIoIZamxn6wIqQY/lFTe5Yz7VCm39jIyRT?=
 =?us-ascii?Q?ryMfvlmooFLsM2WzacStZh4BO9xvGHhM2XZzpNWpPKWcJ1BWPmqsJQfiJs+A?=
 =?us-ascii?Q?dKvxWYt9q2hM8pJx05B4knKbNh2TAiTs6Q9R+O28TjfZnLppMneF5P+AI6l+?=
 =?us-ascii?Q?cVO09ygCuQOo9MiSGW+SUQTC3hXX6/A85ACi5bYWPFtFtcCsfTJkdAGpHYSX?=
 =?us-ascii?Q?wNfwH9eJIKd6h038N+/27zLx1NIWvKDn423snKZy4KHa6sYbrkYYb65UfLT6?=
 =?us-ascii?Q?+Mf61oQ2UNyU72PEfOJMxlEUFq/YYPijsAH/oDH8UKVnvHokK5twv/DSRT6J?=
 =?us-ascii?Q?fUk6D7kXUEgZEPbL9PxM2e40t6umL4zZVTDssUFunjQIOKg1g9hqIihlPrvb?=
 =?us-ascii?Q?6yu/VHa21Tqtwo0zIs5ZnLvpvezz48YOXvZxMzk0eSkkFgbiD838a0JlgVc6?=
 =?us-ascii?Q?2Dg08inmekxocE3d64JuBBDgG++i6+nYTnRSo9ApkbOdLV+sum60gRX+LKgm?=
 =?us-ascii?Q?8kRwGXRn6m2ctwO0pt8u/CwFie6UoDbtmt4JwMzRMJKJ/UPm0SeT5c2SN6+r?=
 =?us-ascii?Q?bbm5sc0urh8dtLL+ef0ylC6uPowNfrzYMHcGe+RzBkF/T9KKrIQ7JoMtLcHi?=
 =?us-ascii?Q?KWpeiLFDgOb1j2DHALsNMCBW64OsOJVCC7hmkpb45z0HZ1faHgseDe04VcIX?=
 =?us-ascii?Q?o89yDFLqG4PNY4PtbWur5hxSFUnXkd+YC1zwU08ThMs0kGtJQdt6HI+uc8hJ?=
 =?us-ascii?Q?l/o4LkjCaXA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QzhBKEIC4gLwS8aWIawPdOnyB4yT7PU8wOWAhgPfxk+umbRuDOhTc8wgXSVc?=
 =?us-ascii?Q?X6AoddV3+rthGanoZHyKObVuWE9YPW8ePNGY+8j0QFis7hIcklL8uea2bWZV?=
 =?us-ascii?Q?FsISIVV1TGx54EKogsRevkafUagT4EqwVv4dyEHfAzRN/2gEsDsAe6u71FJq?=
 =?us-ascii?Q?tuG0hUkVJV/QEPUSlUayaA4Y07sXawSHaehLriitOF08+JAkn2XfuNQea3Fr?=
 =?us-ascii?Q?oEEz8UzdRPmFih18SGmKkRXtX3VNeUyUl5o3EvonoM/l2Kndmzj6oVIYJ+RY?=
 =?us-ascii?Q?vtmEpKc85ph31NrdQuFiuicyUXpaaZnQVwxvA7+UxhyGxiLISXJNHN8B9E60?=
 =?us-ascii?Q?SJ+XKw41TS4HvKxm3oIN1qB/+gg5WthUo25o2bb2wbiMSwEFyEt3/QJc3acJ?=
 =?us-ascii?Q?A5MlywluR5Ff/iy3IfStoE8cNUF8Bx3PcOayzqEf2ZMAjZYsZaX8fHwNejIt?=
 =?us-ascii?Q?hFtTKNbt6h8BS/2YAK+h++HTpaeoCVo7x8fR9kQmrIctRDTyYutl9bWqZvd4?=
 =?us-ascii?Q?VtO1A/ATcPU6CDaEaZ/wp3eLwnSOA1hZB6IGhmnEu1IoifUPbulTj5mjO4mW?=
 =?us-ascii?Q?Slg5xU1/K83P/XfVZAam0mkdD8C+FluGYUUYW4lMmjn9AqxbqgGE9sdLdx6z?=
 =?us-ascii?Q?DiQhLUSv6aRBphHRnR/nAwhPJ+AfXpu//9xQcguI3a6icLZF1FmRTrF/hWGp?=
 =?us-ascii?Q?zvn15cmWfkB34MX6ogSr7SucHH/dPqOUZrepsWUmuxFaJGnQxjgNhoqn76Gf?=
 =?us-ascii?Q?LfC2ogiFYrnYahr36yfF3thTYEaT6S+7CdZ5FwpRqOvgYlvshoq7yU3R0Zle?=
 =?us-ascii?Q?BSnc4E8/6l55w5Msbybd5+hJ9jUkiocxQZhUtvc/TEvjfUJm2USVun2aRTMu?=
 =?us-ascii?Q?PGivM56NbSpVJZagHrOW+52zMr72v7cHy2OehOuDpzdXJ8NCG28DBPyHIcIU?=
 =?us-ascii?Q?wv5u1x9KCCmzWPZsA6v8E7hpyh/N+RmzzKVavRKVEAwdFxm7yonnnIxXaNmg?=
 =?us-ascii?Q?gAa08fHMd+Me1eX5JHaAWfmf70eE7m8iOOKWz+hS6G/JxAGMNfz6NMRypexs?=
 =?us-ascii?Q?mIvUI2nA/Mu6Ft8E56acHVCcoT0UaDIjXYQZuEkmdA9cdIMhFyNDMJXBiYMi?=
 =?us-ascii?Q?13l+lg6YDl2aiU1KZH8IEVg6m2JMwK+bK8mbWym+EtiJUSuSr3qmUBOO0Hi7?=
 =?us-ascii?Q?FBwBEWjo7fQyS8bl7SYm9LbEEW1+iQADSY6zfqgnzArQcgd/8JvfOO6sOp4A?=
 =?us-ascii?Q?/rRJV0+ZH2SLU3YsKJbGIAfV5Hv3FBiaDflmGJy4QIUU03pnqY5z3i0tpjut?=
 =?us-ascii?Q?lA5Fy/hP4Y6gWx5c1e/MnTQRR4r4VZ+g7wbJnsH2FTH/R3i3LUR5JhsH9GL1?=
 =?us-ascii?Q?qiKAvizpyjPLUmLtajZjDUqoS8sme9mlOh5PTU2nwvkQRbDM+7F0jlNK98SR?=
 =?us-ascii?Q?0aH++1QCwMotC4NPhjcsJwKEm1npemoUOP6rmBiiEN0d1kXuN4knYv0K2eYf?=
 =?us-ascii?Q?e2rqIo3rWldjYbhf26F/h02oJMKKDGJ0oQE09bPjj1yty1k1auQsrLJuQydL?=
 =?us-ascii?Q?OlDvkLREn90Phv30S05/X89N3fc77MkMc23fTXksFI5SYDAzKrGMNIlSpS7H?=
 =?us-ascii?Q?tA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cf67b869-8a84-45b6-7bca-08dd9e5b3384
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 02:47:50.1239 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: By2cqGDOHUs7C0LXaHGW2gm6bAPwCzMjNxgkQdI9a3ZFDt4xjujyDVcf+Q4kAAhkBfPdLP9BNP/0jqTGC7mrnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4590
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

On Tue, May 27, 2025 at 10:09:53PM +0530, Himal Prasad Ghimiray wrote:
> If the start or end of input address range lies within system allocator
> vma split the vma to create new vma's as per input range.
> 
> v2 (Matthew Brost)
> - Add lockdep_assert_write for vm->lock
> - Remove unnecessary page aligned checks
> - Add kerrnel-doc and comments
> - Remove unnecessary unwind_ops and return
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 95 ++++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm.h |  2 +
>  2 files changed, 97 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index d60b711e97e9..c220bf904ee0 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -4161,3 +4161,98 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
>  	}
>  	kvfree(snap);
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
> + *  Return: 0 if success
> + */
> +int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
> +{
> +	struct xe_vma_ops vops;
> +	struct drm_gpuva_ops *ops = NULL;
> +	struct drm_gpuva_op *__op;
> +	bool is_cpu_addr_mirror = false;
> +	int err;
> +
> +	vm_dbg(&vm->xe->drm, "MADVISE IN: addr=0x%016llx, size=0x%016llx", start, range);
> +
> +	lockdep_assert_held_write(&vm->lock);
> +
> +	vm_dbg(&vm->xe->drm, "MADVISE_OPS_CREATE: addr=0x%016llx, size=0x%016llx", start, range);
> +	ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, start, range,
> +					  DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE,
> +					  NULL, start);
> +	if (IS_ERR(ops))
> +		return PTR_ERR(ops);
> +
> +	if (list_empty(&ops->list)) {
> +		err = 0;
> +		goto free_ops;
> +	}
> +
> +	drm_gpuva_for_each_op(__op, ops) {
> +		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
> +
> +		if (__op->op == DRM_GPUVA_OP_REMAP) {
> +			if (xe_vma_is_cpu_addr_mirror(gpuva_to_vma(op->base.remap.unmap->va)))
> +				is_cpu_addr_mirror = true;
> +			else
> +				is_cpu_addr_mirror = false;

Maybe let's add a sanity check here to make sure we know what we are
doing.

			xe_assert(xe, !remap_op);
			remap_op = true;
> +		}
> +
> +		if (__op->op == DRM_GPUVA_OP_MAP)
> +			/* In case of madvise ops DRM_GPUVA_OP_REMAP is always by
> +			 * DRM_GPUVA_OP_REMAP, so ensure we assign op->map.is_cpu_addr_mirror true
> +			 * if REMAP is for xe_vma_is_cpu_addr_mirror vma
> +			 */
> +			op->map.is_cpu_addr_mirror = is_cpu_addr_mirror;

			xe_assert(xe, remap_op);

> +
> +		print_op(vm->xe, __op);
> +	}
> +
> +	xe_vma_ops_init(&vops, vm, NULL, NULL, 0);
> +	err = vm_bind_ioctl_ops_parse(vm, ops, &vops);
> +	if (err)
> +		goto unwind_ops;
> +
> +	xe_vm_lock(vm, false);
> +
> +	drm_gpuva_for_each_op(__op, ops) {
> +		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
> +		struct xe_vma *vma;
> +		struct xe_vma_mem_attr temp_attr;
> +
> +		if (__op->op == DRM_GPUVA_OP_UNMAP) {
> +			/* There should be no unmap */
> +			XE_WARN_ON("UNEXPECTED UNMAP");
> +			xe_vma_destroy(gpuva_to_vma(op->base.unmap.va), NULL);
> +		} else if (__op->op == DRM_GPUVA_OP_REMAP) {
> +			vma = gpuva_to_vma(op->base.remap.unmap->va);
> +			/* Store attributes for REMAP UNMAPPED VMA, so they can be assigned
> +			 * to newly MAPPED vma.
> +			 */
> +			cp_vma_mem_attr(&temp_attr, &vma->attr);

Again maybe drop the helper here.

> +			xe_vma_destroy(gpuva_to_vma(op->base.remap.unmap->va), NULL);
> +		} else if (__op->op == DRM_GPUVA_OP_MAP) {
> +			vma = op->map.vma;
> +			cp_vma_mem_attr(&vma->attr, &temp_attr);

And here.

With the nits fixed:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> +		}
> +	}
> +
> +	xe_vm_unlock(vm);
> +	drm_gpuva_ops_free(&vm->gpuvm, ops);
> +	return 0;
> +
> +unwind_ops:
> +	vm_bind_ioctl_ops_unwind(vm, &ops, 1);
> +free_ops:
> +	if (ops)
> +		drm_gpuva_ops_free(&vm->gpuvm, ops);
> +	return err;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 1ef98113fa5b..8151b1b01a13 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -171,6 +171,8 @@ static inline bool xe_vma_is_userptr(struct xe_vma *vma)
>  
>  struct xe_vma *xe_vm_find_vma_by_addr(struct xe_vm *vm, u64 page_addr);
>  
> +int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t addr, uint64_t size);
> +
>  /**
>   * to_userptr_vma() - Return a pointer to an embedding userptr vma
>   * @vma: Pointer to the embedded struct xe_vma
> -- 
> 2.34.1
> 
