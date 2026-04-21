Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BCECF8FA9A
	for <intel-xe@archiver.kernel.org>; Tue, 21 Apr 2026 17:21:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F30F810E266;
	Tue, 21 Apr 2026 17:21:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QTEkaudc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C5EF10E25E
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Apr 2026 17:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776792069; x=1808328069;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mtbVFkgrLogpoOs+qhHeHFvOm0cOfL3IKnSMYOiyklk=;
 b=QTEkaudcxTUyZTMy0CvuztxNhWNlIQf2Lzhkn06L/JjDF8sJ3vQJCe0U
 3g9Fr5zvLghPW88pjxxeFAlIJ0VEHwVQD6CTafoG5bDtMQXWcWdGu6l3x
 BA0fNev5E4ZxO70DeYiKKL4b/rtexpHqX8b/zg5wRQvWdyOSdvHYObVh4
 acnFqS1ymOBH+tIz+O1cuqlK7f7KKHsBmyaeR99qjjUzpP027s/unDcJx
 NZLc3H2SkYH8ruXvMzAStGArVHW6MwQZfre5Y9WkxQ18Q5Du/RRHlpGnl
 0fEYVu/LnG78HJEBf2fuVIZkXKsZmbnKSlUMIzQp7dRDraybe+KGTfK/g A==;
