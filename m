Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B58CD1284
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 01:56:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA0911137B8;
	Fri,  5 Apr 2024 01:56:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EcH0bOXZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E5951137B8
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Apr 2024 01:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712282195; x=1743818195;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=W8PLaArPEBHuPOs+iHXvEDmMRhq7HbeiwhkHHmubO34=;
 b=EcH0bOXZ3Zr8gwtIBo/ysXJTxG+YfLthNEwoBHRFoJS7R9KgF365uWPm
 X6/gE59baaHYUFx+uryH9+Sg18v3V8RclwBQZfcMM9dcYYKE78StRWK6B
 eLNvgQepiZAP3pez8pOm3MZ1YpiYFi4ySyd7TgEofq3rs/NJlMAentFIx
 qzT4OlMwSGQ56k++L/aCwhBuwkxtpO6i1AmqBAnp1SdsIG/bldl33KV82
 PzSfqQPmKr9NX2RCZ1cyj2O/w82SkMbUTRoc89CRAPZG8ecCcQSJoJd08
 RLgkGWa5JYT3IQ97EacHztsVI84wRVylaVVsxMxg4I3Syc2ANoD43bNgZ w==;
X-CSE-ConnectionGUID: dvHoiwAjRYC5wzjtsYXumA==
X-CSE-MsgGUID: Sf2IHl6KTAedG+lC//pilg==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="19033494"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="19033494"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 18:56:34 -0700
X-CSE-ConnectionGUID: cA+Lvw0zQCaTcNjRiu7zXg==
X-CSE-MsgGUID: 7k5PuT33RYK8Phwh849b9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="18934875"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Apr 2024 18:56:34 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 18:56:33 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 18:56:33 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 4 Apr 2024 18:56:33 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 4 Apr 2024 18:56:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bcW/AU0x0uE261lTBrT9ImmLxqErCP9Q7fv5Rw6nmwMYfZWsEmENfsGn5lxNh4fPjYgi4N3KZ9KZkE6hNxKNpc6hac/2C/pIxIMezIw4WXI1NR1O2SGEOQyrQ/Xbv6lsdTzxRtzJNwR+kcNaivFn5QDm3kAolKY170Lk1tr3obGEoNoVMBrfdRPeZfL5paPo+jTuiqzcn1CVZL2hVKEVWd/sfg626RKi34QkG/bjXht+ALyAkYqubE4Fd5vfwtLfuD/iHqh+zLHzKcv+7BuFCqc1wdWcGZ/5KNeIDqZn2ZF2Yffa1++7Wfb/5vy8Aq53t0FWcnNI60vbwmMwApuKgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0KOhgREE+Atjkxoh+68HiyobN7nbqpQKQfkVKV2zdrk=;
 b=kYPprNCE4xAtGddFNIjBy5tkLjReaHFv8F6u/PDO/wMvogN4QxQKhHYeKEkVp2wgGP9vXE1tnLoaD71fbHSO9cg/E4kxuUo34gzsUIcjvD+oDCU6BgVRFMcS4MPnczZT3PRaiYtmqQ+uZJvfuiSDFodpnxMxKSuzSyZPNOn+0RfX91O7iH7NAnWzY0ETiX7fAr7PwL4idPBqhes/XzPCut4ktcEXB1LuWopyx0AKLb76S9QuP+DE0Ggp2jVTC38U1N9jrZjV2uQbAP3mOjV/6f9ycc0RQGe/lIbW/U6uJ+mUN1whtKvDh34AphpWcNnQy+N1W6Vokc0U3DqjxkrJ0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB7087.namprd11.prod.outlook.com (2603:10b6:806:2b5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Fri, 5 Apr
 2024 01:56:31 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7452.019; Fri, 5 Apr 2024
 01:56:31 +0000
Date: Fri, 5 Apr 2024 01:57:13 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <lucas.demarchi@intel.com>, "Ashutosh
 Dixit" <ashutosh.dixit@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH 1/4] drm/xe: Introduce a simple wedged state
Message-ID: <Zg9aeYohZa5YvqdB@DUT025-TGLU.fm.intel.com>
References: <20240403150732.102678-1-rodrigo.vivi@intel.com>
 <20240403150732.102678-2-rodrigo.vivi@intel.com>
 <Zg2tyimI-kOuUfK5@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zg2tyimI-kOuUfK5@intel.com>
X-ClientProxiedBy: SJ0PR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::13) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB7087:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CBYYUgoxYEmjNeULqHPFoFkiv+3+aHydezWXlW8Xlo1wsFC2a/zuTEHCpGfjJBjPt8GPqpozJ3+zJGXyY8KZv+cpR9CoHU66p8QOZBKGRPv3s3y5zLqioKaxjmt5SGLJ7AUJhUvaU9ADYEA0oRZxRXuILd2yKT4TNj9KkKE3NgnmgB93+KOQQcVAyHSzkqy1N8MrcJyNyQkoQMYW7JrDJL/bOXrx89jJbeUQKHkB1zXmcqdYT3iKyz3KAMBsuc8o+zogh5/PSbt4Jp/2kY4Snimb/53U6Jw9RnB0Zzj6eBNGW/KE4lkKp95EM/unlDyem1rSMlhyRcaWVk5G7XzX4CTuM2alpcAoxr9JDDJkV9iQnZ7WujQ4mU4L6gPwXMmh2z1XY+3YaJiTVEuRzPmDU2bTPzvlvyS7oBNMO/vCvRX/7XVMm490lED8TxdN6gIlAHeSIOewuDEyHJCbWs15ouEHQJIry+cGYyB6MV9dTgv6HQUYDN0xC662ashYiG34HWFjf+9e1HNsl3bYWpCEQIHRj8fwsiCDS0uIfyb4HgDXa/YwII2/QULhsGMX8ypyOSCuKfFUvRINZ5MYODeaCLATuz8XnJ6xPcpQyAL/WRY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?UVKP0kyOspEfeLYj5+KoqVoNpNjtElkLVEr+N9rGq8kLsJsRkBr7tUZOjf?=
 =?iso-8859-1?Q?wDb6T5EIHiIYqqnCHDz06oalDCXYU6kJqjYdjIr04jIGg3XJ8AFCIx45qC?=
 =?iso-8859-1?Q?WOD2AU+96gk8HyOdJCUYEY4ROlpobxTuh3SrJAlmDHfD7K5U6XYXd69aUl?=
 =?iso-8859-1?Q?is4rl9nhoE4IPFAYXyIPgK+pYBbhrQCosyGKq5tQQGm6UTeEhmoO+KEqdk?=
 =?iso-8859-1?Q?AbLX8fQUjgOYpAN22i6x+4FgLHDIalHs/M7/s+T13BbywKquTmdCPnZU7i?=
 =?iso-8859-1?Q?GCP+0U2TVBDaio63Iufs4S8sSdxdAA332eEiyyq11c7J5IaOPPHGYDd451?=
 =?iso-8859-1?Q?MQ/nu+AW0LY/okeavkYA/TPKQmfp1XTSRIpzlYctDjBmcUN1ySeYhKqiM5?=
 =?iso-8859-1?Q?RY/coExTi7kKaSDTA9pp8DP3Bo5913zrrWzSuxK3vJ+jhqYRGamrydjlqi?=
 =?iso-8859-1?Q?oVK1D3AJCjy9AHbPAhQjVsZQsYA0HO16wMiL+r6qHYcjTE8zN54s4qvuzV?=
 =?iso-8859-1?Q?NQzE7EMIyqA+Qs4uik764WtIZa2pyyTfDMDsHAWrvZmJR1eS/+xAvkPLNF?=
 =?iso-8859-1?Q?g8TweaNfbcoY/wFrN9jLynumNIB544mxaU34l7w+7yKuo7aoh9+r88AkSf?=
 =?iso-8859-1?Q?B6wJtT+FWTtbJYZR9066onY3cODFBaNZu6uyt19ybOCs7PY0byEljhYWSO?=
 =?iso-8859-1?Q?X/tDAkDYL79nVQbfUfOvqTAHTSmxgSOUhe2oP8/zdgTfTjUIDhh8lZXRM3?=
 =?iso-8859-1?Q?LccimPD4ImEIVbvPkAjwjIZmI2OOygnllyZmrAXCl4Wx4QayFZGuoqh/dK?=
 =?iso-8859-1?Q?4HUZfjNVttjZcm11nuO6wIhspVRohlY3s4A45vevp1YUFXhuAKtAe6SH7w?=
 =?iso-8859-1?Q?5UO/IPwHECaeW7CvjzVS1VcnOYE5sESr71XAyxCQPLZk2AJETyczTD/eyN?=
 =?iso-8859-1?Q?COgRxczGpkTepfduSLWd3Rs+hxGPGgW5Hq+RGY+QbUOaESAWy6uvR0OYjM?=
 =?iso-8859-1?Q?KGThbRlXN5QCbPJqvoHRS2CMUGMoOkLZm2zC5K7zkAqWFapCRJ7h0AlSBG?=
 =?iso-8859-1?Q?uNrja67/xyaR+BkuEXXP/ywQypyoxrO+cXJxP8a7nSbNUELf2OLVoLL8pE?=
 =?iso-8859-1?Q?tJjLod1fVQxhzmbeIcCE0E+NEvcKAvSVkdrhaPMZl/a6pT44l3VqTk2ibo?=
 =?iso-8859-1?Q?Y/O39+cMvSTOfre9FOWD4oWoK8tJjJPq23slq2G85Iahmo6dS8o40ReZO4?=
 =?iso-8859-1?Q?shH63SsGHVAwI78Tq5aS4SvxLUZbs2DS3whAxTcbjTYo8KHtEWG7UhROI7?=
 =?iso-8859-1?Q?cYBTZcE/59Yenc1pAakSPexfYDy5eR/mlD2fqvU9y0BzxfUfaSb0ckWIRT?=
 =?iso-8859-1?Q?JLX1djr/vmbK6ekGMJkDTpmMSKU8510Q7t53Q6YxidG1blsc3+BvnMJf0k?=
 =?iso-8859-1?Q?7EKofAo+mUu+Wa9uB09Ui2bf7GZPH+BDhqx6pZIxc/HIfbwXU6HUJxO+/8?=
 =?iso-8859-1?Q?tTduQYRHIj2uCCCZXqK0QeNwRgTOai1i3rXLUDOmk3klzwHE3i85u7tR4f?=
 =?iso-8859-1?Q?vOo6wc3udH1WvbpORTYz4uzl/4qSvj714BgzCmPdbWKyqbq0rRftqjt7pe?=
 =?iso-8859-1?Q?WuY0sbuL4mXztnd2AX8ke/FC88dYlMECp6JMUtqT7hNtKONTBnRv/xVQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b7723735-6d23-4eac-ac06-08dc55139d0b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2024 01:56:30.9559 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S8l6NhvhjTUieYYMd6GxEq4aeIhZEd/S/iN9zMbR0fm4TepYXAgwu/UCFmqAb6bnXkZIk3HeTCV611OG/tEATw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7087
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

