Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE850CD343B
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 14:24:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8301E10F182;
	Thu,  7 May 2026 14:24:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KpOh4ezl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78D0310E241
 for <intel-xe@lists.freedesktop.org>; Thu,  7 May 2026 14:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778163841; x=1809699841;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=H2OOskojfb9qyCIIR7pvvhXq+LTeXrTG2esSchqV8VM=;
 b=KpOh4ezlai49EKsvPUoJ1D7OwU4lBm3UFpT0vMQhFzdYVgJ3d2Cv8Hud
 gC1RF6koHLidsAoaS5F5jmZXyvvSFqTURp7PgWR19xUJCo7XEVRT9TLmz
 QfS8pcoNbjof4UA6ONUJWd7G4eEUw1vsYVdNf+7Gy2SM0xRf6yLXVWlLq
 HdURc9myLxHJbHTgpBbPvgNaJfmY039LDfIdUrmW8t/JXbNDBDydWAYQ0
 y2is4erIU3vPdQGbdGuSFIOqcZ1X6JnKKuNCNFX8cHKtpWmq6i6ei+git
 uRiKHQshbslBD3qOKyk4gC8xGN3xDwStFaGWUNqUFrtDXLh9JH6MvQMt5 A==;
X-CSE-ConnectionGUID: Q5vy37T5S/iYgJ8AtdV6SQ==
X-CSE-MsgGUID: h+kjX4QWR1W+YYaNQjlbcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="96683221"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="96683221"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 07:24:00 -0700
X-CSE-ConnectionGUID: 4uR6Pk+rRo+GQcKpMi1JLg==
X-CSE-MsgGUID: psPm/geZQ6CvXfw0SsYkiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="241478764"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 07:24:00 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 07:23:59 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 7 May 2026 07:23:59 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.49) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 07:23:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Odg1Wxq5SohWIgQpghNxjuU+/CbFKB0Oxk47K1je1GlD+DFmxstrqcRQnueCd6Jd2E+Jpw/naDfZLkGRPjkBE2ithn1prbkLQwcvJbfIPJNcOfCmDmMnRdJQLaQqbdUUnuIRpHMy73u5WH9Nw20V5RIs95Csrfkg9lFMSewDh15vFrhfVKUcXfibxn5NYM3/OkZUszbBrYgv0PqQ5ORzYupqK0m+ln+TLXYiMHl+8YAsjjd0jLPvO9bERc98sH9Kjl11Nv1uVP6hEitPVBku4yuAvlOrmJgrSIJkijhmA3thgh91l7H7SqqPC5SXpj2kOW4+W0CVKxShwgdQU0z44A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=joQkWi/vXngV3wBMkjA/sud42xA4GXaX6ZQq2tMqIcE=;
 b=Dj+NrovW9vDKFm5M6vuijlVJcSmP67wVqDxJ0XSpkqLfa5TgK0XjkKM8TCE2cFnYHPaVdUl10Bguq28/20LivXpViRFW2Ms++N7ZFVTR052/U1MHB1aNTWX2X+Qg6WfqzVl2YtOCGB2bXtfr9a0H60kwkGXZ0Iq3r+6s0jG2GVpEdedJl6dvOec5F+Loe0u/jfM7NFdwWt1fEKGCnBjFX2bxhF5JdeDiBnYktkERBX8yeHrI+kcZ6GSfuBFK7C73bKvqnSaRrdRkjXxXTEsOb5NQf5FmhYPQDPr5Li5NvwWcGf9JF3LNj5oMXYBke8KDr3c03FPXBsJiqiuw9/8QDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by DS7PR11MB6272.namprd11.prod.outlook.com (2603:10b6:8:94::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 14:23:56 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277%7]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 14:23:55 +0000
Date: Thu, 7 May 2026 16:23:47 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Maciej Patelczyk <maciej.patelczyk@intel.com>
CC: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <stuart.summers@intel.com>, <arvind.yadav@intel.com>,
 <himal.prasad.ghimiray@intel.com>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v4 12/12] drm/xe: Track parallel page fault activity in
 GT stats
Message-ID: <afygc-fyzVXIDnuE@fdugast-desk>
References: <20260226042834.2963245-1-matthew.brost@intel.com>
 <20260226042834.2963245-13-matthew.brost@intel.com>
 <400d55b6-652b-4918-a5a1-1180dc42b13b@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <400d55b6-652b-4918-a5a1-1180dc42b13b@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DU7P194CA0004.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:10:553::35) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|DS7PR11MB6272:EE_
