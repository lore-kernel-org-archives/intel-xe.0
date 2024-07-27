Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68441C3DA49
	for <intel-xe@archiver.kernel.org>; Sat, 27 Jul 2024 01:46:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 298F210E047;
	Sat, 27 Jul 2024 01:46:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bwdjq4al";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D62DB10E047
 for <intel-xe@lists.freedesktop.org>; Sat, 27 Jul 2024 01:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722044794; x=1753580794;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=blltV8PmDxAr6cyBq7uqI7+3EgZsoLN0xdsCbf7bf38=;
 b=bwdjq4alTQDk11I2E7U13Nl3A5JgY1ZfUft4LgMpSfR0Q1jQ2fZj6Jy5
 lFCO7JgW1/pqfyT/oNPcWyXh8knijCQq5iV8fmwh4zMPcQ+U3f0JwIkpN
 h0HNOvyQhZDZao+2+dAGxHOqsvylQ+K1C+8mk0cvcOuOpdR+8HOS29lrz
 kQliRX+tzYter5W8scMga0C4luj0FQLg/Ecrag0Pa1JAMJJKb8fyLOUlG
 IBrSI2w1jpGOPplcEcs2nTfkiXJaQ5fnybAFilu024thupqEBLiwWsRZT
 Ga1RHfCvARfs7JyUmf+4ktYAavpKtQy3Ub4jwHvhQQBvndJBMhOoQSqXk g==;
