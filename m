Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3548EC77B7A
	for <intel-xe@archiver.kernel.org>; Thu,  1 Jun 2023 15:28:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA39410E08B;
	Thu,  1 Jun 2023 15:28:21 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20C7710E08B
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 15:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685633300; x=1717169300;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=UXw6jRrEqAxfYEKblVzcJLAtq6SBJBW60NZVAByUbBo=;
 b=g6z8jBUaDVI91FSn9R9mhNY2X5Zv7d+OeGWqdE0qQc3/a9XWrmBilBL2
 tVUkpuu8es5tbTaJ1WfazJLbigU9t42ttZumHb18mFpp6XmPy9Kl/wIKY
 7ezEb45C55hl9v3cRVqRIg5eLw6XUq1KEmBwNjQF3xrKhIMLhtD2U9hR5
 GAiL8x3NICOSZAM9+Eoq/UC73O9pJxNJR4FtcjLmuACbpoQ/ucvIcCPSc
 ryWbqRqbwHEGgOHY5V0y7+BHNhQIV4zKjjODRSRtrhMe4yDPnUqJRPClZ
 2b2fkw/lXhI5ik0y5lQcQ7atKTFXWCpnMYBj98QIGvskBlRv4brAss40G g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="383863381"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="383863381"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 08:28:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="819861103"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="819861103"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP; 01 Jun 2023 08:28:19 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 1 Jun 2023 08:28:18 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 1 Jun 2023 08:28:18 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 1 Jun 2023 08:28:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nScvH6eBezu8twbqnCw2aqIf+yd7xAMHEseTnH4TSIH2Wec+l03Nje2lTWvntE5Pnt/yuRNpio7Bs4qM4dmyUoqJ+EyjWSqjm5CuewEIRu9qC4M9EJ4If8Ga82OrIBSBf7ik1WQ5W0bUwpQqirr5r+6l8wFzpejPgbmHN9BIC7TRtURKd2QGuu3mxxxI1y5zrjuirtRpyMjOwcf5Up+92AMML6KnMnYhhVbNxOIiAiaG2uP4Mms8iPL07lSKp7r25VdRFli8TqD0iabskoaB9BxdJErQK2yYSkEorXEV/uBdfbheNHY8hK4dIfIwkK/MgaWxcvKjH4Gsro2jepgc6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9VwKmd2w0DLfO7iieSLOUpHNNS1fnA28wH8Ndvk+4MU=;
 b=IYNeD88RzF/MPCY68kc4XqnF65zvKX3YlO7vxcGwJ+12LgE1U9Gc1FmToz13OHxeUdTMwNXkYUnXbPdRKfjFuMhnuvjbU0IWklb7OY7vNQl2JK7Ahy68hifFyyt0XEJtO0qYhFTo+yxXvq+a36bgbyzP0/erGPuMjxfA/5e+hAt2kcaWaogiCvZPIW38OfJTqjlSjR+FcwB4sM4vsSOnvfaBFX95/TXjxRNGV64VUfLC+5LpkEbnmjVEzukDTJjER+o5H9/QNcfvrJTbPz67lIGFXNFPhUwvU0rDzFPhZ8BW4uHbQucT1/0J3uJsGfPXvLK0YFUcVamOrPyj/uX7Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DM4PR11MB7278.namprd11.prod.outlook.com (2603:10b6:8:10a::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.21; Thu, 1 Jun 2023 15:28:17 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%3]) with mapi id 15.20.6455.020; Thu, 1 Jun 2023
 15:28:16 +0000
Date: Thu, 1 Jun 2023 08:28:13 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Message-ID: <20230601152813.GG6953@mdroper-desk1.amr.corp.intel.com>
References: <20230529195607.74755-1-jose.souza@intel.com>
 <20230601150805.GF6953@mdroper-desk1.amr.corp.intel.com>
 <fba0676424c0dc94c3c8782274f26a62097d162c.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fba0676424c0dc94c3c8782274f26a62097d162c.camel@intel.com>
X-ClientProxiedBy: SJ0PR05CA0209.namprd05.prod.outlook.com
 (2603:10b6:a03:330::34) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DM4PR11MB7278:EE_
