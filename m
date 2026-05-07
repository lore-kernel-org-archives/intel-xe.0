Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2BF3CD3439
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 13:53:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 932C410E291;
	Thu,  7 May 2026 13:53:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DIstHj4J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BAC510F164
 for <intel-xe@lists.freedesktop.org>; Thu,  7 May 2026 13:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778161999; x=1809697999;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HpE4XrcEnrTRi/hJmDoKwJKkBfkfAvNmXsLssvSEiv4=;
 b=DIstHj4JFT8+rIBIbHbu6O5exT+qM7sUKeMiY05UoccInpgnPtXhisYo
 ESysmrHVzEzT5Zo/WKbAWhImDm1bJqIuIRme+JmxCDbYzNOkkFlBoRnbX
 9g7x47SMEYZhQBmuElOdvPIyaQafAtL/4WAMhqEKkaHvEBlpOAoUPG+1C
 o2raZg1t7c1m7J7GfI2CHLmM36PoBabD0PM3FAWdjByQcXYS2JsW1aR3C
 Fh60SBqQtSgPjW9bqFoPyiIKKQVzdHIygnJUU+4ucKvwALt0lJAKO9fj5
 oM2Lzrb7TpAQ96+Yujv/XCsO+zQh+D06WWicn0n0mGIXLVVlqcteCJ1r1 g==;
X-CSE-ConnectionGUID: PQQHvBkkSGKlUVPWk0mGCw==
X-CSE-MsgGUID: 9ZZYym8iSSS0nTv7MjYcTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="79012572"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="79012572"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 06:53:15 -0700
X-CSE-ConnectionGUID: R1i74MjtTLW4X0yk/dzhoQ==
X-CSE-MsgGUID: GjHOYVXqTQSIR2nqe8Hx+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="235636273"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 06:53:04 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 06:53:02 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 7 May 2026 06:53:02 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.37) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 06:53:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mm7v8+DLp5MhKVaOt9WMRQ/vg3DLIgaCxR+9spZt48Op5AbOkwCB+D4JCzyYtYtjcxiZxBED14JbNsz6GzWc1TJG4CSPnhJj/lN6O0V5lcug9MoQ9gsc09yvy39d7g+SIl6p+q5o81rajLp5px2emLdGxJrhtps2TJVFDedMQBHRX6g3O5w8WUoVUgP9JszyUQ6hQCrCtvE2BhS0NeaI7FDsYwykZcNuwHfmNPYVMOY9ej+9e/YKPjVo38VZnMjsJ7kFZnJpcuaRE8jQCuvr2iJZX6GEJMu1r1/vWxMTA3OVFcfEOb0uVhCt1oInUyiPZfbXUJKj8T3wA+QxDilm1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KOhn1WGMyoOE2XO89mKwJ9BfVCfTNAnr/vhueEBFQbw=;
 b=KtKeGfr+B2QbrHcoRLFUAfP8q7eFnijALva04j+0pCtKJThdzuD8AK3SX9bcN6MsnWb4pKgTXzSBpml8LFEP35J6MTvOrLB8BYnNUdWCMkId5uQbO35wi/QNl6qVBEOj2HeLkYQecb6lYghpZGp9ZJXADPEcUViiOAkrTw8vz0dhUYo1sGbwrtPblgfjvLd06WV900778UxlazOnq4JIbh5RyWBcCncQZesRKK+5TGS7G5cbXO8qcsw9MtJM8K7lRMOCR7qmqdu/ykqWZYW/SwIRUsMmfO0nGTAQ92vTLbN5o3fltt0rkiX6ls8iJ+wH5sfZl3WJhWjznPNid6MMGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by DS0PR11MB7735.namprd11.prod.outlook.com (2603:10b6:8:dd::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.18; Thu, 7 May 2026 13:52:55 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277%7]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 13:52:54 +0000
