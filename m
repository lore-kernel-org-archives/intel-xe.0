Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 566C1CD1284
	for <intel-xe@archiver.kernel.org>; Thu,  4 Apr 2024 18:01:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00E48113386;
	Thu,  4 Apr 2024 18:01:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F8yXIx/3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED4761133AE
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Apr 2024 18:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712253678; x=1743789678;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fIkVS6mO+m9DPI8m8BdzFuj2msw8me1NjGuqNLmfCwE=;
 b=F8yXIx/3NyOFGK1er+NI/qKcvof4enxJQzGG4XXxM9St3E3ZrtNVCr3Q
 KnzYTjzWAw7dM8hk8bOSBF5b0IpVBxO+ZCURUCcVhdnLXJTRcriCLWxgz
 NyUjYW0FtYXZqWpvoByu4/qqNF3c/aSkFlmkYLiS7GAc/4Axslsiabomv
 9PDFIh+2XowmcjmNwAxDYMKeIESmth8LvV0trbdKLjLlKKnKZaqbkeh0r
 s2pyXipN+1FVzwaOXDhRCaPLdVQ0/Qr33Sz5AtAe3CQQmm81oBPULu+b0
 76Or5VH7Nn3UMiaY6bCJfV7oHuLdKIxM+AdIKh0n1NLbdOB9hHvkn78it Q==;
