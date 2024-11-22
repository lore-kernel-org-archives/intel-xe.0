Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5719FE6ADCB
	for <intel-xe@archiver.kernel.org>; Fri, 22 Nov 2024 22:25:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0A7010E31A;
	Fri, 22 Nov 2024 22:25:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iv/VwdJv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E7BB10E31A
 for <Intel-Xe@lists.freedesktop.org>; Fri, 22 Nov 2024 22:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732314304; x=1763850304;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=K2KcBHOWfWOR7HLht42B+2muRuxNPgjVJe5IwkJx6C4=;
 b=iv/VwdJvutMa6L4WRHyYazwfQEjeoIUU+abKX1OxSN5AaUnvtWkCTTEt
 NqhwvJsY0r1sm/aQC4jjkS0coI8/bSB2/kb+zDe4QH2E7I5cdFRKPd/WP
 cDGTgs+o1aEDsyGDRBK5AffQ5bkdrDX0JzHzUgyQSRUuddwNvnkeO7pP4
 jSXfa9s263PGEPYl/YFORfo/MGn6K6ozUsQ4wtqmr7PvGLcbRZOaAP51l
 s4owpSaH0riBi0GqdWieMzK53JRVIToxd7ZxRFY5uB462ySSNhRKcnKJp
 hvUXuxWOVqlBrtaoThahMW9DlpqXvJpymuNCfK2zP7+ikr/Cm9BoVX3sR Q==;
X-CSE-ConnectionGUID: KG61+YsoQ2Kkn9cuAxkAEw==
X-CSE-MsgGUID: yipib6XtR8uldS0HTY6adg==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="31872565"
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; d="scan'208";a="31872565"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 14:25:01 -0800
X-CSE-ConnectionGUID: TQQSi5XCQw6UXm8VPck+Gw==
X-CSE-MsgGUID: PbO2QvoyRD6T/ms8vuRWWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; d="scan'208";a="90508694"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Nov 2024 14:25:00 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 22 Nov 2024 14:25:00 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 22 Nov 2024 14:25:00 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 22 Nov 2024 14:24:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TPGtmuL5gFHDrc+Kuf4nLSOpq03/TzJLnEx71MS/D8gtc3G8WpwC82mTDKb8rM9rTh16BKOHE/Sq5pH1KJf6vvpV+vGdLvxngo0j8rCW88P59as4pvt3brqK6kqumKb3eO0bL+HvuwQbaCs9y70Y+6AcYk0Jot1h1BD95dEfyHqOvPj9/kOZuzeD2pll1rTC4a5gRvZhnHSOtEUriAwLKhWj+MLgNjB5qb2ksG0tx3OxxMASg1VGAomYUv+CFiKa4y5LWXU+sHwbsO/B5yqRZ/vzWqLoLGEQXyPLKwGuI7xOBx+jF+B8QFSheZXZFN6bKPjI3GlWgxH0aX9I4eRunQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XvQf5k3roGNcIqcRC01w+gi6hQp0n08DIjcQGOrG1yQ=;
 b=sgpXy4M0QwZ9nykWAnEMOe6vnxU/KrYBiG17P1FGCgrrTZ9h0xQeIzRPmU7d6/JYKo8Fnbsio+6RoMkbaZXhCr7F2F24riBsDHdwxlHO8CMM5GY/flbiaUgyH64eL4IBV8mZMPXTzOfKIemCvEZCRQLB/JYuuCzuJ2DqhmapsjzAGvdksHhwED6wHRldad2pDQq6n2NLjilBw7oIrTt2x08g6iF4XxJRy8ZsHVfdIgaXH68qVnBa5papBgIkjD65d+oSB8ZrOX6+woIZjJNMhgzk4j+tdHAFzQBh5a9aYk3fTuhA7VOgqElO/2LMvLmoT9U1d0nLcLheZKjviORc3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW3PR11MB4586.namprd11.prod.outlook.com (2603:10b6:303:5e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.27; Fri, 22 Nov
 2024 22:24:52 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8158.024; Fri, 22 Nov 2024
 22:24:52 +0000
Date: Fri, 22 Nov 2024 14:25:28 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/2] drm/xe: Add mutex locking to devcoredump
Message-ID: <Z0EE2JTE9WCTNyNi@lstrano-desk.jf.intel.com>
References: <20241121225542.1336796-1-John.C.Harrison@Intel.com>
 <20241121225542.1336796-3-John.C.Harrison@Intel.com>
 <Zz/F29WgIzFmAH3V@lstrano-desk.jf.intel.com>
 <132d8232-e8a2-4c68-b426-ef5363e90eb1@intel.com>
 <Zz/mFHF4wYhFm16a@lstrano-desk.jf.intel.com>
 <cfe75186-3e3c-44de-885a-f440990a0d2c@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cfe75186-3e3c-44de-885a-f440990a0d2c@intel.com>
