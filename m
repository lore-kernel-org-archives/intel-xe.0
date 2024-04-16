Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5663CC4345F
	for <intel-xe@archiver.kernel.org>; Tue, 16 Apr 2024 23:21:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A1F4112EFB;
	Tue, 16 Apr 2024 23:21:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b0oiK+aa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09227112EFA
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Apr 2024 23:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713309683; x=1744845683;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=8xJRhrdoCl/h9zeanxrQpU5D9jcT4eA+yFuFPhTBqJM=;
 b=b0oiK+aa2GUNT9TcNLqFes453NpI2mINV1hkSz+3LUtz7+AHDZA1RiWI
 RzNFTgwEA2cHF/ahpEGTVE6LgB+6QEoNv8yoV0QKTZa/+JgxArqnu0pFE
 Q23oDmiGkq6kHpA/kZsQCIEdaNTVkjOQEcdrWS4FOjUHj45SgC1bhlJqn
 aXycT9iQBIljPOh6F/LeEvOEuQY0Bvtnu4uaO4eLatpkqCnY8PzHHrAUk
 bNfwqH9jVOPCRHAAM+tJei/i4olJdNnl4HjrFYBaexa3EHfCEAggGkxcd
 ZCJPeCdLD6VtNL6Y3O0qBeGRVTOn0xLUy/n9SbksQgSF+Tn0avKYSTojW Q==;
X-CSE-ConnectionGUID: LDGvlGrRSK+EwIdvfR0PZw==
X-CSE-MsgGUID: 61B/5MLCQmW2orbbeeKWkw==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="9332589"
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; 
   d="scan'208";a="9332589"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 16:21:03 -0700
X-CSE-ConnectionGUID: pVy74/aqQkuqz1GwNBTNXA==
X-CSE-MsgGUID: CeYvFwVtRwyoYiSUR/F2JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; d="scan'208";a="27222745"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Apr 2024 16:21:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 16:21:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Apr 2024 16:21:02 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Apr 2024 16:21:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DgdNOog4tmYltd51+aPK2jacFoH7Lmnyv4KcckC+Rj8+iFfWiCj8hx4TTYVfKqXueGOX+Ki7kIbEjG/07nX8s8Dew0pDHPJwxfDlaBGY9tkIIGXngmO8y2SVF6i9Nw/KNpTWw8z6QRxXN/KtcM0xXDJNOug3Nb3lO4GgLbndBwaN5BZyOy5rKG0Yd1M3dblz+ykJ6NPBPhgJmxj+95U7C9PeyqAEhg+Yvi3QrW4pxNCNjV/isvEaiSzgdLVgsQPWqCP+rx42vDwxJOOerYdd0pmyXIOYx1awLC10Wsmc84dP1EX+ERy0fYDHFueoxhH4EStmnWLLP0tj0h9YP0jiuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VkkyztXBs8GtYZzrSp6BLZ8C23KR4GmRSmOPf+J50QU=;
 b=dKZZM5qKYV4jWFxV+4UnN1hz6ZCpDqbWOJmaGbW+l/TA2RRT8+DrkLFYjNq3+0vFssLI8iesN24qXydbIw+uVlR/6VztBkmCAjwuSVeoQjq9oLWJrtdfMTsbNfwr4RmyrTip8UMUGep9wnqKv5Q94CYGpvSiCC7OcsvB+aXe6zTRfsYMVCx6MSXIJBSVT/fBe7A+3SArGkKjN/RUiiByFVUCBmBG9mIeLg0hBxXduw45cXObjdXzo5JuMXEkCUQ0rdMHcWUPYT0u19qcOpNdQfijaWPEHrgja9IYEsHmnRn91Ag8xGa4u4D87DMeqMKpOvuRfAEJcW+YrytcmxZVqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DM4PR11MB7208.namprd11.prod.outlook.com (2603:10b6:8:110::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7430.46; Tue, 16 Apr
 2024 23:21:00 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::cc14:a507:b02c:b551]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::cc14:a507:b02c:b551%7]) with mapi id 15.20.7472.025; Tue, 16 Apr 2024
 23:21:00 +0000
