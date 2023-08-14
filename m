Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EE69C001B0
	for <intel-xe@archiver.kernel.org>; Mon, 14 Aug 2023 16:21:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B316010E087;
	Mon, 14 Aug 2023 16:21:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30BFE10E085
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Aug 2023 16:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692030084; x=1723566084;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=UeQZYKmRW7aX34PrEv3/Cv2R2axgfPsSHsmXDj3g32k=;
 b=kdXnlNIlrqcMQj1r8RpXSjV+4JdFHAsJ5pcY1vUKAcqBF6fg4iEe3k6S
 bSdMgG7GdRHDpZ9grpBIwgOUva6eLQE0CdE2Xm3xhs3mcWGyXIiKd45L5
 0zADFzTs3bITmiQAn/TCPxJMr7xGeUtA8unPg2ZU9V40eZ7wWVib6N5wm
 HnJftEiXqRmgZ5PI9sFw3N2wonyM+1txdyoDpPyGC75Zc/gUpLneT/Z8k
 d+cQEwzJcmurDwbd4Xy7xRM7hzideX73LjMn7LY4uI23/90Grh/4Una+y
 NuJ39yMxyIeFzuTfaxVyt0dj1FlXjfLTIHFA8zv/gE68ZMmsqD0ZpdaNj w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="438413754"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; d="scan'208";a="438413754"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 09:21:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="980037767"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; d="scan'208";a="980037767"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP; 14 Aug 2023 09:21:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 14 Aug 2023 09:21:00 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 14 Aug 2023 09:21:00 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 14 Aug 2023 09:21:00 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 14 Aug 2023 09:21:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i16dliEbM0F7ypJkPh7gezzGgP7wxZ0FLO//0VbnAajiMjd4pJ4kaEOiStoqi2Iov7P9ae+c9kCCYrjMVNLUSH9akbNDNyR4JniueI42vkIOS59SB2s6LzZNFrk4CwiuWJdY1b6Bn29L4vjvA2mzIIe8SZDzx2+9ZvyD9BWSSc4CX/goBFeRCLQVRP4H4hZDAJ5XHHVPxRk/fMZPzgQiq8YEkf4OC8rPskE/0+xJeMUKPYJxWXt4OC6uJ0YwPfODIHgp8JWmjp+3lZBOdF2eeA1EGDOm8qevVHP3/siwWPGr0N57tGb8i9rSw7168aFqgTGeu8vjndlnbv5sijF5Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yzXJs+mgHbLuuoD69T24ezkuincBdqIhQ0paRjIgLsI=;
 b=Sy2tVrUwq3u6ZaXk9rC8HyYrXIu5gfoqdn3jEvSrv/10itP3HsVVlckU8QbMjnpqvfWlGFvyCX/GpcUsfbhAb4s+LKqURytWp/Zm+aFdDrriI8QjL0snD1PRW7IWCcmRf4fdFGxTiPc/UmfApQeGKzHAOoE/zspPCkm91ri75q6tdIGpBYqKlibgmFBQxSJ1MuQAOaNJrOiK4uyZEnbT8Ww+hgREviq40e1H1wPO1SMLnFu2POTzpkbPXdOMWIiDwznN/5s1X8mwTYdqxLgxWas/VLa441vBgTFUlN0DjLhCG6ZBEBSMiRq3q6CeoErvVvaiZlDgrEhf4p8FOAc6Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by CH3PR11MB7818.namprd11.prod.outlook.com (2603:10b6:610:129::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Mon, 14 Aug
 2023 16:20:58 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::f7ed:4327:5d1a:b8fc]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::f7ed:4327:5d1a:b8fc%4]) with mapi id 15.20.6678.022; Mon, 14 Aug 2023
 16:20:58 +0000
Date: Mon, 14 Aug 2023 09:20:51 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: <intel-xe@lists.freedesktop.org>
Message-ID: <ZNpUYxwDevbOKZmq@nvishwa1-DESK>
References: <20230808182411.31354-1-niranjana.vishwanathapura@intel.com>
 <20230808182411.31354-5-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230808182411.31354-5-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: SJ0PR13CA0051.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::26) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|CH3PR11MB7818:EE_