On Wed, Apr 03, 2024 at 03:28:10PM -0400, Rodrigo Vivi wrote:
> On Wed, Apr 03, 2024 at 11:07:29AM -0400, Rodrigo Vivi wrote:
> > Introduce a very simple 'wedged' state where any attempt
> > to access the GPU is entirely blocked.
> > 
> > On some critical cases, like on gt_reset failure, we need to
> > block any other attempt to use the GPU. Otherwise we are at
> > a risk of reaching cases that would force us to reboot the machine.
> > 
> > So, when this cases are identified we corner and block any GPU
> > access. No IOCTL and not even another GT reset should be attempted.
> > 
> > The 'wedged' state in Xe is an end state with no way back.
> > Only a device "re-probe" (unbind + bind) can restore the GPU access.
> > 
> > v2: - s/wedged/busted (Lucas)
> >     - use unbind+bind instead of module reload (Lucas)
> >     - added more info on unbind operations and instruction on bug report
> >     - only print the message once.
> > 
> > v3: - s/busted/wedged (Ashutosh, Tvrtko, Thomas)
> >     - don't assume user has sudo and tee available (Lucas)
> >     - do inner protections against command submission instead
> >       of avoiding only the migration for a more reliable protection.
> > 
> > Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> > Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> I forgot to state that the reviews were for the first version.
> The new version here brought some changes to where I was blocking
> the execution. and I found out some bad performance impact.
> I will probably need to get back to the previous version for this
> regular wedged mode approach and get the deeper one only with a
> specific debug config enabled.
> 
> Matt, would you perhaps have a better idea on how to blocker the
> scheduler of running anything on wedged without any impact on
> the performance?
> 

