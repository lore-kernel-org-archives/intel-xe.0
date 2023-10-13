Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AD43CDB47E
	for <intel-xe@archiver.kernel.org>; Fri, 13 Oct 2023 18:09:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1614B10E621;
	Fri, 13 Oct 2023 18:09:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 471DB10E621
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Oct 2023 18:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697220596; x=1728756596;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9ZrIyz1PX7lQmKM1ldnEuvGIAvo4SXRCF03ACxi8w+8=;
 b=eRbqnD3zi1WAESthCzfRtf2eiZYJB+QexTFajGAJJpweHqCCNp/pQVJs
 F3IVsudvVCXkBPEONOrAHd9EQp9WeBTUadYKu1mqn0wKfnpmN7t8EAYVu
 LNaLXDU4VAiwpytHhtv0HNGX2SJ9qEqWgSWEg8GM/DcZ+zwr/ViHduvdY
 XjTisSpcfgdWmqrSHCvkMwpazTX07+e5OcDjNXPmw0KqCkLqHng9bfPf4
 cJJBcRWuWQSkWxWGw/0rj9UF/Fd3l4iObLeJmZRcBFtBGGdJAnuvOT9cU
 AR+CTzgD1ZcAfIW0Xh1VkNlv9DDeVe5NcTrMGiWITf6AyFhSotB959Apy Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="388084978"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; d="scan'208";a="388084978"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 11:09:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="820732096"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; d="scan'208";a="820732096"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Oct 2023 11:09:55 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 13 Oct 2023 11:09:55 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 13 Oct 2023 11:09:55 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 13 Oct 2023 11:09:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TU0hNzVvo+q/ZvmzB+9L4F5NFk5IO1QqrMJ7ZENrdFyBXh1voxwwEc2JnZkYY4S/t4oo5KoMpT+bNiMrYDz46KyV8lSxNYzfaQ01p4cJPryO56AEbhK6Awsn+EK5lZFXso+3Y5Uqx4bH4wU93++8kH3hzTfdEX/E5mX9xqbhSIfx3IA8cKzJPBUU8SqKTbsorTmX90VjoBROv9ZRDE8obyJUhBw03ez6IQf45IvW9Z+awMXbUW4cG2HiaiDDbp+BgpypFOAbWvIbopUesrsmS1568qWQib7eu8amurBu+tXc7bXipXqQ8QR4KRb4yhUHfsdWD73rsQULq9kWqIQ8Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0HtwzCytjZ8fhg/DXIHmMQSXxdoK6trcUMHaaf4lIS0=;
 b=XTYMdyczB6C6PFnQAOxieKGVZBL1cpefR/Yux++6ifNFMDfSfbR4liseAVTIaja9bomKHNtfl/QCwtSvvEujWX6Zk1OxDDOrbJNYnu1x5UsDkZqTP7mwkgz7G/YwfSnSO/yTV7LJE2p3co6dO45fs2dKkkwmrKfKrdleZ8G3C0P/HovMqtavdmTKZWiHP0kBqOo+6Xw2BzEES2SFHXzdaacTdLOBi6t0H5r6r6M9B1M8SwQv3SN8DnU0aJ5BuKsbZAgI64mDQTK6enl4UWvxMg4qD0CTNBk0j2TCX13eyNH10J55xYS7bLFIGMM9Pzhs2LbMhHKGQdp3GfJN8Oub6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 SJ2PR11MB8324.namprd11.prod.outlook.com (2603:10b6:a03:538::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Fri, 13 Oct
 2023 18:09:52 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::cd4f:fe89:df17:61d]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::cd4f:fe89:df17:61d%5]) with mapi id 15.20.6863.046; Fri, 13 Oct 2023
 18:09:52 +0000
Date: Fri, 13 Oct 2023 11:09:42 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Message-ID: <ZSmH5uTHcva2DJsQ@unerlige-ril>
References: <20230919161049.2307855-1-ashutosh.dixit@intel.com>
 <20230919161049.2307855-7-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230919161049.2307855-7-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BYAPR11CA0097.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::38) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|SJ2PR11MB8324:EE_
