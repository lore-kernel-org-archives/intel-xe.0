Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 897ADC83F25
	for <intel-xe@archiver.kernel.org>; Mon, 21 Jul 2025 18:26:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5114210E2B1;
	Mon, 21 Jul 2025 18:26:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e1IP3yMC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 517BF10E2B1
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Jul 2025 18:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753122366; x=1784658366;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4cqpTRuZ5wrnII64Y8U7fclwTNob2uVP3hJfhHEWzXo=;
 b=e1IP3yMC9+2Q77/DhC/IxRH9yb0YmAXvWZ15R6gDx4yPZdi8Fwwu3ecs
 vNU7Wp8qeVZ6+CczgRsBNhuX838Te+6P63vgpk72n7huK11u0ZM6IRFZc
 +ORujfhDzau69o20XW4wAdcysjhmNn3StLaxnhrDRzqW1nj6AGACuAxde
 cZIRK6X//fO1R3kgkdMogyyn5WzJVDmLvrYfdqYwqBW6OKOiHVNXB63H9
 4t9DiWpncn925L+YfWkExPx42cdou6fhcDZ/bfEgMKV/qN+9YzSUYUGVm
 E23POa1GPcVkZS7sIPfU4jForCHHdltHKJInhdKQ0iCAZnkA22gCGhX2b Q==;
X-CSE-ConnectionGUID: fGzP8ZyZRMyADfKMv2yURg==
X-CSE-MsgGUID: MwKlGu/uSA6dOBRy9IKBlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="55463264"
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; d="scan'208";a="55463264"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2025 11:26:05 -0700
X-CSE-ConnectionGUID: gkdoGoHITSuZ5qUWhxqv3w==
X-CSE-MsgGUID: s4pIdkRtQbatM25c4JKk0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; d="scan'208";a="164401051"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2025 11:26:04 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 21 Jul 2025 11:26:04 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 21 Jul 2025 11:26:04 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.52) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 21 Jul 2025 11:26:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BMXN62MG+pp6XVqKG0KWPvFrdUPUz5DT8zViAAQofUYCbp7byzIRR79cssq+2C2J68UJ98XD1/TmoLe04ARZ0p/b6EAAaDVgpAaBx4Rj+8QmOtzGgXRs1l1bNWUJedyoPcwJuKxXyKoYQGx69OUXhq/FgfpQNNuKaYasnJWPHZZgGnNaTF5jaApc6QbCLXy2FvBwpBEPcZakNNuWlwXoUgS+ImHHXjHBsPVd8hL5nw+p4ajzSHTHvljIm4O/9gkYjhDzMUB4xu12QlZAQ0tU2vnxJa8hENk9ehE9c4565nXdwmtZfQp3qi/zDEPozjyQ2l0SdxrGkBe0NYEA92StIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rXxYXXcrVf79J8C3t9tcmyrxHPcRGRJw10vvz5UU3xg=;
 b=BmwIwRFyc38NP0G5lf2RN8XXInpCnXOOt9RDmBeliUchirAN804Cfgh7ZcsZs55GiSa8TxmoALpDCBu7em3+MIPr7HsyaukERzJY+bi2pJhhBccIyIACqloh7xg6mL/MYuUuWpvJBoBdrAZ6HWhqYppnC0SwCC1++Jx6UZtUJC3/JIu503EAbp7TwYVYTjGTA7jeQl3HUSaphT2u8wWqs6GppnE3puylOjmpFsSRSmBbMyXs+H/CxJ8f8i3Hx0FxOAknR9D1mnySLOSiUasucO8rlfA0Nih/Yu9Dxd32XgcjcekGglUZflVczHigPBURPYbVwfF6pBovjF9Iegdxnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6527.namprd11.prod.outlook.com (2603:10b6:8:8e::19) by
 MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Mon, 21 Jul
 2025 18:25:34 +0000
