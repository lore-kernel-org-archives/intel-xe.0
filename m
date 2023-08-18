Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4E88C71143
	for <intel-xe@archiver.kernel.org>; Fri, 18 Aug 2023 12:59:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E7F210E0AD;
	Fri, 18 Aug 2023 12:59:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7C9D10E0AD
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Aug 2023 12:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692363554; x=1723899554;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8oPOWoEWc1sbVbHNxbb+htiYdRVpBIdzuPidsX/fiqs=;
 b=DNWHw/9u/E1IBE5u7GGLkl4qJg/Pri2bOJgs5hwgqNSL+0SWzsktqpaO
 VWfF7xHM7l5ND457bT01m1GKdugKK0VJROlXk4rctY7jvU21XuSd147di
 uPrYFZl2xOAJQZrCZV4PbdQ7MIRnVBQr8Y/anCJ7enQ7/N0Q+oCus8kkQ
 MIkoNeXFV28lmOLzA2ft4gsj5oTrwuxfSE6HEh3stN2m9KUoP8QwkjvvA
 fG3dSuizF6LYuuwMTMmVYUNj1qL2tSqyqfevJJYSLMTrYP2kVEBA27StV
 YlrhbZJ0XLveRB4ay1+kkvEMgMi2wyQMxrFh9toyUcip8XbRzLwuaysWQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="353397473"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; d="scan'208";a="353397473"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 05:59:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="770131502"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; d="scan'208";a="770131502"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP; 18 Aug 2023 05:59:13 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 18 Aug 2023 05:59:13 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 18 Aug 2023 05:59:13 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 18 Aug 2023 05:59:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RrGMV8ufl6Fdk7BSbMhVHdFSW5PeeJzp+Gexm+5Rh6HB8+3iilESDxbgRBj5YmU/cbwGAglmAFvpPT9l86Bcj/aIiKiVG27frbaZ8Zmv7FP7DIsckldvLiZkPTgKs1Fm8gJh2Y93Ox3KfuTi91LaEhFeQ42CZZXSs29foOwz2w1Ajdvv8x9gSv3qlFVSfAj6Cx11zOTdLyETg6QzY/KINq3X5/4QnpbMDHUpSSf0XFccI7CwBVIJGfY6IuhzfJt974/agZAH9j62iiTEiZUg05AyrQ+NiMixNKvrW90C6xRzR+0B350z0HOh8g4RnuRG7Km9fzPfOfIUiyEcsSeYdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pEZlCSiax5MCec1kN6ArqKbML6wZ8O+YfMeA0toTaQ8=;
 b=VHDRzy7tQ1+VUu2qBBU02Lg/dG+3tv2Z/+7pK/N5NucQ5HlAse16L8DfDSwQvFBY8D3LWIChFZ95nkoLOqi3W3JyEiJ8yrV20xs7L43ONq+f6I8epR3l+ipI/O/ZmMIZohQ+Xzg65OXifJA/pRfswejPAzl8+b8D9zIvnaGRc/T5cxDSFKT3u1W4BDHqg0cL2gs1Ibwmj9SgJbTVoSl4TrFOKx9JjY1UCflaGGdzw93U9RjSAhNJ3dPXdOgu5R7xd/dS9ok8ThGzOxZuxkX98KN+N+pIiJHJMJ2Hwao3YO7gxTQ3FD64lIeWH6rU/jE+nlIYZlVVvNNoIHsCOoeetw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB6945.namprd11.prod.outlook.com (2603:10b6:806:2a8::19)
 by SJ0PR11MB5893.namprd11.prod.outlook.com (2603:10b6:a03:429::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Fri, 18 Aug
 2023 12:59:10 +0000
Received: from SN7PR11MB6945.namprd11.prod.outlook.com
 ([fe80::9716:fa94:b58a:9a6a]) by SN7PR11MB6945.namprd11.prod.outlook.com
 ([fe80::9716:fa94:b58a:9a6a%6]) with mapi id 15.20.6678.031; Fri, 18 Aug 2023
 12:59:10 +0000
Date: Fri, 18 Aug 2023 05:59:02 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <ZN9rFgXcrSzEUD21@nvishwa1-DESK>
References: <20230817110352.7601-1-niranjana.vishwanathapura@intel.com>
 <20230817110352.7601-4-niranjana.vishwanathapura@intel.com>
 <20230817162906.GD3375865@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230817162906.GD3375865@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BYAPR01CA0072.prod.exchangelabs.com (2603:10b6:a03:94::49)
 To SN7PR11MB6945.namprd11.prod.outlook.com
 (2603:10b6:806:2a8::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6945:EE_|SJ0PR11MB5893:EE_
X-MS-Office365-Filtering-Correlation-Id: 718dfee5-f516-4b45-d878-08db9feae9e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ja8pM8LMr2IB6SJrCPsujUhjt7KpQjddnvyev8oCokfHoDpOiE8Ssh6Fb9rZf4ZFnVoY4VHe0dfJv502Dx8ng5S+UJ7JkD+m4RHLPLf2IK8ruMHb9gDyoGfq6BKm6ZOhncIA2KD4nVGT++lo013Hj9t/NkoIpWlsiaad6/2k0AoMw9uLaWpVeaXni3kPeQGuIRyZjq97ou5+fYKOhs2MCE1etfiAPYZRvL7VMud6iA7BnY+CnrGGqbzUQ+4tsRgCX79QKnask884jhg1ce0byk1PsV1awKV0zl1Usho3rLTw2iPeA0RoJDRld3x8TlXVEzY/7ghoow9na+O3z6jZghO6ktCcAAJCvKHVsrrpLkHLDZ3dHlnXtYywmQmFxzMKaicXFgOvX5/V9g2qAGwbFj82lDXX7EhhYRzXMXblCEKtjgrLJEsKl1FwpBMcAip3mM677hqRJZhhqKjY4QGcSfaW9zrgNQdWnzYXctZVe9S8q0y6azWavRhxn+AaTJjtq1EddA4SlVPv/WnPONp6oMgDIO9frJBlDrHk8G1unF8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6945.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(376002)(39860400002)(346002)(136003)(396003)(451199024)(186009)(1800799009)(33716001)(86362001)(83380400001)(8936002)(6862004)(8676002)(4326008)(5660300002)(2906002)(41300700001)(26005)(6666004)(6506007)(44832011)(107886003)(6512007)(6486002)(9686003)(966005)(478600001)(82960400001)(66476007)(316002)(6636002)(38100700002)(66946007)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QQjbhFcmTNzHSr1Lc7cczb5Nr/mXFXG48mkW90Li8V1s2GHmcHsXYhtEXaAS?=
 =?us-ascii?Q?tXuOGwIgIlVO9LRBHJvckhBQVg1VVkZlFqRKGxnq5QfApNViQZYh7ggLwBeb?=
 =?us-ascii?Q?Fg2hV0P2OI77w6GI0nWQuDGz9xMxZr2K3yveAQptt8zuLYo2wDrlSk0kNcmH?=
 =?us-ascii?Q?v6cI4MpRECkeFuhaki2Pr8TyovixsQOj/Bcu2yHLav+eknaHkr3B2NhcU4IX?=
 =?us-ascii?Q?d787Z5yDyfveYMYnUL91RmeBbq/yxPnGMlq5Idtk8qK5GwhLdYWquWVeW3B+?=
 =?us-ascii?Q?Lezb3iZMNvg2s41TKNh6WeIxiz6HbWzFx0wtnEDFk0aDgs+/Y2A7y3f3CK/d?=
 =?us-ascii?Q?Mz7iG273U/U6YJQXhoMl5tbO0tACtJTXDnfBmv3UEw+gGkVHqjOvworJAYqf?=
 =?us-ascii?Q?HiHRqV8jiCiItjvkltJ33xbfeBH2lw75sWouATr9Mg2FjYU4wOT/lxaI/DRs?=
 =?us-ascii?Q?kuTOIeaLFc1o/qShmh75av6BIOvPiW+ThtjYvks0DMeI1IQbrRhziB+zEFIS?=
 =?us-ascii?Q?HaLqfB054WmeXOE51oQDboW++YaIyWXnLrhs01Yrm5JjzbUmQbjLzpK/FeKH?=
 =?us-ascii?Q?I4mkhl2p9EZxlzMvuhDyLaNqSgxe/3AZvaJDoFVmaSgP33Rs8nMcMWoj+7lg?=
 =?us-ascii?Q?ttpYOFnsIM0N+x8Hv22xNk1niVdPgnrdQsakckM5uer3RXijWs/nzM1GmAz7?=
 =?us-ascii?Q?l6VoWkTdW40PB98o+1RFj4beUtNTvfBOg7Xma4sqc2TULDuGuBqUInr0db55?=
 =?us-ascii?Q?eH2uZmus+w8/+jTjFkr1bPy10/AUSPCadUIcSELR9B8yhLh5j9bUIe5bzWip?=
 =?us-ascii?Q?E1qBu+u5EBmVeWqX7D31unoJcJ8nhxQI75BVPTje0vlUVNUbJlURru13c+UQ?=
 =?us-ascii?Q?ouAZhRuTmFdxXsftp5Oheh9Wwr6b3AHT+zHTn1Z5xclwTOKBYYZyrKgR9mRr?=
 =?us-ascii?Q?fKpOfLxjgvLI8mRIEVvmznPvzA3PvapovtyvITQptpvMHlPlx4hsYLwLfr1+?=
 =?us-ascii?Q?LYuvxP7g8zq6KdlTh6Szku9ltsM3XlSEGMkgNvlnHE9QV0Y2Ba2u03t7KQBC?=
 =?us-ascii?Q?yHG3OAutWujLPJWF08SAGlu/o/e164MxbUUNqzY2L8i0nJRGzva4QHy4t8V4?=
 =?us-ascii?Q?nZTM6SifNC2OXPHtIPzxWrhj4g7ESgSJ2RGw87bqUuU2rGSGJZ9nM0b1+tAQ?=
 =?us-ascii?Q?G8yuhRWW8bb8W4218/3oQGp0Y6JbLcZMeqRKYDuxyAFziXB0jSz0SrzL4YoS?=
 =?us-ascii?Q?AUxWBptFFPSKiMHTY4lo6R8JGeW7SeCpfu4vCk8E2V9RxMOHBgJrvDDwJ/tU?=
 =?us-ascii?Q?tdmXRtWAecJ8LYYtwS6SKCWtuto1uLgZF7vFkKN+rZrukvJ12kpDjdu2ob4y?=
 =?us-ascii?Q?TJ1HShuUKJiBRbx33AFh4kNjGNuBu4tIpUKf8qWrb2fxK4oVxCSLP2OkXvDr?=
 =?us-ascii?Q?l7QA5x/e5Bce75y+kdRy9ENPNitep3RN/FcJmcOBSASVjNikVf77X9pe9rrY?=
 =?us-ascii?Q?dRA5q0w+vHBvcLzWSB9A01u228EzPvdF9nGvoJ7vYyKR8jTawGnbkKm+0Giz?=
 =?us-ascii?Q?6+r/wLvD/z1UG0RLQQsUsbrOMp9LWf5cQz8HMPYCRIj8dPIxo8wTyM/OvU6w?=
 =?us-ascii?Q?utBXc0g/8ZCnoA2nX1WGC2s=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 718dfee5-f516-4b45-d878-08db9feae9e9
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6945.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 12:59:10.0266 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gd0waPZ9v1GG+56DfOJpx92ERC9NDBYNlMMTwuXSL1dXPV19LhHOf8Sz0sDW0C26PagtabhTlqksRZCcMrpasdCT5BIUKZr+BgmvfLiuHu+/DPKaIpztAbwsfHbEkH9F
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5893
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 3/3] drm/xe/pvc: Use fast copy engines as
 migrate engine on PVC
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

On Thu, Aug 17, 2023 at 09:29:06AM -0700, Matt Roper wrote:
>On Thu, Aug 17, 2023 at 04:03:52AM -0700, Niranjana Vishwanathapura wrote:
>> Some copy hardware engine instances are faster than others on PVC.
>> Use a virtual engine of these plus the reserved instance for the migrate
>> engine on PVC. The idea being if a fast instance is available it will be
>> used and the throughput of kernel copies, clears, and pagefault
>> servicing will be higher.
>>
>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_hw_engine.c | 31 +++++++++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_hw_engine.h |  1 +
>>  drivers/gpu/drm/xe/xe_migrate.c   |  7 ++++---
>>  3 files changed, 36 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>> index 4c812d04e182..00329efbd968 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>> @@ -791,3 +791,34 @@ bool xe_hw_engine_is_reserved(struct xe_hw_engine *hwe)
>>  	return xe->info.supports_usm && hwe->class == XE_ENGINE_CLASS_COPY &&
>>  		hwe->instance == gt->usm.reserved_bcs_instance;
>>  }
>> +
>> +/**
>> + * xe_hw_engine_migrate_logical_mask - Return logical mask for migrate engine.
>> + * @gt: gt instance
>> + *
>> + * On PVC, due to workaround 16017236439, odd instance hardware copy engines
>> + * are faster than even instance ones.
>> + * This function returns the mask involving all faster copy engines and the
>> + * reserved copy engine to be used as logical mask for migrate engine.
>> + * Including the reserved copy engine is required to avoid deadlocks due to
>> + * migrate jobs servicing the faults gets stuck behind the job that faulted.
>> + */
>> +u32 xe_hw_engine_migrate_logical_mask(struct xe_gt *gt)
>> +{
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	u32 logical_mask = 0;
>> +	struct xe_hw_engine *hwe;
>> +	enum xe_hw_engine_id id;
>> +
>> +	/* Only support this function on PVC for now */
>> +	if (XE_WARN_ON(xe->info.platform != XE_PVC))
>
>Here you warn if the platform isn't PVC...
>
>> +		return 0;
>> +
>> +	for_each_hw_engine(hwe, gt, id) {
>> +		if (hwe->class == XE_ENGINE_CLASS_COPY &&
>> +		    (hwe->instance & 1 || xe_gt_is_usm_hwe(gt, hwe)))
>> +			logical_mask |= BIT(hwe->logical_instance);
>> +	}
>> +
>> +	return logical_mask;
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
>> index 71968ee2f600..edee71e26c57 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_engine.h
>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
>> @@ -52,6 +52,7 @@ void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec);
>>  void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe);
>>  u32 xe_hw_engine_mask_per_class(struct xe_gt *gt,
>>  				enum xe_engine_class engine_class);
>> +u32 xe_hw_engine_migrate_logical_mask(struct xe_gt *gt);
>>
>>  struct xe_hw_engine_snapshot *
>>  xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe);
>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>> index 956a96b38346..cb9a82d13089 100644
>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>> @@ -338,11 +338,12 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
>>  							   XE_ENGINE_CLASS_COPY,
>>  							   primary_gt->usm.reserved_bcs_instance,
>>  							   false);
>> -		if (!hwe)
>> +		u32 logical_mask = xe_hw_engine_migrate_logical_mask(primary_gt);
>
>...but here you call the function unconditionally on all platforms...
>
>> +
>> +		if (!hwe || !logical_mask)
>>  			return ERR_PTR(-EINVAL);
>>
>
>...and here we fail out if logical mask isn't set (which is will never
>be on non-PVC).
>