X-CSE-ConnectionGUID: iZv8Maj5QPy/VivBm3tNhQ==
X-CSE-MsgGUID: rvwUny3ASPC54oNcRR3S+A==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="18120426"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="18120426"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 11:01:17 -0700
X-CSE-ConnectionGUID: 3Wbz27tEQi6uQPM+SpO+xg==
X-CSE-MsgGUID: AN2PqdLCRa61goXsxLLMBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="19325543"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Apr 2024 11:01:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 11:01:17 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 4 Apr 2024 11:01:17 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 4 Apr 2024 11:01:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IUqEt0PQ+/xVkgpGWk9+qWGeSG208za7TG2zequ8LHCsBf6ML6ndlMSUJCMnrB5JMOLNS/BDzhDTeA42LG0094vneyCX49YGzXGV8ibDiubNZoLxx5b5Vf1nYIEBRO0+LnRve2iQzYfLIyzfNHv+nltOJIInSYdtnQnY12Bw07R8u9CtEWScW7HR9ia88qqk8KOjPzQNEQ39jYlpzprOkGkNoOgZh3aTCshRQ9zySsKardtdxUqJxbA3FFZ6XE23/m6eA5BmZd8RehWNiqh/Y4+r61CsfDk357pvrXNmJkIYY/PTUDVxbU2KUqGZQCgl/9Bxbmmh6GjL3184yHB1jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OKGi9hXX4kCXJl0IXW9rBqRsdpjqPE4Lapykl9OXotE=;
 b=gAIGJIxW+oSn4LIY1KI4bcR+3eEn+Jyus8P1o95RLbY4FxIzjiniCJv99RwLu4JhyFKfEuZEX4mfaVHODeN0jVj68XjUN7pEjfqLNJ3Ff3+WNbM1XhXYa6FdoRfnDzdN9+XRvoOYq8GQ3TZc38xDnd+9QAOWPZZ1otpg88txyQXNC6qhMIEkV7FYrCWbvVvx4zpMEapokBSBYP82gwOfu5aNPKoNcgaX93cymxOVszPOOPhe0aw9giRaqlNMGDYTGeK5nBticLDKRHj841nlI/Ran9Kyen1riaDIvBdrgabeFF5AvktVdxnCLQ30A8BjvvZlgLT5rUf19mikGQq4DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB7969.namprd11.prod.outlook.com (2603:10b6:8:120::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Thu, 4 Apr
 2024 18:01:13 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7452.019; Thu, 4 Apr 2024
 18:01:12 +0000
Date: Thu, 4 Apr 2024 14:01:07 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <lucas.demarchi@intel.com>, "Dafna
 Hirschfeld" <dhirschfeld@habana.ai>, Alan Previn
 <alan.previn.teres.alexis@intel.com>, Himanshu Somaiya
 <himanshu.somaiya@intel.com>
Subject: Re: [PATCH 3/4] drm/xe: Force wedged state and block GT reset upon
 any GPU hang
Message-ID: <Zg7q42jKjJZucOi1@intel.com>
References: <20240403150732.102678-1-rodrigo.vivi@intel.com>
 <20240403150732.102678-4-rodrigo.vivi@intel.com>
 <Zg7ozwBmrFAw88nS@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Zg7ozwBmrFAw88nS@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: MW4PR03CA0217.namprd03.prod.outlook.com
 (2603:10b6:303:b9::12) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB7969:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l5kK/wY22GIh+aqVs3lfEVBPFLnWysP3nN3Qtjef8ekgOYx7YbZQk2Qyk5Ge9yWWf6m2yf9rhJUewkX56fjFOo7wv44CS4nS57+5DpE7Griky0p/3m7eYjV1RWVU1fIk+UGd0e8W9uw/KtDYbMI/DVFz0w7Kg78Ci4d8+vE2EzCRpXkJglbVn9qz9L8ckj6GJrGeZeOPfw//2Dzf0pMeChwArzcdVwmuIFQrJcU2dtdecvUyZsLLHL8+kGhlRyW8z3Y0QZ2DQCqRSefNKIUZCT4NMlagvnDP0DLujf1Xzs0rRZ2eW/gsCSdAolBfW9ZHRMsczhQZeC9OzNxO5MkN2upXMa61bA63am6wyDhu9aCFMoQTJhFgcoheKqN0KaTSR2XdYFxuCjnmBSMeFJ0ZOtMYMkVH4h2yGop92vll3hO6k1qJO27X9ek3zkQyGpKDJtvp+Z+B6oz+FZeCP4xNHZ+3wZzgUy5E6HbPbDWfXwqfPpmjr6l6DNVCqqj/13nKuz/Sj1AVGC/zlo2sQlabudFDznvOK8zkGT9MJqO8Q/3XUPe+elAQQ4WzO+gTGuuNZzOQqznvmejARzkXd/NACE9avU39O77knHeqfYUqW1c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yno7fL5ZzWgd5gmdziznrE+cvK8HK5mRjOgczj+MKRfwZw4QapMdCzcbE0TR?=
 =?us-ascii?Q?IeA+rtA2L5zYTfa6roMoCH7hWcdSYoEA2FK2LPxU6eTfsXqi3Jq4jFzYUM5M?=
 =?us-ascii?Q?mCSfHfUvMAnK6TpIc5w2pnDsjecs0V9uqkJnx8kVv3NEJhteaec9wMcMEyhm?=
 =?us-ascii?Q?a7krtpvmGPSEwnjK8FNIMO7TC++5ubw0cxkaq+nc7zli3NaJU3JPm5mkW16r?=
 =?us-ascii?Q?sX8f0XZcjdM5s0Rw2yT8Xh5iQaEeyJpyb05F3OBhKK+55iNmCeJPMAjaCN8m?=
 =?us-ascii?Q?GJ62gZusM407sJzTfv0ZOPKqhycQ+ReMu22txFz1d6oV0I4i2qjk7GT9lsbs?=
 =?us-ascii?Q?WarFR9IBxIdzTrklUDas6SivFXtYaon+eoPgAQ1uI7xp6yMwMjJ6j+jX1DoC?=
 =?us-ascii?Q?Mxjcgv4LamvzT5lcEPh5F+moWF61sw2JC7wL/NscrtcuiaDO2mIKISfl3bv0?=
 =?us-ascii?Q?j14hPDm1cEFWCnNHGWyOgRcH/ektv0j4Gfw04JfHDQA+nq/X9IpmLio7kSeT?=
 =?us-ascii?Q?7X+KCWGP1InkfNbrtqgM1dkLYl/45AOw6IXOCClk99p3RexarpysFWZgrNQ9?=
 =?us-ascii?Q?ojEycyTMNUyGAbz4rlyHEpk5gfUJMcaEBUXCE9ZjF7PxhzyYrOtzjifcsVjI?=
 =?us-ascii?Q?XGpIFPfOe1ZG8lsFs+06Ze81mIGyP/xkAWT1n9HogYyeHcZjgcOLrHbp/dhK?=
 =?us-ascii?Q?3/atsNEmuH+joE2v/lgpCqb32tsB3KyGMsJoK84MR9vUBXK12ESvZfQPn5PU?=
 =?us-ascii?Q?uiACi7LqKeeUkWtMdXC7PY1AOR2+ZnMBTQAjNMufALppIm4JQMH0I1/+qXot?=
 =?us-ascii?Q?WWlS+zKT7wSx0sXOTY8fnH3gCq9tn8ew+635TOSrwuYBFhFEL0pKeXMVx132?=
 =?us-ascii?Q?KTIrASMlnHMWOCYn6H8tsHYdd87GihrSRo9De9AN2uGWAAwEVaxYqXkxtM8r?=
 =?us-ascii?Q?MsP/nkviL7yepeRD23sGPftHg64T5cMqdA54v6zNpmTZYlXN+1tWXJu15P4a?=
 =?us-ascii?Q?dS/q/DNxvmOrQxF4c8l+fHnfGXvvFpYcryy79dK6DVO+55RtlHG9GF6UZGgQ?=
 =?us-ascii?Q?ofGB8C4ghwf0S+eCJLdrTJHdY97Djq1DAlgHHftVM85SqflDlbVIwJELJTYF?=
 =?us-ascii?Q?41KO0D1cmfQf6lNZEYu4FGdxNqZ4E3y03yivQed0e6YxGyspqzremTPIFEmd?=
 =?us-ascii?Q?823P3KZdx7d5RbWTocYN+ScQ4ZENFjiaPcAs2pYnxI1IgMJFGKuAuphD7Zgw?=
 =?us-ascii?Q?r3fLpsst6Z7nnRawsO9z6+j1jC712XpYG3h0H2+v1NotC6dWgP9ah7pSr6V+?=
 =?us-ascii?Q?t5hs9k4Mwn8OQ9Be51huuRmL0zRH7xS0xPLngLyjRRSIWl9MHLAPI37vfI0p?=
 =?us-ascii?Q?RARsgfatdnpgksl8Pk6HLHKW3LAeg+TJnz9ZLqhvKx2re98gdJvFkQpznejF?=
 =?us-ascii?Q?1yvaDfDmjmugExy66TpCBQsTtu2J6Xm3U0swKNuwi0WX2uA+H2L4b9xUFV4r?=
 =?us-ascii?Q?amDmWREwDzd1eq7dxmXoWYqH875TPOxJxwNtKKA0PeqNhi7bCPaTrKZ9aD9X?=
 =?us-ascii?Q?bZMBkgs0tkSCs+2fAClfvxA8C0moijNZgdABRuEX0q7qswqPJqVDj8QNZif4?=
 =?us-ascii?Q?VQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a4a7b4f-1fc4-4964-76b5-08dc54d136c1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 18:01:12.5966 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1/vNq/CNhBvHXjgaRG//ywCqQSlZX2VQEQ9iX0JWuDOFtDlEtbV3uf7VLH4qmYb8qVzzsTVoGvBbMhuU9Gq5YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7969
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

On Thu, Apr 04, 2024 at 05:52:15PM +0000, Matthew Brost wrote:
> On Wed, Apr 03, 2024 at 11:07:31AM -0400, Rodrigo Vivi wrote:
> > In many validation situations when debugging GPU Hangs,
> > it is useful to preserve the GT situation from the moment
> > that the timeout occurred.
> > 
> > This patch introduces a module parameter that could be used
> > on situations like this.
> > 
> > If xe.wedged module parameter is set to 2, Xe will be declared
> > wedged on every single execution timeout (a.k.a. GPU hang) right
> > after devcoredump snapshot capture and without attempting any
> > kind of GT reset and blocking entirely any kind of execution.
> > 
> > v2: Really block gt_reset from guc side. (Lucas)
> >     s/wedged/busted (Lucas)
> > 
> > v3: - s/busted/wedged
> >     - Really use global_flags (Dafna)
> >     - More robust timeout handling when wedging it.
> > 
> > Cc: Dafna Hirschfeld <dhirschfeld@habana.ai>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> > Cc: Himanshu Somaiya <himanshu.somaiya@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_device.c     | 32 +++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_device.h     | 15 +---------
> >  drivers/gpu/drm/xe/xe_guc_ads.c    |  9 +++++-
> >  drivers/gpu/drm/xe/xe_guc_submit.c | 46 +++++++++++++++++++++++++-----
> >  drivers/gpu/drm/xe/xe_module.c     |  5 ++++
> >  drivers/gpu/drm/xe/xe_module.h     |  1 +
> >  6 files changed, 86 insertions(+), 22 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index 7015ef9b00a0..8e380a404a26 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -776,3 +776,35 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
> >  {
> >  	return address & GENMASK_ULL(xe->info.va_bits - 1, 0);
> >  }
> > +
> > +/**
> > + * xe_device_declare_wedged - Declare device wedged
> > + * @xe: xe device instance
> > + *
> > + * This is a final state that can only be cleared with a module
> > + * re-probe (unbind + bind).
> > + * In this state every IOCTL will be blocked so the GT cannot be used.
> > + * In general it will be called upon any critical error such as gt reset
> > + * failure or guc loading failure.
> > + * If xe.wedged module parameter is set to 2, this function will be called
> > + * on every single execution timeout (a.k.a. GPU hang) right after devcoredump
> > + * snapshot capture. In this mode, GT reset won't be attempted so the state of
> > + * the issue is preserved for further debugging.
> > + */
> > +void xe_device_declare_wedged(struct xe_device *xe)
> > +{
> > +	if (xe_modparam.wedged_mode == 0)
> > +		return;
> > +
> > +	if (!atomic_xchg(&xe->wedged, 1)) {
> > +		xe->needs_flr_on_fini = true;
> > +		drm_err(&xe->drm,
> > +			"CRITICAL: Xe has declared device %s as wedged.\n"
> > +			"IOCTLs and executions are blocked until device is probed again with unbind and bind operations:\n"
> > +			"echo '%s' | sudo tee /sys/bus/pci/drivers/xe/unbind\n"
> > +			"echo '%s' | sudo tee /sys/bus/pci/drivers/xe/bind\n"
> > +			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
> > +			dev_name(xe->drm.dev), dev_name(xe->drm.dev),
> > +			dev_name(xe->drm.dev));
> > +	}
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> > index c532209c5bbd..0fea5c18f76d 100644
> > --- a/drivers/gpu/drm/xe/xe_device.h
> > +++ b/drivers/gpu/drm/xe/xe_device.h
> > @@ -181,19 +181,6 @@ static inline bool xe_device_wedged(struct xe_device *xe)
> >  	return atomic_read(&xe->wedged);
> >  }
> >  
> > -static inline void xe_device_declare_wedged(struct xe_device *xe)
> > -{
> > -	if (!atomic_xchg(&xe->wedged, 1)) {
> > -		xe->needs_flr_on_fini = true;
> > -		drm_err(&xe->drm,
> > -			"CRITICAL: Xe has declared device %s as wedged.\n"
> > -			"IOCTLs and executions are blocked until device is probed again with unbind and bind operations:\n"
> > -			"echo '%s' > /sys/bus/pci/drivers/xe/unbind\n"
> > -			"echo '%s' > /sys/bus/pci/drivers/xe/bind\n"
> > -			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
> > -			dev_name(xe->drm.dev), dev_name(xe->drm.dev),
> > -			dev_name(xe->drm.dev));
> > -	}
> > -}
> > +void xe_device_declare_wedged(struct xe_device *xe);
> >  
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> > index e025f3e10c9b..37f30c333c93 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> > @@ -18,6 +18,7 @@
> >  #include "xe_lrc.h"
> >  #include "xe_map.h"
> >  #include "xe_mmio.h"
> > +#include "xe_module.h"
> >  #include "xe_platform_types.h"
> >  
> >  /* Slack of a few additional entries per engine */
> > @@ -313,11 +314,17 @@ int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads)
> >  
> >  static void guc_policies_init(struct xe_guc_ads *ads)
> >  {
> > +	u32 global_flags = 0;
> > +
> >  	ads_blob_write(ads, policies.dpc_promote_time,
> >  		       GLOBAL_POLICY_DEFAULT_DPC_PROMOTE_TIME_US);
> >  	ads_blob_write(ads, policies.max_num_work_items,
> >  		       GLOBAL_POLICY_MAX_NUM_WI);
> > -	ads_blob_write(ads, policies.global_flags, 0);
> > +
> > +	if (xe_modparam.wedged_mode == 2)
> > +		global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
> > +
> > +	ads_blob_write(ads, policies.global_flags, global_flags);
> >  	ads_blob_write(ads, policies.is_valid, 1);
> >  }
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 0a2a54f69f50..0eba01582f7c 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -35,6 +35,7 @@
> >  #include "xe_macros.h"
> >  #include "xe_map.h"
> >  #include "xe_mocs.h"
> > +#include "xe_module.h"
> >  #include "xe_ring_ops_types.h"
> >  #include "xe_sched_job.h"
> >  #include "xe_trace.h"
> > @@ -900,16 +901,44 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
> >  	xe_sched_submission_start(sched);
> >  }
> >  
> > +static void guc_submit_signal_pending_jobs(struct xe_gpu_scheduler *sched,
> > +					   int err)
> > +{
> > +	struct xe_sched_job *job;
> > +	int i = 0;
> > +
> > +	/* Mark all outstanding jobs as bad, thus completing them */
> > +	spin_lock(&sched->base.job_list_lock);
> > +	list_for_each_entry(job, &sched->base.pending_list, drm.list)
> > +		xe_sched_job_set_error(job, !i++ ? err : -ECANCELED);
> > +	spin_unlock(&sched->base.job_list_lock);
> > +}
> > +
> > +static void guc_submit_device_wedged(struct xe_exec_queue *q)
> > +{
> > +	struct xe_gpu_scheduler *sched = &q->guc->sched;
> > +	struct xe_guc *guc = exec_queue_to_guc(q);
> > +
> > +	xe_sched_submission_stop(sched);
> > +	xe_guc_exec_queue_trigger_cleanup(q);
> > +	guc_submit_signal_pending_jobs(sched, -ETIME);
> 
> This will not signal the job that timed out as the job that times out is
> removed from the pending list. In the normal TDR path the pending job is
> added in via xe_sched_add_pending_job call.

yeap, I was kind of wondering that, but I couldn't find a way.
Is there one?

> 
> Also with the xe_sched_submission_stop() I don't think free_job() will
> ever get called on the pending jobs. Is that the intent?

Well, that's a good question indeed.
The intent for this aggressive wedged_mode=2 here is to preserve
the most of the memory at the time of the hang happened.

But at the same time, we need to do some clean-ups so we can survive
through the rebind/reprobe and/or module reload.

I'm really open and looking for recommendation and guidance here.

> 
>  
> > +	xe_guc_submit_reset_prepare(guc);
> > +	xe_guc_submit_stop(guc);
> 
> This also is going to stop all jobs, on all exec queues, from having
> free_job being called.
> 
> I guess I am little confused what this function is trying accomplish.
> Can you explain? It would help me review this.

same as above actually.

2 goals: preserve the memory for SV validation teams and survive through
a rebind/reprobe/reload.

if I was not stopping these things here I was getting into some kind
of loops or accesses where our unbind would get badly stuck.

> 
> > +}
> > +
> >  static enum drm_gpu_sched_stat
> >  guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> >  {
> >  	struct xe_sched_job *job = to_xe_sched_job(drm_job);
> > -	struct xe_sched_job *tmp_job;
> >  	struct xe_exec_queue *q = job->q;
> >  	struct xe_gpu_scheduler *sched = &q->guc->sched;
> >  	struct xe_device *xe = guc_to_xe(exec_queue_to_guc(q));
> >  	int err = -ETIME;
> > -	int i = 0;
> > +
> > +	if (xe_device_wedged(xe)) {
> > +		guc_submit_device_wedged(q);
> > +		return DRM_GPU_SCHED_STAT_ENODEV;
> > +	}
> >  
> >  	/*
> >  	 * TDR has fired before free job worker. Common if exec queue
> > @@ -933,6 +962,12 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> >  
> >  	trace_xe_sched_job_timedout(job);
> >  
> > +	if (xe_modparam.wedged_mode == 2) {
> > +		xe_device_declare_wedged(xe);
> > +		guc_submit_device_wedged(q);
> > +		return DRM_GPU_SCHED_STAT_ENODEV;
> > +	}
> > +
> >  	/* Kill the run_job entry point */
> >  	xe_sched_submission_stop(sched);
> >  
> > @@ -994,13 +1029,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> >  	 */
> >  	xe_sched_add_pending_job(sched, job);
> >  	xe_sched_submission_start(sched);
> > +
> 
> Nit: Looks unrelated.
> 
> Matt
> 
> >  	xe_guc_exec_queue_trigger_cleanup(q);
> >  
> > -	/* Mark all outstanding jobs as bad, thus completing them */
> > -	spin_lock(&sched->base.job_list_lock);
> > -	list_for_each_entry(tmp_job, &sched->base.pending_list, drm.list)
> > -		xe_sched_job_set_error(tmp_job, !i++ ? err : -ECANCELED);
> > -	spin_unlock(&sched->base.job_list_lock);
> > +	guc_submit_signal_pending_jobs(sched, err);
> >  
> >  	/* Start fence signaling */
> >  	xe_hw_fence_irq_start(q->fence_irq);
> > diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> > index 110b69864656..5e023df0bea9 100644
> > --- a/drivers/gpu/drm/xe/xe_module.c
> > +++ b/drivers/gpu/drm/xe/xe_module.c
> > @@ -17,6 +17,7 @@ struct xe_modparam xe_modparam = {
> >  	.enable_display = true,
> >  	.guc_log_level = 5,
> >  	.force_probe = CONFIG_DRM_XE_FORCE_PROBE,
> > +	.wedged_mode = 1,
> >  	/* the rest are 0 by default */
> >  };
> >  
> > @@ -48,6 +49,10 @@ module_param_named_unsafe(force_probe, xe_modparam.force_probe, charp, 0400);
> >  MODULE_PARM_DESC(force_probe,
> >  		 "Force probe options for specified devices. See CONFIG_DRM_XE_FORCE_PROBE for details.");
> >  
> > +module_param_named_unsafe(wedged_mode, xe_modparam.wedged_mode, int, 0600);
> > +MODULE_PARM_DESC(wedged_mode,
> > +		 "Module's default policy for the wedged mode - 0=never, 1=upon-critical-errors[default], 2=upon-any-hang");
> > +
> >  struct init_funcs {
> >  	int (*init)(void);
> >  	void (*exit)(void);
> > diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
> > index 88ef0e8b2bfd..bc6f370c9a8e 100644
> > --- a/drivers/gpu/drm/xe/xe_module.h
> > +++ b/drivers/gpu/drm/xe/xe_module.h
> > @@ -18,6 +18,7 @@ struct xe_modparam {
> >  	char *huc_firmware_path;
> >  	char *gsc_firmware_path;
> >  	char *force_probe;
> > +	int wedged_mode;
> >  };
> >  
> >  extern struct xe_modparam xe_modparam;
> > -- 
> > 2.44.0
> > 
