Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D967EEA86E
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 00:22:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EC8A10E2BC;
	Fri, 13 Feb 2026 00:22:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yr7JpWZc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8B9310E2BC
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Feb 2026 00:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770942166; x=1802478166;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=16Nez/QpYKlEkTZT6EeYHKJz+tzl9Aw+U8CnbbvV2b4=;
 b=Yr7JpWZcZf7eJWKgYk+o5GGFljKcxG6jOdBpRElqpNKSnSr5e573khEV
 t/qRhyaNGcw6S0RXIbstfE7xyFCnqoC5s805H+ZKWhwxXayf9TjE3d/6d
 SGlOHyMaT5b5g6X0EPwRtOT7y82OZYr8yD6726FJx1Za0HmLBgQyM0b5f
 M9i2bS3sUogLg6S6GxCNhR6Q5TRKlQ3fUv+vwoekIVkZrLMN4o8rkP54l
 iapW+tEh9shEQCCOgES5h8xIGfGnDVkehx2vMZVztZT4LFFUhfnyCzbFf
 4JJbCEz2TkxjZTCZfP1KPp+VsvXDHcb6Omc1QWJXFyi+5o61XnaCoQR0t A==;
X-CSE-ConnectionGUID: 0bSsbZ3WR0GbnufCPcB0bQ==
X-CSE-MsgGUID: +h3ruxXFQ/G4DpFuV3MreQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="75975691"
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; d="scan'208";a="75975691"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 16:22:45 -0800
X-CSE-ConnectionGUID: +BPAJEvBSMaSKUgLG+6axw==
X-CSE-MsgGUID: SnT5MWvLTDeP3k61ZijD7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; d="scan'208";a="216907590"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 16:22:46 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 12 Feb 2026 16:22:44 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 12 Feb 2026 16:22:44 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.39) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 12 Feb 2026 16:22:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KuRNKRXnZ7FcBvcVaTQ2Od+t8HvrXcDX2zYoI0hOY7jNtqZSV1D4tMuouRbwkVG+E08WvfS36cplx5D1p5xMqifuhp+zzjd5G07TyFG2rgT/n2knwVE2yNeoblEhnMSj/2STkqnciXavesREikMccavwOOd05EzqsW7ktjDd+ZsaQ2jSHfmy4kAbMTOozhERXIMUREN/X5umVr5aQem4pGNYVXZ0mKM9t+1CPJnA1sSRYPqcnKaJI7oVlu7PK0l2Ekt2aKchG1X+O/uMkFgk5fM8WHy5vSGRtHRTeqWzo+SAVKQq2Pd6s9Sr7jdOHk68Kdgo5yBYH665ecAMJDVa3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mZ3o6ofPnOGZsGjo03QnlG9PT1+RN+tHKRnnHAWv4OI=;
 b=XvAALMgI2/EWrsoj7XutGSC28H2mGYwW9yPaTukNMAHxmX7CeZO/NMIi2s5YCMvgHtkB87+PBsqO+3hocxCzcb4m63Bs2lDkOqDVJKH4InM4eGAt19sQI6iB/ih0lOBg4lZXAV8pEldbNepCsXtmvhFElbAD823ruDE3FPM+wkI8ZgEIL2qHyAwzbclre/kt82v2SZjM36OLq8Qe/RoRw48p4SdAUOA/oKy8GUa3mPugYUigkpI2t0u5VLeXnh/OMW4MjNo6s+IGQnHV+KbsTVGIgCx6iGmUt+240LsgnfKCxwxdxLXm0eSeDkMeTkj+qEXvkVdQ7NsbOCgS0UHEGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY5PR11MB6185.namprd11.prod.outlook.com (2603:10b6:930:27::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 00:22:37 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9611.008; Fri, 13 Feb 2026
 00:22:37 +0000
Date: Thu, 12 Feb 2026 16:22:34 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyTIFhlLkNJLkJBVDogc3VjY2Vz?= =?utf-8?Q?s?= for
 drm/xe: Stop applying Wa_16018737384 from Xe3 onward
Message-ID: <20260213002234.GO4694@mdroper-desk1.amr.corp.intel.com>
References: <20260211234735.620087-2-matthew.d.roper@intel.com>
 <177086096023.247860.8275259072124891686@a3b018990fe9>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <177086096023.247860.8275259072124891686@a3b018990fe9>
X-ClientProxiedBy: BY5PR03CA0020.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::30) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY5PR11MB6185:EE_
X-MS-Office365-Filtering-Correlation-Id: b73d3f3a-ab7a-4217-6fd1-08de6a95fd82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oeovWJfSBQErqqGnucxU7sdFwZWfaGO5vXu6hXdME33SODezupXsLvmSpNzn?=
 =?us-ascii?Q?acLMVu+ZQaL38++1nCzH4S9GV+3ywogf8aEEG4awerNZuOVXuw1e9nxtIaoT?=
 =?us-ascii?Q?DvFUkJiCJ1n45jkEwIihuZP17hnQhQsY04NQpwv4MBcoomQScQom08DAmsXM?=
 =?us-ascii?Q?tImIKNkkB0Hb6ZotQfTqlWjhTwzYeBWyTk4SubPkV2ntlykfKjA3TXhBKBJS?=
 =?us-ascii?Q?ps+kLP09zEmdc6Ido7BqkOcjmyPg/m6t5TfUSkuYbaW/7DO7w0aVoBspfzjf?=
 =?us-ascii?Q?+7zQlwULpqy5BzyFl/Z6122bqD9swU2u+0jr7wvbZJdV03g5vxulUHftgmPC?=
 =?us-ascii?Q?/QThF1CFH+MVOOzPFFpBCirTmofbin9z1gb9iXZK1a+myP2SzVodOb/tei7K?=
 =?us-ascii?Q?1zWPpbxNVgQP3CcJLB06f5QJrYT7gHqZxGVckQM64mwoVtxthWUSFLD7w7PK?=
 =?us-ascii?Q?Ta30GLfmx+2H3spkTZffAsUNd0Ctv8GcuNMFJultaBc3eVpIEqIe9pvS0UA1?=
 =?us-ascii?Q?tzjrBRMZugCKM0bnyHOsQ+XVdpClM79tBTKDAvBLM6xHpd5gyQLpuDD3074F?=
 =?us-ascii?Q?+dQvIsFX8cSbQts5HvHMJv69bvdQGFoy8ewQepLW+EGq69XcGyu/r+egJgCC?=
 =?us-ascii?Q?IjSXqNFIts5SuynaKFpJxItzV+VcDWGLfaLEtNc4l4GeqpzXi1ED9aMy5gOp?=
 =?us-ascii?Q?+rAfilBi/aHK+75ubf4bvV6B6u+g5d7lj2nqEasAshmKGpEVf3J1OIGChSs9?=
 =?us-ascii?Q?/xKrmw7IBk+m70qtbpcSOpuTA8MbGyXLQ9sIF5mSFTyvQwH0o3HCqGITj+hz?=
 =?us-ascii?Q?djK/aBDtR3luSty/QywyBXJrKX1kP2+9uGkUnNmkjUAu1WTTSClfMxXDm9Ia?=
 =?us-ascii?Q?sjx61IGyjkO7ayU9dGYRignQSem+QUBOREP8zkyRtES5lTN2ahoAJKEPLIvF?=
 =?us-ascii?Q?rkhyZ5B8Y4bUFZr++2P4e0gmf9tw5FF4t0f3jbqhCxCuM1l9y8sjQ8u3fjiW?=
 =?us-ascii?Q?C7hn9dxX/lcFMRDHcEXaBvknrL38FN4tFgl2wQArav61EnojbhU76L6oqROu?=
 =?us-ascii?Q?fGflwfZD9mx8EN2klOsruipo82AAXvizQCZqCBj4Q4XNRmQzQG5p4SyRg5BF?=
 =?us-ascii?Q?fNgDEC8L9Z2DEJ4BOzfRvvH2OdO60WdztYikcUCNUAnPywC3lz09WYOU29dh?=
 =?us-ascii?Q?0zZm5dQlH3bAlpy/3YbzBVH+MrGQxtuSlE6ITwg3QvXWoZ/YECN4ytZscw9H?=
 =?us-ascii?Q?llAdVApRbohiUskXBCcZNTHQMoZrjPM3Kp7cu2GR10oq10aSuFu0hA3CmnN/?=
 =?us-ascii?Q?haU0Zu5KqLO6q9pzi2/IN1s9Xw5anDzFBQkaJARqFut/LbjYZZynmYCR2H37?=
 =?us-ascii?Q?nfh0EC/Q9bsqtHWwtmTinkp6GGj/3yKtisxfnSExJKDt3nbrq82tzzn5J8HP?=
 =?us-ascii?Q?NkcoWQLgOvBTrN/iP27r69+yTsYH3aaXIk6/898rTLXsrnsyaba8vnucI4Rt?=
 =?us-ascii?Q?R3aQoY7ExtH7ho7XszbHJE+5Q35UNDsJFVz/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gA9oebZ/YMkqXfsEq7LqkY1V6JoaafY9VdqL73dbgtNyKjoE+SolnRvzvfej?=
 =?us-ascii?Q?gK0URfpubDjkioyj7B3jXcdxPI/kQoBdspeTBgABdu5u9NHjEsZvegNsN2rV?=
 =?us-ascii?Q?DHsfDVh9Tc5FC2xdgAgl6dyF9yDh7LpAQArKLYG8SvpnjdkGN5sATi2V4yRW?=
 =?us-ascii?Q?xjACSmG69a4vlmoQ5jd1/xZFAi7dGOmbTz35yg/04AHmrzdvORlWFepW0yk8?=
 =?us-ascii?Q?iAM485rvRz4mtrCHUsFVdEVlByPh95q6j2cyiEGB+Y2TG8jEcEVxDqGb12TY?=
 =?us-ascii?Q?nyePpX+YuRyfIS0uP9fawNxmhYmxygp4kpYgtYpKqBq+kzN5Umme/zRuRZOF?=
 =?us-ascii?Q?5SgwIJkdIGV4MD/tECjqKRuxjj9zyaXwA03oNL5d4XDl56Vv6GBfdYWSKZOa?=
 =?us-ascii?Q?gW+rheSkbaiOg41I1hAbkTjRp0rKLemVoeuJnL1n+za45eA27PmhU10RxWgY?=
 =?us-ascii?Q?a6cQvCKN4AHpUyTvoDSO4x47yQ53YGG68U2i6hj6nVj313P3SaKG8TFrwbbG?=
 =?us-ascii?Q?bPIzFlERR8H2ksU75Q3OYFoHodlaOiIP7FU0dmtysNfwvQStecKOBPOmhd7O?=
 =?us-ascii?Q?QA0NpV45THNC46+I5F2aJ9XNWMJFekT567wLDNGXZL/GGjnrisBFQ/qior1l?=
 =?us-ascii?Q?yAWsCbw3YYCGUO0kZ13CH6lwJBVekrqUyagx8fsJPFQsj1qcXEBtvkMExHST?=
 =?us-ascii?Q?MjPnwArMW5YEjbAT2bIvXDmvxt3Xg3omCBWGIvRJQ+6esmY6+RIh1UtYlPVu?=
 =?us-ascii?Q?JL2+7tIEop3M6QUHn6e4p/l7Q5G/aZocicrHCuvutBXykQ30EV+llqTi91r+?=
 =?us-ascii?Q?JPJ8BkI1FQ9SAqxyimp9kVWobAGheRXnwrQ9YPLRHN+6LIKuRb0fzLfzQ1MT?=
 =?us-ascii?Q?1yk+DTdywHOTHViKDneGiczb6oruCIROkPpHIZfvgo2JW3HAD2Et/UU8QlcT?=
 =?us-ascii?Q?UQ+ZI8Asn8Q27Iqwg3sy9xoimWOlFmtHLWU3CdJIUhS2EZwD2yJ0urfkMMxc?=
 =?us-ascii?Q?hLOfUxO2YB80waLJpoVJTWKvNyQA8TiwvOwKztcShTpPuxS0M0O2uBaWOCg7?=
 =?us-ascii?Q?gP/pkgz2K1MvDhokTKLy9XtdRdNEyQ3Y9/IpKRVPGONdgVdjT+hdf2V+//MH?=
 =?us-ascii?Q?tCQJZH9i0a/1omFjACe9gEqm4W8YhGmuSqQY1cOSiUz6q5GbHuJM7XAY4y63?=
 =?us-ascii?Q?EfR5eM5u8geHQW9RH4+V0mSfeAeoFI1KH8fgjyaj1U+FIqAq+dt/+plT5RXi?=
 =?us-ascii?Q?T9JCYt7Vq61cpGPkfQK0UT5ysskuujQsPXOpKoGU7BToU56Scg3uip7nSW64?=
 =?us-ascii?Q?awUXmMuRiobrfz65j03hcxvmGcFwUaj5HBJRGfQd6SA8NIP8Lg0y7gqyZwTP?=
 =?us-ascii?Q?FNV1lLmmc3BNaIQz93tDgzH35qKCPiNO02ms2JpMtZFhzf/12cr/gduS537E?=
 =?us-ascii?Q?4CaI4By0+UMAAbPGj1onxDR73FEhD2JzF9B3lXKz+mw2GantLQFVmTC3snd8?=
 =?us-ascii?Q?WwksVsvnzk1Mg5+nIqjZWAQbEpfGEM/r22VONtYkiYZUIB2DcXgm33k6Wcbf?=
 =?us-ascii?Q?wYI2TPGYNmJMbon1JFrRhsa8LSeitN0w26VKvAVmFeVV6n1BlIVHBdt4SoH+?=
 =?us-ascii?Q?ExpsYO0g02mKiqF8GU8Xz9u1thew9mUeCQeA+sPdUHTvuueD8rT8Bz8SGkO/?=
 =?us-ascii?Q?4uHHajGS1FBDQ/MXpokxoJNH13sC3bI3eQjNJRwNYnkoiQtgWsmNgFa1I5vI?=
 =?us-ascii?Q?kZw9O9yc0Re2l9cQizSZWPmOelGheks=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b73d3f3a-ab7a-4217-6fd1-08de6a95fd82
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 00:22:37.0475 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tZmlo2JsfEZOCP3JtCdOCK6p/oiy4mbkjStDtgtZm1GTGgJozes+8bqPEeEqbaH+kYU1IIZGug9TKEhK4NZdo6HGs8CM+ugJXHumRu059Tg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6185
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

