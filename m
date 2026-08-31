Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E60F4C624A4
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 14:04:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DB9210E28F;
	Mon, 31 Aug 2026 14:04:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="keinW6c2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A57D10E28F
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 14:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788185098; x=1819721098;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZOutz4Ud236l47lDAkw7Jza+fsopGLflvMYsUBUBiuM=;
 b=keinW6c2wg8/AvvBFTCtrpq7N7jHt/ry6ks7U+/5dDQkW8UgXdAUB3Bv
 2+ZKOm6usDuDrCH5Y4xv2G5gM4CEhqA5uLLsrNYmhDaDZN01ZqwpJXf1W
 DUkpQms3VOrpjjeWOob0ME9lRt3hl1H53NRl72Nx1vz72LUmNNrl9GO2e
 auux7ekq4beTHVLq1/YJuFG1klgHE5HHvwIBWIOhKXhgeX2o7t2rT70IT
 ZZmUcP0nJAFh4gS//3Be4DhFQLoa3w3CzyN7zzGlFwKqq8m9mGTVVsXDf
 mw2jCI4fywFpvxAxo3MakezhoffJMU49CS5NJyZlVKrvtcRcJ9U3AP+xB w==;
X-CSE-ConnectionGUID: llQc5LF1RjuRMdWUuHe6WA==
X-CSE-MsgGUID: 6MCGmXWSR8WQoc2PGosZbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="111365672"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="111365672"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 07:04:57 -0700
X-CSE-ConnectionGUID: PYcJWNayRYW4oltRbs2zzQ==
X-CSE-MsgGUID: /TE82UdtSiuu+rsJRHEiCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="267003649"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 07:04:57 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 07:04:56 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 31 Aug 2026 07:04:56 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.60) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 07:04:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WX/+93E2dHaACTjBlDxo4/hs8seNueJMqUknhGi/Q0KuPpahbslR0D0oO1rDOybULLxNm9IMEPnPEtnW+G7GcI6OpWPZtdyeD/6VmLzyroWekuMHEch0qHMsiMfAYmEkaPKKVfZhRdJFo4v8cTY/xaTf6Kz2RaIlvtUQq+yegiT8Uwp3v8A070X6hG2AvRVxFdj8DSzXV0U2ZFzR2Axh1sdTfpMWgAGDvhS+mnrZERZZbpEireSQ12uxVIhII2XVqOOxNhyMq/BE9GdUoxXiQzpby/FdbLmqk63Dq+suxwdUK0csFnKbEyhQPgp8i64G/hNZXBFqUlIFcRwzRe+Aqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=blJAn9KmeYgTo+3WITTkXdZEKQHAuT1YauPNq+Xcn80=;
 b=Fz6D1Bqk9SPNHlsuOIxhnxSdt+hhtBnkXl5Gc4cFpJCwbeUbhehgpHOJJ8qQxLPU634ZDRm2pN6t2FceREmi0DkVJsPgFaTtZ9qyJxNd2EgB3CnVxqjU91ndg24pdrBw24dotnuM1UAHHSMYyiDP6K57VOWj9dYv4g0JqoA9/BsK/yS3qkcxhs1foxgnwV21mAhjoxAWdHLECJ/P9senexAfg8SmkmvffF9UUWDnMXh6XNzvwq13+CbaBbfw4ESu95Xky0KwYvZuu1JXl+gWWKlEGZDf4pRfiyFKcAK8SQZQwVaf6QZthLMdFlMFdKF2EUTnPgKd+G89LU+4MYkHNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by DS6PR11MB9893.namprd11.prod.outlook.com (2603:10b6:8:461::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 14:04:53 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 14:04:53 +0000
Date: Mon, 31 Aug 2026 10:04:48 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH V19 00/15] Add memory page offlining support
Message-ID: <apWKAFsHP9XLMOHn@intel.com>
References: <20260831064942.315720-17-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260831064942.315720-17-tejas.upadhyay@intel.com>
X-ClientProxiedBy: SJ0PR13CA0125.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::10) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|DS6PR11MB9893:EE_
X-MS-Office365-Filtering-Correlation-Id: 28eb3c54-c70b-4740-49fc-08df0768d3e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|11063799006|10067099003|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 3OkGnnrhdLGv5bl7aqE/fhivhcbfmJUT0r8I88Ycpto4rZbgQ6YQZGTdgkciPXm5GxzHtPM0YnkzGaNKXNqQ1n3WOXGxm6GFvt4gIdCUPbYU4E9fxkkSN0RgnUUeLTuD2tuIXVTZUow84z31CNYY8pnqwYK94RYP+hzJp0mloL+AuaOOfVYYfxg9YpH+7IxpSFW5B7ebtlsU15rNsVzIobiKVBZezo+Qc7qLgJxlMdWOwWeVKfB0YnYtNN3V9MRr5tjcNBszXbpDGKNvIYYmGCr4iTqeKI3YhO/kIL5IAjFGOMCDnsMMWgQeIo8NdVf35jaN5aqeU8xnT14ZVEDYqTPmTYZAs7CEazw8zXTeJbQxIDpRJ9G3JbGLTdPYmPdg+k7NFpTkqF71G1cAsfM6ElI2GezSYPNLoDWzYw4oBc0EfSVsCWSc2mmxuvYKR0IEiz8HkFZsAB1CS0hmqkPLc+lp5pXNkulu6lQqGYJM5W/M3Lq+7H6K3naErPk8htYzNzklcEkN0RGKRsVcquEexiJZ9xtp9lAEhgQukcv7HSvX0U5NsCphXJtLX5crH+vBi1dWxroaLqUDOALH9GK1mP/yMp4Ac0JHknaPfZTA5M5nb0xZBv60LWHJNSWXZ2r3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(11063799006)(10067099003)(56012099006)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mOWb0czHCFv0ijavo59BuvwVnhWtCdNHDp41wH23i+xiNCZallZV/B/EBjvI?=
 =?us-ascii?Q?NOMQKDBP07ZpACCqLnVehDMmM5fmBM1zLsAbLADy4bV75VdV1TJkiP6hvDJt?=
 =?us-ascii?Q?u2che8tVRGlNYh3InBAP7sIuim7e6/RiEt8ZNCFaVjhZKcEZ6Je8OcxYdjGP?=
 =?us-ascii?Q?97v+GUcVW5FD4rW9tpupsxmYz8F2NCHRtrskIhcGt0ICK5w1ojeepv1NEJ+V?=
 =?us-ascii?Q?W4A8JGixny3KeWYydomqrZrx8JQVibpO6fUI5hOJQXgNpTjzDjkGJdv3dBIj?=
 =?us-ascii?Q?5/F7kLcqIW+ySuhNNb6N8yxB7dJNI5sWD/urvoyccdg2HE2ncTh1pzSzfGXU?=
 =?us-ascii?Q?h5RPg6aFCahtUWbJBJyST6hP1UNljEkIxNaRcsy0m8V5C2QWRTT0nf93gGl4?=
 =?us-ascii?Q?Ev4RFIYzvzFq25Y4p3Vl0j4TwPZova5S7TWOIlchNJPtmlSN1mtonJezECYX?=
 =?us-ascii?Q?T7tswXS7GVjI9ser6DeqzEAz6IXgwt+3TStEQRRo5R44Udu6PzpwsCJ+VJGP?=
 =?us-ascii?Q?F/lr8gQIEytDTqAALCgDyOgd72w9PUvIdGPAqGQuNvsj8Iopkv+zrS8NAXRn?=
 =?us-ascii?Q?7E/qVKC2ox4SczbOZPjDX0hooOzVYOkm4N9mtGLxY8F2FZ0zN7rgbWmjp6Lr?=
 =?us-ascii?Q?I3q74vr89qCGTdNmN2+0Hu7NFqJlHf0pvmqyfhX1FUs72FQYCVqI+dZQo/Tq?=
 =?us-ascii?Q?X/82ytQKGm5MWE1oymu0iFYW1BA2XQgH50+zkgKicnszwh9LfWCWs0mJ7hY0?=
 =?us-ascii?Q?P218MRuAU7DHfnfsfoKTdS/92+Gm8Uej341u8LmobU3lDiZ5Mvh3nozf+h9e?=
 =?us-ascii?Q?WspQtfZnrvoOjIqWu09gHdL3mtLHEshM/swdE6VpuN1HVThTiY3YGiOrl3VM?=
 =?us-ascii?Q?lpi7dLXYwiJ4Lm3C9H4iJ/0uL7D6sRX+gk5Tx5ztNyn6KpmTo9wl8uFYrH9Y?=
 =?us-ascii?Q?kvmezNVnSYIPf14H8XnrTYG4XQhwdHsNe9B68pciQ8v+FuElPG78XNBClg92?=
 =?us-ascii?Q?mAo9q3UJ5nA8rKJDhmKp64X6d1L1sl9FXT/yp1qzRGdNcksUXYUI1jDLcQCs?=
 =?us-ascii?Q?/jroQ7HWu4UNzQpzrDbx4bQL0V/YM/+pS2+jAIUSmvCMrJ1xXAkqoRLzkVZK?=
 =?us-ascii?Q?Vubbu6oQpJCC3c/uqWwHxWneH+V3JlVb9DgIqEtwH0xpddBK2QKTZRfUfBJP?=
 =?us-ascii?Q?ean51iPe7DFj8L6yJCrP2RFsnPV8rf58nVtNrm4uy1fiKtxskW8F10Vj7YsW?=
 =?us-ascii?Q?0yzVUksu65cUoGIfxcm37NYy9omSNj8YLcezKdfdTmm3JPrKQpP4NFSZe5td?=
 =?us-ascii?Q?u7xNgwxwrzaaoDkFL7lDolkkhr21AyWHfeC0QV3IFymQDv9rOp1rP3rnPIRn?=
 =?us-ascii?Q?VMvBoMD5/dgR4kRcfLSs1w4fICpmBXYK1fpBjm1jB6a0sM+XZQ2tuCUGM3op?=
 =?us-ascii?Q?5TWqsByCSx75gV6zS0NDRqtP1ktYxGW53024wOsym91ZVf/ZtuVgHGpgLhTB?=
 =?us-ascii?Q?h2xX6FfBXx6ZN3Q8PdIJ+a6QT4c1M9dPdZ6m+ayz6xsKJfM3rEY3No7iSiMs?=
 =?us-ascii?Q?xc0YF+D7EOIF7JhvJviO+OTPOkyX8861G1twaoJ+zAuMgFPAQZevVQpF+tjG?=
 =?us-ascii?Q?C4NCSenLt8as3NS0sKc6L79I2/SMBb02S/YI6ZQHJu4K5TuXqiuNnZJlQV05?=
 =?us-ascii?Q?2htlMTMhpZmsawg4vyL94fV/meSiA0Re52k2Ak8PpzYC66sUxtXhZBZ4PGFe?=
 =?us-ascii?Q?Ie0K6/fCRg=3D=3D?=
