Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98FCFC25B75
	for <intel-xe@archiver.kernel.org>; Tue, 21 May 2024 20:07:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4097A10E0D7;
	Tue, 21 May 2024 20:07:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NwbsvWNZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0983E10E1C5
 for <intel-xe@lists.freedesktop.org>; Tue, 21 May 2024 20:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716322064; x=1747858064;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=cvRiQhhvEj2ono5ElfDeAsXmXOvRPqvCPQDua4CNH64=;
 b=NwbsvWNZCvGOKIR6ngQfqyjVQv1bfNngSXN5Svtc20cZKvLxr4tY7tx/
 COoZeqRVHsSJcqCGltdPR7wUYqtRbBgz04pVm+aobJRq33dtwDf9g3MZb
 zwGTaa0GFjO6Yzw2jfrUx3x6aRueI/fIAdqM0TupzDElDa4Jvxlh7PIUg
 DYLtnuwbLqequElcHW09CjeOg6HSeKlRhBN+FAcOJOoy+v7MO6hTGid1f
 8h62fLK+iFySR4N8DaxvqC/1B1q5JE6uaZT9DFsHnr3iqoD1fDjbUiBYp
 ZDm0+EKSK6NS2zC2TkMabwux1xUJ7glJlmfs7ZVatauXhnyOL0vedQJRX g==;
X-CSE-ConnectionGUID: C5pCK6D0QYafWOXhORsKlg==
X-CSE-MsgGUID: E+ddevkYT3KoQok/ETkRZw==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="15493277"
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="15493277"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 13:07:43 -0700
X-CSE-ConnectionGUID: tGSqMRGBTaiTUYt0XFvvbg==
X-CSE-MsgGUID: gIB9kOCHTSK1J0FsZUqtCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="33156874"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.94.252.151])
 ([10.94.252.151])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 13:07:42 -0700
Message-ID: <a429c063-3357-4366-a8ab-ebc604322e5e@linux.intel.com>
Date: Tue, 21 May 2024 22:07:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Properly handle alloc_guc_id() failure
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20240521193739.4298-1-niranjana.vishwanathapura@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240521193739.4298-1-niranjana.vishwanathapura@intel.com>
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


On 5/21/2024 9:37 PM, Niranjana Vishwanathapura wrote:
> Release the submission_state lock if alloc_guc_id() fails.
>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Wow, this goes all the way back. Make sense to add below tags

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")

Cc: <stable@vger.kernel.org> # v6.8+

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_guc_submit.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index ad2b8067d071..c0b901c5565b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1304,6 +1304,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>   	return 0;
>   
>   err_entity:
> +	mutex_unlock(&guc->submission_state.lock);
>   	xe_sched_entity_fini(&ge->entity);
>   err_sched:
>   	xe_sched_fini(&ge->sched);