X-MS-Office365-Filtering-Correlation-Id: d94e281f-2814-48e8-cda3-08dbcc1798b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OvuBoLSSfVxqqaaKLpSYQoTKSvWgcHRnnymvwLI3qaVS3xyDPBJx00R4ccfD6XXAM+K6SU2MCJYh/8SEfAUcZLXrn9iQVOJXH3yIP1OwRf5LayR90r0C76GqwLArEz05YNWAD7gEJp8Wq2bS85KBvqAGZyBIJy3SCrZ5R2xg7Q09FLmxqmAeIc7ZHDTSE+UYF4Wb4w53/W0f+pNU54ckXWmIZQQTEjwAPB1MGSquDmVIs+XBCy7tQo2qVyWbbgpehK+4VnIV4b6NLlrPIXpdwGqsYAHwX04CAPDw6D+YaIJgqQjjTboiCXpy02pxM//dEciMcB75TMsbaF74sltjIXL+Z2jjMvR1TQEuXRFhp/omySmNerI1DiS3MbQpwfj5vycc81FYrjBWPsWkako3akVRqjEF3SyuABh4GspVDf8XLuD+dQ/3f9vVMTsrx5gKfZYD0lLIMSphdSH1w1JrSeVWY6fYhODGQWS7K2QsKoY8R/vewNVhtntP41Jx2XET3G0Xm9QcrWu5RxUyzKMYN/2Rg3bAvr7N1qV8J9QN/tHmAyj4fL+FI6OOZ42tixrC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(39860400002)(376002)(136003)(366004)(396003)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(5660300002)(41300700001)(8936002)(4326008)(8676002)(6862004)(86362001)(82960400001)(2906002)(83380400001)(478600001)(33716001)(26005)(9686003)(6506007)(6512007)(6666004)(66556008)(66946007)(38100700002)(66476007)(6636002)(6486002)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVJybE1wUDRNQUpKQ3Y1OUtCYXcwMnBpT0dDVXhTenU0NmovNzM1dGpaVVp6?=
 =?utf-8?B?cWNMdnVrczFEbWltcWc0R0VTaENJWk03S1g0clNjNGNwRUV5Q00zUU1XMGhS?=
 =?utf-8?B?NUwyWEhQTDhHbjh3UmtnSUhhb0dOSUdQVHArcFFHc1RhMWx0bFdCNnJsS1Bu?=
 =?utf-8?B?eFZycklRMlpXWWVFRWE0aWJOblVLeWZXYkp6R0VpOElOazd0RUs4TkN2eGNk?=
 =?utf-8?B?TkpUR20zdDc5OFFFYll4aWtzbU81Z29OS2dUZVBDSEpQdmRCejJkQmc1OEE4?=
 =?utf-8?B?bC9xTTBSMnlzSk01ZFZrdHIxcGYwemNlVFJpeFZjNlNVVkgrNUw0RlkwM2g1?=
 =?utf-8?B?L04yUkVFSCtxSjhpUzVVdEltaEtoeElZdHNodVprRWIyUHZ5VkZEb1dlU3NJ?=
 =?utf-8?B?TEkxN3JuN3pyR0Uzd01FSkZuS21Jb0h0TmdvT1Vyb0JvMmJTWjBKUlFhblVw?=
 =?utf-8?B?dUxYQUJhelBhVjFlM3VGd21MOVFVWjhZMWlCOWpEZkI0UE9ualRZVHVrT2Zn?=
 =?utf-8?B?NWRMTk8yZ0hUOW54ZXpVeU55NWtjNjVRQjRTWEZwYmxuSGhQK0ZBT0V2aTU5?=
 =?utf-8?B?amlNMzZzZWFyMXZ0dmZ3Nys0VnJYL3piVGZLdlhCNndQMzlPSHBlWXo1amp5?=
 =?utf-8?B?akZqT1lERWNrT090TFVCbHZEUWd0dlRVS01sUDd6ZzJRVXp2VitHQURwS0Vt?=
 =?utf-8?B?N0hPVnFwc3hUZHBhZHZmbW9lUTBBNy91bGxJNE82N3lMQ253cmxvT1ErOVc0?=
 =?utf-8?B?a2I3TkF5TjVDSDFVZ0Vvcnl5cU4yZGEvdCt4TFROKzlxN0FHRDdpNDcwdDBm?=
 =?utf-8?B?Q09DYThmVS81VHBGMkVMYVJiVndaMzdyM0RlZ3hrdGVRSmVDSzl3ZndMU3Vu?=
 =?utf-8?B?aUFHbGRjUnB3TXRBaktodms3OHlQOEJTOHZtandrblEwejZESTdRMnVHV1hh?=
 =?utf-8?B?Q0xlWFM1bzIzTWk3ekFoTkRBVTlCWDVsM1k4ZDI3YXlVTFNHa0daamZQRmw3?=
 =?utf-8?B?aFJFWHBOTW5FYklhZHcxdXBNQmcvZ2RZaERHTXF0Znl1OGxLNzF0REliRmZk?=
 =?utf-8?B?T3Rma3RKWW9uTWdSejNsMGo5dkU4cVQ3aUw0MEQ1NndOSnplVlZaTC82cnhT?=
 =?utf-8?B?ejAvZG5MZkFyV2hQQjczRzNvSkhsZ2ZIRHFGZ1V2ZWI1aWtSR1h1VGJXaEhI?=
 =?utf-8?B?TU16eVBFL1BFNnF4WFlGaVJYV0RZM3F2aXFFRVArdXB4ZTU1NFBCVXlVaGh3?=
 =?utf-8?B?d0NNSHk0bVpJbXZTNHNLUk9MUHgrR01CcUg1cyt1akFSWkZHYndid1RXaGNV?=
 =?utf-8?B?M1EzdWVseGtrT3MxSUtvMHl6RDVVUFFEblFua3FkQzhNcTBJeEVkbm5TVjRI?=
 =?utf-8?B?eGdzOURXOUpicjFzS2ljVHMwOXluZFFMZEI1REZIYlplV1BTQnNxMU94TVlj?=
 =?utf-8?B?SmVtM0pVWG5aRGhIVi90R3p5UjIwZGxOSHZMTDZGa2Nqbkt1NVgySnk3c040?=
 =?utf-8?B?VVYxL3JQUzhMaVFyMWtPd1JiM1BONDZqTENveVVKakp1SUtXWVMzdHZpR05D?=
 =?utf-8?B?bTA3d3hDM0xDTEpvRVBqNitYNnU3MnZHYlNlYmtTVERacFhuRHhMMjdhK1Q1?=
 =?utf-8?B?TXJTL0prcmVFT2MxeFpta1M4WnNiWm1Sd2JkUmQzOVhhM1NvZDR5eklOSHJ4?=
 =?utf-8?B?VFA5K1oyVThXRlp3SjRXQjU3VFRBc3dWUlhjcXpsSEdyYUR3aElSU1VaTVcx?=
 =?utf-8?B?YkRVMnI3VHpUMlkrbjFWcGsxSVh5ZnRtTm5Qcmc4REVIYlNLcVAyV3krNjlV?=
 =?utf-8?B?Tms1TkIzWkQ2SitLS2lBb0k4dmV5UTM3dFBieXR5eWdUZkxwQ2xpb0ZCNjU5?=
 =?utf-8?B?WVFIbTJIZ1lvNk5aSzJwK1NsUmoxb05jQ0JwZGR3eWZJNVRaU08yNldDUGkx?=
 =?utf-8?B?VEk4bURaUFNndlpQa2E4dG10T1hSaUJIOXBybnJFaE9RMlNIY0FYN0UvaVpK?=
 =?utf-8?B?UklFWFBXQ1FVSUl3eGtrbGZsdFZDZEtiZFdHUXVSaHhPSzloanRDbklSVkN0?=
 =?utf-8?B?N3NxaXAyYWhva1pwNmZyRnc5azZZQXhtcGNZdEN0L2Y0dmt2MUtrbmx6WW5P?=
 =?utf-8?B?blpwNTh1TUdmRml3bXNaRTBFVWJiM0xUNHNqODBLdStVRnJrcE5MNlgvZDIr?=
 =?utf-8?Q?8pJGgMrJbYDm3yBAisp/9PY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d94e281f-2814-48e8-cda3-08dbcc1798b6
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2023 18:09:52.2953 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vkeFuUp4J5r+VfOGa6XbWCbIMVL/ISA6CwSh1K55eP4fgT+2vrSM2F1pJrxTfyH0gZJHrwLPj2M7kA382H0xx4IYQs+dpl1zIIQCtVD9tnE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8324
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 06/21] drm/xe/oa: Start implementing OA
 stream open ioctl
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Sep 19, 2023 at 09:10:34AM -0700, Ashutosh Dixit wrote:
>Start implementing OA stream open ioctl and parse properties passed in as
>part of OA stream open. The remaining operations associated with OA stream
>open continue in subsequent patches.
>
>v2: Include PVC in xe_oa_timestamp_frequency
>    Remove forcewake_get from reading RPM_CONFIG0
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

