Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0491C02198
	for <intel-xe@archiver.kernel.org>; Wed, 12 Feb 2025 20:59:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87B2210E0E4;
	Wed, 12 Feb 2025 20:59:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FbLUy1hn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D424310E0E4
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Feb 2025 20:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739393972; x=1770929972;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Mky/D2NwsEAaLQv017AqjEsZWydLJxzyzXr+TfF0A8w=;
 b=FbLUy1hnwfLXKZQE2Ign1+ogOJunWx8pZQSXJtqExLUH+zvV21nV1qrI
 UfPJjlSsDBOYXWr5rXAM+zHce0tAsjWOM6XT4c5921zcjM4y5B2hG/Fgg
 7n9S8vfUDfC1QMwgQ6qKdnGIU8Rq1emfaznV8QrZ9kxO8v5KLhBBvd+4J
 eRBZQxswEtQ4qqaYjbZXbnnfIouGHHf6CYU5qnqCj6WVuG3Qt0SZWZPU+
 gCgqm/Dr+blPbmSSr1vFi7Pp6HPIpos5TGAZzBI6ptSmr3w7xA7G7pHcX
 gfNpy0LlI+29exkGCItfQVoGl6RlrLxbQvBXIfywFnNh9R/1m8Anp7SeZ g==;
X-CSE-ConnectionGUID: iupUhNlHShur2Q0IUySp2w==
X-CSE-MsgGUID: +IBqQIWVRxuyideTqptpSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="39935962"
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; d="scan'208";a="39935962"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 12:59:31 -0800
X-CSE-ConnectionGUID: +ufSFGlFRw6TvtZApuERGg==
X-CSE-MsgGUID: mEECRn23QAWCvm1vhTp9fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117559118"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Feb 2025 12:59:31 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 12 Feb 2025 12:59:30 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 12 Feb 2025 12:59:30 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Feb 2025 12:59:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n7erp9aM/3sFVqzU2ge3woTi+ndh3RW0JIPMl7WFhOO5z0J7yrBTa1GEPmt9y5TOAK7oIMGAquEVwaP1TbMMqc3MIF4taz0+NTxsmZV0xYgiYreBOzOJ272GxkBg3ivSpqHxsaVzK/tzqiqSlQuCusj1Xd7ntCNHkq3I52ROk5q2jZXN4QVghHKTaWAb7SHgV9N1I5xs1KBRmtuBkJGoxVMNe0reBR/jS9QMwqAY6guhSoISjk/JgwJfD6fkJgtGv6rhkRdu2N4mKgVhktfS8DrFVUbXh2sOBI7axlxgHaKHGs1sUNFQf/NyFnHK3ig3qBmpSuC5lpDNnJ3F5cNKaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZC5tdkRZa5dqAhFi+9c9O1aUidCiCSsmdtlc2c+2LQk=;
 b=ZhGi/4bVg+Upg5bc8Ty3oHHkjWTXNGTOvSN/qPFXNSi2t6nAuslux9oKnpYw+DyM1cPOyUrXxGKJZaqj/iFX0gMo4QusmpWHSGdtoV9uxvPuD/dcZLQiwRQc0MC24wOYwFgUas8o/BnSCtMAwPmCP+J5l5c+Z8ZSMwqc71NHujRVkaqZZ85cY/qA0ys4bUnjTZV9O2YP0CVvdLCE7atxxpnuG5YvIbn/Jd7g94FMoRrRrpzr00crkQebM4RVE1+zlydofpF01+CDdKS2sIcKsw5wCbQVO7VaUXW9N5YVbo15v1b5LEUGZuKRIhFIm7yzTEU+BvCJJyc+f7HzTnu47Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by DM4PR11MB6264.namprd11.prod.outlook.com (2603:10b6:8:a5::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8422.18; Wed, 12 Feb 2025 20:59:27 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 20:59:27 +0000
Date: Wed, 12 Feb 2025 15:59:23 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Imre Deak <imre.deak@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/display: Remove hpd cancel work sync from runtime
 pm path
Message-ID: <Z60Lq35w1VdqXkCt@intel.com>
References: <20250212192447.402715-1-rodrigo.vivi@intel.com>
 <Z60FjqU7JDotstyg@ideak-desk.fi.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Z60FjqU7JDotstyg@ideak-desk.fi.intel.com>
X-ClientProxiedBy: MW3PR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:303:2b::16) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|DM4PR11MB6264:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fa4f698-835d-465e-90b9-08dd4ba822f8
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VMSGR5B96kEDAu2dC1jAWHS3tsWh/vRpBrP2fCVjrgTm9MhErlJyQJEHWkb9?=
 =?us-ascii?Q?M+Gngo+rpEv8NEYHcdhCnRvtv1k/tWcP4UO334hkGzWhL7BYBg/CM3XOWVf5?=
 =?us-ascii?Q?5fj5KYL45jN+C8PM1QEMmFGMUoRPQgGhas6UwK4F/KsaKYPfnFLHhW9W6xrg?=
 =?us-ascii?Q?pIq2HKIq5E88CpEfndAHnTc9E1QqhfmfiMp+DufyB53TJ7eFyo/t74OuN+U2?=
 =?us-ascii?Q?duV84Agxw++bypLlwd8vj6mgbjbfRDTYHL7oyy1jWeU0ohGV25jDtPhJlFfo?=
 =?us-ascii?Q?1CMvBZkVLERVGLgAnuQ1/v9su0JYpwjeuQVYqRqK4fu+XAp3NxAhHDgM8R5h?=
 =?us-ascii?Q?hO9kWecVZ9n6tDNy7p+CL8fnzlf+dN16tsQp0BlOlqL3eqAfASMvZz5yfrh3?=
 =?us-ascii?Q?9Stx8LzD8Xw4NgtB8UTbsIwIAez1GLlAcajd/vUR9lTCCq8H5QEtVAhV+QwD?=
 =?us-ascii?Q?xiynLcgjrk0+OGmvl7+fqZm/XqCv5lffwt38K+hZjUbG2MBdjVuKMeL2gT8T?=
 =?us-ascii?Q?KAs2Jty2FyVO+CR9EybmPMr0njSPnsQLC6T5fI4Yx2FlHTcewY0X+t8aR1Va?=
 =?us-ascii?Q?UFrSYfXFyLEjfylYTHDX3YvQc1G+d9g0lPtfOTiuo6SOYzxI+SQHhzF8p1ve?=
 =?us-ascii?Q?JbqadLyyOu1gAubcQsI7g5vcjgHxSh8p62Bt1AK/YEZSll60/qQDlgI8ZoXt?=
 =?us-ascii?Q?AkWMslbLAN3FEIkW3lv2PsztsUNTSuytdCriv1Pb9sCvJIwkfN61Qxl2ID4B?=
 =?us-ascii?Q?S6xd9CAh0es+AHEw7P0vB1nP53kOhQBhR/bQiHAocdKYp2BwehUhCpwWKy0a?=
 =?us-ascii?Q?frLijK8/ODMY0VvLXM8ZXjWVDASO60U2I8DTwy6nMBkAcmsKTPWBSG/DU4Zd?=
 =?us-ascii?Q?0wyWKOkGe6G2fnRXFUZASLeEL9zJutpkrqlPHxtjLn+QxDXhhRa2FDnIZcGU?=
 =?us-ascii?Q?1/R65hSLqIehYJNqjMK8vSn35s6nhQOQJvp9Ud++54zWd1a7mzLAltp/LRn0?=
 =?us-ascii?Q?cuN9vvTKBh5TtYnKBwrN8hlkoTstC6Q+sPXjZ7aPk/eiXejJYcPL1D6hR+tY?=
 =?us-ascii?Q?lPFe9ZBKXE3w44pHPIOlBD3wUFxqaWzFwxuoe8LLwpenoc8L4cAiB0x8gsCd?=
 =?us-ascii?Q?uYVBxks8oP3D1mJAoeuwpoYKO8futKlsYaJ0DpED6YP/x4PVbIKk8TZfp2Pz?=
 =?us-ascii?Q?4eF1zfFM3cvCWRFjQ+ciHe+GVAByblMvYc3ue3X+Mg3Mq6PDt8qS84PjPzU9?=
 =?us-ascii?Q?QJph1coutqRgNSMchtrhqyjHg6AnxrG01vukTgwyaCuDOAeQwyBGj21K1j2S?=
 =?us-ascii?Q?5s48SWFBxVSL4j+B6ZYyUULEqVK3YGN/N/DjCwlEb+cd5dlzu+CWMxeVG+5U?=
 =?us-ascii?Q?48Sa1rwrgSCavTJSKcCv+KG1VF8W?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HfJJh+MEq7h9GJ3ZS5OtGJ7fNFRad7t6DxsboUJlijs+iyHcDn+XZBKIdBFU?=
 =?us-ascii?Q?l90CsMIanwfbOMYGew9Q10PMEIrRVYBZQZWBljgNTXk9+3yFpF5roxBdeFyn?=
 =?us-ascii?Q?iOelh95q6r5G3KKEgevdFHafPuyCR98p+lyYUfeA3ukbWiToKYFMaFCUUPie?=
 =?us-ascii?Q?NkteW/065Vdhk9kkPqTGHhy5z2W6tMQmKJhIZYpRR6EXkgAVq0VmUeVGzZzp?=
 =?us-ascii?Q?5G6efNE6jQWgqFJI3Xmn7ff1QqVInjdgXJU3GWrmP6FPyWVfEVQc2cSax9rM?=
 =?us-ascii?Q?35MOMLSdfkb5Vs2gYhIUAbaWGBdeAa68AZXkXk3QiDCSm2ickbr4nonUna9h?=
 =?us-ascii?Q?JpU019ihamFCd269pui4h30KvODMzOBZRYoBQTrkXhltvZdQEbLKxwWETlqh?=
 =?us-ascii?Q?L8SbSowR1ZJ2M/agnVWauYfpnHXArHsIz9ifsL2Mzs8MMJffZOcegkITfV8C?=
 =?us-ascii?Q?pdtanHGrZTYWfTEvT8HYIQHzD0oRGpBTdzcz9nPjLO9rMBzczrji48M4674d?=
 =?us-ascii?Q?RAJM74MJTO0PdYL23nhjxTFTkBCNjPMIVflb0lDr0sAwK6FpmspCYU7Xn+o5?=
 =?us-ascii?Q?k2sr23HGc9Zh8cFkv4ii0eoRVDm4mmW245vVcdp/POjQk035XPbU8EOWLu64?=
 =?us-ascii?Q?3y88bmZs06JoyEXF42MNFOu1wcNlfkld1+ruvjnM57aUvrWrjGhq4ir3yn3k?=
 =?us-ascii?Q?3n35T8T4MV9tgySTC746hiPoqcvy/f6C9ZGgOBPLHVEXfQR3EGxXBr4oqR2A?=
 =?us-ascii?Q?MnhRU43MNUYn5JVz08szzqEVHDT1xbRLmIpMIczGT18CKsFiz/6nQR+XOAv5?=
 =?us-ascii?Q?XtHDFCzwkRtr5dkHUai/510YuY7woueLpyQ9738MCekOkTDVzDKXNtEmg/yY?=
 =?us-ascii?Q?QO9vElTz5d13AlF3xn/SlNdV307IXl3GNciZLNpYE+vLU7O1p85CyhHV0gxR?=
 =?us-ascii?Q?jCMgRsX8DmRHEowfHYNGdLtJKe8Z9kqRmoEyeb3CYcj+VwBcq5uFzDfYSxRP?=
 =?us-ascii?Q?eI8O8cubffcod7+Bmr/X6jdqARtikbR739GUlTBQejGE3ZaT8RQMuX7/wJLr?=
 =?us-ascii?Q?eSThWybZ8cMRYKMm8+QND+bYSToD64ZFu33Ok5tw8RnsrBB9OGL0E0nLWsOX?=
 =?us-ascii?Q?xhuYdTYoYqo0XdtNbutTq4WIAn1+9XK0aOTAUi1/0Bl3EutNwk1NmdhtNmKh?=
 =?us-ascii?Q?QxTpVXtNvNEAuQyZ6FclfdymKHZGwvwDjWMTZoo7N3K+3pbd4Kg7t7aud6Qi?=
 =?us-ascii?Q?p9EG9FIc3zZF37cRpmqKIVtgk1BAEpWAznTGS8ucgSDpTStVag5VAMuZUVeL?=
 =?us-ascii?Q?yDqnBf07nxES+MNIO9PUK/dJ4FOT8740yeqDJQsTe76nQ3omZ4PCxzJWgPtL?=
 =?us-ascii?Q?KOSWSbnIyuE6FPv3BoW47K3Odcfb0u6gXSU9pY4jVhbuxhpE4ZTQJawEofLJ?=
 =?us-ascii?Q?D7rSBv8+dGmL/O9oCltkHx/wv9rICTubH990HFQjVmca+NCTQS+7ogbBTwNS?=
 =?us-ascii?Q?BZy1WdoUqkkB5Kz3id378P4YCr38Js+Za1jgB4zETKIkQSnMW6JYZaZwcwPj?=
 =?us-ascii?Q?qEJvYlc18DyQeDIy7PrkRMocf6EFhEodasaTZ2XAAspkUb1Z1NakvML6NwU7?=
 =?us-ascii?Q?jg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fa4f698-835d-465e-90b9-08dd4ba822f8
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 20:59:27.2287 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /OCqERJ9lNrTP5VtH2kDOKL8jFgyf9MPaBOeZZzsWP6NzWvPgmPAOAimoyF/T3h8xW5vvhj2oDi7EzIEQiiFdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6264
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