Hmm, I'll play around with this a bit but off the of my head probably
use existing mechanisms to disable CTs and stop exec queue from
submiting by disabling the DRM schedulers. This is probably only
required in specific debug modes too.

Also we likely don't need the wedged to an atomic.

Lastly, even as writen I'm surprised a noticeable perf difference is
seen.

Matt

> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_device.c              |  6 ++++++
> >  drivers/gpu/drm/xe/xe_device.h              | 20 ++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_device_types.h        |  3 +++
> >  drivers/gpu/drm/xe/xe_gt.c                  |  5 ++++-
> >  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  3 +++
> >  drivers/gpu/drm/xe/xe_guc_ct.c              |  8 ++++++++
> >  drivers/gpu/drm/xe/xe_guc_pc.c              |  3 +++
> >  drivers/gpu/drm/xe/xe_guc_submit.c          |  3 +++
> >  8 files changed, 50 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index 01bd5ccf05ca..7015ef9b00a0 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -142,6 +142,9 @@ static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> >  	struct xe_device *xe = to_xe_device(file_priv->minor->dev);
> >  	long ret;
> >  
> > +	if (xe_device_wedged(xe))
> > +		return -ECANCELED;
> > +
> >  	ret = xe_pm_runtime_get_ioctl(xe);
> >  	if (ret >= 0)
> >  		ret = drm_ioctl(file, cmd, arg);
> > @@ -157,6 +160,9 @@ static long xe_drm_compat_ioctl(struct file *file, unsigned int cmd, unsigned lo
> >  	struct xe_device *xe = to_xe_device(file_priv->minor->dev);
> >  	long ret;
> >  
> > +	if (xe_device_wedged(xe))
> > +		return -ECANCELED;
> > +
> >  	ret = xe_pm_runtime_get_ioctl(xe);
> >  	if (ret >= 0)
> >  		ret = drm_compat_ioctl(file, cmd, arg);
> > diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> > index d413bc2c6be5..c532209c5bbd 100644
> > --- a/drivers/gpu/drm/xe/xe_device.h
> > +++ b/drivers/gpu/drm/xe/xe_device.h
> > @@ -176,4 +176,24 @@ void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p);
> >  u64 xe_device_canonicalize_addr(struct xe_device *xe, u64 address);
> >  u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address);
> >  
> > +static inline bool xe_device_wedged(struct xe_device *xe)
> > +{
> > +	return atomic_read(&xe->wedged);
> > +}
> > +
> > +static inline void xe_device_declare_wedged(struct xe_device *xe)
> > +{
> > +	if (!atomic_xchg(&xe->wedged, 1)) {
> > +		xe->needs_flr_on_fini = true;
> > +		drm_err(&xe->drm,
> > +			"CRITICAL: Xe has declared device %s as wedged.\n"
> > +			"IOCTLs and executions are blocked until device is probed again with unbind and bind operations:\n"
> > +			"echo '%s' > /sys/bus/pci/drivers/xe/unbind\n"
> > +			"echo '%s' > /sys/bus/pci/drivers/xe/bind\n"
> > +			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
> > +			dev_name(xe->drm.dev), dev_name(xe->drm.dev),
> > +			dev_name(xe->drm.dev));
> > +	}
> > +}
> > +
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index 1df3dcc17d75..0430bd51a5dd 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -455,6 +455,9 @@ struct xe_device {
> >  	/** @needs_flr_on_fini: requests function-reset on fini */
> >  	bool needs_flr_on_fini;
> >  
> > +	/** @wedged: Xe device faced a critical error and is now blocked. */
> > +	atomic_t wedged;
> > +
> >  	/* private: */
> >  
> >  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index cfa5da900461..0844081b88ef 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -633,6 +633,9 @@ static int gt_reset(struct xe_gt *gt)
> >  {
> >  	int err;
> >  
> > +	if (xe_device_wedged(gt_to_xe(gt)))
> > +		return -ECANCELED;
> > +
> >  	/* We only support GT resets with GuC submission */
> >  	if (!xe_device_uc_enabled(gt_to_xe(gt)))
> >  		return -ENODEV;
> > @@ -685,7 +688,7 @@ static int gt_reset(struct xe_gt *gt)
> >  err_fail:
> >  	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
> >  
> > -	gt_to_xe(gt)->needs_flr_on_fini = true;
> > +	xe_device_declare_wedged(gt_to_xe(gt));
> >  
> >  	return err;
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > index 93df2d7969b3..3a6075021542 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > @@ -236,6 +236,9 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
> >  {
> >  	struct xe_device *xe = gt_to_xe(gt);
> >  
> > +	if (xe_device_wedged(xe))
> > +		return 0;
> > +
> >  	if (xe_guc_ct_enabled(&gt->uc.guc.ct) &&
> >  	    gt->uc.guc.submission_state.enabled) {
> >  		int seqno;
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > index 6c37f4f9bddd..2047a49c71b7 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > @@ -638,6 +638,9 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
> >  	unsigned int sleep_period_ms = 1;
> >  	int ret;
> >  
> > +	if (xe_device_wedged(ct_to_xe(ct)))
> > +		return -ECANCELED;
> > +
> >  	xe_assert(ct_to_xe(ct), !g2h_len || !g2h_fence);
> >  	lockdep_assert_held(&ct->lock);
> >  	xe_device_assert_mem_access(ct_to_xe(ct));
> > @@ -1016,6 +1019,11 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
> >  	u32 *payload;
> >  	int ret = 0;
> >  
> > +	if (xe_device_wedged(xe)) {
> > +		ct->g2h_outstanding = 0;
> > +		return -ECANCELED;
> > +	}
> > +
> >  	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, hxg[0]) != GUC_HXG_TYPE_EVENT)
> >  		return 0;
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> > index 521ae24f2314..f4663f1b0a80 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> > @@ -902,6 +902,9 @@ static void xe_guc_pc_fini(struct drm_device *drm, void *arg)
> >  		return;
> >  	}
> >  
> > +	if (xe_device_wedged(xe))
> > +		return;
> > +
> >  	XE_WARN_ON(xe_force_wake_get(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL));
> >  	XE_WARN_ON(xe_guc_pc_gucrc_disable(pc));
> >  	XE_WARN_ON(xe_guc_pc_stop(pc));
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 13b7e195c7b5..0a2a54f69f50 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -705,6 +705,9 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
> >  	struct xe_device *xe = guc_to_xe(guc);
> >  	bool lr = xe_exec_queue_is_lr(q);
> >  
> > +	if (xe_device_wedged(xe))
> > +		return ERR_PTR(-ECANCELED);
> > +
> >  	xe_assert(xe, !(exec_queue_destroyed(q) || exec_queue_pending_disable(q)) ||
> >  		  exec_queue_banned(q) || exec_queue_suspended(q));
> >  
> > -- 
> > 2.44.0
> > 