This patch was derived from the below earlier work.
https://patchwork.freedesktop.org/patch/528460/?series=115575&rev=2

It was discussed there.

We should be fine here as currently only PVC Platforms call this
xe_hw_engine_migrate_logical_mask() function. The reason for having a
warning there is to detect any issue while supporting any future platforms
so that we fix that immediately.

>I think you probably want an OOB workaround for some of this logic (see
>xe_wa_oob.rules); then you can do something like
>
>        if (XE_WA(gt, 16017236439))
>
>to guard any code that should only be executed on platforms where this
>workaround applies.
>

Hmm...the previous patch in the series adds this WA (16017236439) as a
engine_was (to be moved to lrc_was). I would like to keep that as that
does the register update nicely (instead of adding additional code for
that).

If at all we need, we need to check here whether that engine/lrc WA is
active. But as you mentioned, XE_WA() only works for OOB WAs.
We could add a duplicate OOB WA here (with same number 16017236439).
But not sure if that is a good idea.
Or, we can add a function to check if a engine/lrc WA is active by
doing the name comparision (instead of XE_WA()). Third option is to
support generating WA index numbering for engine/lrc WAs also (similar
to OOB), so that we can use some macro similar to XE_WA().

What do you suggest?
I think we can leave the code as is for now as it gets called only
for PVC.

Niranjana

>
>Matt
>
>> -		m->q = xe_exec_queue_create(xe, vm,
>> -					    BIT(hwe->logical_instance), 1,
>> +		m->q = xe_exec_queue_create(xe, vm, logical_mask, 1,
>>  					    hwe, EXEC_QUEUE_FLAG_KERNEL);
>>  	} else {
>>  		m->q = xe_exec_queue_create_class(xe, primary_gt, vm,
>> --
>> 2.21.0.rc0.32.g243a4c7e27
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