Date: Tue, 16 Apr 2024 16:20:54 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH 6/7] drm/xe/client: Print runtime to fdinfo
Message-ID: <Zh8H1t7gwFUFkQtn@orsosgc001>
References: <20240416030454.3739862-1-lucas.demarchi@intel.com>
 <20240416030454.3739862-7-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240416030454.3739862-7-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR04CA0144.namprd04.prod.outlook.com
 (2603:10b6:303:84::29) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DM4PR11MB7208:EE_
X-MS-Office365-Filtering-Correlation-Id: ad39de11-b800-4796-6204-08dc5e6be095
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PRJ/09iB9wZEhcEIouNbDuX3Ihoi3SRYvuzg8Fr7I9KWTCFBmT7KJp+S29IdTn9COCeP9/eOZAD3pGvtKPONE+IcXMWX7xNP6GNm/TDVxhAeIlyAgAYEl+wSIHMEkMBnWoxKjcSBBLsnWJonXdOr6EWF49roIeQoNuAkuD8CcHBBIjjTdkKo9R7on6cFBpjkR2j2O40mHiIx3Qkw1Kzjx8etIwLFG3Uaq++v0Hin6WFAf7is9T9PBMSSgl+zDQ2ei0Zk7nG43gm3bwvRpR0BVKTWvRiXeKpv397w1X2wCmZnDKUWwiMup+rte9IArSx9Oz45RvoDhcyQM/ZvUzyaTX7mt0V/dySuRXUjlXmwkOpOSOiDtdYi9oGbbktvf+dTgnodCGLTkotF+Ba1SN5wFwIjstQ1E15/cZWSWeqcbevKgUZi8qV6GUy0Cx1DbF8IS35UEr2vLyIEKtWflp4kbB06hc2KsfvdGhYPYFt7gaDGaIUXHWREjAnZvdgjVNoPo8RU8Z5OgZLT2wltm8qb78uUl8H+kXaWjYa0cQoUAL0Zdnc3Bv7xymlzDSU8m0Yg2T4s26qGZINLTqfbcNuFo57+h+5uCMWPX4v8R3BXb+gDvoMBP6if9H069/MWdWP/YczlB6bwm/ocQQWInQL6OyCU+2Xu5I1R+ZSLZCmk5C4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzhjRk0zcGJCeE9rRWNuVEpiQ2lrS1JCNU9CWHNhdzdtZG1iZ1RHUzRyS0pU?=
 =?utf-8?B?VTVQQTVNZTd4MG9IR1RPbUhaQnJBMEpzYlFTeXBtSHBTVloxNnBKTDAvQS91?=
 =?utf-8?B?T3ZPa1E3eGNWME5NTXFTcXp4SWttN0g0VHJNTzNXWExQVU1LTEFRam04V0Uz?=
 =?utf-8?B?dnFvSDhxNGJ2YVpFZUFWTGZsWmpuMU15TGVzdXl5QU8rRnp1eExNd1FRZ2dO?=
 =?utf-8?B?NmQzQUtoc2FKMXlVNmdlQTA4TjMyY0pRQTJWOHQxNGFveG9BcW1uZWgrN3Zh?=
 =?utf-8?B?YXJnY0ZBQVk3K2NGb1dZQ3lpdHJFWXVaTXRrTzVKNWh2VisvYmszdit2S1Jv?=
 =?utf-8?B?S3BnTjc4RWNOYWZoT3krbHd6ZlYzOGc5UnhxQjA0dzN3Ykt2YkY3RXJKRWM0?=
 =?utf-8?B?VXo0UGduakM3cGxxRTlLSnhnRUp6S2psdVViTjlMWkdnckQ1WGlhcS9LT0tp?=
 =?utf-8?B?NnFObGtyaTVNWEhlMjlzT2Y5bVVRSlU2Ni9SbDZYRUFXZk1tQ2FxSVQ1NzFJ?=
 =?utf-8?B?SVdEZnM5azlEZ1FQVHVpbHkxME95TWMxRzhvQ05KWm5wRjZYTDJ5Tjc4emNX?=
 =?utf-8?B?YW1ZOFkxR2k2cGVMNzRXK1NUS1RLM0JDakF1U25kRUxpWFoyRnJzTkhmZXBN?=
 =?utf-8?B?Vm5lVWFGTmlvNkt5UlZZNGpiN0I5M0VnZHV3VDFOMVU4KzZiQWgxOUJsY3Rs?=
 =?utf-8?B?WU5GakNLS2VFdmN5Nm1WNnBJbkZWQ0kxRk51b28wT0pzeFZPY0EyYmJERERC?=
 =?utf-8?B?LzV4Zk5BcFdSWWcwWlVWTDdLRzVsZzdBY09MeG5CTkZ0Yi96aEd2MWFFVDE0?=
 =?utf-8?B?Vnl0cEZWdlEwSzVKSExPeTdHVFNiV0pDZXh3c3RhazRzUnB1TEhUd0xhN0Vw?=
 =?utf-8?B?T1QxdmFEeFNXeGgvVFB3UWY5enpWcGppSFN3dXRJOENJYXRkSmYra2tJWVhF?=
 =?utf-8?B?MVorRFM0S3JiVWY5SEZoTXB4NmtQclQ1bkl5VkZhenV4MmpJWnRValVYcm5Y?=
 =?utf-8?B?alZmSHdnWHI4TDN5a1EySVBwRmVPMXFlOVFtbDNjYWRsbitLcFB2aVlTbHNk?=
 =?utf-8?B?MEp5ck1nQ1NMTHBoVEd5cUl2UitvZFlWUU1EUFFYTlg3QlZ6eTc2Z1YrYTFm?=
 =?utf-8?B?bkNmZjdmS2grNGVnVURoUjR6YXBIWkQwUUwySFZzS29nMWdJQWdtREdHSDVW?=
 =?utf-8?B?dzhsbDllQmhyU1UvTVpkd2lZM2lWTXJYUldSTCt2UHR1VE5vaVJOdjIveHBj?=
 =?utf-8?B?Tm1RMXdBdUJUMDgydmU5YWFiQm84aXJwS0tpanMrbFYxSkNJZXcxeWljOE9a?=
 =?utf-8?B?MGZHOTdQbVBCOUJSQjRoeVVMa2R1b3ZORThVU3U3TXpCODVINFMvMlVBeFY1?=
 =?utf-8?B?eTNnNnRjSjJaRlI4TkRiSWZYdS80d3p1ZWpJSTFYQWVvNU1hdlR0ZkZoem8v?=
 =?utf-8?B?bUdxOEErM0U1OEVDMGU2SWdpTDhNcU5MWnpHM3VKM1V2ZUMyTENjWUU3ZE5Y?=
 =?utf-8?B?UTNwa3hmZGVhSHN3RzQwcHE3SnZPd3gvajk4MXRCTFYrSy90ek5NdjArRFJP?=
 =?utf-8?B?REEyMmhST0hFVTNZVVdCeVdheTBBWGUwZCtISURHQzNFc2lkR0FUcU5ZaUVU?=
 =?utf-8?B?SzRLaTRSZENQc2ZoclQ5MytFa2lEc3dRSGR0SHZ1QlR2SU9rMUQ2bkRNTDVL?=
 =?utf-8?B?dGZCdzRDM0VQRmx5MXEzUmtLQlhtdE40UjBpWWU0NjlRZmpZS2NvRDhvTXdk?=
 =?utf-8?B?U2h5U24ycEFZWmZuRDkzNTUyTDl4RVpxak1jT05hcXI1SmpnQ3ZZQnh6eDJU?=
 =?utf-8?B?NEY0R1VHQVFadFZPSUErV1lxa2dER0tmcFRlNDVhT1IzejNjY01JTnJLVTNj?=
 =?utf-8?B?UTlvV0ZBSHNIR1Y4a1hpK3poeGVOMU5vRytjY3lOZW9uckJvZHhLeFNPMXFF?=
 =?utf-8?B?Z2t6dDhlYUJBWHFheVZuOSttb1B6VzdPQ0x2OTBtZ2Q0V2pVam9WREMvRUVJ?=
 =?utf-8?B?RmFCNTBEZVdrcncwMUdvczBVK3RweDNCa0M2UG55NUZzUEFZaE9tUnpIQkJX?=
 =?utf-8?B?dFJJWGN1ZVR3cUxwb2tMYUlOYThibWlDYkFrWFlrazlNNzhUMlZPU1ZDVWFh?=
 =?utf-8?B?akxnWldTd2hsVTB5U2xOZFdvZUw2aGRZMVlCOHFkMFBBa3dvTWdBZ3VrcVNp?=
 =?utf-8?Q?4wPGQqJI0UxflReJYdcL9P0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ad39de11-b800-4796-6204-08dc5e6be095
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:21:00.3431 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qJlh/phxzjcZhRo3kvKub6gId08Chd8Mn816PZ1s790+lNw3ZiVCqAbR+/DWRM/L4Ax9L10rDbIKHaVeppRJar4PtepCQyCbOAOB8xLHW0k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7208
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

