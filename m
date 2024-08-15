Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1733EC3DA7F
	for <intel-xe@archiver.kernel.org>; Thu, 15 Aug 2024 16:06:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C169310E13F;
	Thu, 15 Aug 2024 16:06:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oDbtNbgl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 322C910E13F
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Aug 2024 16:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723737994; x=1755273994;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ByW//zeb1L/jL5LO1YgUO043/Gz1ak7G6PBbenza3cM=;
 b=oDbtNbglvOhtQjfCM25HAonYsT9UkUc54gINPrJ+axYyoRyxXmU6E1IQ
 IStOKw8v1oTJPaXCKGx8SR1gjI1fuHplHeDcEVK0r1ve9vPnHGVpLxork
 PMaOFkq6ihSDcQCLAdrkyo4wrhwyQxYMZfWlzccipa9RkhTLl8og0plky
 BUEA+zu898+z67UYganRJs6mX6H39al1qv3c56OPeOZ1/p+odi0bdbutE
 Mik2cG1oxQxMna23NdEQANws/a9X1VbppbrECbp89vDYTO5ETM3AN+vk3
 sMwO2xLm6uH++ItZ89VvAGcKkwGtKuOtlgmF+VlikVcWPdObieHszLqu3 w==;
X-CSE-ConnectionGUID: RggNDuelTgOEzI44aG0qmA==
X-CSE-MsgGUID: gknyZmNPRlGIwLr3D0dCSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="25764542"
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="25764542"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 09:06:33 -0700
X-CSE-ConnectionGUID: Ta4r4Rj9TyqUS1U4oL+aRw==
X-CSE-MsgGUID: /SHdH0pGRQ+V458uaEvUvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="64235477"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Aug 2024 09:06:33 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 09:06:32 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 15 Aug 2024 09:06:32 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.46) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 15 Aug 2024 09:06:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sJy6dZHruOeslMuBOODi9LdyAUUyOOe+ypyfumXkNrR6dHeJMwDFQeynlFQCSaoMessrvDRmf7jo1Dp1CAodHV5f0883JaxPu5ORpZ69EKF0PIf977LJZUHgm2UKBjRMcr5jaDN/04vUvP3FwfX8EZNyd2VRz/ZRYejmrqGRRR35suFbqV/kVZ+Rpp6HhLnLAG7Wn1nz5cpnvJZBR2tcdTzuWnfLBdo6pHn8+I/oZpzmCw6JJdTDr+FrzKrBqCtiEJWZNSb14jGE54oCha8GMgnaQTKfLyaGgNF4WoGCNoAoOBF0OgSRg3qEwE35XVeDyEhnWH3CE806Ag3euPkqeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fTLlbimg8JQGQUvxv8eEh82cgPkco6GWRLdhGIkCSlk=;
 b=urq64CDELhvJl4+se1Ed0BQvLZ5QLxN2olEdPTAEIgvnVi7O9r0tTzvcTSkARW9keN8HasbdOT/ernyMkmaMsRM97GN66Hvo3W0gVgyQRmAS0rZ70yygWGpFN4A+uu00w9lmVqlGn9fBMjdMlwytaUWOjThaGWEwoghp955n6cxDPjLD8D6P98fgmwAkgPDRomsHrycLtjkVm3CTmnkgUZ4EHVRRTbgoDcl8aueiPXDLJiC0FvxZeIuZGVGJjulLK1mMvSTOLxPud9x29TbLhdJp2YtjX/Fy1SsIwazbdjALaaggpRUpsjmAZcZ7Th4N35wztI71Jt+0Bwl/F0XzTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SJ0PR11MB5101.namprd11.prod.outlook.com (2603:10b6:a03:2dc::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Thu, 15 Aug
 2024 16:06:28 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%5]) with mapi id 15.20.7875.018; Thu, 15 Aug 2024
 16:06:28 +0000
Date: Thu, 15 Aug 2024 16:05:22 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <michal.wajdeczko@intel.com>,
 <karthik.poosa@intel.com>, <lucas.demarchi@intel.com>
Subject: Re: [PATCH v7] drm/xe: remove GuC reload in D3Hot path
Message-ID: <Zr4nQn541KPaaLlU@DUT025-TGLU.fm.intel.com>
References: <20240814105919.2408428-1-riana.tauro@intel.com>
 <Zr14g9D2jxQ2nKm5@DUT025-TGLU.fm.intel.com>
 <Zr4foqJV28sXjJRH@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Zr4foqJV28sXjJRH@intel.com>