X-MS-Office365-Filtering-Correlation-Id: 5258800c-f95b-41ca-8898-08db9ce27196
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sCB2wxHoSE5y+sZbEecyX6I+RRQzazlSyC/o7jFQ20hNxQ+fZUL7KphzpPd+SC1FRgC+GvsNeyaMBnlmhggqFDK/0f5KbPHN93hr2quxHiN3gDO7vUkfE3MGoz4Ddsk4FwK9tpgnpu7/g+JS/ki072Sl9BqevAQE+ThHk7jRvtAO5+fVCs2aj+W+VtnP61iL+UELTDrezEbn9NJQRCPZloIeWgUCqRVCpuxxlHS4IR/mxpnHl9GwQAcEttN9aR8X5IYILzDHjwoTtx+i7mmdR6+mQFmQfpzgbGfZd3EKBiaIpfV6NunT9tmJIZtkhoIK9Ov92c5186jPa4EOxZ6gOlqnYq+pAgR59ys/pqJ2edsiKsh4uNCKdcHFnsQj4qthiAy9jaU0bscX7Fhs1ft0eB8aIE/GmeYBG2piIMVxlM5wewQsbLx9grcZiEoV/OcZJTSczsr73o6qql/gfYWf3hGBBe40R+sZnS5qugNwrEPYZbrL2VbJkgSecjpmEkG6e/Mujz2uIdizHb6rfUknPhV6dax/cRigaHshmxtgWQdO+yiMCo1g0R9NQ0yH/QsY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(346002)(396003)(136003)(39860400002)(376002)(1800799006)(186006)(451199021)(33716001)(82960400001)(38100700002)(86362001)(6512007)(6506007)(9686003)(6486002)(6666004)(478600001)(44832011)(2906002)(26005)(83380400001)(316002)(41300700001)(66946007)(66556008)(66476007)(6916009)(5660300002)(8676002)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B8eaf0WkFZwtbBQIqojrIUwEuZ2iBBfdt9vcBXfkya58AOFW7FtZcY2YRmHH?=
 =?us-ascii?Q?GyOqns+p0yun2+7iXIEO34JbMzV/d613A65eaYOkPzvoFm98Vl0zkSFQ10dc?=
 =?us-ascii?Q?SttcChgiG6SvvPFDDNrstlF/kRQW/onxt6h5N4ALOZOKzyaAacgxmZP10Xvc?=
 =?us-ascii?Q?nDozCwPP6gtcHgB2iFR91BzdrEggqvyF+ZCXk/papZaoOQ+swUxLtjCy2b3z?=
 =?us-ascii?Q?NYMR8MijS0Qqm/52wYeD/WIHI5L/kzn3SSZGmj65LozCjdDY6FzYoh/OgybM?=
 =?us-ascii?Q?/uhUQUtwFgiH6kA8W/KuCq/V6KSqmAhXvY4qj3PVtYajeR2bAXaJWwUA8lIe?=
 =?us-ascii?Q?yhzE1VYlidY6GxmyoQPay7rJmcmtZq/82foYXOXRunSWQpXEv7vti4gxFBHw?=
 =?us-ascii?Q?fmNQ/sG8gI3g6Xj7PVsHfWKQD4mwu5lZz9vwTdvbyCj3EOjIwH8G9D/gBV97?=
 =?us-ascii?Q?F2+29uEv8MzqwquEtbiGYRTnEeoL61xN0PTW7PDRMV2POZFipXK5lmV4Si2w?=
 =?us-ascii?Q?YquHrm0nPrhW5UHtMoA0dd2rYP8ThTuPrZWe23mD8aeBjAgCO28jQkom8OFs?=
 =?us-ascii?Q?MJqldVMpyMEv1e4A1zbnlGcOME1OLLwH6nG2E+a+J7GwAA17XA28Drz5lVVT?=
 =?us-ascii?Q?arnfL3xj6YClavl3xbmMGAkFAyjbRmxIk2DxRbWuErD3wembOBHGCATCjjBC?=
 =?us-ascii?Q?+i+/QgUdMELO6PRO7FnQt3/8Xm6ZeCtH0cvpl70X6fj57R0f8br0NyhnPVg/?=
 =?us-ascii?Q?mfPXBy5X8q4r8jzXeHNt/w7Q5hMJrcUoqLjXkqIMJJdGMcjG9SnUcddMHA0L?=
 =?us-ascii?Q?97yvpdoZklSfj2VQmhjuq9B4n+IqdCnCi+8kJuAEH4qTzkozk6Qbbkb7gVyP?=
 =?us-ascii?Q?xypRXEQTbCh60X81oNa5aMAlP4NgBjDjQJEjy5jQVDWfpkv3LZO7krAAKkCl?=
 =?us-ascii?Q?kQMSQqsskFXzVIPfLZ8mSHvPG8/VIqnBncgVcgEDZHzo7FK77eedZ0L5CylU?=
 =?us-ascii?Q?2yBUFM/qP77mRJZZnPlrThv7es1EH2vrF/7jOCPBhl2nT4RlFDO5aSNL3G8t?=
 =?us-ascii?Q?eMp0szIBwbbwm3PhYAZfrLyXDy6FENkPrtCs9LscLtOeJKzrSBjwF7+FTzhZ?=
 =?us-ascii?Q?Rgw/Q2e6J1ocIJc70M2aR7MKWUaZVzuCaJEl1giyp8pgjYxNB1vtex/k99Xu?=
 =?us-ascii?Q?sjSIgTTLfQgYVCH83JDnVCg+TYJStw/4KxvyBt6gRmtK0m3Wh9OW3olJs0LY?=
 =?us-ascii?Q?1Ok2EwgKf/TZKs8PCKOO3CmFs5D8hlynlpHrp4UXKsehD6gdy24y18+qFlKZ?=
 =?us-ascii?Q?zDpXQEX3kUK4scioRMzQ2eqRcNY2Mqh6wQ0rDJdSn4a4ChXLUYkyUDeYKkHd?=
 =?us-ascii?Q?xnuJj1N1mKX+EIDqgJPsqo8ZEjMDmAXIxlS2Miahz1/yPtuMsiytKcKix6ui?=
 =?us-ascii?Q?AV6/h7/mUjGsBpRhD4m1Dv7BtAiWFf0XIcyqUv4b4YjyfojWemPcj+nuvkzn?=
 =?us-ascii?Q?ARLltQUgwcxO9Xr3Fu5eJW1EeKsZDxMjLhtLbzvpGqZlcXAJpYVW4/ut1O/1?=
 =?us-ascii?Q?4PC8CZlm0DWI+r6MMjmswxoanXuY5iuuseiAU1+KZSQbNmheFRlPT3H6kwYa?=
 =?us-ascii?Q?grtX8DKfQQHb0GBQc4k5mCs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5258800c-f95b-41ca-8898-08db9ce27196
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 16:20:58.6402 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZFeam2B+HkIsNJMaRInTuh6g3+AUTbWZVIkOFz8x54013ZvoFIXy03aopKtCGbOVm2v2T5nmDRwmbfm9GU28cDlGrbMCALDBW6iy4ZQEzOkuVvebJeiNS922w5PDi9N4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7818
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 4/4] drm/xe: Add DRM_XE_PREEMPT_TIMEOUT_COPY
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

