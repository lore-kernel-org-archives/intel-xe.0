Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C799EE7717F
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 22:12:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 892C810E65C;
	Thu, 12 Dec 2024 22:12:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ApAtmaVc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FD5510E309
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Dec 2024 22:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734041556; x=1765577556;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zl3IS91PCnsaNynCD2P910ib/cCRwXwSNETcgu5K/qs=;
 b=ApAtmaVca0OeM+Scv8J/oi5u8MmN27ODX+NdWuqeuUPD9Jthp7PGUWUD
 7I4IdhhFsSnRsS4wcnH1BFQ1WNvuc1rko0ZPlAQ/JAT0hgbcK1coH10cH
 4QXK8B6EczzRykzKCEFm+iSKLqKlyxqLHupdBtEkZau+y+B+IUT99wxNm
 ICeA6QX9d2UJ+b8DFFi3L9MWfX1toR6vu4BV/RWinyrbY819hKf4FbBTQ
 Kr8y7FLZpCjOtr8qtUrcexcXBTzfefo5uXWmojIUVLbLsAWaOmp5mgGzv
 42RDRqDfol2NZALejf62919mbcVeqV8UCx6IufN0AkLsdHuAYLLXdTYfG Q==;
X-CSE-ConnectionGUID: WNkWeYRzSXaa3frAS2V+yA==
X-CSE-MsgGUID: udypyJuBR6WZ1vnZBk0AQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="34356475"
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; d="scan'208";a="34356475"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 14:12:36 -0800
X-CSE-ConnectionGUID: 8i48VHPSTFKFxAXQOjx24Q==
X-CSE-MsgGUID: zHfIt9QyQ5exrlQB77v8Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; d="scan'208";a="96898138"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Dec 2024 14:12:34 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 12 Dec 2024 14:12:34 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 12 Dec 2024 14:12:34 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Dec 2024 14:12:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r7yR3ganOzylDWnzLf8TaG3eIFGMa93weEGoli6VAbdwONWlN2bKQJq8ZVKUcSSEbPdvQNJtGkAri/uMcXt/kp0JNU+SQe4tD7yH/QezgtUsFF39RRjrL24INV6smySN6x+E19+2XFAkWJn4NoU8QZYgDgAQuQcNlbdvAhQ3kCHYLfTVPY2/WQhKGvUa8+lNBUoLK0cvTPj5sB+ZkC+0+E8xMGK0s/MGWHD2rEZdES7eySeh5jAgjVLZUAuFkNBtczQi9ik0/r4xyf2NkKH/vYRiy2RES6JVLR7Uyxw58GYl1oTnB2T/mU32OnbIPKeBZbqU24ziFDjRIOLtZCM0yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kUPB37BP1r5ZKL5F3qOmyO2I3DtQKzib13Z4B4eNgO4=;
 b=PFl9w/mYPlM+OPTmTh+yVL7Q/OuSQ2YtH8Uts2d9S1T+UR2QbJOqCq2ljKvExBlp98VrGXJTpUJeMGJU8TgUDPX8AFEusLcOK/+v28zaHiPOGoYr2BHDEHkuPr9vz9OLO7EDDT4f1o2H3SIFYPinpVXnbOCi+h+joLJCPFvSjY/zEhkU2gMIMo35N8zTqkVnRI9DaY+0XgeCJhUZnklrqyDXXINXsmcbr1CP73153+9LHoEUpRfyRYd5CFACjQ7GNBxtxHQWdERwgTh4E2LKXjAMjhUEBXe1wwE59+jFLPEzu8xsJvme8fxeEEu7014p1cMfKjS1P+usK8qA0t6AfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by BY1PR11MB8128.namprd11.prod.outlook.com (2603:10b6:a03:52c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Thu, 12 Dec
 2024 22:12:16 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%5]) with mapi id 15.20.8251.008; Thu, 12 Dec 2024
 22:12:16 +0000
Date: Thu, 12 Dec 2024 14:12:13 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Maarten Lankhorst <dev@lankhorst.se>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 09/11] drm/xe: Make it possible to read instance0 MCR
 registers after xe_gt_mcr_init_early
