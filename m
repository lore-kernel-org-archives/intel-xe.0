Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4081CC3DA4A
	for <intel-xe@archiver.kernel.org>; Mon, 19 Aug 2024 16:43:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B0EF10E27D;
	Mon, 19 Aug 2024 16:43:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XqZTH3GJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58BB110E27D
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Aug 2024 16:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724085817; x=1755621817;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=kaco/5hFxSSeguEfYVqId1HW6vm0QVPGXafFBej/LDY=;
 b=XqZTH3GJhqcejhimHMp1GmKeYX5JBQjtNvOPhf33JyEIpASC5/CHg0eM
 UBd5DCiLKgbp2b6F0mOkKh0VGE1iGyEOoh5ggtDqdR070hExcBv102B+h
 oz0x3wXHwkLGwRLtRMyF9HoGfTWIW6MqTRN2HGebKt0OHfYxZk3Eu04bZ
 v3Uix8f0lhXVTgakXfq1o7EWz5Q/zZxkzLuaH6PFxqsbr3878j1srF2Nu
 3rHI5gjIq/7KjWF8CdJN8Imcc/hN6z82RoDR8AruckP2QS6TVb0MVT413
 1dbYX09sGE1GzksAEAAY52CTx4atyt8pIXAZczWwNv29tcdbAsfrPWEG7 A==;
