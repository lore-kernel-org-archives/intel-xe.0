Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A32C54E67
	for <intel-xe@archiver.kernel.org>; Fri, 15 Mar 2024 13:59:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AB9C10E416;
	Fri, 15 Mar 2024 13:59:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LSnxJjzG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B355A10E416
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Mar 2024 13:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710511169; x=1742047169;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lPzt/HFCOPCGrhPfuzi3VipvDPssowaPN4FKw4RN6Ig=;
 b=LSnxJjzGJT/4OrD29+oOxKPyc99HN02z2+/prSY6idxgOYWYupd5O4Te
 hR6dYuLfEI0kVmealNekb6f2p6L16wWFEnB0L2AqZkLteTCdXy78g6QCK
 gb0s1SVCNBJA030sKKUqDqHDD69UfQ1MO2RdzWRtFW0501Y4ZWeAJ1oRB
 ghxFhLVdG+vs/wweVFIZMv3JayMVTlGxJghQBcUw7UPZfkzwyik9ATN5l
 KcQrFBjjcNAW48TXj7lpd6Ku8eraZbMp7+McAjuj+j9/J4rF0LmHXG6Xx
 4OoQ2G2MrV2g0UC176XWM3oKTy/x3GV+z64iG+5IT9pWbDjPRcngISPfl A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5514014"
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; 
   d="scan'208";a="5514014"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 06:59:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; d="scan'208";a="13134584"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Mar 2024 06:59:28 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Mar 2024 06:59:27 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 15 Mar 2024 06:59:27 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 15 Mar 2024 06:59:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cts730bQcR8F8h5vJs8IaAnoWiB2bsVIpd3jH7GZ7P8FJdu2qsr1jiS/LUziBvFlYbYDY21WGc9mfowVhghPOSLD4QnRjCCdtwQ5B2LTXRJMbEqXPh4+EY7OWAQih4B9fY70KmFyxWh1f5CHduxm+2MTUKfBHyNFZWP3EVZAdAPsElchFrmgLDacmh88BSbiMH1/ucFwmtP3sVu9LNFrdRDtrXP5WOztga4ppeyxPSbYAV6PFrC14FCW0WPTqU4VFinF6gzIbu2BTmJsmsg5XqkhEXScpecN+pGCICVq0sR6CB/LzYPv2xxLi7q9Dy0eGBDmvudiQKsdEGtlTYvtHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Eqm79oGDfuXovgLOxOCe32HycZAvqIiIot7d4hr3xI=;
 b=cv45o8ne7moDTWbvb5RvfnHhIoCH17zvL+Nb1xcCaOpmQtEr0Jv7FpsBPshAcvhtLxAo6S+ZPV1tcwDQLOyLjU7DTfEicEdyxNyD3Q0eiRrZ9TdaHBOrxLg/SFq9Ap5oiryfHzW52S1xcBSyNcxI/U3wYTthUKDxY5KzHer/4riivm4svCFu8FctB+cj3g89l8PTqloJErhZSXyat98Yd+zvvaKNRj3ly6WeqVNATgYoGo3Kp+qV9PUO70j8mcCbUwF6uuC3l0az/08O0iM0KOlswJs7TCXL2o4SRE3fqzzR5H77b9GXxiEpd6VLPRM/TUrY9uI9xWWv8uRK/NpkLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB7523.namprd11.prod.outlook.com (2603:10b6:510:280::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.18; Fri, 15 Mar
 2024 13:59:24 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7386.017; Fri, 15 Mar 2024
 13:59:24 +0000
Date: Fri, 15 Mar 2024 09:59:19 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>, "Teres Alexis, Alan Previn"
 <alan.previn.teres.alexis@intel.com>, "Somaiya, Himanshu"
 <himanshu.somaiya@intel.com>, <matthew.brost@intel.com>
Subject: Re: [PATCH 3/3] drm/xe: Force busted state and block GT reset upon
 any GPU hang
Message-ID: <ZfRUN4oinqjQfTJz@intel.com>
References: <20240315010317.193756-1-rodrigo.vivi@intel.com>
 <20240315010317.193756-3-rodrigo.vivi@intel.com>
 <MW4PR11MB7056DA60DFEDC7ECDCEA2D0FB3282@MW4PR11MB7056.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <MW4PR11MB7056DA60DFEDC7ECDCEA2D0FB3282@MW4PR11MB7056.namprd11.prod.outlook.com>
X-ClientProxiedBy: BY5PR17CA0024.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::37) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB7523:EE_
X-MS-Office365-Filtering-Correlation-Id: b1fcbc7c-aa45-4e6d-6b28-08dc44f81f1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rFIw3IjP5s+iSFy8b6vILiWlY87991zo/pKRpeGATUdiTuKCiPeFJZDiv1LW6Zs2m/xiIP5ezpZQ3qHbJ0i4/b2MaJTbI5Sv4aJA6GJkOnLFWRwX/6RcyZArE6N9kwMmbQ3Axe5pCBnqXBTTORUHM0vjREx9wcl5NzK8GvMVZQGZ3reDFYS9qpWAJid5He71ZmrsxQ1ak9nSHDt5cQ6dHnf6i4NzV6G6p7Mh7JvQI2XaWvcCAnkqn6pClGWQvJcOxW6MTLw38Aikk90f/vABY6CQiSI2zBmZ+la12uOubV3NysL1NuXALyXWH5ed8OOlX2SjkXSeh9RmhlT8jH9M4m/rgoQTAShTcqoeI41KTJRIF16qOoJgxpy+lQz72AY2KXzP+CSqSGFr6gj6rCCk5U7B9mHn7LV391Ij7p7fhgR7X9lJfBYREdeen83QbtEvbGJGgwky1aI+GP6D5jdW9IZpySR7jd6Vsjp+ka8SR79XDrS1fbP0olzLoWfy4GWIgakBrhRzJhmSQQIdZYWAHd38dspkLy3qJfq+aoeJHkAcJBy32GwMHG6MwAoUG7CQO0KnNb1Cn89qiLQHiV+IeO0NUAxe7hLUi2lQ3DDpKds=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Py/VWceoLdsn1oS+ZHJi+S5BoRpwfO25aMXohDgdLNfZV+OdyhbjlMskytZH?=
 =?us-ascii?Q?UeDLvlxuVulKaDlf6PqkfJN3onuWv5Gic8daI0MwXfXrWE0ziToCqFAWP7zU?=
 =?us-ascii?Q?c2T8qxrfB8DPDD+3kKJckViCrbmljm53wI/dOMT5ZVzMEZkSO+l7f/60th88?=
 =?us-ascii?Q?8i0Qd0k8/jja9wGgq8/y3zF4+9n8/yIhinefF8bYdYiYIBbTWxlXWHi9uIAG?=
 =?us-ascii?Q?gLHfoulZRIqZkku6wSwh3gLsb89P3hJAViFxR0QPtonIVNUlm588uMn8P3ri?=
 =?us-ascii?Q?Et0lWJ1RgbWXOjk4c97zgz0IiSt9IjaP4MSrslsb2FOUWpCnng/NAQ02lDAY?=
 =?us-ascii?Q?UL7P5dGN3OjQc6XsvP0Pf3dlDZTKrJWKR+T2mAfrcHfJbeQm9jtEJ+352+pj?=
 =?us-ascii?Q?1/HDFAgkRmo2nrCBjQYqoeBNGDc9c9qsiVNUd0By2YSxFkqYeE2vENmAd0X0?=
 =?us-ascii?Q?n6h9YFcHK5LvCG5me2ZNTFrk9B5zn5qyRXTqodo5a8GFoADIRRkyHrSVb+ax?=
 =?us-ascii?Q?AIDfxrHI6Na++PtIY6G4xSgS++D71CjQrgq6r/5N+FY8ZCo8KlkKxtIhIQx1?=
 =?us-ascii?Q?+5B00FWwZVpaduY4hVKzAGFbEYTU5NsiKDLPVvNhAnGS6zj2+tPRGnz++jHJ?=
 =?us-ascii?Q?fDxGoJCKJQa2bq0jYIMy/piDxyp/3fiZdH0aMrtqy6fEL0vFHzxIPVKNozIo?=
 =?us-ascii?Q?JCZ9eKZ77N98QbkyOUXmd+hobpPj00sDXOzqLhcBWDC03tjqgAvC8ZrLvLii?=
 =?us-ascii?Q?h21P3UTDtVcOPvi6KN1hGQ62oK7Yqz6fQuE+JbqQqSiGKZxkF0zPoR6EmX4T?=
 =?us-ascii?Q?8TxKqO5m9EPs4mC6XiSDfmxZSTyhzgdKTOgPUW6A0plZXDHkH+rc6i/zaliI?=
 =?us-ascii?Q?2XXHr3KALUxOua81YY07xmnrL5gxw1X1s6OAlzeCLFv24lCsOkz1jvYU0Sm+?=
 =?us-ascii?Q?MhPbK6ZUII2PihphKrV13WH1a+2ZHsjdk8DNxnEF5ir6v/XegUG8Onh4S1qO?=
 =?us-ascii?Q?H1ZSEgHiShnglbVzP12HeseFz+NimfjSOVtmNnqxBavz/IW66FcubrPeYyjq?=
 =?us-ascii?Q?atztGOGFreNgdlK8QD5AomXe1F273R9rot5ZzFMQ69hcbpg2q7yd5LEVzwgd?=
 =?us-ascii?Q?uCbrxNrcajkGPV2RaIVwZRUxowjCYNlAa4DQ/Vvxp66J2a1J9lwiC4+GxktL?=
 =?us-ascii?Q?0xg8qTxgc5NeenC1h0O5L6ghiDmxxQGJFEynhsKEZPb88AOsGl9Tu0KRXGID?=
 =?us-ascii?Q?H6hIDlsF0si1+NW93VdI5VnPlA2Y4yNpeKbXa+LxmTh/dI0lX5VvcQ8i0J0F?=
 =?us-ascii?Q?Iq/Qy0zcu/g1MXRguCrOQWfq9ks5gu9IvxxyACEJzP8LCCOvrTvJ3nJlMJWt?=
 =?us-ascii?Q?eidamecHTNgtpgfxBXCAROI3+N1tcfHK1/+PIkvhsR1lZhkbjERQcZkeLtH1?=
 =?us-ascii?Q?+nMFq+NpxwCqMaaRDk7E1BAanuOnPGhwjDA/xGTsdh1YmUsyETuxGcO24cR/?=
 =?us-ascii?Q?uSeSF6zwEipzkqk5BrYs4rENo7XpLgNlgNln1mRvrxE6TuRN50Z9cd6EmjSc?=
 =?us-ascii?Q?EWTE39B4+Uc6JmL9aAmg6FXB25O2RXr9uzVLCmT9+iXBifRDsP9EXtjvprwz?=
 =?us-ascii?Q?dA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b1fcbc7c-aa45-4e6d-6b28-08dc44f81f1a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2024 13:59:24.7477 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n7Y0ag9jTEEIpEy8mKq5OjYZ91BBieH3JgIcY1y8owXC5g6q9kZd1PxsZlwRqFxFJv1+bSAih4WQ6NG/T3cPbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7523
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