X-MS-Office365-Filtering-Correlation-Id: 320a1615-71ac-4651-049b-08deac44456c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: iMcXclaI6uXnFdD3+9NHB6sAPtVZGHjBo0kvaRxuHqFJE1OITDbhxYhzMK0VO0Jt9HbSQCoNSB03n+ARQpm7RMI0yQSOgCxksJFmxfUVdCTmrZESSPb6yRWgT2QL12qhdx/dgsWBkPL1x7hmDKpONrL+qeMA0KM3qSl1I59cyoBfhPTEOs2bi1DeoFWvcoEKHJymz1tYWy0SpDhSCROhiBBMb8aHVYG8GonQnTB40pGa3fNkf084ooCPEo3khU0fBgEMhxhEdTtpdS9Lq63kzXDDyHgWW4QaD6BLRbLbyc/fjykUOUa0drlj68dPlTOYWMYtWlajUzylKXadWZF9lXyFZGca9/2Jer8q4VTRIJfZm1dazKniEmtYm3V16e5R6xPwuNl9xEJR/TGu21RvaW4ltzmgxnGrs3LKyeKmDc/gBZHsrDJucMlVxEeqP3oAETfnx7BJWUI/xdqNVNfwBl1Ax/+aUrPcHENqgFkRJSFuCV3Hoccq6d84vSReVARV82O3n4pectnOU8E5cBBuB2QlwsS15Z1iA76nijW5bGnTaM1T/NqGcNoUhFnDERm5iejdIRj8S4dCHVvOZicOyoa0vKyErYQhaR0TvV/lym9n2iZbJoCpzintUz36u/uof2v6otFFY5qV+XO5lhjDCg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CpFOX4Ep/Ka9vlrwUUT3hrpvnIjC6diGjZro5MiYgZr0bMY/+cUbXk4VCc2t?=
 =?us-ascii?Q?PE7YbpDh67u0rVu9vvkRd73cos/SI22i0bJUCexDAO/ItHkpsvah00dzie9r?=
 =?us-ascii?Q?Q2miOkOlc6iUJU05HgYEICCM0TcZsUrLC//uikZz2e4VDxPDRYkEnj6Mqr5b?=
 =?us-ascii?Q?nXV3MXCSWoLxRtMBq6JBPyJHKLKr753LmRLIMDNiEMCAM4DFLe6HU6OEYk4J?=
 =?us-ascii?Q?V6LxvLwnaqWKVK/l1WCdAEBekt7bpK/8l2jr4cz8cvBvZTeCQ+XUNcKbxvYy?=
 =?us-ascii?Q?WkicsOfDnbqvuKpDcRJme5wjbBO/4T/HQ+cdlc6zOlWfAPF3OW1+ogsI1dOS?=
 =?us-ascii?Q?BSI7xhwHsCNWtVWBvugM4zcqdGmt6a53G3bt8zCzOCWsRZ+VZs49LRya/AQY?=
 =?us-ascii?Q?VxU5WsmARF3Qbs3cJ2WMjNCALaK//ebijcp85wbKSiYs7RLEiNvBkopdRaob?=
 =?us-ascii?Q?wOGPPNu5YDfiyYBEPtMtW+R/p5jZnqKgdayVLz1gATH8eazWM1FakhJdYams?=
 =?us-ascii?Q?U6o029sbJqAXfXzhFFheJlXINMtiqkrUaBhCazpGTg2DhAUEIB9GDnYhlEu0?=
 =?us-ascii?Q?V/o9CT7t4HYKkiOOVaUDlAnUhuxxH6wsgszDbkLWUquR5zRiiAzfGFZvGY2Q?=
 =?us-ascii?Q?HFWn44Fp3mQL5EDYQp7R/Ulyfuc1XdJb4kr6R+p15oYJk219r6SztijFTF5b?=
 =?us-ascii?Q?/5dduWCYlJ+UzivKf/SF2ZrBmsm9xCzbxc78KaLXHbrJQo2QTVg3pY+k+fM+?=
 =?us-ascii?Q?Jdq7RvbRE9Rz+9itBJAN/0K4A+CfQILM/HyjT3ZqFekcOXcv3sg7xyNPt1oK?=
 =?us-ascii?Q?kV46hdWhLJB5vI2aXEnO5djbRZ226djAO/0aY04LKSlNeuzgYxYH9ed0kEos?=
 =?us-ascii?Q?QEkrLU5Jo1tHf79ikJWqTbm6WEFr3wM1QX2qeAWYDwao0As9TaYKHiXalEND?=
 =?us-ascii?Q?OoVpog1ZDfZIIMw9VYu6UY3yc+wIAXTuRSuHW4hQbFhE6u1dD0YLBM3+n1LQ?=
 =?us-ascii?Q?W3oKy+q7PKno0cDG7t06qLDifitUWxxxjidXkEwn+TDUFqMrOQQHlKvZHC4l?=
 =?us-ascii?Q?oulbBUT1zVi48P5PEjAni0px5bDKSPfWyP3bO2Iij7VK3xGtNZoR/LWZdQVJ?=
 =?us-ascii?Q?8HE3hYJXxrweui3ZpxcsiscMn0iqcgg5BGNKkiiOru7agESGGBdfzpc27Wuq?=
 =?us-ascii?Q?DZtovQQVZzDIcKiqvb9blTNJQGtW6RyYEBCMkVhOuyTqgrXfdmVKqaD6fzok?=
 =?us-ascii?Q?vUikCa6RdnebdLaBCbP8jua+GIAasGckIyR7gl7nX0K7+GdHwCzgUjpTlz+d?=
 =?us-ascii?Q?o6w5KCTpx+WrxJUaL4sWh9oFugsdUbOAIN5BwHvfytdhJAujMwxcvibDR+IB?=
 =?us-ascii?Q?l9i6+7BDj4ZKoLTgXZeE+lMr+BKhgz8hP2xfNSsT5S+iImUAlpPANfJWbl8O?=
 =?us-ascii?Q?AjS5LakSEBwo8dupTLu1/kO1oR0OQx9T9+puvDVafUnJpyKMgmINkjhHcFbV?=
 =?us-ascii?Q?T8hSfFEKTgEIAoT4DFWyZ9JF1o2UEnJPmEdCsLXtwoW8t29RZcFmAMheZRya?=
 =?us-ascii?Q?PAS4J7S45OlWGnjQCGQcNiocVWF3zoqfEYddDQW6OZ4NlIRlF0cyxMwqLArr?=
 =?us-ascii?Q?rkT8F8BNREr0DjTI8Ezr0nLaY1GMv7rjqSxMBTMhkRhOvZd1FSIYOumYe5Xn?=
 =?us-ascii?Q?z+DAvPSz1hOfhh3stcbzpSCrTzFeVIfbz7w8pJucgY7qxkfXJhF8p5PmjStb?=
 =?us-ascii?Q?DeeKFW1eaKgMT/iOqhxSvz2Mr6vV8xg=3D?=