X-CSE-ConnectionGUID: ZUEJjCG4T2GnIucbcTgcag==
X-CSE-MsgGUID: 2SXJBYhuQ3KFxd4Lh+A6hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="95294517"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="95294517"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 10:21:09 -0700
X-CSE-ConnectionGUID: GB7AqSpNSfmW1/cOQRa+lA==
X-CSE-MsgGUID: pngv3ueoQHCGzWjusMP0IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="262486689"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 10:21:09 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 21 Apr 2026 10:21:08 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 21 Apr 2026 10:21:08 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.49) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 21 Apr 2026 10:21:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QpX7/y7rfnOnwSXwb2PU+j3gRXzf7GSJboD9tnA8YSZ404ZTG4e6PskQPvxPnc9nr/lPvvVZlsH6YOsetQ24ykjh1RM3Y29YoN/5SKx7oIP9VoQqlfkxWbmS42EUr5rAxMwaGe6tA9vW84U7q2Zw2Nu3r+G0LN3aR6OQ3MOztSMBAhiCOhLQJ2gywi48MdkEAD9LPND0yni31Roo1JwebpN4TpSwmk3aa+ArUxAQlRemBcye4SglCBnUrEd9VS4j+xtrJLlVBEyAx0qVwd254qd9Fwdn6BGTBAYLHAcYDH7mxD3rLaKYv1Hmd7vZKrXBOevIWkL46s2E4sethNNGsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2sqaCx0Rp8Jcpepi58tmme2riyzn9b+3KE9Q7mFD7KY=;
 b=UouZ+pw0TcEqMjIeWdreWgjOtXUjHTzpueI56tJr3iutIR2rZlll+jRgnqlEWfkK3cD2yQyT7HPwj2rkZ2l9M7O5QLsKWbszgiWeWoO9cpS/rAZlzM6iIfsbHgwRN/IX5PyvvHBGufvyJvsessLX4yqgZCR7cKMtc1h1GPqxqNIb5J/JYRPCQDpwbMbDV3eSjIJ0jLlyPt/Z88oimBgtSIb9SzbmFQ1WKKEnv5xZyQd9aL79qJgxun12FbUfVhrtO/1w5SQKh7FdbpBugEEIyU64DYd1P+X1MN0SUh+uSDZys+9VUUusVYjvGKEhaAmnz0M7uqq8Rd44Jap7s7AANA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH8PR11MB6901.namprd11.prod.outlook.com (2603:10b6:510:22a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.49; Tue, 21 Apr
 2026 17:21:06 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9846.016; Tue, 21 Apr 2026
 17:21:06 +0000
Date: Tue, 21 Apr 2026 10:21:04 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Wang, X" <x.wang@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw6IGZhaWx1?= =?utf-8?Q?re?= for
 drm/xe/pat: Type cleanup and invalid index hardening
Message-ID: <20260421172104.GA2131374@mdroper-desk1.amr.corp.intel.com>
References: <20260416045526.536497-1-x.wang@intel.com>
 <177633179823.468249.10860743612396239124@a3b018990fe9>
 <507647b9-d3e8-4e35-8c7e-c6486f31d338@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <507647b9-d3e8-4e35-8c7e-c6486f31d338@intel.com>
X-ClientProxiedBy: BY5PR04CA0001.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::11) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH8PR11MB6901:EE_
X-MS-Office365-Filtering-Correlation-Id: 45a2f8d8-38cf-4ea2-fd83-08de9fca5f1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|13003099007|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: bYXIEELSNzJOgQ2sBvIxs5AC8FxWtOgHoEWM8XCw/7jxOgEqu1tTDsisAA4uZodzUCrLpom/gjvkgl2YsJFONH037yjz/YRZWc9wHATQy4lE0doDG1gZfbINSAErvpdCDLI90hoMxTGe8jOC7aXpniaIgxPvSjAdrhOUT1UNSxcr/7iv3x8siV+yPSPoMKivzrInJLJM1rJSke0Ihd3IbYuLUcyUlVF26+eGETD0rrM7uFy+njYsgellUFf6tRZSXoKDiUk6ZfoGeJLiiGJGP9dME/O8+XOPZJ1q1tX2swxXBircunQm0eo/nz7cQ/ZIWUsiJewg0M9rk3V+HL7p68QlHQg7n7GlJmWtnct1MksP1u2fo6Ek0rJKMm8fDtpV+lGkSv2JfyUFaV+dtbUsXcxd/mneJMN4azTpp6qb0IE0c5K7ewOH3f3QQNNKvvhLSrISe4EJG/bt79rRfMo28cniQ+MbZ16oH+8zQuha8Qx0ZwEzwNH0Sq9bMVzgKtu1SwuoFnU5n6ovzwHoYL5+swvLR3tFQmjp9cfn3WWaAdCnRW2BH2tRvDlzlLsVMG1QqI+RxvR+2lWAFIjwnZGllQXgYKNTkTTY1vHjxAlmsD2PqzaSN5L+vYcL6Cvd3bmDMB4xtd7stBb8AluucK3y5ls48hX1gDcuEKlSKmfIG00EXN8TRhLaltZaXcH8TSa+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(13003099007)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qHIQHm0iCQ6BS8gKI7OYsxlmWfg//pubd65H5zgPPSkLQffrQmqyUcJbCPLd?=
 =?us-ascii?Q?ewWmlejGOO645UsX3pJpOGCYewvVaKZyOYasLHSeT1u03c5VML1MbI5iQA8T?=
 =?us-ascii?Q?WS3i2iaZSDs79uQ79NrSFIbVxDy1lZtP/me+J/L51A61xOEc6SJcYIyrAWI+?=
 =?us-ascii?Q?b6xxlmsFPDRiJ1fL3NOlwNjZ63h4ktfXfUdRlj3fUZqPPxOLB0G4jJcCc/T9?=
 =?us-ascii?Q?e4bH6V1KFhSyrKFvUsNcOjY9ItF18Y7asSMMh2BS6r8Z5YsdXkurJtUsciVU?=
 =?us-ascii?Q?ogCJqK/fxYmj6+KHvJ1p24HUI2iHJFklTjAXZiR6MEbWwTRhiT2W+2LYsSjX?=
 =?us-ascii?Q?n0T8Rcm9WiCoKRE4MXqLACKIdAh+d8ywjCTpm9802NmsI3gzyvRvySMXryxr?=
 =?us-ascii?Q?XzsPPYBTVbdktqtRjpP7S1ArXSAgqmZ+lwei4Wu2Q4PeP32AlgEmIEURadAy?=
 =?us-ascii?Q?PWGmRjWEE6iXCrs9Xo/qjIPI90dl8MUcBK3rTvyzT7G1MQWzFWjtn6UHyLuO?=
 =?us-ascii?Q?XAmExH6TJ9frhlftBU6CwepOaHugF5ysC8SdwkqCuXg2YyA/GGvwAKjlVVbI?=
 =?us-ascii?Q?QL65RXDfi/R6p0hpBBIUFOUCvfsDt4kOq582wz+RKK/OhybQhXhFjYxbigbV?=
 =?us-ascii?Q?ogoFU67uNiaDpwFyJEZzUHhW9eT5gbyXUux2Fz1TTECdQ6vqIIkIe/K5vKBq?=
 =?us-ascii?Q?xpNpaZjXA2bSNwoB6J9ZIHLEzb2XH0oumJzwrImNY+mKijw6+6WV5E3XVTHp?=
 =?us-ascii?Q?5mGFHZHGV3IXJR+PYco8lGRkZES8GNqCNEu3CBSb4QQtOHCtLiu0Sthx40UJ?=
 =?us-ascii?Q?PSZadIZG9Mhx7DkLl6ThVKd0sWAYbdF2HDvhiXHG28+5Vy7uayApcIO2BDn0?=
 =?us-ascii?Q?Bdx7FV+XE0nybxSGkXyJQbiqXXW07stAMXpbOJleEuKCPPzYTiHjmPf6gAe0?=
 =?us-ascii?Q?/NlzS+XrMQ5bOftdqlomVDje/Vtff/Um4Vd+JEAAkk7dXhT2M+b7G69mLzSq?=
 =?us-ascii?Q?fQa/AfcBNdV9HOOuuAiEL1Pagv9ihL6ef+I1uj6Y0mwTy15E6loxPoAXusO3?=
 =?us-ascii?Q?SE4eJY60wGPDZTUVcpdWuSaGGSeCYjvl30CNdh6pVglfElwtcoOrlKfkEwh3?=
 =?us-ascii?Q?BI8b6rTi6SDqPbU+e3bFMqU9w73E7sUB34x5+uCzTG5XVFjs4Zj9gsNY71NO?=
 =?us-ascii?Q?TTTLewK/TlFQ7vCTOMb7hZU07K5QMGJOuED3Ty+1R67aTzKi3/4PC0Pvx6pL?=
 =?us-ascii?Q?LDpU1jKFahLTTjIRbFpA1xEADrBBF1uahmed16W3pNXvkA53wghbWAPRuL44?=
 =?us-ascii?Q?unbWwxhUICqn32Dx0sOkmVURGbvbQQ6k1m7X3qu+bfsYoULiEQ8clOox9HMb?=
 =?us-ascii?Q?lsgcC7RsBC1V5nAVVstKazeX7nOVfQ1CX16roF84ISWzOQgbqPs9PJVEZP5L?=
 =?us-ascii?Q?h6lw8Tfnw1MB4U0nuyG+itWaD8viS6kJBaZlU+rozF2++XhYNmGa6QifYDhW?=
 =?us-ascii?Q?roFX39VUnIeqmgKWke+1uFXY81J74t0sS9J609HO3b7JY6cavqtnqEV6WiOq?=
 =?us-ascii?Q?3T3HVwC5yqI3mCcIAHP3auGJ2HPKojt5HCtcjE0x7XqaZf8gYUxx7Qz7JwoZ?=
 =?us-ascii?Q?95EOyFPIS2V+eo2IfXDcwtcBzF4VYAXEJf8KR+O666cB8XUzpOCR32WndcSx?=
 =?us-ascii?Q?LT+SYfqUaoUonGAi815IzdXoB13nrnYTjJvrulgMFLxhXu1Gzex5t4DLlOig?=
 =?us-ascii?Q?jLsOuoppIa0d6uwwOINKjwfNRULJIW8=3D?=
