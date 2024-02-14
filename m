Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC303C48BC3
	for <intel-xe@archiver.kernel.org>; Wed, 14 Feb 2024 18:16:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ED1110E198;
	Wed, 14 Feb 2024 18:16:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kFtcBBjZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBE1C10E173
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Feb 2024 18:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707934560; x=1739470560;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WQD79k9Q9IOAOMMvKNPGAGQsjML1cfppzIDBqLpPmOg=;
 b=kFtcBBjZzC7dAuSvC8iOom4/iBiPducwT1fk4LKHfeK97jtGC9FgNCbp
 y2ud+UfPtUKfJ7QczI6+kz4jVQZxVigOxZY9/f79WAkB8a5KJL8ukqStB
 elWCJb5d5yVGm+0qpx/30BHbPwdd56MW768uMXZxdKRaW2LH9NP7yh3un
 fFX+hdpIiTLy6DrCwuVqt8b2WuwqcvqZ9xfEtLo7d32hIY6jV+kH5QH5k
 xsGnflat+iQ4J7qOrpZINXHKExNq8BwP7LhDvoa6hdA3lKek5aWSmLsdQ
 4hdMuVoPZPIYEZv08CJFOksyCvUqNYwXkqLLEiXIH8urNDpD2fcz3ftH+ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="19411000"
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; d="scan'208";a="19411000"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 10:15:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; 
   d="scan'208";a="3592985"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Feb 2024 10:15:58 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 14 Feb 2024 10:15:57 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 14 Feb 2024 10:15:56 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 14 Feb 2024 10:15:56 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 14 Feb 2024 10:15:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WoA6ZiHVcacXLARl9crMUnwUvsq+cUlqF46mAxSo1paH7S5tSgeJRUQaI7tufByf6BZahOJBxEZwHfnLrSgg8Hvu388GUO3LPePY3yi5Q4zXp72dVfeGrahEg/KLMvNf0mP0ooGJyfbkzvFfUxsQqMNxD3LZgv6LpwQ1TUUU6y9j2Y++ux6RszJT5wnbp241P/LCAmACAZhtUXiEQPt6IHkhSztgTXfRwJH30folFwQo+QDrYHT3ULDhVj7+fvgcoXGZW3gXs50SotUR9/6Gg9k+C2+aCq4U+GufGJStRvqZy0SFaQVqOr9xAaS8viHsPkbAgtzwsm7dvOewc9kWGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wE/77zPc79n7W6QRwuCWCWMc8tQ4/49LrGl3VDntEp4=;
 b=g1p0IXQQfzD1V3Plto9LLDvbyTK7gEdrO1QlMfCMOa1Qj23nGu7B/GcVkbjQE7cw1Ipt352aTvoNUr1HhD5U7n1sAR9BZTYplLH4hMCUsIBDpUyu6Wy6IrWOPf9w4/qBpJegKxpNyDZZndVB2t/iyML7gAe3OYfu5jFh8Iomkn66IsfZsoN8mT9ysuf3bQLHcAW2e+cmi991yCetlp0ohUk7SygtGDr1x0F9NiJkRgGENCnlV3tR75ipsFbEghhxRueOaLVHumx1m1xIvPvsGNEl4KroR8VmNeZosuWtn1Kw+3sRVLE71uTeNUrUVr3RQ+sC0Mt2ombhQWfLUZbFqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB5646.namprd11.prod.outlook.com (2603:10b6:a03:303::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Wed, 14 Feb
 2024 18:15:52 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7270.036; Wed, 14 Feb 2024
 18:15:52 +0000
Date: Wed, 14 Feb 2024 13:15:49 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [RFC 07/34] drm/xe: Convert mem_access assertion towards the
 runtime_pm state
Message-ID: <Zc0DVUWb180kRJL4@intel.com>
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
 <20240126203044.1104705-8-rodrigo.vivi@intel.com>
 <6390f3f6-e9ac-4bdd-b868-035db4356996@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <6390f3f6-e9ac-4bdd-b868-035db4356996@intel.com>
X-ClientProxiedBy: SJ0PR03CA0365.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::10) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB5646:EE_
X-MS-Office365-Filtering-Correlation-Id: b04055f5-d06c-41ec-b68d-08dc2d88fa88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WMhAHg+QktzkplA+P3U9W9HYl/DLkCDo75T8774PzaXabU/Z+JrKAP3qKxSIiCK+8slxqAXGcxvIgsWcEI1ySFpcALdt+6UMEjJNnYs4z2SVG1A0rPjGpm6niovEzK16G9IQ5zlhRcdMB1eL+Q2sijEe9IiAu1ZwdGsiXFQiXEZpFQXraardB3kP1KhgZgb/i4mcfnBTazokiiL6/w34Qw3wiV4IrgNHMRvKYJGU9DK+UMHHQTwfmV8scFAT9ifBb6skaDblQxP/lkY09EoXNYtmFUXX6DAnO0v6t0IvyKgxMQYPWvA0VT+tzVm2T2JiVv9L4pE4typTgSCK1R3/J8plhqRdOeVqGxblGNY/g8H6zluxB8aQNmRos/EVstGEZACzZLn7x/L7aI9cbTvAMglvGtVjXQ2euSnNSVEkZlUF0NBy+hg1MBayC0EScBtuyJCR0BB3IxauT6yJnW1tfKE7PHLGad3/j7QI8i3LLleina7LHRVX4jAVWIOTXLEeWe1bU24ysZXpfFC3PRsVS8xVTonC3Yooat/JnfLd8H3WbyLaZqOjOiK46oWzgUCe
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(366004)(376002)(346002)(136003)(230273577357003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(2906002)(44832011)(6512007)(2616005)(53546011)(26005)(6506007)(478600001)(6486002)(41300700001)(36756003)(86362001)(66556008)(5660300002)(66476007)(82960400001)(6666004)(6636002)(4326008)(66946007)(6862004)(8676002)(38100700002)(37006003)(8936002)(83380400001)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XAZTpHom/7PjmdeJPobCSy3A41mmHOudekcsgQ48Oh4qeU1/aQEcW7lhV/3G?=
 =?us-ascii?Q?7nQGDMM4c6Q0SvvWSj+dSFhk2kAuWse5uqmk3guPtmfOfB4EB5ZPSeGiii96?=
 =?us-ascii?Q?IuJZFYKhTO84rAisJKQN9om6Odgf9xpY0IGyhzkCJXUBmE5J0Dlp+Vr5TksJ?=
 =?us-ascii?Q?ZFTFZS34/HfLolEiyHVAXxvt2dh6T3a+tEuNa8LXv+r27IjXeYmHpPg10k8l?=
 =?us-ascii?Q?CSx6/tv0z6AdCoWffBq8CU3HUyXawOwxkhwN0is//PKUuXYiqdMUvPzFgSrB?=
 =?us-ascii?Q?YYCC/Ml7B/+bJrAEahiItKxv/jHksNI6ySKjXMjIRHQch9yurUfA1QQ9uDvO?=
 =?us-ascii?Q?egShS9Lx6pq0p5bmmLaIoWkcG7DjtWqwDeW1B46etwWtulxV0sN+Z8hAtrvp?=
 =?us-ascii?Q?LNQsen9JANauTRHshWbFRvrgBlmDk3NtC+QE8qzBAQjoLAkf/Ybr4+w+2+bf?=
 =?us-ascii?Q?dTDkND4MNjH7/EhONOndOJ3G+luDCDnConcDrpYlwmUG/0uIFLBFrDGfBOVC?=
 =?us-ascii?Q?WzTM7qZKF0LLNwYy1jlP6xGNeH23IfqUMax/q5Nbsdjo5J56TlTTDSa2P8ow?=
 =?us-ascii?Q?KZ7a5h6tj2s0keGuUU6rHYJwqmCZ5vAPtXgaCuO3q7wcL3RUsdKwSnguMm+4?=
 =?us-ascii?Q?QZzEzH9EmMO2sohg7HpxMohDaJF4ZBuE/wInJNVzr5NyYiugTAVrQAYKpxby?=
 =?us-ascii?Q?hhn6RBQnesO4RZqJVzahhJsXkSZdMvDmrXPo4/8DMWzS4t8jY7SBPE2cfW17?=
 =?us-ascii?Q?8jwZLAicD9uFx/KT8s9sqBd83WcIhH81FGepimS1X1orqGfNzwPh9HXmCLJ1?=
 =?us-ascii?Q?vJTqoXTK6MwJ5tcFEy18e1/T3LMkewCxDM633GLZXyFUwD+fgOn0nHl+V38s?=
 =?us-ascii?Q?d1ex1apZnmByGE39LB06sJnDtGY+WIE4fv+W6vnB1aFyX8q+p6tCAGc2VNuA?=
 =?us-ascii?Q?i/yiX56ygKO4ChcxZj5sOgh5PhYTe6468TjwrHJ6YM/h+yYe/gT32B8v1iRA?=
 =?us-ascii?Q?v+QGp+n1FcX+D9253A9W5uerjGfJf0CRSMfH6JQJ5kMprpezzwzt6rBnB7PC?=
 =?us-ascii?Q?qm7q/avpkw8pbhsJBOhTlqjebIxrlMRGwaMNUUXx1gjY1izWVnt0o7aIhnP+?=
 =?us-ascii?Q?8f6BzpsCWXKkHirST31GdGXSgKYZ6W/C9FQLLvGwdW2k+1EwAwn+bjaXs9xY?=
 =?us-ascii?Q?FTqMinlH1YeUYBWHH7jJ7cxXzSdsiGKs/clRHGAaMObB7DH2Y8ZQ8RASWqGu?=
 =?us-ascii?Q?VSWR/RzFa7DwuWPA02q0u+dKy8gVIRId1mCgQ+IuCStyyS6eP4ay4GWGEMYC?=
 =?us-ascii?Q?M+3ryUr3nqIKSyg9mCty8vHJFN47FJAnsxEuLv6bQuaQ8eyDlbj3dmlCyJOQ?=
 =?us-ascii?Q?1VkwiE/enChEnLdT8Ai30b3wTEsABKKbNLhL5c0NkybJNEqCgbMmtvLwYPvf?=
 =?us-ascii?Q?FCR7VDkgMx8jKg+Wob8W9qErNnVaQdSQtdILWHpf+OD3kf94SCCRl+8xHZ8M?=
 =?us-ascii?Q?ByrTeqv6Aq7qpD2EiR0PNsMBGEuX3b8qm+xg83c38apgxdjpyPIIrKzS2w9+?=
 =?us-ascii?Q?3Grsef3bs8Yda8xYwRPztND+ZPktz2StmI/MMd9t08PSHe0ifsUtVt1tbMp0?=
 =?us-ascii?Q?eg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b04055f5-d06c-41ec-b68d-08dc2d88fa88
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2024 18:15:52.3855 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: swCASaBOp5WUoIT3DMSEA3h4YFvH/ewh18kpZ5TSA6imcmUEdsN0SosPncSC3Nz45AnxKlhHaZI2zoDg4GELaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5646
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

On Mon, Feb 05, 2024 at 09:55:30AM +0000, Matthew Auld wrote:
> On 26/01/2024 20:30, Rodrigo Vivi wrote:
> > The mem_access helpers are going away and getting replaced by
> > direct calls of the xe_pm_runtime_{get,put} functions. However, an
> > assertion with a warning splat is desired when we hit the worst
> > case of a memory access with the device really in the 'suspended'
> > state.
> > 
> > Also, this needs to be the first step. Otherwise, the upcoming
> > conversion would be really noise with warn splats of missing mem_access
> > gets.
> > 
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_device.c | 13 ++++++++++++-
> >   drivers/gpu/drm/xe/xe_pm.c     | 16 ++++++++++++++++
> >   drivers/gpu/drm/xe/xe_pm.h     |  1 +
> >   3 files changed, 29 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index 6faa7865b1aa..01db34f06a7d 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -653,9 +653,20 @@ bool xe_device_mem_access_ongoing(struct xe_device *xe)
> >   	return atomic_read(&xe->mem_access.ref);
> >   }
> > +/**
> > + * xe_device_assert_mem_access - Inspect the current runtime_pm state.
> > + * @xe: xe device instance
> > + *
> > + * To be used before any kind of memory access. It will splat a debug warning
> > + * if the device is currently sleeping. But it doesn't guarantee in any way
> > + * that the device is going to continue awake. Xe PM runtime get and put
> 
> s/continue awake/remain awake/ ?

done, thanks

> 
> > + * functions might be added to the outer bound of the memory access, while
> > + * this check is intended for inner usage to splat some warning if the worst
> > + * case has just happened.
> > + */
> >   void xe_device_assert_mem_access(struct xe_device *xe)
> >   {
> > -	XE_WARN_ON(!xe_device_mem_access_ongoing(xe));
> > +	XE_WARN_ON(xe_pm_runtime_suspended(xe));
> 
> I guess could also check if we are inside a callback and it doesn't match
> current? Sorry if that was already suggested, and there were good reasons to
> avoid.

we could. But any access coming from the suspended paths would surely not
be in suspended state but in some of the transition ones (RPM_RESUMING or
RPM_SUSPENDING) so the extra check would be unnecessary imho.

> 
> >   }
> >   bool xe_device_mem_access_get_if_ongoing(struct xe_device *xe)
> > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > index 9910b748adab..3ef14937d5d2 100644
> > --- a/drivers/gpu/drm/xe/xe_pm.c
> > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > @@ -252,6 +252,22 @@ struct task_struct *xe_pm_read_callback_task(struct xe_device *xe)
> >   	return READ_ONCE(xe->pm_callback_task);
> >   }
> > +/**
> > + * xe_pm_runtime_suspended - Inspect the current runtime_pm state.
> 
> "Check if runtime_pm state is suspended" ?

done, thanks

> 
> > + * @xe: xe device instance
> > + *
> > + * This does not provide any guarantee that the device is going to continue
> > + * suspended as it might be racing with the runtime state transitions.
> 
> s/continue suspended/remain suspended/ ?

done, thanks

> 
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>

thank you

> 
> > + * It can be used only as a non-reliable assertion, to ensure that we are not in
> > + * the sleep state while trying to access some memory for instance.
> > + *
> > + * Returns true if PCI device is suspended, false otherwise.
> > + */
> > +bool xe_pm_runtime_suspended(struct xe_device *xe)
> > +{
> > +	return pm_runtime_suspended(xe->drm.dev);
> > +}
> > +
> >   /**
> >    * xe_pm_runtime_suspend - Prepare our device for D3hot/D3Cold
> >    * @xe: xe device instance
> > diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
> > index ecb19ee10db6..a672adffd0e1 100644
> > --- a/drivers/gpu/drm/xe/xe_pm.h
> > +++ b/drivers/gpu/drm/xe/xe_pm.h
> > @@ -23,6 +23,7 @@ int xe_pm_resume(struct xe_device *xe);
> >   void xe_pm_init_early(struct xe_device *xe);
> >   void xe_pm_init(struct xe_device *xe);
> >   void xe_pm_runtime_fini(struct xe_device *xe);
> > +bool xe_pm_runtime_suspended(struct xe_device *xe);
> >   int xe_pm_runtime_suspend(struct xe_device *xe);
> >   int xe_pm_runtime_resume(struct xe_device *xe);
> >   void xe_pm_runtime_get(struct xe_device *xe);
