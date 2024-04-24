Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 148EFC4345F
	for <intel-xe@archiver.kernel.org>; Wed, 24 Apr 2024 03:21:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C717A11277C;
	Wed, 24 Apr 2024 03:21:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lBjyigUX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A2DD11277C
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Apr 2024 03:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713928876; x=1745464876;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1dNJ/S2jl/7wFtIYlQJmpKhRkLSaD/U+RnveHW/Wvo0=;
 b=lBjyigUXYvsTTQu74flCx+4UjmNMHzsOpwMBhbg2UeYr+BomlnLWuo1e
 1ngLXy3L5lLZ6z3tuUFm0rN84WfohhUqwMcoGD+/FbbWYWzG/oAoQpGrW
 XGVXsPrX0kK+lK7UWABACy07AlV/8uNZsdM1AzteUYBkRI92kipnVL1iD
 qsaihuhbtmHZ//zyFauBGf7zVmKJzGrt1Jkr93sH2cQ2wqskY+zeR5UVI
 r+l+MgPxbrkM4hf40bcKfkhGuWibJ8QDDbt8mvNU1PjFJ8LHi2D/VR5ZO
 KJ1NN7Qpjq2Vl25LCiFfagdk2ntZtfMQefLgxDMsgOB1+mCHtjk4fEjV5 Q==;