Message-ID: <20241212221213.GU3224633@mdroper-desk1.amr.corp.intel.com>
References: <20241210083111.230484-1-dev@lankhorst.se>
 <20241210083111.230484-10-dev@lankhorst.se>
 <Z1r0uUIBK4sNpC0j@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Z1r0uUIBK4sNpC0j@intel.com>
X-ClientProxiedBy: SJ0PR13CA0030.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::35) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|BY1PR11MB8128:EE_
X-MS-Office365-Filtering-Correlation-Id: a8f73100-4e35-4a6f-90cb-08dd1afa095a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZWLS3/06mK+8bhvGPO3lpHtPxLpo8QOn2/c/mbTFcmEIMoz68CD5NifE62/m?=
 =?us-ascii?Q?BYvkGfxD/LeF5iiH+HPAet7pVFvC2ZOH8ttwW+iHqbvdZH28pGMhUs9PCA64?=
 =?us-ascii?Q?UyBkwA860GUyNeWVAjAMePxZTdx98axgUCsaizk5Yp688eYkAsfutYpbVWms?=
 =?us-ascii?Q?WUkcx4VnHXGDt/6zJKaU8rKAvw/ugdKd016LLxie3z/gNZ/oH8YCkLndQMX0?=
 =?us-ascii?Q?7GcXkXzO5uVuephEZ7oxTd5ayzPpp95mpm6ZhIDX0aOGvKpC2tk9brdZfkGM?=
 =?us-ascii?Q?zy6Ia9q9JSLCpCjlrvitHIZLP8U/Va5bkMY+CfiEUP8SCnsygHpcVbwy7feT?=
 =?us-ascii?Q?W8T6w4S7y1s+ytIiTkwogAyEKAj9zzQPri1VzjsSXgq4V7DiWxlrmA7SRk1r?=
 =?us-ascii?Q?wQ+v2z9j6BVe/t942XnMzMfBpb3Mk8gBHRZSlm17/1tGijnOun5sDQGqWjG4?=
 =?us-ascii?Q?lo9xkhY+flLg6NQauz1Fn0pBcAWTkjhU2ZQ/e8SoFlZoJtUtz3OTtw9uCVv7?=
 =?us-ascii?Q?oC/MgC9tykOcdfjXgu3NOge8q9Hf9yHzXbFwP5smlxToevxBAie+jhcEGjGE?=
 =?us-ascii?Q?gLxHt9F3o75C0dAn/ORmdeJAa9h3B71jqCcrZetZWcT+dcaoyCXQef5yyzvB?=
 =?us-ascii?Q?EsjUBDmVYrp5K/dfGHha/Pk30mb9UqaeLqzF2NPIEygfrQCow6P1AVGnXBa7?=
 =?us-ascii?Q?LxLPE2LC/4sq++HqQtoTGd+g+kq5HB89LFXViuQabEC2uQtS84a0FPIQ3M/0?=
 =?us-ascii?Q?ZkUEv3RuRhqwQlALqYz4rZ+Is0mjo5h81hfFakhKV+ccYQd8WEnKYPjYSQsJ?=
 =?us-ascii?Q?dRNTQlMep0LSSrAi3g08KawXbwMPsb1cMQDyDB/K9OyD+fqoSiKOldASQJYU?=
 =?us-ascii?Q?HGN7fjHCFNRnztviB4XnFEJbiwp1PjmQK+dqODo1falWUX74+lZUq3GrovNB?=
 =?us-ascii?Q?HEwih2gmVqBwrnRv3Di5gT6UhDibjq5/xMZAwMJZpYDp9Is1AXTUfJkyw4tJ?=
 =?us-ascii?Q?2ZlZOviyablxKd6dqFsA+Hj1/8zhfvr/l3sZRkrNCB7IeOB86Q5dbpgvldXI?=
 =?us-ascii?Q?GBQ+VSqh5MFiZ3x8FNeQmqlHzRX1VbY/ENL8Ut73MWiACPzSvMjVd4jhl4GP?=
 =?us-ascii?Q?YSxD0b/WK5BHNTAGBtgc1p/ncMZvmLY9dNd0csihlPQp7YdRSYEZhGY6+NJV?=
 =?us-ascii?Q?/Jf38gqJt3KMORd8hs1ohonSX35m42NKqRxgT+f/BQNIKvpAMzRrLhRd+jpx?=
 =?us-ascii?Q?4nVmfeuCBN4NzSFa4C41MCj+RMMuvojZoTTnfXZzN6JOzeXApw5dnNGseO6+?=
 =?us-ascii?Q?OcPI1cjyI2A7Mngzfmn3ahUyU3wOfgHMa97EYbfS+DlONw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VcLZyXyoDqEtcXmkkoN3w9qYh+D3sodaAD8EUHd/ZwF6qZR3x8ItiSSDrd9B?=
 =?us-ascii?Q?MYz/RTKeSHm8OXBFdLDYAijnXgN5WP4OvD/QItDINjRbGFnc1cVrz+kQGlm3?=
 =?us-ascii?Q?e6X5rKhqNvoWhFLYBtB3xelgBhZq9kqH4924zaBhWdWkaAQkMY9+lldyxUh7?=
 =?us-ascii?Q?0XueFS9WiWi8kBTCYGR1lTcxV2lfzO7qP9Qzr2U76hS+/aP4zTYQb6LUe6bz?=
 =?us-ascii?Q?sHyzl3l19XYuka0KCYT2j/merYivW5B+0s7fEIts0vHx6cckgNmjX7IGPZSK?=
 =?us-ascii?Q?OHFyM+JNZYq9Pid2ntfTwEmM6tipPh07VbRK9nrm1cyOYJgTHgcQNNiXRKkE?=
 =?us-ascii?Q?M5Z/+oSP/cyARjTqjCTyp/h1MxteOW+u8oGyimxOO0lkQeXK4gA0Y96/ZIAw?=
 =?us-ascii?Q?u/V+4FXFnYv3x6z5mCDfRQEU313bfBM6Z8OANje3oc4qDugPO0CcL6V7Cqrt?=
 =?us-ascii?Q?ovcnTYFDdNlN8vlo87ns0rX8wVjB9cojj8ZAyXbZt7swvuuTUklE+10wj63I?=
 =?us-ascii?Q?V6vz+V+LyTP7XzNtFXlMtvZPgfRYVBLYrfieYSdf6uY7NpP4jGBY/Nlfsl6l?=
 =?us-ascii?Q?syKpCHm0Zke7fLOgPjf0jyh0wBErORHTTB2ELkALpyLNG0kK25S5+4Z/K60Q?=
 =?us-ascii?Q?vn5I25g/SNwhegMqVNX+ka5m2sJTh6d9OQNvynK6cJpyhMKbXRzu9ffmaOKy?=
 =?us-ascii?Q?1kcGSVQ4SqTItODdwUTZVYIT6L3ny2A/skNBB2ZdhnlL+raLNYoQyDhYWSZr?=
 =?us-ascii?Q?j+K2yQ6H/h6FDVD7MSpRR7b1aVwLWyFIx9q3upvPY0Aq5/wlMPIiKFQ3W9Xr?=
 =?us-ascii?Q?Rh91xF7r4oxdZ9qK41cexkoWOazUT3FD4Y0LFNSZ3c5o7TCXPjniis1I9VuR?=
 =?us-ascii?Q?b6vVhHxLn4RdWM0FcrXx41LNTGCMd+Pr2fOvTEle4Ujg9r6hHp5IpnnDn8Jy?=
 =?us-ascii?Q?wJsDEz599fczU0DusVE9jTLwQYWZLhWUpI9z+cbCvnGmbq5kf0q9/aE0+D5U?=
 =?us-ascii?Q?IoqjxjNkzaD06IQsKZrbxEPYO4Bwr9pKASxye5t7Xof8kG9El7qC8LlQs7Cc?=
 =?us-ascii?Q?QuoNMtUm3R0tYDNNbgHCLSsZk0w8wW/+/DqrfKsBlq8UVe0Cd0dRDaajdSD7?=
 =?us-ascii?Q?Lwls9N2jL+Teg385j85eW1S8r6LnfL6wTU3Yj4HANkbCrhghouYUBm4FQm7r?=
 =?us-ascii?Q?meiG/IcDXx4dRJnLTxqinGldsvZxHjuKg48cxrHp1LIkTEg5Y5TetaU5GYqB?=
 =?us-ascii?Q?o1Tragb8r2O1OAh4IUe9OjbJMgeNk+fvAfTHO3yemLAKC6+C0DbuX2p4adnf?=
 =?us-ascii?Q?XPB0WRDc13QWT/jCTuy9E74hYlaVh7XlXSOaugswk+7f7nni2UepVsIpx43T?=
 =?us-ascii?Q?VLQ4kg/dvOoI0YsXPcnI9eHanFpTM0ukGSoiYm62+wCu/xLpS2pNVxhSeF2m?=
 =?us-ascii?Q?hKcEwNdTCNJzwPlVkNUvGI+byG8tiuVLpmZD1hmfwcFWxih+pSX9ye/Bf1E8?=
 =?us-ascii?Q?OLDGKo56DMoLC4EqlhI7+SuUS9aX5XXx6J0JG0XSOTJTIxOr+VvVGjxQ05QT?=
 =?us-ascii?Q?8IjHTShCL/8LdYeUtq9gX778ZifomAdtxXtkA9ED54gS07ho0hTFuF+ECRW3?=
 =?us-ascii?Q?VA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a8f73100-4e35-4a6f-90cb-08dd1afa095a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 22:12:15.9093 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FaCmd0N8FtiLq3o+dc6PyHe2xj9hGC0OrnudWSEkgaykq/DJCK4qkMR6iUTcjbBNNS6xN2GCHhNBvhKz36cuKefxYhxsk7urJXdh0d4dk5U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8128
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