X-ClientProxiedBy: MW4P220CA0004.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::9) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW3PR11MB4586:EE_
X-MS-Office365-Filtering-Correlation-Id: 77ea0594-0b0b-418d-1846-08dd0b447bd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YAcjjmtHzlG345Q2Hqo8V2ChBfc9ZbwRzUpxjEyjfJnQk0C2lza89bpGvwyw?=
 =?us-ascii?Q?4O1OrHGiRKbKDvd6l8ano0foeGBmrhXvBpEPgd9wCx27ihvoDpU/uMqqGXkb?=
 =?us-ascii?Q?OrjbzEOXm48KRIHpOpYKR8qfzbZDSUN4oqcgxAc6aEPY49lKZLUDiyCxOJfG?=
 =?us-ascii?Q?HmVlIkaIDhDXiMyL5CBsfgiT1YM3/NEpcxmnjtXpgIFP7fU0/OyH8GZbO+Lt?=
 =?us-ascii?Q?xa6xFErg9vY5+VQ4p9STeLqFUaVBWGcna8XDFECKUVdSY7VNDdAdt1Wpanib?=
 =?us-ascii?Q?5KYK4QntjSNVg8V0D1Gg0qC14RjFp5l0UZZ/gesb3wpVbic3b7Leo11ZHKSs?=
 =?us-ascii?Q?LH8xnkT4kQxRA7pNS3cc4Eae/dpJN5SBsXxQDENwTreoqo442mpGR19hx2PC?=
 =?us-ascii?Q?YKbxySG+UmOsuY8zNs+oGjbseRkit/0ejQA28e+YV3zLtoVSLQFnZ3gVds6o?=
 =?us-ascii?Q?PFS3mdDT0qDs8tllaNMzR7KId9msgrSqRwDHV6E3Iu0S+GEa8Aq+cnVEF9F6?=
 =?us-ascii?Q?cUBxQgbAoMfPl7iU0fvIzZ0lOWRFF3KpSQJiHZBi3fUCx6uqP9XdvcX6cMPg?=
 =?us-ascii?Q?3tNYA0ovLIllMnHXtlVEgfOCn0UQtjKCyjElvOq4vCyouQMLm/VnJRw7bV4s?=
 =?us-ascii?Q?rV0ilwtyRhf/lh6/1OjcmJ+0Sjbhr4FOp5KQl1YwMjTgAimdi8rBQeItwHfx?=
 =?us-ascii?Q?L1VksmWrfS0gL33qpiMLNDHPUOpUeApHN7BOmC13QJuZYSantusp7roL49xi?=
 =?us-ascii?Q?SqZ2LZGDkCRlk77ChcB3+tKOpYSByw4IjjGEUTpfAIkDp3lyieXylh0w/imN?=
 =?us-ascii?Q?HuidXIZPh5S6C82Z0buxx6BQx9QfXY2xXTNmfhFb8IfUmXOC1QQKymFtOYB0?=
 =?us-ascii?Q?Y2Jru8DrFX29lW2X4/LQemDgGB89NHFqDy3sfXJcJf9YdanC/uqhW9ao+RKu?=
 =?us-ascii?Q?EtBPY0PElFdLd060GYjAdUEHfj4ziZbE0vua7pbn7fAsl7Qs1xzrhelh5lpJ?=
 =?us-ascii?Q?qbAk3OdXOVEAA8JAA0l+yuzREeA2/GitXzjHbvmhS1tb2b+LPFWcjRt3Odco?=
 =?us-ascii?Q?LEP+RrpABQ5/bafYE/ATyS5du/0vZhyh9YBQpLtRk1VOxRROt0+A2Rc42g0p?=
 =?us-ascii?Q?0NxFy6LcE2YYieFhWuNcm7vLxcG/6MZnNZezycSpSGhErtXIUJ/n6N1JoVFE?=
 =?us-ascii?Q?kfZ+mCeyKQIELvBUmas5fa98IWjpB9kh3X3nVCDaT+GYH0I1knSor1/SVGA2?=
 =?us-ascii?Q?fQsnCYTN2CDSoEQo+M+qIRZItTfLNG+eFCijlLtX9zYUJKOKHQWPpLh56bFS?=
 =?us-ascii?Q?lnc4BwbxOI2M6IxXPS+D9hXNNPBTeZ2026m6y7DVJL8ZqQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ngnq1I1VMKw+xNqw886iuLPIUT9cUHZ3rADsDIeIh887yP8fS/TC9tVsUFuh?=
 =?us-ascii?Q?STx+Lk7B7QUdF7k+I/Yizcxy5KqtyAxFaH3Fu8WwpjajUDJyVYOHysL2h4ze?=
 =?us-ascii?Q?nUXKsu3aF2L4rw+Y/KncKphGb/WmiQS+hY3wr2qU3dwJ8AIQP76ImWeffqp6?=
 =?us-ascii?Q?u7DA3Vd8aVzB8xbwQsbWjrQlONcgGzGKDqf2L6FfAHsJPtYX1dtglPwSYXuw?=
 =?us-ascii?Q?BD22WuvDWJ71Ngdid65/J1XoVRGVDH06OYGUuTGu0T8/2ttHlEcxla3tZhMO?=
 =?us-ascii?Q?xXhGWdqiCdOPAxsVV+FyVLHPjItd3ZSTwUs7wkSnYu8Fl43xMy6q9o2sqHNs?=
 =?us-ascii?Q?7L9uo16X2Rlsi1TrFGeM7r+zxNHP7SMyZlJJ0GxQ7uJrDuQqkHjB0XHAelFQ?=
 =?us-ascii?Q?k9R2/HqOuztYMaETqi5pVmZ4m22FNdLmwEqemW60TFOeuYsl9uT+Ed2Pn8P5?=
 =?us-ascii?Q?N3tGrCkTCOhlpHs6nQ47wFTPenltHWlx2v1uKIY7vzwdRaxf/VR9a7VxWt7Q?=
 =?us-ascii?Q?kpriOvoIJcx3TPGKGww6UKfY9sI4nGCkhCJv+oKlzDspwRyxdhMrDuXczi3/?=
 =?us-ascii?Q?JDaqshA3jWQlfxCEPRt3ermARZfDp93vOWJg6tahMpJKvFMjhysnpeWv98sa?=
 =?us-ascii?Q?MiqhzM7TA5CNuEsiSvvU5OvziOzXnsQJXPPQgvKLyinYxSSplW2wkDM+Awsh?=
 =?us-ascii?Q?nbczoeJ5LLwvTww7sWDwttOuK1FpMu6EeOX3TNcacEJjnBPFgtzVXyOLXf6Z?=
 =?us-ascii?Q?VLUUkup07rng9LaZhnqDyxR7+ATa4B8MVws5eDZLpIqcnelALHTNB3OF8EIG?=
 =?us-ascii?Q?0j7p09st/i3dKejxVToa+S06TE1NUZlvp94hSMtAdiAOfI5bZJRjhO/U/eAI?=
 =?us-ascii?Q?8lH80MBV5lfZrLnPANCMgS7F4nj7Lcgg1AcwsOEuDIPqg89DSzYbfxc6sNu0?=
 =?us-ascii?Q?v5EC/vecPIVBF9UG8YbgywNXwDyQ+EdMu/1yZDqQY7vqevn52qc1kvWxeJ2+?=
 =?us-ascii?Q?jZ2OInAvcCHurClFQ+XIXLb1k9omJM5tvLrKZ2DAAWOV1t5Iz7YK+yuj8ikS?=
 =?us-ascii?Q?OKnmNYrpxxapswLCe5vujc0l9oZ2VTgjI/swvSEjq8D7eg1fJZifjzstJXDp?=
 =?us-ascii?Q?GHmLjWiZ4O8edjkpw2LoPj4E6gVidUe2EmhBJuzPOmdbcWUsHA5CGYr7yroR?=
 =?us-ascii?Q?s5013iKfaX3cf327DNlkhBhtPkJZHrU+tqE6gagNJVrQGPlzGKAXJEGRgP/w?=
 =?us-ascii?Q?LxeGY+wHYhXTtzhfLyU0CbZx8gqyJOPeJCI+qzLz/IwlK3tcDhU3AEE+5fpB?=
 =?us-ascii?Q?G5vykq/EpIqNRkjr8LLOhsRfppEDUXNfEM3AmcJ4Q1ihebUNGlostc1Peiu2?=
 =?us-ascii?Q?CXECHoZQgFCt9SWT4/VtgyUvy7sB/qcZYi6NnaW2ydi+AvyXvT3iRYC2lJcu?=
 =?us-ascii?Q?UyfRiNakbONnEeMZKDZsfQ+H4y8iXUVV16UMsLlRbdPiDoRyrN0dSp4cRq5S?=
 =?us-ascii?Q?gYNY3e6L8vGX7jXEFY4729wN3N04RBf1VfE+EwKyN9DjLMgqiv3SSDs3RB+j?=
 =?us-ascii?Q?Xhfwl6U3iAy/cOFLAnDdH+EJHnlRLcE9BiUSArKFFkeGQWENOdABM6LNodM7?=
 =?us-ascii?Q?iA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 77ea0594-0b0b-418d-1846-08dd0b447bd3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2024 22:24:52.1299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y6U2iGxOEJgrlSTyILmavGB3M7uzYys5Kg0i55MAYYki+IclvoWJXoFHtGnaNth6gT+eGWF0JMjEbW6rHY75nA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4586
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

