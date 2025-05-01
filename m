Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8C68C369DC
	for <intel-xe@archiver.kernel.org>; Thu,  1 May 2025 20:55:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93B3A10E0AD;
	Thu,  1 May 2025 20:55:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IYWI+B2M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D5D510E0AD
 for <intel-xe@lists.freedesktop.org>; Thu,  1 May 2025 20:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746132913; x=1777668913;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8OJYPHkiXtPtpIkQoHR8mwRSmh9Flq2gcZZEIP4/Cac=;
 b=IYWI+B2MdqgJMgNOFJGWgmgcVjEOs/p+iDxy+3kZaef4CCUklpR1KDwj
 XmlX2JDxNFsbrERPXg25+lIfNnBKKCSngfLPiddJtgTus1kzB6z7QZGg3
 G/ixPPh8WinNXgkwFTNkwNM/WXIzq2ENJHwbGTRHI4Y7OOaF6WzyaEYUV
 dcnusWvzjN3a0p9mGkJmLh7gIYFbXE/ZawWEwgb88Tb9Cp5ma1TFnJrad
 8Q6mL9in3Oafbn7xMF1rJ0RdFpzbdX9DWB8eT2Dj0U1K7QJOl9UyiJm37
 ee2tdecdsvUbCdlMLgnFo9ktkwxY/Asvg2vesIdpxXpyetXHA63ndvAMU Q==;
X-CSE-ConnectionGUID: BwjJS1ErQG+rLR7wMudPXA==
X-CSE-MsgGUID: 6cb/ujnwRXyY5zjNZUJAEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="47958793"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; d="scan'208";a="47958793"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2025 13:55:12 -0700
X-CSE-ConnectionGUID: qbU+dZqoRLSwdp29eimUjA==
X-CSE-MsgGUID: gePVaL8aQyWmp/ASDvRBGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; d="scan'208";a="138492361"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2025 13:55:12 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 1 May 2025 13:55:07 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 1 May 2025 13:55:07 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 1 May 2025 13:55:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xh46axTJoM7Ou5ghrADacpQnY5IJNHdPq20CchGLJzrtbeuS8lz8H4d9GTbw4byO7IvO6rSRzmQBKHcxvoQMUffK5BFBWNszSVsu30uKRcvkFFSN6zlkDLc9/ggKQxysCE8zxv/u4QFFItaoL9hST7vyBkM3pWbpAljTibR5UhT0AYlrNUzNXxYYjRfDDsI+izA2hseCGuldXWw7XyIK+L/FyDj58YbOb9nf5d7Ik8LzoGSfEmxTnfA4WyYraQX6LZO6RbFc3ZsK3fhoh5xvduuetqXIy/2ev1kRXWFQMQPjnOlHb3KxzYHQNotsCnb71ZG731f0gQYR8B/+9gK9Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ypoZLHRfcGlsZe64aBVozCV8wh99necqa5bIStg6hO8=;
 b=n4DOGcdeLmIKpZyuZqKTQlCMbMy9C7nS56wHh0GvI/NUXy4fwN7yPpdWpTckUFqdPp8xxvqSnBl/vvobjo/uci0fqHUtgz3U1kFGJL1lcCUatqATzNGWUM3xXay8QmqVcDoywBu0hZuLfxZDO6x9XKdAIl5oHpKIyKz8s1U7OpW76cXgtClDn2gv06wSqFPZs5afe5haIpzkb3zSiC5T8Xx8kI20uZR1aBVpBTjNdPF45jYL1XbcWFgYV3JwUS+98nMLnv17obNcg2BRx3eKF2Yrs4VUxa9q5TuFxjEDvr4ExS9jskXeNpbBNhaUE4dMly8Xo4nmsUwEDYIAz+Rrkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB4876.namprd11.prod.outlook.com (2603:10b6:806:119::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.22; Thu, 1 May
 2025 20:55:03 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.012; Thu, 1 May 2025
 20:55:03 +0000
Date: Thu, 1 May 2025 13:56:26 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH] drm/xe: Add WA BB to capture active context utilization
Message-ID: <aBPf+nyt8U0/36a7@lstrano-desk.jf.intel.com>
References: <20250425191039.1551559-1-umesh.nerlige.ramappa@intel.com>
 <5j337myfuaurqwhfswcv52vx652lqws4rqg7gpnydkk3hdif45@mgv2ptjocqx5>
 <aBJr2IosrFA_zGNR@unerlige-desk.amr.corp.intel.com>
 <s7uk6zzqcgystu7di6op4htlfryxcmlcgy3dnt7nhkh6dnmruh@tdocgfrdx3zi>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <s7uk6zzqcgystu7di6op4htlfryxcmlcgy3dnt7nhkh6dnmruh@tdocgfrdx3zi>
