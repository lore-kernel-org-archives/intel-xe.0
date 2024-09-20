Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F8DCCF9C68
	for <intel-xe@archiver.kernel.org>; Fri, 20 Sep 2024 21:45:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B8AF10E00F;
	Fri, 20 Sep 2024 21:45:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JaUt58eu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54DFE10E00F
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Sep 2024 21:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726868714; x=1758404714;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Wl4fjrzqrUpypSG4cBE4ikXtV44Hk/Dh7AUzmOg7RIw=;
 b=JaUt58euYgTk/cY/uDvs1Q6T3LfMxJxO9IFRDx5eKJ1LA9+7YttTZQFV
 yu0jL+gK/nWEAZe5O5YZ3P5fcSwH6XcEwfGNul2LbdWN0DN5P27bSFj9L
 Rv9nHERUY/8JrojkP5kQNgAFzILo2KbSRFOno9iR+UGj/iPwzcANNokwZ
 tK9yfi9FnGiHdj67p4HUvnh01pjej8DZIDb1UVxk2xFcYsipys6vtxNfL
 Y6N+h0+uQnDzOVcZC6Bkjn+htmttfZvoezwgeYr39ODSGxAt8eejeYz92
 8P4YZOi+IGOMp2+1sO5PLCF8DtkZe6DSuKhVtKAmSyhZdZLGVqCqIwwEq w==;
X-CSE-ConnectionGUID: ahNd926uSuuztIdi0BclrA==
X-CSE-MsgGUID: 0q8nYT4RR5e4eizX4G+Aew==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="43364044"
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; d="scan'208";a="43364044"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 14:45:09 -0700
X-CSE-ConnectionGUID: DfQd6kViQtqvPUrpTCMA6A==
X-CSE-MsgGUID: k0fMoTuHSvu7A2/Lq02WvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; d="scan'208";a="93770984"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2024 14:45:07 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 20 Sep 2024 14:45:07 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 20 Sep 2024 14:45:06 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 20 Sep 2024 14:45:06 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 20 Sep 2024 14:45:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fAXxCiBaK40S9g374JZtgDADJhT0JvcXHLmot1MGvl+m4Pb4XNPiuJpgT7qvzj3+Kkrc+rH475g7XyG4cMf/amsbyii/uleDgtOQMlBbCCiX3RFeNO6+Iqj5V/NXy0uHuIrwQelJrVSYpXk/wzaVO9qH42nul0/G6W5Ll8gyjTB8aTEbhi8G1iBIQCqA51siFPlq631AC9l1SVXfoOXJXEZD5YOGw/InQdFcx+Iz5zEaYKZ1iEp+dMlCNHv7Lg2hNyq4UlTQzRN5vxWi0ZRsuSWVqyXgGIM1CVPmtVvyT8hZkjhCZllPSkpjCyNzWogx4ggHGHHR9zolV6Yq5mBdSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EhEeeuWBgDtD7ZEaZ3ol4XChVx/HSeSQfcyvafZ7wTI=;
 b=ms/P9hDksr1QNfR3vfapqfstoXlyIgqw1MGAQBxC1+/Ydg/3InX1pNrCwPC7j0dipFV9UD14A2Cicqzo07xpRx5K8NHL1A89dIHtJG8v6G0CaZ/3KOouOSsd7TtxqdTFhkLB0sbmRXAsYVTJBCpZ2594XGGT6RCd0H7c3nUoki/HarPUcNzugkGFHExKZbgjAQ1sY6ro80AjSlkoKR7WoSMGhkkLUO/LISLI079kyglFienN4lmpdwyQCGrqlRzzla1Shj6Lv3pAQ9aruMZfGudAw+6cn9BZuNcqLLq/eQUKOLmUHQGAz1TJ7f/91a/3oLmGrN7ygiEcoznWOS5SHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by DS7PR11MB7808.namprd11.prod.outlook.com (2603:10b6:8:ee::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7982.23; Fri, 20 Sep 2024 21:45:04 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb%5]) with mapi id 15.20.7982.022; Fri, 20 Sep 2024
 21:45:04 +0000