X-ClientProxiedBy: BYAPR21CA0006.namprd21.prod.outlook.com
 (2603:10b6:a03:114::16) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SJ0PR11MB5101:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a1e1c0d-1bdb-4bcd-34e6-08dcbd4438b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XtdkibO45jEHZl3M0SnwSb5pA1G0G+2Wuq/szmCkFZyscWDjdPSVsHeYLkdB?=
 =?us-ascii?Q?uWnZnW2SJOQTPUS6IPm6XANPk3hCGZJEzsCr17WgAi5n/uEen71dJ4iau3tM?=
 =?us-ascii?Q?YYOHCkbiR8J1r20XBvpRT/y7oDPX0JPFQyqqKzjroJZ3rOB0XZvOmr5L024q?=
 =?us-ascii?Q?TuEUzqp9BTctLqCjY6xRdv8BSPbanBpuq7wGfn9xTvGKjzM3fujmdOqigGF2?=
 =?us-ascii?Q?iFKru3d/2uitp75bajPXqakPIVZQHNbvY3L4CZC+olJ1FHhEpcIlDHNT8Zz4?=
 =?us-ascii?Q?wDjQ1xVWuRXDYlmUXD6IbcR5N4bpJ/rf+x9BLaZdGg5lecAAvGuwz071uDNA?=
 =?us-ascii?Q?MDEI3QlEmX8rZNagSyFFsLx7Bi6piI/KBQZBzoVZZOp5RN9izocsIcJdMzR2?=
 =?us-ascii?Q?n2mOdQ6bIvJOo46OPkmV/aQsuRANpgUdJT60KlXcJtgZw2svz5YQFalBTqIH?=
 =?us-ascii?Q?yrCUuMsTBqD9YLaeb7FxFk/Ms7ZjrbcWvLKxKetQXVW/l/6JYh3qpvLqcZME?=
 =?us-ascii?Q?/rqtP1aj68ruQrO0oWNUxi18wCz/EUbH+mD6c+cDXhJNIEZ4L2FYT95cjL4+?=
 =?us-ascii?Q?22ZGtRGB46AiJB3VARHIo0sXwA2BtAwo9dsivPrkU3Z3voI4qhYEHr0lWoEh?=
 =?us-ascii?Q?iMZp2j/KvRussbiA0zrEZbOyafEDjBLuTNWHyNUE5JsPv35Y1u06KGJhsFPf?=
 =?us-ascii?Q?65Bp5lgdzXN8AL4qUb4bGW8MvFfhdiknpIey3mKSZfxOvom0swO1Dhz4jcMW?=
 =?us-ascii?Q?w0oo9Pn/7f/Ic5BgZEZ0zNALw/yksEwL9re3GncpfMdq0u8hkKeGI/cL8kBL?=
 =?us-ascii?Q?DQrBjry4+eo9wNgU+pqnX1HeHgICpLKCaQu9YX1uy/ZBJWfQwHflJWnKUz2D?=
 =?us-ascii?Q?7Ntb+v4q+frwY+sGT4wiju8HKNZ29bXTjk0hpUg9qb19Co2W9asosc2EqjXK?=
 =?us-ascii?Q?1HYc7pdqz4O0aVSdrKUbDV3hTlwb/2Ayzno47XrFIy6Srej+GOot7xWU6j5W?=
 =?us-ascii?Q?+kenMr3g/j2DhJVBPgBvt5Cql7mPORL18UKDhJMXbXad5fKuoKJ3YaB8mDUV?=
 =?us-ascii?Q?Jw+NmUvf3d7431/DOa19hQsPRDv7QKXV5Rr84ZAPwm3y+sneT1ugMSa65H/9?=
 =?us-ascii?Q?3DhoBrIuJxMeHhpZB79ESGyA06iOsg+FDtcgE+R5WhABqhh/aUR8uivjZOZK?=
 =?us-ascii?Q?MQC9QnEeaUy55dU20PJl0TOFpfOOdez4EsQqhDnHWX09jKj/DWRJiKnPL6m9?=
 =?us-ascii?Q?AzzVI7OZQc5yBvr6axrEQ7BFtnv7KeeSBVe84Qr1i12Wo16CjOh51I6Wy41h?=
 =?us-ascii?Q?RZ0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QvYCERpnZ9AdHMJ5Am8M92ijO1zu54Kork/Cdkk2F36w2EN4J82Oxdv1zpyC?=
 =?us-ascii?Q?E3q/iGll5oK+jbOVfL83eAagfpSsFZfpy2yOaoloT7WkJM+yPYys9bDCTt6z?=
 =?us-ascii?Q?5vwAGp+LwSvW3AJ9oS+bNYPMr+ggcXclf3QYmrFeVWHNTXkIYLfjN47kBwYK?=
 =?us-ascii?Q?xSuyAEjB5mb3pUP7PEHWOUVqJavMRb0q5kRNnkEneqB9qMn/S+5BUQ85Q+Lf?=
 =?us-ascii?Q?v6b2W5s0UIBoMPzKoo/znjlCUFWygBfXqcfMq4W4f+JoTVh1s8cJKvaU5Twm?=
 =?us-ascii?Q?LF4aVYbwZj39w4Z11uiljnOzJweYyAnUa+oSKNGunhFLSD4FIorZgZECJt3c?=
 =?us-ascii?Q?BmUfbFCOSpNASX9ZQ4yDPX7geWfsFKdNpOwSOd5xwKAzA2Q8pJZbmj4kn04L?=
 =?us-ascii?Q?ubCyQKuB0nv+OX9dxi834xpd6ezAop3lMhzk4eDr7rs0W9CjyZ9tldhIjJ38?=
 =?us-ascii?Q?HrJEP54qMCHHNgc6Jw/RRoR/vyAboV7tCgY1oFMp2Q+KHlElQfSEoK28VOXS?=
 =?us-ascii?Q?0pBTQc+PJtdIjEImdOXK0j+ZoC7rav+pa0km6Y2Ho73WGoAUr+UjuzLroUs0?=
 =?us-ascii?Q?TFJSvbzTHq1RNzku8rP7Cb6xrVHJq/aysdZBH/2KerfpnrKKGSN58AjAeNFH?=
 =?us-ascii?Q?yPpn5tswMOeXL5WbTfq81qeepqjeHM6cpGxkhUNTtDfdVyE13A30oR2Rdv5e?=
 =?us-ascii?Q?O24xU10dJPKX9OyAVM2nPx6E1XmaY3YYRNEbWNqt+WmaR+aG1GY+lH/KsNpu?=
 =?us-ascii?Q?urAGDXZBcaJfO8upOOgK2fr0fvRS66sc9N1Yn2deUhcM9GkcOhBH5rE1hNdP?=
 =?us-ascii?Q?jo0QTR7xfFF14wvN+dSP7W87wBhDhM6vA5hx/uwT/WCzHK7TXgrxsaok5EuD?=
 =?us-ascii?Q?bxvCiasuoNLM4ieALTnBIVOh+s6CNAn/5QkXuSoNGfp8Znw/0OVWqG/olwxi?=
 =?us-ascii?Q?rQJx6i7iGXeoZn3G6bR2m/WhAxv1kEUD9P4q6nq43TvBNBjVmuaidi99RAqg?=
 =?us-ascii?Q?PmLsrfiKyX4XEsyPkrE656JJW9bA9CoESWolo9Y8WUk3KCw3Z1UfLHfW2pG6?=
 =?us-ascii?Q?PGBZdlgO08p4OP9Y7t1RVsRDyHUk4k1gHtufpr4wXT+0At9HwWL4y461N63i?=
 =?us-ascii?Q?qYV3QaFPUFYAH61JoRSmS52uOrrQ5fYwjRf1XQS32PsF3kNl+Co2c9OuHbtD?=
 =?us-ascii?Q?uQTuvMZy4+SR5nm6qnsXTvAh4ifxm3IEOL3TIZj6JKJw7NojNK4+ObWjiz4C?=
 =?us-ascii?Q?ZNwALMVcdjFtXKtCyBcoKdR/B70uHoqUuP1nmM/DGTAStCFHu0+Wg1LYTROt?=
 =?us-ascii?Q?HCFya9ChYtXglWh/OmUFGMxxMqggOLA1dROS87u3JGSgsM/t+w3UhPBg3Kzq?=
 =?us-ascii?Q?KSfaoquvV68rMn1PsN9n3WkZT/iZ0Oe1a3p00jrsSHRZ9HxQSAl4CGyzPN66?=
 =?us-ascii?Q?7SydapJRnWsYoHHrkJX+DnGIrSbD4GI00Ta9PVyADYAESDE6Az/Mm2tRwaRR?=
 =?us-ascii?Q?c2lWN2RITrC9WezvPtyMZZFx8xyq5XeucZv7Hnl9sHcL6XepI0libemztDmm?=
 =?us-ascii?Q?hI5QDQxrSsGzWZjLCESoCO8ZMB7JKAMx9qcyjpS3/j7MNQi/3QAyvxL8XLAd?=
 =?us-ascii?Q?ZQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a1e1c0d-1bdb-4bcd-34e6-08dcbd4438b5
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 16:06:28.8356 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H385rRA8WevA6iPca8T3o1cVmdCWDGxgGRuKbZmsCu9ClVFce5PJpUwc+HHK8hi3Ol84JTbrKlM2/2DI4CouDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5101
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

