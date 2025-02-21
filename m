Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 845E3C021B3
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 00:02:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C4E810E196;
	Fri, 21 Feb 2025 00:02:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gwYEQHIV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BBED10E196
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Feb 2025 00:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740096174; x=1771632174;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xg/9YCsHk1AqnHFOE55b8sU1gt9YFbmVyTGDKuTgThQ=;
 b=gwYEQHIVkMfAGZEych4/pHe74MsN/8afMAxBpRfmXax7sc0lL9qhMAgY
 6jFxF31w/1xs30MFuuPGRMuIYU9l1TEYB1g9kcujemzDSv7jAVfjDDReV
 xN8LHqe/nMoXOKS1ZXyJVVlBmGAGYklAWs3jqCIi6WfFCJV2zoxKmYXLe
 ALllzV+rpqvgpvd4MR1kEfiYvFrKdiZmPiGlYKQZZAkVGhPMEfM34HtfE
 c348pcwCXzHmG+tXjYMtTqESdlIfZfLmopLH8j1KNS2ZmUB3mdwSQ3Txp
 F1HfbqvWljpd44RgLKVSHiY8rbqJIh3H0+dRH7jpZkHKivmtEeCfk2K53 Q==;
X-CSE-ConnectionGUID: 6vLrJLKAR4+jru81IxkiCw==
X-CSE-MsgGUID: A9TThCZ7S+CQIW8D5mRYNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41110672"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="41110672"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 16:02:54 -0800
X-CSE-ConnectionGUID: zj2VblBfQ3Ga2RqzARG2hA==
X-CSE-MsgGUID: 3kvxRrGNTWerVRG+dJloYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="120440504"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 16:02:54 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 20 Feb 2025 16:02:53 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 20 Feb 2025 16:02:53 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Feb 2025 16:02:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JBaUieGCPAzFOh1ojASEOGjUAjoelBIyC8HPvPzzXOUWcO4Ala3IvEm0HWPWGBf5cC6Q3RWBxflSSFfLcj2GwMspBBaghcOJ2BrA6ksLnoztS8x9cIZZhoCpSALqsRdUeCGMX/ADoxTLAkIw3ijhnIF9NsxL5WimA+3mtHeCYNJEDoagZ28Sf1A/s+IEvvarKOL6Hv6+xANxjVPempRiFxoIhJcAzpOyFZHYllGO6zwETQzfxSiNgBsdx17QZ2YO+D01lLDxdZJyRxBkbrq3LoYqo9F5ZUiYPY9EecebdHOvlCQZ1F5Rv+kujz9DuKE+20cUHUATdKOnJpENkdygjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TpCWMosR49qaLf0GOStm3U8S8exdz2aGqA8Oj6JfvTA=;
 b=E48ZQUZAYfITCz0GdIhD7AvremjydvJkzlPkdYLCW3j7+2DloyP7xD/qBj9ZvInCXElMOgX222uM79kAXp9mEusdWYnUNrV+Lkc/MvKYXGVTr5TBA65Sinmd+Nght37IjTn17JPtd5FIT1bhaEOFrpA4SzCDTo2QzwzPJwpgiJUZsCZIr7N2jtidPtilBnWM0RJKbJvbvNuqmosaSXDVcKl9s4ui5ecDM5lDpmqxG94y5G4gTsBRq9kmFKOBYGUAjpCqmoFin68VPymx8LvQSV/RC6I3N47jJ8GjdrB5ROECYMGHvgb5A8zDU8cpUZT7PqUfEcZ2F6DC4C3WDgflMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BN9PR11MB5290.namprd11.prod.outlook.com (2603:10b6:408:137::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Fri, 21 Feb
 2025 00:02:49 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8466.015; Fri, 21 Feb 2025
 00:02:49 +0000
Date: Thu, 20 Feb 2025 16:03:52 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Dan Carpenter
 <dan.carpenter@linaro.org>, John Harrison <John.C.Harrison@intel.com>
Subject: Re: [PATCH v2] drm/xe/pxp: Don't kill queues while holding PXP locks
Message-ID: <Z7fC6MZ/zAS8l8+n@lstrano-desk.jf.intel.com>
References: <20250219235236.2597612-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250219235236.2597612-1-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: MW4PR04CA0310.namprd04.prod.outlook.com
 (2603:10b6:303:82::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BN9PR11MB5290:EE_
X-MS-Office365-Filtering-Correlation-Id: a9366efe-52d8-414d-6a0d-08dd520b144c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kjQm6KGnQ4b61PYPgGgx33Gtji+DnwvLmFD2i9TyqmsUGSn8uAs/49E/TX6+?=
 =?us-ascii?Q?X5LhSDzNFBG8eNyAG2cDuuvdP+Ae9N4UBTMmqdVogROgOeoY5MvCZ6xa5Waw?=
 =?us-ascii?Q?dAstumItYDJ2ZkL5DoZPkGshP4VBd4aqyBdUDztSCiscUxUGjVOtBiMsiL1D?=
 =?us-ascii?Q?xyG5x4tuiwN8sTS62NPW/I/6UvqnxfXE22MlBZgiEC4XgpPfAABU1AaT12n4?=
 =?us-ascii?Q?fzLncDcET8UIu2/nGUvxqoJErlGfxlNJxfwnemSPUbD42tt4gEwID8E5Kab7?=
 =?us-ascii?Q?KsMIOdQlfp20OXopyXhMXTc49u/T0sn6T9aK99JUcMZEc9NocVj0cJpj4GXn?=
 =?us-ascii?Q?HCpI7Z+PwKDbQXQnxUnBZIz9TeCAgGe1D12ZlyZmza4+K5/aC24GWgyv3Qmv?=
 =?us-ascii?Q?Yeb9SxoaUByZKoBbtlcayH5NF3B2JE1slJbWdEAPhM5MCsa+3Aay6ETJc7dS?=
 =?us-ascii?Q?ukWXz5wg0uWmJqJm2CrYhfSf8T1W5PtVQHW4mTYxLGWLR3auo1kxZ1eQPsBD?=
 =?us-ascii?Q?xd3B5pdrGI8C1rc7HXcu9V8XH8OPxFn3QVvcKYOyyGk4lceWLZAVY1khzPCH?=
 =?us-ascii?Q?Y1I66TJ2FGynI1bTTcEMj6DLvf1URSN6De9j+WTcJqhLinrRlGOGEy8ChPCd?=
 =?us-ascii?Q?1zPjjFJ7aGM0QYAY9Mq4kkDVGLM3zx1Kaq5CsmIUmzKzMREr/zWV24g7k8IP?=
 =?us-ascii?Q?Nnz6QU3vHQ+MPSI6+ApeltNxUin+k6b9KdyywE9oLmZUvdZAHgg0H3cmy6X1?=
 =?us-ascii?Q?CmPEE233TkjA+imprBbixlQO7ygoxOH1CeU3ENLWtD7Xe9hs5D+n7kMAn6tC?=
 =?us-ascii?Q?FWJRYzeswzLRPNU/h4nh2jxA696ycQC8+c4dlH1lrdfx9IMpPqqQcN7ct9G4?=
 =?us-ascii?Q?5YsAGhg4f/v+BmPlbH0JKnVGQq+zNfkXEecBu3+jLYDX8eIvzn0Vy6EMmAwD?=
 =?us-ascii?Q?3/Wli/Ghtf0uj91t+kt2VgHuPBD8DVXNz/h1DMeA0M4PdXnQ2IBsPwO1jMub?=
 =?us-ascii?Q?i0cLgGdOf3BbXyBqGvBSQ6oRXPkmn47qjhMudpKU7/Kh8HEr39ebx0/Suiqw?=
 =?us-ascii?Q?3Nzd2c0tAauXxydsb9Ru2F5Kh6pH+0Rli35zCMyAdZjLeUNpsVmtbWMQ4UKN?=
 =?us-ascii?Q?luEIyGuRM2wIVwbhVdzw+wi5uNpAVDo7LqhGixJmOZvY67kiGIjT7KlsACkA?=
 =?us-ascii?Q?FVYh9y/bN/nprukZSVTifS2z7FnnCIfYu0onQ0BCGgJ16ECeqWas/dRvMQRn?=
 =?us-ascii?Q?6/KqCJiVovk66f167xOJjErRpV5D/nUWanIPRU53n7K58s42337RdiaL6ghR?=
 =?us-ascii?Q?3GXtXlxlxw2aeX2Tt3782N07m+BqHjzLzwqZP8ssHEoBZpyuApTEatPIjjCX?=
 =?us-ascii?Q?biEBijAvLJ3khtZUfuF9O4CfuF5X?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yPnBMZy8hH2InbelAsskWh5mpsuKE8eW4Z6v2t3Uou1cTsTXRQEje9BNxn5g?=
 =?us-ascii?Q?iLowkAADGOTgBFnKaZPTYz8pCaXUXmcK0Kst3S+UZ+TZWcJ/h1pnJDcnR1XR?=
 =?us-ascii?Q?psWkyYQWC3e2EiUJ/XagVgAox2TH4PXzcLKIibjk6ACI4ZmdZRAvJtE2PX21?=
 =?us-ascii?Q?Qh7GHL245YdPCVN+jZZmrIKclQtzyqoKhfu1R7IdxfkDnTmndMTYhJqkPgD7?=
 =?us-ascii?Q?jb5rJSCy4KRND7H8AJZmAUh24Gei35OazQ1dzB5xKRRKmxzyz+HrYtPTy2FC?=
 =?us-ascii?Q?CoaPlkddxIgvtMn4zp65aRloqQKKqYr0djcr5yTJO//IXvfEmV8OrVWgv17N?=
 =?us-ascii?Q?4MWVQxUZd5r34o1xkAU9n1KA31cr0mdtfTMz4ou+BG9EWxNVQ27zmzKH0sjs?=
 =?us-ascii?Q?bHdjvogVIwUT4oBKhIjXZUsELGw77b/bZJ41Khnuo3q/RykwnhIjpNYXnTQO?=
 =?us-ascii?Q?MSC3da4ovjXUnxiMCt+3APWPpUeYZ/8dTqJFv87uWJzM5wICLRQwDQohXGM7?=
 =?us-ascii?Q?GbaqJMlv/0qE4ljLRZW8CmE3RnWc8Qq4gk6VP0WGPPtLf/wVeesWfQ2pj5Ea?=
 =?us-ascii?Q?kFP3ILOWIRhbRc+AEsAqg2Sa7cjALOPtxZbOIuvQlGpvG83J8aCBfiQxSuqR?=
 =?us-ascii?Q?B3q7oDZJuyrdp1Vm6h/v7mhBC+NWpcW+4tkiSeOy+TiNL5QO+ua9uaVLyGjL?=
 =?us-ascii?Q?vM7cPsnkB7bQSYuI2Hc7WW26aPeDl1LBq8Ec20fgdIwnuZCS0L7WKdKS9w7y?=
 =?us-ascii?Q?xEn+GAVTkywEJaJmD2nVjwo4elovHaGl2HAsiFhtgZcJEy98wjLSq5pFRSD4?=
 =?us-ascii?Q?2JYTRoEWcoTa0/uA8AR2luldTwre8YAhuxJn515sEmIiounsjNoUYzhpkEyn?=
 =?us-ascii?Q?tv5crOfBpZ4UrYmitDCXUEYrLIEuBPtBivL94UBac9nwTKIGBsfLRjKYr+yN?=
 =?us-ascii?Q?zTDLdrUEU2RLQ7L3ibEu739CyccwniJoVfXQUAExdeyRthHjyXQGXsPi42NL?=
 =?us-ascii?Q?pjJN8bFnQuoghZFjKLXeGdsiS2p0d1xVabVCFLCH/XuEfp+NykJZjBw5wmMz?=
 =?us-ascii?Q?28+v7FQzxpHA+uZeiEhIoGGO0sAxCoCmu18kPpFuIuegMpknz/1NLEzB/YEq?=
 =?us-ascii?Q?0fdfcPyT6FYKFLz0hgIp4cLlBYYL5Bid2N4wmr7Ur2mJ08GA91jLYP1lL1gm?=
 =?us-ascii?Q?oBVPKS+AYkRba6LJ6Tb7foI3LnuW1uk5eCgQ7LF3eTdrqB1/TUI05afla1+k?=
 =?us-ascii?Q?3KNJp2D6F12ytt3njMC2lxkSzFDlNLE1fGpeyjxJY9MdXkjhcPHmhsJhFHfj?=
 =?us-ascii?Q?3uBG3eUghQVQEpFoOKBalBvaZE1j/sgQC1GdBl/XegVOwDJPQ2kT7JpWWy8U?=
 =?us-ascii?Q?L/j83sck1VXEGwWFHt0i04SA1kNjwpnf9luPm+Sklk27Pn/M2XglOcqwemi8?=
 =?us-ascii?Q?aYjIwin4uVeh8UF+Z3FNpZ3IGgptNCybZVtl37JoBnOkNfp23YFQQS1v1aXm?=
 =?us-ascii?Q?IMwwLgiRGjklHZsYhvk3H9H3ouc5izaivwNvfJ2iUmlZ4V3E+GSewGUKddp5?=
 =?us-ascii?Q?ObrTzFxTJ1yNfEQkzloC2jiiRVeYF93vgzoRpYMaQoquWhTglS9NIj5o5Ayz?=
 =?us-ascii?Q?7g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a9366efe-52d8-414d-6a0d-08dd520b144c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 00:02:49.7038 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KLgFH6Ju7kWLhzdH3ZP9HQHQ+s7qPnHxnVHHK5NwOl4/+fEzjfBRLsXQtDJH6i32AbZPpBszFBuwUza7kdDHow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5290
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

On Wed, Feb 19, 2025 at 03:52:36PM -0800, Daniele Ceraolo Spurio wrote:
> xe_exec_queue_kill can sleep, so we can't call it from under a spinlock.
> We can instead move the queues to a separate list and then kill them all
> after we release the spinlock.
> 
> Furthermore, xe_exec_queue_kill can take the VM lock so we can't call it
> while holding the PXP mutex because the mutex is taken under VM lock at
> queue creation time. Note that while it is safe to call the kill without
> holding the mutex, we must call it after the PXP state has been updated,
> otherwise an app might be able to create a queue between the
> invalidation and the state update, which would break the state machine.
> 
> Since being in the list is used to track whether RPM cleanup is needed,
> we can no longer defer that to queue_destroy, so we perform it
> immediately instead.
> 
> v2: also avoid calling kill() under pxp->mutex.
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Fixes: f8caa80154c4 ("drm/xe/pxp: Add PXP queue tracking and session start")
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pxp.c | 78 +++++++++++++++++++++----------------
>  1 file changed, 44 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
> index 3cd3f83e86b0..47499ca02693 100644
> --- a/drivers/gpu/drm/xe/xe_pxp.c
> +++ b/drivers/gpu/drm/xe/xe_pxp.c
> @@ -132,14 +132,6 @@ static int pxp_wait_for_session_state(struct xe_pxp *pxp, u32 id, bool in_play)
>  
>  static void pxp_invalidate_queues(struct xe_pxp *pxp);
>  
> -static void pxp_invalidate_state(struct xe_pxp *pxp)
> -{
> -	pxp_invalidate_queues(pxp);
> -
> -	if (pxp->status == XE_PXP_ACTIVE)
> -		pxp->key_instance++;
> -}
> -
>  static int pxp_terminate_hw(struct xe_pxp *pxp)
>  {
>  	struct xe_gt *gt = pxp->gt;
> @@ -193,7 +185,8 @@ static void pxp_terminate(struct xe_pxp *pxp)
>  
>  	mutex_lock(&pxp->mutex);
>  
> -	pxp_invalidate_state(pxp);
> +	if (pxp->status == XE_PXP_ACTIVE)
> +		pxp->key_instance++;
>  
>  	/*
>  	 * we'll mark the status as needing termination on resume, so no need to
> @@ -220,6 +213,8 @@ static void pxp_terminate(struct xe_pxp *pxp)
>  
>  	mutex_unlock(&pxp->mutex);
>  
> +	pxp_invalidate_queues(pxp);
> +
>  	ret = pxp_terminate_hw(pxp);
>  	if (ret) {
>  		drm_err(&xe->drm, "PXP termination failed: %pe\n", ERR_PTR(ret));
> @@ -665,23 +660,15 @@ int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q)
>  	return ret;
>  }
>  
> -/**
> - * xe_pxp_exec_queue_remove - remove a queue from the PXP list
> - * @pxp: the xe->pxp pointer (it will be NULL if PXP is disabled)
> - * @q: the queue to remove from the list
> - *
> - * If PXP is enabled and the exec_queue is in the list, the queue will be
> - * removed from the list and its PM reference will be released. It is safe to
> - * call this function multiple times for the same queue.
> - */
> -void xe_pxp_exec_queue_remove(struct xe_pxp *pxp, struct xe_exec_queue *q)
> +static void __pxp_exec_queue_remove(struct xe_pxp *pxp, struct xe_exec_queue *q, bool lock)
>  {
>  	bool need_pm_put = false;
>  
>  	if (!xe_pxp_is_enabled(pxp))
>  		return;
>  
> -	spin_lock_irq(&pxp->queues.lock);
> +	if (lock)
> +		spin_lock_irq(&pxp->queues.lock);
>  
>  	if (!list_empty(&q->pxp.link)) {
>  		list_del_init(&q->pxp.link);
> @@ -690,36 +677,54 @@ void xe_pxp_exec_queue_remove(struct xe_pxp *pxp, struct xe_exec_queue *q)
>  
>  	q->pxp.type = DRM_XE_PXP_TYPE_NONE;
>  
> -	spin_unlock_irq(&pxp->queues.lock);
> +	if (lock)
> +		spin_unlock_irq(&pxp->queues.lock);
>  
>  	if (need_pm_put)
>  		xe_pm_runtime_put(pxp->xe);
>  }
>  
> +/**
> + * xe_pxp_exec_queue_remove - remove a queue from the PXP list
> + * @pxp: the xe->pxp pointer (it will be NULL if PXP is disabled)
> + * @q: the queue to remove from the list
> + *
> + * If PXP is enabled and the exec_queue is in the list, the queue will be
> + * removed from the list and its PM reference will be released. It is safe to
> + * call this function multiple times for the same queue.
> + */
> +void xe_pxp_exec_queue_remove(struct xe_pxp *pxp, struct xe_exec_queue *q)
> +{
> +	__pxp_exec_queue_remove(pxp, q, true);
> +}
> +
>  static void pxp_invalidate_queues(struct xe_pxp *pxp)
>  {
>  	struct xe_exec_queue *tmp, *q;
> +	LIST_HEAD(to_clean);
>  
>  	spin_lock_irq(&pxp->queues.lock);
>  
> -	/*
> -	 * Removing a queue from the PXP list requires a put of the RPM ref that
> -	 * the queue holds to keep the PXP session alive, which can't be done
> -	 * under spinlock. Since it is safe to kill a queue multiple times, we
> -	 * can leave the invalid queue in the list for now and postpone the
> -	 * removal and associated RPM put to when the queue is destroyed.
> -	 */
> -	list_for_each_entry(tmp, &pxp->queues.list, pxp.link) {
> -		q = xe_exec_queue_get_unless_zero(tmp);
> -
> +	list_for_each_entry_safe(q, tmp, &pxp->queues.list, pxp.link) {
> +		q = xe_exec_queue_get_unless_zero(q);
>  		if (!q)
>  			continue;
>  
> +		list_move_tail(&q->pxp.link, &to_clean);
> +	}
> +	spin_unlock_irq(&pxp->queues.lock);
> +
> +	list_for_each_entry_safe(q, tmp, &to_clean, pxp.link) {
>  		xe_exec_queue_kill(q);
> +
> +		/*
> +		 * We hold a ref to the queue so there is no risk of racing with
> +		 * the calls to exec_queue_remove coming from exec_queue_destroy.
> +		 */
> +		__pxp_exec_queue_remove(pxp, q, false);
> +
>  		xe_exec_queue_put(q);
>  	}
> -
> -	spin_unlock_irq(&pxp->queues.lock);
>  }
>  
>  /**
> @@ -816,6 +821,7 @@ int xe_pxp_obj_key_check(struct xe_pxp *pxp, struct drm_gem_object *obj)
>   */
>  int xe_pxp_pm_suspend(struct xe_pxp *pxp)
>  {
> +	bool needs_queue_inval = false;
>  	int ret = 0;
>  
>  	if (!xe_pxp_is_enabled(pxp))
> @@ -848,7 +854,8 @@ int xe_pxp_pm_suspend(struct xe_pxp *pxp)
>  			break;
>  		fallthrough;
>  	case XE_PXP_ACTIVE:
> -		pxp_invalidate_state(pxp);
> +		pxp->key_instance++;
> +		needs_queue_inval = true;
>  		break;
>  	default:
>  		drm_err(&pxp->xe->drm, "unexpected state during PXP suspend: %u",
> @@ -865,6 +872,9 @@ int xe_pxp_pm_suspend(struct xe_pxp *pxp)
>  
>  	mutex_unlock(&pxp->mutex);
>  
> +	if (needs_queue_inval)
> +		pxp_invalidate_queues(pxp);
> +
>  	/*
>  	 * if there is a termination in progress, wait for it.
>  	 * We need to wait outside the lock because the completion is done from
> -- 
> 2.43.0
> 
