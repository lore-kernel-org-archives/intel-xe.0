Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D828C531D0
	for <intel-xe@archiver.kernel.org>; Mon, 27 Jul 2026 16:49:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0574710E48C;
	Mon, 27 Jul 2026 16:49:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Snmk7vn8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E71610E48C
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Jul 2026 16:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785170981; x=1816706981;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=L1d3sji1gL/z6mLxHBH5LP3uE+SYslHzsICYVYAJpOY=;
 b=Snmk7vn83lWpHkDiNUopS2HBtMS3ce1gI5uqF2wWKHG14xE4TsTYzhi8
 vx7AR+GTbEJtRd+7N2diw1rh6abgcqk7VNQaF5/06MMmahWr4xMzozDTz
 IT01mWIY2fKLUpY9UM4+Pzpeg4qFFgTYkPSGGSRCKVtDapn0mVj+0zEd1
 2C6q4+0Xfc8ihCkISew+3Z7d4vtIGJ9eH9h8cdaCr78AXpn1vbL6jTFu1
 grCn8iYwv+M9YF3UXWWZEoQfk6C5cv4nZDpHJkaJh58FhOsmea6EFIOsI
 Yu/AgVnsSqx7hTox+PXro7jqRlvq6gehOn4O/RyCngW5K0F9I080OEN06 Q==;
