Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB296C77B73
	for <intel-xe@archiver.kernel.org>; Wed, 19 Apr 2023 20:24:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C158410EAD5;
	Wed, 19 Apr 2023 20:24:52 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F89A10EAE6
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Apr 2023 20:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681935890; x=1713471890;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Bp6nyoMUuyVzl4MtioINpmo6Yi2+D10jHkWKJBbc6m8=;
 b=EbWkAlfRYb4WQhv3d47iP2MM8uV1MIOjlym5w+ezpvR+TxdCWEnxKXvP
 VNCd5eQxBvVIjppyb9VFYx1bdrkVZYyz5MM+cyyqxL/B2nmQ+E7fnAqA7
 ydQLZ5fCmGP+IDr2mbkF3fp74AK3rKUUMcOPQO+Q+cNdSR69b7HpaX23g
 O4vm1Ro1vqEKG9ontHAeFdq9MZiPJM95rWKzb5be+CwGnmPAOzgQdtvek
 qBBA2ucMNeQofoUabqtbMLbLD2EL7sT54cyiHc5uGB9//ZNfpO3o/W9oi
 Ojp0dkJiN6NojKbdwERnxXLYf/XlITqr3689jfnyYyPjT0y6EsKhGDSiy g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="347408850"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="347408850"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 13:24:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="803038122"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="803038122"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP; 19 Apr 2023 13:24:42 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 13:24:42 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 19 Apr 2023 13:24:42 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 19 Apr 2023 13:24:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cSo7n6ax5Cpz4obAFSQ8SMM3O4OJIkdC4GUceWOv8yAePtCmwYWm0yoE55ngqkAjacqCm5aZShHubthPS48Z9+xXfeuKp9hQk5S8Z2EcY9r/XPhRDNOuYe6HgSKS1gm5NRbgzEY1992no+YgKd75hNbCyWkiNCyVsxY+9nt6o7LywSxpFB0iyDpSVc9YkuTBloSxm3i5ofvR+VaMYMagj+KftkJ149izwqR8gsHsBJx9/NisZV9Y1r8Pe3/jo5BtKmcvESpzV0ZREnynkLKGabRYp4VqbvF4w5quLxNZlaID6lkhyb2p4fxRj9XSzQpSeVxhWyAGc5Z2X0nvcN/ifw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vNID42V+WSN91HTuyZxKgMDzBJSFOIHahf83tn/loUU=;
 b=KWylz369Eo+tPuoaFU+genEAhEK7SjTmNplXcH3zb2kxgKyrkftiyHOS3WD32KxKUkJ5TId1YMWNvmsWNEXFcoZBLgDoQUAp8PYmy0pE7u4USqCvOvp4h6RDUDk3++eOP5X08PkK3Aw8YejsfewjNlncJV71/U44EKDm/GWf7EfODI00SnNjV3cAIjMhshgO4zzJ92r6zHBbBynUi0JJuoTqMpLXu8J3zIdRbvUj9gSdbCfdQzLlUgOHeMiTg8wuXWpdYA+f0K1w060eNp8PAzoIzQM9VomUoKJEJeN2KHFWdltXT+3spMHbETu2VRz785W56Itf51Mg4rZN0Qz1CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CY8PR11MB7845.namprd11.prod.outlook.com (2603:10b6:930:72::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.45; Wed, 19 Apr 2023 20:24:35 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%8]) with mapi id 15.20.6298.030; Wed, 19 Apr 2023
 20:24:34 +0000
Date: Wed, 19 Apr 2023 13:24:31 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230419202431.GK2825255@mdroper-desk1.amr.corp.intel.com>
References: <20230419074440.4006398-1-lucas.demarchi@intel.com>
 <20230419074440.4006398-12-lucas.demarchi@intel.com>
 <20230419173345.GJ2825255@mdroper-desk1.amr.corp.intel.com>
 <stwod2pi444nbt4isgkexorrgvtd6tixn62xezymbydjwdpd6b@z2obzqwxeh2x>
 <ZEBBSS8d4uoW5KfS@intel.com>
 <whic2z65emjgsfnnnpyh4hmmfdzb3jtjsxjwzxdlq76nu2s33d@36gc4ex4qghk>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <whic2z65emjgsfnnnpyh4hmmfdzb3jtjsxjwzxdlq76nu2s33d@36gc4ex4qghk>
