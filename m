Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C4BCA1005
	for <intel-xe@archiver.kernel.org>; Tue,  2 Sep 2025 17:33:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BE7710E7FF;
	Tue,  2 Sep 2025 17:33:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DlfsxtFo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9EC910E7FF
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Sep 2025 17:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756834399; x=1788370399;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=T/pmRX0AKdeeD5hqS/KqZXIMwl3Y6GRFj07kF4ToWOM=;
 b=DlfsxtFo/jBTrLHG/JvC/klI7cyjbJvomWQtB0cbdchhwZgChoQ/fg6o
 ZhQ+a+BVNJ4kBlgsp4Twwj2hiCWJETNgqCvT+osuiy76Y8MGjI4guLzPw
 zXrSqZ3vCYR3gRcjVpUOsiRS5DQl7Fjw2T/W34NR6k/Tkz59ztfGEwt39
 JlWOsDZxOV0liSGQ7Y4CuMzb9GEz/6McQ0OgWqIqaFw3PUhgSILCpTamH
 mYvKzG04N/YTDUkKGBlAiE7r93DPcuTuOtDwEaLuykVyKs/Q/c4VaoeQH
 Pa4DhfA3aZVLAbyYFc4vtcYKyowTQQi/LFs778ZX3XAsV2+cOiM46qLYr g==;