On Thu, Feb 12, 2026 at 01:49:20AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: Stop applying Wa_16018737384 from Xe3 onward
> URL   : https://patchwork.freedesktop.org/series/161518/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68_BAT -> xe-pw-161518v1_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.

Shards CI (Xe.CI.FULL) seems to be dead right now.  But the shards pool
only has BMG and LNL hardware in it, so they wouldn't have any coverage
of the Xe3 change here anyway.  Only BAT covers Xe3, so going ahead and
applying based on the results here.  Thanks DN for the review.


Matt

> 
>   
> 
> Participating hosts (12 -> 11)
> ------------------------------
> 
>   Missing    (1): bat-bmg-3 
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-161518v1_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Possible fixes ####
> 
>   * igt@xe_waitfence@abstime:
>     - bat-dg2-oem2:       [TIMEOUT][1] ([Intel XE#6506]) -> [PASS][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68/bat-dg2-oem2/igt@xe_waitfence@abstime.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161518v1/bat-dg2-oem2/igt@xe_waitfence@abstime.html
> 
>   
>   [Intel XE#6506]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68 -> xe-pw-161518v1
> 
>   IGT_8751: af788251f1ef729d17c802aec2c4547b52059e58 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68: b4bfe7d753afaf6ea4950111a309a4e2ef5aef68
>   xe-pw-161518v1: 161518v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161518v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
