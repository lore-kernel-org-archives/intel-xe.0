Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C5DC77B73
	for <intel-xe@archiver.kernel.org>; Wed, 19 Apr 2023 20:14:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2170E10EAD5;
	Wed, 19 Apr 2023 20:14:25 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3A4B10EAD5
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Apr 2023 20:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681935261; x=1713471261;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3Vef6d7wVp8gvNMxGNM5V/3IeAznJN52EdOV6+u0u+s=;
 b=jBLUO6k1RAvjgwSDnVGaAHAY9ZMuVdcbMIvSD/9fGiAv9kPceqGSQ0yq
 QS8sfWNammucGWS1b0T+rXs/AEIuGlLcTS2LYrlzBrHjqupGDirP6GbLh
 qoX9N6DuWd59dErMMzm+KRV2pE8Elfuw2YLf9ISJVuGa3nbiSsuhDHWpq
 4B8nnDEkEhwXsX5YjhK2NfCTZT5pUy3/ed206dyWjnBmU+huW5W9ulPO3
 tl9oHP2PTmbyeH+3/EWWEARk+eBMfwhvXBTMZyfOAq4F0sFHy7pjPnAFU
 E3e3RrscLsZK57TregPU4bdxW9+7xPlKcsow8u4QSh9M3PUnB/wkOgLWv g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="408462684"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="408462684"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 13:14:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="780958134"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="780958134"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP; 19 Apr 2023 13:14:06 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 13:14:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 13:14:05 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 19 Apr 2023 13:14:05 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 19 Apr 2023 13:14:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JjBAIGJq28oHhYA9mvkDGEurth+r5WjLoA/mbHqMEWGiRVTnkjNOokUJWy9CzPiVNicHkbkHpA0bOCI3aCoWQiKEawNLldT5JFu6q6aZvwBvaWumo4j9nOQVQOojN+woNJXsrSNJERTaSjlIUWG81gC4vJsMoC5czektQq9e/8oDGdpLi60kqaCN49LOP1xRjVsqumfyAzKHICsuasmFDX8Mf+Zlq6AqmjjFVsmqLmQ6qbbMV/mMl+sdJ7VaMzsdBTMfU08aviAuU74QotGmtiS1GhDSDYebUTHPlN6aQ5kY2Ea+VXhHvE+HDHLBU09yXoO7CVrMM2kLQb94PoUi6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PagyL/WSEnS7ythIazXZfUnXQ7BCsFKf8FGA6UiKWa0=;
 b=Egr3WAe1YQs6lrTI8MilMEtRWJIJaptwyj4ACt37owQ9MeMSY7BV3om98leslviK7efDuRskM2M9neF4fiO+HfMDt55/RU753Ng3A60a8SPugG8WqhgXG7oulldfoDI94dfhsjOJKX5gKjS42OZNO2zwyQY7/SkB/dXYYzo9ifImP6PVYcL969oYKEz5IbJrr/pAq2MD7tFkabICAZDRHSfRnM7m8XaWkix1r/lEmtEcqFl1Xn0h3lWbfzZ0s2nNqtcWK+cC/B+WBneGvaqI+RFkHusWus9JaH4OmkAuk4HPDIzkofCdCh31aPPTRSEaUlWgT0nZywiSKajIttnI6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SJ0PR11MB4832.namprd11.prod.outlook.com (2603:10b6:a03:2dd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 20:14:03 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%8]) with mapi id 15.20.6298.030; Wed, 19 Apr 2023
 20:14:02 +0000
Date: Wed, 19 Apr 2023 13:13:59 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Message-ID: <20230419201359.GW4085390@mdroper-desk1.amr.corp.intel.com>
References: <20230419074440.4006398-1-lucas.demarchi@intel.com>
 <20230419074440.4006398-12-lucas.demarchi@intel.com>
 <20230419173345.GJ2825255@mdroper-desk1.amr.corp.intel.com>
 <87y1mnwt2i.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87y1mnwt2i.fsf@intel.com>