Date: Thu, 7 May 2026 15:52:47 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Maciej Patelczyk <maciej.patelczyk@intel.com>
CC: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <stuart.summers@intel.com>, <arvind.yadav@intel.com>,
 <himal.prasad.ghimiray@intel.com>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v4 09/12] drm/xe: Add pagefault chaining stats
Message-ID: <afyZL1FY75IAkl4H@fdugast-desk>
References: <20260226042834.2963245-1-matthew.brost@intel.com>
 <20260226042834.2963245-10-matthew.brost@intel.com>
 <68a2f0a3-3f22-43a0-9604-b27ff3b5a65e@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <68a2f0a3-3f22-43a0-9604-b27ff3b5a65e@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DUZPR01CA0007.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::11) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|DS0PR11MB7735:EE_
X-MS-Office365-Filtering-Correlation-Id: 59d9e723-1477-4950-0176-08deac3ff03a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: SKvlIZRNyPq9yqNFzcdrz9Le+WA3V1lD6LMNcnUAu3F9IPy9N6o7VJlwkS0NOXHDUBVvtezvWizILC5L4pz6cO78QKx0nH0/wUi9ByQAC2pTFTRwl1wMhzoI//XWVCMkydkKUVuOiUFEKmHKj2cY3yiUpNJs03HLF7buUd2IuubhoERvVwIOhiYWO3BMrszgj8uOAEIRvoCiukglNMxNvaPbSMNG3QEOz6V8N89daFQgrRyy+dSIOIjFa1YAVuj7qHk4MOt/3Y45jLmBD9f4E3F/ahjha6A7Nw79t8YkOC5FluRArQcTDv/akhOxl2uCNw3ywyNVZnoED81uSh6B+YaSaBc2UoFsMo4skIGGNEAPzB1qgfKjbWmhzy6cSY3Btx2LNN9RiHNoenZTUxVJ5lpsMsa1IE6a74kRTiaG2LAxA3KQ+TixymT11TxCxtor1rP3JrxHR+cBzWTvhCKBOH+i2xNNasA71+o0AwTRO76G3fDRI9GCRLvWdluY+VejzefLxR5zODD9nuVNGnEqFxDKaPmpl9S9rOqkmFSPBWYyC/hElrTs4X0jE15oIw5Fk40B21zZMLzeiN4XArNXEhANM5kdNjlgQqr3Nhm6VcFv3j+Rd7CAGNUEzhshK6gJg1Zmtb3ZUiPYIkh7UPxdON4+9HSUvkONh46qkVgjNXwvkBLyggdd6PvyUU4HmX9i
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OXmhYkwRsQe9qNvuuba54wLcrDMvF7LK1lQNQINheG3cSJJfyW2hUH1t1sFB?=
 =?us-ascii?Q?98tPC9xlGVoLaSh4Sj7YDk93SL505k2bIWW7jv2hzcbKt6h0g1g69v6cuoGG?=
 =?us-ascii?Q?3b2Hl2zH7h6l/P8FQoc0BFaIV32GMt7Hqwja/kpWNFd7yHEPQT48WC3CfGUb?=
 =?us-ascii?Q?rizH3ltx2g4YlARcZ8b0M0Q/Y/6Y63RPJIsshg8wmTQejp955Wd3IdfOWTP+?=
 =?us-ascii?Q?1JzAx68/usF5qMx8YitBctvkkV1ns27GfLH5u7Na0GZL41y/UrUR9ThT9zun?=
 =?us-ascii?Q?ah4JABVNgfPmGY6zy0cua4fuAxjx5+Ww8lLzrRRsb47N7F19f8wnr9M/bJIH?=
 =?us-ascii?Q?CXwjr3Hr3PD/ky22TPkoNdc4Ki+VRgoHjRd8ClKZCsrOw7bJvW6Y+l1BSsp/?=
 =?us-ascii?Q?Zca+e42256iSpE7aRuNhkboyO04T6r6hRE3Es59tO2HHA11381t/yPGm/JMJ?=
 =?us-ascii?Q?MmRqlDSgXLzvywkusL+SPf+qu7y6vBty0v+8aTOU0gnbKF8hyMTMpUyuXAzY?=
 =?us-ascii?Q?YYPA2JZo+FwP/0672KMctgeAkNaesBrVabv2rAlEyBWJHWaK3OCyI0/wN8ot?=
 =?us-ascii?Q?J+wONROLSE2uvhPs0NIp5zx0MryWwO7SRzX65rgTepCk7LC2ZL5zN0p2nnN3?=
 =?us-ascii?Q?5YXUoHuKs8Gx7ieZ9cc/f4L8z9XEtCG4qiXEYYVWYJRCQdGVv+p3RaFZpHVQ?=
 =?us-ascii?Q?YL2RIq601eyQmXmFnkSKG7Bzz3Z0/HtVn9ibAwauc17s5CcAicB9f6YcUNOh?=
 =?us-ascii?Q?b1sON4yUHSUhDXZsIo5l2cJO8g5gmsWVPzXx5oIaP5hIBjUM+bVEZKi8RADw?=
 =?us-ascii?Q?P1yAoVE0EplCr23/nRN81ry9Sjlw9g0lGbDetVXgO9bNfy8zh4W74ASKYf/i?=
 =?us-ascii?Q?LUvfCpS8M/U38W34l7KARYxcxf8OMuLNhPaAw4yNHas8UYnhL0eIK6u1DFQt?=
 =?us-ascii?Q?vp83FIV4lvhpjn2e8z4Cr5iTZVwQWlLZbv9A4IiNNp6imRW9GaMFQpckAe5F?=
 =?us-ascii?Q?ErujtwlOrQ2m2X/MC5fh8Fwup4kDvLxhMsapGl8+8bf8IpO8AIUS/i98MKWb?=
 =?us-ascii?Q?u69Yuu1bzRoVfAqvyxZf1lHgcnwaXlb02dpC+LqYVC000r4ImeplL664fAGW?=
 =?us-ascii?Q?9zqMEBdVSdCSrxrNXvtLTGa5E2GVAJadqNbs5FdX0On+zcHAa2sqSeG3zzPM?=
 =?us-ascii?Q?TMZCaIza2Df9XoCTs/QnJfPT7Fsoh56jpq43lkXt2MYGQulLXD6r/sgC3yr8?=
 =?us-ascii?Q?W9hOfEh2UH8RvlPnXEAa9pfZwWUH9c7/js2eCTte86lxdiLzS5Gj1FSB0Kl8?=
 =?us-ascii?Q?NE/HVxNWAOLJRtDzCf5heplDTDVssJhGCxvJu9EXWtXpeHubU155JM5kTrvT?=
 =?us-ascii?Q?05aIQv0F7bjo3Rq04JQA3UU8AzuamT0pM3fccYhPUk38A92rQ8MqrCqwgro7?=
 =?us-ascii?Q?WK4w7waRZDspxDCvmxNrHjwWNxEKXkoSk0hbu5H9vnx5MQmbh6r7uanFSdlH?=
 =?us-ascii?Q?d49sm+Q8wdqjp9E6uuUZm2/WAO+8IDLexUdtkw89LozGJTiA8S45KENEgPLl?=
 =?us-ascii?Q?9JAMcNQTA+sYLEPzRQXQBr65PRhhOfHvRL4q69QXMlVDaf7n/HZ5bnTcUAt2?=
 =?us-ascii?Q?lmPCSaqUlifNE/qIZ+yEkdlzHB/xWTYcGo2H51SgbAqf9Br09WIYXvTA+cu1?=
 =?us-ascii?Q?uM4l7+bM/K5uFA1GkgEIJiIzJDr8TFFUejr8rfnc/UuFzHNInAE/4feENZ4g?=
 =?us-ascii?Q?bREZhFwpgUrnABezOR1QO9JydcX83/A=3D?=