X-CSE-ConnectionGUID: 4OImtiTMSc2HwbC2kof/ng==
X-CSE-MsgGUID: uOlYp+MeQCaJ93uyHheCcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="33016130"
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; d="scan'208";a="33016130"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 09:43:37 -0700
X-CSE-ConnectionGUID: 8pqCqPEfRtSLhkAE2wNNsw==
X-CSE-MsgGUID: aRmiCbgCQvWISqLVG69pKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; d="scan'208";a="91170982"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Aug 2024 09:43:37 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 19 Aug 2024 09:43:36 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 19 Aug 2024 09:43:35 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 19 Aug 2024 09:43:35 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 19 Aug 2024 09:43:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f3ldpiNgTQAm6bTMq6uoQ7ee9fQ0rD9TZ45qf/qXoTTAVWw7Jc21yf2S02+XrYjANqGezhsQ/28DDanANuxVQUhlj7+zRGHf/y7M/UFE4WWlGnLTekp/kwQ/Fdaq6cvhIqUQaCZjTNX6y1aIENtWDHvKtO4+hu+ZXYRtSnKkpOdvMwlUhff5e2S2IKS7wkYsFjinkF+PRuzlksZHUrHcQYerXic4y13Cpiwi/1S9/LH/jtzdLrDQsVghCyq5s/1ncq+f/LG9gkHxWtkpnvbdXfN7HV2PM/lJo37rVuLdkG0mJk59wxSRMicdm+GOKrCRHn0neVPsfWN8TAzYMu3yVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U4NstuC+tmIWKcET7kByuEG2H+eEXnWSnGxCAldS4QY=;
 b=lD+STHk/We4el6PdUz/5ZJ3N3L6dC/Yh5kpXtQIfMyqa1XOLjPjcpGuddLd258H9DYxvMv9hnDkcGcfAi8zA1SU8K6SzmKabtLhfcuwoTa+oiPxzUk531XWBhM+8khKBAUtGDiUuVRccQFiE8B7TrFzASHrTU7a4/a6FuApseNbHNH1nbjXUqBHb3BCNcfT2fKT08HGSo6O2GzmExTSfufvURYppGyrvyOkPnGUG+jafBeMjy5adA8NGiMEBSQAKjxjMVpu7h45W22rRxBLZ5lQDb62g9UGYXpTiuM5Du6j5XiW+V0KtdmZ9X4qmwFtOJODFgfvHtayfKL6n2vC3bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB7062.namprd11.prod.outlook.com (2603:10b6:806:2b3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 16:43:32 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7875.018; Mon, 19 Aug 2024
 16:43:31 +0000
Date: Mon, 19 Aug 2024 16:42:17 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Invalidate media_gt TLBs in PT code
Message-ID: <ZsN16ceENDNowy+c@DUT025-TGLU.fm.intel.com>
References: <20240818005055.357593-1-matthew.brost@intel.com>
 <054ef733-3678-4696-952a-6dec02d91dba@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <054ef733-3678-4696-952a-6dec02d91dba@intel.com>
X-ClientProxiedBy: SJ0PR13CA0121.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::6) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB7062:EE_
X-MS-Office365-Filtering-Correlation-Id: a2890e7c-50ff-4558-15e1-08dcc06e0f76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?VWfaDdOuax4o94fWOGiHv8gVwyfm+49oc0wPqgxndNGRKJEbJKkNGCXH/N?=
 =?iso-8859-1?Q?JaEagPbGWQ34MArDDYIZJwZz6F0WK5ZNXoNmMEtT+MDq6tCPl5R/NTBqP/?=
 =?iso-8859-1?Q?fgpBf2era1WR1yith+UcI1kBdH8MhaVWsqyrVk9zFadJYe9X0rITE3GvXy?=
 =?iso-8859-1?Q?PeoWHehQdm76BPucUBss6JqV4b9qoBFgmAo2D6nE2qUkAkym5+V7OZJ074?=
 =?iso-8859-1?Q?qCMhi3XvcSVzvboDy/mfLXAjIdSKVswMlJMvgAcGnuuvNNiCd0dd1ipN6B?=
 =?iso-8859-1?Q?wCxJrXiOUfRjde4Vn/y/ZHHtYuMmDA53qamM4SotWrVRzpKGd/sHM2CpG0?=
 =?iso-8859-1?Q?leHOOeS5/MU69O48Q99U50PmfzDHfoU0jJ5pJlOmJlIiwUEn4tX/j76Ua/?=
 =?iso-8859-1?Q?oQ5vhFEKAxwb2vbG2f+VuDiaA6Y27N5yrYhKN2czWF6GugKeulizAmFmBQ?=
 =?iso-8859-1?Q?68fpDZYMXOQhalYKgRl4O3ws/zMXZUn18i+SkgqSP0wp7vQnMKVsB1kzTQ?=
 =?iso-8859-1?Q?khsTTwSq0I0vpTi4AKq2BhWLYbJp1rxpxL0u9w9oJPgB/5L+GLLnhpw3LK?=
 =?iso-8859-1?Q?m3qgZdHRRpolu/YZUtnBBSSxQ2eolZUFsjWiaBd8bM5kjkeyV1ojnO1Y9o?=
 =?iso-8859-1?Q?WU6iQqa3pw5RFQp84Z0/XxwXhVsU7WgLK/0xDy4bRtR7TDKIRp1/Rc3pN0?=
 =?iso-8859-1?Q?7JMApgfvwX+GSAnGTSFB2ftKOgwXEdb7by22EF2TawkI9wkCNZw1htWQLW?=
 =?iso-8859-1?Q?0vm/sFGOqsLBVgsteA+NcT0aaRzXUtqmD2qOx9G9ZWonq5Y/ppjj7mX0ja?=
 =?iso-8859-1?Q?EXt6Ii6GwV6Akvpo+PNkLbqggNkiDeN5ev4kgdvqrO257wB6Yawd0g/oJD?=
 =?iso-8859-1?Q?y2JMeW8V5V2YpSjbOWFCGiQMdoJyOi3u4NYSnOjVLjL/mbXms2uQjesBXS?=
 =?iso-8859-1?Q?cJFzcjgmPsRWPlfi+nhPb5yvCgMd5GfslPNhc8lwd2c9m+5Nwpr9xX7bzd?=
 =?iso-8859-1?Q?KmbbBuTy5U3271ip9NAkKBFJGLde2f7em89+lw48vJJvKXMYNUI+8gLLua?=
 =?iso-8859-1?Q?qgAFCYfEH2KCOZnTdgaYWScq9g1YNQpM67LVRttNyMt+4B3zz0gz9fDinw?=
 =?iso-8859-1?Q?8pRVWFnJzodBhvVEy9eEaKgMLE/aRLN89vBf65N6aPFAavZaQHysY9OHEE?=
 =?iso-8859-1?Q?Zq54ybSpF+qEttRU1v8/PckX73FHwnmRYwwwesm2lDJQoKwKsT127IHL9r?=
 =?iso-8859-1?Q?DNXrSlFfPbf8JC+A0c/LcxUalySnOUAsUVU2GaC214ClomUKicdQYc2tTA?=
 =?iso-8859-1?Q?eREUF8MmLmVqHxlSc7gQWoELIgYY38VyIqIkgQjUqYAmYiNEnVnKLPsXIa?=
 =?iso-8859-1?Q?H0QyojfP6s/DoMvJJaT/eag9jI+EfakQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?xxzy0LI72E7PseQKNSRxn9bjYECv7Rs6IPt751Owi7cbm+UtrXLBWYSvJo?=
 =?iso-8859-1?Q?FbrTVOndoPw9eoEwYkruOBBZyDG0kOtGXX3KCg1WMxkYo1PrKrXM0QgWt6?=
 =?iso-8859-1?Q?p+JfAzHy0O7F2UTLVJm7IKV+ibcjTRSjOZeyWDvbTFOWfiS4shTZXsZxRv?=
 =?iso-8859-1?Q?v3Gmyg3zrYTb0U7fL3BknQkc/vFiAHZgtRpnndG3vKWafhqOulcXmrnADI?=
 =?iso-8859-1?Q?/R+BP/XCTXzOn/eIMHx+gA0XC+vycRDbFzW/JOwvpluup33SbRyeXzfliw?=
 =?iso-8859-1?Q?fPxwudpFipgwVWSKT98IxGxu8BFdF6in2BnAP5maBwsuf4GTNtsQTHIwip?=
 =?iso-8859-1?Q?owwlXRsQlfKqpz7N8lZdl6Fr1p80GUup2JgOT5jYgv6zgSAu5oijpmg+dl?=
 =?iso-8859-1?Q?FfHKdBAoJKrKYoqLJR+aQ8W7feilK/OtrLI6KjrHS/SFK86AOqooqoh36G?=
 =?iso-8859-1?Q?zoKGqyNAXUHtTrmDz2VTbfNfnKP25PpsdeyRRKwGM77R2wgp/TShf1I7SR?=
 =?iso-8859-1?Q?Zvs0CFAvLARpoZ/ciutUgioMgyYVR3gGr8SbH8nfAByATZIavCaV+5AA2T?=
 =?iso-8859-1?Q?Z6j7FSMisZWlkpkRKkFKlhPFFz+lJD9Y3Ag+2FxkqRJ0YTlvcG1VYaXWjO?=
 =?iso-8859-1?Q?vkRG4Sv1RWCBTnyCPuHm2GkUo6ihgfkea+YUTX7b1f02NLrbI7u1K/pYao?=
 =?iso-8859-1?Q?ncFWFAuQIXhvjxuX6/a7GzjtzU2zc4fh1Fr0E5phLgTBQ6RieY87zgBHek?=
 =?iso-8859-1?Q?GEXU/xHFLf/x0gMiSqYUfh4x6WvRa4868EUAk32JZOoM9iYG7E1Xn+lxYo?=
 =?iso-8859-1?Q?MvFDSEFRoRd4qKPnJktI/rsNHJvF3wH3J0JksyM3Qi75ejvN/5yQ2/APPZ?=
 =?iso-8859-1?Q?al2wcO2oI/imaV1cePHSUPhDOFQDiyvKi6TQlVoFk2HfLDqFzFDyeKfx4S?=
 =?iso-8859-1?Q?SvqxJnKC3TJirj24rVRDmvsFUjnw1cIXae/SzEaSgTGqsxRp3fiArIunkb?=
 =?iso-8859-1?Q?jrxut9uMR/ExV+jcMkSUlJvabYTc+KF8FgNOIfZxXUbKQ9O1MYRnKToS/r?=
 =?iso-8859-1?Q?g6xiMW+sgYyEyYKFoqwbISCEH6+wAWvXyFxAKjPBTuyauENboL3P8KYYLV?=
 =?iso-8859-1?Q?ocQXpm4D0irF05HEqgqEErpvvziJdCLLqfzDu0rTbvdc1Q/oSPyTpORh2G?=
 =?iso-8859-1?Q?bxFqFn3Vrnazj89RdsDnbYFOdlVQ6tS0tNp13eJVgKD3XnRh36f8RINgg1?=
 =?iso-8859-1?Q?3LPK86C0LYXy4N5QRbl9gKhh4ZJw4/N04AIL2DRYimcR3xHg/A1nn4r+t+?=
 =?iso-8859-1?Q?TXwwMnWvfGIxwLfSfC0ZqQ6M+B/784pOZ/qkhSxejEEhfOSA/DIphI48xr?=
 =?iso-8859-1?Q?v9jB69LoewqnHEXWkC7RvHwaXRrjM1x830EorzFg2Z96iarhda45uDLov3?=
 =?iso-8859-1?Q?PztbmlLr7Sm1zhn0PWwBhw/OEZQabKRT90m06OHa15VxaVame7j+Jlh8YF?=
 =?iso-8859-1?Q?rfqN/CPA34+dJmGbgtHZ3yZ8kfUiCOeuUtjvFUNZHgmrZmJqyb7TodoNqj?=
 =?iso-8859-1?Q?IYWY4bwDw4DaJWKm+Ttyp5x3pERWN8AYS0zGlethwYYS5YqklhLBzd4SNj?=
 =?iso-8859-1?Q?jNgH60w7ncGOFKyYyRC+mfyYN56T/Zb5NKUvZki1WoV9GGVdCdR6V5WQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a2890e7c-50ff-4558-15e1-08dcc06e0f76
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 16:43:31.9146 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: akmDkmNmh76G8zPQltEWdBeFjhTq5aOiAqzhCq0Vn7FA91pY7pjRhOxnVMKUYB3X2WX9hitM2XTwTKtmMXUGXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7062
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

