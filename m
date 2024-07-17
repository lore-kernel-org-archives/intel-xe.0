Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F77C3DA42
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 14:41:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FAB610E084;
	Wed, 17 Jul 2024 14:41:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cB+1Cfgo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAAF610E084
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 14:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721227273; x=1752763273;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=uOztcWv/XC6EwR8dd662eNEvt1hVc/d0Ov0hiJoNYP4=;
 b=cB+1Cfgo2C5Pqsi++VsB2O51alEziR4Bx7ioeJQxFL5AFFZ2xSX2GmdE
 GS4lHbMvLO7hdhhMDsMDlnAVUMEm/SZb+NHugQuL6F75gTs3PKcfhXi2U
 SmXUtCHdWIKkrJ0Cl9MbOY52RZWvJx/tttQ8iLimzBM9Nc0V+cU4cHplL
 Hq/akzGRMQW1vRtbJGYfYCMxEfzAZUlvDFjfPLeYHzER7FphjMYvO4DNB
 bG14tQsDu88osMUjD5hUfRIY7hTPuJorKJ1iYZ/Y98Pbxt0OW6CGnwBfw
 XbUrxkfa8FY9pJ4oiuJxEkFxUm86mfAEEHNjDW7luklo2e0K1gB2bBlIz w==;
X-CSE-ConnectionGUID: pj2fD0scR1avtXhkBuYmQw==
X-CSE-MsgGUID: 7CEhxMyhRGyhn3QaKHDsXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18600247"
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="18600247"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 07:41:12 -0700
X-CSE-ConnectionGUID: TJ2ip+KcTxWQBsMkkx10kg==
X-CSE-MsgGUID: ewsChj7GQGWtqHk1fPGK1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="54599062"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.38.191])
 ([10.246.38.191])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 07:41:12 -0700
Message-ID: <dee6ac05-b16e-4db2-bd63-bbe65323d64d@linux.intel.com>
Date: Wed, 17 Jul 2024 16:41:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe: Remove used xe_sync_entry_wait
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20240717140429.1396820-1-matthew.brost@intel.com>
 <20240717140429.1396820-2-matthew.brost@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240717140429.1396820-2-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 7/17/2024 4:04 PM, Matthew Brost wrote:
> xe_sync_entry_wait is no longer used, remove it.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>


> ---
>   drivers/gpu/drm/xe/xe_sync.c | 8 --------
>   drivers/gpu/drm/xe/xe_sync.h | 1 -
>   2 files changed, 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> index f2e5e3c8c0cd..533246f42256 100644
> --- a/drivers/gpu/drm/xe/xe_sync.c
> +++ b/drivers/gpu/drm/xe/xe_sync.c
> @@ -204,14 +204,6 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
>   	return 0;
>   }
>   
> -int xe_sync_entry_wait(struct xe_sync_entry *sync)
> -{
> -	if (sync->fence)
> -		dma_fence_wait(sync->fence, true);
> -
> -	return 0;
> -}
> -
>   int xe_sync_entry_add_deps(struct xe_sync_entry *sync, struct xe_sched_job *job)
>   {
>   	int err;
> diff --git a/drivers/gpu/drm/xe/xe_sync.h b/drivers/gpu/drm/xe/xe_sync.h
> index 006dbf780793..256ffc1e54dc 100644
> --- a/drivers/gpu/drm/xe/xe_sync.h
> +++ b/drivers/gpu/drm/xe/xe_sync.h
> @@ -22,7 +22,6 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
>   			struct xe_sync_entry *sync,
>   			struct drm_xe_sync __user *sync_user,
>   			unsigned int flags);
> -int xe_sync_entry_wait(struct xe_sync_entry *sync);
>   int xe_sync_entry_add_deps(struct xe_sync_entry *sync,
>   			   struct xe_sched_job *job);
>   void xe_sync_entry_signal(struct xe_sync_entry *sync,
