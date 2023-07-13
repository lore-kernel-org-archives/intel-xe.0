Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 209B8C0015E
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jul 2023 20:41:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD28810E1A5;
	Thu, 13 Jul 2023 20:41:49 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AAFC10E080
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jul 2023 20:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689280907; x=1720816907;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cWT95pVnIOjzbRXa/TResj6yMM1+/j95NA5XRAJzElM=;
 b=AUV28jhQ1g+y4Q1PCN0y1Xhk+kIdzRz5cEoXh362GPi/PILtG7ZBht2g
 JywS7r4R/TSyGfb9VdFcjBhK8K+OT4LzSsWY9WoNLJ+gSQHVRT7kw17rz
 zfYx+IGMfBVJME4LaspzyrjLGXbmn7D03oPSOvZKxozs8+OushXSB8ck4
 gBlEl9LH3bz6Is8uD7fPNwJwgsqt8FPnpRCUjfeIskBYg8VB8rr/nSaN/
 XYf5NFFFFWD1QivZc6akTtgjkjtcOq1aIFAY0NiLqPj02soOpwyA2nXRc
 +jmMMSUgqcq1BpO1ZPNZI1bz8q1i6QEcfEckoJZH52C9NdD6Az4KUGmXE g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="396117802"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; d="scan'208";a="396117802"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 13:41:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="699399265"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; d="scan'208";a="699399265"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 13 Jul 2023 13:41:35 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 13 Jul 2023 13:41:34 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 13 Jul 2023 13:41:34 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 13 Jul 2023 13:41:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dyEGwNn7TDbEycAb8u0HE00tB1Q8XrubgZp4gbb6vfg4o05NkoBFKNe87d8Kc9kj8EOUAOrisiQ3jUoUj6Kel5gqV6fBOId4B1QeX2BQLS6OIcG+HbIrZcjFZkqxjjU93ZL4lGetBM+JdezWB+hX7g9CUqaC8MylVvvvAjO4Jdb2VAk/E0WIRmjC6c1gvQvJx7b0bnN3RePJpRlZPlk60vavPvwcBB9XDVeycgKqRuJ0gd9mVQlTVHXvdjd6ofCpA10IGi7FdoDWNBRbYMb/mru06Z/ns5cu96hMLUQIkfPFqWw5glcsUFCHHja1Ei2WnQ5hS3/rHEKWCQPThcVXNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QI/hxT/ZqRen+PE2QTdM8gZAqO18Rn1yvP2rNcSGOHY=;
 b=l2qLzZeHmmPgb7Ki+ZlRhD58NdTqDbq4SJTRcpQEbxc3FzXnkiw2Q6AuvkDDSCTjUmVK2EkABHMy6GcdvjkITm83uLLubr8pOQ+1UADAmvpffIa6+/LV8IE8lk8mWl3KPI7Y5fambFrpiJCgDTzNC4JPguhmBEIhT7O2qBc7rKhAf7ZjASYKlQuwJhUKF7IQOfCjce5XaME9PSX+G5FZuWWNYBuhhFfds3aoBhAkj74U9VMkepaqBxJWnSuyAoc4LAlUXyYiLw2oLyLV3Lbuy1BZOHzGdcGaNTB6PcVXa9U8i6s4XncNU8CiOitDrKDVeUXJcOs/ZFIYyf7DPIeBPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW4PR11MB5799.namprd11.prod.outlook.com (2603:10b6:303:181::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.31; Thu, 13 Jul
 2023 20:41:31 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2677:dfb9:456f:1227]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2677:dfb9:456f:1227%5]) with mapi id 15.20.6544.024; Thu, 13 Jul 2023
 20:41:31 +0000
Date: Thu, 13 Jul 2023 16:41:26 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Message-ID: <ZLBhdvHV+JHIKYKy@intel.com>
References: <20230713143121.3901357-1-anshuman.gupta@intel.com>
 <20230713143121.3901357-6-anshuman.gupta@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230713143121.3901357-6-anshuman.gupta@intel.com>