X-ClientProxiedBy: BY5PR04CA0021.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB4876:EE_
X-MS-Office365-Filtering-Correlation-Id: eac09fcd-2184-4b9b-8e4d-08dd88f271f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ff6IhEY88nvVp4nKAVmzmxGKWTk2KLNSDB8wDiRKz6na7KWrKJf046RRv4K0?=
 =?us-ascii?Q?kJk5zF7HDH+dQ98/rZ+4DKYhqAprdEctqkYmhlKwWVMsIdjGqC9OF9WT3fAf?=
 =?us-ascii?Q?19JgI5xIxXEhkgr/vj6zD18dgigLP4fm6RKYkh7fdbKwS5Lhk4p3Ksx131mF?=
 =?us-ascii?Q?dORGFVcZo8TzF49lmVt/6kA9hnCBzuA85rvZgnDTHOLESl91QrLl+/K0qBLo?=
 =?us-ascii?Q?Z7nCnz1dV5h/bTQ2A9tEK+8bE/FF6GRGCokGRDLS6LcJd9yAV8BYKmFTa2Jd?=
 =?us-ascii?Q?M8SwcZILZZQW6dA8Z52/U/psUGSyd7KdXQrqqoZNOWa9iPCuYjrK6FaEMC8k?=
 =?us-ascii?Q?4G5QcUHk9BBPf6aBUr3QcpUJhB4AtmTbHGuAAVhGf07QfXaomu4TR02pDpUz?=
 =?us-ascii?Q?1cwTMlEOLL2luiNWezZ5kjioEvs7w00rXXxM3etVen/gA1oQveKjhDZa6Mbn?=
 =?us-ascii?Q?gMw6Pv+Zy2x2Y1xXXC/aarhvxsn90tB8ombWs0463XeNPy4ou9/Tf/7gcKcb?=
 =?us-ascii?Q?cobjY8lEBX0Na2d+kIhXojNHJbIYHJOU4bYAT9gfUy3rM/S11UKMZ2PVsoCb?=
 =?us-ascii?Q?btTVcI3Q6Jcw3xx4YmBgVd6ruCBuO93TSFyYIpwq2SQfwB0Jge3KHGRq5ygF?=
 =?us-ascii?Q?QDgEQc2DPXCIv8Zt/WkEjd5fun7gHOhU+5s81qJ2KNzYmUJ6Lxo1pTrw7xtg?=
 =?us-ascii?Q?Cwa5RawUWZ/PuCawWJR9dW/Bf0U7GZAbC3nCsgEWlJSufgjW4hLCccloJAcd?=
 =?us-ascii?Q?dLN+PZefQxcBFDeXPfgoxdlLbjrHqa77pJvIEkJmZiFv8Hug8W5etpK9lU/P?=
 =?us-ascii?Q?yabZhQiblOJM4JipxQLrNuUZ6ObVAb3qHmYX2quFUsFGdaHh0fXmP4azu5sh?=
 =?us-ascii?Q?9LDm8ECHr8fVwF3INwaQ9CipdN8cmWFjR/p4I4jV1zpb55qzlnln5X+6j30m?=
 =?us-ascii?Q?3Ee/j1hQWV4z5piQoM4HYysKP3XF3EbEoqY8kbRVhavjG0rGazfo+6vJNAw4?=
 =?us-ascii?Q?4GkPnvobtczl9QyQxv2Pe4vxvJcpcbpHmcFZMuOYCAHS18FroXC0UKyG1AFW?=
 =?us-ascii?Q?2nd3FYnIf4BLj9heH+z2g8x+LfzWL0HT+O3S2O3Ypa6YDYNtMgxCeQ/KFggw?=
 =?us-ascii?Q?Ut0pxNti+BArcJa7g5Ap/GOp/uaZEj2Q2alSKu3LIsxc0Sb3lO3Vu3fOTKj3?=
 =?us-ascii?Q?pLRc5OIbRkCtDs4LgHs9zdIuAokwjnLaUdQ8E5bTEYP3qXPkMyIFJQBSXl2s?=
 =?us-ascii?Q?aZIwaLPAk0dIbi2Gq22WUcCqBX36UWGx7QXXwv2E25OD+uXgNR1lXuhmAq1v?=
 =?us-ascii?Q?UgKqoYCPNaSjDGk4MAJ4kKKMS+9OhV7R9GVMatAnvP2UgBd983IcJ8phlfUn?=
 =?us-ascii?Q?diMwngRDcVB44cS6A8WXO3xNZ4TQT9ryNh0Ztiua3EtkMqWs9UaVUr4/O2F3?=
 =?us-ascii?Q?LQWN6sm71Ag=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XBSGTVzXCdTyZKhMQKLqsNAS/DzXqdq1CXTM2ds30ym2qf0wcuI/XgBsYmFL?=
 =?us-ascii?Q?uVlwU627GcuYv5j43JoLsA/TzB0kr4QL59iWhufn+aP8e34LoUh2xJfPBcNm?=
 =?us-ascii?Q?9dDEt0rpMTgybgGMgjB3BoBOiMzNX10ZfNyPQGJeknuNT1ApA0qE7AU4InaS?=
 =?us-ascii?Q?1eY4oVzVCIyfUbovmoXtLPx63MiRSuPVSSEuh0aD9yi08CsvVVisxQRwxHUQ?=
 =?us-ascii?Q?RToEpCeKSkgEHz5UIk0vJGQzzsks4+Be7TPsnQFW/XU8OyALKX1xfoUtJN1N?=
 =?us-ascii?Q?k2Wm1EX59QciaEpslcUaLfGtwdmAHEQX5JckDL7LY2hP32oO0NJRmeatzt86?=
 =?us-ascii?Q?NJv0MvQatlu6nc0Z/xgnznIzlZhg0oVlbGSAkgS4xgcYMLnL0r7ZmYK7bDbC?=
 =?us-ascii?Q?80iznAGILi0iJrR5dq+NhgI8kPRj7T5+f/XRywYNPhjsl7MXCpeBu0MjNF12?=
 =?us-ascii?Q?ePKuPJhXFZDBIdlXxtN58Cz1BUZ+zXOqMrSdF1X+qdvTLXzejaGjoVVBW4OQ?=
 =?us-ascii?Q?UKG24tY2F7rKegZFzL3XLRYzKm6g78a/TkLeRZItIHAu7ar2W2ETdzV3bG/R?=
 =?us-ascii?Q?xICtNNhuHbR8/CmkC7jC5RAm0yJ3TVMEZOHCgEJwy6E6pRl+ICCww2RZSaSQ?=
 =?us-ascii?Q?tyI9/kGomWN5EmTm7ct/88i061ouU2O4wHxpx1LvirUczIlSiZSrCzyIoytZ?=
 =?us-ascii?Q?zUUTLw1LzYZoOU+7V3B4xwwoKYBa2mLsczhcatA+h6iPxJyL0QAV6C1Ah+xr?=
 =?us-ascii?Q?48EqkS8HBDutt+vGAeHWFN6ef/VrSZuRFx2POjm3igyvT85CpgMkguf6+iFZ?=
 =?us-ascii?Q?IYBOc7ohyaSAE7u7bcBUzSnKVbUpMYBdnQ3nrU8Jl0XisV+8LKtGQkZFf8kh?=
 =?us-ascii?Q?rvwE9wPXIBAKdgsH9t8m7mzQvMwXxSpZbwqgqBTW6Wiwr1F4Xubu7aFKf0Jg?=
 =?us-ascii?Q?0Bdhdd/Y14h890q6jF1jbXFDWlzU+JOxHbKffsLbeqddIlmeFkC7tXp6FfG3?=
 =?us-ascii?Q?uMfUF1SEuhnd/HXoxpBKeQVN/1+2oCPP+Bw4oUzWzLp+VTYuxBF588djsDaC?=
 =?us-ascii?Q?Wa2zoIq3FDPYjAB3P78dfdzxtfVOZeJvZqqzD5AGtVunOzneT7NmXKJKTnSI?=
 =?us-ascii?Q?ZkABKYgkMWPeP46sZbVs63WkwLA7k/dgduIbFm7tbyZmXSJ1Tzf5aoY+sdzL?=
 =?us-ascii?Q?u/AMaKGvkXTAmv+DWuS7uWhG3i1cspiglKHj1w/70hg3F19ww3DTr3ZygKIx?=
 =?us-ascii?Q?I9mTV2Uapambz4GdGk8vmcwGJb8wr3t85c8WJ7La2DJyoccjUk44+jJNTwET?=
 =?us-ascii?Q?F8G2fnoEqhVr/nUuo4fUsi3A4waFFaeict7mw3ftATCS2U7NuweGOmG3VXyo?=
 =?us-ascii?Q?yC2bu6OtQFa1grSvQq+jGy/8fipA90GIQGR3Fa6SLfWOiFP4hWW1Ix42cM25?=
 =?us-ascii?Q?ftQxgN7uNnuEQIhoeoR+xxiVZ0mOxCGaNqeODu1NENa454Cg5VIHltq7ZYbv?=
 =?us-ascii?Q?e3ZH1dkqN0pEYYIV//VrgEgWvNCkNO+QqUyzlvNECMvpilSTznx2QdedPwDq?=
 =?us-ascii?Q?5aHn/LdbnsUdVOk9hBUtYGuv5digVEqeZa7oi6UvPwIkSWvv4KLly8d5DjVC?=
 =?us-ascii?Q?lw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eac09fcd-2184-4b9b-8e4d-08dd88f271f6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 20:55:03.4377 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZEpN3JzeC+t+XUlSc+KH7KvIMkLOM0/dHBy2rp6DBBJZed2fmMOHyn8rco33LG2T+bGIgc0dF9pHSPjMg5t9Cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4876
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

