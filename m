Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B38FC54E71
	for <intel-xe@archiver.kernel.org>; Fri, 22 Mar 2024 08:36:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACC5910E382;
	Fri, 22 Mar 2024 08:36:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="feq7G4he";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66F4710E382
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Mar 2024 08:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711096594; x=1742632594;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Cry3nlm8HjvIkDs+vDOy9sbCX1vxf9c7rwjXh7VBp7k=;
 b=feq7G4herLrFBgarM1ewJ7p2jJZfEy8iGlra5rrNzTtjnjqbReUDfIfz
 49FG18SLOWBREZsxjK7xfuVrUWHFgsLSLbYkxYU1ah3n/tG8pM+pJg+dk
 Ni4UzxqxlCacETURJpOhjigxMakmPlI+XQpxz1wyozsHYyCXOpeUPRQkd
 T8kwTskAAKu8sVlTdeTrC790ounjSIFovziFUwLGzZUfETmnZddAgb9EJ
 W9+KZc98qrICAfy1q3FVFKNBCC0DP+WaETq4juURv4vwL8H4arxwBKn+7
 6hXH/gezi4MY75fLpMnLmbp6N8KddQgU3ceErojzupBi/UIdCxLTYR1KO w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="16862970"
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; d="scan'208";a="16862970"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 01:36:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; d="scan'208";a="52256669"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.36.15])
 ([10.246.36.15])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 01:36:30 -0700
Message-ID: <0e5793b5-3960-426e-96c8-4789337cf31d@linux.intel.com>
Date: Fri, 22 Mar 2024 09:36:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/ xe_sync: Check NULL before dereferencing
To: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
References: <20231206223027.46588-1-krishnaiah.bommu@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20231206223027.46588-1-krishnaiah.bommu@intel.com>
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


On 12/6/2023 11:30 PM, Bommu Krishnaiah wrote:
> checking null pointer before dereferencing schedule job
>
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_sync.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> index 02c9577fe418..3b977061bf9f 100644
> --- a/drivers/gpu/drm/xe/xe_sync.c
> +++ b/drivers/gpu/drm/xe/xe_sync.c
> @@ -255,6 +255,9 @@ void xe_sync_entry_signal(struct xe_sync_entry *sync, struct xe_sched_job *job,
>   			dma_fence_put(fence);
>   		}
>   	} else if (sync->type == DRM_XE_SYNC_TYPE_USER_FENCE) {
> +		if (!job)
> +			drm_err(&sync->ufence->xe->drm, "No schedule job fond\n");

Looks like we are working on the same goal, I have sent 
https://patchwork.freedesktop.org/series/131371/ to for this.

Please review that instead.


Regards,

Nirmoy

> +
>   		job->user_fence.used = true;
>   		job->user_fence.addr = sync->addr;
>   		job->user_fence.value = sync->timeline_value;