X-Exchange-RoutingPolicyChecked: s+PxxbzcQrP6ps4avCUyDP4bchS4bHlK1ubdpxQeJcn/5KUqF8dtGif19ruEAn9bDY8gPRPzO6+d7ilkAyJW1mS1FZH2MG1TH47IY/F2AxRinHNGSE0D3GYQlYQsXtb3mYDgwYvdq5IemSKD9dslr7LVbex12bVWI7lZdJlua38YMUvBt5izmu0wFR4toqdCEmtjq/t8rNQb4pjWR7OEUDUDHsoHiVi/7Db6TCup0Xj4utz0FNbgkX6T/BckiFEcgE8+KzBwqc7JZRi6xsbuaMYtkeDW7ei0HT2Lz+8DfCLl7QxlIIAr0mhOMKK9TwmReHxCfGH4onuZ9PyAVdGPQg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 45a2f8d8-38cf-4ea2-fd83-08de9fca5f1e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 17:21:06.3317 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6fbldBnLY2SQoxigiQTJ7kjrNIGiq6RAfR9LesKjbGa3hTwhaAAqJhcrVzUoPzGg5CEN7RpPUfW2pP5JjmpyiTBUkHXoCw/PEEhzebB+xAI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6901
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

On Thu, Apr 16, 2026 at 06:57:36PM -0700, Wang, X wrote:
> 
> 
> On 4/16/2026 02:29, Patchwork wrote:
> > Project List - Patchwork *Patch Details*
> > *Series:* 	drm/xe/pat: Type cleanup and invalid index hardening
> > *URL:* 	https://patchwork.freedesktop.org/series/164971/
> > *State:* 	failure
> > *Details:*
> > https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164971v1/index.html
> > 
> > 
> >   CI Bug Log - changes from
> >   xe-4909-137513b61b4f187957d0c0f44c63c8549893f970_FULL ->
> >   xe-pw-164971v1_FULL
> > 
> > 
> >     Summary
> > 
> > *FAILURE*
> > 
> > Serious unknown changes coming with xe-pw-164971v1_FULL absolutely need
> > to be
> > verified manually.
> > 
> > If you think the reported changes have nothing to do with the changes
> > introduced in xe-pw-164971v1_FULL, please notify your bug team
> > (I915-ci-infra@lists.freedesktop.org) to allow them
> > to document this new failure mode, which will reduce false positives in
> > CI.
> > 
> > 
> >     Participating hosts (2 -> 2)
> > 
> > No changes in participating hosts
> > 
> > 
> >     Possible new issues
> > 
> > Here are the unknown changes that may have been introduced in
> > xe-pw-164971v1_FULL:
> > 
> > 
> >       IGT changes
> > 
> > 
> >         Possible regressions
> > 
> >   * igt@kms_flip@2x-wf_vblank-ts-check:
> >       o shard-bmg: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4909-137513b61b4f187957d0c0f44c63c8549893f970/shard-bmg-7/igt@kms_flip@2x-wf_vblank-ts-check.html>
> >         -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164971v1/shard-bmg-3/igt@kms_flip@2x-wf_vblank-ts-check.html>
> >         +1 other test fail
> > 
> This failure is not related to my patch