On Thu, Aug 15, 2024 at 11:32:50AM -0400, Rodrigo Vivi wrote:
> On Thu, Aug 15, 2024 at 03:39:47AM +0000, Matthew Brost wrote:
> > On Wed, Aug 14, 2024 at 04:29:19PM +0530, Riana Tauro wrote:
> > > Currently GuC is reloaded for both runtime resume and system resume.
> > > For D3hot <-> D0 transitions no power is lost during suspend so GuC reload
> > > is not necessary.
> > > 
> > > Remove GuC reload from D3Hot path and only enable/disable CTB
> > > communication.
> > > 
> > > v2: rebase
> > > 
> > > v3: fix commit message
> > >     add kernel-doc for gt suspend and resume methods
> > >     fix comment
> > >     do not split register and enable calls of CT (Michal)
> > > 
> > > v4: fix commit message
> > >     fix comment (Karthik)
> > >     split patches
> > >     correct kernel-doc (Rodrigo)
> > > 
> > > v5: do not expose internal function of CT layer (Michal)
> > >     remove wait for outstanding g2h as it will be always zero,
> > >     use assert instead (Matthew Brost)
> > >     use runtime suspend and runtime resume pair for CT layer
> > >     (Michal / Matthew Brost)
> > > 
> > > v6: use xe_gt_WARN_ON instead of xe_gt_assert (Michal)
> > >     assert and queue handler if g2h head and tail are
> > >     not equal (Matthew Brost)
> > > 
> > > v7: split functions into runtime suspend and resume (Lucas, Rodrigo)
> > >     move enable irq code to ct runtime resume (Michal)
> > > 
> > 
> > I know this has been a lot of revs, moving target, a bit conflicting
> > feedback but IMO looks really good and ready to merge. The CI failures
> > are a bit concerning though, can you hit retest button or send a rev8?
> > Hard to tell if noise or genuine issues.
> 
> Looking to all the test results for all the reviews I'm honestly
> concerned with this change. It looks to break exactly in tests
> that exercise suspend and resume with some strange kernel warnings
> right after it resumed...
> 