On Tue, Aug 08, 2023 at 11:24:11AM -0700, Niranjana Vishwanathapura wrote:
>Allow preemption timeout for copy engines to be specified as a
>config option.
>
>If all copy engines are thrashing away at the PCIe bus, plus all
>compute engines doing the same, then the per copy bandwidth becomes
>tiny. That results in copy operations that should take milliseconds
>actually taking seconds. So bump the pre-emption timeout to allow for
>the worst case scenario (currently believed to be around 2s).
>

Will remove this patch as we don't want a universal BCS preempt timout
config that applies across all platforms.

Niranjana

>Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>---
> drivers/gpu/drm/xe/Kconfig.profile | 12 ++++++++++++
> drivers/gpu/drm/xe/xe_hw_engine.c  |  4 ++++
> drivers/gpu/drm/xe/xe_hw_engine.h  |  6 ++++++
> 3 files changed, 22 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/Kconfig.profile b/drivers/gpu/drm/xe/Kconfig.profile
>index 5ca3305a22b6..219e13d3fd25 100644
>--- a/drivers/gpu/drm/xe/Kconfig.profile
>+++ b/drivers/gpu/drm/xe/Kconfig.profile
>@@ -43,6 +43,18 @@ config DRM_XE_PREEMPT_TIMEOUT_COMPUTE
> 	  before the timer expires, the HW will be reset to allow the more
> 	  important context to execute.
>
>+	  Value should be within the DRM_XE_PREEMPT_TIMEOUT_MIN/MAX limits.
>+	  This is adjustable via XE_ENGINE_SET_PROPERTY_PREEMPTION_TIMEOUT.
>+config DRM_XE_PREEMPT_TIMEOUT_COPY
>+	int "Preempt timeout for copy engines (ms, jiffy granularity)"
>+	default 2500 # milliseconds
>+	help
>+	  How long to wait (in milliseconds) for a preemption event to occur
>+	  when submitting a new context to a copy engine. If the current
>+	  context does not hit an arbitration point and yield to HW before
>+	  the timer expires, the HW will be reset to allow the more important
>+	  context to execute.
>+
> 	  Value should be within the DRM_XE_PREEMPT_TIMEOUT_MIN/MAX limits.
> 	  This is adjustable via XE_ENGINE_SET_PROPERTY_PREEMPTION_TIMEOUT.
> config DRM_XE_PREEMPT_TIMEOUT_MAX
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>index 57a0fb50852c..34b1fdd24b0e 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine.c
>+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>@@ -343,6 +343,8 @@ static u32 get_default_preempt_timeout(struct xe_hw_engine *hwe)
> 	if (hwe->class == XE_ENGINE_CLASS_RENDER ||
> 	    hwe->class == XE_ENGINE_CLASS_COMPUTE)
> 		return XE_HW_ENGINE_PREEMPT_TIMEOUT_COMPUTE;
>+	else if (hwe->class == XE_ENGINE_CLASS_COPY)
>+		return XE_HW_ENGINE_PREEMPT_TIMEOUT_COPY;
> 	else
> 		return XE_HW_ENGINE_PREEMPT_TIMEOUT;
> }
>@@ -575,6 +577,8 @@ int xe_hw_engines_init_early(struct xe_gt *gt)
> 	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT > XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX);
> 	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT_COMPUTE < XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN);
> 	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT_COMPUTE > XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX);
>+	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT_COPY < XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN);
>+	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT_COPY > XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX);
>
> 	for (i = 0; i < ARRAY_SIZE(gt->hw_engines); i++)
> 		hw_engine_init_early(gt, &gt->hw_engines[i], i);
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
>index c4f0969efc06..66a611f4942a 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine.h
>+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
>@@ -41,6 +41,12 @@ struct drm_printer;
> #else
> #define XE_HW_ENGINE_PREEMPT_TIMEOUT_COMPUTE XE_HW_ENGINE_PREEMPT_TIMEOUT
> #endif
>+#ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_COPY
>+#define XE_HW_ENGINE_PREEMPT_TIMEOUT_COPY \
>+	(CONFIG_DRM_XE_PREEMPT_TIMEOUT_COPY * 1000)
>+#else
>+#define XE_HW_ENGINE_PREEMPT_TIMEOUT_COPY XE_HW_ENGINE_PREEMPT_TIMEOUT
>+#endif
> #ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN
> #define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN
> #else
>-- 
>2.21.0.rc0.32.g243a4c7e27
>