Applied to drm-xe-next.  Thanks for the patches and reviews.



Matt

> 
> Thanks
> Xin
> > 
> >  *
> > 
> > 
> >     Known issues
> > 
> > Here are the changes found in xe-pw-164971v1_FULL that come from known
> > issues:
> > 
> > 
> >       IGT changes
> > 
> > 
> >         Issues hit
> > 
> >  *
> > 
> >     igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
> > 
> >       o shard-bmg: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4909-137513b61b4f187957d0c0f44c63c8549893f970/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html>
> >         -> INCOMPLETE
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164971v1/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html>
> >         (Intel XE#7084
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084>) +1
> >         other test incomplete
> >  *
> > 
> >     igt@kms_cursor_legacy@flip-vs-cursor-atomic:
> > 
> >       o shard-bmg: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4909-137513b61b4f187957d0c0f44c63c8549893f970/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html>
> >         -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164971v1/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html>
> >         (Intel XE#7571
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571>)
> > 
> > 
> >         Possible fixes
> > 
> >  *
> > 
> >     igt@kms_vrr@cmrr@pipe-a-edp-1:
> > 
> >       o shard-lnl: FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4909-137513b61b4f187957d0c0f44c63c8549893f970/shard-lnl-6/igt@kms_vrr@cmrr@pipe-a-edp-1.html>
> >         (Intel XE#4459
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459>) ->
> >         PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164971v1/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html>
> >         +1 other test pass
> >  *
> > 
> >     igt@xe_evict@evict-beng-mixed-many-threads-small:
> > 
> >       o shard-bmg: INCOMPLETE
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4909-137513b61b4f187957d0c0f44c63c8549893f970/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-small.html>
> >         (Intel XE#6321
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321>) ->
> >         PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164971v1/shard-bmg-9/igt@xe_evict@evict-beng-mixed-many-threads-small.html>
> >  *
> > 
> >     igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:
> > 
> >       o shard-lnl: FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4909-137513b61b4f187957d0c0f44c63c8549893f970/shard-lnl-4/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html>
> >         (Intel XE#5625
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625>) ->
> >         PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164971v1/shard-lnl-4/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html>
> > 
> > 
> >         Warnings
> > 
> >   * igt@kms_hdr@brightness-with-hdr:
> >       o shard-bmg: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4909-137513b61b4f187957d0c0f44c63c8549893f970/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html>
> >         (Intel XE#3374
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374> /
> >         Intel XE#3544
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544>) ->
> >         SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164971v1/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html>
> >         (Intel XE#3544
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544>)
> > 
> > 
> >     Build changes
> > 
> >   * Linux: xe-4909-137513b61b4f187957d0c0f44c63c8549893f970 ->
> >     xe-pw-164971v1
> > 
> > IGT_8861: 63a08403d58b652dcab80da02d6078386da78c17 @
> > https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> > xe-4909-137513b61b4f187957d0c0f44c63c8549893f970:
> > 137513b61b4f187957d0c0f44c63c8549893f970
> > xe-pw-164971v1: 164971v1
> > 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