Date: Fri, 20 Sep 2024 14:44:56 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: Zhanjun Dong <zhanjun.dong@intel.com>, <intel-xe@lists.freedesktop.org>,
 Matthew Brost <matthew.brost@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 1/1] drm/xe: Prevent null pointer access in
 xe_migrate_copy
Message-ID: <20240920214456.GW5774@mdroper-desk1.amr.corp.intel.com>
References: <20240919224220.1325739-1-zhanjun.dong@intel.com>
 <20240919224220.1325739-2-zhanjun.dong@intel.com>
 <f9269ec3-dc9b-4863-9e41-e7a9946d9e1c@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f9269ec3-dc9b-4863-9e41-e7a9946d9e1c@intel.com>
X-ClientProxiedBy: CP5P284CA0222.BRAP284.PROD.OUTLOOK.COM
 (2603:10d6:103:22b::20) To CH3PR11MB8185.namprd11.prod.outlook.com
 (2603:10b6:610:159::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8185:EE_|DS7PR11MB7808:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e7386b3-f7c9-437c-6fed-08dcd9bd7cc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aiZOqqXun89CmOhvvTmtQScp9B73AnTM4ArYMc3gdh0ccwv4w8aPQYySPynN?=
 =?us-ascii?Q?DsTwe428tGZpu7UfPhQ5bNtCvH2EgIfypVnRF3zCsY/ZCj3Xl7+j8mw6FvXX?=
 =?us-ascii?Q?BMv5Bh6eHwbOptkPM35Z9LVxTJil/5b+54Gg1t13ssaYho/+hBALUNIhVKMD?=
 =?us-ascii?Q?EaNHuX0sA/QC0uSYAJYpChYpNMFl6hu84UdSjohtexNLEMrolxZcn5unaxGo?=
 =?us-ascii?Q?HiVJxWRVIxxsEgb619bxhZyR20WfOQC24svc/UBTP1gMCo2oLY6qaPdOSw7a?=
 =?us-ascii?Q?Z4tJFlB3XnRvqXduZ6xSfNtwrDtlglmJfRWRVNhW9M3qc0ohPzWYaIEOoOcz?=
 =?us-ascii?Q?IypD9GBxFx68wst8+Vb2+4jlAnkey4u63Jx2owDUHWzvvINX96KLUVRDqYFu?=
 =?us-ascii?Q?s2u1yE1MiCbkvnhZQ/+2f35cmCi7uGmWCnYEYJNX7KGsyxwf2PYr9AXMwDUq?=
 =?us-ascii?Q?5j0EE9Dxdxyw/4sx8X2+Oz19hP5G84eJHedYQxOXxmPFVnIfsJrnVZV596sF?=
 =?us-ascii?Q?LrDhXWy6KdsDLXqpz9E+GSftp68UbOvCgcWS65VB94jHBbdkVbaeQsTO+oMw?=
 =?us-ascii?Q?w/24hqf4l9iRj4KlQCnJKZXQQffqLVDD06kZo/ONmwPr8y2mAqoWusIEOySb?=
 =?us-ascii?Q?hkJNMvzstvOIQmTwdA8Yvwt5E1JnuwHVxpcIsafB3PgxbmXbPRkBKhc141Sn?=
 =?us-ascii?Q?d8co/QWrJnJNyk8+/B3X14Dq6sfrpN+72Y+xcFl7DeQhj3a+hCZyFOXXyXW2?=
 =?us-ascii?Q?kMXm4khF5+LVf57U1Vfm/yVcDOFs0fVTgMF8hi6eQNAMelVmGOcuGiDF3WIX?=
 =?us-ascii?Q?6LzF1iS3EZE/rYAt0ODWAYg1VwcKkAm5cBeFmlVvERVX/kcu3RBi6s9Czu7u?=
 =?us-ascii?Q?Ah+mZ+NAvBR8EZMkkKh35qJek5AiZfLO8+NRVLSqUXjfHt48EYD+TzbVWnR4?=
 =?us-ascii?Q?97CDZPNe8P2HfMJ/zvLB3YVhENNExg75TibQ3Mzx57NU+GevuQAvtwc+HiQ0?=
 =?us-ascii?Q?dRIcRXtaT5+LPjwz7ZjYiyvd12BSR2Xp2+OpMRsRG0WzrIQuh4JGbZlmJo8Z?=
 =?us-ascii?Q?9OBdE+eRNoih+djddYarQiC6VUxkK63VIQtEe167vl2HG6Sx3ALHte3gBli1?=
 =?us-ascii?Q?m28b984OXgJo8i/FUDwpzU2UxFPpysNhqe+rEP2BpwQEo4U9+vI+rVfaa20+?=
 =?us-ascii?Q?YKacEE0I3K66PlE7uG1YmhHzLGihXP/6aC0Ege4OiY9hgpg6Fp58waunUFsx?=
 =?us-ascii?Q?r6gdus7rhF+jo+b5Cf8HHVLiaqunhajEpkuCAb0UY/E0/wWFlvip2Or6y3mm?=
 =?us-ascii?Q?Og5bLgSR9uswocCZLak57sAGpR/h3/JwngJI5kWXLxIEeg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RYuVdJgugjAIs1foKDSCmEXfC6bsvaWs55LQwzo5R6fX8k/jZbbB04VOYTLU?=
 =?us-ascii?Q?ZLYrxVkZDCc4ru2Xb/N2dNUUfkYDEta6KKUZcHHCBAil9MMXlXIUkHvbvETZ?=
 =?us-ascii?Q?Hg+VOVSstEmpfQtgN2Pyk6RqTH7B3QE5/TvLHXhPeoQGcF7NxapOFu3JB9A/?=
 =?us-ascii?Q?QBdhnVKCZ/Z+20cNuQgQOb41CglCKyBcNzfmCmwN3TtgbCnfe7QPSZ3HFA/m?=
 =?us-ascii?Q?XswkSc5VYlfuFKTpfVA7hRdeCMctAJa8MppUMPdtLXKepOKwrz4ySwGSz3OB?=
 =?us-ascii?Q?YSc8Veiwv+uUzqz9xMXq+Fz9Rd+OSJDulUEylq8ZORgz0tbiD8VDXSaGsE1x?=
 =?us-ascii?Q?bKn17N1PZzHydBOvNCgmYl5WCt/BKvk3q6Y5QpViyh/Sbla4lxI2X96ILSBq?=
 =?us-ascii?Q?imMbbuhtPUeylyXo8UKc9fThFxGvSFiL+2JN/unUV2Pz33pkE/cV9JP7CN0W?=
 =?us-ascii?Q?7CKGGFDxNG4/xol4KtYJ2T5HCIgyYi43HnsMcgvRc5fCvPBUVxhhhV/ZyCPx?=
 =?us-ascii?Q?vMe4+sMWN+BR0vENxXmt3XSVteqOXEKB6daEtMPIcg4QynOpLICcfkoY0lv9?=
 =?us-ascii?Q?Bj2QjMzGbaiYh8oQBA2TG1kGAc2k2ZPAKyWMt+bNfLioGWh9/wnWAz1iQ7NP?=
 =?us-ascii?Q?soKNtQ2mnfa/4RRv5N3+uJfsI3hpHldyIc2PWod5q++7ZGMgnTlj6Pv1PFQY?=
 =?us-ascii?Q?mXi0OJR+zUGtfUjb09j3nWFUePQlFjzITMB6l0hKXmmTLcAkp2fEYWy7Unk2?=
 =?us-ascii?Q?0t05vlLPf8aGUsOD8Y63s+lBXTgeJZpyY8TpqFu7SQxTX2tx260msjBqV+AH?=
 =?us-ascii?Q?8mBvw6GKaUJ7GsN+vbnJMHiWqE++EAo9mgj74FmAUPgFLJ6k243/1GyCQmEg?=
 =?us-ascii?Q?CWGVI2E8Rylh15xjyqABesElXoIdHtWzUNzNf8W+tIpeJ1pVyESwvicXjBwt?=
 =?us-ascii?Q?/TL2mHqw4FJ/mWi+6yqGh+K/P7IFIXjiNByjGSkSvrYqbDYltHyeBtYJDPIT?=
 =?us-ascii?Q?f3wEK99wz3lGPIrhJfjDdS+L7O709hm57jlJh+yRcWWCjzsUsTd9GmLL4+ex?=
 =?us-ascii?Q?BEGdqrUPGBFF2Wt0YkMZjkSW0kUtjGEMPyAHDsnUm3tiWW2bmo+wjM57t9NO?=
 =?us-ascii?Q?f1mhjOgoP6TcOmh5gHzvMiosi7h/BmPyIETnk2BHP6Q0ToqnqL/Gl/MO/45K?=
 =?us-ascii?Q?dmhSpnVVvuS+2OxMc0Pm3cZsDMaRcfxLDgdQ78WGanwzXJKlHrggRuqnj74g?=
 =?us-ascii?Q?RjEBEV+gzQRGCfPrnn6rALvukRPBA60FC7SITTJi4VgpAF2KB5fIfqPwa/CR?=
 =?us-ascii?Q?dz8lUYvUnokvtbf6xRXRJqAgDS2UhKU/E0kOrskDSYDS9gLztA4rTUHlSWm3?=
 =?us-ascii?Q?qeleGWBfJ6F8naDjviak1MOBO6CUWqUCWbhR8Cco8UpFrIukB/UGZZ5KgOk0?=
 =?us-ascii?Q?v4MwUChngbGy3UHnfm0r2PV8zANmT2VJFX6rvu3XyBWNtjZLtywFBXLExGc3?=
 =?us-ascii?Q?1/UwxuVm/9JW7zyhbcL79MyzI+BfT6wF3Fzp3BnXcXq6OXc4+r6hto0ag/yq?=
 =?us-ascii?Q?20b20rBt2/2XfBTpewJ8JOuYMEFgxlH1mbYpFbYbXMZuyf9K7/dprJy3r6fU?=
 =?us-ascii?Q?HQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e7386b3-f7c9-437c-6fed-08dcd9bd7cc5
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2024 21:45:04.6441 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nEiVdEzC3t4LaI6ISHL5uffKxHsBoQ+0ukfIHlBjYC3xKI+/zOEbi7AAT4aJf8/7ogo1sYyeXtCT0ixUP1ZD4VA/toHQpBXBnlXCpji0YP8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7808
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

On Fri, Sep 20, 2024 at 09:58:14AM +0530, Ghimiray, Himal Prasad wrote:
> 
> 
> On 20-09-2024 04:12, Zhanjun Dong wrote:
> > Update lacks source flag to include resource is null case. This will
> > prevent null pointer derefrence in xe_migrate_copy.
> > 
> > Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_bo.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index 5f2f1ec46b57..5e8f60a8d431 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -682,8 +682,8 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
> >   	tt_has_data = ttm && (ttm_tt_is_populated(ttm) ||
> >   			      (ttm->page_flags & TTM_TT_FLAG_SWAPPED));
> > -	move_lacks_source = handle_system_ccs ? (!bo->ccs_cleared)  :
> > -						(!mem_type_is_vram(old_mem_type) && !tt_has_data);
> > +	move_lacks_source = !old_mem || (handle_system_ccs ? (!bo->ccs_cleared) :
> > +					 (!mem_type_is_vram(old_mem_type) && !tt_has_data));
> 
> 
> Just for curiosity, isn't !old_mem implicitly taken care here ?
> shouldn't ttm be NULL, if resource is NULL ? IIRC, this was what Thomas had
> confirmed during handle_system_ccs implementation.

Drive-by comment:  If this is an invariant, it might still be worth
adding an xe_assert() so that CI can ensure the condition never gets
violated by future code refactors and design changes.


Matt

> 
> Thomas/Matt,
> Can you confirm here ?
> 
> BR
> Himal
> 
> 
> >   	needs_clear = (ttm && ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC) ||
> >   		(!ttm && ttm_bo->type == ttm_bo_type_device);

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