X-ClientProxiedBy: BYAPR05CA0098.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::39) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CY8PR11MB7845:EE_
X-MS-Office365-Filtering-Correlation-Id: 12e87e24-0df2-45d2-4dea-08db41141710
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F88xNNp3rv5YX0N9v4mKnHeiaum9YCOY8Ki3HMBt9yYkVFBJg6PVHQeGEHhajYQRnO2arophrcF4/d5BLVQ2cfnRfk6LHNBm3TuEcAjmigXBtrZ591UC8CQQ0b53YQwDkPd5NIUU/FBDJj8DnN1Vm72fAwfprJkVrbfEtdVjJ02yUNeTDP49akE0fHiO4OOX43L26AopOO6l5BZY0oC2mTXZszS0tMudsP9GhVZNtMap3Mz0NXrZuDjx2mhOfjyzba/2Ku9oOlZB0RH857Ne+YjUtMXDB/6IPD5Ep6EWQ2re708fBCEzmQqkZ6AQAvvU7HkXl6HUo2kNOLAVizuwvbPNQqoNVxXxzHZK37PZ7CIiDzSXzCkrY2R4TWlA1zaVdRPTBWKAr+O33zEKDsLhtNLEWEdoThFPcRgEJU5aH6i2UVX0tclrD9BBGWUU9chFQDnbRodoZmMU7WEa/kVKg51ayWCj/7zPRl3iiSi3p4TpBt2lEGfvKs5Hla2JD74vjTitxC70taFnGTE0kx2KBXEvbO0mKzIw86aR3UshDHQblrkFFpCpjW2/SGfi39KW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(376002)(346002)(366004)(136003)(396003)(451199021)(66476007)(478600001)(6666004)(8936002)(66899021)(8676002)(6862004)(316002)(82960400001)(41300700001)(4326008)(6636002)(66946007)(66556008)(38100700002)(186003)(2906002)(6512007)(26005)(83380400001)(1076003)(86362001)(6506007)(33656002)(5660300002)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U1hesmHDBh+FP+i581aWymlej+DdAOFKNmOlyVN+Hm+Y119OCJsz4SD3UaHE?=
 =?us-ascii?Q?z2heaxS6OeSLnalXhRQ+xfgZRbtERfEGbIiOageKOISr3QfrE9Psiq3SMHz0?=
 =?us-ascii?Q?ZhnCYHw9qjqRkqbwido+w9v+BsvURURvL5TdwYXbWbBy90Oja9U7sgB2mXVI?=
 =?us-ascii?Q?VBY6Cb1080O804fIYpM7uFcoYG4ZGO8PmuCqh9hJbhw1L7CHxAGBVK9InHe9?=
 =?us-ascii?Q?43Y9tkmhRZ4kQvBXOBVWIyEnOGImbZxiBFUrkhkpOs9AKPvhwhKcxr0NMrKC?=
 =?us-ascii?Q?3pu1tOE9yRmz9miHTziKG3j40vsRqKFzO8nF7vjFfle3WWaMyxsKXNQl0kRm?=
 =?us-ascii?Q?v5AVuv6jaHSku6yVrbdZd8ASvzLTBhIZeTgfNSccf+9qNb9jdtryxUKqi/mE?=
 =?us-ascii?Q?PyKLpVQCe6StFVa0z8WnkxHCIpYQtgVj7qshgzFot8JlQgBKQgPcu0tUAHVT?=
 =?us-ascii?Q?GFMrfI9B0fz8t+d0vWkwQnZM0k2JHJQpIYTFROpAyegpFn7TOHtkER//pSHz?=
 =?us-ascii?Q?ddU0eI+eDgAHW5WBaFSdqrEWKNtsP2AUkWpGmT7/D9Wbvy6OJkH8pqs4/2CQ?=
 =?us-ascii?Q?CGiJgnsBNL1n+vzy+5ARliIGcdymrRGkCwQTUmsEh7Ro9F/BDnJ0Gvi7KS74?=
 =?us-ascii?Q?wp5C2DaaKW9+IBEm6KdjZSfDpKnO//PqQTs4pBqcX3dArwKiQTxkqSy3+TCl?=
 =?us-ascii?Q?ZSgQ6omgh6jpfadkN/04G2Td4P74zIcPNPsTAD4HXJ5YfsC0FtW03Lrg0p1X?=
 =?us-ascii?Q?7vwr2JKkLb/BQBHwnM6Byknjkte5a4OdsQFeBXiVjhWRJP9OguhctrBK1y/d?=
 =?us-ascii?Q?q0mWm3XN+RhSxlDWb2QJ44Ki5KJtBsY36pT8zcBu3+9+gz64Ix7PDmntmjXl?=
 =?us-ascii?Q?5mBhKeuVRzwnnHqWs1sF7MH2vmDs3CrGU4wF4uEQjzQ+wl15ju2Th36/PT/g?=
 =?us-ascii?Q?0M88QXEq4cU9sGwRvN7ybV59rv8OQgeNEn7xvVJpRROM7JnwIV7r3OpowBtI?=
 =?us-ascii?Q?qtJNGfecji81HmhvNOM62pxDzPV4mXcUB8usFzIYIWZFJsOXlng8PyZhZ1Vn?=
 =?us-ascii?Q?J2lY58pr73/79O2ea2QtLahNAH/NgebPgGWwW8fACKMlJtN7afZuMr2yLKy/?=
 =?us-ascii?Q?RjCjRor4YKGDjB9zuiQ7Y5X629cZfsAtPr13JryFHtjYkRmAOdYgpiKnR4eJ?=
 =?us-ascii?Q?JY9N+0RTstWKzi7r97ZQhmN+mWOg9GWnejyOwhC///+oO6LpRFTWNZ9kWe+8?=
 =?us-ascii?Q?q7nXwYsL6aO04YBeWQvHwvOIg03RKRDRiibBT1mea3q5j31V+70ItXiLHzW5?=
 =?us-ascii?Q?PzKQwuC0Ae/1DKWEGsuIG6Ihl76JIkuKQg5RpX6YNFkjgAy7kZxSipceKyT7?=
 =?us-ascii?Q?DX1g+EEvGBVr8594rGlxyQM7ko/YQ3fvXlsbZ3r0JZtaQlLiWNxG3VVDhsnT?=
 =?us-ascii?Q?ZerkGO+5d5yGBIYaVAmGTDfzeaWvwIdqz6CrwtSakor4vvI/YP1HmZHU2eqX?=
 =?us-ascii?Q?69/GMZf9CmArMhn1QhvUndkLpjkWgSqb3LFkXGLjdwEINYQ5iBbXd9CfhcIN?=
 =?us-ascii?Q?xhJYG+m6TpLJwJ21kHjfo634UPr6YD0uqAYgie2u7tCRvUhiK5ATAa7Kd1w1?=
 =?us-ascii?Q?Lg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 12e87e24-0df2-45d2-4dea-08db41141710
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 20:24:34.7002 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ClfCETA/DJw+4vjB7oE4EYMS1bbH5WQODGNJGxQkbTgZrYHx6L1ZMs8rlci26uwJ78OJftq87Y/5ggrmqV7nbsIsRb1pKaRNCnrmeEmH2DI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7845
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

