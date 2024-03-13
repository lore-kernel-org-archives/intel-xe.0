Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D152C54791
	for <intel-xe@archiver.kernel.org>; Wed, 13 Mar 2024 20:50:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D38B710E83E;
	Wed, 13 Mar 2024 20:50:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jRpTuzT9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA4AA10E83E
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Mar 2024 20:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710363003; x=1741899003;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vp1eAHsJZz301WowDU3HnVq8ztQXrNEcqsUCMp6DBgc=;
 b=jRpTuzT9YdwUM+HJ3z8heLXBBr/XS0UqLeS2Ljc/mN9MYsyAAf5EQZBh
 U+thPo5vMoZY0vOYWAfT8slULOCsyuYe62zqwUK4odN5Dj8+eIuPv1urY
 c4Rh2xdk/C6wKmscR7Ggg1dJqabokPOXHbpH8pHN/uIZ4zprRZ0m7KXiV
 OkHWDrwxBsPhYOuPUp0NLKVjXPUllzspOudBrHIdMBfQHGsnI1XkAClrs
 dbsoPjBsXp5bQ2Z1TsedmJu06R+bbntsNMgUellcizNO/KlBxKWCdPnKm
 fAJ4LMTawDL0EpmYRmBc+gfF7+da0m4d5K/qmN7DbgiH0yhulEaq7vnhp w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5330046"
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; 
   d="scan'208";a="5330046"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 13:50:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; d="scan'208";a="11991180"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Mar 2024 13:50:02 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Mar 2024 13:50:01 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Mar 2024 13:50:01 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 13 Mar 2024 13:50:01 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 13 Mar 2024 13:50:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HTzj4G79U3XGGgGsG1tFqmInZcpFlNLp1kINR2t4HcWQOQ2GbMD2NFiukWb9WJ0NlHxBPgJy6LyC+TLzkR52CRPpgcZkcXU3dn9o614ENGkQlMlhv131lNhoizD+4Vh+11XEnVUAYMUvdjyKoQQnE2PMUQhsxhFnJI4waplRNWrrL1P+DL9X2RfoJSAAYFRPGA7xHOdBSMbbd8kYGAs7UAYKEKJ2N5GSYN7uSR2J+9POcVGLPWX38psJVDPmOloysSsF9jAhS7AEt/29j3xfEbNtXFlPrA1o2W71aJUq2VZg/Ud/LkrjjUAsl1h/cvguhtI62FvUnvMC38wPoZo7Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mC590RFM3n4PD9GA0i5SNJyk535FI8Vzx1qbXTtG1xk=;
 b=gts5hGMy2eyulkOFWaQJu3up0LjLgoRSi6f4wtOHxfqiFcqaAZ0DR2XXtvcshbH6GPgg4gg6cS8QXlsIhfTCLKctgH0UvYqkRrC3CQ9Fpo4smkq6YX0yTVbMmApIyUmrKnvOcqMNHljwK69GqXciQGeAXXfr9tABWqxf6cy4uP1BX/xhq+AUOyjS9ffDvDsEW/f0bTmonQBSCGEoLCjuAPsF8SmfL2S3H8ujBcLKgFeU6SumWEDQ3zjzHrJlBIE6zXIS7jICoxTNLG3gzcQ7jglpHuZIGBqPlWTNxfAf3SZF2BVyvUTvSPtN7MS1GbCuY1X7gluuoeGQky5TvpZ5SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BN9PR11MB5273.namprd11.prod.outlook.com (2603:10b6:408:132::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.18; Wed, 13 Mar
 2024 20:49:59 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7386.017; Wed, 13 Mar 2024
 20:49:59 +0000
Date: Wed, 13 Mar 2024 15:49:56 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Alan Previn
 <alan.previn.teres.alexis@intel.com>, Himanshu Somaiya
 <himanshu.somaiya@intel.com>
Subject: Re: [PATCH 3/3] drm/xe: Force wedged state and block GT reset upon
 any GPU hang
Message-ID: <7chi3xtzjj46u4ape5o5uz3mkgqyogyu4egb7772j5mbk5i6z2@glcn273zt7o7>
References: <20240313195459.141463-1-rodrigo.vivi@intel.com>
 <20240313195459.141463-3-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240313195459.141463-3-rodrigo.vivi@intel.com>
X-ClientProxiedBy: BYAPR01CA0065.prod.exchangelabs.com (2603:10b6:a03:94::42)
 To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BN9PR11MB5273:EE_
X-MS-Office365-Filtering-Correlation-Id: ff290946-7b96-4d27-81f2-08dc439f25a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ECNSu4nVVokMAUMTI6ARd/QlSgaFRJe84zCIc0ABeiWPwf+/0ENhlm/Fu87mcqw+DCbFPrUbFanfvUcyBvzKqxj9DAuaL3owhti0csVA640Q9q5HqyMHkhKjuk8pfIlB6SL44ZFmGUM7AkCoZBmIyH1sJ0jJcjJcGmNGTR7d/j2iuAHvl9FfOOZFBTO2qWB00Tk5wq2M3dzP6D6jk5KSfl9ERfJmE9ufJnPyFvpPzarMyzwz5MqdQ1ssrTsPEwHjOV+gAT4sVvopb+obejGdKUtWF3iDoYPJio4YRtbAPRlnFw40j8Z+8Q6DZ+baiFeLxiNHqS7NBeSUlm4Ite1NwKF6kEU8PixUFHUNmRIf/9gMsgcJil1+E4NrnT75eMmflTVRF62QeM2CNqs7DGtKkp779klgsHPkcpz5AQwCoWwDjfLpqBn4n1kH4tLXjyFie/ZzjAdT2QqxgV2kmOCb+gh6Hq1MV+Nb8Lo3ykVD2xn2irrMCd/U27bjrwvYjIUxzlinBiQdu2t9W0H0PFPlBEY7alg1op1gxA+xATh5uVP3rHCC5pEda4HmrXenNbw8jvcIeQHesLSUmHBOwBXBZaYT9v+KPy65R/79E7VxeDC239jQDz2Oh1zCjKX3Cc+EzvxQV+AUwbLKLGBiCfxRw7c8ezepNf55awPk/TPo1l8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zoxiuUA11o3BZzFWnAwfrvUsqXyPh/h0OdxjOFQR+DfwScWXQ8zYCZY6hbrM?=
 =?us-ascii?Q?Vv00wmY7CB18iDGkK7cT2Go+AIojKQwndVu+ubv2ZLa3XgfqYZOViG1HSjyT?=
 =?us-ascii?Q?tebqEjay4b9jwWAU6UHbxJuPFuO9rk0ge/ee8TWakCTr92yNz+susHCLvxyo?=
 =?us-ascii?Q?51fa3H/X0XB1IgsunUDR1LwValixmQbpYXsBvuRHEGuXfdKNXlE9RbqTfG3x?=
 =?us-ascii?Q?UFh5Z1f8jvBFbOcCUcKWClF85SEsyicakt+Oz0U55qlEWX9e3zK03ElrUtWS?=
 =?us-ascii?Q?seuz/IU3237pW7n52m4SPhSxqznS933Y+FZK2idEN3YqTba7oSDxE44Me02T?=
 =?us-ascii?Q?UMR2m/hw9zPmxbaur8tvBZMXm7CN4/fb5pKi+OVUwWugSmHGbdNOz4vdw7Dq?=
 =?us-ascii?Q?euJYwga+YwoLG8rEziE+tg+Fe1YdI89onvlX/T24MVak/7OMaLTGZrIhrTa/?=
 =?us-ascii?Q?bFQuY2wnoLOo1qv1DiQsrOmTKGCWbPsfGo6oxpI2Dnv8qXEUwsA5bt5aWwdD?=
 =?us-ascii?Q?ClU6DaWEWhc//lymLXAQZ+NZptNLUyfSIQIkWXGSsjHoHgNtE6QOAUn0cpg7?=
 =?us-ascii?Q?271Uiz+JEkGlf8YBpLdFOI1DY8TPdjH6DXb8ASmmQbvnAC/Mi8GeAoEeYYlf?=
 =?us-ascii?Q?OvlBfjDFmT6grUv4JSeusYhIr7LTRoKwMX5OpW3bQac+WRuTTU/maSVcgpb+?=
 =?us-ascii?Q?S+YjrFiA1FRAqOrY3ekPae3IG8SKRmsHJZRaNqON8NngjHOjo42vZWQV1fO7?=
 =?us-ascii?Q?OBnZp1B8x+6KQ5G2+ykSxVYf2XeZvVtJsnTVZc2ZAZgiJdaEafnIOkCYlfuT?=
 =?us-ascii?Q?AJCPwphZF+jkW0l08zTXnUwJPpaGelh4Umdo4B1RgHCjs2eKb+lsgfvuAM3t?=
 =?us-ascii?Q?EfNAfcQ8xzQSoPwygCbZ683tIyg828dTZ33QPh0FshtiFzdw4d9H6j5z+N+Y?=
 =?us-ascii?Q?kI/mH6ThooIJbLbHCQ8D4T0hKOPHWvMYDJhGpvzPa9WjB9o/znMj/diiuiZT?=
 =?us-ascii?Q?pzQWMkmCmYNq4qddTE+YxILZuR1Q6gzx6N7o4n99GWobJQwwyizu487e1WxM?=
 =?us-ascii?Q?1rWg/X5TQuLPUZNaU8Qdi+eGqyIfdtt6c5rW9z8NPbCqTTb43UScLLEZ+0wk?=
 =?us-ascii?Q?PNXOx7hx7Jk5T6UIZwAV4A+Tuf0I0uW9YSYgOtHROCGbkREeSpyFtmNtG0Cg?=
 =?us-ascii?Q?bO1VgSKFMcGxsJ/AwJj5DyjpsGL6ve0MCd6P3AebsOP7GtC4KX1k65qHvIXM?=
 =?us-ascii?Q?gmu6MEcNfBoVpCXTYcS3J+BMolCusdkLrscCHL7UspuDKvRndEfYJMevBoEF?=
 =?us-ascii?Q?TTT2/t5bmKzgsJAKdMdLVR7otBrRxz/TlzzT9T1Uo9D9nI9g833B4jm2o0Sb?=
 =?us-ascii?Q?xiH30piRN5WWx1R9xxtnFKj/f6MS/GFQs4WOvOyQo2Mvo0+L1DkJoIYVpKYY?=
 =?us-ascii?Q?jPJGDOm8MijLFbxgxLFwJa9LQVvKXWVIwUTaazPBmOVMvpUgI4GUZ0AWv3ep?=
 =?us-ascii?Q?zzDN7xXN9dZUQkoW28ytuqijM4clyt1UJyyakteWHwxkAvCk9d1h0+kc5Bb/?=
 =?us-ascii?Q?qkjXry3RLpfPLGw6j2AaaWPs2qhzvb0K/y375H9RU+dtKGjvmU8QykdqfC0N?=
 =?us-ascii?Q?6Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ff290946-7b96-4d27-81f2-08dc439f25a4
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2024 20:49:59.2261 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qG3z6iw4b3v3xdJgRgO9g/oxUsLQkc6IGEgMgBlQSnCyfAVnmFoNsfIP0sT13j/c+d8MLE4YmYkSwcAzNkbG7CW/Fynit1RvyjIJIZPxZQU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5273
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

On Wed, Mar 13, 2024 at 03:54:59PM -0400, Rodrigo Vivi wrote:
>In many validation situations when debugging GPU Hangs,
>it is useful to preserve the GT situation from the moment
>that the timeout occurred.
>
>This patch introduces a module parameter that could be used
>on situations like this.
>
>If xe.wedged module parameter is set to 2, Xe will be declared
>wedged on every single execution timeout (a.k.a. GPU hang) right
>after devcoredump snapshot capture and without attempting any
>kind of GT reset and blocking entirely any kind of execution.
>
>Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>Cc: Himanshu Somaiya <himanshu.somaiya@intel.com>
>Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>---
> drivers/gpu/drm/xe/xe_device.c     | 22 ++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_device.h     |  6 +-----
> drivers/gpu/drm/xe/xe_guc_submit.c |  4 ++++
> drivers/gpu/drm/xe/xe_module.c     |  5 +++++
> drivers/gpu/drm/xe/xe_module.h     |  1 +
> 5 files changed, 33 insertions(+), 5 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index 5f0a2bdb7c24..296bc75a55f7 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -774,3 +774,25 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
> {
> 	return address & GENMASK_ULL(xe->info.va_bits - 1, 0);
> }
>+
>+/**
>+ * xe_device_declare_wedged - Declare device wedged
>+ * @xe: xe device instance
>+ *
>+ * This is a final state that can only be cleared with a module reload.

same thing I mentioned about module reload elsewhere.

>+ * In this state every IOCTL will be blocked so the GT cannot be used.
>+ * In general it will be called upon any critical error such as gt reset
>+ * failure or guc loading failure.
>+ * If xe.wedged module parameter is set to 2, this function will be called
>+ * on every single execution timeout (a.k.a. GPU hang) right after devcoredump
>+ * snapshot capture. In this mode, GT reset won't be attempted so the state of
>+ * the issue is preserved for further debugging.

Maybe make it a little bit more drastic so people don't use it when they
shouldn't. I really hate the amount of reset=0 I see on machines being
used with i915 with the additional patches to achieve a similar goal.
IMO it should be a very targeted tool in a toolbox, not the hammer it
became.

"In this mode, GT reset won't be attempted so there will be no recovery.
Any GPU hang will completely kill the GPU so an autopsy may be
attempted.  Use with care, if you know what you're doing."

>+ */
>+void xe_device_declare_wedged(struct xe_device *xe)
>+{
>+	if (xe_modparam.wedged == 0)
>+		return;
>+
>+	atomic_set(&xe->wedged, 1);
>+	drm_err(&xe->drm, "CRITICAL: Xe has been declared wedged. A module reload is required.\n");
>+}
>diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>index d10664d32f7f..de3149baf82f 100644
>--- a/drivers/gpu/drm/xe/xe_device.h
>+++ b/drivers/gpu/drm/xe/xe_device.h
>@@ -181,10 +181,6 @@ static inline bool xe_device_wedged(struct xe_device *xe)
> 	return atomic_read(&xe->wedged);
> }
>
>-static inline void xe_device_declare_wedged(struct xe_device *xe)
>-{
>-	atomic_set(&xe->wedged, 1);
>-	drm_err(&xe->drm, "CRITICAL: Xe has been declared wedged. A module reload is required.\n");
>-}
>+void xe_device_declare_wedged(struct xe_device *xe);
>
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>index 19efdb2f881f..987a57205fc4 100644
>--- a/drivers/gpu/drm/xe/xe_guc_submit.c
>+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>@@ -34,6 +34,7 @@
> #include "xe_macros.h"
> #include "xe_map.h"
> #include "xe_mocs.h"
>+#include "xe_module.h"
> #include "xe_ring_ops_types.h"
> #include "xe_sched_job.h"
> #include "xe_trace.h"
>@@ -949,6 +950,9 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> 	simple_error_capture(q);
> 	xe_devcoredump(job);
>
>+	if (xe_modparam.wedged == 2)
>+		xe_device_declare_wedged(xe);
>+
> 	trace_xe_sched_job_timedout(job);
>
> 	/* Kill the run_job entry point */
>diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
>index 110b69864656..61272553f40f 100644
>--- a/drivers/gpu/drm/xe/xe_module.c
>+++ b/drivers/gpu/drm/xe/xe_module.c
>@@ -17,6 +17,7 @@ struct xe_modparam xe_modparam = {
> 	.enable_display = true,
> 	.guc_log_level = 5,
> 	.force_probe = CONFIG_DRM_XE_FORCE_PROBE,
>+	.wedged = 1,
> 	/* the rest are 0 by default */
> };
>
>@@ -48,6 +49,10 @@ module_param_named_unsafe(force_probe, xe_modparam.force_probe, charp, 0400);
> MODULE_PARM_DESC(force_probe,
> 		 "Force probe options for specified devices. See CONFIG_DRM_XE_FORCE_PROBE for details.");
>
>+module_param_named_unsafe(wedged, xe_modparam.wedged, int, 0600);
>+MODULE_PARM_DESC(wedged,
>+		 "Wedged mode - 0=never, 1=upon-critical-errors[default], 2=upon-any-hang");

as we chatted earlier today, I think there's one thing missing. If an
engine hangs, we won't notice as GuC will reset the engine by itself.
We still need to pass GLOBAL_POLICY_DISABLE_ENGINE_RESET as a policy to
GuC in the ADS structure. This is what I was attempting earlier today.

I was wondering if we could even update that in runtime with
INTEL_GUC_ACTION_GLOBAL_SCHED_POLICY_CHANGE so we can target the debug
only to when we are ready to reproduce the issues and only on the
specific device.

Lucas De Marchi

>+
> struct init_funcs {
> 	int (*init)(void);
> 	void (*exit)(void);
>diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
>index 88ef0e8b2bfd..0f95dcd8942f 100644
>--- a/drivers/gpu/drm/xe/xe_module.h
>+++ b/drivers/gpu/drm/xe/xe_module.h
>@@ -18,6 +18,7 @@ struct xe_modparam {
> 	char *huc_firmware_path;
> 	char *gsc_firmware_path;
> 	char *force_probe;
>+	int wedged;
> };
>
> extern struct xe_modparam xe_modparam;
>-- 
>2.44.0
>