Received: from DM4PR11MB6527.namprd11.prod.outlook.com
 ([fe80::5a48:57be:974b:8ee0]) by DM4PR11MB6527.namprd11.prod.outlook.com
 ([fe80::5a48:57be:974b:8ee0%7]) with mapi id 15.20.8922.037; Mon, 21 Jul 2025
 18:25:34 +0000
Date: Mon, 21 Jul 2025 11:27:21 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/xe: Misc refine for svm
Message-ID: <aH6Gib4X+cHLi/Dj@lstrano-desk.jf.intel.com>
References: <20250718212409.86516-2-shuicheng.lin@intel.com>
 <20250721153339.369318-2-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250721153339.369318-2-shuicheng.lin@intel.com>
X-ClientProxiedBy: SJ0PR13CA0051.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::26) To DM4PR11MB6527.namprd11.prod.outlook.com
 (2603:10b6:8:8e::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6527:EE_|MN0PR11MB6207:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bb2e278-ce1b-4f8c-b4c9-08ddc883fbb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?C/7ZCm6uwvA/8VbKYfsnFBdBIKNX/sSqhWL+ELqV/MIeIClQWTHloLO0U7is?=
 =?us-ascii?Q?67C3IXPKJXugxc0RJ/X+t/v5dfUTdnlPyc7tLdMJ214FTzpf8gdlAO4vSemI?=
 =?us-ascii?Q?QV+AFQBRMaTTjEPha6/IPgqpQup330AyYBnLMmcgnPj6E5detWrwNgFUPovX?=
 =?us-ascii?Q?UbAPlvkiVAzB69Z4QQgSx9+598Pk8VUaU+tQvknAMS39r86L8GxTebEyoK+2?=
 =?us-ascii?Q?vlTd7Cfswa2G3/SFWLg3Z608d4+NyuaY45nFtzb4Xos8bl7A+PE0mEBXq+l5?=
 =?us-ascii?Q?OcF8isL4rOaW5UL8Ty5qyNWJLEK6AGVdt7sqeNVH48eADrlK8qoabj4t3DcQ?=
 =?us-ascii?Q?JfXIRSryPWxBTHbQIGP7QaggJQOTYE3oEGRz2WIAxF1qB/kAp5oBvQvbNHiX?=
 =?us-ascii?Q?6h7WpWSqb5yms9KvIMMKHTYKGg4NPsjQwj8105lohFW62bN5sPZjp5z71j99?=
 =?us-ascii?Q?Mbl/g1aHZCot4NA9yNkxq9vPcwntqIiz0IX19Sa2kKhu4oIqvg+gHd/797Zj?=
 =?us-ascii?Q?TJv2+UaK7FEZuWm2At9aaevhHdnTKE99No8pWlypBI7a6P2PsPy9oEQZdF5e?=
 =?us-ascii?Q?QFI1z9KwmtXsUj6umwbPRw0vKL5Tm/LEtD+j1RVVjcyqie5vUz1rFy6Lrot0?=
 =?us-ascii?Q?scg6Do4Wk75DeIPFYf/uMb2VVDYMqKWxSV/Oj3iU+g3k9XLqghEbVvCar3me?=
 =?us-ascii?Q?8EP2Sm1YnwOxPk4nvP9Pq/G4Wf/wwRTN4Rod2B1CgghlmhkZTTipMF/zN1z/?=
 =?us-ascii?Q?AVJKT3nXj10ujaFnkmE0W6KsKA+TA4ktyu3MyQ/U56DfoX/5W1rNUzI0pVMg?=
 =?us-ascii?Q?gFMVZiFOXxiedDxoe4ntJDs7zaZTcl9GNrJKSeSZb+p+BoFIZRFSSEVfi6+9?=
 =?us-ascii?Q?Ojq+9jX3DcJP/jCpSIpDoXzmrfGQ7ApVWj6hfGwrqXbLwo/cKPSyW/zTS6LL?=
 =?us-ascii?Q?mTFHFYhRzhX1YyA7twGoBJSB9ehD4gJIVicqnnRt9LiUY5/sgAUcUs4tMc9T?=
 =?us-ascii?Q?yNka5vVO8DFIB9sNmYEwJHA+3enLT2XKbM8cQitPwMyvzOdUZk92UbKu4FDp?=
 =?us-ascii?Q?F5/w/n2SBbqnfFoJNCe9R7mHb1iasLgMyqefOZ/vXhQDmSSrA9MFGsBrbIHD?=
 =?us-ascii?Q?tvOaJkGIeQFBDjjgWD298J6z1pqaVbyBnD4ZutN4YIb6jcGLtk4r2tFXCSrt?=
 =?us-ascii?Q?VLLnVozSiU2SR4jg7g8WmtX8LEv8DWbN+a/d+UilrhOTYTzS/8zE4anumWZW?=
 =?us-ascii?Q?uilCd6QZg2RfD9d9dgwBUAUEIvWVTehWYuTv7xY6tuC5lDokYhlJGUDo17nS?=
 =?us-ascii?Q?H9XWmLHxpKNXrkQjVrr5YC0wkgheLE4nUOC6ozK/NDFi3X/6lCAiZ/X6NYSo?=
 =?us-ascii?Q?2j9nywGD/gIPr0YB30/j99ewDc55YEgajryj5WuSBQXQ0XkSLO6OZkWcJ8yI?=
 =?us-ascii?Q?TQM0zyiFCSQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6527.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WeZvEA9RAWJ8nHZNkSqTyBqCLPmEUs5UxqeMow5MZ6Ur/i0dXFsHAhoyEFEy?=
 =?us-ascii?Q?phVVB5o2b4vEWpntTshPyJRrcXQsavOG0hCwQPQ3Zjf7YK8JGMThk5OLLu9s?=
 =?us-ascii?Q?PRRjBMIM60i08rttw7Xwlyn4yFD9+UNsaCFJ7QkPbYEk7aWbqKdw33k/JNyY?=
 =?us-ascii?Q?71mdHexJh71FUmnct5axsX80wvSpGwZoFfOFMEKiS7c2jLsU5T8U050f2ZgO?=
 =?us-ascii?Q?EZmMzBav6bLXsNQgTfVF09OnRrEy0cGRGKwpCnq3gnL8RR9N5PyAApxzvKrT?=
 =?us-ascii?Q?0FJfpk9Uij7NnSu9iD77I3+e2LSKazWQClEJ+oF5FTRR9ShaWMn6rjedI/Zq?=
 =?us-ascii?Q?w/Y+p6ON5cYsEKoGc78faOfBepP2FuZu6YD+pTUzUAcorPEJiN1Sbh6AfVnR?=
 =?us-ascii?Q?kT7VZ+finqzhlq+fEGCzB7n0LN3Ladlv/x5xs0MhAtmk7DH7Hk1AqrVUj4nJ?=
 =?us-ascii?Q?iAz0YS11DfxheSTVv9X6EGnDhC9pFes3h4CyTI7u51YDxB2sTRggCkSCODcM?=
 =?us-ascii?Q?Cpg4a7w0KnZNdM3r938cqoz/IouTcxhVZ0uAXxXMOkmXZICcUSj+2Gpt5BAe?=
 =?us-ascii?Q?3sSHi1pwA83bln7vN9AIn5BfunhXfRDMFCI0b5shAtTzGH5JgJll2g37q3hd?=
 =?us-ascii?Q?aF83r/OHisTknQbU6VAhBx83NdJHFA9A0hV/yE5J83YLi0bicBQJurAUZcmp?=
 =?us-ascii?Q?Gr9VvtxFqbvDCf+J5uPQOpaURmay4F6eLY+G9ZiXCSTgVDSP8UoSHiAp4f58?=
 =?us-ascii?Q?J43nHJUKTyFsZLZopbMhfS0PALxJ3oL6tu2t+U73MSaabG3mawoBsZ6kR1U+?=
 =?us-ascii?Q?vkzL1ze0rqbUl3MfXzUvVae0fjnFqonNvZuJDk0qtlt1tKFcO7gzPGWsZHrL?=
 =?us-ascii?Q?nTnpT7DtRj7RrBp9oPW7B2e+iF6NBhevS9YU7phz+WGYYev83Fou85uyc2Zz?=
 =?us-ascii?Q?ZzDeTkXpxPh3VF4b73+ZHFStRRCWAYrFkaVBkBKqUFJMkABONCo7WNizcZjz?=
 =?us-ascii?Q?k2iAvupUYHfIIVZk1iymFi//wNmtVHsnS5v2uQvefuvSubS9E4MKClCFaJo1?=
 =?us-ascii?Q?u9Xk65TgKAyRCs6JbmusorV9IfiZDY0fzq/Mmb2D/a2dyDkiP/OTlpJaw35P?=
 =?us-ascii?Q?PlXmBbEmIiybdGEUc2mnAXga6CLFyhOnzkLM6KJoyWtAM9UjSNdsEziLHr5/?=
 =?us-ascii?Q?FrFrUnz/jd8/j4dsCTuIF6x3SFuPuDKpl1RXYB5CmmdfcRpJGTXO9weawNdC?=
 =?us-ascii?Q?TkcCSUAGLsyvMtrBo8UYnl8VJiQtB0fxnUjXw8XALAii69b3GOFeLrh7zksq?=
 =?us-ascii?Q?02QXz49wjlxhsLAiKxF86njBFOBC00wcQ+ukJZlrRpyznuaifhwwzxUBXAlj?=
 =?us-ascii?Q?vmAnB2ghH1c3efr1ZC/i4XTmBgn4ivJ5vUVa0i5SETesFsdLbs4/LjeL5JWx?=
 =?us-ascii?Q?KVLhdzvzsd/OvMRWvnCFIMn4h5IPvf+hR0qcfguQ/hY5sVlQrCYnUaqjVkZN?=
 =?us-ascii?Q?YrsayoayGm9f7NalpZvZ8PiwyFQNANwvk6Bq+83nWdN7vCtLRQcoEI7ToKGs?=
 =?us-ascii?Q?t4IA4qRR9iTo5oy3Jja09flRigiW0X8ziKD6bXgFel9Tp1BVxip0kuBLLtct?=
 =?us-ascii?Q?UQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bb2e278-ce1b-4f8c-b4c9-08ddc883fbb7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6527.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 18:25:34.7853 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 79k8OQxx8UzXoGYXIJOWjB4aS0TXdo8U+9R8m1UG8mEb1DetggBgHpQYYX/69B96ERne97Y1s5d0V3S0T1dY/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6207
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

On Mon, Jul 21, 2025 at 03:33:40PM +0000, Shuicheng Lin wrote:
> Below changes should have no function effect.
> 1. Correct typo of "operation"in macro range_debug().
> 2. Combine 2 spin_lock() call in xe_svm_garbage_collector() into 1.
> 3. Remove preferred_region_is_vram check in xe_svm_range_needs_migrate_to_vram()
>    as it is already checked in the begin of this function.
> 4. Combine the devmem_possible check in xe_svm_handle_pagefault().
> 5. Combine 2 xe_vm_unlock() call in xe_svm_handle_pagefault() into 1.
> 
> v2: revert !ctx.devmem_only change (Matt)
> 
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_svm.c | 30 ++++++++++++------------------
>  1 file changed, 12 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 10c8a1bcb86e..a35bca95ab95 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -50,11 +50,11 @@ static struct xe_vm *range_to_vm(struct drm_gpusvm_range *r)
>  	return gpusvm_to_vm(r->gpusvm);
>  }
>  
> -#define range_debug(r__, operaton__)					\
> +#define range_debug(r__, operation__)					\
>  	vm_dbg(&range_to_vm(&(r__)->base)->xe->drm,			\
>  	       "%s: asid=%u, gpusvm=%p, vram=%d,%d, seqno=%lu, " \
>  	       "start=0x%014lx, end=0x%014lx, size=%lu",		\
> -	       (operaton__), range_to_vm(&(r__)->base)->usm.asid,	\
> +	       (operation__), range_to_vm(&(r__)->base)->usm.asid,	\
>  	       (r__)->base.gpusvm,					\
>  	       xe_svm_range_in_vram((r__)) ? 1 : 0,			\
>  	       xe_svm_range_has_vram_binding((r__)) ? 1 : 0,		\
> @@ -263,8 +263,8 @@ static int xe_svm_garbage_collector(struct xe_vm *vm)
>  	if (xe_vm_is_closed_or_banned(vm))
>  		return -ENOENT;
>  
> -	spin_lock(&vm->svm.garbage_collector.lock);
>  	for (;;) {
> +		spin_lock(&vm->svm.garbage_collector.lock);
>  		range = list_first_entry_or_null(&vm->svm.garbage_collector.range_list,
>  						 typeof(*range),
>  						 garbage_collector_link);
> @@ -282,8 +282,6 @@ static int xe_svm_garbage_collector(struct xe_vm *vm)
>  			xe_vm_kill(vm, true);
>  			return err;
>  		}
> -
> -		spin_lock(&vm->svm.garbage_collector.lock);
>  	}
>  	spin_unlock(&vm->svm.garbage_collector.lock);
>  
> @@ -763,12 +761,12 @@ bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vm
>  
>  	xe_assert(vm->xe, IS_DGFX(vm->xe));
>  
> -	if (preferred_region_is_vram && xe_svm_range_in_vram(range)) {
> +	if (xe_svm_range_in_vram(range)) {
>  		drm_info(&vm->xe->drm, "Range is already in VRAM\n");
>  		return false;
>  	}
>  
> -	if (preferred_region_is_vram && range_size < SZ_64K && !supports_4K_migration(vm->xe)) {
> +	if (range_size < SZ_64K && !supports_4K_migration(vm->xe)) {
>  		drm_dbg(&vm->xe->drm, "Platform doesn't support SZ_4K range migration\n");
>  		return false;
>  	}
> @@ -793,16 +791,14 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  			    struct xe_gt *gt, u64 fault_addr,
>  			    bool atomic)
>  {
> +	int devmem_possible = IS_DGFX(vm->xe) &&
> +		IS_ENABLED(CONFIG_DRM_XE_PAGEMAP);
>  	struct drm_gpusvm_ctx ctx = {
>  		.read_only = xe_vma_read_only(vma),
> -		.devmem_possible = IS_DGFX(vm->xe) &&
> -			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP),
> -		.check_pages_threshold = IS_DGFX(vm->xe) &&
> -			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ? SZ_64K : 0,
> -		.devmem_only = atomic && IS_DGFX(vm->xe) &&
> -			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP),
> -		.timeslice_ms = atomic && IS_DGFX(vm->xe) &&
> -			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ?
> +		.devmem_possible = devmem_possible,
> +		.check_pages_threshold = devmem_possible ? SZ_64K : 0,
> +		.devmem_only = atomic && devmem_possible,
> +		.timeslice_ms = atomic && devmem_possible ?
>  			vm->xe->atomic_svm_timeslice_ms : 0,
>  	};
>  	struct xe_svm_range *range;
> @@ -882,8 +878,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  retry_bind:
>  	xe_vm_lock(vm, false);
>  	fence = xe_vm_range_rebind(vm, vma, range, BIT(tile->id));
> +	xe_vm_unlock(vm);
>  	if (IS_ERR(fence)) {
> -		xe_vm_unlock(vm);
>  		err = PTR_ERR(fence);
>  		if (err == -EAGAIN) {
>  			ctx.timeslice_ms <<= 1;	/* Double timeslice if we have to retry */
> @@ -894,13 +890,11 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  			goto retry_bind;
>  		goto err_out;
>  	}
> -	xe_vm_unlock(vm);
>  
>  	dma_fence_wait(fence, false);
>  	dma_fence_put(fence);
>  
>  err_out:
> -
>  	return err;
>  }
>  
> -- 
> 2.49.0
> 
