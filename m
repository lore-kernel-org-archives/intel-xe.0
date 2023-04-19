Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75CA2C6FD18
	for <intel-xe@archiver.kernel.org>; Wed, 19 Apr 2023 23:14:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3505610E221;
	Wed, 19 Apr 2023 23:14:56 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D8A910E221
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Apr 2023 23:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681946094; x=1713482094;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zHkiHj2TuJak7Ri2+7xQ1QTgK4rRBr/rShcpuG05CZ0=;
 b=U9Z0/4bPGm3K6j54NjLE5F5Gwc57oSDvjXiXPqs/NzoBm1zXy+EqTVa3
 43AGxAOdozSwdwP0IatDKbkiE2eWDtVgCptOMrDrs0ZIHFH4aj+S/wvHl
 6fqUea19tiX01lDCfdN6k4vXZCcElCGNdUI1Hw0FaS1iMP9VUjKr1vET/
 j5WzeZNzLIdpdUgttfEt4bAma66Ud4iVRGU5M5uk7uOH8PvhkOa+KDyFy
 DbPpThq1oegC4BdPGwiitou7mYCvo35plh2RIVLZu8ZRVKE+OSr+QOEbT
 3cU7X6ADHHgYQbdbPtDwidQJtXSlr6S/BXaMmuPa2asEvlrbzP6uZrsuI Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="373473677"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="373473677"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 16:14:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="722128477"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="722128477"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga008.jf.intel.com with ESMTP; 19 Apr 2023 16:14:52 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 16:14:52 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 16:14:51 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 19 Apr 2023 16:14:51 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 19 Apr 2023 16:14:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=efn77J2KPfjlcyJ3hbDr89XTJKhAQddEBBnU50icQMKgU/0CLAMVqLWsoDDD/GAAkNUBrbyOwH9NHjltXerKUbwgwAkIUkraEyHEdi3SDt03O7/rP20LTkAGBc7ivxlmz6WmNyPYFXP9DY4aNpADxKrZ0mSnHYHlyllnFnGvOUdcjZ5PKWky5AUQlMnhJdlynJRY3yHBhTGjBYOwduIIIJUzgcyWorjthvOn2Bh1+SlC0Tc/nKdiHdYDKdfJGBgR678mhklvGTcDuTqIi3nF0IcThVuYJTETYnjwEU/uVDCJaKxr3V4ZxWRU0aQyR3pEnzLmz238xRArMAvNGnpqEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ikd/8BidQTmv9r/KvK8nfuz0BZAaxeF3ZAYjzmYXN/8=;
 b=KVTit6ESU4BBlXuhz10eiAYFDi5lDB3JrpH+d8Kyfki+sFfW6O2qjJrX6znMmSsUZTBIFVPLV3f98c6XA6OIblg8o7CEOAudfaDxbEOLI0SqsFI0CoARuu4try66HnxB2vQBBxhZCCBISbxuCsr/8zgx6vg8J8AEylrQ/0/bqqoVFzXgwaFMtheU1Lhmv4YMdlC5h96oHYOuzyBWERSDKmKCdLXDb4yfG12JIkoKZWeuMaiNe5EabQsYg+OBRXUXr8tEM8PAl+Hbo8dMTDrCs9Xvf7wu36kBI7IUIO++FK+EvNYNrJMxOkYvdGuGtqzsj0PHNB25fhOBKRbWaFZ0YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SA0PR11MB4656.namprd11.prod.outlook.com (2603:10b6:806:96::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.45; Wed, 19 Apr 2023 23:14:49 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%8]) with mapi id 15.20.6298.030; Wed, 19 Apr 2023
 23:14:49 +0000