On Mon, Apr 15, 2024 at 08:04:53PM -0700, Lucas De Marchi wrote:
>Print the accumulated runtime, per client, when printing fdinfo.
>Each time a query is done it first does 2 things:
>
>1) loop through all the exec queues for the current client and
>   accumulates the runtime, per engine class. CTX_TIMESTAMP is used for
>   that, being read from the context image.
>
>2) Read a "GPU timestamp" that can be used for considering "how much GPU
>   time has passed" and that has the same unit/ref-clock as the one
>   recording the runtime. RING_TIMESTAMP is used for that via MMIO.
>
>This second part is done once per engine class, since it's a register
>that is replicated on all engines. It is however the same stamp. At
>least for the current GPUs this was tested one. It may be simplified,
>but in order to play safe and avoid the cases the clock is different in
>future for primary/media GTs, or across engine classes, just read it per
>class.
>
>This is exported to userspace as 2 numbers in fdinfo:
>
>	drm-engine-<class>: <GPU_TIMESTAMP> <RUNTIME> ticks
>
>Userspace is expected to collect at least 2 samples, which allows to
>know the engine busyness as per:
>
>		    RUNTIME1 - RUNTIME0
>	busyness = ---------------------
>			  T1 - T0
>
>When calculating the overall system busyness, userspace can loop through
>all the clients and add up all the numbers.  Since the GPU timestamp
>will be a little bit different, it's expected some fluctuation on
>accuracy, but that may be improved with a better hardware/GuC interface
>in future, maintaining the UAPI.
>
>Another thing to point out is that it's expected that userspace reads
>any 2 samples every few seconds.  Given the update frequency of the
>counters involved and that CTX_TIMESTAMP is 32b, it is expect to wrap
>every 25 ~ 30 seconds.