On Fri, Nov 22, 2024 at 01:00:17PM -0800, John Harrison wrote:
> On 11/21/2024 18:01, Matthew Brost wrote:
> > On Thu, Nov 21, 2024 at 05:25:10PM -0800, John Harrison wrote:
> > > On 11/21/2024 15:44, Matthew Brost wrote:
> > > > On Thu, Nov 21, 2024 at 02:55:42PM -0800, John.C.Harrison@Intel.com wrote:
> > > > > From: John Harrison <John.C.Harrison@Intel.com>
> > > > > 
> > > > > There are now multiple places that can trigger a coredump. Some of
> > > > > which can happen in parallel. There is already a check against
> > > > > capturing multiple dumps sequentially, but without locking it doesn't
> > > > > guarantee to work against concurrent dumps. And if two dumps do happen
> > > > > in parallel, they can end up doing Bad Things such as one call stack
> > > > > freeing the data the other call stack is still processing. Which leads
> > > > > to a crashed kernel.
> > > > > 
> > > > > Further, it is possible for the DRM timeout to expire and trigger a
> > > > > free of the capture while a user is still reading that capture out
> > > > > through sysfs. Again leading to dodgy pointer problems.
> > > > > 
> > > > > So, add a mutext lock around the capture, read and free functions to
> > > > > prevent inteference.
> > > > > 
> > > > > v2: Swap tiny scope spin_lock for larger scope mutex and fix
> > > > > kernel-doc comment (review feedback from Matthe Brost)
> > > > > 
> > > > > Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> > > > > ---
> > > > >    drivers/gpu/drm/xe/xe_devcoredump.c       | 26 +++++++++++++++++++++--
> > > > >    drivers/gpu/drm/xe/xe_devcoredump_types.h |  4 +++-
> > > > >    2 files changed, 27 insertions(+), 3 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> > > > > index dd48745a8a46..0621754ddfd2 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> > > > > @@ -202,21 +202,29 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
> > > > >    	if (!coredump)
> > > > >    		return -ENODEV;
> > > > > +	mutex_lock(&coredump->lock);
> > > > > +
> > > > I'll just explain my reclaim comment in the prior rev here.
> > > > 
> > > > 'coredump->lock' is the path of reclaim as it can be called from the TDR
> > > > which signals dma-fences. This is why most of the devcoredump core uses
> > > > GFP_ATOMIC to capture smaller state which could lost quickly. We also
> > > So the reason string allocation in patch #1 should also use GFP_ATOMIC
> > > rather than GFP_KERNEL?
> > > 
> > Yes.
> > 
> > > > have worker, ss->work, which opportunisticly captures larger VM state /w
> > > > GFP_KERNEL. The worker is not in the path reclaim. Thus you cannot flush
> > > > the worker under 'coredump->lock' without getting potentail deadlocks.
> > > > With proper annotations lockdep complain.
> > > Okay, that makes sense now. Was forgetting the captures are from the TDR /
> > > dma-fence paths which are reclaim requirements. Doh!
> > > 
> > > > e.g.
> > > > 
> > > > We should do this on driver load:
> > > > 
> > > > fs_reclaim_acquire();
> > > > might_lock();
> > > > fs_reclaim_recalim();
> > > I assume this should be fs_reclaim_release()?
> > > 
> > Yes, typo. Got a little distracted typing this.
> > 
> > > I see three separate instances of a local primelockdep() helper function to
> > > do this, two which do a might_lock() and one which does an actual
> > > lock/unlock (plus another which does a lock_map_acquire/release, but I
> > > assume that is very different). Plus another instance of the construct that
> > > is just inline with the rest of the init function. The helper versions all
> > > have a check against CONFIG_LOCKDEP but the unrolled version does not. Seems
> > > like we should have a generically accessible helper function for this? Maybe
> > A helper might be a good idea.
> > 
> > > even as a wrapper around drmm_mutex_init itself? Although the xe_ggtt.c and
> > > xe_migrate.c copies are not using the drmm version of mutex init. Should
> > > they be?
> > > 
> > Yes, all mutexes in Xe likely should use drmm_mutex_init. A prime
> > reclaim version isn't bad idea either given all drivers in DRM use
> > dma-fences and likely have mutexes that should be primed with reclaim.
> > 
> > IIRC priming with reclaim was a bit of a hack actually, using
> > dma_fence_begin_signaling/end is really what we likely want to do but
> > that annotation had some odd weakness which would give false lockdep
> > positives. Thomas may have fixed this recently though. If you post a
> > common drmm function, I think the correct annotation could be sorted out
> > on dri-devel.
> Are you thinking this would be a drmm_mutex_init_reclaim(dev, lock)
> function/macro at the end of drm_manage.h? Or should it still be a separate
> drmm_mutex_prep_for_reclaim() function to be called after init and in some
> other reclaim specific header?
> 