On Mon, Aug 19, 2024 at 01:32:44PM +0530, Ghimiray, Himal Prasad wrote:
> 
> 
> On 18-08-2024 06:20, Matthew Brost wrote:
> > Testing on LNL has shown media GT's TLBs need to be invalidated via the
> > GuC, update PT code appropriately.
> > 
> > Fixes: 3330361543fc ("drm/xe/lnl: Add LNL platform definition")
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_pt.c | 99 ++++++++++++++++++++++++++++++--------
> >   1 file changed, 80 insertions(+), 19 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index 579ed31b46db..9d16e5772464 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -3,6 +3,8 @@
> >    * Copyright © 2022 Intel Corporation
> >    */
> > +#include <linux/dma-fence-chain.h>
> > +
> >   #include "xe_pt.h"
> >   #include "regs/xe_gtt_defs.h"
> > @@ -1849,13 +1851,20 @@ int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vma_ops *vops)
> >   static void bind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
> >   			   struct xe_vm_pgtable_update_ops *pt_update_ops,
> > -			   struct xe_vma *vma, struct dma_fence *fence)
> > +			   struct xe_vma *vma, struct dma_fence *fence,
> > +			   struct dma_fence *fence2)
> >   {
> > -	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
> > +	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm) {
> >   		dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence,
> >   				   pt_update_ops->wait_vm_bookkeep ?
> >   				   DMA_RESV_USAGE_KERNEL :
> >   				   DMA_RESV_USAGE_BOOKKEEP);
> > +		if (fence2)
> > +			dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence2,
> > +					   pt_update_ops->wait_vm_bookkeep ?
> > +					   DMA_RESV_USAGE_KERNEL :
> > +					   DMA_RESV_USAGE_BOOKKEEP);
> > +	}
> >   	vma->tile_present |= BIT(tile->id);
> >   	vma->tile_staged &= ~BIT(tile->id);
> >   	if (xe_vma_is_userptr(vma)) {
> > @@ -1875,13 +1884,20 @@ static void bind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
> >   static void unbind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
> >   			     struct xe_vm_pgtable_update_ops *pt_update_ops,
> > -			     struct xe_vma *vma, struct dma_fence *fence)
> > +			     struct xe_vma *vma, struct dma_fence *fence,
> > +			     struct dma_fence *fence2)
> >   {
> > -	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
> > +	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm) {
> >   		dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence,
> >   				   pt_update_ops->wait_vm_bookkeep ?
> >   				   DMA_RESV_USAGE_KERNEL :
> >   				   DMA_RESV_USAGE_BOOKKEEP);
> > +		if (fence2)
> > +			dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence2,
> > +					   pt_update_ops->wait_vm_bookkeep ?
> > +					   DMA_RESV_USAGE_KERNEL :
> > +					   DMA_RESV_USAGE_BOOKKEEP);
> > +	}
> >   	vma->tile_present &= ~BIT(tile->id);
> >   	if (!vma->tile_present) {
> >   		list_del_init(&vma->combined_links.rebind);
> > @@ -1898,7 +1914,8 @@ static void unbind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
> >   static void op_commit(struct xe_vm *vm,
> >   		      struct xe_tile *tile,
> >   		      struct xe_vm_pgtable_update_ops *pt_update_ops,
> > -		      struct xe_vma_op *op, struct dma_fence *fence)
> > +		      struct xe_vma_op *op, struct dma_fence *fence,
> > +		      struct dma_fence *fence2)
> >   {
> >   	xe_vm_assert_held(vm);
> > @@ -1907,26 +1924,28 @@ static void op_commit(struct xe_vm *vm,
> >   		if (!op->map.immediate && xe_vm_in_fault_mode(vm))
> >   			break;
> > -		bind_op_commit(vm, tile, pt_update_ops, op->map.vma, fence);
> > +		bind_op_commit(vm, tile, pt_update_ops, op->map.vma, fence,
> > +			       fence2);
> >   		break;
> >   	case DRM_GPUVA_OP_REMAP:
> >   		unbind_op_commit(vm, tile, pt_update_ops,
> > -				 gpuva_to_vma(op->base.remap.unmap->va), fence);
> > +				 gpuva_to_vma(op->base.remap.unmap->va), fence,
> > +				 fence2);
> >   		if (op->remap.prev)
> >   			bind_op_commit(vm, tile, pt_update_ops, op->remap.prev,
> > -				       fence);
> > +				       fence, fence2);
> >   		if (op->remap.next)
> >   			bind_op_commit(vm, tile, pt_update_ops, op->remap.next,
> > -				       fence);
> > +				       fence, fence2);
> >   		break;
> >   	case DRM_GPUVA_OP_UNMAP:
> >   		unbind_op_commit(vm, tile, pt_update_ops,
> > -				 gpuva_to_vma(op->base.unmap.va), fence);
> > +				 gpuva_to_vma(op->base.unmap.va), fence, fence2);
> >   		break;
> >   	case DRM_GPUVA_OP_PREFETCH:
> >   		bind_op_commit(vm, tile, pt_update_ops,
> > -			       gpuva_to_vma(op->base.prefetch.va), fence);
> > +			       gpuva_to_vma(op->base.prefetch.va), fence, fence2);
> >   		break;
> >   	default:
> >   		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> > @@ -1963,7 +1982,8 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
> >   	struct xe_vm_pgtable_update_ops *pt_update_ops =
> >   		&vops->pt_update_ops[tile->id];
> >   	struct dma_fence *fence;
> > -	struct invalidation_fence *ifence = NULL;
> > +	struct invalidation_fence *ifence = NULL, *mfence = NULL;
> > +	struct dma_fence_chain *chain_fence = NULL;
> >   	struct xe_range_fence *rfence;
> >   	struct xe_vma_op *op;
> >   	int err = 0, i;
> > @@ -1996,6 +2016,18 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
> >   			err = -ENOMEM;
> >   			goto kill_vm_tile1;
> >   		}
> > +		if (tile->media_gt) {
> > +			mfence = kzalloc(sizeof(*ifence), GFP_KERNEL);
> > +			if (!mfence) {
> > +				err = -ENOMEM;
> > +				goto free_ifence;
> > +			}
> > +			chain_fence = dma_fence_chain_alloc();
> > +			if (!chain_fence) {
> > +				err = -ENOMEM;
> > +				goto free_ifence;
> > +			}
> > +		}
> >   	}
> >   	rfence = kzalloc(sizeof(*rfence), GFP_KERNEL);
> > @@ -2030,16 +2062,42 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
> >   		invalidation_fence_init(tile->primary_gt, ifence, fence,
> >   					pt_update_ops->start,
> >   					pt_update_ops->last, vm->usm.asid);
> > -		fence = &ifence->base.base;
> > +		if (mfence) {
> > +			dma_fence_get(fence);
> 
> 
> It seems that dma_fence_get should be called within the if (mfence) before
> initializing ifenc. If the fence has already been signaled, the fence for
> ifence would have been released by this point in the code.
> 
> (ret == -ENOENT) inside invalidation_fence_init.
> 

That is correct, saw a UAF pop when testing with this. Have fixed
locally and will include in next rev.

> 
> > +			invalidation_fence_init(tile->media_gt, mfence, fence,
> > +						pt_update_ops->start,
> > +						pt_update_ops->last, vm->usm.asid);
> > +			dma_fence_chain_init(chain_fence, &ifence->base.base,
> > +					     &mfence->base.base, 0);
> > +			fence = &chain_fence->base;
> > +		} else {
> > +			fence = &ifence->base.base;
> > +		}
> >   	}
> > -	dma_resv_add_fence(xe_vm_resv(vm), fence,
> > -			   pt_update_ops->wait_vm_bookkeep ?
> > -			   DMA_RESV_USAGE_KERNEL :
> > -			   DMA_RESV_USAGE_BOOKKEEP);
> > +	if (!mfence) {
> > +		dma_resv_add_fence(xe_vm_resv(vm), fence,
> > +				   pt_update_ops->wait_vm_bookkeep ?
> > +				   DMA_RESV_USAGE_KERNEL :
> > +				   DMA_RESV_USAGE_BOOKKEEP);
> > +
> > +		list_for_each_entry(op, &vops->list, link)
> > +			op_commit(vops->vm, tile, pt_update_ops, op, fence, NULL);
> > +	} else {
> > +		dma_resv_add_fence(xe_vm_resv(vm), &ifence->base.base,
> > +				   pt_update_ops->wait_vm_bookkeep ?
> > +				   DMA_RESV_USAGE_KERNEL :
> > +				   DMA_RESV_USAGE_BOOKKEEP);
> > +
> > +		dma_resv_add_fence(xe_vm_resv(vm), &mfence->base.base,
> > +				   pt_update_ops->wait_vm_bookkeep ?
> > +				   DMA_RESV_USAGE_KERNEL :
> > +				   DMA_RESV_USAGE_BOOKKEEP);
> > -	list_for_each_entry(op, &vops->list, link)
> > -		op_commit(vops->vm, tile, pt_update_ops, op, fence);
> > +		list_for_each_entry(op, &vops->list, link)
> > +			op_commit(vops->vm, tile, pt_update_ops, op,
> > +				  &ifence->base.base, &mfence->base.base);
> > +	}
> >   	if (pt_update_ops->needs_userptr_lock)
> >   		up_read(&vm->userptr.notifier_lock);
> > @@ -2049,6 +2107,9 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
> >   free_rfence:
> >   	kfree(rfence);
> >   free_ifence:
> > +	if (chain_fence)
> 
> This check seems redundant, dma_fence_chain_free handles NULL input.
> 

Good to know. Will drop this then.

Matt

> 
> > +		dma_fence_chain_free(chain_fence);
> > +	kfree(mfence);
> >   	kfree(ifence);
> >   kill_vm_tile1:
> >   	if (err != -EAGAIN && tile->id)
