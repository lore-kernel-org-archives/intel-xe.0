Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9017C4167B
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 21:30:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A09B310EA9C;
	Fri, 15 Dec 2023 21:30:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C25910EA9C
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Dec 2023 21:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702675809; x=1734211809;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=L1iYl9TriOJiF/tKf3XKXbJNvOFpj2FoWX6RSlF97IQ=;
 b=GTHlZamFoimFqOYSKQNsRnNI1zD67U5qMtalBvH2nSOcAJ3DVBEEl7cI
 YPcZC5TFp88YLnnmpkogUiPtuOjb7ki1Oh1iSkm2oN8H7JRlsQNV6UIsv
 aDHb4eCkkwW7RwmSuNzdIQsQzSKJiLXVUI1Er4X2vm7CZk9QD7lbEJelE
 CFe+hy2IBQScL+0v+7iV/JRrVuDe36+MBv+g2sSwD7IgIhnhANI2isPCv
 SIt7finbqmdfFsdbDqta+Bqny+Whu4rNkvrNPT6//D/VmxAGnuFPvbQLk
 h4ublA5PSJS+iT3L6gr/DXy6GyE927LOD188UgmzCFw2l1atpCr5rr8vf A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="2498955"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; 
   d="scan'208";a="2498955"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 13:30:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="865532879"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; d="scan'208";a="865532879"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Dec 2023 13:30:08 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Dec 2023 13:30:08 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Dec 2023 13:30:07 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 15 Dec 2023 13:30:07 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 15 Dec 2023 13:30:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S9wondxFzfgMy0GouiSb27wG/tZilWPca+DWZI7soLwQj++oVgsZcGbufUF5KyB1cy2YYGMc/Zcp9wxopZf4A/tcOz7xMzzSMNpEn+AXE/JUsPp4VD60T55flEGYAaWoQ/P24PO8riWgFyfoYwWGDjJh2f3pBSAnRbMbtNbVzWVeWlI3Mi9bwETRNDlnpvmPnNro4in3WrmhRuKohhdniPqhp63Kq740FDurojlue0F5AdDIFjrsA5DJ2OO/7oA/J3ckWDQ8Ofxo+cSQ3egjQ2XcwpUdGUyB1ajIJgj6s23yJRSYWIyxMbMlvHg/C+cZ2S3naAHa3PNWVDiNLcoF1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D/6y7C3h0xWk0yTsuq77G+jNtuJhCLG2t69cPjk7COU=;
 b=gzSW5+1vjNTFeiMPdfZNnqiCm4CGxxctumwQ+hX4+5uKJ7CmxQ4AO5fobjuGX2rujyYNmJ9eq+srpMFcCN1vCM/85YhZ6VMpDh7NkeRDwDHQurNUCgqYASGWxUrulMq9pxL8OCR1VTLc2al5pH7T2pak3T6ZsAe/w0MvzffeYtXZvlG9fHfs1J+nhA0qtUBu7zkpqVIYMaXZolkKHeoys7xf62fgkV1IKy8dz+PCs3bjaIkDs/ROW3IxFOA3UEGEVzmXW0liUUnWCTiiTH3zthgAzmrBDeZ7urOuabRvKRk40c+V3Gu947fTAZfguk3nxDzDEhG/p7P5EC3+2Jup2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB5144.namprd11.prod.outlook.com (2603:10b6:510:3e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.29; Fri, 15 Dec
 2023 21:30:05 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7091.032; Fri, 15 Dec 2023
 21:30:04 +0000
Date: Fri, 15 Dec 2023 16:30:01 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH] drm/xe: Fix UBSAN splat in add_preempt_fences()
Message-ID: <ZXzFWbt8LTgDOHG7@intel.com>
References: <20231215211245.718686-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231215211245.718686-1-matthew.brost@intel.com>
X-ClientProxiedBy: SJ2PR07CA0021.namprd07.prod.outlook.com
 (2603:10b6:a03:505::23) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB5144:EE_
