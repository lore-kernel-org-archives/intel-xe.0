Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01236D64099
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 22:56:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA77F10E027;
	Fri,  8 Nov 2024 22:56:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GBegXys3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B67F910E027
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Nov 2024 22:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731106589; x=1762642589;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Zot3iXJeQ8/xb2EKOUlqviE/VeJQr+82xqBmGFeL2Lg=;
 b=GBegXys3EOCMPPAvuGft+IBQxl1V6wvgBi+jtQfsOfEw8Zkc44YLsVtc
 nP01PP1YGc96j54u3Dw2lmLXAf10SGfiAvOaOA0oIv7c0ntTv84sh/TUq
 ew866iZPp6+oLFqFHLcMyG9kK/fHKns3CGtTETiD3VDcexGZ6F99m7o1M
 ijIUB4y5v7tZKBACuUfD4fuqtxrDm1SoqBxLbbGbHXz4JM7GXr3B+dJEL
 Y20RJ58swF35QBZAtUlpMvCKcWlBSQk7i0Tr4POJYUWYf5R7u8eEoZ6yw
 82GTBTWptCq3XMjR+T1N80EvCxsc9VRA0QWJBkzzmKulM1zLu+bweCOfU A==;
X-CSE-ConnectionGUID: 0zbmW+5pThS3klF8z7vcQQ==
X-CSE-MsgGUID: wZW/aWbmRtim1oELq44+1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="31106224"
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; d="scan'208";a="31106224"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 14:56:28 -0800
X-CSE-ConnectionGUID: sMZzv85BTbeZE1QnI9kTWw==
X-CSE-MsgGUID: O5m46uPOTfmDnHzqo4/RMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; d="scan'208";a="116591869"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2024 14:56:28 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 8 Nov 2024 14:56:27 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 8 Nov 2024 14:56:27 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 8 Nov 2024 14:56:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H67N1+v1WxhsHCFbkWaDa7eCRehXEItz3EvNryTkF+oSQTXVy8ceckxlNwFE8PsgSYEg86MblXQyIDULIscEzz1p5bF3IKdSQQH5DHTuyFHPmHk57D/jwVvsC52OHgUgBb6UMUudn/LDuSdMuE8tYDBxj0lr9XNIpHGziRyaeCy425TlA19ZbwznWKY3bJUGDokmYRbK+0v1EMCSM10Hk0Q31zYinsP31vAvUjbrTOpHMMvdUJ7jAUhWj4JYKONJuoZ7u3elP/6egexBFD3dMjAd+5AfZaAhJ/R6kF7KTJF4IAn2hbs9m64n6e1V/7K9FQCAUugU2cCUT6Lxt9tbvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hZUsY8jl/nytz9/HJi07N+VtukXdH17uOdL74sNQPZY=;
 b=siF/0BGc8TIf3Lzvp7+wZNKF77/BT/xf/8l6V5pT5rD7WM1BKMSvkJBnL1/cNk/wfM1u6r+3txM9hiwu8rkl4hqaZ7uS1konuAxN9CDqDLVvZNkE5kUYapgEOfhLdixT4mIZWxOJCq3z9Sjd4FNyDHY5cz4WDEo9cMUSzptDeunfScvhc27dLOBabwF/9ISTN2WRgF4B9yJdFPR5PL11JbFIYrCH9BmKzSRctWDpTHr+p050MHR9fbOKqQYwu0Y3bUC2Ots0qpNV5QQsMzxNeGlosaw2k5iyDnlVV+eMPMtJFr5iuvpZyagiGphAlfXRgYKlPQdUcXqnCdQ4xpwlKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6290.namprd11.prod.outlook.com (2603:10b6:208:3e6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Fri, 8 Nov
 2024 22:56:23 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8114.028; Fri, 8 Nov 2024
 22:56:23 +0000
Date: Fri, 8 Nov 2024 14:56:55 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <alan.previn.teres.alexis@intel.com>,
 <zhanjun.dong@intel.com>
Subject: Re: [PATCH 5/7] drm/xe: Add exec queue param to devcoredump
Message-ID: <Zy6XN8JqT3tpLjYA@lstrano-desk.jf.intel.com>
References: <20241108174312.272792-1-matthew.brost@intel.com>
 <20241108174312.272792-6-matthew.brost@intel.com>
 <Zy6O1H7st17n-JoH@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Zy6O1H7st17n-JoH@intel.com>
X-ClientProxiedBy: MW4PR04CA0165.namprd04.prod.outlook.com
 (2603:10b6:303:85::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6290:EE_
X-MS-Office365-Filtering-Correlation-Id: a108d22a-1fbc-449e-4cac-08dd00489124
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?b1TOYPMW5FIRPT8WjUY9ZwGnRgVE2xe16eUvig2VlyxajQ+93o5ib1eXJ+Uh?=
 =?us-ascii?Q?D28GuKrkFRNZOPhLnsu5qPrbcGjmzzYkA5/Ufy+X54OtXHq72K69po8v1uq9?=
 =?us-ascii?Q?zzSVIABIi2guWQaVOSfsgc6xXcoylSog3ZYcpt3hSIzR0usNy4N0m0cI1jY5?=
 =?us-ascii?Q?iqUukxt/ftK2qZJ7JYzGC912HLrKlmmrVL3XEcrVavqED+xoJ6dRSjbq6h7Q?=
 =?us-ascii?Q?TL8VPl3YWhnhAfFlq/6S2QhEEGig7D/T+FMI1Sgu3Jub2nLh9UD7cU1xkCBP?=
 =?us-ascii?Q?hBI5yAPYBl0zlwk5VtPawpbNvzDYMhjcOtCSyNzJwdfXtLGnZXLPOs++t0pG?=
 =?us-ascii?Q?Pw8XI/qG0uQTHWTE28y/IwlgKrDVv4RJKc62p4gfLuFHWKSG0jRe+iruilwz?=
 =?us-ascii?Q?d1p91cM35oOUHL4NphLz1mXmxJtSz5JFlxKzsNMziFAYAD03GYF1mbR1zMpu?=
 =?us-ascii?Q?+FFDKMUhk1zD+AiW29nUIcSUln39/U7xV9W4FlG42k2vaVDtOjo/xEiiSHWp?=
 =?us-ascii?Q?sF/VnStLLDvVdfwMTJadyxwvoo6UjibNCggJ8sdb2k6nrzPSQe+IQeIG0QY5?=
 =?us-ascii?Q?JJ84MroMAxkprsy/tpp6HFUsHRIjXZsDuGDbJXb4y5nZwRtvHuYw9NAFGAqU?=
 =?us-ascii?Q?dIGjrlHC6vAwRWccnpGzynYHRdtu+Nj8xvmJNDXO3sqwc+VxZ87s7l3zpXor?=
 =?us-ascii?Q?TEV9KvRbe1/nBQYO8tjLI8rqNgk6D96+Avqff821PihnsKLjyd3TU5icWBWx?=
 =?us-ascii?Q?7MlDILPtKdVIyVdbnhDFLHxZiWRsTdqWRxsyqtRkH6EdljX8S76WVRnc6YKT?=
 =?us-ascii?Q?lu1GJo2HNRy/Wtt8WwW94xM8ayZ3xMmnoxNXkhz1zQv9eMURDbUGhufeZR9l?=
 =?us-ascii?Q?cBhGVOl0bnxmObVXnsqUyq68l1UPkA+MLs008xtElIDgLLvWBTmpI0ebBCfa?=
 =?us-ascii?Q?UvvelXPpNXSaTQhdiuNF7CWW/jmyCm8Yt4AqWPsDh0RKD6H4qYRpc2F5rRhR?=
 =?us-ascii?Q?bS8uG7oMaACYJT3Ra6DpoZA81xaqx1WLtw/HtCX/Ovi81Nv2/3i6wp8I3WJ9?=
 =?us-ascii?Q?+t5Nqml2k/LQY5cEuOZW0ipoF2GVkojzgf326QmGG3pDC7T5+MSyGkJ8JKUn?=
 =?us-ascii?Q?lmEGICoQNRD+QshG6KV6eHJWmxMBnB64rYQvGHetoX6t+V/eVQROlrwnZCFL?=
 =?us-ascii?Q?sQesss3o/q0zVVAZA2hvWRJiuDy9YOrZobhiQDWQGqGaHOwQI1ZgM5TXnTm9?=
 =?us-ascii?Q?0Ce1Ub/DOsvHQ+ZM9gWU5SFy7P1n1O0QFUCzn1EAbf5Jt/5wHw9bmmsvNHHW?=
 =?us-ascii?Q?TDRykgDXratriGBqt2466ffM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Gi/Ox8Fsu5RNpoz5y0+4YbgSS5waze/EMFxwk0guHjUvfkKH9W7U8cA4TvB7?=
 =?us-ascii?Q?XJzDd71qmfsx9eW6jooxyF4DbDSZSMwh8P3/jHJm6kWeHFP/c6EE6wxmv9dv?=
 =?us-ascii?Q?Jg/EU9XtmcyApRHHjWayPneUg+EUIhqm46K8vbJPBQUI31BnMAO+ejq/I0nf?=
 =?us-ascii?Q?vk0QvbGdbEJB87WZKgziPUBUBEfPzFuubnLbJCSRB+3RBelrnAhT3hw7sqyK?=
 =?us-ascii?Q?WVzAZolDip8kiIWHqE+UJD/OahPNlZXpseQFOYS324BDQZbhxnKpVB4yrqVU?=
 =?us-ascii?Q?RuBOtCANFUP1UKXZABEJCwOBOXQIJRdf5okT1fq4WBaltFzwawMWSsmlXbb2?=
 =?us-ascii?Q?dKq5H3BI0cD35kJ5nc80D/CKaNA33enWfhW9vTpeah/6hJBE+wipAOhGseA7?=
 =?us-ascii?Q?EhMPrO6hRKSz30Df4Zes6rRWsKW6Tg6vrw5wLfAHWDjytbi0B9UUAIjAKcTP?=
 =?us-ascii?Q?zx1VeCJtV0Pyxo864I6iOarrveml8RpzSS+Ueb5Q6YssTggjwucvYDcTIxFx?=
 =?us-ascii?Q?YFlilcAOfkSehAgEO6fycvGjw7kzRM9+Y2WUeW4pGk95/7IGqGP4sCMJWx5Z?=
 =?us-ascii?Q?3Xfv9IfEZdpJCIfaGDPsHBKvB3hRboFRGDnDNmWU2lj9MNjKbrYsnnwLNFBW?=
 =?us-ascii?Q?AGv+HlrSfuzFvCWYuPiZp/btUjGHWQAByHY924R8csZDRE3pAQT1RDuT2GEz?=
 =?us-ascii?Q?CqdQgV86YrmLrc3EtYkTMr/cOxdBK2bBbfH3F2cEs6ECWoGWF0swc7nEqtPR?=
 =?us-ascii?Q?t6G3c+2eVZ8/E908TY6RchWf9ssQ130ca4YyFmv42l0NHKxSvMK5pNOUqGZo?=
 =?us-ascii?Q?4wTaR9NTQn753VQdf1sOtBLnpsvfBRN8iPYP2B7gnb9njTKZJCEB7sfJ8cEY?=
 =?us-ascii?Q?N43+n6oeqkFAxfd0/h+E9ayyqjrD2WoVgJjEwTwyHI+vYNcZHPWZn6J+hILL?=
 =?us-ascii?Q?1OSCFNsXnS0Qzw8nRcgsYJDjafgMyAuj0fQCHnaQaHYSAJlRq6R1CgYr0CVq?=
 =?us-ascii?Q?tXoz3mYanHs/wzigFNKyAXHZYTRUd1i4JO+QGW9TFf7GvYLcY4ESMxeH2atk?=
 =?us-ascii?Q?chZG3h+HED7AhaoPMB5i+MM8UDZDFHwmmnw1rAdT6CT9ML/BP/hCiCbaAMj9?=
 =?us-ascii?Q?4WXUXSw2YAzrnea9Q1qS1Wfv15QF4BrNDwUuJ7JCcCbOqlp6BI9IBvzo1dQe?=
 =?us-ascii?Q?tolCg7tAtdbpbbq6x/bH3PpKPVwHhY4IJ/9DFSUHo0PLDYXFUSIzzB6tHl4M?=
 =?us-ascii?Q?0W3wDQQwpqzw4zBb/K4BPMLWhYg1kE0Kdveg/0qcK3SYwBj6sfKes2XN+kVC?=
 =?us-ascii?Q?LLXoU7PtngdHF5yct+Q3p/28R+UyVSDb7uNO1lS0g+cZ8MP6xegQioGEWiuw?=
 =?us-ascii?Q?3nIUvfIGNg0Pjo7IpN/BrLzOtVVZUOlgfFC9yqmRFM96ejJHMZiYZtK5Azuw?=
 =?us-ascii?Q?TnQNW0THIpTeUSglO3z8zkhZ7L68t5r7GUAfyal11IR55IHZlENYpz758/0C?=
 =?us-ascii?Q?zIr6cMDQb554KGQ7PhupDCGKlYLtYOITUaeILtNnXNuQkPVuN4hfAa5nCIRd?=
 =?us-ascii?Q?CyCVVxe1t5an2F3JE4dKKJ/Yzrq0R80JG0Y04ePT6zoVYeJynZ0Qs6qDJKr2?=
 =?us-ascii?Q?mw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a108d22a-1fbc-449e-4cac-08dd00489124
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 22:56:23.0656 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HrB5rXO4e6GBr/WIXXaQ8SxpUqCQZeF4YPN3jo8AjbpFAAOwbkPx/SYcft99tK1r4kuh379sVMvoB3DaAE4o0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6290
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

On Fri, Nov 08, 2024 at 05:21:08PM -0500, Rodrigo Vivi wrote:
> On Fri, Nov 08, 2024 at 09:43:10AM -0800, Matthew Brost wrote:
> > Add job may unavailable at capture time (e.g., LR mode) while an exec
> > queue is. Add exec queue param for such use cases.
> 
> why?! if so, don't we have other problems?
> 

Job immediately free in LR mode after run_job is called by return NULL
to the drm scheduler rather than a fence. This is very much intentional
and not a problem.

We can however get an IOMMU cat error or engine reset triggered from a
bad LR job which in turn triggers xe_guc_exec_queue_lr_cleanup where we
have the queue and want to take a devcoredump. 

Make sense?

Matt

> > 
> > Cc: Zhanjun Dong <zhanjun.dong@intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_devcoredump.c | 15 +++++++++------
> >  drivers/gpu/drm/xe/xe_devcoredump.h |  6 ++++--
> >  drivers/gpu/drm/xe/xe_guc_submit.c  |  2 +-
> >  3 files changed, 14 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> > index d3570d3d573c..c32cbb46ef8c 100644
> > --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> > +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> > @@ -238,10 +238,10 @@ static void xe_devcoredump_free(void *data)
> >  }
> >  
> >  static void devcoredump_snapshot(struct xe_devcoredump *coredump,
> > +				 struct xe_exec_queue *q,
> >  				 struct xe_sched_job *job)
> >  {
> >  	struct xe_devcoredump_snapshot *ss = &coredump->snapshot;
> > -	struct xe_exec_queue *q = job->q;
> >  	struct xe_guc *guc = exec_queue_to_guc(q);
> >  	u32 adj_logical_mask = q->logical_mask;
> >  	u32 width_mask = (0x1 << q->width) - 1;
> > @@ -278,10 +278,12 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
> >  	ss->guc.log = xe_guc_log_snapshot_capture(&guc->log, true);
> >  	ss->guc.ct = xe_guc_ct_snapshot_capture(&guc->ct);
> >  	ss->ge = xe_guc_exec_queue_snapshot_capture(q);
> > -	ss->job = xe_sched_job_snapshot_capture(job);
> > +	if (job)
> > +		ss->job = xe_sched_job_snapshot_capture(job);
> >  	ss->vm = xe_vm_snapshot_capture(q->vm);
> >  
> > -	xe_engine_snapshot_capture_for_job(job);
> > +	if (job)
> > +		xe_engine_snapshot_capture_for_job(job);
> >  
> >  	queue_work(system_unbound_wq, &ss->work);
> >  
> > @@ -291,15 +293,16 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
> >  
> >  /**
> >   * xe_devcoredump - Take the required snapshots and initialize coredump device.
> > + * @q: The faulty xe_exec_queue, where the issue was detected.
> >   * @job: The faulty xe_sched_job, where the issue was detected.
> >   *
> >   * This function should be called at the crash time within the serialized
> >   * gt_reset. It is skipped if we still have the core dump device available
> >   * with the information of the 'first' snapshot.
> >   */
> > -void xe_devcoredump(struct xe_sched_job *job)
> > +void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job)
> >  {
> > -	struct xe_device *xe = gt_to_xe(job->q->gt);
> > +	struct xe_device *xe = gt_to_xe(q->gt);
> >  	struct xe_devcoredump *coredump = &xe->devcoredump;
> >  
> >  	if (coredump->captured) {
> > @@ -308,7 +311,7 @@ void xe_devcoredump(struct xe_sched_job *job)
> >  	}
> >  
> >  	coredump->captured = true;
> > -	devcoredump_snapshot(coredump, job);
> > +	devcoredump_snapshot(coredump, q, job);
> >  
> >  	drm_info(&xe->drm, "Xe device coredump has been created\n");
> >  	drm_info(&xe->drm, "Check your /sys/class/drm/card%d/device/devcoredump/data\n",
> > diff --git a/drivers/gpu/drm/xe/xe_devcoredump.h b/drivers/gpu/drm/xe/xe_devcoredump.h
> > index a4eebc285fc8..c04a534e3384 100644
> > --- a/drivers/gpu/drm/xe/xe_devcoredump.h
> > +++ b/drivers/gpu/drm/xe/xe_devcoredump.h
> > @@ -10,13 +10,15 @@
> >  
> >  struct drm_printer;
> >  struct xe_device;
> > +struct xe_exec_queue;
> >  struct xe_sched_job;
> >  
> >  #ifdef CONFIG_DEV_COREDUMP
> > -void xe_devcoredump(struct xe_sched_job *job);
> > +void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job);
> >  int xe_devcoredump_init(struct xe_device *xe);
> >  #else
> > -static inline void xe_devcoredump(struct xe_sched_job *job)
> > +static inline void xe_devcoredump(struct xe_exec_queue *q,
> > +				  struct xe_sched_job *job)
> >  {
> >  }
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 2cf4750bc24d..974c7af7064d 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -1162,7 +1162,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> >  	trace_xe_sched_job_timedout(job);
> >  
> >  	if (!exec_queue_killed(q))
> > -		xe_devcoredump(job);
> > +		xe_devcoredump(q, job);
> >  
> >  	/*
> >  	 * Kernel jobs should never fail, nor should VM jobs if they do
> > -- 
> > 2.34.1
> > 