Concerned about all of CI too. Display is all foreign is all to me, so
no idea what is happening their but from my PoV TLB timeouts in CI are
also scary too. If the device goes into suspend prematurely TLB timeouts
could occur. I thought I changed the PM [1] [2] for this to be
impossible but might have screwed that up. So agree all of these failures
to need to be investigated.

Matt

[1] https://patchwork.freedesktop.org/series/136256/
[2] https://patchwork.freedesktop.org/series/136226/

> > 
> > Matt 
> > 
> > > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_gt.c     | 76 ++++++++++++++++++++++++++++++++++
> > >  drivers/gpu/drm/xe/xe_gt.h     |  2 +
> > >  drivers/gpu/drm/xe/xe_guc.c    | 45 ++++++++++++++++++++
> > >  drivers/gpu/drm/xe/xe_guc.h    |  2 +
> > >  drivers/gpu/drm/xe/xe_guc_ct.c | 36 ++++++++++++++++
> > >  drivers/gpu/drm/xe/xe_guc_ct.h |  3 ++
> > >  drivers/gpu/drm/xe/xe_pm.c     |  9 ++--
> > >  drivers/gpu/drm/xe/xe_uc.c     | 30 ++++++++++++++
> > >  drivers/gpu/drm/xe/xe_uc.h     |  2 +
> > >  9 files changed, 202 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > > index 58895ed22f6e..466908c91f44 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > > @@ -831,6 +831,12 @@ void xe_gt_suspend_prepare(struct xe_gt *gt)
> > >  	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> > >  }
> > >  
> > > +/**
> > > + * xe_gt_suspend - GT suspend helper
> > > + * @gt: GT object
> > > + *
> > > + * Return: 0 on success, negative error code otherwise.
> > > + */
> > >  int xe_gt_suspend(struct xe_gt *gt)
> > >  {
> > >  	int err;
> > > @@ -881,6 +887,12 @@ int xe_gt_sanitize_freq(struct xe_gt *gt)
> > >  	return ret;
> > >  }
> > >  
> > > +/**
> > > + * xe_gt_resume - GT resume helper
> > > + * @gt: GT object
> > > + *
> > > + * Return: 0 on success, negative error code otherwise.
> > > + */
> > >  int xe_gt_resume(struct xe_gt *gt)
> > >  {
> > >  	int err;
> > > @@ -909,6 +921,70 @@ int xe_gt_resume(struct xe_gt *gt)
> > >  	return err;
> > >  }
> > >  
> > > +/**
> > > + * xe_gt_runtime_suspend - GT runtime suspend helper
> > > + * @gt: GT object
> > > + *
> > > + * Return: 0 on success, negative error code otherwise.
> > > + */
> > > +int xe_gt_runtime_suspend(struct xe_gt *gt)
> > > +{
> > > +	struct xe_device *xe = gt_to_xe(gt);
> > > +	int ret = 0;
> > > +
> > > +	if (xe->d3cold.allowed)
> > > +		return xe_gt_suspend(gt);
> > > +
> > > +	xe_gt_dbg(gt, "suspending\n");
> > > +	xe_gt_sanitize(gt);
> > > +
> > > +	ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> > > +	if (ret)
> > > +		goto err_force_wake;
> > > +
> > > +	ret = xe_uc_runtime_suspend(&gt->uc);
> > > +
> > > +err_force_wake:
> > > +	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> > > +	if (ret)
> > > +		xe_gt_err(gt, "runtime suspend failed (%pe)\n", ERR_PTR(ret));
> > > +	else
> > > +		xe_gt_dbg(gt, "suspended\n");
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +/**
> > > + * xe_gt_runtime_resume - GT runtime resume helper
> > > + * @gt: GT object
> > > + *
> > > + * Return: 0 on success, negative error code otherwise.
> > > + */
> > > +int xe_gt_runtime_resume(struct xe_gt *gt)
> > > +{
> > > +	struct xe_device *xe = gt_to_xe(gt);
> > > +	int ret = 0;
> > > +
> > > +	if (xe->d3cold.allowed)
> > > +		return xe_gt_resume(gt);
> > > +
> > > +	xe_gt_dbg(gt, "resuming\n");
> > > +	ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> > > +	if (ret)
> > > +		goto err_force_wake;
> > > +
> > > +	ret = xe_uc_runtime_resume(&gt->uc);
> > > +
> > > +err_force_wake:
> > > +	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> > > +	if (ret)
> > > +		xe_gt_err(gt, "runtime resume failed (%pe)\n", ERR_PTR(ret));
> > > +	else
> > > +		xe_gt_dbg(gt, "resumed\n");
> > > +
> > > +	return ret;
> > > +}
> > > +
> > >  struct xe_hw_engine *xe_gt_hw_engine(struct xe_gt *gt,
> > >  				     enum xe_engine_class class,
> > >  				     u16 instance, bool logical)
> > > diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> > > index 8b1a5027dcf2..402322ab8096 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt.h
> > > +++ b/drivers/gpu/drm/xe/xe_gt.h
> > > @@ -55,6 +55,8 @@ void xe_gt_record_user_engines(struct xe_gt *gt);
> > >  void xe_gt_suspend_prepare(struct xe_gt *gt);
> > >  int xe_gt_suspend(struct xe_gt *gt);
> > >  int xe_gt_resume(struct xe_gt *gt);
> > > +int xe_gt_runtime_suspend(struct xe_gt *gt);
> > > +int xe_gt_runtime_resume(struct xe_gt *gt);
> > >  void xe_gt_reset_async(struct xe_gt *gt);
> > >  void xe_gt_sanitize(struct xe_gt *gt);
> > >  int xe_gt_sanitize_freq(struct xe_gt *gt);
> > > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > > index de0fe9e65746..bf365c6cea4d 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > > @@ -1101,6 +1101,51 @@ void xe_guc_sanitize(struct xe_guc *guc)
> > >  	guc->submission_state.enabled = false;
> > >  }
> > >  
> > > +/**
> > > + * xe_guc_runtime_suspend - GuC runtime suspend
> > > + * @guc: GuC object
> > > + *
> > > + * Return: 0 on success, negative error code otherwise.
> > > + */
> > > +int xe_guc_runtime_suspend(struct xe_guc *guc)
> > > +{
> > > +	return xe_guc_ct_runtime_suspend(&guc->ct);
> > > +}
> > > +
> > > +/**
> > > + * xe_guc_runtime_resume - GuC runtime resume
> > > + * @guc: GuC object
> > > + *
> > > + * This function enables interrupts and CTB communication
> > > + *
> > > + * Return: 0 on success, negative error code otherwise.
> > > + */
> > > +int xe_guc_runtime_resume(struct xe_guc *guc)
> > > +{
> > > +	struct xe_device *xe = guc_to_xe(guc);
> > > +	int err;
> > > +
> > > +	/*
> > > +	 * Power is not lost when in D3Hot state, hence it is not necessary
> > > +	 * to reload GuC everytime. Only enable interrupts and
> > > +	 * CTB communication during resume
> > > +	 */
> > > +	if (IS_SRIOV_VF(xe) && xe_device_has_memirq(xe)) {
> > > +		struct xe_gt *gt = guc_to_gt(guc);
> > > +		struct xe_tile *tile = gt_to_tile(gt);
> > > +
> > > +		err = xe_memirq_init_guc(&tile->sriov.vf.memirq, guc);
> > > +		if (err)
> > > +			return err;
> > > +	} else {
> > > +		guc_enable_irq(guc);
> > > +	}
> > > +
> > > +	xe_guc_ct_runtime_resume(&guc->ct);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >  int xe_guc_reset_prepare(struct xe_guc *guc)
> > >  {
> > >  	return xe_guc_submit_reset_prepare(guc);
> > > diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> > > index c3e6b51f7a09..cb062f8ad868 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc.h
> > > +++ b/drivers/gpu/drm/xe/xe_guc.h
> > > @@ -32,6 +32,8 @@ int xe_guc_upload(struct xe_guc *guc);
> > >  int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
> > >  int xe_guc_enable_communication(struct xe_guc *guc);
> > >  int xe_guc_suspend(struct xe_guc *guc);
> > > +int xe_guc_runtime_suspend(struct xe_guc *guc);
> > > +int xe_guc_runtime_resume(struct xe_guc *guc);
> > >  void xe_guc_notify(struct xe_guc *guc);
> > >  int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr);
> > >  int xe_guc_mmio_send(struct xe_guc *guc, const u32 *request, u32 len);
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > index beeeb120d1fc..41bdb9437634 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > @@ -419,6 +419,42 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
> > >  	return err;
> > >  }
> > >  
> > > +/**
> > > + * xe_guc_ct_runtime_resume- GuC CT runtime resume
> > > + * @ct: the &xe_guc_ct
> > > + *
> > > + * Mark GuC CT as enabled on runtime resume
> > > + */
> > > +void xe_guc_ct_runtime_resume(struct xe_guc_ct *ct)
> > > +{
> > > +	struct guc_ctb *g2h = &ct->ctbs.g2h;
> > > +
> > > +	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_ENABLED);
> > > +
> > > +	/* Assert if g2h head and tail are unequal and queue g2h handler */
> > > +	if (xe_gt_WARN_ON(ct_to_gt(ct), desc_read(ct_to_xe(ct), g2h, tail) != g2h->info.head))
> > > +		queue_work(ct->g2h_wq, &ct->g2h_worker);
> > > +}
> > > +
> > > +/**
> > > + * xe_guc_ct_runtime_suspend- GuC CT runtime suspend
> > > + * @ct: the &xe_guc_ct
> > > + *
> > > + * Mark GuC CT as disabled on runtime suspend
> > > + *
> > > + * Return: 0 on success, negative error code otherwise
> > > + */
> > > +int xe_guc_ct_runtime_suspend(struct xe_guc_ct *ct)
> > > +{
> > > +	/* Assert if there are any outstanding g2h and abort suspend */
> > > +	if (xe_gt_WARN_ON(ct_to_gt(ct), ct->g2h_outstanding))
> > > +		return -EBUSY;
> > > +
> > > +	xe_guc_ct_disable(ct);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >  static void stop_g2h_handler(struct xe_guc_ct *ct)
> > >  {
> > >  	cancel_work_sync(&ct->g2h_worker);
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> > > index 190202fce2d0..0cf9d77feb35 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> > > +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> > > @@ -16,6 +16,9 @@ void xe_guc_ct_disable(struct xe_guc_ct *ct);
> > >  void xe_guc_ct_stop(struct xe_guc_ct *ct);
> > >  void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
> > >  
> > > +void xe_guc_ct_runtime_resume(struct xe_guc_ct *ct);
> > > +int xe_guc_ct_runtime_suspend(struct xe_guc_ct *ct);
> > > +
> > >  struct xe_guc_ct_snapshot *
> > >  xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct, bool atomic);
> > >  void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
> > > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > > index 9f3c14fd9f33..0b8e984ffb5c 100644
> > > --- a/drivers/gpu/drm/xe/xe_pm.c
> > > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > > @@ -374,7 +374,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
> > >  	}
> > >  
> > >  	for_each_gt(gt, xe, id) {
> > > -		err = xe_gt_suspend(gt);
> > > +		err = xe_gt_runtime_suspend(gt);
> > >  		if (err)
> > >  			goto out;
> > >  	}
> > > @@ -427,8 +427,11 @@ int xe_pm_runtime_resume(struct xe_device *xe)
> > >  
> > >  	xe_irq_resume(xe);
> > >  
> > > -	for_each_gt(gt, xe, id)
> > > -		xe_gt_resume(gt);
> > > +	for_each_gt(gt, xe, id) {
> > > +		err = xe_gt_runtime_resume(gt);
> > > +		if (err)
> > > +			goto out;
> > > +	}
> > >  
> > >  	if (xe->d3cold.allowed) {
> > >  		xe_display_pm_resume(xe, true);
> > > diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> > > index 0d073a9987c2..7bbc8b3c556f 100644
> > > --- a/drivers/gpu/drm/xe/xe_uc.c
> > > +++ b/drivers/gpu/drm/xe/xe_uc.c
> > > @@ -288,6 +288,36 @@ int xe_uc_suspend(struct xe_uc *uc)
> > >  	return xe_guc_suspend(&uc->guc);
> > >  }
> > >  
> > > +/**
> > > + * xe_uc_runtime_suspend - uC runtime suspend
> > > + * @uc: uC object
> > > + *
> > > + * Return: 0 on success, negative error code otherwise
> > > + */
> > > +int xe_uc_runtime_suspend(struct xe_uc *uc)
> > > +{
> > > +	if (!xe_device_uc_enabled(uc_to_xe(uc)))
> > > +		return 0;
> > > +
> > > +	return xe_guc_runtime_suspend(&uc->guc);
> > > +}
> > > +
> > > +/**
> > > + * xe_uc_runtime_resume - uC runtime resume
> > > + * @uc: uC object
> > > + *
> > > + * Called while resuming from D3Hot
> > > + *
> > > + * Return: 0 on success, negative error code otherwise
> > > + */
> > > +int xe_uc_runtime_resume(struct xe_uc *uc)
> > > +{
> > > +	if (!xe_device_uc_enabled(uc_to_xe(uc)))
> > > +		return 0;
> > > +
> > > +	return xe_guc_runtime_resume(&uc->guc);
> > > +}
> > > +
> > >  /**
> > >   * xe_uc_remove() - Clean up the UC structures before driver removal
> > >   * @uc: the UC object
> > > diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
> > > index 506517c11333..0beec5efde6b 100644
> > > --- a/drivers/gpu/drm/xe/xe_uc.h
> > > +++ b/drivers/gpu/drm/xe/xe_uc.h
> > > @@ -15,6 +15,8 @@ int xe_uc_init_hw(struct xe_uc *uc);
> > >  int xe_uc_fini_hw(struct xe_uc *uc);
> > >  void xe_uc_gucrc_disable(struct xe_uc *uc);
> > >  int xe_uc_reset_prepare(struct xe_uc *uc);
> > > +int xe_uc_runtime_suspend(struct xe_uc *uc);
> > > +int xe_uc_runtime_resume(struct xe_uc *uc);
> > >  void xe_uc_stop_prepare(struct xe_uc *uc);
> > >  void xe_uc_stop(struct xe_uc *uc);
> > >  int xe_uc_start(struct xe_uc *uc);
> > > -- 
> > > 2.40.0
> > > 