X-CSE-ConnectionGUID: lxMw71saRmOSEjvULSsC5Q==
X-CSE-MsgGUID: 1tiXpR6XT9GhyXDy4BH1qQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="19459520"
X-IronPort-AV: E=Sophos;i="6.09,240,1716274800"; d="scan'208";a="19459520"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 18:46:33 -0700
X-CSE-ConnectionGUID: 8rc4dPUkTDyaJgGUdaZIdw==
X-CSE-MsgGUID: cvDBTxnbRPSfG88oDikdJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,240,1716274800"; d="scan'208";a="54220009"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jul 2024 18:46:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 26 Jul 2024 18:46:32 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 26 Jul 2024 18:46:32 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 26 Jul 2024 18:46:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xkVMCv48LGwMCcNI1LWk59oH+Os7wwdGK0XBkdy3Ij0wg+nGJsSsGpOjIhUZDB1grieTjt8+WYl/oFdVjmPb7mqkExnOZK2cd6WlDSebxMjP7NdjK8XF+XJGx1RJHhoytutfvNG1JHcITRtcPsnWVj7toGsJd5mMJM1+Nx0rq7iRu6O5sBaWPtTIj9gi/8bZWqi9ljKqZRxKj/2fR3wQm6Vc/DWyVs0d6FMYLBnLC5S3r2FJRBNfOgeB1OKyReq4+bCwwwWNIB1FaJCuRKMOVOQfNaplTxhg1VflpKrfheCkzmnrtoFrO2AALG/pbbZRee/KXtg/Ns3p/ub4ECtCIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gcV9efovGeuPmW4XrblsEcutb7eDDaxpL9gTBk+R7Gg=;
 b=DYUdYmDKF4dzdkXMEjtFXHOZEQeWLaezeAThSOoyuMjUoIXjU5bjlNS/G3Y4XUPjh7kvfhHOkQAIa1rEtXrkKq+y242rEluhDMOCq0cBsTrSFkPZNdPtAnKXdl8/E8olNk4MvaNt/TjSNxJv5TbnbBWSKRla2sF5cCkHnVyqiCvU4s/QONPMyZLubWrVNBwYhpz+oRU9WKlhqcnXbPNS1TOS4GgX7jUFX/Hsiq6cZmzUaemFjZ5ol434aLQhTPYuqJhiTNSe2DiugISf22q32G2aRHEafalb8lwdCxJVMzGAFbRhGMvMmi4XUNBOWuIFErRJ1rKN9FedUINc+ceq9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB7782.namprd11.prod.outlook.com (2603:10b6:8:e0::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.19; Sat, 27 Jul 2024 01:46:29 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7784.020; Sat, 27 Jul 2024
 01:46:28 +0000
Date: Sat, 27 Jul 2024 01:45:38 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Maciej Patelczyk <maciej.patelczyk@intel.com>
Subject: Re: [PATCH 15/21] drm/xe/eudebug: implement userptr_vma access
Message-ID: <ZqRRQmDz9zF/IMUW@DUT025-TGLU.fm.intel.com>
References: <20240726140818.54304-1-mika.kuoppala@linux.intel.com>
 <20240726140818.54304-16-mika.kuoppala@linux.intel.com>
 <ZqPvBYnU4ULY1BxS@DUT025-TGLU.fm.intel.com>
 <ZqPv8NNmBSqbNJF+@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZqPv8NNmBSqbNJF+@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: BYAPR06CA0025.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::38) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB7782:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e3f0de1-a3c7-492a-0b49-08dcadddeeea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pLzacgJtjvtvAxYAYwtPudw+97tCImWUEJTIoCOwPlIFq1lQ7eKUFZeu0Vve?=
 =?us-ascii?Q?gKy+JcsE3fFzAC6LWbVCTlNwQ6f8zpOPCUZKrg6rK/HqFuG8l8jLJtLjFmyq?=
 =?us-ascii?Q?CVea0QlY7fWZbI94URzTTaxkEc2hQkoAaoR8gtjQu8aCDndj5zcb5Tny9Gvj?=
 =?us-ascii?Q?2b2Qa6364U7nBpyTe1BUaJutwAGLAZYmGn6QeI6067k4oZQZytgFu2avs4Tr?=
 =?us-ascii?Q?JAsFK9EQb11mbv2/Q4LrlkD9teZfl0JPgT+5lVQP2pPmaWiZUzsT2VeyPJWN?=
 =?us-ascii?Q?Yh2yCLVw3PxtCg8fy3+1x69WVS8pznjMKj3Q1gbu2DafXEtcURADbiG7puFh?=
 =?us-ascii?Q?Y8MeXdRk+IOzVg1bESXYbU9Rsz+1hXhVpiqlTWWl+miaKxN54gFpnp9tv0Vb?=
 =?us-ascii?Q?rt3PSMYIRbx6xFYniGq7yDRfkgcA6pADF3b+Nh+26GdqxV1UOdOU9rYHHqAB?=
 =?us-ascii?Q?phRKuzhQJVKUcpXoNNBTu0H3oB6SV0dHabxdkZ7dr+cUtFKqWJAn7ZyePcmU?=
 =?us-ascii?Q?OyNW8a5RXCBrgYnziomCznr92wrPsWzLmjt7JYP6blmeeDgNT8WvlilGCqxu?=
 =?us-ascii?Q?NgtPsRk9XtivQfnOMW2DeFUhyEHUtK7YYMq0NwCxsa9fVgpNNghRVPOzrb5r?=
 =?us-ascii?Q?7PeL/eaB8+scMn+JUYdSxMgwvUOXbHeKWA6dBOf3XaHhwy0VCz2HFpBx1VHN?=
 =?us-ascii?Q?7wuJV41Erlnk4mu3r4me4wCgkRbJLgNYiSmWekI5loH+GmgT0hhAE4vSTvG3?=
 =?us-ascii?Q?NISyGJFdii/EQZO8KbLfR2+5DAoZoe+qj3jIjpNTaRmGiufQc0BXPTC3Vimm?=
 =?us-ascii?Q?dXnPzab3ArcxvXdkkfk23KPcROkDxPeUytYNvzTriKPN+YmpBY/wNEBBFmva?=
 =?us-ascii?Q?R1n35d8ePb9Ifz/gaiILMajW93DHTtPMQ0I/CjqxFlw7YGuFYtSpPuRhm+ym?=
 =?us-ascii?Q?nTUME7MyrV3rnq2tuk9R+QOFz79618DnaJnllwC26jZpa0MK0ovrGaiQdLfe?=
 =?us-ascii?Q?FqGIkW93k4cPJsxGOVgeqIn2WC6wnQeke/80tdvuoARyT1bkp6/cBO2mrQZR?=
 =?us-ascii?Q?eN7F6lt7CuKYYRG+vHyTPqwbnlPjKa/E0fU9QKFDsF64E0DPUck+XkHloE+/?=
 =?us-ascii?Q?APwvNYwoIEf8PVZcAUHZyq8iG0PB+MKrcl13xtM++QLUHMqk+78bvMfV2lYW?=
 =?us-ascii?Q?JAG28H/EOX6bnsVJvOINwmeEd0QOLKTUHAqmh3PTzgmjb1fSNHccS3UvMFx0?=
 =?us-ascii?Q?JbdZoUictLe1qy43aIfK4wMpCJIrTM0lKY8AGpamMsil13g1q8b92uYrSpvp?=
 =?us-ascii?Q?RRM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M3/ouE0MXIYxsw83/gzQcdJS0zGwE3XKFY8s2LLGt6PV2nVdu6HZYpzL5j7f?=
 =?us-ascii?Q?PlZ95cDMxNZ6WmZGYDUCy+uVe1FywHYARRY8Dohu2Wiszoqo4+6ynbNi0qxk?=
 =?us-ascii?Q?Ysp2Umk9e5YOmN6VE9+JN2mxhFhBbioBKzOUNiC1OG6i0q3SZ7uBfZbOin1U?=
 =?us-ascii?Q?ryNeZdSgOtPuXJRn09251merWB/QfDCHZjuF6uR8bt/3/96DVWROMjFYRZH1?=
 =?us-ascii?Q?VTDZxGUk8fJ0OGCNKQMp/Q5r99WdOi4r//O/rcPd5hT7O25fYfdN4wIGtBrt?=
 =?us-ascii?Q?ZpjLKY+727Dc8dSxHYSPp7+hzI36bqq73vAPgWzMadHpHhrNW4VrD6RAI4bO?=
 =?us-ascii?Q?uoDCK5SoGibA8SzLz0798xaNXjt4pxDoQlnV7YxqBoQuiBKdVmiv/huW3oth?=
 =?us-ascii?Q?URh853/2u25Mt0YxBz35OnMbwTWP0KocFKw7jTlp9wDyZZ+Ta2cKMKSZmRrr?=
 =?us-ascii?Q?+9GuboDYDIMHVNZj+GWX6H2a1tHyakv1Zz/7wfbdwpgV8AzaJsp+oep+7mOe?=
 =?us-ascii?Q?ZaURs/0l6WYsh9NriDFuvGvPvvO+jye7iN7yuGdQmykhvr7r0AE6aXp6vBQV?=
 =?us-ascii?Q?VorJxyJHiinM0hVmcIOKWuFo7WmzcUsmXmZ/8owmaSSS7ny0nPriMwiUHi5k?=
 =?us-ascii?Q?fz8pDc7Z0DHcG+a6GwVzOXJdp+oCRBeJBt5f72W2neXt82Wj9U7R0CFf9/Pl?=
 =?us-ascii?Q?Gerq1diCgamJKorx4elFyt2hd59ONFPEGvyMljRg4g+vino7uhZ+aKltZYvu?=
 =?us-ascii?Q?a7I2V2iw7uRvtL2RUx49XXNmkEHX/PhJVntjeHv48+SCsBi7TjTShrCsQc2S?=
 =?us-ascii?Q?BbovF0jrIS5nLcHB0Yt9V3CNuGCRsPl4iMD1Jw8gS1HZKglpgQlQQVjja/jB?=
 =?us-ascii?Q?FS4WHEcgUIA27hx453f8q6hgwPfHwHe/9SUiOVaxuuXVP61ZUa8vgmZA1BBo?=
 =?us-ascii?Q?inSFARXq6aK/kqgPaKkDg0KWuEGaKI07c8ldsbvfkKQMCkEpeH+PhTqLNtYM?=
 =?us-ascii?Q?wYmhYPMf+MpcqCOUozuah+dBSD9mQqZNO1XZG6rc/fFVuYMwW0jDeueO1mfS?=
 =?us-ascii?Q?OiQQHBUTfNDffh42D3BuLfebkixX8f71kNd4KCdZXC4a4nV0yMfKdex96HUY?=
 =?us-ascii?Q?1xH79NL7IEfP1ryDDVSPZ8Wdjp5THBXBc05HUIBw9tADc7TEdT5ISzKBD2a2?=
 =?us-ascii?Q?KFK48iFKzZub6lxN6ZTMq1ZwFXXuWQjCkJvtg/nTLl9gRJxGEz8bBEQb1aqf?=
 =?us-ascii?Q?8tzGPnVmlAXCI0Y4tMhZTOCYGFwzzIL/IxuKZy3mFcYn07ZNA1gNMZXqmRd3?=
 =?us-ascii?Q?Rmdyq4WJ4nVi2FzamQDNb66AnGai+3ghPdbistnAoWCL6KLqXXNEL4dSt5sX?=
 =?us-ascii?Q?ALZbemlFeW3Kcgk08OPZcgE7HMNYEpLd6tPMKB3V7VcVGHKbsWvwrP2itHr6?=
 =?us-ascii?Q?3lqMLYRfMuMCK+DpNZbHEh58wDcZX2oriA7UOYq5l3W+xQBeZZgdIGzC8cvB?=
 =?us-ascii?Q?GWz8NVTCO6cWrxmeKaTdr5j/JXGCv+OyMWLw9EElYtZ15edS5g4SXnasUzm5?=
 =?us-ascii?Q?euht2F5GwKtutSC56D4v363fE8y0mWVl46z/mnrBbJ0E/jfz55CN4suvbmlL?=
 =?us-ascii?Q?sA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e3f0de1-a3c7-492a-0b49-08dcadddeeea
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2024 01:46:28.8659 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xC1YbeOzo3ZYPt3+tTC24y3XYEPJd2+t0RLr+it66NgJj71mGwFjTVXupyzAK5sGRHzwaHRClSY755uK2piXtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7782
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

