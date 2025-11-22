Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E32AACFD2E5
	for <intel-xe@archiver.kernel.org>; Sat, 22 Nov 2025 19:18:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5BFD10E0AB;
	Sat, 22 Nov 2025 19:18:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DEYqPO5P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C21F110E0CA
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Nov 2025 19:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763839105; x=1795375105;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=lZURAx+aWXDhlE4eDwmkkKusCbYIHTbqJvMv11R2oFc=;
 b=DEYqPO5P2lj/E2khqgxzqxUN3yhbm0DqtQKKLRDlwV17mwPv+jD3/kES
 5oF/ivel/8nPmOxR9g4N9DWoZN2T7JYNqX32YBSbxVdlmq+INJyDQzpoc
 Z+3IhqkVkvr5q/EyAOKMfSBO1+PS4dB9EgkQlRQwh4tQPrknog/iPxzW8
 DJTvEeRkkEeA1eE96V0LVeJVRQ/GCVMokanATjtT6CJVHj9ZZJ1ErWuzB
 PxvKJt1yUlW2T4GB09pRzpX1ZBNrInkWQ/X0pKs5Z1DFxeRMwHKzNts06
 DpyESCmpPAXNMaTEFvKC5Gr2+9g1BagLAWor5jIrNvsaiSmJPAQ7qLMCO Q==;
