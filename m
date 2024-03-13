Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 217DEC54E66
	for <intel-xe@archiver.kernel.org>; Wed, 13 Mar 2024 21:54:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C158B10E955;
	Wed, 13 Mar 2024 21:54:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QoJsOeP9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C912F10E955
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Mar 2024 21:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710366887; x=1741902887;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=IJA4VQTTwW0CNFlS9x8iHpbtDLSnkNytBPxG7O13Bzo=;
 b=QoJsOeP9Hy/KA8cWthq2aS4D7XCbwVhCLjl8zp9ISZzO67cGR1mfM3Fz
 Pbg5MXIiKYth7IIEkZIPElqXrXgl0/fDfik801CVPE1JN7tKYjpcOL4NM
 je6EXvXIdnpl69sm3jyJ4sgDN7IE0skJ7DTYm+/KfZdA+SCnK1qoD3TYY
 1WycxUDm14IImRSH2rpvaoS11okKYrnJJw6bPNxu4TBS17VeOpC+8Rl81
 8/MakBOu0LJcCHQamEKY6BkUN1KMlCWGIANmhVuD1YkhKhdqb2oqsEx3n
 QZ7okL0v32d5X+Rwl3CzYB9ln9JhoC1SyGtbjxqR3S/+0ap+pbfhnToXr A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="16612538"
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; d="scan'208";a="16612538"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 14:54:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; d="scan'208";a="12157013"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Mar 2024 14:54:45 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Mar 2024 14:54:44 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 13 Mar 2024 14:54:44 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 13 Mar 2024 14:54:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bE7eYuV/2o+BdWF2rHUDW+gDIH5TudJFvjoxTwJwo4kutvE+cwoRWpzZxOkjYA/VXLDOu0RGuLs6dr/Urng+n3E+qUUlLL07wCigss+GydjDE8ch5FTleTEdc3nWQiVyZnHOhTKBjZadbZlaQ5nnmHoXb9iRloWCqHugec3kU3CFV3Bg8SenheCcO2PRi0GhNhkWz34+peYYYWNL3bSxxqc5fuiUeSCW09gi1hvdB0FjgAvC6/XO0PWKwsy8lWm+wFlpUhi7JMK4F/4EVs5/P0d9cQVhmEUrWeU8kIOW4cfa3w6/zIjC4yPhLgpXGpaqmNsTK0RIm6BI9g8hkIpteA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gE9SKc1ZVr42jYd3BbbUAiWhpbWbqn4xuhTn8DhFH5U=;
 b=BF8YklVxAZCJ+UQioSsfE4UAW4kFbtBjcPOBqpAtGAZcus370eX47v+0TCfbHRTiHoojgrJUTqmcRztlyKlGuTFcyhr5feFXtJ+dNnBNKrh6c/xEnxfcwSEO8UU6i1C25zzk6Xjv1sBK+OEO65/poQakNewsqIwG4vdvJgDcA1t84J4/xvMJMQO4HvN5iaxNrgwyaSqA4Quh3MImHIIyvk2ndYttBGgkYsBRJ1EZHiEd9B33R3+SWMYnyA04/8pIMczebEPuwJo6QIMa7oVFuoHH4bNDsVQ9laP2Nix1FuZkuRDauZ/e8qbZWS6KxUeG8be9fU7jzEM9JbHc2x24CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB6828.namprd11.prod.outlook.com (2603:10b6:806:2a3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.15; Wed, 13 Mar
 2024 21:54:41 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7386.017; Wed, 13 Mar 2024
 21:54:41 +0000
Date: Wed, 13 Mar 2024 16:54:38 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Alan Previn
 <alan.previn.teres.alexis@intel.com>, Himanshu Somaiya
 <himanshu.somaiya@intel.com>
Subject: Re: [PATCH 3/3] drm/xe: Force wedged state and block GT reset upon
 any GPU hang
Message-ID: <jyhbqihplavieq3dc3ltg3hdqz2i5fsqvdbksbt3q3lz4euyid@hmhhcj43ebll>
References: <20240313195459.141463-1-rodrigo.vivi@intel.com>
 <20240313195459.141463-3-rodrigo.vivi@intel.com>
 <7chi3xtzjj46u4ape5o5uz3mkgqyogyu4egb7772j5mbk5i6z2@glcn273zt7o7>
 <ZfIeINI5VJJaaVto@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZfIeINI5VJJaaVto@intel.com>
X-ClientProxiedBy: BYAPR05CA0060.namprd05.prod.outlook.com
 (2603:10b6:a03:74::37) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB6828:EE_
X-MS-Office365-Filtering-Correlation-Id: a745baf1-bdcd-4938-e5c1-08dc43a82f97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b6rm92YcXGSIP/9ZWrWsgYZEqlrxP4H1p3bf9ZxztUE4SQYx/FkDWYXnyeeQqgx4giOAPyQKf3IpIfhc6mqNzaaPCleIk0OjfLE0FKLKo2egr+d9F2VsdkwbQG4/JjTpIq7Te0IJy9SZPdp1+i1l5EP7zK079NEHa9twO0Q4W+NVULDpfi4b9egl8XxjkN4m6V19qWwAB+zJpx/qF9ntiTlwDESFjiBfMgTYLO+l5q5OlAtNojpZyqj39HZuNsgo0+i6BVYTIBV2kG8oegbF+jhyoWPAp5SOfUZjT/oWPlApEz34SQRbW44ouczlJ49cD2afE+MOiR03nqb8l4qXjwWx/N60le0fwvag7qSALyNw1Qht2YzxX2jH7IFADZlMC1zYmLyHx2ANu81XgwFhDIBZdSs14oNpK1e416kDMtUckgu/5Bs3aDG5gQ+nT4AHBGpLnOCBTpDHkMEa7V06HIm4NCD3bcPLOooHm68+nlaom4rtVfN8pHCuWpuUx26sjgCNrLIhDnYrHeNhVGLABiSekBsA4ip1odwf2lKXp7XA3k6dpj2x+JfOSpG77a//t/WZ5fNcC5+zneL1U98dAaAiW8mQm7SDQwwiz7lwzn89QaMQuf2vx4pW42srECYBe9BujQJPV7gjdSn0MERIcBh2DWpytjjk4gRTps8K0Nc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l27N92XxM2G33lVQjMTZEGyaQanyIdDDwCXVw21NPx31orrkuubA7q71aVJI?=
 =?us-ascii?Q?b9V89qauREtQ5g4+/PAQqCNdv1LkvKW5wVcHvz2dEIFoMVZiSTr1taaeSpAI?=
 =?us-ascii?Q?5gOdzGp01kzWmQFSx8oFUPO6Zu4hWCfvj7WrkFVneTMp6EfkZWGmwuAbsePC?=
 =?us-ascii?Q?To0xjwlhMyQ5taot6sx4NtzviZuyK822ODOTVx7rIIEt825V/cAT5sDyJ83z?=
 =?us-ascii?Q?Qh7V3UqeiR+R1PWha/nKcCyA4sDUlQnQ2cVmH9hzqyqmDeY4pX8r7yzeZCXC?=
 =?us-ascii?Q?z4Muqq51IRNJPpMjIPHeoKgZ0JBu3ttNhR9phBcaaMQFZrKBkJq+OD68hREV?=
 =?us-ascii?Q?Z5rS5L3O1ULQaxue/yvmLA6+mYjvXFaGiU4e802aT+45zbJgvowfjdi1ERkj?=
 =?us-ascii?Q?mP2xv9CSWnt9h0WD7XL3m+yhoGbNH0hYFLA6JhLjJ6occFUhZZ7BNpbbji4R?=
 =?us-ascii?Q?srQK/znIGVkFFHmEmh47043IDh6yzz22FRZWrzWo/0C3+takO2v2raOpgDGh?=
 =?us-ascii?Q?GbXWOe/MtDV6H+DQJfkVaGa8BAthMGswErwcXnw7LQbQDcFeAP6C6rIU+i2C?=
 =?us-ascii?Q?iVVQ/KPUh0f3WHh5JF+6DqkVz1hA8KCEoLrcKCqNqpf68D1Bqmt4gYhIhq9Q?=
 =?us-ascii?Q?rZuhLq6WChbzWWtbx0R50JlMHxAc4DmYCK3tC/oIrEzQr5WWoOQvhMtWob7G?=
 =?us-ascii?Q?vYGncuoAF+VyOiZ0Aysyg5zYGf2UPqXXMiHxCyN2g/6fBeqDaBZEvZ2OhOi3?=
 =?us-ascii?Q?4JJ7399j3Ryq5AOsH8c1Gspy8X9N2Pqb4uP6r/JPG4yBbzSExDezpP3+jjLa?=
 =?us-ascii?Q?x9OpVlpqpiq+De16YYVYK4DVC8bx4dZbn22+KtMwRRhADwRIOICjCOURgBVR?=
 =?us-ascii?Q?Rt6OuJ1oGXfizwyGso7ME7Z5Xo+sUtunx0xPU1ypY7BVjd8j8ImBmJdLiTtA?=
 =?us-ascii?Q?7VlhM5pTNgxrc8qlkAjbd1iUUhyU+ceM1dsCSftHAAv0rGyhMU9CKF/CvaOy?=
 =?us-ascii?Q?w5KK1wj8vf804DXv2YfgEPF2niQ40xuvi0j40hrlFVuGJaWGzrAJJKGDxgNF?=
 =?us-ascii?Q?x1943cwvdSqk5OsaSF2pa7/6F69+qvprxmlxJlk7cLxkNQM9q3sfbFhy2woC?=
 =?us-ascii?Q?FTReLOtkAjMxx8wCh/n6ooeO3slz5338HALW8k3VP9Y+6rA1blQJuttzhJ0V?=
 =?us-ascii?Q?i9v3MCltYJZt7wgSXnBiEkAYZxsibo0tYBdES+ZJwlELZXOYywhYfk0/OHso?=
 =?us-ascii?Q?bPaXf1mwrk1q9evlkubcbI8Kfx78/0g2Y1xzXz4GaZZ2Tnn3eBQzgIhhKd6D?=
 =?us-ascii?Q?HLKtQGbAt3kc20UexdJSJ7Z/bAV9jWpDxIQAsav4H4uuixZTI3+9tWD/o55+?=
 =?us-ascii?Q?WpVQlDZzC9x7VNoOiLj6GjTvzOX22y1FqgFQzm3JRRVpF9skoS7VslLdhaQG?=
 =?us-ascii?Q?OyyFobohRTR+oIAiYOgfMpYFy2BI+99N2MoH2UjDU4a9KtH5RM/ron8lcBYF?=
 =?us-ascii?Q?IkVauFYFpv9ykUQ7eVmUDOZb7wVadTyF8lqFE9FdBOOWrGphsS7Gfg6b35ei?=
 =?us-ascii?Q?GiYrQFQy3w1Bcsl9JR5DZrnhEJRgO4E4AbnPmhVDY4gVKTKo3Q8Hxu77WHWo?=
 =?us-ascii?Q?jA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a745baf1-bdcd-4938-e5c1-08dc43a82f97
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2024 21:54:41.3875 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c18iY1dWcTmhyUImG4RIJw+Z6j2AH0VR1/EL+pORI+8Gin6ON+jyB/vkoo7hdpWLFnFxi22Ot+jPcDeXCZG64mXRQqqtifScQ6AYpJBmWb8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6828
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

On Wed, Mar 13, 2024 at 05:44:00PM -0400, Rodrigo Vivi wrote:
>On Wed, Mar 13, 2024 at 03:49:56PM -0500, Lucas De Marchi wrote:
>> On Wed, Mar 13, 2024 at 03:54:59PM -0400, Rodrigo Vivi wrote:
>> > In many validation situations when debugging GPU Hangs,
>> > it is useful to preserve the GT situation from the moment
>> > that the timeout occurred.
>> >
>> > This patch introduces a module parameter that could be used
>> > on situations like this.
>> >
>> > If xe.wedged module parameter is set to 2, Xe will be declared
>> > wedged on every single execution timeout (a.k.a. GPU hang) right
>> > after devcoredump snapshot capture and without attempting any
>> > kind of GT reset and blocking entirely any kind of execution.
>> >
>> > Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>> > Cc: Himanshu Somaiya <himanshu.somaiya@intel.com>
>> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> > ---
>> > drivers/gpu/drm/xe/xe_device.c     | 22 ++++++++++++++++++++++
>> > drivers/gpu/drm/xe/xe_device.h     |  6 +-----
>> > drivers/gpu/drm/xe/xe_guc_submit.c |  4 ++++
>> > drivers/gpu/drm/xe/xe_module.c     |  5 +++++
>> > drivers/gpu/drm/xe/xe_module.h     |  1 +
>> > 5 files changed, 33 insertions(+), 5 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> > index 5f0a2bdb7c24..296bc75a55f7 100644
>> > --- a/drivers/gpu/drm/xe/xe_device.c
>> > +++ b/drivers/gpu/drm/xe/xe_device.c
>> > @@ -774,3 +774,25 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
>> > {
>> > 	return address & GENMASK_ULL(xe->info.va_bits - 1, 0);
>> > }
>> > +
>> > +/**
>> > + * xe_device_declare_wedged - Declare device wedged
>> > + * @xe: xe device instance
>> > + *
>> > + * This is a final state that can only be cleared with a module reload.
>>
>> same thing I mentioned about module reload elsewhere.
>>
>> > + * In this state every IOCTL will be blocked so the GT cannot be used.
>> > + * In general it will be called upon any critical error such as gt reset
>> > + * failure or guc loading failure.
>> > + * If xe.wedged module parameter is set to 2, this function will be called
>> > + * on every single execution timeout (a.k.a. GPU hang) right after devcoredump
>> > + * snapshot capture. In this mode, GT reset won't be attempted so the state of
>> > + * the issue is preserved for further debugging.
>>
>> Maybe make it a little bit more drastic so people don't use it when they
>> shouldn't. I really hate the amount of reset=0 I see on machines being
>> used with i915 with the additional patches to achieve a similar goal.
>> IMO it should be a very targeted tool in a toolbox, not the hammer it
>> became.
>>
>> "In this mode, GT reset won't be attempted so there will be no recovery.
>> Any GPU hang will completely kill the GPU so an autopsy may be
>> attempted.  Use with care, if you know what you're doing."
>>
>> > + */
>> > +void xe_device_declare_wedged(struct xe_device *xe)
>> > +{
>> > +	if (xe_modparam.wedged == 0)
>> > +		return;
>> > +
>> > +	atomic_set(&xe->wedged, 1);
>> > +	drm_err(&xe->drm, "CRITICAL: Xe has been declared wedged. A module reload is required.\n");
>> > +}
>> > diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>> > index d10664d32f7f..de3149baf82f 100644
>> > --- a/drivers/gpu/drm/xe/xe_device.h
>> > +++ b/drivers/gpu/drm/xe/xe_device.h
>> > @@ -181,10 +181,6 @@ static inline bool xe_device_wedged(struct xe_device *xe)
>> > 	return atomic_read(&xe->wedged);
>> > }
>> >
>> > -static inline void xe_device_declare_wedged(struct xe_device *xe)
>> > -{
>> > -	atomic_set(&xe->wedged, 1);
>> > -	drm_err(&xe->drm, "CRITICAL: Xe has been declared wedged. A module reload is required.\n");
>> > -}
>> > +void xe_device_declare_wedged(struct xe_device *xe);
>> >
>> > #endif
>> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> > index 19efdb2f881f..987a57205fc4 100644
>> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> > @@ -34,6 +34,7 @@
>> > #include "xe_macros.h"
>> > #include "xe_map.h"
>> > #include "xe_mocs.h"
>> > +#include "xe_module.h"
>> > #include "xe_ring_ops_types.h"
>> > #include "xe_sched_job.h"
>> > #include "xe_trace.h"
>> > @@ -949,6 +950,9 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>> > 	simple_error_capture(q);
>> > 	xe_devcoredump(job);
>> >
>> > +	if (xe_modparam.wedged == 2)
>> > +		xe_device_declare_wedged(xe);
>> > +
>> > 	trace_xe_sched_job_timedout(job);
>> >
>> > 	/* Kill the run_job entry point */
>> > diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
>> > index 110b69864656..61272553f40f 100644
>> > --- a/drivers/gpu/drm/xe/xe_module.c
>> > +++ b/drivers/gpu/drm/xe/xe_module.c
>> > @@ -17,6 +17,7 @@ struct xe_modparam xe_modparam = {
>> > 	.enable_display = true,
>> > 	.guc_log_level = 5,
>> > 	.force_probe = CONFIG_DRM_XE_FORCE_PROBE,
>> > +	.wedged = 1,
>> > 	/* the rest are 0 by default */
>> > };
>> >
>> > @@ -48,6 +49,10 @@ module_param_named_unsafe(force_probe, xe_modparam.force_probe, charp, 0400);
>> > MODULE_PARM_DESC(force_probe,
>> > 		 "Force probe options for specified devices. See CONFIG_DRM_XE_FORCE_PROBE for details.");
>> >
>> > +module_param_named_unsafe(wedged, xe_modparam.wedged, int, 0600);
>> > +MODULE_PARM_DESC(wedged,
>> > +		 "Wedged mode - 0=never, 1=upon-critical-errors[default], 2=upon-any-hang");
>>
>> as we chatted earlier today, I think there's one thing missing. If an
>> engine hangs, we won't notice as GuC will reset the engine by itself.
>> We still need to pass GLOBAL_POLICY_DISABLE_ENGINE_RESET as a policy to
>> GuC in the ADS structure. This is what I was attempting earlier today.
>>
>> I was wondering if we could even update that in runtime with
>> INTEL_GUC_ACTION_GLOBAL_SCHED_POLICY_CHANGE so we can target the debug
>> only to when we are ready to reproduce the issues and only on the
>> specific device.
>
>I like that... Perhaps instead of the module parameter we have a debugfs
>entry where we switch the state?
>
>So, on a debugfs write to switch to this mode that gets 'busted'/'wedged'/'dead'
>on every timeout/hang, then at that time we send this sched policy change?

the shortcome that we always have is that it doesn't cover the probing
part. One common problem on early device support (either because of hw
issues or driver/guc bugs) is on default context submission. If that
receives a timeout, shouldn't we declare it busted?

I like "busted" :)

Lucas De Marchi