On Wed, Feb 12, 2025 at 10:33:18PM +0200, Imre Deak wrote:
> On Wed, Feb 12, 2025 at 02:24:47PM -0500, Rodrigo Vivi wrote:
> > This function will synchronously cancel and wait for many display
> > work queue items, which might try to take the runtime pm reference
> > causing a bad deadlock. So, remove it from the runtime_pm suspend patch.
> > 
> > Reported-by: Imre Deak <imre.deak@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> Makes sense, since instead of trying to cancel a pending a work from
> here, the work should instead wake up the device if needed via RPM get:
> 
> Reviewed-by: Imre Deak <imre.deak@intel.com>
> 
> See some notes below.
> 
> > ---
> >  drivers/gpu/drm/xe/display/xe_display.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
> > index 651799c946ac..f0f427689a56 100644
> > --- a/drivers/gpu/drm/xe/display/xe_display.c
> > +++ b/drivers/gpu/drm/xe/display/xe_display.c
> > @@ -311,7 +311,8 @@ static void __xe_display_pm_suspend(struct xe_device *xe, bool runtime)
> >  
> >  	xe_display_flush_cleanup_work(xe);
> >  
> > -	intel_hpd_cancel_work(xe);
> > +	if (!runtime)
> > +		intel_hpd_cancel_work(xe);
> 
> Could be moved to the block below.

my next step is to split this into 2 different functions
getting rid of this runtime bool.

> 
> AFAICS it's still in the wrong spot for system suspend, as in
> xe_pm_suspend() the above function will be called before
> xe_irq_suspend(), so a new interrupt/work could be scheduled
> here right after intel_hpd_cancel_work(). But that's a separate issue.

hmm indeed... I will take care of that while working on
this reconciliation with i915 order...

Thank you so much

> 
> >  
> >  	if (!runtime && has_display(xe)) {
> >  		intel_display_driver_suspend_access(display);
> > -- 
> > 2.48.1
> > 