Date: Wed, 19 Apr 2023 16:14:45 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230419231445.GX4085390@mdroper-desk1.amr.corp.intel.com>
References: <20230419074440.4006398-1-lucas.demarchi@intel.com>
 <20230419074440.4006398-12-lucas.demarchi@intel.com>
 <20230419173345.GJ2825255@mdroper-desk1.amr.corp.intel.com>
 <stwod2pi444nbt4isgkexorrgvtd6tixn62xezymbydjwdpd6b@z2obzqwxeh2x>
 <ZEBBSS8d4uoW5KfS@intel.com>
 <whic2z65emjgsfnnnpyh4hmmfdzb3jtjsxjwzxdlq76nu2s33d@36gc4ex4qghk>
 <20230419202431.GK2825255@mdroper-desk1.amr.corp.intel.com>
 <wylzxo5vm74xlkfzm6pvv5zdwmh4tfmo6yal3k6epd5nc4hgwr@fa2dekbabk2z>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <wylzxo5vm74xlkfzm6pvv5zdwmh4tfmo6yal3k6epd5nc4hgwr@fa2dekbabk2z>
X-ClientProxiedBy: SJ0PR05CA0195.namprd05.prod.outlook.com
 (2603:10b6:a03:330::20) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SA0PR11MB4656:EE_