X-ClientProxiedBy: SJ0PR03CA0122.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::7) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SJ0PR11MB4832:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b49d7a4-bc86-490a-40f8-08db41129e05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DGiBxHcrcIqL18j46vTdazIlHEsQLLb2u5yR5w8aDCi8k0uSu3wZ9VIJYvYxad7nKXx+/N49wHi3ObfEJUlZTtWZB3uKpqNXLqzus6nY6P0BEWFsbnEJ1VEGZnhcnEWUYF7MxKHRtihZSjAy5sjZ50nf9HiiLPFh3gbW9/M9Leqf1wuLZho1P2FW88DhZwi/8I27y4f4RvB5yhKLIAXru/kWqcdBDliA1+zzJnrhL/wCa30ixn9l0hLQo1bkAIRbVlFdGGchnxWvWawjroqAamBthtp/klvdYkfZWMwx1NTsDflEhuuWARz3ACGabr3R0cFACGf7rmlEPU2Iu+DYxM4uMkqOm2XEZhw5SG5SX53QC8QIIoh7KKs5J+S73FlwgIuimTHp4VaRdPREQzTEobJKy7CQpljl4VnXYEawjtFKPUuvfRADgsB5V5/6x9A4VV6kK1uM4H/tHitZHqJQrmgDOAphHmrUCk687MAwyb8mp/sqBhtv9PW8qvSmP4bsJXlTqVKOB7+m3AujQ3j3cYJqlK6pkYnKQWFJqqaGUzo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(376002)(346002)(366004)(136003)(396003)(451199021)(66476007)(478600001)(6666004)(8936002)(8676002)(316002)(82960400001)(41300700001)(6916009)(4326008)(66946007)(66556008)(54906003)(38100700002)(186003)(2906002)(6512007)(26005)(83380400001)(1076003)(86362001)(6506007)(33656002)(5660300002)(966005)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8qhjokJ0+5+4F8WDH2gKjIGQlkptMVmk0a8Lb0C1UtAViCHel9Bzam9Ix1tL?=
 =?us-ascii?Q?n9Q77suK6Pa31xqXxklOIZB1dfvicv+g9xFhl+QdtVTG136ZtyUYJ9O/1ggv?=
 =?us-ascii?Q?nHO2LyW/VV2yf0uDXCkIL0JW5Iw7NcLC/EByqW+1QS8oxoyoxV1tolxVpp3f?=
 =?us-ascii?Q?cpy14G818PrAL/ZdXsuMyqcyfX+nD3mQOTupQNYOHc+myiYiKIJm5Mbs01t/?=
 =?us-ascii?Q?n8LjzmnIgQ87qPc9uCgFuUWpDReEg26RZ8Cj1Olh4q7F7UvRvz4w5h5+NaCZ?=
 =?us-ascii?Q?SzYR4Snfa3J76ql96ku8mWN6DvL8/49RiRUd0FeWn/VYKwegrf6I/GcCC+RX?=
 =?us-ascii?Q?b9flCUTN+5fl26jWPb+gFegaLKhaWxnCYOs5LmNTyPW6Ct6ZRr11tseHKgiQ?=
 =?us-ascii?Q?Jjx9LAcuC98Ei3WwnK1k07WXFBcsQOUlQmRnv7/Yo7AIA+i6TdJvT+Tm/GWR?=
 =?us-ascii?Q?CtSror3HK4vfjbiSmSNYW4F8V4hAN4Njno0VmtFuZoc8+BgGxuemMs0dHCfo?=
 =?us-ascii?Q?GfwAeB4ddHOsHXFMg7K40vk87B26UCMXDRjv11zkzdxM0OeUR5IhRfZbl2ag?=
 =?us-ascii?Q?Ix1rY61ubW80XPViIJPCPAt6ie6q+NgiRV3B1yslfpom75eUFiqR1ERsSatE?=
 =?us-ascii?Q?yh9vxASUvvO9kiVf7n8mGTv17SA0HVN5Fkvv/z+vr5d3SI+PhahV13LG4/TW?=
 =?us-ascii?Q?lYAXUlsI2/z8R+xiIMveOdCAiGzimEi6w/K1sE0Enf28t/xJKCjNTVMCKUZw?=
 =?us-ascii?Q?RR6Gh3MZsijtzGOjHrW0xlR6lYr+B2U5trw741q2WkciOBYe4uLR8qI6KSJ4?=
 =?us-ascii?Q?KR813vg5t8koRqNRNfNi+JOaOMXvcj9ZkGq0p5jbrKvL2gmNUNULosC8Uuiy?=
 =?us-ascii?Q?UbJ4jTQORFScfF1mG/yUHlJx2wf/OP2H8oMb7hpQQGzLttHKZtYWTAGyUJXl?=
 =?us-ascii?Q?0WzfKxPE9QUwB50ziP3ImKjLCgN3EAgAl2YQzN3kkklPl3LsGoDN9kOyxJ/i?=
 =?us-ascii?Q?ZTO7oDSbjZGVZBYV/GWkI7FTVVwzJpwJ94lZ6GpRWKkCvbIiW0o2hvS3avYg?=
 =?us-ascii?Q?BSYFSMIWrm86Rzuq3YP1bQygHDqXqUcaQwbCkgAHFNMZp+shL4A+h3zO2PU7?=
 =?us-ascii?Q?dZPFKgc8WuRi8tqCvRWj0RgQ9MtdWOwIWZoLoj8cBhXdVsl2jRfgsoNrQeGr?=
 =?us-ascii?Q?0mDkX1LlSEYp86t0j1n6v2BJBcrrblSbNuBikvJ29VCVKs9Theo11TWZlCso?=
 =?us-ascii?Q?vOfMjvoQhMooteroYs6gsq0E1IMUGuGvMdRaGQtV9R3WDuObG/xVZ1ZHcpe2?=
 =?us-ascii?Q?knuUStlklaxc1MfJ8B+IT+zmZt9m7YfZGo3dR4YeoIb3EIUx8dAHFkyz31xp?=
 =?us-ascii?Q?B2TZFmSO5As+kXLQ/VfQJFEjT5WOd9O04ks/+F88hyYTM/WPgeXVqaH+FxX3?=
 =?us-ascii?Q?Oc6xvqr8ND36ZqGuMq1hU0fHD7DHzEkeHTVgxOWHpupRwZQ5lJmUGPikXZbS?=
 =?us-ascii?Q?9FPyOK6EK3tdPX5pfSXRE9mZW4vp0F+7WN1B/7GovAZlz3dN+Hp0uM6seh2E?=
 =?us-ascii?Q?qGBhx+ZrbXxWllmng3lLAXYMdKUNuib3V53axSaXHSvuDFQMj7A+JxyHXp3p?=
 =?us-ascii?Q?Pw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b49d7a4-bc86-490a-40f8-08db41129e05
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 20:14:02.2708 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aN3XZSs+kJ7/rHowcqefJ20UPmidEdQ1p94rwvl7WFf0ef8ergzPySs5OkReuZAwahek4SfOfn+WBziU12e2IFn60yoVGl8Q9GWHCcqvN5g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4832
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Apr 19, 2023 at 10:49:41PM +0300, Jani Nikula wrote:
> On Wed, 19 Apr 2023, Matt Roper <matthew.d.roper@intel.com> wrote:
> > On Wed, Apr 19, 2023 at 12:44:34AM -0700, Lucas De Marchi wrote:
> >> Stop using i915 types for register our own xe_reg_t. Differently from
> >> i915, this will keep under this will keep under the register definition
> >> the knowledge for the different types of registers. For now, the "flags"
> >> are mcr and masked, although only the former is being used.
> >> 
> >> Most of the driver is agnostic to the register differences. Convert the
> >> few places that care about that, namely xe_gt_mcr.c, to take the generic
> >> type and warn if the wrong register is used.
> >
> > The disadvantage of this approach is that we don't get the nice
> > type-checking that we have in i915 to catch register misuse at build
> > time.  Instead we wind up with a bunch of run-time checks that only tell
> > you that you used the wrong register semantics after the fact.  Wouldn't
> > it be better to keep the strict types and let the compiler find mistakes
> > for us at build time?
> >
> > The only real problem with using strict types is that there are a few
> > places where the driver is just trying to refer to registers/offsets
> > without actually accessing them (e.g., whitelists, OA register groups,
> > etc.) and the strict typing makes it harder to provide a heterogeneous
> > list of those registers.  But I still feel the benefits of compile-time
> > checking outweighs the extra complexity we wind up with in a handful of
> > places.
> 
> The history of i915_reg_t is that there were subtle bugs where the
> arguments to the register write call were accidentally swapped, they
> went unnoticed, and needed lengthy debugging to finally figure out.
> 
> This can happen with xe_mmio_write32().
> 
> Strong typing for i915_reg_t has positive score 9 on Rusty's API Design
> Manifesto [1].