X-CSE-ConnectionGUID: clZ6BmevQEeA/Uud7lrW9w==
X-CSE-MsgGUID: qiTwGkH5QmW3SUj/HuZS3A==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="10081490"
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; d="scan'208";a="10081490"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 20:21:15 -0700
X-CSE-ConnectionGUID: 2VGN5Lt8QzirLCM+B754Tw==
X-CSE-MsgGUID: PceDRrUDSGKO/4bBN7YmUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; d="scan'208";a="24615420"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Apr 2024 20:21:12 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 20:21:10 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Apr 2024 20:21:10 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Apr 2024 20:21:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GR/tsyv4zLF3D9vHHL4ZRXX4VgwZTF4VdVrSH/3bv+btZZTVui3DqZzUge7ocE6PHAgImH0R8u3zTlr980QdQSH+KppkQy5CcC/+33pjfHXNOPFCZIa6oVS4Kcz++0ZbPSC1nkvOW4R+MKKjJMTNetAL/3R5uao/1SmZLaKaHZOaJV8gzOOyk1zdAbCds6rOWKZcH9UwGWooegfx88DZuXqE4MWM9GM7DknbT5cATuhI0wwpChABOFDTQ7Unri3vzl6KbP16G5wDlj3wQPEE3Vvrd9a4kjeC9Tss7t2Tegg3UhvWrj8nbWEqT3N1JPIqPGGcjcLe6GJ02oE6HjrnLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=giko0Q9DSGlxHYshzBWqNWdfeeT0ejckZbX4CkgRS3c=;
 b=mbHHPhWMr9o9Hg3bvN3EVyM+pmu8fan36QoVPf8BNs1zPerRmL1Zhgvmz/KTlhDplapwtg4g2/iMgpgqeLilDuQEr+xG2nCWODoMynOQUzh1rQ+bPeOjNKUOjh/awntOfQxFMgrKSYx9aXkJlKurmwyWiGMmxxhugvVUiX0G844edIkzjf1bKN8z/itVPugY4c9U7CTNd6CZx4JOWAHGDp02qVgFK3KRAriXWCb8FTGSnLGlZ4DWwWLlT4CIDE6hHP4ZJkornAFYmMJWEUrI9pVJq60rUKKVXKkIn5tPzGXjKkLnKqc92sqMTfr6jwNVYXkSlFV5TDMKDcarQAb7qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB5098.namprd11.prod.outlook.com (2603:10b6:806:11c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Wed, 24 Apr
 2024 03:21:08 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7519.020; Wed, 24 Apr 2024
 03:21:08 +0000
Date: Wed, 24 Apr 2024 03:20:34 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Brian Welty <brian.welty@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Use distinct error code in VM_CREATE for device
 fault mode checks
Message-ID: <Zih6go8i/0CJ9TIU@DUT025-TGLU.fm.intel.com>
References: <20240423234707.6587-1-brian.welty@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240423234707.6587-1-brian.welty@intel.com>
X-ClientProxiedBy: BY3PR05CA0021.namprd05.prod.outlook.com
 (2603:10b6:a03:254::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB5098:EE_
X-MS-Office365-Filtering-Correlation-Id: c677b7a3-eee5-408e-0dad-08dc640d9567
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+zSgdAOx0sPLMdWhUY/qG30nW4hjjw57WiPxFAH888rpKICjcrtrzK+uxA8p?=
 =?us-ascii?Q?QUp0kRaerpVgr/46ZdxN6HKBDD935qk/CCTajxh+EZWEYsYlECrwTl1svYV0?=
 =?us-ascii?Q?mmJsQNsSd64AyPKuhwvP5ERpOEBy3ll8oqXuzF92zBBB+PQwTnoEQQIdu8wC?=
 =?us-ascii?Q?566r1N9iL7d75qNL/KuMgx9XFCXKUjw0+lqJywCnDSxI3D3Jk7RTwao22f1/?=
 =?us-ascii?Q?2ulj5wpMPZMQc/HEQ94ZawqEXeXG20CcA1D1H3XvLiHrxmZRwJUrg1xKr0MC?=
 =?us-ascii?Q?V0N1Brc9XiQZXJ9MpYAfeH1SqlH6FalX/K6KjBsAwy4oSI0rhQDgVbEfTOLm?=
 =?us-ascii?Q?XOSDcD/34A1Yx8WTC1soAlyEpVEx8nhYxuUyrAqzd0X/L7oP4fQGQao+JQxi?=
 =?us-ascii?Q?k1FkZKPhGbF2doYZ17hA88o5xvvCmciDWR6UYUuSIeg3bvpmo8XqfTff2ket?=
 =?us-ascii?Q?y05TVCt5yuJd1eUxj61IVGmrWKCjvkroql4sm1E0RHA7CcCIwso2FvAZpAXV?=
 =?us-ascii?Q?2QJoo8wP0iaAdk4qrfRun1nzaF4KTQBuXFadNeEVjqTe5hp7TQzVCq0tF+s9?=
 =?us-ascii?Q?LsptBBZQCjo/Cv9qCzTZhHy9qqhURo075Ht6WTrxcYiUOfxFaMX2CJeNPlcK?=
 =?us-ascii?Q?C0rlLgs6vL9tVAgmPVhOSBjond8bk/M4wihMGXoMdVBOkPHZRNczqY7aTRt4?=
 =?us-ascii?Q?KXRoE4mXE7ZjXJfQ0dYpFzlG0/T4QCTotNVKkgGe9u5FC5InGebBsUIbVLRy?=
 =?us-ascii?Q?NpK2rgg7MMGTQhkHagt8FO19sbjWfaMF9usG1Tl/ztCp9icH8kaWp/HKge+E?=
 =?us-ascii?Q?p1t+7kXqF0VJJYUj30QEz9kO5cUlGiE9SRIMCNzK9k268u7/0WPuja8C/llQ?=
 =?us-ascii?Q?cTEi+DC0WH8we+Kyw4ixaRZuObXSRj0JH5O5bqmHiGr85ceZdt5TL8ZZm13r?=
 =?us-ascii?Q?pXRTwDuGm0oNXqwQsOLhBAsYJyPJ1UgJ/6q6/4CfNUxPt5//e61KDYoby8SC?=
 =?us-ascii?Q?oC6hHkbsjwK270WCW/uvdFm44v7rD8u6S0MNNs2EafS36pIuBbIhroTQRwxU?=
 =?us-ascii?Q?P4JKieKGWuPGiVbSNf5npHNdefgTu5FhKdPPUbTVGgxx1VL0OFAoi8edDz+/?=
 =?us-ascii?Q?ttwrhGUD8j7egMmAvvS2yPujAZWfZ1c+jD4ZWerCLsXJdkHzxFMqB9fnuY/u?=
 =?us-ascii?Q?6+URHrYf2Gnk6Sc9kwNxSyeTETTzk+SGGX9vGm9qnwEbdkELOGk0g+9PKrX4?=
 =?us-ascii?Q?MBwJmUfEWNf+TfOrY45DKUvClLjp/0tc9mT0ReOJ/A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qQ5PoPAKxA0Q5aHRg9QDl6Nk2b7psL99BfrTAM+HN6qXT4yc1I9XaN2+Obib?=
 =?us-ascii?Q?n85PXVhNRIZlzFrBW0b7fP4tdSnLW6RhehXU7O/LuEGbnOUOgEKhQXLZFw7s?=
 =?us-ascii?Q?SvoErEkruBPIZvN+3RM+xASs2kOZGgmW1POgtd3MQ9mQUFoTQRn98IsRIy+q?=
 =?us-ascii?Q?vRlr8j7S36+hAXixJtkl3WXVH9hdALHTMNyeif13I2L4B+DHTSf7L/zQ24NP?=
 =?us-ascii?Q?uzBLtijApDYraGSCZAMwDbhyspYiKF9/d2QWJ2zE99nsCpbE++YQBl/dG7sJ?=
 =?us-ascii?Q?igFQMc/UnPaXCHhLa4o01EaJP96gDBlGHGwAyo9lZsXqUP3jZuPcQuwSBraV?=
 =?us-ascii?Q?PiOKeI+W8aEWppxzzcgViHx69IhwhKWQu+ELE69+3zEBfwBm6hYi65laDcxM?=
 =?us-ascii?Q?QmQkv6XlvoXrb+LATs9zZxiDft/Zlidz2fOK5a+PYDgc8cHPhWHxQv5TiL8O?=
 =?us-ascii?Q?zJDykIhAhkqPaItpgZS1t7K6LzCPNPep8KQIF6kKNzOFPe0a8g/+dn2qHqJk?=
 =?us-ascii?Q?zzmwwKPULiOI4o8deeJj5Md07rdzLMpYoN1CFOmvuICnNbmirA/ttb9a5IBf?=
 =?us-ascii?Q?TLRxj7PuCWbpLj8xfbZ9pw2cgyNHRJmbP+GRDX4Wu5OvXPvlYTkh3RTnJ4Sv?=
 =?us-ascii?Q?BMBTzfFqreEpM8RTGwCT14bJPpBMfRm0yGp7iLoAPm/8hJV8LrOsnoSHI8SM?=
 =?us-ascii?Q?IZOjBRUhL9lLJzr0w1Nkk0VF5o/lj0APrtU7g3gLNQ9FZVJuCwTgZOlFwFCo?=
 =?us-ascii?Q?JAZu1yBW8DSaiAHsSGWgOXo/TuXJ8DPuZ4WXqCxEr0yzeNLoN43id9RMI9Sp?=
 =?us-ascii?Q?U/ELcjaIBlZzEB2BFePm5Yno94GOVwhXQ7UnxG0zTX7+wK7V87Yoa0ybl/mm?=
 =?us-ascii?Q?SbpDfT/jlxyZInH6FhFb3iVmU+wK+Pjv49QLWpOzz8B7YvhVh0L1qZCsZoW0?=
 =?us-ascii?Q?mu8zwcLxrAzW3Y3YX3mnBpBjgpFVeZI2d9GL94lWuKx+wnfBM231N6KHb0Uz?=
 =?us-ascii?Q?ACg42jed4z0QWkGzHzIqYAqLlYkj4HXDEzHFPzEtp4Rb639JzvEpd9GXgwOA?=
 =?us-ascii?Q?jeBMtCetBC/0j0Qm9fvKXEuqB3Bkkq0fLzSGsWeckgbjmdWzJpHYCvrAJl1T?=
 =?us-ascii?Q?FYnCfIKgEyYXtfWR4QmdJOn4x5auZ1Vw8fRxszexpzO07xLq6/n2Poj1i+Tv?=
 =?us-ascii?Q?oROkGLSMeCrerxoResMUcMrzF1cKzcvUUuJMjqCMgrAh4c1YTJcv5Nl4B6Lr?=
 =?us-ascii?Q?vuMgPoFO9G+p3tU1pl55c05UmEYrllfbXWWhnWIMpP+pR/Ws06FK9WZkCfwE?=
 =?us-ascii?Q?ud//yLlNV2WYg1rNXUDzMy1+s0IslwGxZQoHSDhvui2ovbQCUcTi6O+R8nGm?=
 =?us-ascii?Q?bW2m0Ii18Bmkpyis52Ooy4BIGPkXHuXNqXfjkVaT806OH5dSCziP7+EFrmVG?=
 =?us-ascii?Q?v3iuYAVLNW2JysIvjjufx5+50HU7uH/t6/8Tdjyc3BWzhVA4UPX5qVsTVDtl?=
 =?us-ascii?Q?kQbS9V+C+mv/QkrVauAXqynYx3L2qcSa2fViMmGKZ7MQeXo2ZjtdTI40h7/e?=
 =?us-ascii?Q?m3jEOleqc4Fs3j2L9qBtzZqE1ymHCcwStkl4Q5c9YGmttGhgFPFw3fPsP/bh?=
 =?us-ascii?Q?+A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c677b7a3-eee5-408e-0dad-08dc640d9567
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 03:21:08.5364 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OaiVEh5Vg0fnEmahPuowkMg/uN36EhALHnb0jnBXuAWZzcs1Y9C+kxMW0/nhaaCyQxlaDfbVNfPED4C+iV7DNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5098
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

On Tue, Apr 23, 2024 at 04:47:07PM -0700, Brian Welty wrote:
> vm_create_ioctl doesn't allow creating new VM in fault_mode while existing
> VMs are in non-fault mode, and vice-versa.
> This is not necessarily the user doing anything wrong if others are sharing
> the system. Instead of returning -EINVAL which suggests the user provided a
> bad argument, return distinct error code of -EBUSY for this class of errors
> so the user knows they can retry the vm_create when system is idle.
> 

We (Thomas, myself, UMD teams) have been discussing error codes for VM
bind and exec IOCTLs but haven't considered the error codes in the
create IOCTLs. We likely need to do a complete scrub of these IOCTLs
too.

Looking at xe_vm_create_ioctl, after this change it looks correct to me.
I think if we all agree on this change (and other error codes) we should
also update the kerenl doc with all the possible returns.

It looks like:
-EINVAL: Various bad input
-EBUSY: VM in fault mode or non-fault mode present
-ENOMEM: kmalloc or device memory allocation failed

The only change I could possibly see is for extensions return
-EOPNOTSUPP.

Let's get a few others input here.

Matt

> Signed-off-by: Brian Welty <brian.welty@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 85d6f359142d..e8628a982db6 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1840,16 +1840,16 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
>  			 args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE))
>  		return -EINVAL;
>  
> +	if (XE_IOCTL_DBG(xe, args->extensions))
> +		return -EINVAL;
> +
>  	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE &&
>  			 xe_device_in_non_fault_mode(xe)))
> -		return -EINVAL;
> +		return -EBUSY;
>  
>  	if (XE_IOCTL_DBG(xe, !(args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE) &&
>  			 xe_device_in_fault_mode(xe)))
> -		return -EINVAL;
> -
> -	if (XE_IOCTL_DBG(xe, args->extensions))
> -		return -EINVAL;
> +		return -EBUSY;
>  
>  	if (args->flags & DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE)
>  		flags |= XE_VM_FLAG_SCRATCH_PAGE;
> -- 
> 2.43.0
> 