X-MS-Office365-Filtering-Correlation-Id: d357c173-f0dc-44a5-c8d6-08db412bdeda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vpqkBJCmmHLU52fondeeOlK/NSbPfv6l2Dvh7hcDHhdcvQ6xiKUmPZUInUQ0+Ifeg/tv3wEgmaWS2jfZd1Wi3IXe1DEnqyGoPl6cxaFrY5wFW0G1/LkjAeYJ8/kjQ+Kw3gXLvdEBAmjD6HqR0Mvu1uoJFLgbmK+WVLf3vxtHW6XPs9FsVBX1S5zlIj7gauV2AbJULmSeHHTxics0sEyKqGfaPwzI83nODyFPrPmPdLezttNJtix5LV3kKn6oMaEBJP58RZEIY2IdnXsctCzF7qvG6CXSUFiMmkcNC2TdQe33g1VK+tSUcCRp4EU7GZTW3xjX8KzTu4cnnLUWdlXNehJ+fO+fpbih2z9NyCDH/RLy2Y97IWAB/8khY0h7NXLa44G9TasdTSWWr0eresRdkjoEp0Ztgs/9Lwrz42KxwOGpZfkZY2ArvNtXb3iN7TAVmp2Ji2qX+D+M6TKcAH1OiCqHs9a3HkqQryn76kqRjjTEuUS082oVrYRwrW7Po34kawxAH3go5E18VZ9DVWjnyg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(136003)(376002)(366004)(396003)(39860400002)(451199021)(8936002)(4326008)(316002)(6636002)(966005)(66476007)(66946007)(66556008)(6666004)(41300700001)(478600001)(6486002)(5660300002)(6862004)(8676002)(82960400001)(30864003)(86362001)(2906002)(33656002)(6506007)(1076003)(38100700002)(26005)(186003)(83380400001)(6512007)(66899021);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?epYmxH6yac0e+dXwv1qwfeJoMgWhS1vWPRyi9KrOR69VMfeGUPzsb8YWX1T7?=
 =?us-ascii?Q?q8mNWuAVrzj6Ay03lQh4qG08HhW/l/Nv32FNXuWAM3XNIPW5GpaL2du3ecfJ?=
 =?us-ascii?Q?29YQYWYvgsjS95JtmOBaRzJVKG7oqFrPmaQyby9u+Z2zMKBtgPOUPw8g142q?=
 =?us-ascii?Q?suBMar9Tqos7lWvCi9lctFfyUxMlpBiMOJRsfxZBVbXclsyWQCv53FrtxXnh?=
 =?us-ascii?Q?acfse97U+rA96OF6IXCnC9jQfvAosRxaFLN8jZcbljdXUfvVW8e/EFgejLjf?=
 =?us-ascii?Q?LLar1FPQjTxt6AyVn5FU4a2Dq92GrlJ0wvi7PWwugulp927vnzz2lIUnTqgy?=
 =?us-ascii?Q?cW7peO/jcXPpMsIpydwA11Ej3FpBBmyZLGzzrpGLAYGlluvqYwoW+MPJdOYu?=
 =?us-ascii?Q?tSbUP2nWxEHygzK3RTqfA0DWK07ScrksAMdPd5SrmEDjNDQzkV8S2qziyJp9?=
 =?us-ascii?Q?xRN6Gw4Z67fvzJ8bT6RQzjyp61YH7VIqQGiIBtPvT96e0cW2ZN0BAr92Riwb?=
 =?us-ascii?Q?sQPN2ZepiixCByudDHZhrAt3Y96vWfwh9s95ekuqn/6Ag2+bb4CtlW7/gOmB?=
 =?us-ascii?Q?+hjKwQBJehy00/lrqyLbTgaafK7eXGEVa2Jp1GCy8SrPSlOjhC2xkTbigpCd?=
 =?us-ascii?Q?3gjmjVqXub1kqhHGI9zL7wAc+GokNBdDbpQ7NFZ9rwaVMKqYIR+AKFxQTWav?=
 =?us-ascii?Q?3nLPsTHDmPnHF4v7sNsvSPixKPQJPDKwdJKSirvtp1rWR4n5WyNQrugXNknJ?=
 =?us-ascii?Q?+AWaO6fuWF6Tx4N+HTfMJYJCnLT/G5bfiibqeRZgUZDVXJaF+nx6j7zIYDw1?=
 =?us-ascii?Q?iCW6HjacHGp9hYFSQhyLd2ca9fZX5kIvB0yPJwNeqnNiKp1fpqPkeLT/1LEz?=
 =?us-ascii?Q?q/1A7W6KxCk+/PxodqvduTKlqpKNVE6FNP/0h+nd8MIsS3vRXQEcY3BaXQd6?=
 =?us-ascii?Q?6dSr15PnEzrK/WAVP3TWOeHqfo3DDk10kzQ73IglUrmktB+d0Quihi+Uwf92?=
 =?us-ascii?Q?eAfqILZUOG609QGoR8A3Mfz3EzJ2bLgMFhCorQXoImlLwOUQoHuNkGnM+H72?=
 =?us-ascii?Q?hggD7VZb+DCvH5uzZ26up6rhfvt24hnzvNyJYTbT74e6gYhlhQV97tbd6XZD?=
 =?us-ascii?Q?slkuado1ds0RhNsjA3woTst7W3LaevL8wPHbSMpNpPLYEwaQOwFzzQuo1ry6?=
 =?us-ascii?Q?2VwWLXa3tjIZ1bIpAUO728+m41WL/gO4JxL/Qv9hNQgnp6AE7EI293jSmNMS?=
 =?us-ascii?Q?TwywcAexedCWHwm1VhXWI4tLr49XNnhMF0sCrnqE55JkzhD79tgRG2NTP8Wj?=
 =?us-ascii?Q?sbdjCAtkG22vqwX467ns4QuocXe+PXtfVRylOSAhAaqJ1sBCuNE/K59wetQi?=
 =?us-ascii?Q?QjNFB/Fscv/2Yqz04SJzVsGgH8pJfPUqA04m9LTsNM8Bu6dxE+AmvP6Cdkd0?=
 =?us-ascii?Q?/JvdLrDgMcCelTozDK1UsQHid6wfZXuTU/Wljo/mjAUnJNon2QgvbzbTa1IL?=
 =?us-ascii?Q?a3SE2+KEfBHA8xfBNaWt4JgsnPjFMoXuRkSWzKIesrB2qwmzBgbj9sI1ClZz?=
 =?us-ascii?Q?irL8kf7I1f9pbVHKjSNRuHgUNbh7okbHYmAiWFXGTly8zMKLeUN+jRysloyh?=
 =?us-ascii?Q?/w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d357c173-f0dc-44a5-c8d6-08db412bdeda
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 23:14:48.3467 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /qlMEm6epDYz/oAGcXaSKGqJj4+5aChfwmjSaRo/eoC3KqGi8+Vue56/Uuf1YhRMFNOd+ijjZm6J7apwD4SQg2e9/9/EM2QiubkdhkvtJJA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4656
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 11/17] drm/xe: Introduce xe_reg_t
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Apr 19, 2023 at 02:09:20PM -0700, Lucas De Marchi wrote:
> On Wed, Apr 19, 2023 at 01:24:31PM -0700, Matt Roper wrote:
> > On Wed, Apr 19, 2023 at 01:19:49PM -0700, Lucas De Marchi wrote:
> > > On Wed, Apr 19, 2023 at 03:30:17PM -0400, Rodrigo Vivi wrote:
> > > > On Wed, Apr 19, 2023 at 11:49:56AM -0700, Lucas De Marchi wrote:
> > > > > On Wed, Apr 19, 2023 at 10:33:45AM -0700, Matt Roper wrote:
> > > > > > On Wed, Apr 19, 2023 at 12:44:34AM -0700, Lucas De Marchi wrote:
> > > > > > > Stop using i915 types for register our own xe_reg_t. Differently from
> > > > > > > i915, this will keep under this will keep under the register definition
> > > > > > > the knowledge for the different types of registers. For now, the "flags"
> > > > > > > are mcr and masked, although only the former is being used.
> > > > > > >
> > > > > > > Most of the driver is agnostic to the register differences. Convert the
> > > > > > > few places that care about that, namely xe_gt_mcr.c, to take the generic
> > > > > > > type and warn if the wrong register is used.
> > > > > >
> > > > > > The disadvantage of this approach is that we don't get the nice
> > > > > > type-checking that we have in i915 to catch register misuse at build
> > > > > > time.  Instead we wind up with a bunch of run-time checks that only tell
> > > > > > you that you used the wrong register semantics after the fact.  Wouldn't
> > > > > > it be better to keep the strict types and let the compiler find mistakes
> > > > > > for us at build time?
> > > > > >
> > > > > > The only real problem with using strict types is that there are a few
> > > > > > places where the driver is just trying to refer to registers/offsets
> > > > > > without actually accessing them (e.g., whitelists, OA register groups,
> > > > >
> > > > > that is not true.
> > > > >
> > > > > > etc.) and the strict typing makes it harder to provide a heterogeneous
> > > > > > list of those registers.  But I still feel the benefits of compile-time
> > > > > > checking outweighs the extra complexity we wind up with in a handful of
> > > > > > places.
> > > > >
> > > > > I disagree here because the strict type checking is only checking for
> > > > > "regular vs mcr". Add "masked" in the mix (that has been a huge source
> > > > > of mistakes in i915) and you already have 4 types(?) to deal with.
> > > > >
> > > > > There are also places in the code where we want that "this is an
> > > > > mcr/regular/masked register" info to be used later. See how the reg-sr is
> > > > > handling that.
> > > > >
> > > > > In the end I believe having this info encoded in the regs/*.h is
> > > > > sufficient to avoid the mistakes we had in the past.
> > > > >
> > > > > Any change in the code triggering these warnings has a very easy an
> > > > > actionable fix.
> > > > >
> > > > > If for some reason we want to only differentiate mcr/normal as strict
> > > > > type checks,  then I think we need to provide a better struct for the
> > > > > places that don't care about that. Something like below maybe
> > > > >
> > > > > 	typedef {
> > > > > 		xe_reg_t reg;
> > > > > 	} xe_reg_mcr_t;
> > > > >
> > > > > but reg.mcr still being there. Or going the other way around:
> > > > >
> > > > > 	typedef union {
> > > > > 		xe_reg_normal_t normal;
> > > > > 		xe_reg_mcr_t	mcr;
> > > > > 	} xe_reg_t;
> > > > >
> > > > > but xe_reg_normal_t and xe_reg_mcr_t actually having the same defintion.
> > > > >
> > > > > Lucas De Marchi
> > > >
> > > > I honestly liked the approach you took on this patch here. Getting rid of
> > > > the i915_mcr is already a win by itself.
> > > >
> > > > One case that came to my mind though is some time sensitive mmio operations
> > > > like display inside vblank areas. any runtime check could potentially
> > > > increase latency, no?! If that's irrelevant time, than let's move with this
> > > > but if it is really a problem, then explore your latest suggestion here
> > > > with the compiler doing the checks for us seems a good alternative.
> > > 
> > > the additional check is inside xe_gt_mcr.c... I think the additional
> > > check is negligible compared to the other operations there, with each
> > > access to reg X requiring other 2 mmio accesses to take place.
> > 
> > The super critical checks (which don't exist yet in this series; they'd
> > presumably be added in a follow-up series) are the ones to make sure you
> > don't try to call xe_mmio_{read,write}32() on an MCR register.  Doing
> > that can lead to all kinds of subtle bugs (which become even more
> > problematic on the more recent platforms), and unfortunately that kind
> > of mistake is what people are going to write in the code 99% of the time
> > out of habit.
> 
> I'm not sure when that would happen... when the next GPU changes a register
> from normal to MCR, we rightfully updated the header to update its type
> and forgot to change the calls using that register?

It happened really frequently on i915 until we finally added the strict
typing.  It's not a matter of adding new platforms, it's a matter of
just writing new code in the driver (generally for platforms we already
have and with register definitions that already exist).  When someone
needs to add a new register read/write operation for something they're
working on, they'll generally reach for xe_mmio_*() out of habit (or
intel_uncore_*() on i915) since that's what gets used for 90% of
register accesses.  If the register is actually an MCR register, and the
compiler doesn't catch this for you, then you just wind up with
incorrect semantics at runtime.

Of course nothing is foolproof.  If the read/write is against a
completely new register, and the patch is adding both an incorrect
register definition _and_ an incorrect usage at the same time, then the
compiler won't help there.  Although the fact that a completely new
register is being defined makes it slightly more likely that the
reviewers will scrutinize the register details more carefully and catch
the incorrect definition.  It's a shame that the MCR nature of registers
isn't documented more clearly in the bspec...

Cases where the same register changed type between platforms is also a
problematic case that will never be foolproof since we wind up with
multiple definitions for the same register offset; if you pick the wrong
definition _and_ the wrong access semantics, then the compiler won't be
able to catch that either.  But again, the multiple definitions with
different types will still make it more likely that the developer and/or
reviewer take a closer look and realize the mistake.

> 
> Currently xe_mmio_* receives u32 and we just do FOO.reg, with reg being the

Right, this is obviously completely wrong and was something I raised as
a concern months ago when the first Xe megapatch got posted.  I started
typing up a fix for that a few weeks ago but got sidetracked and didn't
finish it.  xe_mmio_* should obviously be accepting i915_reg_t (or a new
Xe-specific equivalent) rather than a u32.  That will protect against
both the 'misordered parameters' problem Jani mentioned, as well as the
'used wrong function on an MCR register' problem that was problematic on
i915.

> name both in i915_reg_t and i915_mcr_reg_t. So, right now the different
> types are not helping anything.  I'm planning to add xe_reg_t to
> xe_mmio_* and have a companion xe_mmio_raw_* for the cases we use a u32
> (one of the reasons being because xe_gt_mcr.c itself also needs to call
> xe_mmio_*)
> 
> How does the type protect us against "daily task of enabling the next
> generation of GPUs?":
> 
> 	- gpu version N+1 changed register FOO from normal to MCR.
> 	  we didn't notice the register changed. Type doesn't help
> 	  because we are still using the old one.  If we did notice,
> 	  the type would only help if adopted the approach "change the
> 	  type", build and see what breaks to fix it, which is IMO
> 	  worse than a git-grep approach.
> 
> That would mean the hw changed a register from being MCR to being a
> normal register which is more rare than the oppposite: a normal register
> becoming MCR.

The strict type safety protects us in both directions.  xe_mmio_* only
takes unicast registers (after the obvious fixes to replace the u32
parameters), xe_gt_mcr_* only takes MCR registers.  If you pass the
wrong register type to either type of function, the compiler catches it
immediately.  As you noted, it's still possible to combine two bugs
(incorrect register definition + wrong usage semantics) to sneak by the
compiler; that will surely still happen, but we've raised the bar and
made it harder.

Having registers change between MCR and non-MCR between platforms is
still a problem, but not the most common one based on past history.  The
much more common source of problems is people just writing new code that
uses registers we already have in the driver.  Assuming the definition
is correct, the new code has to be correct too to get past the compiler.
If all registers become the same type, as you're moving toward in this
series, you could also probably get similar guardrails by turning
xe_mmio_*() into macros that do a BUILD_BUG_ON() before calling the a
real __xe_mmio_*() function, although then you run into issues anywhere
that non-constant register variables get passed up/down the callstack.

> 
> Even if we do the strict type, it doesn't protect us from such mistakes
> when we have a normal register becoming MCR. We will have this:
> 
> 	#define FOO	XE_REG(10)
> 
> and will continue to happily call xe_mmio_* even if in version X of the
> GPU the register is now mcr.

When enabling a new platform and implementing the MCR stuff for the
first time, we do need to be careful to not only add the new ranges to
the driver, but also to go analyze any registers that live in a range
that changed.  If there's code that will still be executed that works on
those registers, then we need to figure out how that code needs to
change.  We can't automatically assume that writes should become
broadcast_writes and that reads should become read_any's (although
that's the most common outcome); in some situations we actually need to
re-write the code to loop through the various hardware instances and
handle them all independently.

> 
> Hence my point: the header with the register definition must be the
> source of truth on the different register behaviors*.  The additional
> type checks only help in some cases, and make it harder to handle
> others.

With xe it seems like we have a lot fewer areas where multiple types
become harder.  IIRC, the biggest pain points on i915 were GVT and
cmd_parser since both of those needed to provide giant lists of
registers with MCR and non-MCR mixed together.  Both of those are no
longer relevant to Xe, so I think the main areas that will still have a
bit of pain are:
 * OA/perf register lists
 * userspace whitelist (although I'm not sure if we ever whitelist MCR
   registers...userspace would have difficult steering to specific
   instances)

> 
> On the other hand, I think the different types would be handy when/if we
> have the following:
> 
> 	#define xe_mmio_read32(reg) _Generic((reg),			\
> 		xe_reg_t: xe_mmio_raw_read32((reg).reg),		\
> 		xe_reg_mcr_t: xe_gt_mcr_read32(reg),

Unfortunately there's a trap here.  There are multiple ways to read (and
write) a multicast register and it's very important that you explicitly
pick the proper semantics to use.  Sometimes you want just want to read
any random instance's value (e.g., when verifying that workarounds
stuck), but in other cases you need to read and process every single
instance independently (various error reporting, INSTDONE, etc.
registers).  Likewise, sometimes it's okay to broadcast a single value
into every instance of the register, but other times we potentially need
to write different values into each instance, or even do per-instance
RMW's to avoid clobbering other bitfields.


Matt

> 	)
> 
> because that would eliminate an entire class of bugs, encoding in each
> call place what is the right function to be called based on the
> declaration in the header, with no additional overhead...
> 
> Lucas De Marchi
> 
> * https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/204 and ideally
>   be generated from the spec with proper filters in place so we don't
>   blow out the size of our headers.  My goal is to clean our headers and
>   have them in a state that would be 90% identical to something
>   generated by a script parsing the spec.
> 
> > 
> > 
> > Matt
> > 
> > > 
> > > Besides, there is no such user in display/
> > > 
> > > 	$ git grep xe_gt_mcr -- drivers/gpu/drm/xe/display/
> > > 
> > > 
> > > Lucas De Marchi
> > 
> > -- 
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
