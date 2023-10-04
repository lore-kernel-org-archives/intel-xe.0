Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 627D2E7C4C6
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 14:42:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1677610E139;
	Wed,  4 Oct 2023 14:42:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C39310E153
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Oct 2023 14:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696430573; x=1727966573;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cttB85/L8fITEFzk0Ikw8kp8hlGzYuxlMm0f7VdvKO8=;
 b=Nim9oEu2CiK5AZ8K6eQXvzlPN/yCrv5K/Ydxg6QklayY8CeXhs7Rt9b9
 PtB4guZ7MoHN0koHxB3Sl+eY1nRxsKmNLqiVhy+Rs4c7QK8rzDUsISGMI
 qV8Ezegrsq37vJQfwVX2E47Uk2q0tGXwMXn7mUWT5VCwuNZuvk9fuDwU6
 jehXVNKkith85huT6ceTmiEBJdDu1VgT8irIijW2685vkLhDIwHJ1qcZC
 q0pJq6bTHRX4ZtAzrJKqVPF0mgLwx00w2mTbTXDPrTbaA5LTdw8amFo0B
 UxWKCX7rAf/s48vme+cls5niOHZdnrSBvasSJVHx4Q4omxP86K33OlVIl g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="386011591"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="386011591"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 07:41:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="998487349"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="998487349"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 07:41:25 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 07:41:25 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 07:41:24 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 07:41:24 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 07:41:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q4rk/F6X1P7TCf9cGSFpwzOUwTivk3sc3F898v6UU3L+XF6aqmd4iirok/zPlZN4yQZlczOH1Mk1KrgYPRqUFzIemEy+vMIgQLm93RvQOFMxS8k5nWYd3SJjfJBsHWlXNr+kGSNgbAi6QJ+1k0zo0Pc+kTSQwICnCVGBibt1pNvZQvTw5jbvJ0zTsrOIEzQnF2W89ggdZhSR1I6qI89Rtd2EVADL/ZqcznucUHjGzdpZ3cVWaCHNJCD+tFiAPCMsXuVeir5nTTTZaT5PJuSE4YGOhUDE7VEJ6YGYoDVzqUA/1G7wy2BmmFrIAFHuzDURQoENZqYTrQz4NxMqGjK8eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qewsAVbVD20u/NdPCYpOCPWtr4Rlqi8HAlrcwiZH5oY=;
 b=KXYMak2LXKdiSQ9/lzQyDovGxhqGRdah7YHhcFETlZyZ42N+vhGy0cMWii6xwZL7Vibyy10CxcPR/CXLz13ZaFZzxyWXQyAFfZQ5XCGTNX35YkvSwOhd70Vrdjtzdwn2YdzmOXqoRiQtu3TGKQQq2ExYKGmKvT6hYZE2x1D+2uet0k98+Q6l1zG09nXEFUbB104AlSoAQo5araPFR7sPYrdNJGcVB+iccQinDwTrfZ1WXq7FS8DjXVx8zkrTwS9EqlYP7bvr6KIhSmKK53GLQtYcjG9LiUVL4MDaKepbOi68Aw3+sgPDQ4+mRzrz5vXkK09VS0pYZgWCmbeh6Imh6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB5390.namprd11.prod.outlook.com (2603:10b6:5:395::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Wed, 4 Oct
 2023 14:41:22 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6838.029; Wed, 4 Oct 2023
 14:41:21 +0000
Date: Wed, 4 Oct 2023 10:41:16 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <ZR15jDyjzZrryFrL@intel.com>
References: <cover.1696343521.git.jani.nikula@intel.com>
 <70a0652ffedbfa33e36b0b2eea4a0aad5bc378da.1696343521.git.jani.nikula@intel.com>
 <ZR1wY+2IKMC6r75M@intel.com> <87ttr6eab1.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87ttr6eab1.fsf@intel.com>
X-ClientProxiedBy: SJ0PR03CA0263.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::28) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB5390:EE_
X-MS-Office365-Filtering-Correlation-Id: a52bad92-efe8-4a37-ca3c-08dbc4e7fa10
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VgIYrk4z1yjHPAUythYTiGCh3C4vk6HNLms2YZCpIC5PdzeIDNq4nVs+cV6eiFdzXsVkZJcs4P3aY7eT7JXfQL8HkXywYZm94yRA+qpMHqx+tkYS52L+5ewnYrwYfKy/fl7ZAtRwHAaS2Xg7VXJ7kbr4O06GEX7LGoQTaZvrbAMVQZ9rNzGNDVuFTSeGGAPs7a0SL96Q1WlszMk1hhQ6fSLSjXCPgVBGPq9+lEziRtZf+EcFjXVUkhW8Oas/VxoPcFOoigycLMLNzBgOXR3v6otlrrdnyb7Yrnu/3ntOZiW2Hm+/DQSPfHMbiRHRfdPQKvn/i75xvafeRUBWOz1xwWtQRY18Tdg8g1Zkgj1t19335cwe3k0s7vFEaeDokJaqTfNd7gobv2DV79+tZIflbbG+gFsrPA1QcJ2UbMUOR7aGvxw6d2kGcQ7iIFqMGWiUPlikxMcIuI7La4XBtFFtdfaKo3ScVm9Mx5ezFmrFy9/bKpiQ+rC0dAIPfEqFQQ1OjsM5cGcTDa1j96TQP99H4jm8hSW5qeA0DyP3qzhHyrhWKo7u4iY7JB/HLzpBzNBV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(136003)(39860400002)(396003)(366004)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(41300700001)(6486002)(2616005)(316002)(6506007)(66556008)(6512007)(6636002)(37006003)(66476007)(66946007)(44832011)(8676002)(6862004)(8936002)(4326008)(26005)(5660300002)(6666004)(478600001)(2906002)(83380400001)(36756003)(82960400001)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8qydVPZXwhMZJl2VySqJRCvSbrjHOcBIF4YchgIe0wvM/KGlgbygFam/+MIy?=
 =?us-ascii?Q?ZKpZ6pUkm859+TXd46FxtzUYU3CIZ3/j9CyWMor8P9bjN+EramAGqWrwnKK+?=
 =?us-ascii?Q?9O+4WUMHCvQ/Mbm2dLh8yohHtVDtMH5wFdYnSku+XgHFkFj+5o+6dwmsBPt5?=
 =?us-ascii?Q?Uywgfu8bfjeNW1DnWACQ/HZZVtfakOdqQCVoi23iqLL+jtK08rotgI7j8E8R?=
 =?us-ascii?Q?RDfc1SgsTcgajp2U44u2GuYmV1rhu9StXrjQGt4Jqj/5XbZJPOIRwdvoKP6q?=
 =?us-ascii?Q?006zqND6fpEkmF2XHM1LcDjJ7cMfgOiGs6CIAVPc10/yFz46aJq9CIaXoGgU?=
 =?us-ascii?Q?lqUNBzeL00Bf4bY+K6y/iXuuG/xvrs9F7a4EdPM5cWoPJWd1mKvfcg5u+FVT?=
 =?us-ascii?Q?chiIdS0C4QnkpMS1qWJVLze1dMehMX47AiYXsxW+9QYtybcp1CntQu6AaYDQ?=
 =?us-ascii?Q?RF+ZhRMkDX5FogPPkFXgVJRHHOeCor6E/pefzW4nkatyQpIEyZ7jQakwhST6?=
 =?us-ascii?Q?/Kv9d6JQnvpLvy2tM0Tn3rO8IgtWyCDFq/TGPta1tiB/d0MjFOWXr5KwMVHB?=
 =?us-ascii?Q?kavD2/f99hV8ALW5L+BWTInlVi/J4oxPMTAa8ilaXkwz5ViDG6j/brlhdNUr?=
 =?us-ascii?Q?vwywcnnfT/bvnfttgiwBU1bnNdTphXwOQ8yoQvsOvRFy+4Ohdni5Hl44KTJZ?=
 =?us-ascii?Q?nh5hCGNayakzh+jq+/ZsE9y2cLvrlz70Q3GvUwd9cRYTidCFtGQLHusU6hvz?=
 =?us-ascii?Q?PM0LorV5aiDC86aatS8KuxAxhoxuv+N4N3WBv/6l77qqPQJK6NXHWIPmBu02?=
 =?us-ascii?Q?GGIA3B7wotB2Ae3V/Eep5VqJQXDRzHUPWaUlE6vFz62TV4Pt9UfhAM/hTKLK?=
 =?us-ascii?Q?ut2quiXr12tPpWw8FVquQ83YeJCvLo0VWUmfNtQLXOy666nbt7e0Vcwptpty?=
 =?us-ascii?Q?Z8MxYfv82eimb9F8YzEIKXISN23W+3VKcP4PlfQgf2cvCmby6um5G8CmzxMC?=
 =?us-ascii?Q?JaxbtruvOg70n7Jp4h2YZ9KMyRu4Olo7cEN9ImSwU2H90vSU6hGAfv9ZVHGz?=
 =?us-ascii?Q?J7xiwNuSqGBQvQlIQnf0GeTKmfwfd1cPoaYWYEw9zoj35QBfE/PutTMyfQvu?=
 =?us-ascii?Q?xG3g+rPoIxaK8uBh6kNEJc5fswlKNYNwTb5sgWwNqW6c67WkE66yQKpixsJR?=
 =?us-ascii?Q?AOVI4tN78iLw57aALrTKqHhZ/qzqoKWJNNQncyICXV2oSMOBQIeq5/85yBit?=
 =?us-ascii?Q?8l0yWU0sCvdU/CoWp/BaZy7Z5RSfD2cK1JVDIAND6iW/HES57j/0tjqr8Jrz?=
 =?us-ascii?Q?Kx/VM03eaFTsFGBO8uVjTsOg9HaObmClwDaRDDcufOgqw3s1yJaAUBgbGWtj?=
 =?us-ascii?Q?lZKwg4dFprM3Nee9rQmrOcRHBtAI7Z4fEMyu0RVS5oIvk+G4XCzZQYxTzryc?=
 =?us-ascii?Q?OU8F2oGRB/Yp8fUvqTw8UaEXxvFgmplcANcensWYFd/89pi/oZUtuRCAOQIZ?=
 =?us-ascii?Q?WZ7jB9lPYemlhFzUFXUgeZZhV8nzSmi3BlQBKbMN9acGp7g29ArbuAmJnVQO?=
 =?us-ascii?Q?F9cMw5lN/fjrKH30LfTljoy3fFMtF1Q/gNUYz/WAN6+Ll8r+cAoTWs94l0Gd?=
 =?us-ascii?Q?yg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a52bad92-efe8-4a37-ca3c-08dbc4e7fa10
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 14:41:21.7386 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6psC16/ztmA0NxzG3E3e856onnF03zuDzrs0ZEQ7k33AA3sdfh6P2AsHt0KcWSo1tTmAapLxkB4PgP6R+O1Dog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5390
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 01/10] fixup! drm/xe/display: Implement
 display support
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
Cc: lucas.demarchi@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Oct 04, 2023 at 05:23:14PM +0300, Jani Nikula wrote:
> On Wed, 04 Oct 2023, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> > On Tue, Oct 03, 2023 at 05:34:48PM +0300, Jani Nikula wrote:
> >> We have an abstraction for "has display", and it's
> >> HAS_DISPLAY(). Unfortunately, it requires access to
> >> DISPLAY_RUNTIME_INFO(), so include compat-i915-headers/i915_drv.h too,
> >> although it's a bit meh.
> >> 
> >> Looking at this makes me think there's a bunch of confusion in:
> >> 
> >> - the pipe_mask or now HAS_DISPLAY() checks
> >> - the global enable_display checks
> >> - the xe->info.enable_display checks
> >> - redefinition of INTEL_DISPLAY_ENABLED()
> >> 
> >> I really don't understand this, but it all looks very suspicious. This
> >> change leaves all that in place, unmodified.
> >> 
> >> v2: define local has_display() to make this a bit cleaner
> >> 
> >> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> >> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/xe_display.c | 16 +++++++++++-----
> >>  1 file changed, 11 insertions(+), 5 deletions(-)
> >> 
> >> diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
> >> index 07898e0e175e..68729997e1fe 100644
> >> --- a/drivers/gpu/drm/xe/xe_display.c
> >> +++ b/drivers/gpu/drm/xe/xe_display.c
> >> @@ -15,6 +15,7 @@
> >>  #include <drm/xe_drm.h>
> >>  
> >>  #include "soc/intel_dram.h"
> >> +#include "i915_drv.h"		/* FIXME: HAS_DISPLAY() depends on this */
> >
> > should we then add a FIXME tag to the commit subject as well?
> > just to ensure we don't miss this here?
> >
> >>  #include "intel_acpi.h"
> >>  #include "intel_audio.h"
> >>  #include "intel_bw.h"
> >> @@ -32,6 +33,11 @@
> >>  
> >>  /* Xe device functions */
> >>  
> >> +static bool has_display(struct xe_device *xe)
> >> +{
> >> +	return HAS_DISPLAY(xe);
> >> +}
> >> +
> >>  /**
> >>   * xe_display_driver_probe_defer - Detect if we need to wait for other drivers
> >>   *				   early on
> >> @@ -316,7 +322,7 @@ static void intel_suspend_encoders(struct xe_device *xe)
> >>  	struct drm_device *dev = &xe->drm;
> >>  	struct intel_encoder *encoder;
> >>  
> >> -	if (xe->info.display_runtime.pipe_mask)
> >> +	if (has_display(xe))
> >>  		return;
> >>  
> >>  	drm_modeset_lock_all(dev);
> >> @@ -346,7 +352,7 @@ void xe_display_pm_suspend(struct xe_device *xe)
> >>  	 * properly.
> >>  	 */
> >>  	intel_power_domains_disable(xe);
> >> -	if (xe->info.display_runtime.pipe_mask)
> >> +	if (has_display(xe))
> >>  		drm_kms_helper_poll_disable(&xe->drm);
> >>  
> >>  	intel_display_driver_suspend(xe);
> >> @@ -392,7 +398,7 @@ void xe_display_pm_resume(struct xe_device *xe)
> >>  
> >>  	intel_dmc_resume(xe);
> >>  
> >> -	if (xe->info.display_runtime.pipe_mask)
> >> +	if (has_display(xe))
> >>  		drm_mode_config_reset(&xe->drm);
> >>  
> >>  	intel_display_driver_init_hw(xe);
> >> @@ -403,7 +409,7 @@ void xe_display_pm_resume(struct xe_device *xe)
> >>  	intel_display_driver_resume(xe);
> >>  
> >>  	intel_hpd_poll_disable(xe);
> >> -	if (xe->info.display_runtime.pipe_mask)
> >> +	if (has_display(xe))
> >>  		drm_kms_helper_poll_enable(&xe->drm);
> >>  
> >>  	intel_opregion_resume(xe);
> >> @@ -424,7 +430,7 @@ void xe_display_probe(struct xe_device *xe)
> >>  
> >>  	intel_display_device_probe(xe);
> >>  
> >> -	if (xe->info.display_runtime.pipe_mask)
> >> +	if (has_display(xe))
> >
> > my first reaction to this probe function when I bump into it during
> > rebase is that it should be simply refactor to something like
> >
> >
> > xe_display_probe()
> > {
> > 	if(!xe->info.enable_display)
> > 		return;
> >
> > 	intel_display_device_probe(xe);
> > }
> >
> > but then I put the pipe_mask check and the goto back to avoid
> > disruption, but without clearly understanding on why we have
> > that to start with.
> >
> > My thoughts was on maybe it was a redundant check to see if
> > display init setup went well, but now I see it was more about
> > has_display...
> >
> > But now I wonder if we cannot simply use the HAS_DISPLAY()
> > directly in the first line of this function and avoid everything
> > else?
> 
> The display probe may end up detecting there's no display
> i.e. HAS_DISPLAY() may change depending on probe. And if there's no
> display, you need to drop DRIVER_MODESET and DRIVER_ATOMIC from
> driver_features.
> 
> Or are you suggesting to use HAS_DISPLAY() directly instead of the
> has_display() wrapper I cooked up?

this was my thought, but I confess I didn't think deep about the
implications above.

Feel free to go with this as is.

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> 
> BR,
> Jani.
> 
> 
> 
> >
> >>  		return;
> >>  
> >>  no_display:
> >> -- 
> >> 2.39.2
> >> 
> 
> -- 
> Jani Nikula, Intel
