Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF359C5475B
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 10:53:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B923F10F2B6;
	Thu, 14 Mar 2024 10:53:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HVBBkuQe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3862710FA4E
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Mar 2024 10:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710413604; x=1741949604;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=5S/pTuSTZ2bJjpLjfukOAZoYbRUEHexk2fwO24C9PHM=;
 b=HVBBkuQe+JkdaZ629hjwN665rojUNiRcCRhE8mNvAM+Ir5dTwAeJBIf+
 /TrAYnRywrQ2gyUtTEVzH53DXAmR0ac39tdoae1J5x9UuscXxGRfUAn78
 78SvU25QOjqndOHNL3Udt+V6rR3h7QmHI2YGqQd6yEm1LBwzxhegupAfR
 NuIHzuHk6XaMRbexpC3KHOgtfNjVSdCsQtSyMsOKbcby2MO9+0jhDTraQ
 qkcxqK8OcpA4oveFtLsu0L5ShjCdLutLkuVd2lfSZvhuBxDgn5L+53aTF
 1rmj4DTC8KFXXxq5Nq2s15IgU9FPSJIcbqZ9M7CPkyxMIK5fNgX5L5tNP Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5075612"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; 
   d="scan'208";a="5075612"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 03:53:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="16847405"
Received: from unknown (HELO [10.245.244.240]) ([10.245.244.240])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 03:53:22 -0700
Message-ID: <73503874-c5d7-4f73-a9e9-7ff62cb5745b@intel.com>
Date: Thu, 14 Mar 2024 10:53:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe: Warn on NULL job when user fence used in
 xe_sync_entry_signal
Content-Language: en-GB
To: Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org,
 Matthew Brost <matthew.brost@intel.com>
References: <20240314095442.32153-1-nirmoy.das@intel.com>
 <20240314095442.32153-3-nirmoy.das@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240314095442.32153-3-nirmoy.das@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 14/03/2024 09:54, Nirmoy Das wrote:
> Added a check and warn for NULL job when sync->type is
> DRM_XE_SYNC_TYPE_USER_FENCE to prevent potential crashes
> and aid in debugging
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_sync.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> index 02c9577fe418..fae466ba8e75 100644
> --- a/drivers/gpu/drm/xe/xe_sync.c
> +++ b/drivers/gpu/drm/xe/xe_sync.c
> @@ -255,9 +255,13 @@ void xe_sync_entry_signal(struct xe_sync_entry *sync, struct xe_sched_job *job,
>   			dma_fence_put(fence);
>   		}
>   	} else if (sync->type == DRM_XE_SYNC_TYPE_USER_FENCE) {
> -		job->user_fence.used = true;
> -		job->user_fence.addr = sync->addr;
> -		job->user_fence.value = sync->timeline_value;
> +		if (job) {
> +			job->user_fence.used = true;
> +			job->user_fence.addr = sync->addr;
> +			job->user_fence.value = sync->timeline_value;
> +		} else {
> +			XE_WARN_ON("NULL job passed with DRM_XE_SYNC_TYPE_USER_FENCE");

Just wondering if it might be better to just let it crash if that ever 
happens? Assumption is that it's impossible and would be programmer error.

Matt, any thoughts here?

> +		}
>   	}
>   }
>   
