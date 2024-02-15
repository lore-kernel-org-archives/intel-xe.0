Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05567C48BC4
	for <intel-xe@archiver.kernel.org>; Thu, 15 Feb 2024 22:19:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BF4D10E3C1;
	Thu, 15 Feb 2024 22:19:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L9GirexU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B30B10E8BA
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Feb 2024 22:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708035555; x=1739571555;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0VHRJkpQ2kjV5Rzuz5klbLem2Oiz7AEJ/gNohdlEX30=;
 b=L9GirexUJU0oEvS4btjseoX8Y0N/SfRAMkz6ERSYDVveQt0uQ5U7RRb0
 0UcXOdu3Pt28kniPQ13Uo1/tPyV7vqrmaySBpA+DCXtbUUxKjUFxSXqR9
 FbYSwy0WEatcIklcaFFuz9i+Nf9uO12Q9ZFT3Ubk8ZOsOwre3Wa5/t69S
 zP+HhKDs/+zNYGusHZCZZcRZ1akGa6JwDq+okxNJHH0BEMmhaTJwzL5zx
 Q0OQwBsrdI75mK8+rcnmX7MnGYI1tS3jpA6XlEZYMUe60JP2OkUDa1tfk
 WC657FwAQWtr2PMk45/X30tkQcDCUst8Cu00onD/6YQAP4ykCdjV2dLCb g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="2272365"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="2272365"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 14:19:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="3688064"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Feb 2024 14:19:11 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 15 Feb 2024 14:19:11 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 15 Feb 2024 14:19:11 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 15 Feb 2024 14:19:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=djVvcQww3B9y0XGrhlapBGxzwqSOllP1aNmg3xVPCY2c6uV+1elJIj40nkG2BG6D4z4jgG9jlXIkwpFnMqonETIKCq7+HEKBR3f8Jg843sxnaFe9v8H/nbQnAF2mJfOMRwDyzMNjy8rON/Z038P5NUwIgloYgsmByQJBROI4h804tVjNwQ5awtQAERqfX6Sk5UxowsiBxe3JSOXS7SVtUISnJtlYMaFA56a14lkRdlTqpqCkeNaC2AM/qbmjac7vTtrf9cLZq5kwxmwrxIFF+720WG/WxTJB1G29E+6Q8k2RbHVD7UU0PIeOYmteVfj6QONskg3UrhkX83zFD+bo3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RKT6ep1SarQIVDdAdV+CkECrAFbUk9Shbj5UhvBwyL8=;
 b=l5o5VZ7wYLSE2yfzLOTwQsDcuk2l8j6WK5saMa6FRBxq+IYvDWEqhbuhCIvtZiOOT174U18v463noMyiWD+r2XrTXJ+1RzFHoDo12RKwHNenOCdbcPuIwVmIAcVq9Lluh2waYyASd8I4X31Ml/OMQqjdtPRAsNo+9/m65sc7GVzqdKyzykeL67h6/kZFcOwRSVUxFXFCmqEOfuP79Ir3lRfGbDNBtsAtBN1kIBwohOhn7caufrklR/5jkZR4kHwepxC5c0AQWeb2lssR0BbxzRxsxyLheoUI+VHZ1ieS41H5s7viJu0x525ytfRqbXJV9DJABrPayvwtDcDdIBFb+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CYYPR11MB8386.namprd11.prod.outlook.com (2603:10b6:930:bf::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.31; Thu, 15 Feb
 2024 22:19:08 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7270.036; Thu, 15 Feb 2024
 22:19:08 +0000
Date: Thu, 15 Feb 2024 17:19:05 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [RFC 03/34] drm/xe: Fix display runtime_pm handling
Message-ID: <Zc6N2bnHTAcjE948@intel.com>
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
 <20240126203044.1104705-4-rodrigo.vivi@intel.com>
 <ae9804f0-8188-4cb4-b4e5-c50a1a5101d6@intel.com>
 <Zc0A1fSxFFtJ0uVk@intel.com>
 <ab5ab5d3-a04f-4451-a1da-1ed0e5330557@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ab5ab5d3-a04f-4451-a1da-1ed0e5330557@intel.com>
X-ClientProxiedBy: BY5PR17CA0071.namprd17.prod.outlook.com
 (2603:10b6:a03:167::48) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CYYPR11MB8386:EE_
X-MS-Office365-Filtering-Correlation-Id: fb678d40-aad6-44b1-7245-08dc2e7420fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zJwg9UQBJD9VclGB2A1HaEudD+/xA69Bbrc8nJYa7be+/CD/VcwDY11pRPyQKSqIISoxVjiE0oOeAWeBi66yjhhtiYpn3/oIR29ZOJq5kV4DmiQ6q60X19pCkLhewZTQE4XaWqiV++vmwBfLjjoFwfDwNfLGx8hD/i4ZLkLgGOQneshLdHA3/u8zilnn3FFDoh7hB5DonW2oygktgDSF5CB1q3fmsTTwfWizfzF559bAnMo2WVL03UbO+hnD1SrxUX4k0KOpAeSVOcNx3rEj0FL+JkfBdE7y8Cp62Qb4bzeqqANcjvS3Q7PCQR7WGHXKGBjfnqpnY+DaYM4nM7QphIagj79R0OhCTOwvRtp1bzTsttepcBxC2kM/sthESMd9pmOofjszrYTD3xyN0SBSU+9yZydu4/VGzTko+H9T1hAXgL1sgsYlfvU4Uqu0wjZtW6Yj5g0aeyXRbv54iKAn8tR+8m2znJitkdloBIiv7Os61++a9i8nLdoBeNtIgf6/cGqWbhMhhDVN2HSKcPkvsiGHCpMqLvH1r3XHgVTC2pL+47vuRPFNs3GVwXO+2cNu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(39860400002)(136003)(376002)(396003)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(83380400001)(38100700002)(66946007)(66556008)(66476007)(8936002)(4326008)(8676002)(6862004)(82960400001)(2906002)(5660300002)(44832011)(26005)(2616005)(6506007)(6666004)(41300700001)(316002)(53546011)(37006003)(478600001)(6486002)(6512007)(6636002)(86362001)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VMpISN8331jCOY+dfQCqhQj0HG90oNJ/JkJrGWiYKghJF5y3rWu3no+9ytrD?=
 =?us-ascii?Q?UWtL6EduuM2hHVMZvzf4Fb/QWSnKW65v++/pGCebAUEfjeO4neV0tJ9oyhTr?=
 =?us-ascii?Q?rg1DZL3J5VciQb1MfxocYVJ1y4S7IQOTyp1sGWE8Nwjd0BlpYOM1yr7MceSw?=
 =?us-ascii?Q?pxn+4u5bU3npFJuGywZUzjblXI14H0wRum79GFeYcMfC5wIVvSZez46nY1cA?=
 =?us-ascii?Q?FfTyB7AY7qOAp7GATUhUQuhJc20rUpKlPFJcjFSTl/4i3S8htObsGQq63plM?=
 =?us-ascii?Q?4/5EI/V8+LKzgoeiEczndajTf0snwHl8Re3x9rU9/+JgVXyEHlX+OOi2HRab?=
 =?us-ascii?Q?2YNqgfS8YR2quUKwbkECRxNO242trnqwLH7PAPVuXa4dUCEtrly4ipyfar2D?=
 =?us-ascii?Q?vspoBAsI3wH5ayConXyyAfFvrJEqpYsLEjXGdnI1vcx98cTXAuNkt7GnwxWw?=
 =?us-ascii?Q?VEV7aaB+PMWEJxdBKCPQpJZzOSjYUVoUvrq3tAHeDhNKPzp9G+ogL6Coz7Nm?=
 =?us-ascii?Q?V7A3GbiuAOt2hrsKc9BP2q//8IsNCAJYU/IlJXdW/KyL+vYHiSG+uX+aA+Iy?=
 =?us-ascii?Q?HO1jjgUgPMFtwQ2p8h2w/c9eAAv+EA+Xeq13QUE7pc7Y93vl3yi62yS/4xCF?=
 =?us-ascii?Q?SeegehX0YEpoq9yyLUSvqM8Zfea/a3C2OJNiQDj3b/isk8064tYgtDocI7wT?=
 =?us-ascii?Q?7/XdgAQ0NgnPR0oxVWhvS+qn0lq68zruu/UImGjH/5gYquJvUfFpHMFhvPUb?=
 =?us-ascii?Q?xYSxwewZATot2tduBc6zbmvzUX/Unml5CxWdx8K+G0t7pIX5cBHCJcbabJpd?=
 =?us-ascii?Q?IlRouWsSG/kSb7GKw33jsYjERnrWSMvZKwuExsU+yi7erN6Y6n/QbL4eDFIt?=
 =?us-ascii?Q?V8Al3EoYyvfAhK6myb0DzAJkzv9sqEOZDzEX/G23MSrWOYgASFCbc9skMImm?=
 =?us-ascii?Q?cWa/vkVP5wlPlvTQuM1X3B8lVl6JDKII+Aurxdubfc0tSIjf6zgvH6HhyGK7?=
 =?us-ascii?Q?hNrXlxRFS2Y/2ivUwJIOoH5s0OXya3/3toJJHrFuZ9NP4GSk2ObhCMFcgccZ?=
 =?us-ascii?Q?KN0YIWa265J7rMFB05fl+09VFUATroBq+8v5zdP7l8xSk4UMlpYhQ0Oq6huP?=
 =?us-ascii?Q?jOQrpBTcoOIQOq4/s33UpZt+1ehSP0nvSi9AwGmsAZU7r9ud4RtYWCLxVP6q?=
 =?us-ascii?Q?6woLU6LU98XOmp4IlVLDIqLwm+42DmjygI0SZ6axKr/ElSxQ5Ku+2kOzne55?=
 =?us-ascii?Q?sLLJ6jrTHdNJsFhds1APDVhjdWzT7s7vGj7OunbciKffeEX+GNDOXk0t/LOb?=
 =?us-ascii?Q?ypXPPkVOEKIEvSXlNJgFN6xUYV6lly2VTbrxdaz9DXTl1N+SFEPjC5zlbIv5?=
 =?us-ascii?Q?NUPLIGywEarJFYc7ioEdtQbTcKEQzcm/YEk0OnxUIgfjJtclPpAzXZag5kvK?=
 =?us-ascii?Q?9LxTFXpbTC02C58nRwobPYbHTFo/rxOFVDbHUL60czFiU+UuwbB3uQ6FoIgZ?=
 =?us-ascii?Q?D81uDpoHR8kXiJPBuLof9iW8E9wOJHtalK3L3dhYZ6/zi2udG5MedHaipGMY?=
 =?us-ascii?Q?/47M93hjC7iJF67XcfJNZvIbgi1KjYHBeatcttsEY5CObDIm/Izf7HGEVM9o?=
 =?us-ascii?Q?3Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fb678d40-aad6-44b1-7245-08dc2e7420fe
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2024 22:19:08.6777 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YHGZtuEEzgfWtxjsvFQfcBb4CbLsKGVc3raRgaxFXIeqsmZsfhLaZ5nqqI+g9Yx08D1XaHJeLXehzMnvxupojA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8386
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

On Thu, Feb 15, 2024 at 09:30:08AM +0000, Matthew Auld wrote:
> On 14/02/2024 18:05, Rodrigo Vivi wrote:
> > On Mon, Feb 05, 2024 at 09:11:37AM +0000, Matthew Auld wrote:
> > > On 26/01/2024 20:30, Rodrigo Vivi wrote:
> > > > i915's intel_runtime_pm_get_if_in_use actually calls the
> > > > pm_runtime_get_if_active() with ign_usage_count = false, but Xe
> > > > was erroneously calling it with true because of the mem_access cases.
> > >
> > > Good catch.
> > >
> > > > This can lead to unbalanced references.
> > >
> > > Is there an actual imbalance here though? Is it not just a case of being
> > > overzealous in keeping the device awake when it is not currently "in_use" vs
> > > "if_active"? If the api increments the usage count we will still decrement
> > > it later, regardless of active vs in-use, AFAICT.
> >
> > Indeed.
> >
> > s/This can lead to unbalanced references./This can lead to unnecessary
> > references getting hold here and device never getting into the runtime
> > suspended state./g
> >
> > >
> > > >
> > > > Let's use directly the 'if_in_use' function provided by linux/pm_runtime.
> > > >
> > > > Also, already start this new function protected from the runtime
> > > > recursion, since runtime_pm will need to call for display functions
> > > > for a proper D3Cold flow.
> > > >
> > > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > ---
> > > >    .../gpu/drm/xe/compat-i915-headers/i915_drv.h   |  2 +-
> > > >    drivers/gpu/drm/xe/xe_pm.c                      | 17 +++++++++++++++++
> > > >    drivers/gpu/drm/xe/xe_pm.h                      |  1 +
> > > >    3 files changed, 19 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> > > > index 420eba0e4be0..ad5864d1dd74 100644
> > > > --- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> > > > +++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> > > > @@ -177,7 +177,7 @@ static inline intel_wakeref_t intel_runtime_pm_get_if_in_use(struct xe_runtime_p
> > > >    {
> > > >    	struct xe_device *xe = container_of(pm, struct xe_device, runtime_pm);
> > > > -	return xe_pm_runtime_get_if_active(xe);
> > > > +	return xe_pm_runtime_get_if_in_use(xe);
> > > >    }
> > > >    static inline void intel_runtime_pm_put_unchecked(struct xe_runtime_pm *pm)
> > > > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > > > index bd35fe9f6227..19f88cb7715b 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pm.c
> > > > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > > > @@ -417,6 +417,23 @@ int xe_pm_runtime_get_if_active(struct xe_device *xe)
> > > >    	return pm_runtime_get_if_active(xe->drm.dev, true);
> > > >    }
> > > > +/**
> > > > + * xe_pm_runtime_get_if_in_use - Get a runtime_pm reference and resume if needed
> > > > + * @xe: xe device instance
> > > > + *
> > > > + * Returns: True if device is awake and the reference was taken, false otherwise.
> > > > + */
> > > > +bool xe_pm_runtime_get_if_in_use(struct xe_device *xe)
> > > > +{
> > > > +	if (xe_pm_read_callback_task(xe) == current) {
> > > > +		/* The device is awake, grab the ref and move on */
> > > > +		pm_runtime_get_noresume(xe->drm.dev);
> > > > +		return true;
> > > > +	}
> > > > +
> > > > +	return pm_runtime_get_if_in_use(xe->drm.dev) >= 0;
> > >
> > > This is doing atomic_inc_not_zero() underneath for the "in_use" case AFAICT.
> > > If the usage count is zero it doesn't increment it and returns 0. Does that
> > > not lead to an imbalance? Should this rather be > 0?
>
> ^^ did you see the comment here also?

oh, I had missed this comment, I'm sorry!
And good catch as well... maybe this will even solve some sporadic remaining underflow
that I was seeing...

but not just here but also in the if_active version as well.

doc for pm_runtime_get_if_active():
"
 * The caller is responsible for decrementing the runtime PM usage counter of
 * @dev after this function has returned a positive value for it.
"

Thanks a lot,
Rodrigo.

>
> > >
> > > > +}
> > > > +
> > > >    /**
> > > >     * xe_pm_assert_unbounded_bridge - Disable PM on unbounded pcie parent bridge
> > > >     * @xe: xe device instance
> > > > diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
> > > > index 64a97c6726a7..9d372cbf388b 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pm.h
> > > > +++ b/drivers/gpu/drm/xe/xe_pm.h
> > > > @@ -28,6 +28,7 @@ int xe_pm_runtime_resume(struct xe_device *xe);
> > > >    int xe_pm_runtime_get(struct xe_device *xe);
> > > >    int xe_pm_runtime_put(struct xe_device *xe);
> > > >    int xe_pm_runtime_get_if_active(struct xe_device *xe);
> > > > +bool xe_pm_runtime_get_if_in_use(struct xe_device *xe);
> > > >    void xe_pm_assert_unbounded_bridge(struct xe_device *xe);
> > > >    int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold);
> > > >    void xe_pm_d3cold_allowed_toggle(struct xe_device *xe);
