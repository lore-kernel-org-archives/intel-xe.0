Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22110C5AD44
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 18:12:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B677C10E2FB;
	Fri, 20 Feb 2026 18:12:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mGhQGnAO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7E6810E2FB
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 18:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771611159; x=1803147159;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iQszHVII18xEEXg64GvVrnV4DyWxr0lqFh6tthDbW08=;
 b=mGhQGnAOs6U1nKYib8q4YDfjePmr/soRneio+grAc7x/fyPBiGy1Bxfv
 PV74m5sEC3zz/roh39V/13XrP5e0f7m4PPE46UUWfpwN7P0SrSykldBWW
 63Q6KbLdwJGw4ZONGmDDxgUAngJiYcP4gO3DzduOVG5a9aUqryjK8G1Fw
 on9dd84KsHcg4aKzl3qwYGtT36475WvBKwe/It0SmvQBbVgmnvSTTKb/Y
 LimwtdbubINbSqemlU4MPUFH/NTBFz1KgZ1TraOdqPiq0V2eXdIXHGX7E
 jt3GPwQm/SqlvKSlkzfzqFngu690jhDVdpjL6mvsfU7Gmphqf5fl94XC9 A==;
X-CSE-ConnectionGUID: UlzR1YG+RfGqxxR5pcr6NQ==
X-CSE-MsgGUID: 5HjWpp7GRYC3P5yW9fMIaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="83810405"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="83810405"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 10:12:35 -0800
X-CSE-ConnectionGUID: HJA4P7RPTWy45+jZ2PAmFA==
X-CSE-MsgGUID: vJJssdb7Sz+aVJ2sdraNTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="214022488"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 10:12:35 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 10:12:34 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 20 Feb 2026 10:12:34 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.42) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 10:12:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p5XsA3xkcPMthXbpAigRcL0tojfH73gcoFHyn2Bbt9N4nVCdut0Oll37Hhlw/SMEIdegVvMUgBLlFHIVHSqwyxJ0qo70/CpG3qKbdMmuRS7HHpl3nhJ0QfOQNJ14ZB4Z1dtnSchnjRT29ytaaMHRWciYV4UiA9NB+N7AOWn60vDA7CMYB3YRK6JzDEkhg/LHj3w+x6aYLdDhqvm4l1ZZGxQLimV9q/Hj4DKkIa1Y+iB+1tsP9rT671hG4BlbsG3bocW8jDuZOjRogpIo3Ias0CO6SErTX0SccspuZnHa42o8AQWed8+eVZ8/th9L6RCuV9cZWaHFrbwlxksuYDq0xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F17uMjWgYywWYdAFjhhpme4LW6ZgOm65YIAR2hUFQSY=;
 b=Y9r5nNJkeGkjfLzRnzB8NRrjW+0eAUD9aYiTpqnSx7aw3hnC9iI5lPERlyTUaoEr6jzZJoHgwnCpLuuVI3u3anLE2V/FUbiIR9WEMqqLztxYNs2Q0fnePTOxtuTxb+hcI8pCH6DwhQ97NkzDPQ90EZW42kyhSgfCjJ2fvZr/UxGdLMmY99cI0TlzftaKFej7GFCpUnU05vlrdA12ypn24OPLogeQc8m3l4DiSi+lGBI6Hw2VumUXbbMhfVkt2ZZNGS+4Tj2Sf/8nRMC+TZ00yBVQyI+lJyAsorjR4eg7gnuabPNV7d8fhv/iy5lFCPkZO4CVGG0pz4O4BH3b1NgZ3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB8523.namprd11.prod.outlook.com (2603:10b6:806:3b5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Fri, 20 Feb
 2026 18:12:32 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 18:12:31 +0000
Date: Fri, 20 Feb 2026 10:12:29 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Zhanjun Dong <zhanjun.dong@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <Wajdeczko@freedesktop.org>, Michal
 <Michal.Wajdeczko@intel.com>
Subject: Re: [PATCH v7 4/7] drm/xe: Use XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET
 enum instead of magic number
Message-ID: <aZikDYBWeITo+yD3@lstrano-desk.jf.intel.com>
References: <20260219180701.2418453-1-zhanjun.dong@intel.com>
 <20260219180701.2418453-5-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260219180701.2418453-5-zhanjun.dong@intel.com>
X-ClientProxiedBy: MW4PR04CA0191.namprd04.prod.outlook.com
 (2603:10b6:303:86::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB8523:EE_
X-MS-Office365-Filtering-Correlation-Id: aeabcf0c-cd80-4cd2-00a4-08de70ab9d67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7KL/soBivfhoP3kDLUiz9T9JbbiencU2jWnT4fcDOAFoBo9lAT/cYRvU5Cu9?=
 =?us-ascii?Q?ED+SigDWNDIG/7UMGFOwvBtIMXWPfcS46TJu8A5D14RV01QyfceOzian7yF+?=
 =?us-ascii?Q?hNWE2CeDw1CGkmXjeOIHEYVTXKW0Cr9ZU1vwDLBmuFsPYrLqmmttHaDzgWS5?=
 =?us-ascii?Q?F/pYPE5OWMEnBcfUgievCETectB9ZUqk+08qSwZzfPF45o/pqpQ/Z+Z+0mG9?=
 =?us-ascii?Q?SgCMJw4t7ZlGlxwTHDcnigroI+gD8rGInF9o/bjOjLJ9xUTDkS6dx9oR+L21?=
 =?us-ascii?Q?kLUtv6gxJpupA8M/FpeeAnq+W2qFuZ5EaSm8v+1ccLsM3ntQCW6aZJfgrZkz?=
 =?us-ascii?Q?PKwBplORiqwInz24sOE0tlq4opeZqeCu/cwhXUuSw5huqdcyekFFVP3OLkqr?=
 =?us-ascii?Q?C7GstazaQO+WBENwnHRhOdevxJOOW1TaP3EVyDrMOckJbm3hxnT51Lg3Tld2?=
 =?us-ascii?Q?ZmDf2d5P4B5jNt0ZS4lsX3BYPlNY2aiee7xRazfUOuEYyMWXkaS086W1nstO?=
 =?us-ascii?Q?PBaBUpv7Qca9RizsFmcgI2tcberYtH75g9tMoHoUcW+CFt+FQ5h1qpJlTolH?=
 =?us-ascii?Q?HkDWFN8kYasbIdjlGuXwQ3NSiuKToc9y+TNSgreM5BbBWSGPvAmvpDoCuck6?=
 =?us-ascii?Q?f4oMWFydWi3XGYshLs3kCjmtXOo6p1QDgKH/85gwTiVD6zG5niVFGOCXlIJy?=
 =?us-ascii?Q?s7//qFCRMnzVJif3dALrgQiiFfdeRWYX5/BSucip55XQY/gk8cgPrzF88t/d?=
 =?us-ascii?Q?72/NK3u4hA1rKVcBTyTa670R5dRF3E3hYSVo01erE7INH1QoORyy/nN3jghF?=
 =?us-ascii?Q?OoHDpsKRNI4WDICjSa67APk80FwOhbe1N7FJMx32UQoSoDiVNLoabLApi4Fd?=
 =?us-ascii?Q?MA35QIOy2wOXWxArh8WF68biHxOFf5gs9NEGyCaa3T71Vk762o3w36ubx3M4?=
 =?us-ascii?Q?jTGQ0SXGDrA0xte7NaeM/Dzm/jdW8wzQW5H55UKoUhTWCRCBF2Y3ZAbKdTX5?=
 =?us-ascii?Q?A6EwvmHyKqT3pKMgAvco2XAKcmpRuaAjf5BK8b3+ODeWpTCef2EEGU2qZxMF?=
 =?us-ascii?Q?tdr9mBxjYCfv02lyt1Y193wyyAPUxM6CIEjeiEnHVFN7mFx5/q2Jc6YhrGAm?=
 =?us-ascii?Q?+rDs1zS6oBdVUXJmZe86yxBZOsh2N+88Fo8SK/3juEQ2QoBZfGj5aEj65Eqq?=
 =?us-ascii?Q?/0Dcl2oRw5cb2NxEy6I1V4KZU+Aa8oVMiLG0XMfXszzt8JThnLoE9MZxKZgX?=
 =?us-ascii?Q?vR3r2tx/N2xzAXS8DH2vz9CGEFJf6Pf1/jzdxPhncwJ9huJqnTyyC68LevtV?=
 =?us-ascii?Q?RBHaFJJPMC1lg7IcSTNOXJhkbdrjBrbufrTrrRGwgtOSmWgnmL1c1d8o+PCS?=
 =?us-ascii?Q?+1Q8FEKKfGxlMyeaP1aBLj9bo1NDy5+WT//dSJyqisCxcFwrsQsiXhSzjktc?=
 =?us-ascii?Q?yoE+pXQZxF8iKOH03NGwoeHd+cJHmKjw+lCUMrgkn8Woilblfk7cvsCHjwGD?=
 =?us-ascii?Q?yWadd+3XiWC8bX9+rgoY/c6YW9FSpL8AeTQAiTgnk5GL+mdJ85wYmomSwFit?=
 =?us-ascii?Q?5wLlZizgFXREN1vW64E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GB/cwLkUPJVpjwLiASZz9jFRzXDX07RqYO0ACAThzMpBgTW71np5/YSgxotp?=
 =?us-ascii?Q?CmsDEseVPugZdEGpMBxdkDzxEEQUxuK7KpA92squJieRVSftOADR2sTY8Tga?=
 =?us-ascii?Q?jRCoMFETJahf8gch6HfoNnN2RqbpTFoiInUAMHLayULtSNsKcvudNk4G8qtc?=
 =?us-ascii?Q?kO0JXo5xLnsXU+eUcXalMUQ9CMThAv49UT1Gn7e0WJESYTrxG76g+OwmWSoR?=
 =?us-ascii?Q?7N+JKdRrgOaQGpCSumlMGKjqgtz9vjzBK8HMVdKmRs2eZzHNDc3w25uK5XpG?=
 =?us-ascii?Q?pGx6fE0Xq4SPm9wj+ncI4p931hBKsHER+Ip7EHFa8hJYqO9m0XhhwBAIGEwE?=
 =?us-ascii?Q?V76SM7YzM9xNXVzXv4cLse1mzWqWDuiTnEb3Lzhyoc+uQ4Ws9K7N0l6d1vFU?=
 =?us-ascii?Q?orK5EwlxVcTbZodgiQsoLxNuNF3EjBK97u8wD6sI3GT2R/cbQcJr6pVGjska?=
 =?us-ascii?Q?MPvMsAU1hpAVmNp1sNCLBaRsJrFstAPFkYgLC9uB1YoPppLlJO0bzCvTsmRv?=
 =?us-ascii?Q?38Ii1XTdA0oGHc1Ydc3XP9q40rrR+nEVHMCz/5tCXdQpWqkDiQIZVMunP1tW?=
 =?us-ascii?Q?g1ldtH6HVL8u5kwaL8df4g2UMyp2Z+uuyzFOv3DViQCiYwtk8KI1QJla7Imv?=
 =?us-ascii?Q?TvvcYW45LBvUoq3zvzHSVnI6eQUxQ+94/VuNdPEBlk3km0nxDbknrcZptlcZ?=
 =?us-ascii?Q?Ns/uYcn0yNZQHMQ21QvlJUKsZjSsWH0FcqBKcWJ+bg8ZR3a30r6Rk4Fh8rco?=
 =?us-ascii?Q?dIvWnMPUNJ2AgCW9HV8zocGwy0XGxsDYDnMEBSrI1yTRY+ICJiORMc5RhAqD?=
 =?us-ascii?Q?CFICY6uYhJQNWsz4Tt0c9aiS6dCZCoqsl3IwMs0Lrn4dKW8kLCWL0mv4u6ZC?=
 =?us-ascii?Q?R04HEAhXxNWlAuoGpZLGuKC3Q/O7op733+sDVQbTEJGxWNZ1VN+edpOnEHC7?=
 =?us-ascii?Q?vW+Pqt9ioBEl9zS2OSIu9+ZDbvxr+1+aGRk4ahrd4DYBHijZoaN/l7Zo8yv/?=
 =?us-ascii?Q?Tgg5Fki4kVj8OKKh1u+T/dTAVTebMc97Rncj1HOOkQBUBKFZpp4M/Of+fZ1P?=
 =?us-ascii?Q?sn91mrElU52x/9YajGgTWoidXfYOWRuB3FRj9zxM6k5uEanPhlZnXRGZwEcF?=
 =?us-ascii?Q?ikRlCcVuDR13tcHUhM20+omjBXCdTAiQadqz2t0h/UOgE8wizjCg0kv7E4gs?=
 =?us-ascii?Q?bk2zqLkFSpdIVmfbD1tWDIkRv0arGc4OG4FM4vaimS4qCcVO/90ClJS6vQfL?=
 =?us-ascii?Q?8sYd9DPsASQbiHV8VLWY4rQEYp6ot50Ozwz/3TjvInYHzqS1L+TfFyxaxOI3?=
 =?us-ascii?Q?EDcyEdbUtUS2fhYgv+ZaScBhhEvpmnRFq4f+qG3iAOgPvmjjLPmqDxzf/5KP?=
 =?us-ascii?Q?6NwNE+dnoI9hmN7MOAvzi3XJSUm5C50uPNHze2ZYCHrxPVmtZRa7PpVv4g/q?=
 =?us-ascii?Q?BT/0jLJ87IHHPqtczZOwAYm3Gwjqpn4eFMRUHWrKhMJLo9tQv33Am5WgE//u?=
 =?us-ascii?Q?j2LfH5g1O5n9ngLE+Xn3yXQPQX1W2kr5PGrQiqU1jomyzwk9/C3TuhwPByFu?=
 =?us-ascii?Q?X+3kku4f52btBvBsDAtyNOQfu2FOH+dyJTc6S5Pdv71C6esrmGt8+uB9jiTn?=
 =?us-ascii?Q?0+Pz4vnJtdcZOgAHSHyJVkhEzIkZKwk0HV2cqT/e5MJf0REMLMfdVEpizS60?=
 =?us-ascii?Q?gprTXBjAelj/dGjzMgx5Ii6INtsLZAuqpm0FCZZBqMRk1Oica3H9pcuD+EYr?=
 =?us-ascii?Q?4eY1/0vbN33u0FkV64mDR4V/sTznFj0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aeabcf0c-cd80-4cd2-00a4-08de70ab9d67
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 18:12:31.7183 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gux8B4GD/IBdzzUmBxzbtanPPP0kyq/WfBJ3q4vmUonHMX5JlkNsIbBZihk6mmu2PhYyflJcY3BqJB/2jTy8kA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8523
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

On Thu, Feb 19, 2026 at 01:06:58PM -0500, Zhanjun Dong wrote:
> Replace the magic number 2 with the proper enum value
> XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET for better code readability
> and maintainability.
> 
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 91c7600a59f5..cd434caec9c2 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1334,12 +1334,13 @@ void xe_guc_submit_wedge(struct xe_guc *guc)
>  	if (!guc->submission_state.initialized)
>  		return;
>  
> -	if (xe->wedged.mode == 2) {
> +	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET) {
>  		err = devm_add_action_or_reset(guc_to_xe(guc)->drm.dev,
>  					       guc_submit_wedged_fini, guc);
>  		if (err) {
> -			xe_gt_err(gt, "Failed to register clean-up on wedged.mode=2; "
> -				  "Although device is wedged.\n");
> +			xe_gt_err(gt, "Failed to register clean-up on wedged.mode=%s; "
> +				  "Although device is wedged.\n",
> +				  xe_wedged_mode_to_string(XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET));
>  			return;
>  		}
>  
> -- 
> 2.34.1
> 