X-CSE-ConnectionGUID: kqk66F/5RguanCLVH0kOWg==
X-CSE-MsgGUID: auDAkgNnQXaNxQWWymgB5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="111288552"
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; d="scan'208";a="111288552"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 09:49:39 -0700
X-CSE-ConnectionGUID: OaWH5CBVTz29Df/hk3T6jQ==
X-CSE-MsgGUID: +wmNqsxCQcW9gM7po5/VPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; d="scan'208";a="259522445"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 09:49:38 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 27 Jul 2026 09:49:38 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 27 Jul 2026 09:49:38 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.46) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 27 Jul 2026 09:49:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T6gHgHZr5Z9+cSL1ylwYrgN0mRAxtMowLmOtNJgHNMURAZrvFuCwvzNXkkn175M4H/MA5g6ZzAExztqhFZqQiMqckLe4jzv+BYxWSLus1/x3ydFZnmVKvbVv4Ml1+mAViNEfgCSS2vCByS4tDC/pnLQgUAENMtY07w2dHUJuF1pKU+pDWWdN0bSxV89ttRN5f8twUTWzQPX3Kd85Opx6WzvEM7G/5/FFh044v15d5xJ82Wwbh3UctK4plhpYHUIgbxmjjh2axFqeDtCG7uU2ATOuNCPzLc/o2TaFljI9+W4/dhWVSzmX22+EYOn2r6ntDABOvgsFQ/3tsIcOw4tn/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UHLA9YyNStIbjuV1sShALcpkDDNoYB+zPQVFUvKp3d8=;
 b=M5uyAtgr1AwwCOFuWIYOnHpIoIphUdyDD+Fr8qhwRO0AlkVZVDSMp6nnNx2w55TXJG6SEZL+CdPSGQT3zq+if1aN7Ki8Y28KZm2f9HmbFqqU3Bav3TIt6iX3mlgUG/j1CQQMiz30PribSdy0tuZbu/0Ooz0jFhUmRsm9S3wqSolYawcOoYl5VORLTQcgFW364m5q+y5GGrT/MT8IGZ+vFpG7b2Utar/D/V1rX/NdQUJ3F9n3MJEwW63O8XMrO4mRsdpbFDs/5uv1kbgAMQPBNjNj9WzdAOEoGmoNWj6w0vfQao4KzZSUtpdANyllsWs9j7ANkF0ORsUl2r9k6iTrQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB9534.namprd11.prod.outlook.com (2603:10b6:510:39f::22)
 by IA0PR11MB7933.namprd11.prod.outlook.com (2603:10b6:208:407::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 16:49:33 +0000
Received: from PH8PR11MB9534.namprd11.prod.outlook.com
 ([fe80::16ca:6958:c9e9:a266]) by PH8PR11MB9534.namprd11.prod.outlook.com
 ([fe80::16ca:6958:c9e9:a266%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 16:49:33 +0000
Date: Mon, 27 Jul 2026 18:49:29 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>, Copilot
 <223556219+Copilot@users.noreply.github.com>
Subject: Re: [PATCH v8 03/12] drm/xe: Thread prefetch of SVM ranges
Message-ID: <ameMGby_tJBIi0Lv@fdugast-desk>
References: <20260724232601.1753977-1-matthew.brost@intel.com>
 <20260724232601.1753977-4-matthew.brost@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260724232601.1753977-4-matthew.brost@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DU2PR04CA0292.eurprd04.prod.outlook.com
 (2603:10a6:10:28c::27) To PH8PR11MB9534.namprd11.prod.outlook.com
 (2603:10b6:510:39f::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB9534:EE_|IA0PR11MB7933:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a457944-ab08-4175-c287-08deebff093e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|6133799003|4143699003|10067099003|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: m1wgVvYzNVgZXGm0KGPooz2bEwnIfZewcHrwJBGJroJFeoTxRpPL3gnq3GJwSRB+mcXB7OZHjI59HYiu7krxWc7uQqZO9ATWrpeqtWDhsFRzOTwtA4TnaomkbwLGKTPIeMIvuFPcGLJ+4EQN91sNZAwngcEaQxEUIZ6qjJ7d9xIQPUPh3/jVAu0IPBCMngSzGPmvkzHeDj0YgHWE95tEyXEjj53zO1jhz1+o8rOR7JQELadO7ocfwlrvQ1J8FVeimK642I1ISvsDu2gnkMmRExS+izkeyYil0Ii75smcp5dcqmT/9rFIi66+8UJ8uw3i15uDUcACay1qT+TfASSeHpFOAdb8bwcIO9E9DngPRxGNNrZnUhQ6BPjaRHMDcc+cjz1YOOhJCfmdytD1WgjwKGhLyY0+4IjVAGMgz0HAQaVx8EjosikNqQqzKS+tO0iJBAe49igQxyd2CeqTNHC7Kyr3QwH668n8MtswFRKZPnge2owwyPLLc6St+rJ3EwvSMTh/pTo5NeHGsnMmmPNwLWZc8z8yegvVzWBLsa0+MItswrjknOOhFcgTi7hYXf5EY+1mEwwwc56OXlP8U0X4Jens0McDtjvcCJzvxdb4B/rMyBaCmoR2+Qi/yp+y3Het07MBkr01xT8nvcXIYMsKrASxQJnSGHwJ1ETtlIWia+c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB9534.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(4143699003)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ree+4abLeE5NaIhnqZm+99oxHtBWkXJl9+8ptHkDJRVwC3K4REBK/IJ+b8?=
 =?iso-8859-1?Q?IaOidIKoRSEaWLgAzi1qSkTrT2ubLpG1VX1DBBEH0L3VfOoOn6C9eHHG6Y?=
 =?iso-8859-1?Q?WRbqvtc2N7cOGFoUFGh7euvPgkT8zTkWpCc8+5LrT0EAl6nxoUpXinJhp5?=
 =?iso-8859-1?Q?ldJno89JnfTbldhhqZrtjopYO8GqK4e22s/KNchSVLHeszKwt/v9DfWYVU?=
 =?iso-8859-1?Q?BrrpY9IEwTUJf4LFUFC2Jh3pzQ3aKuENsM6PRQveG/46B0i42mDw6bA6Xh?=
 =?iso-8859-1?Q?qQc/JrycJ7H3qmnCwhtEW9D12FWCczh0UuesIyvN1xbOixDCe9kJ/y/dKW?=
 =?iso-8859-1?Q?LvsohUnUvunm0V1Q36JqOSttjhDprQXMYABKrZCJP6oCB9mh7hddmAUMRF?=
 =?iso-8859-1?Q?fxqC9K6+V8mYV8x37iyYXx5tYkpGmJX6mbmakpWDAzSpBrlaSFcJYNJz6T?=
 =?iso-8859-1?Q?6HY+2kTdr6GBlRLeEsX1icXI6idilZty4RqspCohOsrd0KA0wrL8/j5vcH?=
 =?iso-8859-1?Q?Fgbg1w7CqkSsGiZpNUsMQek5rVVbZ7Mg4/GLyqPdpP2g4WKza56HRb51SP?=
 =?iso-8859-1?Q?B0gPf6l1rDkuRBLWmld7p0x+vax/XFTQM2NrLbnGV4MDPRO18YEZWz1yo9?=
 =?iso-8859-1?Q?ViHtkgk3zoNBwjAVX2FT0FSpfQlQ0RorXa1Z+5oHFxWPYoVjjWN/QdRwJ7?=
 =?iso-8859-1?Q?vZ3cc292M9wVDwmpPAZC6gocPwGHHWezOtJ5HYql/R9nsIKIQRgOSV8oVr?=
 =?iso-8859-1?Q?bLxgAoaaekgkzT47JG+leBvPhNCJlkHjBqXWV9o7zmqqfAwvv007K7EkB8?=
 =?iso-8859-1?Q?1AO8/E/caId7+TkBYsZHaHvRTHZwCmIPUDaQ3sljwpDgMnkyw0O6MqSJCB?=
 =?iso-8859-1?Q?3XTPqM3Ny5+Vf3LhH9FVA9KjWGdJY+rPzDXCvl0k04ABj0tIhmW2gpWma2?=
 =?iso-8859-1?Q?dU6ISxbWJzlVsCsS2/QjDsQdWJzdAKnOkzb1DrFPrUPw8u9ze5vbmW/opq?=
 =?iso-8859-1?Q?9VDMmR4WYpNZQZwlyEh18UWWgCtueirhopEUay729+D8VuYjclGcJZyTPj?=
 =?iso-8859-1?Q?RTDeD9XKP5h3mCxxcRqosJmcNAA4HZCq1XDJiIeVr04k9BF8BnVkf09WNN?=
 =?iso-8859-1?Q?NCnnbrPi/ymH+9xL2PfMhLWnYErnXqFmelY0e+PhinyENgMWwY30L1GS0Q?=
 =?iso-8859-1?Q?iDoRH+vbksd3AE6whZnTfCP8vxaLDqGb/W5t/uMQrXMrPMcYqdZoWUaZun?=
 =?iso-8859-1?Q?44Cg1xTJC4V45DwNb5W8e95hiRoe5cioEx5hT89NDqeOe1rBLweNGlk8Ni?=
 =?iso-8859-1?Q?2HG5D1Fqf4NIQMebfLpsdZoZLPrpD4fSbXTQa06TQt4VNod4YQAKd/Vd8H?=
 =?iso-8859-1?Q?2fgULs6XbzMtlWcf7tJZ4y9LQjv9ehErNSYsFkyT/0Fe7qdeMaPfkKCmOA?=
 =?iso-8859-1?Q?ZfrfpBDMhU50wKs/E42HfpGHlFFhO09jh0FGft0SEyJYg8jR58pLr+kwqu?=
 =?iso-8859-1?Q?KcibF2hkkNfV12KyFQOTFBda9TbvQSyzdWfgkmEN/0b6Dnx6/yiW33TcD1?=
 =?iso-8859-1?Q?Y2kWOPky64sFep56AFM6J3/ZoHXzHC134CzZg2m8lLORtJjMLiZfNEGUwX?=
 =?iso-8859-1?Q?IsxqSCD7vA8WAFLQHCB2IjvMNddLW2rvNE743e0fY1dG4qjxjhXzF7iwUX?=
 =?iso-8859-1?Q?Z0VyF9bCUkkBVR6lyYn7EPVwVKn07BIldgVcrc+LUtXaGF8FMfPMOL/1cS?=
 =?iso-8859-1?Q?h4TVP1L0t0qJTGQPbQmppuuw162DriOhBJr2p9BJQUMhRH4/WB5mgzr017?=
 =?iso-8859-1?Q?NGnKABUQZT2eUPWT4BpTDeMLr/sU7s4=3D?=
X-Exchange-RoutingPolicyChecked: H8xmYteaNCKvRzPygKuuILuW0smyG4ih39cqF6+/islUX+3jkxRB8cJl3kRgWKAO0dw6KT2aqjqdopA00PIVM3CxVSHxhiSXI/w6LXQ47X6MJnS83iQKTKM4/8bzhEQrNzrBw8if9ScARCTDLm81VXE9LcUOdl+f/TFXHx7gP5SgjFaO2zvuqJ5uZs/KjIYJjzT+9WibvCmIFcucNk6aWFWfH495Ih0cB7mVifchdV7OSUP7B5UJmhkROEd3aIElBktElgSsFl3SKl0bpw2CRRWd9nxXD+Pq96blIZD0jnkc3PQtmZByNhkZK66gOLi+8tT1C1cpbcePskNtJdAM9A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a457944-ab08-4175-c287-08deebff093e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB9534.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 16:49:33.8233 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JdO5XvVzNAznZJELxKOz6n0e5NWbJeOhlbZefCoyguUQtc9Mp+CfWdKO20aA9QsyLyHfpYCeRM0LEFP5xVZKWhXNmBUFEA3JsYfSOmLJyjU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7933
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

On Fri, Jul 24, 2026 at 04:25:52PM -0700, Matthew Brost wrote:
> The migrate_vma_* functions are very CPU-intensive; as a result,
> prefetching SVM ranges is limited by CPU performance rather than paging
> copy engine bandwidth. To accelerate SVM range prefetching, the step
> that calls migrate_vma_* is now threaded. A dedicated prefetch
> workqueue is used for threading so prefetch work is never mixed with
> page fault or garbage collector work.
> 
> Running xe_exec_system_allocator --r prefetch-benchmark, which tests
> 64MB prefetches, shows an increase from ~4.35 GB/s to 12.25 GB/s with
> this patch on drm-tip. Enabling high SLPC further increases throughput
> to ~15.25 GB/s, and combining SLPC with ULLS raises it to ~16 GB/s. Both
> of these optimizations are upcoming.
> 
> Since the dedicated prefetch workqueue is not shared with page fault
> or SVM garbage collector work, page fault servicing and garbage
> collection can keep using a plain down_read() on vm->lock: there is no
> risk of a blocked reader starving a worker that a pending writer is
> waiting to flush, because that flushing is now confined to the
> separate prefetch workqueue.
> 
> v2:
>  - Use dedicated prefetch workqueue
>  - Pick dedicated prefetch thread count based on profiling
>  - Skip threaded prefetch for only 1 range or if prefetching to SRAM
>  - Fully tested
> v3:
>  - Use page fault work queue
> v4:
>  - Go back to a dedicated prefetch workqueue (usm.prefetch_wq) rather
>    than reusing the page fault workqueue (usm.pagefault_wq), so
>    threaded prefetches and page fault / garbage collector work no
>    longer contend for the same workqueue. This removes the need for
>    down_read_trylock() based lock avoidance in the page fault and
>    garbage collector paths.
> 
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Co-authored-by: Copilot <223556219+Copilot@users.noreply.github.com>

I believe we should go with "Assisted-by" instead of "Co-authored-by".

This also applies to patch #8 in the series.

Francois

> ---
>  drivers/gpu/drm/xe/xe_device_types.h |   6 +-
>  drivers/gpu/drm/xe/xe_pagefault.c    |  29 ++++--
>  drivers/gpu/drm/xe/xe_svm.c          |   8 +-
>  drivers/gpu/drm/xe/xe_svm.h          |   6 +-
>  drivers/gpu/drm/xe/xe_vm.c           | 147 ++++++++++++++++++++-------
>  drivers/gpu/drm/xe/xe_vm_types.h     |  15 +--
>  6 files changed, 154 insertions(+), 57 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index b8d1726c0513..159ee16ee6d5 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -307,8 +307,10 @@ struct xe_device {
>  		u32 current_pf_queue;
>  		/** @usm.lock: protects UM state */
>  		struct rw_semaphore lock;
> -		/** @usm.pf_wq: page fault work queue, unbound, high priority */
> -		struct workqueue_struct *pf_wq;
> +		/** @usm.pagefault_wq: page fault work queue, unbound, high priority */
> +		struct workqueue_struct *pagefault_wq;
> +		/** @usm.prefetch_wq: threaded prefetch work queue, unbound */
> +		struct workqueue_struct *prefetch_wq;
>  		/*
>  		 * We pick 4 here because, in the current implementation, it
>  		 * yields the best bandwidth utilization of the kernel paging
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> index 80196e874e06..fd7ef0718153 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -303,8 +303,8 @@ static void xe_pagefault_queue_work(struct work_struct *w)
>  
>  		err = xe_pagefault_service(&pf);
>  		if (err) {
> -			xe_pagefault_save_to_vm(gt_to_xe(pf.gt), &pf);
>  			if (!(pf.consumer.access_type & XE_PAGEFAULT_ACCESS_PREFETCH)) {
> +				xe_pagefault_save_to_vm(gt_to_xe(pf.gt), &pf);
>  				xe_pagefault_print(&pf);
>  				xe_gt_info(pf.gt, "Fault response: Unsuccessful %pe\n",
>  					   ERR_PTR(err));
> @@ -318,7 +318,7 @@ static void xe_pagefault_queue_work(struct work_struct *w)
>  		pf.producer.ops->ack_fault(&pf, err);
>  
>  		if (time_after(jiffies, threshold)) {
> -			queue_work(gt_to_xe(pf.gt)->usm.pf_wq, w);
> +			queue_work(gt_to_xe(pf.gt)->usm.pagefault_wq, w);
>  			break;
>  		}
>  	}
> @@ -376,7 +376,8 @@ static void xe_pagefault_fini(void *arg)
>  {
>  	struct xe_device *xe = arg;
>  
> -	destroy_workqueue(xe->usm.pf_wq);
> +	destroy_workqueue(xe->usm.prefetch_wq);
> +	destroy_workqueue(xe->usm.pagefault_wq);
>  }
>  
>  /**
> @@ -394,12 +395,20 @@ int xe_pagefault_init(struct xe_device *xe)
>  	if (!xe->info.has_usm)
>  		return 0;
>  
> -	xe->usm.pf_wq = alloc_workqueue("xe_page_fault_work_queue",
> -					WQ_UNBOUND | WQ_HIGHPRI,
> -					XE_PAGEFAULT_QUEUE_COUNT);
> -	if (!xe->usm.pf_wq)
> +	xe->usm.pagefault_wq = alloc_workqueue("xe_page_fault_work_queue",
> +					       WQ_UNBOUND | WQ_HIGHPRI,
> +					       XE_PAGEFAULT_QUEUE_COUNT);
> +	if (!xe->usm.pagefault_wq)
>  		return -ENOMEM;
>  
> +	xe->usm.prefetch_wq = alloc_workqueue("xe_prefetch_work_queue",
> +					      WQ_UNBOUND,
> +					      XE_PAGEFAULT_QUEUE_COUNT);
> +	if (!xe->usm.prefetch_wq) {
> +		err = -ENOMEM;
> +		goto err_pagefault_wq;
> +	}
> +
>  	for (i = 0; i < XE_PAGEFAULT_QUEUE_COUNT; ++i) {
>  		err = xe_pagefault_queue_init(xe, xe->usm.pf_queue + i);
>  		if (err)
> @@ -409,7 +418,9 @@ int xe_pagefault_init(struct xe_device *xe)
>  	return devm_add_action_or_reset(xe->drm.dev, xe_pagefault_fini, xe);
>  
>  err_out:
> -	destroy_workqueue(xe->usm.pf_wq);
> +	destroy_workqueue(xe->usm.prefetch_wq);
> +err_pagefault_wq:
> +	destroy_workqueue(xe->usm.pagefault_wq);
>  	return err;
>  }
>  
> @@ -495,7 +506,7 @@ int xe_pagefault_handler(struct xe_device *xe, struct xe_pagefault *pf)
>  		memcpy(pf_queue->data + pf_queue->head, pf, sizeof(*pf));
>  		pf_queue->head = (pf_queue->head + xe_pagefault_entry_size()) %
>  			pf_queue->size;
> -		queue_work(xe->usm.pf_wq, &pf_queue->worker);
> +		queue_work(xe->usm.pagefault_wq, &pf_queue->worker);
>  	} else {
>  		drm_warn(&xe->drm,
>  			 "PageFault Queue (%d) full, shouldn't be possible\n",
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index cc36addb4f4f..6a470a02fee7 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -148,7 +148,7 @@ xe_svm_garbage_collector_add_range(struct xe_vm *vm, struct xe_svm_range *range,
>  			      &vm->svm.garbage_collector.range_list);
>  	spin_unlock(&vm->svm.garbage_collector.list_lock);
>  
> -	queue_work(xe->usm.pf_wq, &vm->svm.garbage_collector.work);
> +	queue_work(xe->usm.pagefault_wq, &vm->svm.garbage_collector.work);
>  }
>  
>  static void xe_svm_tlb_inval_count_stats_incr(struct xe_gt *gt)
> @@ -1051,6 +1051,7 @@ void xe_svm_range_migrate_to_smem(struct xe_vm *vm, struct xe_svm_range *range)
>   * @tile_mask: Mask representing the tiles to be checked
>   * @dpagemap: if !%NULL, the range is expected to be present
>   * in device memory identified by this parameter.
> + * @valid_pages: Pages are valid, result written back to caller
>   *
>   * The xe_svm_range_validate() function checks if a range is
>   * valid and located in the desired memory region.
> @@ -1059,7 +1060,8 @@ void xe_svm_range_migrate_to_smem(struct xe_vm *vm, struct xe_svm_range *range)
>   */
>  bool xe_svm_range_validate(struct xe_vm *vm,
>  			   struct xe_svm_range *range,
> -			   u8 tile_mask, const struct drm_pagemap *dpagemap)
> +			   u8 tile_mask, const struct drm_pagemap *dpagemap,
> +			   bool *valid_pages)
>  {
>  	bool ret;
>  
> @@ -1071,6 +1073,8 @@ bool xe_svm_range_validate(struct xe_vm *vm,
>  	else
>  		ret = ret && !range->pages.dpagemap;
>  
> +	*valid_pages = xe_svm_range_pages_valid(range);
> +
>  	xe_svm_notifier_unlock(vm);
>  
>  	return ret;
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index 0d1f1107af5f..46be2e5c6f7f 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -134,7 +134,8 @@ void xe_svm_range_migrate_to_smem(struct xe_vm *vm, struct xe_svm_range *range);
>  
>  bool xe_svm_range_validate(struct xe_vm *vm,
>  			   struct xe_svm_range *range,
> -			   u8 tile_mask, const struct drm_pagemap *dpagemap);
> +			   u8 tile_mask, const struct drm_pagemap *dpagemap,
> +			   bool *valid_pages);
>  
>  u64 xe_svm_find_vma_start(struct xe_vm *vm, u64 addr, u64 end,  struct xe_vma *vma);
>  
> @@ -376,7 +377,8 @@ void xe_svm_range_migrate_to_smem(struct xe_vm *vm, struct xe_svm_range *range)
>  static inline
>  bool xe_svm_range_validate(struct xe_vm *vm,
>  			   struct xe_svm_range *range,
> -			   u8 tile_mask, bool devmem_preferred)
> +			   u8 tile_mask, const struct drm_pagemap *dpagemap,
> +			   bool *valid_pages)
>  {
>  	return false;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index d7e6644df4bc..7eed38b78e5f 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2525,6 +2525,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>  			struct drm_pagemap *dpagemap = NULL;
>  			u8 id, tile_mask = 0;
>  			u32 i;
> +			bool valid_pages;
>  
>  			if (xe_vma_is_userptr(vma))
>  				vops->flags |= XE_VMA_OPS_FLAG_MODIFIES_GPUVA;
> @@ -2569,9 +2570,11 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>  				goto unwind_prefetch_ops;
>  			}
>  
> -			if (xe_svm_range_validate(vm, svm_range, tile_mask, dpagemap)) {
> +			if (xe_svm_range_validate(vm, svm_range, tile_mask,
> +						  dpagemap, &valid_pages)) {
>  				xe_svm_range_debug(svm_range, "PREFETCH - RANGE IS VALID");
>  				xe_svm_range_put(svm_range);
> +				xe_assert(vm->xe, valid_pages);
>  				goto check_next_range;
>  			}
>  
> @@ -2586,6 +2589,8 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>  
>  			op->prefetch_range.ranges_count++;
>  			vops->flags |= XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH;
> +			if (valid_pages)
> +				vops->flags |= XE_VMA_OPS_FLAG_HAS_SVM_VALID_RANGE;
>  			xe_svm_range_debug(svm_range, "PREFETCH - RANGE CREATED");
>  check_next_range:
>  			if (range_end > xe_svm_range_end(svm_range) &&
> @@ -3151,16 +3156,80 @@ static int check_ufence(struct xe_vma *vma)
>  	return 0;
>  }
>  
> -static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
> +struct prefetch_thread {
> +	struct work_struct work;
> +	struct drm_gpusvm_ctx *ctx;
> +	struct xe_vma *vma;
> +	struct xe_svm_range *svm_range;
> +	struct drm_pagemap *dpagemap;
> +	int err;
> +};
> +
> +static void prefetch_thread_func(struct prefetch_thread *thread)
> +{
> +	struct xe_vma *vma = thread->vma;
> +	struct xe_vm *vm = xe_vma_vm(vma);
> +	struct xe_svm_range *svm_range = thread->svm_range;
> +	struct drm_pagemap *dpagemap = thread->dpagemap;
> +	int err = 0;
> +
> +	guard(mutex)(&svm_range->lock);
> +
> +	if (xe_svm_range_is_removed(svm_range))
> +		return;
> +
> +	if (!dpagemap)
> +		xe_svm_range_migrate_to_smem(vm, svm_range);
> +
> +	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM)) {
> +		drm_dbg(&vm->xe->drm,
> +			"Prefetch pagemap is %s start 0x%016lx end 0x%016lx\n",
> +			dpagemap ? dpagemap->drm->unique : "system",
> +			xe_svm_range_start(svm_range), xe_svm_range_end(svm_range));
> +	}
> +
> +	if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, dpagemap)) {
> +		err = xe_svm_alloc_vram(svm_range, thread->ctx, dpagemap);
> +		if (err) {
> +			drm_dbg(&vm->xe->drm, "VRAM allocation failed, retry from userspace, asid=%u, gpusvm=%p, errno=%pe\n",
> +				vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> +			return;
> +		}
> +		xe_svm_range_debug(svm_range, "PREFETCH - RANGE MIGRATED TO VRAM");
> +	}
> +
> +	err = xe_svm_range_get_pages(vm, svm_range, thread->ctx);
> +	if (err) {
> +		drm_dbg(&vm->xe->drm, "Get pages failed, asid=%u, gpusvm=%p, errno=%pe\n",
> +			vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> +		if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM)
> +			err = 0;
> +		thread->err = err;
> +		return;
> +	}
> +	xe_svm_range_debug(svm_range, "PREFETCH - RANGE GET PAGES DONE");
> +}
> +
> +static void prefetch_work_func(struct work_struct *w)
> +{
> +	struct prefetch_thread *thread =
> +		container_of(w, struct prefetch_thread, work);
> +
> +	prefetch_thread_func(thread);
> +}
> +
> +static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_ops *vops,
> +			   struct xe_vma_op *op)
>  {
>  	bool devmem_possible = IS_DGFX(vm->xe) && IS_ENABLED(CONFIG_DRM_XE_PAGEMAP);
>  	struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
>  	struct drm_pagemap *dpagemap = op->prefetch_range.dpagemap;
> -	int err = 0;
> -
>  	struct xe_svm_range *svm_range;
>  	struct drm_gpusvm_ctx ctx = {};
> +	struct prefetch_thread stack_thread, *thread, *prefetches;
>  	unsigned long i;
> +	int err = 0, idx = 0;
> +	bool skip_threads;
>  
>  	if (!xe_vma_is_cpu_addr_mirror(vma))
>  		return 0;
> @@ -3170,42 +3239,49 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
>  	ctx.check_pages_threshold = devmem_possible ? SZ_64K : 0;
>  	ctx.device_private_page_owner = xe_svm_private_page_owner(vm, !dpagemap);
>  
> -	/* TODO: Threading the migration */
> -	xa_for_each(&op->prefetch_range.range, i, svm_range) {
> -		guard(mutex)(&svm_range->lock);
> -
> -		if (xe_svm_range_is_removed(svm_range))
> -			continue;
> +	skip_threads =  op->prefetch_range.ranges_count == 1 ||
> +		(!dpagemap && !(vops->flags &
> +				XE_VMA_OPS_FLAG_HAS_SVM_VALID_RANGE)) ||
> +		!(vops->flags & XE_VMA_OPS_FLAG_DOWNGRADE_LOCK);
> +	thread = skip_threads ? &stack_thread : NULL;
>  
> -		if (!dpagemap)
> -			xe_svm_range_migrate_to_smem(vm, svm_range);
> +	if (!skip_threads) {
> +		prefetches = kvmalloc_array(op->prefetch_range.ranges_count,
> +					    sizeof(*prefetches), GFP_KERNEL);
> +		if (!prefetches)
> +			return -ENOMEM;
> +	}
>  
> -		if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM)) {
> -			drm_dbg(&vm->xe->drm,
> -				"Prefetch pagemap is %s start 0x%016lx end 0x%016lx\n",
> -				dpagemap ? dpagemap->drm->unique : "system",
> -				xe_svm_range_start(svm_range), xe_svm_range_end(svm_range));
> +	xa_for_each(&op->prefetch_range.range, i, svm_range) {
> +		if (!skip_threads) {
> +			thread = prefetches + idx++;
> +			INIT_WORK(&thread->work, prefetch_work_func);
>  		}
>  
> -		if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, dpagemap)) {
> -			err = xe_svm_alloc_vram(svm_range, &ctx, dpagemap);
> -			if (err) {
> -				drm_dbg(&vm->xe->drm, "VRAM allocation failed, retry from userspace, asid=%u, gpusvm=%p, errno=%pe\n",
> -					vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> -				return -ENODATA;
> -			}
> -			xe_svm_range_debug(svm_range, "PREFETCH - RANGE MIGRATED TO VRAM");
> +		thread->ctx = &ctx;
> +		thread->vma = vma;
> +		thread->svm_range = svm_range;
> +		thread->dpagemap = dpagemap;
> +		thread->err = 0;
> +
> +		if (skip_threads) {
> +			prefetch_thread_func(thread);
> +			if (thread->err)
> +				return thread->err;
> +		} else {
> +			queue_work(vm->xe->usm.prefetch_wq, &thread->work);
>  		}
> +	}
>  
> -		err = xe_svm_range_get_pages(vm, svm_range, &ctx);
> -		if (err) {
> -			drm_dbg(&vm->xe->drm, "Get pages failed, asid=%u, gpusvm=%p, errno=%pe\n",
> -				vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> -			if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM)
> -				err = -ENODATA;
> -			return err;
> +	if (!skip_threads) {
> +		for (i = 0; i < idx; ++i) {
> +			thread = prefetches + i;
> +
> +			flush_work(&thread->work);
> +			if (thread->err && !err)
> +				err = thread->err;
>  		}
> -		xe_svm_range_debug(svm_range, "PREFETCH - RANGE GET PAGES DONE");
> +		kvfree(prefetches);
>  	}
>  
>  	return err;
> @@ -3336,7 +3412,8 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>  	return err;
>  }
>  
> -static int vm_bind_ioctl_ops_prefetch_ranges(struct xe_vm *vm, struct xe_vma_ops *vops)
> +static int vm_bind_ioctl_ops_prefetch_ranges(struct xe_vm *vm,
> +					     struct xe_vma_ops *vops)
>  {
>  	struct xe_vma_op *op;
>  	int err;
> @@ -3346,7 +3423,7 @@ static int vm_bind_ioctl_ops_prefetch_ranges(struct xe_vm *vm, struct xe_vma_ops
>  
>  	list_for_each_entry(op, &vops->list, link) {
>  		if (op->base.op  == DRM_GPUVA_OP_PREFETCH) {
> -			err = prefetch_ranges(vm, op);
> +			err = prefetch_ranges(vm, vops, op);
>  			if (err)
>  				return err;
>  		}
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 2f5f74fed9d2..68588b624212 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -556,13 +556,14 @@ struct xe_vma_ops {
>  	/** @pt_update_ops: page table update operations */
>  	struct xe_vm_pgtable_update_ops pt_update_ops[XE_MAX_TILES_PER_DEVICE];
>  	/** @flag: signify the properties within xe_vma_ops*/
> -#define XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH BIT(0)
> -#define XE_VMA_OPS_FLAG_MADVISE          BIT(1)
> -#define XE_VMA_OPS_ARRAY_OF_BINDS	 BIT(2)
> -#define XE_VMA_OPS_FLAG_SKIP_TLB_WAIT	 BIT(3)
> -#define XE_VMA_OPS_FLAG_ALLOW_SVM_UNMAP  BIT(4)
> -#define XE_VMA_OPS_FLAG_MODIFIES_GPUVA	 BIT(5)
> -#define XE_VMA_OPS_FLAG_DOWNGRADE_LOCK	 BIT(6)
> +#define XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH	BIT(0)
> +#define XE_VMA_OPS_FLAG_MADVISE			BIT(1)
> +#define XE_VMA_OPS_ARRAY_OF_BINDS		BIT(2)
> +#define XE_VMA_OPS_FLAG_SKIP_TLB_WAIT		BIT(3)
> +#define XE_VMA_OPS_FLAG_ALLOW_SVM_UNMAP		BIT(4)
> +#define XE_VMA_OPS_FLAG_MODIFIES_GPUVA		BIT(5)
> +#define XE_VMA_OPS_FLAG_DOWNGRADE_LOCK		BIT(6)
> +#define XE_VMA_OPS_FLAG_HAS_SVM_VALID_RANGE	BIT(7)
>  	u32 flags;
>  #ifdef TEST_VM_OPS_ERROR
>  	/** @inject_error: inject error to test error handling */
> -- 
> 2.34.1
> 
