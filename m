Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D03CBC52D6F
	for <intel-xe@archiver.kernel.org>; Tue, 27 Aug 2024 08:29:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96FE110E2AE;
	Tue, 27 Aug 2024 08:29:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ShukWrsH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70C7210E2AD
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Aug 2024 08:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724747378; x=1756283378;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=uRKpVmSMjhxuJX0DwhXux4iI88RjDd7IXkuBWO+1gqI=;
 b=ShukWrsHKQV8qiSkwCiFI0TUG0kSXxPLkw2r9kOnEOPan7LPncxDpqoO
 oMiK1MKkBN/Kq/y5fyboZcdZV1E+FPXHaW5Yb+y/BwrMMRWwEfM+u3ToZ
 d+o1OLoqmlbX7/1vE6KykoD7lkc/mn46xGrj1z3ED7hoxcuS4FPhSU45K
 zzTWQRrzO6hY1T0RXunCCADapjif4BEeDEFEScb4vlr3QnY0A1o59ptG4
 GujXk2xJRacCe2MdIyaQOGmWf0qdQsE1c0XQKImfOFP+ZInF+ayEavaj/
 vRtK6C663ClyuUXbcegf95FjBjem42jSl71fu59MUW9dw7M+rWYnvDtcg g==;
X-CSE-ConnectionGUID: rJkimeDDSnmNczQIl3TEyw==
X-CSE-MsgGUID: tPHO5ZNYSxa8c8gSTt6bdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="23175343"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="23175343"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 01:29:38 -0700
X-CSE-ConnectionGUID: tJcHqUYkSKGDFQH4BkhGnw==
X-CSE-MsgGUID: Rn2MEKweSxSYGU8Ndp94dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="62618950"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.192.32])
 ([10.245.192.32])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 01:29:37 -0700
Message-ID: <cd605cab-1d0d-4575-b9b8-81eec6a1f76d@linux.intel.com>
Date: Tue, 27 Aug 2024 10:29:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe: Remove extra dma_fence_put on
 xe_sync_entry_add_deps failure
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20240820090230.3258128-1-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240820090230.3258128-1-himal.prasad.ghimiray@intel.com>
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


On 8/20/2024 11:02 AM, Himal Prasad Ghimiray wrote:
> drm_sched_job_add_dependency() drops references even in case of error,
> no need for caller to call dma_fence_put.
>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Acked-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_sync.c | 13 +++----------
>   1 file changed, 3 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> index ca826aeb41ea..a0675f57a398 100644
> --- a/drivers/gpu/drm/xe/xe_sync.c
> +++ b/drivers/gpu/drm/xe/xe_sync.c
> @@ -206,16 +206,9 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
>   
>   int xe_sync_entry_add_deps(struct xe_sync_entry *sync, struct xe_sched_job *job)
>   {
> -	int err;
> -
> -	if (sync->fence) {
> -		err = drm_sched_job_add_dependency(&job->drm,
> -						   dma_fence_get(sync->fence));
> -		if (err) {
> -			dma_fence_put(sync->fence);
> -			return err;
> -		}
> -	}
> +	if (sync->fence)
> +		return  drm_sched_job_add_dependency(&job->drm,
> +						     dma_fence_get(sync->fence));
>   
>   	return 0;
>   }