X-CSE-ConnectionGUID: EpozP2YtSwiXhAhB5QMf/w==
X-CSE-MsgGUID: 0j3chq98QxSVS3hsPZkySQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="65930759"
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; d="scan'208";a="65930759"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2025 11:18:25 -0800
X-CSE-ConnectionGUID: DH0DSp3JSiGM8SytEalyTw==
X-CSE-MsgGUID: A7SL2vXMRvKHOpsr9mCt4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; d="scan'208";a="196258563"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2025 11:18:25 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 22 Nov 2025 11:18:24 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 22 Nov 2025 11:18:24 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.30) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 22 Nov 2025 11:18:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ft7TfxhIpR0KSBHOLguZpgqgobITGjNtl6om563WoazTiglv2w9+C5+6NuMx+H7cDbNDiJPA+AG9sYrLkPhS1ipywglZ1xY1w1rvT6VQJfWk1HqzNkOU95JzToVL/J3I1ZGEDXZZo7fgly/gzT7RGz9Rkap75XuhPm2gEx4MTpxnpCoUtAxpjlvmd+i07cvsHHXXM9tlicZH+pbqxhDe2grSPEMG2yCd30y1VkyXrJGRjdP7RRoXTs08OT0RWJ/QFE3wtynBEggL51LNPdoPoJoV6VtinYR1HvAf/hD09tGawNZTXrMd0q4s3ewKXejRHDPU90bDgJnyR/7VBvuCow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BRzXFgACQCAVeS1VqYr52hF3YIW2RlOtFfRebFE3ze0=;
 b=TMXnhBYX0MJY3LfkeaY1ptS7Zp1iJryCnzglq6ysNmh3dEGVbaAgdjUNjXIKKggCyv7/fWcUVOtjhKLZW0g0g6a6ijfg0mZEpqiySNQqe7IlVRmod/ju1NB3iuslrhdZdOB0ZazXMGtynw+pDwOZOAxCu85L1QW2n/1KG7zieHoll15K5dcFpz7yoof2oczcPQU6+2nU8vNYf8Xsu/ScUsNchjylJ2xudKv1bDc7cyLN+3cXS/7gA85o09p2olFU7WMUwBGeyTbyKk7de+vqgm1M1iNdo51xc8SmDv18bSrIa+UABQkuPoxYvuBprg17x/YgGP+/aAjwRCo4wH9SBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB6798.namprd11.prod.outlook.com (2603:10b6:806:262::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Sat, 22 Nov
 2025 19:18:09 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9343.011; Sat, 22 Nov 2025
 19:18:09 +0000
Date: Sat, 22 Nov 2025 11:18:07 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Brian Nguyen <brian3.nguyen@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <tejas.upadhyay@intel.com>,
 <shuicheng.lin@intel.com>, <stuart.summers@intel.com>
Subject: Re: [PATCH 06/11] drm/xe: Create page reclaim list on unbind
Message-ID: <aSIMb4EREPix3SDK@lstrano-desk.jf.intel.com>
References: <20251118090552.246243-1-brian3.nguyen@intel.com>
 <20251118090552.246243-7-brian3.nguyen@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251118090552.246243-7-brian3.nguyen@intel.com>
X-ClientProxiedBy: MW4PR03CA0186.namprd03.prod.outlook.com
 (2603:10b6:303:b8::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB6798:EE_
X-MS-Office365-Filtering-Correlation-Id: ddee113e-7390-45e1-c202-08de29fbdf72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Oyn1NF28M/Ihe1qnAa9dgdx6Sis4UWQVx+OMkE7l9I6/R/LnLsFiHRuKLn?=
 =?iso-8859-1?Q?kHY0Q/irgAAXM/ICiMT5BJWTXcRUKk6xIdEJeqzKx2WeK68fQ1Z7ge+E5Y?=
 =?iso-8859-1?Q?ajO8Ny2QifGffbcQdJQffJMAS8cD0b/8aJ6cqR2Hul/IBxK/OLpx+igd6n?=
 =?iso-8859-1?Q?yuDU6CHG9+NMSyNYhgH7aB87vRkFSNya4qRfz/UFRlBZ9kJ2GiMs0dpk6g?=
 =?iso-8859-1?Q?BBdYHMjbsIJ44xtCxdk0BAMw1e6WNET2e3Kms2ARpTLni5GCVY7t38fi4O?=
 =?iso-8859-1?Q?gH/yH3hxkOXwt9dr7/Nr0v4pQTYeDU0TYgU4Emdqcpb/L1qXBqUFeFhx6/?=
 =?iso-8859-1?Q?EcQ87jeGaLH4i8KCBDpGS2goLnXNn1b2pLdZCI7BjC1d9Z1cJMSkelkQie?=
 =?iso-8859-1?Q?YScM98RaSmJLQd4S6xfY8O67SKCpfNA4xYrMHyqWR3pObNsZx2JG9TK5gk?=
 =?iso-8859-1?Q?elGZwp+EDXXeLqyave1DBMaUwh8uaz+2eu68rRCGeeBD2u7ZvmhrjI6zuh?=
 =?iso-8859-1?Q?uPWTb+F+sgfppAu5X044VhTECjCrZ6qy+NEdV+iZrLKrCtOyXz3PVfBoF+?=
 =?iso-8859-1?Q?FJZzH1HKfv5Mj+3onzA4DI7B0pH4vzT65Z9Y5qCa1kXACigrLS2Xn5JGtc?=
 =?iso-8859-1?Q?nBG/mNOxYRlcVcOYc2nd94EK/JKjv4QBfvk4XRfXQIHQZ/r5vzTFr3x1Je?=
 =?iso-8859-1?Q?FsSayvfFp1JsjJOkJlNAdMOPSp6e1473A/ToMfxcAEwruihXOg9W0MUoDZ?=
 =?iso-8859-1?Q?53WJhbqe7DyEOjFhRyqQb+Uo5UnDUr/P9UHdCQnErBrTLrW6W98c0viqIE?=
 =?iso-8859-1?Q?7OmZBSGaD5avujcpOu2ake9/aE0Wirsb5lhy19ghbAJKgWSA7b2Vc2E7jY?=
 =?iso-8859-1?Q?NFoPGvUbRcOBw4KFUWGkEwcWjHVSn390DK/Ldwm4na7Z8yd5JNL2UAfIyY?=
 =?iso-8859-1?Q?kNF4QTUoTMtndXlf8dd/47K+9gcK39+FoeT+NkLWuTE5dCMSyul+M4jjXY?=
 =?iso-8859-1?Q?5VqXun87mavXpntEuQtqHCT6SL7vdp5LXsn/hyv7DBeXnKOaeeuiAoIPxR?=
 =?iso-8859-1?Q?/ZSwN5H06gbBF6GYc3aSXCBQFDJdRkTjQIAHmtI/Ai5w8iUM60l/ZYH+FP?=
 =?iso-8859-1?Q?vJ1rqEo1VRGfNKswkIMxj8vCyBXrJKjNbiENnRJ3ad3IeEKAbk/7QsViOd?=
 =?iso-8859-1?Q?/+ru8YSwFZRVZ+LdbADszateqtJQ/tp1CLrVdMgJAoFgzpS2ZM69YVnGAN?=
 =?iso-8859-1?Q?luysKThOlSrA43dsLBZjdmdpBDgbAuxBM3JmC/i2OzxGCqW/IPpk93C78x?=
 =?iso-8859-1?Q?9iDfvNEr5GPoeymVbek6MrZsGZC3zKvHW0H0xW6n72ZaJtBSfiSvaxkhMV?=
 =?iso-8859-1?Q?NgEihJF/S4d4F01t7LOFU68kWduOCm1ryh3XGCKdH9IXKSFu0hdlnUnq9S?=
 =?iso-8859-1?Q?zr+/VGGT62nMpgYwGrFWBFp1FaqJQppHqo5ebci7e7MPK5EroUQBU42c9+?=
 =?iso-8859-1?Q?Lbu4ufGu57TrQtWpv2UK/v?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?JhalxkPbeJUJNZ/5rOdNcaTRiOePY7sE74IezS6NDUbFni6T0Ua+kt/iun?=
 =?iso-8859-1?Q?a3F/iy44AVlgzWjT94Q4fa21lFh2dolSWcF/zG8Ix6N7pw3fdVzR74aq/o?=
 =?iso-8859-1?Q?03A2H/w1Rs2saDBLrzKH8x8yA2G5eBDkcd/MbkPDVNAfTVBxGoMcr8+7hI?=
 =?iso-8859-1?Q?SBMnpQsao0B4vY45fBxo4FhWotpOSQNhrhQBKgaTysBi9KVzaB87qWeJrr?=
 =?iso-8859-1?Q?wlC+gFjuRsTU4t4GwJVCkd73pqPMK1Dc6eFrrv2iHGGIo1VFtEVmw5KrXC?=
 =?iso-8859-1?Q?JvYPj2aRa4ocl7a4d4/IlQd8PFGKH+AXGrFp+QBwl16GU1TC/bsDdE19ic?=
 =?iso-8859-1?Q?7P1v+q2fRTP9+KWRlhyuOyXqPKJrl4TNrs4k3kVG1IkEjak7OsRutMNQNA?=
 =?iso-8859-1?Q?Ivdr7J5zhVLpQziGVgbA8dDQaQ0dCMJTfiMSG8ngCHOYxyQ6j7CD2D1xto?=
 =?iso-8859-1?Q?5fzGNDRSdtX3YxPd1zjDU1yK4Oc67XsuWinlFqeJuw/xqnhVSGCyxXDuKp?=
 =?iso-8859-1?Q?O9umYprVJQ/zCO5fss69brUqZsOZ3BAQJMZx8QydZ29zGblS8PMxRZrBWW?=
 =?iso-8859-1?Q?jaFOCRWzw/Q6dtFbL2Dwcy8EY+B5cUr4xb8XemYZw48vjn6nd7LtEqfyYV?=
 =?iso-8859-1?Q?xTq4H5u0upTuB/JZOD703ibeQ5DQSKj8aQZR0CJu23yLnpYv+w1ro+8g0S?=
 =?iso-8859-1?Q?/MiDQYoHQBetil0e2xL/ILaSYqcXFL/O2K0ruWTDpy49TmipQmUzIjJvje?=
 =?iso-8859-1?Q?6ByTvBvTQNGhnLqqjDlXxobhJgtYNYgjkByvJUVemzBPxKBRMtbzmw9SkN?=
 =?iso-8859-1?Q?WeV+joQCFd3nlOtQ7X4U3Tpow3rqcNF4JUTlbaz96jhA5RT2NMyfCkCoAL?=
 =?iso-8859-1?Q?PgK70nzC3n1ozt572RJkMgmgpvNGzSALzbg5mMyQUfOpfK4ekDKQYS8yH1?=
 =?iso-8859-1?Q?hysimD3ocwNHdSRJqtDk56BmQfQeMP5XHek5QEWSNSm226hkZI8NjjjpJ/?=
 =?iso-8859-1?Q?3c38wETMiC9OZ+lYlTFGtYT8xelFOXseaOBmHB4sMExo2JF78bz7Fb/Eq7?=
 =?iso-8859-1?Q?RjMuSAn+wve+PY0/qxUn+UZS20x+3t+TeuBWimLLGnQvH5OresrgK1tnIT?=
 =?iso-8859-1?Q?8HV8E5MsWrYyh5nzaZdgbtuepcoYGFp4QhLCtN8WyVZEBydSQzClxlyVId?=
 =?iso-8859-1?Q?ENdKxHpCn1XJpK0hdq8REZX9wCAmvVl104GR/ii+hu6+NwAb7mBPbVwsHy?=
 =?iso-8859-1?Q?y3GZMntYO4kruJFz8gxgDdtBPZoJc607+/Cq2wIc5X+wS+1blkypLjyeGa?=
 =?iso-8859-1?Q?rK2MxyMu4gkjq4vPvPXaIouZBwmjrl3gOgUycU8XRoog5sF6FQtuKAW1sI?=
 =?iso-8859-1?Q?iLVgwrGdZLCkMiUpbhn/lKN+tVyQVlLKxUJuTtiOoLGfiSTGTm947e49Yp?=
 =?iso-8859-1?Q?bq7YgtPmtdvK8m73NyJWcXNmVDVyCh5QMQXtmI2GKhLSCV3s5w72syueFB?=
 =?iso-8859-1?Q?3pdbCLin75OcO+5D+Gv+FJk7uJ6fvKTROURL+iAuHJ/gOCGJG4mWwgXfLC?=
 =?iso-8859-1?Q?QQnY/hfWN6tHryfSekqnZ5IHWTlQdI7wlGjEKrbUH+SKW0IQHVJA5tGk2R?=
 =?iso-8859-1?Q?nsTYReGEf016YBxNIR+jE839c9LMde71qmbPF/prOm/UPzXZycxEg6/g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ddee113e-7390-45e1-c202-08de29fbdf72
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2025 19:18:09.7107 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JaArITp63aFaYdXgMAOq9eS1d2YWKkhNy8/gQNpM5o49H0boDV53OXnY7jfXtH0QJgcCWEaVVwdb4M0rqhxkIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6798
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

On Tue, Nov 18, 2025 at 05:05:47PM +0800, Brian Nguyen wrote:
> Page reclaim list (PRL) is preparation work for the page reclaim feature.
> The PRL is firstly owned by pt_update_ops and all other page reclaim
> operations will point back to this PRL. PRL generates its entries during
> the unbind page walker, updating the PRL.
> 
> This PRL is restricted to a 4K page, so 512 page entries at most.
> 
> Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile           |   1 +
>  drivers/gpu/drm/xe/regs/xe_gtt_defs.h |   1 +
>  drivers/gpu/drm/xe/xe_page_reclaim.c  |  52 ++++++++++++
>  drivers/gpu/drm/xe/xe_page_reclaim.h  |  49 ++++++++++++
>  drivers/gpu/drm/xe/xe_pt.c            | 109 ++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_pt_types.h      |   5 ++
>  6 files changed, 217 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_page_reclaim.c
>  create mode 100644 drivers/gpu/drm/xe/xe_page_reclaim.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index e4b273b025d2..048e6c93271c 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -95,6 +95,7 @@ xe-y += xe_bb.o \
>  	xe_oa.o \
>  	xe_observation.o \
>  	xe_pagefault.o \
> +	xe_page_reclaim.o \
>  	xe_pat.o \
>  	xe_pci.o \
>  	xe_pcode.o \
> diff --git a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> index 4389e5a76f89..4d83461e538b 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> @@ -9,6 +9,7 @@
>  #define XELPG_GGTT_PTE_PAT0	BIT_ULL(52)
>  #define XELPG_GGTT_PTE_PAT1	BIT_ULL(53)
>  
> +#define XE_PTE_ADDR_MASK	GENMASK_ULL(51, 12)
>  #define GGTT_PTE_VFID		GENMASK_ULL(11, 2)
>  
>  #define GUC_GGTT_TOP		0xFEE00000
> diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.c b/drivers/gpu/drm/xe/xe_page_reclaim.c
> new file mode 100644
> index 000000000000..a0d15efff58c
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_page_reclaim.c
> @@ -0,0 +1,52 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/kref.h>
> +#include <linux/mm.h>
> +#include <linux/slab.h>
> +
> +#include "xe_page_reclaim.h"
> +
> +#include "regs/xe_gt_regs.h"
> +#include "xe_assert.h"
> +#include "xe_macros.h"
> +
> +/**
> + * xe_page_reclaim_list_invalidate() - Mark a PRL as invalid
> + * @prl: Page reclaim list to reset
> + *
> + * Clears the entries pointer and marks the list as invalid so
> + * future use know PRL is unusable. It is expected that the entries
> + * have already been released.
> + */
> +void xe_page_reclaim_list_invalidate(struct xe_page_reclaim_list *prl)
> +{
> +	prl->entries = NULL;
> +	prl->num_entries = XE_PAGE_RECLAIM_INVALID_LIST;
> +}
> +
> +/**
> + * xe_page_reclaim_list_alloc_entries() - Allocate page reclaim list entries
> + * @prl: Page reclaim list to allocate entries for
> + *
> + * Allocate one 4K page for the PRL entries, otherwise assign prl->entries to NULL.
> + */
> +int xe_page_reclaim_list_alloc_entries(struct xe_page_reclaim_list *prl)
> +{
> +	struct page *page;
> +
> +	XE_WARN_ON(prl->entries != NULL);
> +	if (prl->entries)
> +		return 0;
> +
> +	page = alloc_page(GFP_KERNEL | __GFP_ZERO);
> +	if (page) {
> +		prl->entries = page_address(page);
> +		prl->num_entries = 0;
> +	}
> +
> +	return page ? 0 : -ENOMEM;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.h b/drivers/gpu/drm/xe/xe_page_reclaim.h
> new file mode 100644
> index 000000000000..d066d7d97f79
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_page_reclaim.h
> @@ -0,0 +1,49 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_PAGE_RECLAIM_H_
> +#define _XE_PAGE_RECLAIM_H_
> +
> +#include <linux/kref.h>
> +#include <linux/mm.h>
> +#include <linux/slab.h>
> +#include <linux/types.h>
> +#include <linux/workqueue.h>
> +
> +#define XE_PAGE_RECLAIM_MAX_ENTRIES	512
> +#define XE_PAGE_RECLAIM_LIST_MAX_SIZE	SZ_4K
> +
> +struct xe_guc_page_reclaim_entry {
> +	u32 valid:1;
> +	u32 reclamation_size:6;
> +	u32 reserved:5;
> +	u32 address_lo:20;
> +	u32 address_hi:20;
> +	u32 reserved1:12;

This is wire interface with the GuC. Bitfields can based on endianess of
the CPU. I know this is a iGPU feature for now but it could possibly
change in the future, with that, to future proof can the layout of this
be setup via defines / macros? 

> +} __packed;
> +
> +struct xe_page_reclaim_list {
> +	/** @entries: array of page reclaim entries, page allocated */
> +	struct xe_guc_page_reclaim_entry *entries;
> +	/** @num_entries: number of entries */
> +	int num_entries;
> +#define XE_PAGE_RECLAIM_INVALID_LIST	-1
> +};
> +
> +void xe_page_reclaim_list_invalidate(struct xe_page_reclaim_list *prl);
> +int xe_page_reclaim_list_alloc_entries(struct xe_page_reclaim_list *prl);
> +static inline void xe_page_reclaim_entries_get(struct xe_guc_page_reclaim_entry *entries)
> +{
> +	if (entries)
> +		get_page(virt_to_page(entries));
> +}
> +
> +static inline void xe_page_reclaim_entries_put(struct xe_guc_page_reclaim_entry *entries)
> +{
> +	if (entries)
> +		put_page(virt_to_page(entries));
> +}

Kernel doc for static inlines.

> +
> +#endif	/* _XE_PAGE_RECLAIM_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 884127b4d97d..532a047676d4 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -12,6 +12,7 @@
>  #include "xe_exec_queue.h"
>  #include "xe_gt.h"
>  #include "xe_migrate.h"
> +#include "xe_page_reclaim.h"
>  #include "xe_pt_types.h"
>  #include "xe_pt_walk.h"
>  #include "xe_res_cursor.h"
> @@ -1538,6 +1539,9 @@ struct xe_pt_stage_unbind_walk {
>  	/* Output */
>  	/* @wupd: Structure to track the page-table updates we're building */
>  	struct xe_walk_update wupd;
> +
> +	/** @prl: Backing pointer to page reclaim list in pt_update_ops */
> +	struct xe_page_reclaim_list *prl;
>  };
>  
>  /*
> @@ -1572,6 +1576,69 @@ static bool xe_pt_check_kill(u64 addr, u64 next, unsigned int level,
>  	return false;
>  }
>  
> +/* Huge 2MB leaf lives directly in a level-1 table and has no children */
> +static bool is_large_pte(struct xe_pt *pte)
> +{
> +	return pte->level == 1 && !pte->base.children;
> +}
> +
> +/* page_size = 2^(reclamation_size + 12) */
> +#define COMPUTE_RECLAIM_ADDRESS_MASK(page_size)				\
> +({									\
> +	BUILD_BUG_ON(!__builtin_constant_p(page_size));			\
> +	ilog2(page_size) - 12;						\

s/12/XE_PTE_SHIFT ?

> +})
> +
> +static void generate_reclaim_entry(struct xe_tile *tile,
> +				   struct xe_page_reclaim_list *prl,
> +				   u64 pte,
> +				   struct xe_pt *xe_child)

Nit, xe_pt can be on the same line as 'u64 pte'.

> +{
> +	struct xe_guc_page_reclaim_entry *reclaim_entries = prl->entries;
> +	u64 phys_addr = pte & XE_PTE_ADDR_MASK;
> +	const u64 field_mask = GENMASK_ULL(19, 0);
> +	u32 reclamation_size;

Nit, I'd make the last variable declared on the stack for readability. 

> +	const uint max_entries = XE_PAGE_RECLAIM_MAX_ENTRIES;
> +	int num_entries = prl->num_entries;
> +
> +	xe_tile_assert(tile, xe_child->level <= MAX_HUGEPTE_LEVEL);
> +	xe_tile_assert(tile, reclaim_entries);
> +
> +	if (num_entries == XE_PAGE_RECLAIM_INVALID_LIST)
> +		return;
> +
> +	/* Overflow: mark as invalid through num_entries */
> +	if (num_entries >= max_entries) {
> +		prl->num_entries = XE_PAGE_RECLAIM_INVALID_LIST;
> +		return;
> +	}
> +
> +	/**
> +	 * reclamation_size indicates the size of the page to be
> +	 * invalidated and flushed from non-coherent cache.
> +	 * Page size is computed as 2^(reclamation_size+12) bytes.
> +	 * Only valid for these specific levels.
> +	 */
> +
> +	if (xe_child->level == 0 && !(pte & XE_PTE_PS64))
> +		reclamation_size = COMPUTE_RECLAIM_ADDRESS_MASK(SZ_4K);  /* reclamation_size = 0 */
> +	else if (xe_child->level == 0)
> +		reclamation_size = COMPUTE_RECLAIM_ADDRESS_MASK(SZ_64K); /* reclamation_size = 1 */
> +	else if (is_large_pte(xe_child))
> +		reclamation_size = COMPUTE_RECLAIM_ADDRESS_MASK(SZ_2M);  /* reclamation_size = 2 */

What happens if we have 1G page? That doesn't seem to be handled.

> +	else
> +		return;
> +
> +	reclaim_entries[num_entries].valid = 1;
> +	reclaim_entries[num_entries].reclamation_size =
> +		reclamation_size;
> +	reclaim_entries[num_entries].address_lo =
> +		FIELD_GET(field_mask, phys_addr);
> +	reclaim_entries[num_entries].address_hi =
> +		FIELD_GET(field_mask, phys_addr >> 20);

As suggested above, use macros/defines here to setup the entry.

> +	prl->num_entries++;
> +}
> +
>  static int xe_pt_stage_unbind_entry(struct xe_ptw *parent, pgoff_t offset,
>  				    unsigned int level, u64 addr, u64 next,
>  				    struct xe_ptw **child,
> @@ -1579,10 +1646,27 @@ static int xe_pt_stage_unbind_entry(struct xe_ptw *parent, pgoff_t offset,
>  				    struct xe_pt_walk *walk)
>  {
>  	struct xe_pt *xe_child = container_of(*child, typeof(*xe_child), base);
> +	struct xe_pt_stage_unbind_walk *xe_walk =
> +		container_of(walk, typeof(*xe_walk), base);
> +	struct xe_device *xe = tile_to_xe(xe_walk->tile);
>  
>  	XE_WARN_ON(!*child);
>  	XE_WARN_ON(!level);
>  
> +	/* 4K and 64K Pages are level 0, large pte needs additional handling. */
> +	if (xe_walk->prl && (xe_child->level == 0 || is_large_pte(xe_child))) {

And also here? 1G pages are unhandled? Please explain.

> +		struct iosys_map *leaf_map = &xe_child->bo->vmap;
> +		pgoff_t first = xe_pt_offset(addr, 0, walk);
> +		pgoff_t count = xe_pt_num_entries(addr, next, 0, walk);
> +
> +		for (pgoff_t i = 0; i < count; i++) {
> +			u64 pte = xe_map_rd(xe, leaf_map, (first + i) * sizeof(u64), u64);
> +
> +			generate_reclaim_entry(xe_walk->tile, xe_walk->prl,
> +					       pte, xe_child);
> +		}
> +	}
> +
>  	xe_pt_check_kill(addr, next, level - 1, xe_child, action, walk);
>  
>  	return 0;
> @@ -1654,6 +1738,8 @@ static unsigned int xe_pt_stage_unbind(struct xe_tile *tile,
>  {
>  	u64 start = range ? xe_svm_range_start(range) : xe_vma_start(vma);
>  	u64 end = range ? xe_svm_range_end(range) : xe_vma_end(vma);
> +	struct xe_vm_pgtable_update_op *pt_update_op =
> +		container_of(entries, struct xe_vm_pgtable_update_op, entries[0]);
>  	struct xe_pt_stage_unbind_walk xe_walk = {
>  		.base = {
>  			.ops = &xe_pt_stage_unbind_ops,
> @@ -1665,6 +1751,7 @@ static unsigned int xe_pt_stage_unbind(struct xe_tile *tile,
>  		.modified_start = start,
>  		.modified_end = end,
>  		.wupd.entries = entries,
> +		.prl = pt_update_op->prl,
>  	};
>  	struct xe_pt *pt = vm->pt_root[tile->id];
>  
> @@ -1897,6 +1984,7 @@ static int unbind_op_prepare(struct xe_tile *tile,
>  			     struct xe_vm_pgtable_update_ops *pt_update_ops,
>  			     struct xe_vma *vma)
>  {
> +	struct xe_device *xe = tile_to_xe(tile);
>  	u32 current_op = pt_update_ops->current_op;
>  	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[current_op];
>  	int err;
> @@ -1914,6 +2002,13 @@ static int unbind_op_prepare(struct xe_tile *tile,
>  	pt_op->vma = vma;
>  	pt_op->bind = false;
>  	pt_op->rebind = false;
> +	/* Maintain one PRL located in pt_update_ops that all others in unbind op reference */
> +	if (xe->info.has_page_reclaim_hw_assist && !pt_update_ops->prl.entries) {
> +		err = xe_page_reclaim_list_alloc_entries(&pt_update_ops->prl);
> +		if (err < 0)
> +			xe_page_reclaim_list_invalidate(&pt_update_ops->prl);

I don't think you need to call xe_page_reclaim_list_invalidate, right?
If xe_page_reclaim_list_alloc_entries fails the prl should be in the
init state.

> +	}
> +	pt_op->prl = (pt_update_ops->prl.entries) ? &pt_update_ops->prl : NULL;
>  
>  	err = vma_reserve_fences(tile_to_xe(tile), vma);
>  	if (err)
> @@ -1921,6 +2016,13 @@ static int unbind_op_prepare(struct xe_tile *tile,
>  
>  	pt_op->num_entries = xe_pt_stage_unbind(tile, xe_vma_vm(vma),
>  						vma, NULL, pt_op->entries);
> +	/* Free PRL if list declared as invalid */
> +	if (pt_update_ops->prl.entries &&
> +	    pt_update_ops->prl.num_entries == XE_PAGE_RECLAIM_INVALID_LIST) {
> +		xe_page_reclaim_entries_put(pt_update_ops->prl.entries);
> +		pt_op->prl = NULL;
> +		pt_update_ops->prl.entries = NULL;

Call xe_page_reclaim_list_invalidate for clarity?

> +	}
>  
>  	xe_vm_dbg_print_entries(tile_to_xe(tile), pt_op->entries,
>  				pt_op->num_entries, false);
> @@ -1979,6 +2081,7 @@ static int unbind_range_prepare(struct xe_vm *vm,
>  	pt_op->vma = XE_INVALID_VMA;
>  	pt_op->bind = false;
>  	pt_op->rebind = false;
> +	pt_op->prl = NULL;
>  
>  	pt_op->num_entries = xe_pt_stage_unbind(tile, vm, NULL, range,
>  						pt_op->entries);
> @@ -2096,6 +2199,7 @@ xe_pt_update_ops_init(struct xe_vm_pgtable_update_ops *pt_update_ops)
>  	init_llist_head(&pt_update_ops->deferred);
>  	pt_update_ops->start = ~0x0ull;
>  	pt_update_ops->last = 0x0ull;
> +	xe_page_reclaim_list_invalidate(&pt_update_ops->prl);

Can we introduce a function called xe_page_reclaim_list_init for
clarity? It might do the same thing as xe_page_reclaim_list_invalidate
but it would make this a little more clear. Likewise later in the series
when a job is created, you can call xe_page_reclaim_list_init there too.

>  }
>  
>  /**
> @@ -2518,6 +2622,11 @@ void xe_pt_update_ops_fini(struct xe_tile *tile, struct xe_vma_ops *vops)
>  		&vops->pt_update_ops[tile->id];
>  	int i;
>  
> +	if (pt_update_ops->prl.entries) {
> +		xe_page_reclaim_entries_put(pt_update_ops->prl.entries);
> +		xe_page_reclaim_list_invalidate(&pt_update_ops->prl);
> +	}
> +
>  	lockdep_assert_held(&vops->vm->lock);
>  	xe_vm_assert_held(vops->vm);
>  
> diff --git a/drivers/gpu/drm/xe/xe_pt_types.h b/drivers/gpu/drm/xe/xe_pt_types.h
> index 881f01e14db8..26e5295f118e 100644
> --- a/drivers/gpu/drm/xe/xe_pt_types.h
> +++ b/drivers/gpu/drm/xe/xe_pt_types.h
> @@ -8,6 +8,7 @@
>  
>  #include <linux/types.h>
>  
> +#include "xe_page_reclaim.h"
>  #include "xe_pt_walk.h"
>  
>  struct xe_bo;
> @@ -85,6 +86,8 @@ struct xe_vm_pgtable_update_op {
>  	bool bind;
>  	/** @rebind: is a rebind */
>  	bool rebind;
> +	/** @prl: Backing pointer to page reclaim list of pt_update_ops */
> +	struct xe_page_reclaim_list *prl;

Can you move this above the bools in the layout of
xe_vm_pgtable_update_op, likely just below "struct xe_vma".

>  };
>  
>  /** struct xe_vm_pgtable_update_ops: page table update operations */
> @@ -119,6 +122,8 @@ struct xe_vm_pgtable_update_ops {
>  	 * slots are idle.
>  	 */
>  	bool wait_vm_kernel;
> +	/** @prl: embedded page reclaim list */
> +	struct xe_page_reclaim_list prl;

Same thing here, move just below "struct xe_exec_queue".

Matt

>  };
>  
>  #endif
> -- 
> 2.51.2
> 