I think the worker I had implemented in my original patches (as well as 
i915 implementation) may have been confusing.

32 bit counter ticking at 19.2 MHz should wrap around in 223.696 
seconds. The worker on the other hand was overcompensating for it and 
running at 1/8th of this wrap around time.

> This could be mitigated by adding a workqueue to
>accumulate the counters every so often, but it's additional complexity
>for something that is done already by userspace every few seconds in
>tools like gputop (from igt), htop, nvtop, etc.
>
>Test-with: https://lore.kernel.org/igt-dev/20240405060056.59379-1-lucas.demarchi@intel.com/
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> drivers/gpu/drm/xe/xe_drm_client.c | 81 +++++++++++++++++++++++++++++-
> 1 file changed, 80 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
>index 08f0b7c95901..79eb453bfb14 100644
>--- a/drivers/gpu/drm/xe/xe_drm_client.c
>+++ b/drivers/gpu/drm/xe/xe_drm_client.c
>@@ -2,6 +2,7 @@
> /*
>  * Copyright © 2023 Intel Corporation
>  */
>+#include "xe_drm_client.h"
>
> #include <drm/drm_print.h>
> #include <drm/xe_drm.h>
>@@ -12,7 +13,10 @@
> #include "xe_bo.h"
> #include "xe_bo_types.h"
> #include "xe_device_types.h"
>-#include "xe_drm_client.h"
>+#include "xe_exec_queue.h"
>+#include "xe_gt.h"
>+#include "xe_hw_engine.h"
>+#include "xe_pm.h"
> #include "xe_trace.h"
>
> /**
>@@ -179,6 +183,80 @@ static void show_meminfo(struct drm_printer *p, struct drm_file *file)
> 	}
> }
>
>+static const u64 class_to_mask[] = {
>+        [XE_ENGINE_CLASS_RENDER] = XE_HW_ENGINE_RCS_MASK,
>+        [XE_ENGINE_CLASS_VIDEO_DECODE] = XE_HW_ENGINE_VCS_MASK,
>+        [XE_ENGINE_CLASS_VIDEO_ENHANCE] = XE_HW_ENGINE_VECS_MASK,
>+        [XE_ENGINE_CLASS_COPY] = XE_HW_ENGINE_BCS_MASK,
>+        [XE_ENGINE_CLASS_OTHER] = XE_HW_ENGINE_GSCCS_MASK,
>+        [XE_ENGINE_CLASS_COMPUTE] = XE_HW_ENGINE_CCS_MASK,
>+};
>+
>+static void show_runtime(struct drm_printer *p, struct drm_file *file)
>+{
>+	struct xe_file *xef = file->driver_priv;
>+	struct xe_device *xe = xef->xe;
>+	struct xe_gt *gt;
>+	struct xe_hw_engine *hwe;
>+	struct xe_exec_queue *q;
>+	unsigned long i, id_hwe, id_gt, capacity[XE_ENGINE_CLASS_MAX] = { };
>+	u64 gpu_timestamp, engine_mask = 0;
>+	bool gpu_stamp = false;
>+
>+	xe_pm_runtime_get(xe);
>+
>+	mutex_lock(&xef->exec_queue.lock);
>+	xa_for_each(&xef->exec_queue.xa, i, q)
>+		xe_exec_queue_update_runtime(q);
>+	mutex_unlock(&xef->exec_queue.lock);
>+
>+	for_each_gt(gt, xe, id_gt)
>+		engine_mask |= gt->info.engine_mask;
>+
>+	BUILD_BUG_ON(ARRAY_SIZE(class_to_mask) != XE_ENGINE_CLASS_MAX);
>+	for (i = 0; i < XE_ENGINE_CLASS_MAX; i++)
>+		capacity[i] = hweight64(engine_mask & class_to_mask[i]);
>+
>+	/*
>+	 * Iterate over all engines, printing the accumulated
>+	 * runtime for this xef per engine class
>+	 */
>+	for_each_gt(gt, xe, id_gt) {
>+		xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>+		for_each_hw_engine(hwe, gt, id_hwe) {
>+			const char *class_name;
>+
>+			if (!capacity[hwe->class])
>+				continue;
>+
>+			/*
>+			 * Use any (first) engine to have a timestamp to be used every
>+			 * time
>+			 */
>+			if (!gpu_stamp) {

gpu_stamp is not required if the intention is to read the timestamp once 
per class (as per commit message) because you are already setting 
capacity to 0 below.

Umesh

>+				gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
>+				gpu_stamp = true;
>+			}
>+
>+			class_name = xe_hw_engine_class_to_str(hwe->class);
>+
>+			drm_printf(p, "drm-engine-%s:\t%llu %llu ticks\n",
>+				   class_name, gpu_timestamp,
>+				   xef->runtime[hwe->class]);
>+
>+			if (capacity[hwe->class] > 1)
>+				drm_printf(p, "drm-engine-capacity-%s:\t%lu\n",
>+					   class_name, capacity[hwe->class]);
>+
>+			/* engine class already handled, skip next iterations */
>+			capacity[hwe->class] = 0;
>+		}
>+		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>+	}
>+
>+	xe_pm_runtime_get(xe);
>+}
>+
> /**
>  * xe_drm_client_fdinfo() - Callback for fdinfo interface
>  * @p: The drm_printer ptr
>@@ -192,5 +270,6 @@ static void show_meminfo(struct drm_printer *p, struct drm_file *file)
> void xe_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file)
> {
> 	show_meminfo(p, file);
>+	show_runtime(p, file);
> }
> #endif
>-- 
>2.43.0
>