X-Exchange-RoutingPolicyChecked: Lr0m42zBWEceAJg6Iw/3L3KuCEoxMKlpbtCpS63xWF+mg1WhXgs4Nlg9EwASWMAzgps7ls+u0xooefp3P4FqRRtugESYG5OxVF8bIIH9dPTYGScIdl7j+aWk8UmsZtwb01iai2mePHT4UaE1wajdJS3UJLS9GE1PzmS0Lw+GqTSxF9XfXv5kEsVWLn3J2dvFeD1g+94mZ50KH438LqQMtwu0Pb8aCgVcEi1loOVXr7P9tw7EEItk5mI7VgD81I79KmRJNQBlZUoos2YBiMD5HLq+EJ/zSxja/uuCXrrQ4yPW6HnlENLIKHRTOD8ta484P47n1EBonojEfm5++UweeQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 28eb3c54-c70b-4740-49fc-08df0768d3e0
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 14:04:52.6047 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mB7+9D4krV2RpJDh1ArFtmEWHGWjrKVmox1S2NTiHODF9PUV/B1YY9W+egkhAiQYSHJlAcp3oyBPTFOW8IeXIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB9893
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

On Mon, Aug 31, 2026 at 12:19:42PM +0530, Tejas Upadhyay wrote:
> This functionality represents a significant step in making
> the xe driver gracefully handle hardware memory degradation.
> By integrating with the DRM Buddy allocator, the driver
> can permanently "carve out" faulty memory so it isn't reused
> by subsequent allocations.
> 
> IGT tests for testing this via injecting simple single address and
> duplicate address fault to unit test functionality:
> https://patchwork.freedesktop.org/patch/748439/?series=170555&rev=2
> 
> v19:
> - Sashiko review comment closure