X-Exchange-RoutingPolicyChecked: WIODsp9kW5NF8EF5U0qG8EJJEgQFeYr5hFts5P+WeEd+FguCAxmuuiyn2+LEndQ3U1h7AhdRXNJZR1ZFKm9QXW9wgXLSbmU7D678uwpm6T3r0ofqjY8Ck6ysBIGB1RCos/v/VqZKGbWuSp8elOFc3uFvPi17syknZTgWTVKLUFrIMywxUYLhSG8sEPfyEYHje3whMO0OQ1i5HWwPotd0m8+yXtrw+LSNfb1nUPtEA78iH6KF87upozq6pXvC3BUrXSAVlAcgKWhhksTmH+TAGtJBCjK1eh0p2k/38Mk1eOAlmI7kx3uILP7u/Kfxrr2NuUsIilf/JtbtjcGiHXIppQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 59d9e723-1477-4950-0176-08deac3ff03a
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 13:52:54.8300 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KxuQ89mqbRXbL+cmlCbRZV7+W+agwqIvrwLxD0QE0s1ije85FHqkaD9vOwoFJpM3i5UGcWMLKKrYxo6ltoY+UIUzUtXcTwd3rEgtfOp1CeA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7735
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

On Thu, May 07, 2026 at 03:15:12PM +0200, Maciej Patelczyk wrote:
> On 26/02/2026 05:28, Matthew Brost wrote:
> 
> > Add GT stats to quantify pagefault chaining behavior during fault storms.
> > 
> > Track total chained faults, faults chained directly from the IRQ
> > handler, cases where IRQ chaining also drained the queue, chained faults
> > that had to be requeued due to range mismatch, and cases where the last
> > serviced range allowed immediate ack.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_gt_stats.c       |  5 +++++
> >   drivers/gpu/drm/xe/xe_gt_stats_types.h |  5 +++++
> >   drivers/gpu/drm/xe/xe_pagefault.c      | 18 ++++++++++++++++--
> >   3 files changed, 26 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
> > index c1af3ecb429b..cdd467dfb46d 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_stats.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_stats.c
> > @@ -54,6 +54,11 @@ void xe_gt_stats_incr(struct xe_gt *gt, const enum xe_gt_stats_id id, int incr)
> >   #define DEF_STAT_STR(ID, name) [XE_GT_STATS_ID_##ID] = name
> >   static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
> > +	DEF_STAT_STR(CHAIN_PAGEFAULT_COUNT, "chain_pagefault_count"),
> > +	DEF_STAT_STR(CHAIN_IRQ_PAGEFAULT_COUNT, "chain_irq_pagefault_count"),
> > +	DEF_STAT_STR(CHAIN_DRAIN_IRQ_PAGEFAULT_COUNT, "chain_drain_irq_pagefault_count"),
> > +	DEF_STAT_STR(CHAIN_MISMATCH_PAGEFAULT_COUNT, "chain_mismatch_pagefault_count"),
> > +	DEF_STAT_STR(LAST_PAGEFAULT_COUNT, "last_pagefault_count"),
> >   	DEF_STAT_STR(SVM_PAGEFAULT_COUNT, "svm_pagefault_count"),
> >   	DEF_STAT_STR(TLB_INVAL, "tlb_inval_count"),
> >   	DEF_STAT_STR(SVM_TLB_INVAL_COUNT, "svm_tlb_inval_count"),
> > diff --git a/drivers/gpu/drm/xe/xe_gt_stats_types.h b/drivers/gpu/drm/xe/xe_gt_stats_types.h
> > index 129260bfdfe6..591e614e1cfc 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_stats_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_stats_types.h
> > @@ -9,6 +9,11 @@
> >   #include <linux/types.h>
> >   enum xe_gt_stats_id {
> > +	XE_GT_STATS_ID_CHAIN_PAGEFAULT_COUNT,
> > +	XE_GT_STATS_ID_CHAIN_IRQ_PAGEFAULT_COUNT,
> > +	XE_GT_STATS_ID_CHAIN_DRAIN_IRQ_PAGEFAULT_COUNT,
> > +	XE_GT_STATS_ID_CHAIN_MISMATCH_PAGEFAULT_COUNT,
> > +	XE_GT_STATS_ID_LAST_PAGEFAULT_COUNT,
> >   	XE_GT_STATS_ID_SVM_PAGEFAULT_COUNT,
> >   	XE_GT_STATS_ID_TLB_INVAL,
> >   	XE_GT_STATS_ID_SVM_TLB_INVAL_COUNT,
> > diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> > index 9c14f9505faf..c497dd8d9724 100644
> > --- a/drivers/gpu/drm/xe/xe_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> > @@ -364,6 +364,7 @@ xe_pagefault_queue_requeue(struct xe_pagefault_queue *pf_queue,
> >   					    usm.pf_queue);
> >   	struct xe_pagefault *next = pf->consumer.next, *lpf;
> > +	xe_gt_stats_incr(gt, XE_GT_STATS_ID_CHAIN_MISMATCH_PAGEFAULT_COUNT, 1);
> >   	xe_assert(xe, pf->consumer.alloc_state ==
> >   		  XE_PAGEFAULT_ALLOC_STATE_CHAINED);
> > @@ -423,6 +424,10 @@ static bool xe_pagefault_cache_hit(struct xe_pagefault_queue *pf_queue,
> >   			xe_assert(xe, pf_work->cache.pf->consumer.alloc_state ==
> >   				  XE_PAGEFAULT_ALLOC_STATE_ACTIVE);
> > +			xe_gt_stats_incr(pf->gt,
> > +					 XE_GT_STATS_ID_CHAIN_PAGEFAULT_COUNT,
> > +					 1);
> > +
> >   			pf->consumer.alloc_state =
> >   				XE_PAGEFAULT_ALLOC_STATE_CHAINED;
> >   			pf->consumer.next = pf_work->cache.pf->consumer.next;
> > @@ -559,8 +564,10 @@ static void xe_pagefault_queue_work(struct work_struct *w)
> >   		/* Last fault same address, ack immediately */
> >   		if (xe_pagefault_cache_match(pf, cache_start, cache_end,
> > -					     cache_asid))
> > +					     cache_asid)) {
> > +			xe_gt_stats_incr(gt, XE_GT_STATS_ID_LAST_PAGEFAULT_COUNT, 1);
> >   			goto ack_fault;
> > +		}
> >   		err = xe_pagefault_service(pf);
> > @@ -816,8 +823,15 @@ int xe_pagefault_handler(struct xe_device *xe, struct xe_pagefault *pf)
> >   		lpf->consumer.next = NULL;
> >   		if (xe_pagefault_cache_hit(pf_queue, lpf)) {
> > -			if (empty)
> > +			xe_gt_stats_incr(pf->gt,
> > +					 XE_GT_STATS_ID_CHAIN_IRQ_PAGEFAULT_COUNT,
> > +					 1);
> > +			if (empty) {
> >   				xe_pagefault_queue_advance(pf_queue);
> > +				xe_gt_stats_incr(pf->gt,
> > +						 XE_GT_STATS_ID_CHAIN_DRAIN_IRQ_PAGEFAULT_COUNT,
> > +						 1);
> > +			}
> >   		} else {
> >   			int work_index = xe_pagefault_work_index(xe);
> 
> Looks good,
> 
> Reviewed-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
> 
> 

Actually the patch now causes this warning during build:

    drivers/gpu/drm/xe/xe_gt_stats_types.h:186 Enum value 'XE_GT_STATS_ID_PAGEFAULT_US' not described in enum 'xe_gt_stats_id'

So please add a description in the kernel doc, like for other GT stats entries.

Francois