lgtm, largely similar to i915,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> drivers/gpu/drm/xe/xe_device.c |   1 +
> drivers/gpu/drm/xe/xe_oa.c     | 239 +++++++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_oa.h     |   2 +
> 3 files changed, 242 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index aacca14e52b11..7a179c4515633 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -115,6 +115,7 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
> 			  DRM_RENDER_ALLOW),
> 	DRM_IOCTL_DEF_DRV(XE_VM_MADVISE, xe_vm_madvise_ioctl, DRM_RENDER_ALLOW),
>
>+	DRM_IOCTL_DEF_DRV(XE_OA_OPEN, xe_oa_stream_open_ioctl, DRM_RENDER_ALLOW),
> 	DRM_IOCTL_DEF_DRV(XE_OA_ADD_CONFIG, xe_oa_add_config_ioctl, DRM_RENDER_ALLOW),
> 	DRM_IOCTL_DEF_DRV(XE_OA_REMOVE_CONFIG, xe_oa_remove_config_ioctl, DRM_RENDER_ALLOW),
>
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index 1963bc6fad10e..c0ff8c2319ac0 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -11,11 +11,16 @@
> #include <drm/xe_drm.h>
> #include <drm/drm_drv.h>
>
>+#include "regs/xe_gt_regs.h"
> #include "regs/xe_oa_regs.h"
> #include "xe_device.h"
> #include "xe_gt.h"
>+#include "xe_mmio.h"
> #include "xe_oa.h"
>
>+#define DEFAULT_POLL_FREQUENCY_HZ 200
>+#define DEFAULT_POLL_PERIOD_NS (NSEC_PER_SEC / DEFAULT_POLL_FREQUENCY_HZ)
>+
> static u32 xe_oa_stream_paranoid = true;
> static int xe_oa_sample_rate_hard_limit;
> static u32 xe_oa_max_sample_rate = 100000;
>@@ -31,6 +36,21 @@ static const struct xe_oa_format oa_formats[] = {
> 	[XE_OAM_FORMAT_MPEC8u32_B8_C8]		= { 2, 128, TYPE_OAM, HDR_64_BIT },
> };
>
>+struct xe_oa_open_properties {
>+	bool sample;
>+	bool single_exec_q;
>+	u64 exec_q_id;
>+
>+	int metrics_set;
>+	int oa_format;
>+	bool oa_periodic;
>+	int oa_period_exponent;
>+
>+	struct xe_hw_engine *hwe;
>+
>+	u64 poll_oa_period;
>+};
>+
> static struct ctl_table_header *sysctl_header;
>
> static void xe_oa_config_release(struct kref *ref)
>@@ -53,6 +73,225 @@ static void xe_oa_config_put(struct xe_oa_config *oa_config)
> 	kref_put(&oa_config->ref, xe_oa_config_release);
> }
>
>+/*
>+ * OA timestamp frequency = CS timestamp frequency in most platforms. On some
>+ * platforms OA unit ignores the CTC_SHIFT and the 2 timestamps differ. In such
>+ * cases, return the adjusted CS timestamp frequency to the user.
>+ */
>+u32 xe_oa_timestamp_frequency(struct xe_device *xe)
>+{
>+	u32 reg, shift;
>+
>+	/*
>+	 * Wa_18013179988:dg2
>+	 * Wa_14015568240:pvc
>+	 * Wa_14015846243:mtl
>+	 */
>+	switch (xe->info.platform) {
>+	case XE_DG2:
>+	case XE_PVC:
>+	case XE_METEORLAKE:
>+		xe_device_mem_access_get(xe);
>+		reg = xe_mmio_read32(xe_root_mmio_gt(xe), RPM_CONFIG0);
>+		xe_device_mem_access_put(xe);
>+
>+		shift = REG_FIELD_GET(RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK, reg);
>+		return xe_root_mmio_gt(xe)->info.clock_freq << (3 - shift);
>+
>+	default:
>+		return xe_root_mmio_gt(xe)->info.clock_freq;
>+	}
>+}
>+
>+static u64 oa_exponent_to_ns(struct xe_oa *oa, int exponent)
>+{
>+	u64 nom = (2ULL << exponent) * NSEC_PER_SEC;
>+	u32 den = xe_oa_timestamp_frequency(oa->xe);
>+
>+	return div_u64(nom + den - 1, den);
>+}
>+
>+static bool oa_format_valid(struct xe_oa *oa, u64 format)
>+{
>+	if (format >= XE_OA_FORMAT_MAX)
>+		return false;
>+	return test_bit(format, oa->format_mask);
>+}
>+
>+static bool engine_supports_oa(const struct xe_hw_engine *hwe)
>+{
>+	return hwe->oa_group;
>+}
>+
>+static bool engine_supports_oa_format(const struct xe_hw_engine *hwe, int type)
>+{
>+	return hwe->oa_group && hwe->oa_group->type == type;
>+}
>+
>+#define OA_EXPONENT_MAX 31
>+
>+static int xe_oa_read_properties_unlocked(struct xe_oa *oa, u64 __user *uprops,
>+					  u32 n_props,
>+					  struct xe_oa_open_properties *props)
>+{
>+	const struct xe_oa_format *f;
>+	u64 __user *uprop = uprops;
>+	bool config_instance = false;
>+	bool config_class = false;
>+	u8 class, instance;
>+	struct xe_gt *gt;
>+	u32 i;
>+	int ret;
>+
>+	if (!n_props || n_props >= DRM_XE_OA_PROP_MAX) {
>+		drm_dbg(&oa->xe->drm, "Invalid number of xe perf properties given\n");
>+		return -EINVAL;
>+	}
>+
>+	props->poll_oa_period = DEFAULT_POLL_PERIOD_NS;
>+
>+	/* Defaults when class:instance is not passed */
>+	class = XE_ENGINE_CLASS_RENDER;
>+	instance = 0;
>+
>+	for (i = 0; i < n_props; i++) {
>+		u64 oa_period, oa_freq_hz;
>+		u64 id, value;
>+
>+		ret = get_user(id, uprop);
>+		if (ret)
>+			return ret;
>+
>+		ret = get_user(value, uprop + 1);
>+		if (ret)
>+			return ret;
>+
>+		switch ((enum drm_xe_oa_property_id)id) {
>+		case DRM_XE_OA_PROP_EXEC_QUEUE_ID:
>+			props->single_exec_q = true;
>+			props->exec_q_id = value;
>+			break;
>+		case DRM_XE_OA_PROP_SAMPLE_OA:
>+			props->sample = value;
>+			break;
>+		case DRM_XE_OA_PROP_OA_METRICS_SET:
>+			if (!value) {
>+				drm_dbg(&oa->xe->drm, "Unknown OA metric set ID\n");
>+				return -EINVAL;
>+			}
>+			props->metrics_set = value;
>+			break;
>+		case DRM_XE_OA_PROP_OA_FORMAT:
>+			if (!oa_format_valid(oa, value)) {
>+				drm_dbg(&oa->xe->drm, "Unsupported OA report format %llu\n",
>+					value);
>+				return -EINVAL;
>+			}
>+			props->oa_format = value;
>+			break;
>+		case DRM_XE_OA_PROP_OA_EXPONENT:
>+			if (value > OA_EXPONENT_MAX) {
>+				drm_dbg(&oa->xe->drm, "OA timer exponent too high (> %u)\n",
>+					OA_EXPONENT_MAX);
>+				return -EINVAL;
>+			}
>+
>+			BUILD_BUG_ON(sizeof(oa_period) != 8);
>+			oa_period = oa_exponent_to_ns(oa, value);
>+
>+			oa_freq_hz = div64_u64(NSEC_PER_SEC, oa_period);
>+			if (oa_freq_hz > xe_oa_max_sample_rate && !perfmon_capable()) {
>+				drm_dbg(&oa->xe->drm,
>+					"OA exponent would exceed the max sampling frequency (sysctl dev.xe.oa_max_sample_rate) %uHz without CAP_PERFMON or CAP_SYS_ADMIN privileges\n",
>+					  xe_oa_max_sample_rate);
>+				return -EACCES;
>+			}
>+
>+			props->oa_periodic = true;
>+			props->oa_period_exponent = value;
>+			break;
>+		case DRM_XE_OA_PROP_POLL_OA_PERIOD:
>+			if (value < 100000 /* 100us */) {
>+				drm_dbg(&oa->xe->drm, "OA timer too small (%lluns < 100us)\n",
>+					value);
>+				return -EINVAL;
>+			}
>+			props->poll_oa_period = value;
>+			break;
>+		case DRM_XE_OA_PROP_OA_ENGINE_CLASS:
>+			class = (u8)value;
>+			config_class = true;
>+			break;
>+		case DRM_XE_OA_PROP_OA_ENGINE_INSTANCE:
>+			instance = (u8)value;
>+			config_instance = true;
>+			break;
>+		default:
>+			drm_dbg(&oa->xe->drm, "Unknown xe oa property ID %lld\n", id);
>+			return -EINVAL;
>+		}
>+
>+		uprop += 2;
>+	}
>+
>+	if ((config_class && !config_instance) ||
>+	    (config_instance && !config_class)) {
>+		drm_dbg(&oa->xe->drm, "OA engine class/instance parameters must be passed together\n");
>+		return -EINVAL;
>+	}
>+
>+	for_each_gt(gt, oa->xe, i) {
>+		props->hwe = xe_gt_hw_engine(gt, class, instance, false);
>+		if (props->hwe)
>+			break;
>+	}
>+	if (!props->hwe) {
>+		drm_dbg(&oa->xe->drm, "OA engine class and instance invalid %d:%d\n",
>+			class, instance);
>+		return -EINVAL;
>+	}
>+
>+	if (!engine_supports_oa(props->hwe)) {
>+		drm_dbg(&oa->xe->drm, "Engine not supported by OA %d:%d\n",
>+			class, instance);
>+		return -EINVAL;
>+	}
>+
>+	f = &oa->oa_formats[props->oa_format];
>+	if (!props->oa_format || !f->size ||
>+	    !engine_supports_oa_format(props->hwe, f->type)) {
>+		drm_dbg(&oa->xe->drm, "Invalid OA format %d type %d size %d for class %d\n",
>+			props->oa_format, f->type, f->size, props->hwe->class);
>+		return -EINVAL;
>+	}
>+
>+	return 0;
>+}
>+
>+int xe_oa_stream_open_ioctl(struct drm_device *dev, void *data,
>+			    struct drm_file *file)
>+{
>+	struct xe_oa *oa = &to_xe_device(dev)->oa;
>+	struct drm_xe_oa_open_param *param = data;
>+	struct xe_oa_open_properties props = {};
>+	u32 known_open_flags;
>+
>+	if (!oa->xe) {
>+		drm_dbg(&oa->xe->drm, "xe oa interface not available for this system\n");
>+		return -ENODEV;
>+	}
>+
>+	known_open_flags = XE_OA_FLAG_FD_CLOEXEC | XE_OA_FLAG_FD_NONBLOCK | XE_OA_FLAG_DISABLED;
>+	if (param->flags & ~known_open_flags) {
>+		drm_dbg(&oa->xe->drm, "Unknown drm_xe_oa_open_param flag\n");
>+		return -EINVAL;
>+	}
>+
>+	return xe_oa_read_properties_unlocked(oa, u64_to_user_ptr(param->properties_ptr),
>+					      param->num_properties,
>+					      &props);
>+}
>+
> static bool xe_oa_is_valid_flex_addr(struct xe_oa *oa, u32 addr)
> {
> 	static const struct xe_reg flex_eu_regs[] = {
>diff --git a/drivers/gpu/drm/xe/xe_oa.h b/drivers/gpu/drm/xe/xe_oa.h
>index 79f77f445deb0..fd6caf652047a 100644
>--- a/drivers/gpu/drm/xe/xe_oa.h
>+++ b/drivers/gpu/drm/xe/xe_oa.h
>@@ -16,6 +16,8 @@ int xe_oa_ioctl_version(struct xe_device *xe);
> int xe_oa_sysctl_register(void);
> void xe_oa_sysctl_unregister(void);
>
>+int xe_oa_stream_open_ioctl(struct drm_device *dev, void *data,
>+			    struct drm_file *file);
> int xe_oa_add_config_ioctl(struct drm_device *dev, void *data,
> 			   struct drm_file *file);
> int xe_oa_remove_config_ioctl(struct drm_device *dev, void *data,
>-- 
>2.41.0
>