On Thu, May 01, 2025 at 08:58:23AM -0500, Lucas De Marchi wrote:
> On Wed, Apr 30, 2025 at 11:28:40AM -0700, Umesh Nerlige Ramappa wrote:
> > > > u32 xe_lrc_update_timestamp(struct xe_lrc *lrc, u32 *old_ts)
> > > > {
> > > > +	u32 ctx_lrc, ctx_reg, engine_id;
> > > > +
> > > > 	*old_ts = lrc->ctx_timestamp;
> > > > 
> > > > -	lrc->ctx_timestamp = xe_lrc_ctx_timestamp(lrc);
> > > > +	ctx_lrc = xe_lrc_ctx_timestamp(lrc);
> > > > +	if (ctx_lrc == 1) {
> > > 
> > > so in the rare case this clashes with a real sched-out value, the
> > > outcome will be that we will read a bogus timestamp and the math will be
> > > totally invalid. Maybe start using the entire u64 counter for this since
> > > it would then not wrap in practice?
> > 
> > I was trying to keep it compatible with platforms without 64 bit
> > CTX_TIMESTAMP. Also th issue is reported on DG2.
> 
> DG2 is not even officially supported. If we can make it very unlikely on
> DG2 and impossible on Xe2 and later, let's do it.
> 

+1 if all offically supported platforms can use a 64-bit counter then
that seems like the way to go. Then just live with the possible race on
platforms with a 32-bit counter.

Matt

> Lucas De Marchi