On Wed, Apr 19, 2023 at 01:19:49PM -0700, Lucas De Marchi wrote:
> On Wed, Apr 19, 2023 at 03:30:17PM -0400, Rodrigo Vivi wrote:
> > On Wed, Apr 19, 2023 at 11:49:56AM -0700, Lucas De Marchi wrote:
> > > On Wed, Apr 19, 2023 at 10:33:45AM -0700, Matt Roper wrote:
> > > > On Wed, Apr 19, 2023 at 12:44:34AM -0700, Lucas De Marchi wrote:
> > > > > Stop using i915 types for register our own xe_reg_t. Differently from
> > > > > i915, this will keep under this will keep under the register definition
> > > > > the knowledge for the different types of registers. For now, the "flags"
> > > > > are mcr and masked, although only the former is being used.
> > > > >
> > > > > Most of the driver is agnostic to the register differences. Convert the
> > > > > few places that care about that, namely xe_gt_mcr.c, to take the generic
> > > > > type and warn if the wrong register is used.
> > > >
> > > > The disadvantage of this approach is that we don't get the nice
> > > > type-checking that we have in i915 to catch register misuse at build
> > > > time.  Instead we wind up with a bunch of run-time checks that only tell
> > > > you that you used the wrong register semantics after the fact.  Wouldn't
> > > > it be better to keep the strict types and let the compiler find mistakes
> > > > for us at build time?
> > > >
> > > > The only real problem with using strict types is that there are a few
> > > > places where the driver is just trying to refer to registers/offsets
> > > > without actually accessing them (e.g., whitelists, OA register groups,
> > > 
> > > that is not true.
> > > 
> > > > etc.) and the strict typing makes it harder to provide a heterogeneous
> > > > list of those registers.  But I still feel the benefits of compile-time
> > > > checking outweighs the extra complexity we wind up with in a handful of
> > > > places.
> > > 
> > > I disagree here because the strict type checking is only checking for
> > > "regular vs mcr". Add "masked" in the mix (that has been a huge source
> > > of mistakes in i915) and you already have 4 types(?) to deal with.
> > > 
> > > There are also places in the code where we want that "this is an
> > > mcr/regular/masked register" info to be used later. See how the reg-sr is
> > > handling that.
> > > 
> > > In the end I believe having this info encoded in the regs/*.h is
> > > sufficient to avoid the mistakes we had in the past.
> > > 
> > > Any change in the code triggering these warnings has a very easy an
> > > actionable fix.
> > > 
> > > If for some reason we want to only differentiate mcr/normal as strict
> > > type checks,  then I think we need to provide a better struct for the
> > > places that don't care about that. Something like below maybe
> > > 
> > > 	typedef {
> > > 		xe_reg_t reg;
> > > 	} xe_reg_mcr_t;
> > > 
> > > but reg.mcr still being there. Or going the other way around:
> > > 
> > > 	typedef union {
> > > 		xe_reg_normal_t normal;
> > > 		xe_reg_mcr_t	mcr;
> > > 	} xe_reg_t;
> > > 
> > > but xe_reg_normal_t and xe_reg_mcr_t actually having the same defintion.
> > > 
> > > Lucas De Marchi
> > 
> > I honestly liked the approach you took on this patch here. Getting rid of
> > the i915_mcr is already a win by itself.
> > 
> > One case that came to my mind though is some time sensitive mmio operations
> > like display inside vblank areas. any runtime check could potentially
> > increase latency, no?! If that's irrelevant time, than let's move with this
> > but if it is really a problem, then explore your latest suggestion here
> > with the compiler doing the checks for us seems a good alternative.
> 
> the additional check is inside xe_gt_mcr.c... I think the additional
> check is negligible compared to the other operations there, with each
> access to reg X requiring other 2 mmio accesses to take place.

The super critical checks (which don't exist yet in this series; they'd
presumably be added in a follow-up series) are the ones to make sure you
don't try to call xe_mmio_{read,write}32() on an MCR register.  Doing
that can lead to all kinds of subtle bugs (which become even more
problematic on the more recent platforms), and unfortunately that kind
of mistake is what people are going to write in the code 99% of the time
out of habit.


Matt

> 
> Besides, there is no such user in display/
> 
> 	$ git grep xe_gt_mcr -- drivers/gpu/drm/xe/display/
> 
> 
> Lucas De Marchi

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