I was going to push this series, but I see that there are still
many Sashiko comments that seems valid in this version.

Could you please comment one by one at least documenting why we
are ignoring those? (I mean, only for the ones that are not pre-existing)

Thanks,
Rodrigo.

> - Sliting of making xe_bo_ttm_purge() export and NULL handling
> - Remove redundant code in xe_ttm_vram_reserve_page_at_addr()
> - Resolve nit comments provided in configfs and debugfs
> v18:
> - Splitting out the sysfs patch; it will come later once it is redesigned
> - Address sashiko reivew comments
> - Add debugfs and adjust igt tests and fault injection
> v17:
> - Rebase on drm-tip
> - Enforce CONFIG_FAULT_INJECTION_DEBUG_FS for fault inject
> v16:
> - Correct sysfs patches with moving code with rcu lock
> - In case purge fail let next alloc decide final failure
> - Remove addr_to_block API, its being pulled from drm-tip
> - Remove some unused code and replace where existing API can be used
> v15:
> - Split few big patches into small
> - Avoid vram_mgr lock in sysfs
> - fix missing queue_pages counter increment
> v14:
> - Solve sashiko reviews
> - Remove SOFT->HARD offline patch, decision is taken based on -EEXIST
> - Dump gpu buddy allocated patch dropped
> v13:
> - Add fault inject and remove standlone debugfs
> v12:
> - Fix Sashiko review comments
> v11:
> - Add BAN reason for UMD to know about offlining
> - Add support for soft offline mode
> - Rebase and remove dummy lockdep annotation patch, as it merged from upstream
> v10:
> - Remove RFC
> v7:
> - Improve debugfs warning messages
> - Use scope_guard for locking(MattB)
> - Adapt addition of queue member of LRC BO(MattB)
> - Extend and use xe_ttm_bo_purge API for vram pages(MattB)
> - Handle dma_buf_map requests for native and remote(MattB)
> - Address if in never initialized block, set block to NULL
> - Add lockdep in gpu buddy (MattB)
> - Correct allocated_addr_to_block logic (MattA)
> V6:
> - Add more specific tests to noncritical bo sections
> - Handle smooth exit of user created exec queues
> - Break code and make purge specific static API
> V5:
> - Sysfs "max_pages" addition
> - Reset block->private NULL post purge
> - Remove wedge, return -EIO to system controller will initiate reset
> - Add debugfs tests to trigger different test scenarios manually and via igt
> - Rename addr_to_tbo to addr_to_block and move under gpu/buddy.c
> V4: API reworks, add configfs for policy reservation and apply config everywhere
> V3: use res_to_mem_region to avoid use of block->private (MattA)
> V2:
> - some fixes and clean up on errors
> - Added xe_vram_addr_to_region helper to avoid other use of block->private(MattB)
> 
> Tejas Upadhyay (15):
>   drm/xe: Link VRAM object with gpu buddy
>   drm/xe: Link LRC BO and its execution Queue
>   drm/xe: Export xe_ttm_bo_purge()
>   drm/xe: Handle NULL resource and allow purging of VRAM pages
>   drm/xe/bo: Make xe_bo_is_user() public
>   drm/xe: Guard teardown paths against purged BOs
>   drm/xe/vram: Extract buddy alloc and free helpers
>   drm/xe/vram: Add page offline data structures and lifecycle
>   drm/xe/vram: Add VRAM page offline fault handler
>   drm/xe/configfs: Add disable_vram_page_offline attribute
>   drm/xe/ras: Cache disable_vram_page_offline policy at init
>   drm/xe/vram: Check disable_vram_page_offline policy in fault handler
>   drm/xe: Expose bad VRAM pages via debugfs
>   drm/xe/uapi: Expose ban reason in EXEC_QUEUE_GET_PROPERTY_BAN
>   drm/xe: Add fault-inject based VRAM page offline injection
> 
>  drivers/gpu/drm/xe/xe_bo.c                 |  25 +-
>  drivers/gpu/drm/xe/xe_bo.h                 |   2 +
>  drivers/gpu/drm/xe/xe_bo_types.h           |   3 +
>  drivers/gpu/drm/xe/xe_configfs.c           |  72 ++-
>  drivers/gpu/drm/xe/xe_configfs.h           |   2 +
>  drivers/gpu/drm/xe/xe_debugfs.c            |  51 +++
>  drivers/gpu/drm/xe/xe_debugfs.h            |   2 +
>  drivers/gpu/drm/xe/xe_dma_buf.c            |   3 +
>  drivers/gpu/drm/xe/xe_drm_ras_types.h      |   3 +
>  drivers/gpu/drm/xe/xe_exec_queue.c         |  14 +-
>  drivers/gpu/drm/xe/xe_exec_queue_types.h   |   7 +-
>  drivers/gpu/drm/xe/xe_execlist.c           |   4 +-
>  drivers/gpu/drm/xe/xe_guc_submit.c         |  36 +-
>  drivers/gpu/drm/xe/xe_lrc.c                |   1 +
>  drivers/gpu/drm/xe/xe_ras.c                |   9 +
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 510 ++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.h       |   4 +
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |  40 ++
>  include/uapi/drm/xe_drm.h                  |  18 +-
>  19 files changed, 760 insertions(+), 46 deletions(-)
> 
> -- 
> 2.52.0
> 