Exactly.  That's why I think we should stick with the strong typing for
MCR vs non-MCR as well, rather than just adding a bunch of runtime
assertions.  It sounds like the proposal here would only earn a score of
5 by that website's metrics, whereas we have a 9 in i915.


Matt

> 
> 
> BR,
> Jani.
> 
> 
> [1] https://ozlabs.org/~rusty/index.cgi/tech/2008-03-30.html
> 
> 
> 
> >
> >
> > Matt
> >
> >> 
> >> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/regs/xe_reg_defs.h | 15 +++++++++++++++
> >>  drivers/gpu/drm/xe/xe_gt_mcr.c        | 22 ++++++++++++++++------
> >>  drivers/gpu/drm/xe/xe_gt_mcr.h        |  8 ++++----
> >>  drivers/gpu/drm/xe/xe_irq.c           |  2 +-
> >>  drivers/gpu/drm/xe/xe_mmio.c          |  2 +-
> >>  5 files changed, 37 insertions(+), 12 deletions(-)
> >> 
> >> diff --git a/drivers/gpu/drm/xe/regs/xe_reg_defs.h b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
> >> index b5c25e31b889..1e78508c737b 100644
> >> --- a/drivers/gpu/drm/xe/regs/xe_reg_defs.h
> >> +++ b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
> >> @@ -8,4 +8,19 @@
> >>  
> >>  #include "compat-i915-headers/i915_reg_defs.h"
> >>  
> >> +typedef union {
> >> +	struct {
> >> +		u32 reg:30;
> >> +		u32 mcr:1;
> >> +		u32 masked:1;
> >> +	};
> >> +	u32 raw;
> >> +} xe_reg_t;
> >> +
> >> +/* TODO: remove these once the register declarations are not using them anymore */
> >> +#undef _MMIO
> >> +#undef MCR_REG
> >> +#define _MMIO(r)	((const xe_reg_t){ .reg = (r) })
> >> +#define MCR_REG(r)	((const xe_reg_t){ .reg = (r), .mcr = 1 })
> >> +
> >>  #endif
> >> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> >> index aa04ba5a6dbe..b9631cfd5b81 100644
> >> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> >> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> >> @@ -360,11 +360,13 @@ void xe_gt_mcr_set_implicit_defaults(struct xe_gt *gt)
> >>   * returned.  Returns false if the caller need not perform any steering
> >>   */
> >>  static bool xe_gt_mcr_get_nonterminated_steering(struct xe_gt *gt,
> >> -						 i915_mcr_reg_t reg,
> >> +						 xe_reg_t reg,
> >>  						 u8 *group, u8 *instance)
> >>  {
> >>  	const struct xe_mmio_range *implicit_ranges;
> >>  
> >> +	drm_WARN_ON(&gt_to_xe(gt)->drm, !reg.mcr);
> >> +
> >>  	for (int type = 0; type < IMPLICIT_STEERING; type++) {
> >>  		if (!gt->steering[type].ranges)
> >>  			continue;
> >> @@ -436,11 +438,13 @@ static void mcr_unlock(struct xe_gt *gt) {
> >>   *
> >>   * Caller needs to make sure the relevant forcewake wells are up.
> >>   */
> >> -static u32 rw_with_mcr_steering(struct xe_gt *gt, i915_mcr_reg_t reg, u8 rw_flag,
> >> +static u32 rw_with_mcr_steering(struct xe_gt *gt, xe_reg_t reg, u8 rw_flag,
> >>  				int group, int instance, u32 value)
> >>  {
> >>  	u32 steer_reg, steer_val, val = 0;
> >>  
> >> +	drm_WARN_ON(&gt_to_xe(gt)->drm, !reg.mcr);
> >> +
> >>  	lockdep_assert_held(&gt->mcr_lock);
> >>  
> >>  	if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1270) {
> >> @@ -494,12 +498,14 @@ static u32 rw_with_mcr_steering(struct xe_gt *gt, i915_mcr_reg_t reg, u8 rw_flag
> >>   *
> >>   * Returns the value from a non-terminated instance of @reg.
> >>   */
> >> -u32 xe_gt_mcr_unicast_read_any(struct xe_gt *gt, i915_mcr_reg_t reg)
> >> +u32 xe_gt_mcr_unicast_read_any(struct xe_gt *gt, xe_reg_t reg)
> >>  {
> >>  	u8 group, instance;
> >>  	u32 val;
> >>  	bool steer;
> >>  
> >> +	drm_WARN_ON(&gt_to_xe(gt)->drm, !reg.mcr);
> >> +
> >>  	steer = xe_gt_mcr_get_nonterminated_steering(gt, reg, &group, &instance);
> >>  
> >>  	if (steer) {
> >> @@ -525,11 +531,13 @@ u32 xe_gt_mcr_unicast_read_any(struct xe_gt *gt, i915_mcr_reg_t reg)
> >>   * group/instance.
> >>   */
> >>  u32 xe_gt_mcr_unicast_read(struct xe_gt *gt,
> >> -			   i915_mcr_reg_t reg,
> >> +			   xe_reg_t reg,
> >>  			   int group, int instance)
> >>  {
> >>  	u32 val;
> >>  
> >> +	drm_WARN_ON(&gt_to_xe(gt)->drm, !reg.mcr);
> >> +
> >>  	mcr_lock(gt);
> >>  	val = rw_with_mcr_steering(gt, reg, MCR_OP_READ, group, instance, 0);
> >>  	mcr_unlock(gt);
> >> @@ -548,9 +556,11 @@ u32 xe_gt_mcr_unicast_read(struct xe_gt *gt,
> >>   * Write an MCR register in unicast mode after steering toward a specific
> >>   * group/instance.
> >>   */
> >> -void xe_gt_mcr_unicast_write(struct xe_gt *gt, i915_mcr_reg_t reg, u32 value,
> >> +void xe_gt_mcr_unicast_write(struct xe_gt *gt, xe_reg_t reg, u32 value,
> >>  			     int group, int instance)
> >>  {
> >> +	drm_WARN_ON(&gt_to_xe(gt)->drm, !reg.mcr);
> >> +
> >>  	mcr_lock(gt);
> >>  	rw_with_mcr_steering(gt, reg, MCR_OP_WRITE, group, instance, value);
> >>  	mcr_unlock(gt);
> >> @@ -564,7 +574,7 @@ void xe_gt_mcr_unicast_write(struct xe_gt *gt, i915_mcr_reg_t reg, u32 value,
> >>   *
> >>   * Write an MCR register in multicast mode to update all instances.
> >>   */
> >> -void xe_gt_mcr_multicast_write(struct xe_gt *gt, i915_mcr_reg_t reg, u32 value)
> >> +void xe_gt_mcr_multicast_write(struct xe_gt *gt, xe_reg_t reg, u32 value)
> >>  {
> >>  	/*
> >>  	 * Synchronize with any unicast operations.  Once we have exclusive
> >> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.h b/drivers/gpu/drm/xe/xe_gt_mcr.h
> >> index 2a6cd38c8cb7..492d9519784a 100644
> >> --- a/drivers/gpu/drm/xe/xe_gt_mcr.h
> >> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.h
> >> @@ -15,13 +15,13 @@ void xe_gt_mcr_init(struct xe_gt *gt);
> >>  
> >>  void xe_gt_mcr_set_implicit_defaults(struct xe_gt *gt);
> >>  
> >> -u32 xe_gt_mcr_unicast_read(struct xe_gt *gt, i915_mcr_reg_t reg,
> >> +u32 xe_gt_mcr_unicast_read(struct xe_gt *gt, xe_reg_t reg,
> >>  			   int group, int instance);
> >> -u32 xe_gt_mcr_unicast_read_any(struct xe_gt *gt, i915_mcr_reg_t reg);
> >> +u32 xe_gt_mcr_unicast_read_any(struct xe_gt *gt, xe_reg_t reg);
> >>  
> >> -void xe_gt_mcr_unicast_write(struct xe_gt *gt, i915_mcr_reg_t reg, u32 value,
> >> +void xe_gt_mcr_unicast_write(struct xe_gt *gt, xe_reg_t reg, u32 value,
> >>  			     int group, int instance);
> >> -void xe_gt_mcr_multicast_write(struct xe_gt *gt, i915_mcr_reg_t reg, u32 value);
> >> +void xe_gt_mcr_multicast_write(struct xe_gt *gt, xe_reg_t reg, u32 value);
> >>  
> >>  void xe_gt_mcr_steering_dump(struct xe_gt *gt, struct drm_printer *p);
> >>  
> >> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> >> index 13f9f220bca0..8e5f8e7c16c8 100644
> >> --- a/drivers/gpu/drm/xe/xe_irq.c
> >> +++ b/drivers/gpu/drm/xe/xe_irq.c
> >> @@ -27,7 +27,7 @@
> >>  #define IIR(offset)				_MMIO(offset + 0x8)
> >>  #define IER(offset)				_MMIO(offset + 0xc)
> >>  
> >> -static void assert_iir_is_zero(struct xe_gt *gt, i915_reg_t reg)
> >> +static void assert_iir_is_zero(struct xe_gt *gt, xe_reg_t reg)
> >>  {
> >>  	u32 val = xe_mmio_read32(gt, reg.reg);
> >>  
> >> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> >> index a93838e23b7b..1029b9f27988 100644
> >> --- a/drivers/gpu/drm/xe/xe_mmio.c
> >> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> >> @@ -397,7 +397,7 @@ int xe_mmio_init(struct xe_device *xe)
> >>  	DRM_XE_MMIO_READ |\
> >>  	DRM_XE_MMIO_WRITE)
> >>  
> >> -static const i915_reg_t mmio_read_whitelist[] = {
> >> +static const xe_reg_t mmio_read_whitelist[] = {
> >>  	RING_TIMESTAMP(RENDER_RING_BASE),
> >>  };
> >>  
> >> -- 
> >> 2.39.0
> >> 
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