X-Exchange-RoutingPolicyChecked: lYDMAnqH9hyl2UVbn3Muo9a7hQsJF1Q1ixtF918Fg6X2JPp0ES3zJX53f0WU5Osx+NBrT2CzizBmcLNkPQCMUzaZJFUu+KthgV4QyQBRPlVYlRm2wxbhhzOFW65fYTAtDc6od1QHn9TAYo014uLsLbt1rPsUwHhiZyF9PEBKycPwJsHan0u7iIxcRCtNM131B6oaMI1z8er9j6U0iWbd/M3m33CQ+yEYMZEzv9Bp4aUFcNn2frjMDzMOpZFXDd8PUb6SQVVyVlEqDu/JxH/EFO311PP1M5Vrp73xfLpUpv6KUmJJ6IkCEPeqbbQxoKL7V+vBcF0yIX85a25IqEBfiA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 320a1615-71ac-4651-049b-08deac44456c
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 14:23:55.7430 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p8A2IRcociDD0s+0YWGpXCXAaLZWc0h7jqq/GnjCa7/ApsjrsRjDi3vlGD3t7zFEB++/oPkh8+YAt0fGD3Q+aJXO0aZGn9oRd5I7g4b5TnA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6272
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

On Thu, May 07, 2026 at 03:56:37PM +0200, Maciej Patelczyk wrote:
> On 26/02/2026 05:28, Matthew Brost wrote:
> 
> > Add a new GT statistic, PARALLEL_PAGEFAULT_COUNT, to record when
> > multiple page fault workers are active concurrently.
> > 
> > When a worker dequeues a fault, scan peer workers for an active
> > cache entry and increment the counter if another fault is already
> > in flight. This provides basic visibility into parallel fault
> > handling behavior for performance analysis and tuning.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_gt_stats.c       |  1 +
> >   drivers/gpu/drm/xe/xe_gt_stats_types.h |  1 +
> >   drivers/gpu/drm/xe/xe_pagefault.c      | 18 +++++++++++++++++-
> >   3 files changed, 19 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
> > index cdd467dfb46d..621d1a2df067 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_stats.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_stats.c
> > @@ -58,6 +58,7 @@ static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
> >   	DEF_STAT_STR(CHAIN_IRQ_PAGEFAULT_COUNT, "chain_irq_pagefault_count"),
> >   	DEF_STAT_STR(CHAIN_DRAIN_IRQ_PAGEFAULT_COUNT, "chain_drain_irq_pagefault_count"),
> >   	DEF_STAT_STR(CHAIN_MISMATCH_PAGEFAULT_COUNT, "chain_mismatch_pagefault_count"),
> > +	DEF_STAT_STR(PARALLEL_PAGEFAULT_COUNT, "parallel_pagefault_count"),
> >   	DEF_STAT_STR(LAST_PAGEFAULT_COUNT, "last_pagefault_count"),
> >   	DEF_STAT_STR(SVM_PAGEFAULT_COUNT, "svm_pagefault_count"),
> >   	DEF_STAT_STR(TLB_INVAL, "tlb_inval_count"),
> > diff --git a/drivers/gpu/drm/xe/xe_gt_stats_types.h b/drivers/gpu/drm/xe/xe_gt_stats_types.h
> > index 591e614e1cfc..075a12152ae2 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_stats_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_stats_types.h
> > @@ -13,6 +13,7 @@ enum xe_gt_stats_id {
> >   	XE_GT_STATS_ID_CHAIN_IRQ_PAGEFAULT_COUNT,
> >   	XE_GT_STATS_ID_CHAIN_DRAIN_IRQ_PAGEFAULT_COUNT,
> >   	XE_GT_STATS_ID_CHAIN_MISMATCH_PAGEFAULT_COUNT,
> > +	XE_GT_STATS_ID_PARALLEL_PAGEFAULT_COUNT,
> >   	XE_GT_STATS_ID_LAST_PAGEFAULT_COUNT,
> >   	XE_GT_STATS_ID_SVM_PAGEFAULT_COUNT,
> >   	XE_GT_STATS_ID_TLB_INVAL,
> > diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> > index d252a8c9d88c..2a37a4c97aad 100644
> > --- a/drivers/gpu/drm/xe/xe_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> > @@ -458,9 +458,10 @@ static bool xe_pagefault_queue_pop(struct xe_pagefault_queue *pf_queue,
> >   {
> >   	struct xe_device *xe = container_of(pf_queue, typeof(*xe),
> >   					    usm.pf_queue);
> > -	struct xe_pagefault_work *pf_work;
> > +	struct xe_pagefault_work *pf_work, *__pf_work;
> >   	struct xe_pagefault *lpf;
> >   	size_t align = SZ_2M;
> > +	int i;
> >   	guard(spinlock_irq)(&pf_queue->lock);
> > @@ -497,6 +498,21 @@ static bool xe_pagefault_queue_pop(struct xe_pagefault_queue *pf_queue,
> >   	pf_work->cache.pf = lpf;
> >   	lpf->consumer.alloc_state = XE_PAGEFAULT_ALLOC_STATE_ACTIVE;
> > +	for (i = 0, __pf_work = xe->usm.pf_workers;
> > +	     i < xe->info.num_pf_work; ++i, ++__pf_work) {
> > +		u64 cache_start = __pf_work->cache.start;
> > +
> > +		if (__pf_work == pf_work)
> > +			continue;
> > +
> > +		if (cache_start != XE_PAGEFAULT_CACHE_START_INVALID) {
> > +			xe_gt_stats_incr(xe_root_mmio_gt(xe),
> > +					 XE_GT_STATS_ID_PARALLEL_PAGEFAULT_COUNT,
> > +					 1);
> 
> In the xe_pagefault_queue_work() right after first ACTIVE pagefault is
> ACK'ed the worke's cache is invalidated.
> 
> Worker may still run releasing chained entries but this stat won't catch it.
> 
> Maybe it doesn't matter. Maybe the work is done (the xe_pagefault_service()
> being the core work) at that time.
> 
> Just noticing.
> 
> If it doesn't matter then
> 
> Reviewed-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
> 
> > +			break;
> > +		}
> > +	}
> > +
> >   	/* Drain queue until empty or new fault found */
> >   	while (1) {
> >   		if (pf_queue->tail == pf_queue->head)

Same comment as https://patchwork.freedesktop.org/patch/707296/?series=162167&rev=4#comment_1332066

Please add a description in the kernel doc for
XE_GT_STATS_ID_PARALLEL_PAGEFAULT_COUNT.

Francois