On Fri, Mar 15, 2024 at 04:31:54AM +0000, Ghimiray, Himal Prasad wrote:
> 
> 
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> > Rodrigo Vivi
> > Sent: 15 March 2024 06:33
> > To: intel-xe@lists.freedesktop.org
> > Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; De Marchi, Lucas
> > <lucas.demarchi@intel.com>; Teres Alexis, Alan Previn
> > <alan.previn.teres.alexis@intel.com>; Somaiya, Himanshu
> > <himanshu.somaiya@intel.com>
> > Subject: [PATCH 3/3] drm/xe: Force busted state and block GT reset upon any
> > GPU hang
> > 
> > In many validation situations when debugging GPU Hangs, it is useful to
> > preserve the GT situation from the moment that the timeout occurred.
> > 
> > This patch introduces a module parameter that could be used on situations
> > like this.
> > 
> > If xe.busted module parameter is set to 2, Xe will be declared busted on
> > every single execution timeout (a.k.a. GPU hang) right after devcoredump
> > snapshot capture and without attempting any kind of GT reset and blocking
> > entirely any kind of execution.
> > 
> > v2: Really block gt_reset from guc side. (Lucas)
> >     s/wedged/busted (Lucas)
> > 
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> > Cc: Himanshu Somaiya <himanshu.somaiya@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_device.c     | 30 ++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_device.h     | 13 +------------
> >  drivers/gpu/drm/xe/xe_guc_ads.c    |  7 +++++++
> >  drivers/gpu/drm/xe/xe_guc_submit.c |  4 ++++
> >  drivers/gpu/drm/xe/xe_module.c     |  5 +++++
> >  drivers/gpu/drm/xe/xe_module.h     |  1 +
> >  6 files changed, 48 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device.c
> > b/drivers/gpu/drm/xe/xe_device.c index d02e59fb49eb..e28e3628744f
> > 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -774,3 +774,33 @@ u64 xe_device_uncanonicalize_addr(struct
> > xe_device *xe, u64 address)  {
> >  	return address & GENMASK_ULL(xe->info.va_bits - 1, 0);  }
> > +
> > +/**
> > + * xe_device_declare_busted - Declare device busted
> > + * @xe: xe device instance
> > + *
> > + * This is a final state that can only be cleared with a module
> > + * re-probe (unbind + bind).
> > + * In this state every IOCTL will be blocked so the GT cannot be used.
> > + * In general it will be called upon any critical error such as gt
> > +reset
> > + * failure or guc loading failure.
> > + * If xe.busted module parameter is set to 2, this function will be
> > +called
> > + * on every single execution timeout (a.k.a. GPU hang) right after
> > +devcoredump
> > + * snapshot capture. In this mode, GT reset won't be attempted so the
> > +state of
> > + * the issue is preserved for further debugging.
> > + */
> > +void xe_device_declare_busted(struct xe_device *xe) {
> > +	if (xe_modparam.busted_mode == 0)
> > +		return;
>  
> Do you see any usecase or benefit of providing the option to disable busted mode with modparam ?

honestly? No!
I just wanted to have a chicken way back to the current status quo...

Matt?
Lucas?
thoughts?

> 
> BR
> Himal 
> 
> > +
> > +	if (!atomic_xchg(&xe->busted, 1))
> > +		drm_err(&xe->drm,
> > +			"CRITICAL: Xe has declared device %s as busted.\n"
> > +			"IOCTLs and executions are blocked until device is
> > probed again with unbind and bind operations:\n"
> > +			"echo '%s' | sudo tee
> > /sys/bus/pci/drivers/xe/unbind\n"
> > +			"echo '%s' | sudo tee
> > /sys/bus/pci/drivers/xe/bind\n"
> > +			"Please file a _new_ bug report at
> > https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
> > +			dev_name(xe->drm.dev), dev_name(xe->drm.dev),
> > +			dev_name(xe->drm.dev));
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_device.h
> > b/drivers/gpu/drm/xe/xe_device.h index 2c6d9b77821a..e6edf2d3ee4a
> > 100644
> > --- a/drivers/gpu/drm/xe/xe_device.h
> > +++ b/drivers/gpu/drm/xe/xe_device.h
> > @@ -181,17 +181,6 @@ static inline bool xe_device_busted(struct xe_device
> > *xe)
> >  	return atomic_read(&xe->busted);
> >  }
> > 
> > -static inline void xe_device_declare_busted(struct xe_device *xe) -{
> > -	if (!atomic_xchg(&xe->busted, 1))
> > -		drm_err(&xe->drm,
> > -			"CRITICAL: Xe has declared device %s as busted.\n"
> > -			"IOCTLs and executions are blocked until device is
> > probed again with unbind and bind operations:\n"
> > -			"echo '%s' | sudo tee
> > /sys/bus/pci/drivers/xe/unbind\n"
> > -			"echo '%s' | sudo tee
> > /sys/bus/pci/drivers/xe/bind\n"
> > -			"Please file a _new_ bug report at
> > https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
> > -			dev_name(xe->drm.dev), dev_name(xe->drm.dev),
> > -			dev_name(xe->drm.dev));
> > -}
> > +void xe_device_declare_busted(struct xe_device *xe);
> > 
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c
> > b/drivers/gpu/drm/xe/xe_guc_ads.c index 6ad4c1a90a78..ecf45289b187
> > 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> > @@ -18,6 +18,7 @@
> >  #include "xe_lrc.h"
> >  #include "xe_map.h"
> >  #include "xe_mmio.h"
> > +#include "xe_module.h"
> >  #include "xe_platform_types.h"
> > 
> >  /* Slack of a few additional entries per engine */ @@ -312,10 +313,16 @@
> > int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads)
> > 
> >  static void guc_policies_init(struct xe_guc_ads *ads)  {
> > +	u32 global_flags = 0;
> > +
> >  	ads_blob_write(ads, policies.dpc_promote_time,
> >  		       GLOBAL_POLICY_DEFAULT_DPC_PROMOTE_TIME_US);
> >  	ads_blob_write(ads, policies.max_num_work_items,
> >  		       GLOBAL_POLICY_MAX_NUM_WI);
> > +
> > +	if (xe_modparam.busted_mode == 2)
> > +		global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
> > +
> >  	ads_blob_write(ads, policies.global_flags, 0);
> >  	ads_blob_write(ads, policies.is_valid, 1);  } diff --git
> > a/drivers/gpu/drm/xe/xe_guc_submit.c
> > b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 82c955a2a15c..e7ddf35c1dac 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -34,6 +34,7 @@
> >  #include "xe_macros.h"
> >  #include "xe_map.h"
> >  #include "xe_mocs.h"
> > +#include "xe_module.h"
> >  #include "xe_ring_ops_types.h"
> >  #include "xe_sched_job.h"
> >  #include "xe_trace.h"
> > @@ -949,6 +950,9 @@ guc_exec_queue_timedout_job(struct
> > drm_sched_job *drm_job)
> >  	simple_error_capture(q);
> >  	xe_devcoredump(job);
> > 
> > +	if (xe_modparam.busted_mode == 2)
> > +		xe_device_declare_busted(xe);
> > +
> >  	trace_xe_sched_job_timedout(job);
> > 
> >  	/* Kill the run_job entry point */
> > diff --git a/drivers/gpu/drm/xe/xe_module.c
> > b/drivers/gpu/drm/xe/xe_module.c index 110b69864656..f81970e8d713
> > 100644
> > --- a/drivers/gpu/drm/xe/xe_module.c
> > +++ b/drivers/gpu/drm/xe/xe_module.c
> > @@ -17,6 +17,7 @@ struct xe_modparam xe_modparam = {
> >  	.enable_display = true,
> >  	.guc_log_level = 5,
> >  	.force_probe = CONFIG_DRM_XE_FORCE_PROBE,
> > +	.busted_mode = 1,
> >  	/* the rest are 0 by default */
> >  };
> > 
> > @@ -48,6 +49,10 @@ module_param_named_unsafe(force_probe,
> > xe_modparam.force_probe, charp, 0400);
> > MODULE_PARM_DESC(force_probe,
> >  		 "Force probe options for specified devices. See
> > CONFIG_DRM_XE_FORCE_PROBE for details.");
> > 
> > +module_param_named_unsafe(busted_mode,
> > xe_modparam.busted_mode, int,
> > +0600); MODULE_PARM_DESC(busted_mode,
> > +		 "Module's default policy for the busted mode - 0=never,
> > +1=upon-critical-errors[default], 2=upon-any-hang");
> > +
> >  struct init_funcs {
> >  	int (*init)(void);
> >  	void (*exit)(void);
> > diff --git a/drivers/gpu/drm/xe/xe_module.h
> > b/drivers/gpu/drm/xe/xe_module.h index 88ef0e8b2bfd..bbf88c34e4f4
> > 100644
> > --- a/drivers/gpu/drm/xe/xe_module.h
> > +++ b/drivers/gpu/drm/xe/xe_module.h
> > @@ -18,6 +18,7 @@ struct xe_modparam {
> >  	char *huc_firmware_path;
> >  	char *gsc_firmware_path;
> >  	char *force_probe;
> > +	int busted_mode;
> >  };
> > 
> >  extern struct xe_modparam xe_modparam;
> > --
> > 2.44.0
> 