X-MS-Office365-Filtering-Correlation-Id: dad00c56-614c-41d4-d9b1-08dbfdb500ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /nY3yipXZSyHqh2pz+fyZwTVNehGf43uLSRO5L4b1A3KgOaFIZWEhklFADXw9zRyo49xp2ldKc33Ls0MnObmAAx/d6dbukdjLOYJ8FI2H+Rjwcc8np0CyYKAcw+9eLBE5WBvsTCGtWuR+zh0v8AsxjZChfo70mKBdiHxXIRH0tX6pR6JxVRJcDJCbjYU9ictI7zSHgP+vXXrloFb7Hrum3Y29gpvg1nGiuL+Koney8EqMGA32YV99HiDpeZujbVI0gjcpi7AlU8QRS2zQKw2K8QwYhrlbiTt2iQ3Tp7ZskpzVdZSmKXwJAu0VqcvuC2NG9D3AO7HjIPmHs2ZLWh3PZzYqueoD2Eu+x6/xYndgVnzaBLB6tgU1EzUsIkNoJm0nWed0Masjqsys/9sG5eO/YQWdQ4EIoDayuDW/8aItYGnpl/8RZPw9ol2kZPgYILd7p2B4SOIQGy1ar5Jc/OYsT47GQnTC1t3n3SmUZY/LSE+tTQujWPo6diUzeL5ZBIFNYI2mTh5rHChcwNh0nVED7gLaGZiqdAgu6XDpvsFnjJLZY0MzMkTxDlTMejN/Nnj+ec9nVBEwKUaRxYDityBbtW3r8VtBRKAiVT01H9VaB0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(396003)(366004)(136003)(346002)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(8936002)(82960400001)(38100700002)(478600001)(6486002)(6506007)(6512007)(6666004)(44832011)(316002)(66476007)(66556008)(37006003)(6862004)(4326008)(8676002)(66946007)(2906002)(6636002)(5660300002)(107886003)(2616005)(41300700001)(83380400001)(26005)(36756003)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eQ6aB/G1DfesU5Qx41azcoOfrqVCrfhKB/3hkkz0+rxs2uKEpdTXBr22+nu0?=
 =?us-ascii?Q?EfCj3bBkHJTNqkY/3hr4WTzhiuxRN5MW0nl8rrv4oPLuhzAw7zp43/nRZFYW?=
 =?us-ascii?Q?9nPIbDeKJ/+oyl5OkqIwXieFr3WnQkvza0jKDzu8zImcN8CcghJ4p8Khckjh?=
 =?us-ascii?Q?PTutJwYj437M4Ie6m/ZnglsrztSmTAOgeuNM/klTg6gt8Bzf19NZB7dSjGRv?=
 =?us-ascii?Q?lUr3Snar/C4t9VBfudPUNrSLKhmnVSAUEFgAFwXICjq+wOBxNJOpQ/CPoztC?=
 =?us-ascii?Q?QGZu63BqkANd9esMkXbtnJ6T9H5m86z7uItdzT2AnItjL1nX8Er/b/3ElbNQ?=
 =?us-ascii?Q?9bLQ+K6ADlDqnBjeXlDWbS09aBU+W8ZYW3TLYBIlN27DopeLNMbv6lmLb51b?=
 =?us-ascii?Q?GG7bie6y9q2934kedS2RYN3YqjYQl4tHR4vkS6OKlXlRGeoMrq4Of6cHUqK+?=
 =?us-ascii?Q?m12nL7h2+eR921nK4w6QYm3ShpbROWOJpo/Fx/4r9+IEfLP9ocBH/Px57hHq?=
 =?us-ascii?Q?OpdwEvh7P5a3WPKfZJJJEvoYj3azC+SVSS57rOdoFOBIoKkpnjGlQRIHm32t?=
 =?us-ascii?Q?/mcanTRMDGDkUyPWIhLWDBypyy4qGs3p7/d9nHig+YP9Fg6Ff2A1rermU618?=
 =?us-ascii?Q?acgPhcCN9ezMPR161YxYXpdKkzE+dRvEVDQPDWdTttP/zWH04BMYB+ikncj4?=
 =?us-ascii?Q?vCZwp0ecTVdR6JDdL/H6dNlu0v/UsNPkrxF2YSzmuWlG5kP+8Tq2jm9grKXP?=
 =?us-ascii?Q?SRAm0MxB2Xbrf80sVVnQMlCIRjeYmfRl+5aI69XtEx0Um8FtAKturNXKqta+?=
 =?us-ascii?Q?HG9QS7utPz/3SrS5gPC3vXZC9spPAcyXyWyNU2FcLGN3SmCIjfXvNku3b4n0?=
 =?us-ascii?Q?4R3eJ+KE2XkoFYXORjVtlANByFIzGg0cf6SwoktawRk84g1V+zbdwfIDT0Q9?=
 =?us-ascii?Q?eeKnAuPSqkVGXO1L0YmmKrewM7iPr/o7HbQ9QJ6PnM6MGAt/wgQQsCZtgZrK?=
 =?us-ascii?Q?6mPfSDHAwF1uyv4qNWeHcphcNQJNjvbKIB7Xko90n+GAVMRs6pnbQC01kGby?=
 =?us-ascii?Q?EXe8aMeATzetJiB0dXnwPZLg5M/2Dkc3hWCxvJ3TNcckAQl8/UMGDkmifcym?=
 =?us-ascii?Q?B2oTG2CpLzP4vBgUGzvC2MPx7+XaupjehM/TS3rSHRe7zRv6Lt/VvYCqesEC?=
 =?us-ascii?Q?5oKTZeGjk/JuyxHebNslwAyVBDOnEh7Yg4FW3QW3Joj4cjgW2De4AMAJHqQP?=
 =?us-ascii?Q?2g8cTr/0O3Q9abQ57Wp5gU042jnKgndE5KtKHwIQ+iSlk41S2zV5EK0H4QlJ?=
 =?us-ascii?Q?vaQqCg3ntyntWGcysl+N0I06PkvN1LTLMO8uUddi2d8HFpReW9AZWIsHDlNQ?=
 =?us-ascii?Q?vet0YvhhePj8kyJOxDSc/MTvr8oJnHrr7POcT3LoPNYCnohicuVz0sWWHVtT?=
 =?us-ascii?Q?5szIm9eyKfQjUNwuQoRgxp/jJdTEDwdPJkgCiSc5jeB7pU8WJU9Jd0RFG4K8?=
 =?us-ascii?Q?HjUpn4w7MnR3l1C2xGh4YHzzl6BmwTctqJBoYCmG02ptQMKZCPD+aiWueQ4q?=
 =?us-ascii?Q?xTzeLj4SpKEPYyX49Edx5bn145LXwlcSmXrh2zaQ7BHl71WU47tYNg1UAJ7B?=
 =?us-ascii?Q?sw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dad00c56-614c-41d4-d9b1-08dbfdb500ba
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2023 21:30:04.9174 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /WYkNc+vbCzCzefs96E202z87hllpkzyy4ej0t1S5Pm33RSmp++9x6dKBxym5GhNIZKLebL+P8cw1F8iPmhLSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5144
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Dec 15, 2023 at 01:12:45PM -0800, Matthew Brost wrote:
> add_preempt_fences() calls dma_resv_reserve_fences() with num_fences ==
> 0 resulting in the below UBSAN splat. Short circuit add_preempt_fences()
> if num_fences == 0.
> 
> [   58.652241] ================================================================================
> [   58.660736] UBSAN: shift-out-of-bounds in ./include/linux/log2.h:57:13
> [   58.667281] shift exponent 64 is too large for 64-bit type 'long unsigned int'
> [   58.674539] CPU: 2 PID: 1170 Comm: xe_gpgpu_fill Not tainted 6.6.0-rc3-guc+ #630
> [   58.674545] Hardware name: Intel Corporation Tiger Lake Client Platform/TigerLake U DDR4 SODIMM RVP, BIOS TGLSFWI1.R00.3243.A01.2006102133 06/10/2020
> [   58.674547] Call Trace:
> [   58.674548]  <TASK>
> [   58.674550]  dump_stack_lvl+0x92/0xb0
> [   58.674555]  __ubsan_handle_shift_out_of_bounds+0x15a/0x300
> [   58.674559]  ? rcu_is_watching+0x12/0x60
> [   58.674564]  ? software_resume+0x141/0x210
> [   58.674575]  ? new_vma+0x44b/0x600 [xe]
> [   58.674606]  dma_resv_reserve_fences.cold+0x40/0x66
> [   58.674612]  new_vma+0x4b3/0x600 [xe]
> [   58.674638]  xe_vm_bind_ioctl+0xffd/0x1e00 [xe]
> [   58.674663]  ? __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe]
> [   58.674680]  drm_ioctl_kernel+0xc1/0x170
> [   58.674686]  ? __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe]
> [   58.674703]  drm_ioctl+0x247/0x4c0
> [   58.674709]  ? find_held_lock+0x2b/0x80
> [   58.674716]  __x64_sys_ioctl+0x8c/0xb0
> [   58.674720]  do_syscall_64+0x3c/0x90
> [   58.674723]  entry_SYSCALL_64_after_hwframe+0x6e/0xd8
> [   58.674727] RIP: 0033:0x7fce4bd1aaff
> [   58.674730] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <41> 89 c0 3d 00 f0 ff ff 77 1f 48 8b 44 24 18 64 48 2b 04 25 28 00
> [   58.674731] RSP: 002b:00007ffc57434050 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> [   58.674734] RAX: ffffffffffffffda RBX: 00007ffc574340e0 RCX: 00007fce4bd1aaff
> [   58.674736] RDX: 00007ffc574340e0 RSI: 0000000040886445 RDI: 0000000000000003
> [   58.674737] RBP: 0000000040886445 R08: 0000000000000002 R09: 00007ffc574341b0
> [   58.674739] R10: 000055de43eb3780 R11: 0000000000000246 R12: 00007ffc574340e0
> [   58.674740] R13: 0000000000000003 R14: 00007ffc574341b0 R15: 0000000000000001
> [   58.674747]  </TASK>
> [   58.674748] ================================================================================

Can we pin-point which commit introduced this?
we need to start using more the 'Fixes:' tags.
(Although while we are really not in tree we still have a chance of rebasing and having to adjust
the tags once again)

> 
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 322c1eccecca..6406370b2625 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -283,6 +283,9 @@ static int add_preempt_fences(struct xe_vm *vm, struct xe_bo *bo)
>  	if (err)
>  		return err;
>  
> +	if (!vm->preempt.num_exec_queues)
> +		goto out_unlock;
> +
>  	err = dma_resv_reserve_fences(bo->ttm.base.resv, vm->preempt.num_exec_queues);
>  	if (err)
>  		goto out_unlock;
> -- 
> 2.34.1
> 