X-ClientProxiedBy: SJ0PR13CA0111.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::26) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW4PR11MB5799:EE_
X-MS-Office365-Filtering-Correlation-Id: c1be191b-3054-45fc-9917-08db83e18a39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0r7Xs8e130jYh/6H9YzesIVELvZOJvwCduNARPMcjeKz6vnruKmrdnTPt9hSc7TMOSn67j2P35iuFkFbXfZy7nFsqOwU8Equq0TaV34bexyKtgrphzNwo3L6wE+fWTOLtigVjOOX/iyk7vzLDkSfcPHC26N0Yv4kYRQP4YIlZrZ8mbsr3g45iHLAaI4z9tMo2Hk91WHg7TyrXx0IbXA63xK2EMtMpGjqXSY713jRUcKXokBU7Eynjwtd+a5G43hHBQJ0ArS+GjGMg0DTBeMET47zz5TvJbckm+KA+RjPlr7dvspnYbxvF1E5+qEzofL+hhrqU1G92Vc5V/mC+rJr7VlR52Eh5iF8gfBwWbvOVDWcdbro85EvxyqVmnqGH7VFq9Sgrrzf/1tgzTt/3SwsagWtwhyHHc+jzloAv5Z14aWqg3KxpNk1X4WHokTPmLmXDU93wlO0Aj7b9nlx6JkyeMbgg0Sm+2eGrGtAu0VL3U3JGzBn25DaO7/i6Q2FRj2xuUfrdQmlUjS2gKzTIImnmjvz8FEGPXDRU0eAUCOnqnTPJl/YWX7LWMr03tfKgEozkNvUL1EeeWaUuCc67phCMKl1iOkttBhCpnvDniRHVQQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(136003)(376002)(396003)(366004)(451199021)(6506007)(186003)(26005)(41300700001)(478600001)(37006003)(4326008)(6636002)(66476007)(66946007)(66556008)(107886003)(316002)(6512007)(6862004)(8676002)(8936002)(5660300002)(6666004)(6486002)(44832011)(2616005)(2906002)(83380400001)(38100700002)(36756003)(82960400001)(86362001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6WbEFWYGcFYZks0KAO6c/ZoAS5Qg6CFg9li5X2GAd7YMul3mmYhxNoshse+d?=
 =?us-ascii?Q?3jP7B/SLYRxr71YMVJO2SZEp0U7tWolew0Ql6IKzjlEav8/Vw4jxzJK22jkz?=
 =?us-ascii?Q?at6JGp67AZWn5YDWhDoGL8emiHNLhHGVJH/XFB7sjcAEx0NHqhkbz4Ux81oB?=
 =?us-ascii?Q?0fWIrLnDXOS8thGtKyzTIr1xon5sYQVbeZIUsvkheE9hHmwfvhoeqKCBi6Cf?=
 =?us-ascii?Q?xUQRP6K5vC+7wFuJZZRCkqaL1bVpN9FAFm5zrRduEqxOmaw08OSnKzuRRJmI?=
 =?us-ascii?Q?Y4i3ukJ6lZQ5xxW9c5wipVZJUw1zLy95q9xUYhursMDVDwJynkErGNiLKkFJ?=
 =?us-ascii?Q?KDp1U41xlyxKRP6fNKVoJMUpkd5AfuS2bRL/iM00rpQWwK1UdlVxoGTdC74Z?=
 =?us-ascii?Q?s9hzISDMVG0YinpBkhW7YYuDX1vUtrBqyJenE9fr3bF/X1hEnEu3ForDTwIE?=
 =?us-ascii?Q?NDjvnm1NqMwIaEABWHKJb5l4IRv75JaF0ajJ2NwBeDz0xqLNvCvliKt3z2ta?=
 =?us-ascii?Q?geH00ppmAgFgTmu/rFhxmZ3OfTXJxOGAuxrEdiGzQqsfQKpU1fVDcz1t9Vxx?=
 =?us-ascii?Q?RjilFkWdYkHbz/oPLmpXoJzNVdDgJEX0qlaf6VmUh5+3lMJw+O/AJ0HchI6m?=
 =?us-ascii?Q?FtWlINh5t83eowe8+s3cAXyppEZdDOmozks5Gv9A/vBtIkL8k2mwzDtStBin?=
 =?us-ascii?Q?B379PZpWejNS0d2fttIuDdxtZr28hKDjbifw7AwmIc8ZJgtitemZOsZDSMzC?=
 =?us-ascii?Q?gULM/x96vhROEIrqgpldSTHadzO7igRmrplOOVMJ6UcYMMPfJojIJS2EpggB?=
 =?us-ascii?Q?W40hCJTijqO06lEZiE9s9Nj7AyKWvS54f6ObF0rXANyBgxSdUJrF4gv09Wze?=
 =?us-ascii?Q?VyZLv+J38jd/284atKMSxXfjfieRy285eiFwvFBQD28+n7KL+l9nIaXwJHHm?=
 =?us-ascii?Q?m5I/ai2OVdLKLq4rprKPI3NIIWt3Z7DR/OACiIK6u5hK71E3FQb4TWxCuQ1s?=
 =?us-ascii?Q?zD7HbdlNuzm4V0+wJlfjZt3o7pE8sXTXULPHO50bnLoxwWTlrAMgDaQthfnQ?=
 =?us-ascii?Q?8F4FYjvPPhrd6QNb3G1yEaL4ow42jPLKMzDg5pFg2mN/Xclq8B5z7O4xD9TJ?=
 =?us-ascii?Q?JxruecEJSlmiP8sP1cDGcvqQQUhK2YBrTANJ99JyH3Y2kOPefAcxl6QcE757?=
 =?us-ascii?Q?6cZIDDC/NExGl2WgwytJXSOQbKnN/XKp2lKl32glQ2X+xMptG6+YpBWH8Asg?=
 =?us-ascii?Q?THltMKxZmj7hsKXS24jKilLUF8eMZ3fJE48SK8U5pNf7LbH7VGzT6PywTQv+?=
 =?us-ascii?Q?Qt4kaKnka2yicqhyFoGgXvVixZOuRVCCo1z9OrMUVI+N7xXEIjIe7aOCPRwv?=
 =?us-ascii?Q?p3pDsUr+3/iXn0DxGxatrd+6GvBAyLwC+BOwoYWMtl0B+eSFa/LCh4Upu1Uz?=
 =?us-ascii?Q?LJCckW/YELAcMrf//japJX1Jm3i1lcAyaJ8nuLtORrBhp2SkZzjrPeMtdAv5?=
 =?us-ascii?Q?ecGeXr+QonoybU7fjesaZ+PwgcYJgYnktTbwURnCTRWUkjnz1M7NxUwF3SPD?=
 =?us-ascii?Q?a49zN9k+irFZD8sS4EGvy7M66HbL3w4ULeACwj546leADevi2xPeysaSgZcV?=
 =?us-ascii?Q?YA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c1be191b-3054-45fc-9917-08db83e18a39
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 20:41:31.6119 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xHLx00GifalcQCYd7r0ceW0leBRXMUoRW6DCy0bkLDq6XHMqfNBUDSIpX6gStvMJ2hzuT6wz3+hoYv++Jm7fGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5799
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v5 5/5] drm/xe/pm: Init pcode and restore
 vram on power lost
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
Cc: sujaritha.sundaresan@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Jul 13, 2023 at 08:01:21PM +0530, Anshuman Gupta wrote:
> Don't init pcode and restore VRAM objects in vain.
> We can rely on primary GT GUC_STATUS to detect whether
> card has really lost power even when d3cold is allowed by xe.
> Adding d3cold.lost_power flag to avoid pcode init and vram
> restoration.
> Also cleaning up the TODO code comment.
> 
> v2:
> - %s/xe_guc_has_lost_power()/xe_guc_in_reset().
> - Used existing gt instead of new variable. [Rodrigo]
> - Added kenrel-doc function comment. [Rodrigo]
> - xe_guc_in_reset() return true if failed to get fw.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device_types.h |  3 +++
>  drivers/gpu/drm/xe/xe_guc.c          | 27 +++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc.h          |  1 +
>  drivers/gpu/drm/xe/xe_pci.c          |  2 --
>  drivers/gpu/drm/xe/xe_pm.c           | 13 +++++++++++--
>  5 files changed, 42 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index f2a6998e8873..89ac2bf482eb 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -355,6 +355,9 @@ struct xe_device {
>  		/** @allowed: Indicates if d3cold is a valid device state */
>  		bool allowed;
>  
> +		/** @power_lost: Indicates if card has really lost power. */
> +		bool power_lost;
> +
>  		/**
>  		 * @vram_threshold:
>  		 *
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 8245bbc58770..d6ad1bb85a0e 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -844,3 +844,30 @@ void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
>  	xe_guc_ct_print(&guc->ct, p, false);
>  	xe_guc_submit_print(guc, p);
>  }
> +
> +/**
> + * xe_guc_in_reset() - Detect if GuC MIA is in reset.
> + * @guc: The GuC object
> + *
> + * This function detects runtime resume from d3cold by leveraging
> + * GUC_STATUS, GUC doesn't get reset during d3hot,
> + * it strictly to be called from RPM resume handler.
> + *
> + * Return: true if failed to get forcewake or GuC MIA is in Reset,
> + * otherwise false.
> + */
> +bool xe_guc_in_reset(struct xe_guc *guc)
> +{
> +	struct xe_gt *gt = guc_to_gt(guc);
> +	u32 status;
> +	int err;
> +
> +	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (err)
> +		return true;
> +
> +	status = xe_mmio_read32(gt, GUC_STATUS);
> +	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> +
> +	return  status & GS_MIA_IN_RESET;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> index 74a74051f354..f64f22e97169 100644
> --- a/drivers/gpu/drm/xe/xe_guc.h
> +++ b/drivers/gpu/drm/xe/xe_guc.h
> @@ -35,6 +35,7 @@ void xe_guc_reset_wait(struct xe_guc *guc);
>  void xe_guc_stop_prepare(struct xe_guc *guc);
>  int xe_guc_stop(struct xe_guc *guc);
>  int xe_guc_start(struct xe_guc *guc);
> +bool xe_guc_in_reset(struct xe_guc *guc);
>  
>  static inline u16 xe_engine_class_to_guc_class(enum xe_engine_class class)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 871868301838..7bb5330ab2db 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -846,8 +846,6 @@ static int xe_pci_runtime_idle(struct device *dev)
>  		 * but maybe include some other conditions. So, before
>  		 * we can re-enable the D3cold, we need to:
>  		 * 1. rewrite the VRAM save / restore to avoid buffer object locks
> -		 * 2. at resume, detect if we really lost power and avoid memory
> -		 *    restoration if we were only up to d3cold
>  		 */
>  		xe->d3cold.allowed = false;
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index c732317b55cb..9a934674d470 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -17,6 +17,7 @@
>  #include "xe_display.h"
>  #include "xe_ggtt.h"
>  #include "xe_gt.h"
> +#include "xe_guc.h"
>  #include "xe_irq.h"
>  #include "xe_pcode.h"
>  
> @@ -197,7 +198,15 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>  	u8 id;
>  	int err;
>  
> -	if (xe->d3cold.allowed) {
> +	/*
> +	 * It can be possible that xe has allowed d3cold but other pcie devices
> +	 * in gfx card soc would have blocked d3cold, therefore card has not
> +	 * really lost power. Detecting primary Gt power is sufficient.
> +	 */
> +	gt = xe_device_get_gt(xe, 0);
> +	xe->d3cold.power_lost = xe_guc_in_reset(&gt->uc.guc);
> +
> +	if (xe->d3cold.allowed && xe->d3cold.power_lost) {
>  		for_each_gt(gt, xe, id) {
>  			err = xe_pcode_init(gt);
>  			if (err)
> @@ -218,7 +227,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>  	for_each_gt(gt, xe, id)
>  		xe_gt_resume(gt);
>  
> -	if (xe->d3cold.allowed) {
> +	if (xe->d3cold.allowed && xe->d3cold.power_lost) {
>  		err = xe_bo_restore_user(xe);
>  		if (err)
>  			return err;
> -- 
> 2.38.0
> 
