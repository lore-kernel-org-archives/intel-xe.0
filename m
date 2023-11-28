Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD4BC4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 04:21:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B6BF10E0A4;
	Wed, 29 Nov 2023 04:21:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AA3810E0A4
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 04:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701231669; x=1732767669;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iM48P4ERQZ3/bIy0NA8w+2YJk7B8Nrk+BiHKzBpFJ3M=;
 b=aOrBC1gzaYg/k8KTVQxKrQ9MJaURQOZ4WSEhpbK51HzwmXrMYo7XzYLG
 f5auDJTtI5jO26Dxiu8AlhDzGcSJYCMwxiZyuaPyy+NxuRIXzYpS1dDcR
 T89gK8o8GuQCxQXbeKUDGn9kYqPgWE2vn79Dt3a5RDx0SHx1JV5ZQKMPp
 RoEqJIcmYq0/Oey6cNhNnp5GKBkZagyTJMElgHktuJfxCrOnvEmLmRYBS
 /Qg+5IblZyfFlCa2QHwcJAF4gJVqF5z5HQeXZ1Omx+3QwR06je5TSIwOF
 chCvOoUqN1Frg8OnVwoKBvkqkMg/P7MuuC4n8QQUfX24rYddo/cCUVfHU Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="14657146"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="14657146"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 20:21:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="859666465"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="859666465"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2023 20:21:08 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 20:21:08 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 28 Nov 2023 20:21:08 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 28 Nov 2023 20:21:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l4MJnFvLOXcgy/1jqDLc4ZZQTNtSpu5mAoIZAEUWb0ghFlmj8hEWZkmnZl71iLWJ7moeCuFgCQQcheUNYPzm+RWcrPRRZ58QfSDTXm/pWc3DV+KGRtJ3GfzQpjYZCVoY+/ctIdt06rlFPEOFevjpaS0yCtrk/xDhKt8Hm1XuusEVl93IEgtDaZFX8uxfqi+p6KU3ac+MjqCFL/umsyYxT0olBa1pXOIebeSpbmzP0xliTe9KciFH08np+2I/qNjire4VxTSB8XBg8CobUSECF5OJQg/mZPMyY1Mji1j9Tr5KulY59DZ1VPfKyucHxvbdgfqKr1iUJi8fQvpI96/bvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WZHWYCpGscJwwGH1OZa+2HoFpM77afLPZi9eS819B/Y=;
 b=NZyOSE4Qb0NeXnHyVYWy/Mnq66rhEBUyNI+R7uzZASYcu8bRR9RMThDda+yL2sKQRoX2BUGoE9XofkyiuUfqlsXxXFhjLxLMNf6BIousImeKJvaOt0Liy6okPVX6gwfBScefnkIZRJY0qa+5Lq/W7NVGHj+PXCPP24p+Qg0IHnQ82ezGzTM5IICYhsEp1YFdO/WfAjSThZIQUmjWdBaxLaXPL7pQL5cl9FUq9ZEwNmn8zF8yd9Gn6xZ9ukbPXqNBJVI5JSB4pEJp8rhew+1wxxlYIyHXwlWMHIwtI0QwhuofoMJLvvSoAIzVHvvo+Zt8Nzh0IdKDbB2mIn1XkcQlOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB8350.namprd11.prod.outlook.com (2603:10b6:806:387::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Wed, 29 Nov
 2023 04:21:06 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 04:21:06 +0000
Date: Tue, 28 Nov 2023 21:19:31 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <ZWZZY/xPDwfOEpzE@DUT025-TGLU.fm.intel.com>
References: <20231122143833.7-1-francois.dugast@intel.com>
 <20231122143833.7-9-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231122143833.7-9-francois.dugast@intel.com>
X-ClientProxiedBy: BY5PR03CA0028.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::38) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB8350:EE_
X-MS-Office365-Filtering-Correlation-Id: 572dab2f-ebb4-4192-7297-08dbf0929af0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: roxkXqoR/lIYgYgTnUMfH5JjQoBYh3FBzuVcsgmPrSDurnXT1riHYwKyudN8gBejcTnA/kMQSgGtCiITqFWcHlbHVmg775DgBT0p4kt9cBLF79pFFjrlvnyFFdleJa2DEnjaNlwjyoDEP9kXd6xl30yZZLdyu/yy+2Y9HcW2bTZolQGcduYkLDOIkTfB64ON94ILyJbIpit1fhAct1oFA2hRfpXRUX/t8zhjrxQFOdybuEhSHsQiX/kVmQ10m6AzSbnWL/2xW0Epj3dR7E7ftJEswKRrt4Oe8jLgRMowc7v0uhrujjlqeR2+8xlY8OTfZZyHBhwfelsDcjGPRmE8Ksn/4V+NK7o9x8w43Sd70+R8iAoxuu6hUmq70AhExEn0X0OTDt2vwPHqUHGVjMFvaT5zIgowzv4LcrOtNh10KNpEW2rnL03Nqyz7gYwimbgZ9v6YilSLqPMlAtapr3UwA4YEmmWVKNx4Fdav9xJbZ7xIlRyeLJy/XjDtW0vHRbUNu1LHMbXY8IpY1iTtUc/SJwDkE9QTBVtWAIrDpJktk0GBqD3hL1J9cCLxDDTte8kL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(39860400002)(136003)(366004)(376002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(26005)(6486002)(6666004)(6506007)(478600001)(6512007)(107886003)(38100700002)(86362001)(41300700001)(5660300002)(6636002)(2906002)(44832011)(316002)(66946007)(82960400001)(83380400001)(66556008)(8676002)(6862004)(8936002)(4326008)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?puWlVpGsdYyPl0GWHyVd9Hm/i83njyJctveNqoOQuQFT4xC6OZWDqD8TFpJR?=
 =?us-ascii?Q?3w7zeleA42kOCzLN8KXTrwOzazNOeuOJlS+ASC30hlG8Wbf0ztAhPspDJ+l6?=
 =?us-ascii?Q?ALLl1YA53BQIjjEjG3Iei8Ed5mY7H0J4FWGuQlQWCMBYxWz8DVTiMdo3mu4N?=
 =?us-ascii?Q?3etoqQyOkEAatotRnnXR9E5esfZZb+H1HMXunN1OKt3NlWvWo39d+z5T7e61?=
 =?us-ascii?Q?qjUEuAp6QExDQTe2lcdNb01xB5e1TEiwzoOP/O8Blp+GwNum8odIlPuMGB+a?=
 =?us-ascii?Q?H2fLkUH3v0bM7M0coaJo/EGydG/HiR6w+1mC+W0FDyImjdhruqf3vJwfjv9y?=
 =?us-ascii?Q?i4d9iw1ybD4GtuHiRwDkT/wzK8sn+tKiazGwoPzp+hh7fFqUu19wB45pkYec?=
 =?us-ascii?Q?7w9EaPiaBZzwtG4eT4kxmsJeSBnMrmU3pc7a+/Rao4FiapdU+L9p3q/Cpl4X?=
 =?us-ascii?Q?mSP9OQ3GbgYq4JpNwFU+sB0VgqSU0uhXJKYYfn90+xJAJQxvM+2u3U6nI4I9?=
 =?us-ascii?Q?x2PZPMDlUORgrDBoSdgbxgxR7mnHRJlDt7+1KMw5x2KLjf3NGdalvuc4tGb+?=
 =?us-ascii?Q?279rsVSSg2cco7+7av65fC0QmZdtRAJ/joIAuFhPw9IHYdOhiKKlrCUZeNQ+?=
 =?us-ascii?Q?jnicGWqk/L6tatxLcsB3raoQrX/+AFAvLWlerTy3rtQfqEkbzNBbFwERjI27?=
 =?us-ascii?Q?HkQd3XoqjCPNyptad4TbMQKOkKREDJtpWZiETjiW7z3LozkuY07BsxwY9egY?=
 =?us-ascii?Q?7UX3dE6lEfosrQ5I/JHpe4B8vZymP1O2B2TFcN6bNHOy9uPNdG/UCNVbOH+W?=
 =?us-ascii?Q?v8G1XsnM74oOREPuULfF7NaP1wFutdMUdIHrkQ66VE1rp4ijkQAt4c7LTzhf?=
 =?us-ascii?Q?AXw47v7Dgv9z/xx2uNqpMGCoaKgwT7fMcT2YYNhBn1a2zxVmQnN/Bq/GNR8G?=
 =?us-ascii?Q?ctJviIeZs3UgOviF9dHYRJkpruM0uPKPs1vkWhhKT4ovI6ucMUZVhL/qkO3m?=
 =?us-ascii?Q?IM9MHMJrrAI35AaSOFCTazEUZ578pRDntAplLdxabmoogz/7zsy6aZikzG1o?=
 =?us-ascii?Q?rhoJkvKxX9/qSSlwxmQS3goSZyV6t9QxrzmcQA8TitTynKpFaV6yuhH9Xp43?=
 =?us-ascii?Q?xRHkCWhyMd1B9zl3YEVyICOVhG8jrMkdHrxBAmNArzdxY46jLnBbT0aTUXG7?=
 =?us-ascii?Q?swR2oCKr9ZzDZAxV7Ks38HeZcAXqedJs0YwdcBnw3yM9ETwt0MrdfzcSE30s?=
 =?us-ascii?Q?Jj9flaYv+gGrisjDo/g5N1/bGaYs0377Ar4eaMDTXzDn3nAUe2csvwe5YGqM?=
 =?us-ascii?Q?X81FzLY0yp8ITXXiqaHtqFhmhrbJDdX27ZLRcdg48tOnIPX7py2yPWyykzqk?=
 =?us-ascii?Q?LQ5TrtwzCmBzlB4dfR7IXh6X6erhq7mYGsuTGi4dlSmB+m+zlxOgE9nuDJwC?=
 =?us-ascii?Q?Dg3WwAt3uhi57j5xCWwSuxyN1lFuG+K+S7EtO1QuDKtAEuXEZW352OQn3ty/?=
 =?us-ascii?Q?XI2PRXphnX7qVEhH/yNxvv+YCQ0lAXGUiAidhiicx06cay9Ed5yHpWTce2Bh?=
 =?us-ascii?Q?qTqluOHZ3gW/zQzF8ceKhXhKwqYTXty1uuBeUy0qUNaPndk5qNE3ha/8zg2l?=
 =?us-ascii?Q?kA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 572dab2f-ebb4-4192-7297-08dbf0929af0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 04:21:05.9492 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fNVMlMg8QXBBzf+6i4sl9v/aiIZBV7MQmPWHQfflGjuy26KEX/tNZn3EpQrRiP1X64BxQ1jj5uWEnU3IUZMX6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8350
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 08/14] drm/xe/uapi: Split xe_sync types
 from flags
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Nov 22, 2023 at 02:38:27PM +0000, Francois Dugast wrote:
> From: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> Let's continue on the uapi clean-up with more splits
> with stuff into their own exclusive fields instead of
> reusing stuff.
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_sync.c       | 23 +++++++----------------
>  drivers/gpu/drm/xe/xe_sync_types.h |  1 +
>  include/uapi/drm/xe_drm.h          | 16 ++++++++--------
>  3 files changed, 16 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> index eafe53c2f55d..883987b27c4e 100644
> --- a/drivers/gpu/drm/xe/xe_sync.c
> +++ b/drivers/gpu/drm/xe/xe_sync.c
> @@ -17,8 +17,6 @@
>  #include "xe_macros.h"
>  #include "xe_sched_job_types.h"
>  
> -#define SYNC_FLAGS_TYPE_MASK 0x3
> -
>  struct user_fence {
>  	struct xe_device *xe;
>  	struct kref refcount;
> @@ -109,15 +107,13 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
>  	if (copy_from_user(&sync_in, sync_user, sizeof(*sync_user)))
>  		return -EFAULT;
>  
> -	if (XE_IOCTL_DBG(xe, sync_in.flags &
> -			 ~(SYNC_FLAGS_TYPE_MASK | DRM_XE_SYNC_FLAG_SIGNAL)) ||
> -	    XE_IOCTL_DBG(xe, sync_in.pad) ||
> +	if (XE_IOCTL_DBG(xe, sync_in.flags & ~DRM_XE_SYNC_FLAG_SIGNAL) ||
>  	    XE_IOCTL_DBG(xe, sync_in.reserved[0] || sync_in.reserved[1]))
>  		return -EINVAL;
>  
>  	signal = sync_in.flags & DRM_XE_SYNC_FLAG_SIGNAL;
> -	switch (sync_in.flags & SYNC_FLAGS_TYPE_MASK) {
> -	case DRM_XE_SYNC_FLAG_SYNCOBJ:
> +	switch (sync_in.type) {
> +	case DRM_XE_SYNC_TYPE_SYNCOBJ:
>  		if (XE_IOCTL_DBG(xe, no_dma_fences && signal))
>  			return -EOPNOTSUPP;
>  
> @@ -135,7 +131,7 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
>  		}
>  		break;
>  
> -	case DRM_XE_SYNC_FLAG_TIMELINE_SYNCOBJ:
> +	case DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ:
>  		if (XE_IOCTL_DBG(xe, no_dma_fences && signal))
>  			return -EOPNOTSUPP;
>  
> @@ -165,12 +161,7 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
>  		}
>  		break;
>  
> -	case DRM_XE_SYNC_FLAG_DMA_BUF:
> -		if (XE_IOCTL_DBG(xe, "TODO"))
> -			return -EINVAL;
> -		break;
> -
> -	case DRM_XE_SYNC_FLAG_USER_FENCE:
> +	case DRM_XE_SYNC_TYPE_USER_FENCE:
>  		if (XE_IOCTL_DBG(xe, !signal))
>  			return -EOPNOTSUPP;
>  
> @@ -192,6 +183,7 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
>  		return -EINVAL;
>  	}
>  
> +	sync->type = sync_in.type;
>  	sync->flags = sync_in.flags;
>  	sync->timeline_value = sync_in.timeline_value;
>  
> @@ -252,8 +244,7 @@ void xe_sync_entry_signal(struct xe_sync_entry *sync, struct xe_sched_job *job,
>  			user_fence_put(sync->ufence);
>  			dma_fence_put(fence);
>  		}
> -	} else if ((sync->flags & SYNC_FLAGS_TYPE_MASK) ==
> -		   DRM_XE_SYNC_FLAG_USER_FENCE) {
> +	} else if (sync->type == DRM_XE_SYNC_TYPE_USER_FENCE) {
>  		job->user_fence.used = true;
>  		job->user_fence.addr = sync->addr;
>  		job->user_fence.value = sync->timeline_value;
> diff --git a/drivers/gpu/drm/xe/xe_sync_types.h b/drivers/gpu/drm/xe/xe_sync_types.h
> index 24fccc26cb53..852db5e7884f 100644
> --- a/drivers/gpu/drm/xe/xe_sync_types.h
> +++ b/drivers/gpu/drm/xe/xe_sync_types.h
> @@ -21,6 +21,7 @@ struct xe_sync_entry {
>  	struct user_fence *ufence;
>  	u64 addr;
>  	u64 timeline_value;
> +	u32 type;
>  	u32 flags;
>  };
>  
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index fe911728fd97..f2bdc6e323e4 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -880,16 +880,16 @@ struct drm_xe_sync {
>  	/** @extensions: Pointer to the first extension struct, if any */
>  	__u64 extensions;
>  
> -#define DRM_XE_SYNC_FLAG_SYNCOBJ		0x0
> -#define DRM_XE_SYNC_FLAG_TIMELINE_SYNCOBJ	0x1
> -#define DRM_XE_SYNC_FLAG_DMA_BUF		0x2
> -#define DRM_XE_SYNC_FLAG_USER_FENCE		0x3
> -#define DRM_XE_SYNC_FLAG_SIGNAL		0x10
> +#define DRM_XE_SYNC_TYPE_SYNCOBJ		0x0
> +#define DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ	0x1
> +#define DRM_XE_SYNC_TYPE_USER_FENCE		0x2
> +	/** @type: Type of the this sync object */
> +	__u32 type;
> +
> +#define DRM_XE_SYNC_FLAG_SIGNAL	(1 << 0)
> +	/** @flags: Sync Flags */
>  	__u32 flags;
>  
> -	/** @pad: MBZ */
> -	__u32 pad;
> -
>  	union {
>  		__u32 handle;
>  
> -- 
> 2.34.1
> 