X-MS-Office365-Filtering-Correlation-Id: 008c8933-6286-4d2c-f4c0-08db62b4d1f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jJ1I7JExe44KMJaWUghsg5ojpv629plP+fAtiRyTAQWBRZq/EMtLP5dLdmmrkrJ/ibc2iF19HoseVa877d+UeM8cbrwUf/V9XR5fcAYkZzc736LgHFKOYqsc2ogNpLQSeR35LMExCIY4m0ivoixHSYj1iXQeiVk+S9TxFiHQyea5nezg7xtbEc6Y60sJZ3RrWeiOqOdR1r3Lfryf7Biua50LayCo1q1hstCqcFMRPDQ/yK1EB7uu7N0wGaM3xTDRUR0rKDnhSEt+zQ9QPeblvDrDWiH2qIC31TBM+YyaCIai4IoUPMilQXVTD8KZCZ7Ex9p2+5zMeyzOkuxKvmKpNGZdkrbqasRGtmh0eu/FavdAW7T7AO1AMMqzAokLZsIddce3v4imUZVTvtuEhCSc7wDXE++FZinF2lsbvOOOq+mGPaYVJKmJCrTJLfnUFh1ieZU7vN6797VXHr4nrsmSQoMBXvO7eEn/ZkHAMWGSsRrj3IasvDbH7+DifxINCdit4SHp5PX1ZwMNJBYBzG0/oUw1n9QLSxSAHWmDcacwLOVDY0nIrHVyUS2GfQR19uLZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(39860400002)(346002)(396003)(366004)(376002)(451199021)(4326008)(6636002)(38100700002)(66946007)(66476007)(33656002)(66556008)(2906002)(186003)(41300700001)(478600001)(316002)(8676002)(5660300002)(8936002)(6862004)(6666004)(86362001)(6486002)(83380400001)(6506007)(82960400001)(1076003)(6512007)(26005)(66574015);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?nMq4AAHs9PfLiDMzt4YGmAThO6Bjd14FRCP6NgG7CLSyJHYGb0C24cW4h0?=
 =?iso-8859-1?Q?pX2YYcfD0iyTRI0w2HVdYvljHzCP9d9l9hAwVYbQp3KSoOWLdZDuaa8hES?=
 =?iso-8859-1?Q?habHc8sGez6QxbN1wzhT+ZF1qtkR6NotVTA25YFeBJHTEZ8Bnp7GU2jtw8?=
 =?iso-8859-1?Q?yWz6zIDVOO+jFTHYMUvVV2rRedfF/V2ZeQJveQF8e44eyFzpPeai7Rlyno?=
 =?iso-8859-1?Q?B4YFPq4tH6Ll5ArUwkvdCaHMEvFV5GxwZ64+1eFSISs9FYLRjjr10Mr+MM?=
 =?iso-8859-1?Q?GweGxVVXk/0yzTQQVIrgqwp3LJmQHwnukORWg5xbY4rEijW5twU/cbvONF?=
 =?iso-8859-1?Q?f/BQYk1xJix3u5YVMIdwHY9tyVW58JpV1aqVkCzIOl+g47TMDd3Lt8qoUF?=
 =?iso-8859-1?Q?Ia8YGtSE88pI3AOssajOP/PTP9CZfbboD4lpGMo+7QLUfTO+vwXSierI9u?=
 =?iso-8859-1?Q?Q5r4K+iVwfwEtX6yGGY2XWIxWQo/tXDmJa/s4Hd9TF5IeTC5+ynIyruOIA?=
 =?iso-8859-1?Q?XX+WOwMwgOfH9unN73DI+ulAQi8bw+ylsSN1K76V4fTYT8AReOO6VjBU3u?=
 =?iso-8859-1?Q?FHRdvp3mJOXJxR5T4RlAdAllSHcVRqCpI6dHz547TcpUX4B0M8DggqyV2P?=
 =?iso-8859-1?Q?uh1Kbwxu5p3WElj7/9q3j50A0fNudZmE3pz+eh+ng1wXSV5VA7DgqWgT77?=
 =?iso-8859-1?Q?RCjPAZ8uj5RJS4444zLqGJM5lAiVa27/8eoHytfFB18qR2NAgJ6E6GnM9s?=
 =?iso-8859-1?Q?BvS/0iP0CYpoQhsrKjad9BPw9FUZUK/6iz9EPObguHo9gzQnzXmFGLpGEE?=
 =?iso-8859-1?Q?PeWOwytH6EfRqbihdfD31UISUPJ4v+r8uXATx0Q/3b/fgzgy42DfwoI2pr?=
 =?iso-8859-1?Q?h5CAdNWXYKe7s4X+kNynZWjysMnHIivk5cRJXsArUshSxVYKYZd0oNA8rp?=
 =?iso-8859-1?Q?OprzYqK8I5xbM9brefQWzQQKtdWxT97lN+oxZwiQKnwB5Wuypmp+X1gg3Z?=
 =?iso-8859-1?Q?tB4kiENfvPAXTT4UVjwf2NTQYRRzzZattDk2FeKYhDxaT1lqjveDJIuwpT?=
 =?iso-8859-1?Q?CVOsvcXFlTXtpNM8NRBoKPePeR9aUAb1Rb3Vv3z4glGKEwwGcV5HuF054T?=
 =?iso-8859-1?Q?NZYtxCTzNZRW53dVTsD2b6+bS57EOr1l5cGhaza4iI+FKrYPXHnnptmymG?=
 =?iso-8859-1?Q?/JKyYAsFpPp5/JzHl80mZEeO4kvxiU5FkUfSpTJRk5KzhoQrPlal6MQ8lX?=
 =?iso-8859-1?Q?oQWz4RkYZQ2pe0wHrX6YsSelCCuTJlgMz3BqfQgWSzVpz9Vfi3zRmAKiW2?=
 =?iso-8859-1?Q?H2KQpfMujeGDh5IeIfD4wGj8I/4kdYYENgH+0XpdM4x+PDAxtnGwF2YPq6?=
 =?iso-8859-1?Q?AyjjGWTBGTQlS9c55prMuv414jE4gcBxq4KU6kOD+czOuv45LFxwKIvTlP?=
 =?iso-8859-1?Q?HH0zB+bBHyu2G3oZ83hyE6mZfAJdJwgEeDZw9FoPdztJDJ8Dd7nj8uNwU+?=
 =?iso-8859-1?Q?r65Sv0N3vPhjwnG8QvgZbHoQ1jf9S2J27ayhhRt8s7lpQYIZS1750GyKvD?=
 =?iso-8859-1?Q?VF88Crd5vdS6gEjBBCCuMn7ZnvIytJdmRiNNI5+gfVYkNRk79Z/pYmqxjm?=
 =?iso-8859-1?Q?YfFqJ24vKaihvWVUV0SV2Hw3/ckB8LFwH9hZ+nynOAvo8l3SNOnls4JA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 008c8933-6286-4d2c-f4c0-08db62b4d1f0
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 15:28:16.0847 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3E3WEUXXIE6WX50d0gCN4jMofZBaohfAuHJ79rLvcQX7o6KxM9VdNmICBoS4c8/bNgXEwFlop8OTLW6jho8w6ELY3OAeDMy1p5DlQ6/9b88=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7278
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] drm/xe: Replace PVC check by engine type
 check
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Jun 01, 2023 at 08:23:27AM -0700, Souza, Jose wrote:
> On Thu, 2023-06-01 at 08:08 -0700, Matt Roper wrote:
> > On Mon, May 29, 2023 at 12:56:07PM -0700, José Roberto de Souza wrote:
> > > __emit_job_gen12_render_compute() masks some PIPE_CONTROL bits that
> > > do not exist in platforms without render engine.
> > > So here replacing the PVC check by something more generic that will
> > > support any future platforms without render engine.
> > > 
> > > Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_ring_ops.c | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> > > index d2fa0b4c8bcc0..b79dafbe7c4f8 100644
> > > --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> > > +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> > > @@ -249,11 +249,11 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
> > >  	u32 ppgtt_flag = get_ppgtt_flag(job);
> > >  	struct xe_gt *gt = job->engine->gt;
> > >  	struct xe_device *xe = gt_to_xe(gt);
> > > -	bool pvc = xe->info.platform == XE_PVC;
> > > +	bool lacks_render = !(xe->gt[0].info.engine_mask & XE_HW_ENGINE_RCS_MASK);
> > 
> > Is there a specific need to check xe->gt[0] rather than the gt pointer
> > we already have?  This function will only get called on a primary GT
> > (since media GTs don't have render/compute engines), so it seems like
> > checking the current tile's primary would have been fine?
> 
> Huum! Yeah for all current platforms it would be fine checking against gt or xe->gt[0].
> But I have already pushed it...

No worries; I need to solve a rebase conflict here on my gt vs tile
series, so I just wanted to make sure that it was safe for me to resolve
it this way and I wasn't overlooking something important.

Thanks!


Matt

> 
> > 
> > 
> > Matt
> > 
> > >  	u32 mask_flags = 0;
> > >  
> > >  	dw[i++] = preparser_disable(true);
> > > -	if (pvc)
> > > +	if (lacks_render)
> > >  		mask_flags = PIPE_CONTROL_3D_ARCH_FLAGS;
> > >  	else if (job->engine->class == XE_ENGINE_CLASS_COMPUTE)
> > >  		mask_flags = PIPE_CONTROL_3D_ENGINE_FLAGS;
> > > @@ -275,7 +275,7 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
> > >  						job->user_fence.value,
> > >  						dw, i);
> > >  
> > > -	i = emit_pipe_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno, pvc, dw, i);
> > > +	i = emit_pipe_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno, lacks_render, dw, i);
> > >  
> > >  	i = emit_user_interrupt(dw, i);
> > >  
> > > -- 
> > > 2.40.1
> > > 
> > 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