X-CSE-ConnectionGUID: yDo3Oz/sTqaMR84cd7eyBg==
X-CSE-MsgGUID: EdUsuyzATq23AkgQuhZYLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="59190360"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="59190360"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 10:33:19 -0700
X-CSE-ConnectionGUID: XGqDDbUURQW94EfVxgYxJw==
X-CSE-MsgGUID: dlo5gMRQS8CVfhlujRVKmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="171304713"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 10:33:18 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 10:33:17 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 2 Sep 2025 10:33:17 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.65) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 10:33:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CxMqLC9roSI0OVH+2DXezjkaT2PXvDInRS/brWMbYCyY2idjjUvM6O83hs+9Eyn2m0V45BAkPakTMsXw++kC9q+0tHJeQlwbrZ90F6GJysVmuYb6Qvqmd4zY5qNagusoKUWEQU+loEHSAMatLrkYVVzsmOFJhp2pxVCdyp8CVYOF1JWecEDdV1x3UF2v6BsQJ7hU8y5JJ48Ys7OKCDMYHHCe18fl47lv0FrEzBtXBlTwVwiG2sbYLDm897Nk1T95YUkW/Vy585aif4oMNV3dzHSVyRozXQZWJHjz8dLcViR2Kek4yUXtpvMTSoiW/ZLColRigjZANyGxMVEAKsmv8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UQzCEqGXwe5nSguDqvMlED+Bxg/8ykeweWNEMSv+zLU=;
 b=JCNEoRnjDe1gnOnrm3QMgru/iTF+JByA+DbJ6GpV0iH9eWAadRrjRdxwmkvo8tMHjQg8Xec7fsYVYhq3Jcu74Yhu97Cux6/b1tse2vJUeXx/+NfuEuShBxX1chzJ1/cbtEcMVbDamppSDjSvD+WAJUxVpwvEGFM7Ep/Qi/PfE6WoHLKZJynhjhOicu8y7iKB5OZRcLHq2/MxacOhkjsLvY7rOKvYmqaq4ojaPZLGCkLUV60j8qMwX8WifcWOYPbO8Ivo6fXrZep26MVzjSJPJ26vNxldcMmTY3GN+EGZQ/SwQDcLBhTB6Rzm5S5bGVdgPR8e50WbL2+rrGw2F/DjqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by LV8PR11MB8512.namprd11.prod.outlook.com (2603:10b6:408:1e7::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Tue, 2 Sep
 2025 17:33:14 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9094.016; Tue, 2 Sep 2025
 17:33:14 +0000
Date: Tue, 2 Sep 2025 13:33:11 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>
Subject: Re: [PATCH v11 02/13] drm/xe/xelp: Quiesce memory traffic before
 invalidating auxccs
Message-ID: <aLcqVyZEKXlSqHwF@intel.com>
References: <20250821141458.72876-1-tvrtko.ursulin@igalia.com>
 <20250821141458.72876-3-tvrtko.ursulin@igalia.com>
 <aK8YmLNQ_Uu3uzyn@intel.com>
 <52e66d66-c479-40f1-872d-7f6b26912544@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <52e66d66-c479-40f1-872d-7f6b26912544@igalia.com>
X-ClientProxiedBy: BYAPR08CA0004.namprd08.prod.outlook.com
 (2603:10b6:a03:100::17) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|LV8PR11MB8512:EE_
X-MS-Office365-Filtering-Correlation-Id: 964ebf94-caf9-4973-de9f-08ddea46cbc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7qi0dXjIdwXskGZLKiP/GFjd20cHlgkkXJdegQWjDD41ezqZVJVMvrdow4nE?=
 =?us-ascii?Q?D460L3KP+ivmKDWtQFNtGLUeS1fHBs2zuXyiP6+BDsPiSL+xLufnQSSxmqAb?=
 =?us-ascii?Q?Kh351Jofv/jIPYUkC4rZbQa9Otvmb74vAzwQDye6SL9cKQQbCW+83wf6bV/V?=
 =?us-ascii?Q?LediYNflYqYOcVMWqYDHwJoDU7IgMZ7OiRJA61o2PGroPOc+b19I7mCJ2gfU?=
 =?us-ascii?Q?CANiJlB5HiGSrztvtvD+LXGK8Mx/M7tdHDojWFNcKeiybpPFmiXQV6fmRq2Q?=
 =?us-ascii?Q?q8BkGjvIlAinNkr5ldCaOQ+W/bRF2he2qJO0pzdujRptdzo+xX/N3DheF1uh?=
 =?us-ascii?Q?yXiEzar7dOA8RHjKEmQPWuRP+8vb8firvBroX9c92kxdv2rugOd0v2pF0Stv?=
 =?us-ascii?Q?kMPv0HEprZJVFfq+bTd755Qc3TJEknG0yQdcgoA0YGgeTnx3hJ3gZxofV1+z?=
 =?us-ascii?Q?B/2effxm+KVFOElIHW6XLXvdmkZ10WG1JKwKHszdjw3QFqQf8A+hMKAk2oMl?=
 =?us-ascii?Q?6Riqw6lSnlar5mTEBj15OSM6f4OZoKUOAtnMwioKL9ZBse+FaJrelvJFcH7I?=
 =?us-ascii?Q?EvDyeUjllHy4//y7WZNWMNVArPvRiLXtJ7shcrNPuiXxvgo/Z0GMMeU2omzS?=
 =?us-ascii?Q?Co5VeFIeBEYW8Tp4H86Eg7EdmX5k0g+2QwhrhRQO+MZtaSE/h1ajzr+qtnLL?=
 =?us-ascii?Q?4b7P6Ii9d/AwS4SjxhJWFmbwhvfaLmk14ZvEn/iH+HLotuuxQpjZUjtalYur?=
 =?us-ascii?Q?1dyOIKqzjj0pLEK1GSROd8S1tdPxaKZXEeQ7wrTY7sn6mE65w5yr1By+lolI?=
 =?us-ascii?Q?CTGSxvY5w2ArCIeOL54mTT7o8XMC2ZTAKJ+AI6WYnjrLgDLwr8IHcVNYdx8K?=
 =?us-ascii?Q?XcJ7vnxXkjkILPJHa3mYENZUmWBCPwIRTFyfXT7Efr6x6szDyUobJidDquE8?=
 =?us-ascii?Q?ILXDl0Dg04SUdwWQq/DARkSISuB0i0S9JTsg8UsmxMoPoaOf9iBY50ogRnRi?=
 =?us-ascii?Q?k1fbK2uakIrtKxSxQX+uHbvA6j0E6iR3VNfxOuu8rOAZAgRr7qeYsGXmD/T+?=
 =?us-ascii?Q?tWZ33WN7UvidObJpoiyaU6qvkQ9oLE9M4rSxRl/mweCwi2qT3RrlZZfMIXDl?=
 =?us-ascii?Q?IaJr3tALCbKnrd1v0kB3iffj4aIA8lwbzrxqffqGwNJjLFGhlg1GGeU59SYd?=
 =?us-ascii?Q?4+1qOfRrnr5WIiHH6tSGXcZqXaQcjZ5EH6MKy9q0TPeWgPdHPaxru6AMstR5?=
 =?us-ascii?Q?9sQRC6zbHZV+2vNDJfaq8wGWN9C4HLgMuPSrgJhfjpuWkEGFv8DjHmIEdOW1?=
 =?us-ascii?Q?2AcoBcW5pwCdaxj0RWADyFT1CVPw4VKdtudi4wJjY9Li0gwhs6BcTqqQ0QrH?=
 =?us-ascii?Q?E0NF5jg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yO77B9b3Q1KRbXaI1O56q095Xi5B9DDBDZEUx9/+Jnr+N1sXunUpXAcoshlO?=
 =?us-ascii?Q?9RlK/LKpYn5Q3AkrwwznHu9JIFOOcdPTJoPpsiKxyOW48v9+0XHURW59PzNU?=
 =?us-ascii?Q?iFnTcAD5Nhs602Lve1K1jC8OOEogK7PXti64rgL/5lW+p0+1lySVObfm5Nm0?=
 =?us-ascii?Q?/CK/fR0k9HSP5G/yKXO8A/xx0ZxsncWeZMYkCN2K+NKKl8kXyjLcbayz3grB?=
 =?us-ascii?Q?e0r8utQ1vYN2kYSSk/kQvSafzePDcUtpQeIoZ+6lQMq59XEbMc/lfmVD0ZM/?=
 =?us-ascii?Q?/fWkr8kvj9xyb0Kf/gVswoFipLlOlMpX3ExgTd1pOLNBSZnd5gzGRujdLABt?=
 =?us-ascii?Q?9vX9Hy5YjjKQqmCyborNOJmmYZpTsrUPlD58ydnaLw9dgQrU64r/Sj74Pjcl?=
 =?us-ascii?Q?p8cHfGycdrcQ8kVMHE9H42Ki5zFaUkeiU46zOEMcwhqLZ6TR9PvT2MmUPiJ7?=
 =?us-ascii?Q?n6lztpPMMafM1HbdXT+d36huvRrRjkRIyGMj6gOAFDLpaNLMmOCGxeULEGCs?=
 =?us-ascii?Q?6JvTbCv7kagi385ykNp0LM7lRdsKJTrWnNpbPnpeIg/r20orIunJHZFONMQn?=
 =?us-ascii?Q?XP4QJrI1rFnLv0GBPE1n4eQVt/yvt1AiT7+DqO2sioHUVOogOedezdRDnA88?=
 =?us-ascii?Q?1YUhOip9cEf81UPuQHAPgAL5P4f/LK/xgHNOY23pdq/4VXqQ790hdAXoN9mA?=
 =?us-ascii?Q?1J9KsqLNBY0sKmZWrsqlAU6jCS9EDKDen5ck+h8OHBzoN9Q7Q8s2C2wCmp2m?=
 =?us-ascii?Q?RO12W7unnhi5+PfZV3xj/mXPn8IKpg/8Inv04o4T8ICbFd0LHfnQcX0q6xal?=
 =?us-ascii?Q?RDtbQ233z4k8uR08tRiiIRUBn5kHyUdSK1yEqjcMK10hlwJkX7POrY6dsJ81?=
 =?us-ascii?Q?KCrQ1u0ITNAI+lCkwlqTm4LYko2kWf8dlnRsHCzRDk7jlSLM+2j1OtoGI+4j?=
 =?us-ascii?Q?U8Vk0/4zM1RoNrvuBpmyKtNPmFr7LM9Var2e/MpV7kgXvAqAn/jguwmcz8e8?=
 =?us-ascii?Q?1l1pqM2NWbwG6wWOZtYD61RUXJJJ6Rl8C1MR3Ig6rW8FsIkwy285lHobzMJa?=
 =?us-ascii?Q?hZ7YelCINnXUMJI8CdJoIlYOpyfvC18FkcZHO8kQLohL7KAmI5UOS4Guc8EC?=
 =?us-ascii?Q?zKD+iqr1KVhkmb+e+JuKHqWmUO9ERfyLVBoJMMAkfFlZPBbRfLaDMiMYD7K0?=
 =?us-ascii?Q?UuVnLcNorBl+4DmrXchHmNlGHy4L2xCrym4lxVw9wQ74C1AXY+ILrqJ64q66?=
 =?us-ascii?Q?JMNsSr9ylSe6KxR+C3SNXIAQNB22ZTG6savsrQYou5HW4ZElRo1h1fWRTpdS?=
 =?us-ascii?Q?wZ4deZDSYVj7mdSzJMW9dH/gFfDjIqu0TIjdZpmcUrNrFoubudpn6mVd/bxM?=
 =?us-ascii?Q?mdEjHOIxSfREeA68Qu9NSxx7vhVl3Z+hQBoacEUmn9NUXdOv41ZB/BW36x50?=
 =?us-ascii?Q?0JuqokBWk53wt6/s6pw8gbyssEi+L4uerO+i9o5/pSS4te0Fya7WpCXaYi40?=
 =?us-ascii?Q?yZoOdCIqTl15xGq3ZYfHDafLLe8tRqs03F//bw1+ZTN/o7EmCxVIDO1hzKX0?=
 =?us-ascii?Q?Fkqfm9d0EcpO1WKBfmK91Qgvi+rff1iyT9kEqPkt?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 964ebf94-caf9-4973-de9f-08ddea46cbc7
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 17:33:14.6319 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bNmlfhCGXdKkyLet/T03Qy58vCaJuqCx6nq9lRIlUP5rNheBVAjor2CFWq+mEDWHNpv0x4mNyZ9yQAk2KMsmRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8512
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

On Mon, Sep 01, 2025 at 11:37:33AM +0100, Tvrtko Ursulin wrote:
> 
> On 27/08/2025 15:39, Rodrigo Vivi wrote:
> > On Thu, Aug 21, 2025 at 03:14:44PM +0100, Tvrtko Ursulin wrote:
> > > According to i915 before invalidating auxccs we must quiesce the memory
> > > traffic by an extra flush.
> > 
> > Perhaps we should be more specific about what commits exactly are mentioning this?
> > 
> > > 
> > > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_ring_ops.c       | 7 ++++++-
> > >   drivers/gpu/drm/xe/xe_ring_ops_types.h | 2 +-
> > >   2 files changed, 7 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> > > index 761740d7769f..f56506ebbeca 100644
> > > --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> > > +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> > > @@ -358,10 +358,15 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
> > >   	struct xe_gt *gt = job->q->gt;
> > >   	struct xe_device *xe = gt_to_xe(gt);
> > >   	bool lacks_render = !(gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK);
> > > +	const bool aux_ccs = has_aux_ccs(xe);
> > >   	u32 mask_flags = 0;
> > >   	i = emit_copy_timestamp(lrc, dw, i);
> > > +	/* hsdes: 1809175790 */
> > 
> > in i915 I just see a mention to this HSD which is the
> > 972282c4cf24 ("drm/i915/gen12: Add aux table invalidate for all engines")
> > 
> > but that is not about emitting the flush, but about fixing the aux
> > table invalidation itself. And that is in sync what written on this
> > HSD, but I don't believe this patch is about that.
> > 
> > So, although this patch itself kind of makes sense, I believe it
> > deserves a better message.
> 
> My logic was this:
> 
> d0d829e56674c (Daniele Ceraolo Spurio 2020-12-09 23:36:18 +0000 244) int
> gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
> d0d829e56674c (Daniele Ceraolo Spurio 2020-12-09 23:36:18 +0000 245) {
> 803efd297e315 (Daniele Ceraolo Spurio 2022-03-01 15:15:40 -0800 246) struct
> intel_engine_cs *engine = rq->engine;
> 803efd297e315 (Daniele Ceraolo Spurio 2022-03-01 15:15:40 -0800 247)
> ad8ebf12217e4 (Jonathan Cavitt        2023-07-25 02:19:46 +0200 248)    /*
> ad8ebf12217e4 (Jonathan Cavitt        2023-07-25 02:19:46 +0200 249) * On
> Aux CCS platforms the invalidation of the Aux
> ad8ebf12217e4 (Jonathan Cavitt        2023-07-25 02:19:46 +0200 250) * table
> requires quiescing memory traffic beforehand
> ad8ebf12217e4 (Jonathan Cavitt        2023-07-25 02:19:46 +0200 251)     */
> ad8ebf12217e4 (Jonathan Cavitt        2023-07-25 02:19:46 +0200 252) if
> (mode & EMIT_FLUSH || gen12_needs_ccs_aux_inv(engine)) {
> 
> So commit ad8ebf12217e4 added the flush before invalidate:
> 
> commit ad8ebf12217e451cd19804b1c3e97ad56491c74a
> Author: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Date:   Tue Jul 25 02:19:46 2023 +0200
> 
>     drm/i915/gt: Ensure memory quiesced before invalidation
> 
>     All memory traffic must be quiesced before requesting
>     an aux invalidation on platforms that use Aux CCS.
> 
>     Fixes: 972282c4cf24 ("drm/i915/gen12: Add aux table invalidate for all
> engines")
>     Requires: a2a4aa0eef3b ("drm/i915: Add the gen12_needs_ccs_aux_inv
> helper")
>     Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>     Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
>     Cc: <stable@vger.kernel.org> # v5.8+
>     Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
>     Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
>     Link: https://patchwork.freedesktop.org/patch/msgid/20230725001950.1014671-4-andi.shyti@linux.intel.com
> 
> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> index 46744f966077..58b448708e75 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> @@ -214,7 +214,11 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32
> mode)
>  {
>         struct intel_engine_cs *engine = rq->engine;
> 
> -       if (mode & EMIT_FLUSH) {
> +       /*
> +        * On Aux CCS platforms the invalidation of the Aux
> +        * table requires quiescing memory traffic beforehand
> +        */
> +       if (mode & EMIT_FLUSH || gen12_needs_ccs_aux_inv(engine)) {
> 
> And ad8ebf12217e4 referenced 972282c4cf24 as the commit it was fixing, while
> 972282c4cf24 is the one which references hsdes#1809175790. So I decided to
> tag this patch with it as a transitive property.
> 
> If I remove the HSD reference, replace it with a comment as the one in i915,
> and put the above commit chain reasoning to the commit message will that be
> good enough?

Yeap, I believe it makes more sense.

> 
> Regards,
> 
> Tvrtko
> 
> > > +	if (aux_ccs)
> > > +		i = emit_render_cache_flush(job, dw, i);
> > > +
> > >   	dw[i++] = preparser_disable(true);
> > >   	if (lacks_render)
> > >   		mask_flags = PIPE_CONTROL_3D_ARCH_FLAGS;
> > > @@ -372,7 +377,7 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
> > >   	i = emit_pipe_invalidate(mask_flags, job->ring_ops_flush_tlb, dw, i);
> > >   	/* hsdes: 1809175790 */
> > > -	if (has_aux_ccs(xe))
> > > +	if (aux_ccs)
> > >   		i = emit_aux_table_inv(gt, CCS_AUX_INV, dw, i);
> > >   	dw[i++] = preparser_disable(false);
> > > diff --git a/drivers/gpu/drm/xe/xe_ring_ops_types.h b/drivers/gpu/drm/xe/xe_ring_ops_types.h
> > > index d7e3e150a9a5..477dc7defd72 100644
> > > --- a/drivers/gpu/drm/xe/xe_ring_ops_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_ring_ops_types.h
> > > @@ -8,7 +8,7 @@
> > >   struct xe_sched_job;
> > > -#define MAX_JOB_SIZE_DW 58
> > > +#define MAX_JOB_SIZE_DW 70
> > >   #define MAX_JOB_SIZE_BYTES (MAX_JOB_SIZE_DW * 4)
> > >   /**
> > > -- 
> > > 2.48.0
> > > 
> 