On Fri, Jul 26, 2024 at 06:50:24PM +0000, Matthew Brost wrote:
> On Fri, Jul 26, 2024 at 06:46:29PM +0000, Matthew Brost wrote:
> > On Fri, Jul 26, 2024 at 05:08:12PM +0300, Mika Kuoppala wrote:
> > > From: Andrzej Hajda <andrzej.hajda@intel.com>
> > > 
> > > Debugger needs to read/write program's vmas including userptr_vma.
> > > Since hmm_range_fault is used to pin userptr vmas, it is possible
> > > to map those vmas from debugger context.
> > > 
> > > v2: kmap to kmap_local (Maciej)
> > > 
> > > Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> > > Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
> > > Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_eudebug.c | 56 ++++++++++++++++++++++++++++++++-
> > >  1 file changed, 55 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
> > > index aa383accc468..947331c19f43 100644
> > > --- a/drivers/gpu/drm/xe/xe_eudebug.c
> > > +++ b/drivers/gpu/drm/xe/xe_eudebug.c
> > > @@ -33,6 +33,7 @@
> > >  #include "xe_mmio.h"
> > >  #include "xe_module.h"
> > >  #include "xe_pm.h"
> > > +#include "xe_res_cursor.h"
> > >  #include "xe_rtp.h"
> > >  #include "xe_sched_job.h"
> > >  #include "xe_vm.h"
> > > @@ -2852,6 +2853,58 @@ static void discovery_work_fn(struct work_struct *work)
> > >  	xe_eudebug_put(d);
> > >  }
> > >  
> > > +static int xe_eudebug_uvma_access(struct xe_userptr_vma *uvma, u64 offset,
> > > +				  void *buf, u64 len, bool write)
> > > +{
> > > +	struct xe_vm *vm = xe_vma_vm(&uvma->vma);
> > > +	struct xe_userptr *up = &uvma->userptr;
> > > +	struct xe_res_cursor cur = {};
> > > +	int cur_len, ret = 0;
> > > +
> > > +	/* lock notifier in non-invalidation state */
> > > +	for (unsigned long nseq = uvma->userptr.notifier_seq; true;
> > > +	     nseq = mmu_interval_read_begin(&uvma->userptr.notifier)) {
> > > +		down_read(&vm->userptr.notifier_lock);
> > > +		if (!mmu_interval_read_retry(&uvma->userptr.notifier, nseq))
> > > +			break;
> > > +		up_read(&vm->userptr.notifier_lock);
> > > +	}
> > > +
> > 
> > I don't think this will work without lockdep blowing up.
> > '&vm->userptr.notifier_lock' is taken in the MMU notifier, the MMU
> > notifier is in the path of reclaim, thus you cannot allocate memory
> > under this lock, xe_vma_userptr_pin_pages allocates memory.
> > 
> > I think you are going to need to pin the pages first, then take the
> > notifier_lock, recheck the seqno, retry on a miscomapre, once the
> 
> Let me make 'n a miscompare' a bit more clear.
> 
> Drop the notifier lock and repin the pages again.
> 
> This how the VM bind flow works to avoid memory allocations under the
> notifier lock.
> 
> Matt

Sorry triple reply... but here are two patches [1] [2] so lockdep will
complain about the why you have this immediately.

Matt

[1] https://patchwork.freedesktop.org/patch/606081/?series=136581&rev=1
[2] https://patchwork.freedesktop.org/series/136579/

> 
> > compare passes it should be safe to write the userptr.
> > 
> > Matt
> > 
> > > +	/* re-pin if necessary */
> > > +	if (xe_vma_userptr_check_repin(uvma)) {
> > > +		spin_lock(&vm->userptr.invalidated_lock);
> > > +		list_del_init(&uvma->userptr.invalidate_link);
> > > +		spin_unlock(&vm->userptr.invalidated_lock);
> > > +
> > > +		ret = xe_vma_userptr_pin_pages(uvma);
> > > +		if (ret)
> > > +			goto out_unlock_notifier;
> > > +	}
> > > +
> > > +	if (!up->sg) {
> > > +		ret = -EINVAL;
> > > +		goto out_unlock_notifier;
> > > +	}
> > > +
> > > +	for (xe_res_first_sg(up->sg, offset, len, &cur); cur.remaining;
> > > +	     xe_res_next(&cur, cur_len)) {
> > > +		void *ptr = kmap_local_page(sg_page(cur.sgl)) + cur.start;
> > > +
> > > +		cur_len = min(cur.size, cur.remaining);
> > > +		if (write)
> > > +			memcpy(ptr, buf, cur_len);
> > > +		else
> > > +			memcpy(buf, ptr, cur_len);
> > > +		kunmap_local(ptr);
> > > +		buf += cur_len;
> > > +	}
> > > +	ret = len;
> > > +
> > > +out_unlock_notifier:
> > > +	up_read(&vm->userptr.notifier_lock);
> > > +	return ret;
> > > +}
> > > +
> > >  static int xe_eudebug_bovma_access(struct xe_bo *bo, u64 offset,
> > >  				   void *buf, u64 len, bool write)
> > >  {
> > > @@ -2895,7 +2948,8 @@ static int xe_eudebug_vma_access(struct xe_vma *vma, u64 offset,
> > >  	if (bo)
> > >  		return xe_eudebug_bovma_access(bo, offset, buf, bytes, write);
> > >  
> > > -	return -EOPNOTSUPP;
> > > +	return xe_eudebug_uvma_access(to_userptr_vma(vma), offset,
> > > +				      buf, bytes, write);
> > >  }
> > >  
> > >  static int xe_eudebug_vm_access(struct xe_vm *vm, u64 offset,
> > > -- 
> > > 2.34.1
> > > 