On Thu, Dec 12, 2024 at 09:35:37AM -0500, Rodrigo Vivi wrote:
> On Tue, Dec 10, 2024 at 09:31:09AM +0100, Maarten Lankhorst wrote:
> > After mcr_init_early, we need to be able to do VRAM and CCS probing
> > without hwconfig probe. Fortunately the relevant registers are all
> > instance 0, which fortunately means no dependencies on further initialisation
> > is required.
> > 
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


Minor nitpick:  The Xe driver tends to use American spelling rather than
British spelling; not sure if we should switch to "initialized" for
consistency with elsewhere or not.

        $ grep -Iri initialize drivers/gpu/drm/xe | wc -l
        185
        $ grep -Iri initialise drivers/gpu/drm/xe | wc -l
        0


Matt

> 
> > Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_mcr.c   | 47 ++++++++++++++++++--------------
> >  drivers/gpu/drm/xe/xe_gt_types.h |  2 ++
> >  2 files changed, 29 insertions(+), 20 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> > index 5013d674e17da..4b23c96290046 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> > @@ -413,12 +413,6 @@ static void init_steering_sqidi_psmi(struct xe_gt *gt)
> >  	gt->steering[SQIDI_PSMI].instance_target = select & 0x1;
> >  }
> >  
> > -static void init_steering_inst0(struct xe_gt *gt)
> > -{
> > -	gt->steering[INSTANCE0].group_target = 0;	/* unused */
> > -	gt->steering[INSTANCE0].instance_target = 0;	/* unused */
> > -}
> > -
> >  static const struct {
> >  	const char *name;
> >  	void (*init)(struct xe_gt *gt);
> > @@ -429,7 +423,7 @@ static const struct {
> >  	[DSS] =		{ "DSS",	init_steering_dss },
> >  	[OADDRM] =	{ "OADDRM / GPMXMT", init_steering_oaddrm },
> >  	[SQIDI_PSMI] =  { "SQIDI_PSMI", init_steering_sqidi_psmi },
> > -	[INSTANCE0] =	{ "INSTANCE 0",	init_steering_inst0 },
> > +	[INSTANCE0] =	{ "INSTANCE 0",	NULL },
> >  	[IMPLICIT_STEERING] = { "IMPLICIT", NULL },
> >  };
> >  
> > @@ -439,25 +433,17 @@ static const struct {
> >   *
> >   * Perform early software only initialization of the MCR lock to allow
> >   * the synchronization on accessing the STEER_SEMAPHORE register and
> > - * use the xe_gt_mcr_multicast_write() function.
> > + * use the xe_gt_mcr_multicast_write() function, plus the minimum
> > + * safe MCR registers required for VRAM/CCS probing.
> >   */
> >  void xe_gt_mcr_init_early(struct xe_gt *gt)
> >  {
> > +	struct xe_device *xe = gt_to_xe(gt);
> > +
> >  	BUILD_BUG_ON(IMPLICIT_STEERING + 1 != NUM_STEERING_TYPES);
> >  	BUILD_BUG_ON(ARRAY_SIZE(xe_steering_types) != NUM_STEERING_TYPES);
> >  
> >  	spin_lock_init(&gt->mcr_lock);
> > -}
> > -
> > -/**
> > - * xe_gt_mcr_init - Normal initialization of the MCR support
> > - * @gt: GT structure
> > - *
> > - * Perform normal initialization of the MCR for all usages.
> > - */
> > -void xe_gt_mcr_init(struct xe_gt *gt)
> > -{
> > -	struct xe_device *xe = gt_to_xe(gt);
> >  
> >  	if (IS_SRIOV_VF(xe))
> >  		return;
> > @@ -498,10 +484,27 @@ void xe_gt_mcr_init(struct xe_gt *gt)
> >  		}
> >  	}
> >  
> > +	/* Mark instance 0 as initialised, we need this early for VRAM and CCS probe. */
> > +	gt->steering[INSTANCE0].initialised = true;
> > +}
> > +
> > +/**
> > + * xe_gt_mcr_init - Normal initialization of the MCR support
> > + * @gt: GT structure
> > + *
> > + * Perform normal initialization of the MCR for all usages.
> > + */
> > +void xe_gt_mcr_init(struct xe_gt *gt)
> > +{
> > +	if (IS_SRIOV_VF(gt_to_xe(gt)))
> > +		return;
> > +
> >  	/* Select non-terminated steering target for each type */
> > -	for (int i = 0; i < NUM_STEERING_TYPES; i++)
> > +	for (int i = 0; i < NUM_STEERING_TYPES; i++) {
> > +		gt->steering[i].initialised = true;
> >  		if (gt->steering[i].ranges && xe_steering_types[i].init)
> >  			xe_steering_types[i].init(gt);
> > +	}
> >  }
> >  
> >  /**
> > @@ -563,6 +566,10 @@ static bool xe_gt_mcr_get_nonterminated_steering(struct xe_gt *gt,
> >  
> >  		for (int i = 0; gt->steering[type].ranges[i].end > 0; i++) {
> >  			if (xe_mmio_in_range(&gt->mmio, &gt->steering[type].ranges[i], reg)) {
> > +				drm_WARN(&gt_to_xe(gt)->drm, !gt->steering[type].initialised,
> > +					 "Uninitialised usage of MCR register %s/%#x\n",
> > +					 xe_steering_types[type].name, reg.addr);
> > +
> >  				*group = gt->steering[type].group_target;
> >  				*instance = gt->steering[type].instance_target;
> >  				return true;
> > diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> > index 6e66bf0e8b3f7..07c332ff7aa80 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> > @@ -375,6 +375,8 @@ struct xe_gt {
> >  		u16 group_target;
> >  		/** @steering.instance_target: instance to steer accesses to */
> >  		u16 instance_target;
> > +		/** @steering.initialised: Whether this steering range is initialised */
> > +		bool initialised;
> >  	} steering[NUM_STEERING_TYPES];
> >  
> >  	/**
> > -- 
> > 2.45.2
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