I think a new drmm_mutex_init_reclaim macro in drm_manage.h which calls
drmm_mutex_init and then primes it makes sense.

Matt

> John.
> 
> 
> > 
> > Matt
> > 
> > 
> > > John.
> > > 
> > > > Our upper layers should also but may have gaps. Reguardless, priming
> > > > lockdep is a good practice and self-documenting.
> > > > 
> > > > >    	ss = &coredump->snapshot;
> > > > >    	/* Ensure delayed work is captured before continuing */
> > > > >    	flush_work(&ss->work);
> > > > So this is where the mutex should be locked.
> > > > 
> > > > > -	if (!ss->read.buffer)
> > > > > +	if (!ss->read.buffer) {
> > > > > +		mutex_unlock(&coredump->lock);
> > > > >    		return -ENODEV;
> > > > > +	}
> > > > > -	if (offset >= ss->read.size)
> > > > > +	if (offset >= ss->read.size) {
> > > > > +		mutex_unlock(&coredump->lock);
> > > > >    		return 0;
> > > > > +	}
> > > > >    	byte_copied = count < ss->read.size - offset ? count :
> > > > >    		ss->read.size - offset;
> > > > >    	memcpy(buffer, ss->read.buffer + offset, byte_copied);
> > > > > +	mutex_unlock(&coredump->lock);
> > > > > +
> > > > >    	return byte_copied;
> > > > >    }
> > > > > @@ -228,6 +236,8 @@ static void xe_devcoredump_free(void *data)
> > > > >    	if (!data || !coredump_to_xe(coredump))
> > > > >    		return;
> > > > > +	mutex_lock(&coredump->lock);
> > > > > +
> > > > >    	cancel_work_sync(&coredump->snapshot.work);
> > > > Likewise, lock the mutex here.
> > > > 
> > > > Matt
> > > > 
> > > > >    	xe_devcoredump_snapshot_free(&coredump->snapshot);
> > > > > @@ -238,6 +248,8 @@ static void xe_devcoredump_free(void *data)
> > > > >    	coredump->captured = false;
> > > > >    	drm_info(&coredump_to_xe(coredump)->drm,
> > > > >    		 "Xe device coredump has been deleted.\n");
> > > > > +
> > > > > +	mutex_unlock(&coredump->lock);
> > > > >    }
> > > > >    static void devcoredump_snapshot(struct xe_devcoredump *coredump,
> > > > > @@ -312,8 +324,11 @@ void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job, const cha
> > > > >    	struct xe_devcoredump *coredump = &xe->devcoredump;
> > > > >    	va_list varg;
> > > > > +	mutex_lock(&coredump->lock);
> > > > > +
> > > > >    	if (coredump->captured) {
> > > > >    		drm_dbg(&xe->drm, "Multiple hangs are occurring, but only the first snapshot was taken\n");
> > > > > +		mutex_unlock(&coredump->lock);
> > > > >    		return;
> > > > >    	}
> > > > > @@ -332,6 +347,7 @@ void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job, const cha
> > > > >    	dev_coredumpm_timeout(xe->drm.dev, THIS_MODULE, coredump, 0, GFP_KERNEL,
> > > > >    			      xe_devcoredump_read, xe_devcoredump_free,
> > > > >    			      XE_COREDUMP_TIMEOUT_JIFFIES);
> > > > > +	mutex_unlock(&coredump->lock);
> > > > >    }
> > > > >    static void xe_driver_devcoredump_fini(void *arg)
> > > > > @@ -343,6 +359,12 @@ static void xe_driver_devcoredump_fini(void *arg)
> > > > >    int xe_devcoredump_init(struct xe_device *xe)
> > > > >    {
> > > > > +	int err;
> > > > > +
> > > > > +	err = drmm_mutex_init(&xe->drm, &xe->devcoredump.lock);
> > > > > +	if (err)
> > > > > +		return err;
> > > > > +
> > > > >    	return devm_add_action_or_reset(xe->drm.dev, xe_driver_devcoredump_fini, &xe->drm);
> > > > >    }
> > > > > diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> > > > > index e6234e887102..1a1d16a96b2d 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> > > > > @@ -80,7 +80,9 @@ struct xe_devcoredump_snapshot {
> > > > >     * for reading the information.
> > > > >     */
> > > > >    struct xe_devcoredump {
> > > > > -	/** @captured: The snapshot of the first hang has already been taken. */
> > > > > +	/** @lock: protects access to entire structure */
> > > > > +	struct mutex lock;
> > > > > +	/** @captured: The snapshot of the first hang has already been taken */
> > > > >    	bool captured;
> > > > >    	/** @snapshot: Snapshot is captured at time of the first crash */
> > > > >    	struct xe_devcoredump_snapshot snapshot;
> > > > > -- 
> > > > > 2.47.0
> > > > > 
> 
