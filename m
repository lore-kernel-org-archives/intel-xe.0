Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5128CDE00D
	for <intel-xe@archiver.kernel.org>; Thu, 26 Sep 2024 14:35:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59A7310E05F;
	Thu, 26 Sep 2024 14:35:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gC3LGR5L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C241F10E05F
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Sep 2024 14:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727361323; x=1758897323;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=yefF+Be7nIVltj6HmOr+cqWe5DiPpmIKBzdaXM4szfU=;
 b=gC3LGR5LrCO3KPQET6yQ7gqDpibgszNVDgUmnp9iwV0RZL6ACFLp2gNx
 dtH9yShTYnPMAWEc3t1a771DW/wgIS0MxOzuWQbRWqmyENtZrZFr1RsHj
 nO5vQsfYFGG/V56NZcUxh/te+TKdtC7rJwKWhmWtsvOBUh0nGZoodB0eC
 0wxpmrUTfOKpP3rnp6++8gQq6po9VwF8Xq4xXfYI6iVzJXMLcDjGy/pKj
 lCKJsdU+A67CTMhC5K2MPCxCyWWuq1bSbJX9LSyrpYcTFDd8ySPkT7HIt
 7TAdChQ4qC/sKBe9e8q115qVuda/PY2u0fbGSe3/v+WS7hbYb307DkABy w==;
X-CSE-ConnectionGUID: lw9eITjoTiqEJPXqkMmuuA==
X-CSE-MsgGUID: lcZ5rwwwTkyo/NhvrDdLbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="51876893"
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; d="scan'208";a="51876893"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 07:35:14 -0700
X-CSE-ConnectionGUID: 9PXf9EqSQNi8ROF+bEy76A==
X-CSE-MsgGUID: GwkjSTKYQeawRsJTXwpWkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; d="scan'208";a="71782045"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa006.fm.intel.com with ESMTP; 26 Sep 2024 07:35:12 -0700
Received: from [10.246.1.253] (mwajdecz-MOBL.ger.corp.intel.com [10.246.1.253])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 6B6772876E;
 Thu, 26 Sep 2024 15:35:11 +0100 (IST)
Message-ID: <7c70dbc5-889c-4571-92c9-b8ac3ea0c9f9@intel.com>
Date: Thu, 26 Sep 2024 16:35:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] drm/xe/vf: Defer fixups if migrated twice fast
To: Tomasz Lis <tomasz.lis@intel.com>, intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
References: <20240924202553.1541574-1-tomasz.lis@intel.com>
 <20240924202553.1541574-5-tomasz.lis@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240924202553.1541574-5-tomasz.lis@intel.com>
Content-Type: text/plain; charset=UTF-8
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



On 24.09.2024 22:25, Tomasz Lis wrote:
> If another VF migration happened during post-migration recovery,
> then the current worker should be finished to allow the next
> one start swiftly and cleanly.
> 
> Check for defer in two places: before fixups, and before
> sending RESFIX_DONE.
> 
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sriov_vf.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index fe5eefa736c8..f326e507d73e 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -52,6 +52,19 @@ static int vf_post_migration_requery_guc(struct xe_device *xe)
>  	return err;
>  }
>  
> +/*
> + * vf_post_migration_imminent - Check if post-restore recovery is coming.
> + * @xe: the &xe_device struct instance
> + *
> + * Return: True if migration recovery worker will soon be running. Any worker currently
> + * executing does not affect the result.
> + */
> +static bool vf_post_migration_imminent(struct xe_device *xe)
> +{
> +	return xe->sriov.vf.migration.gt_flags != 0 ||
> +	work_pending(&xe->sriov.vf.migration.worker);

make sure scripts/checkpatch.pl --strict is not complaining

> +}
> +
>  /*
>   * vf_post_migration_notify_resfix_done - Notify all GuCs about resource fixups apply finished.
>   * @xe: the &xe_device struct instance
> @@ -63,11 +76,17 @@ static void vf_post_migration_notify_resfix_done(struct xe_device *xe)
>  	int err, num_sent = 0;
>  
>  	for_each_gt(gt, xe, id) {
> +		if (vf_post_migration_imminent(xe))
> +			goto skip;

hmm, what if new migration happen right here? this is still racy and
likely needs to be solved at GUC-VF protocol level, not by adding more
check points in the driver

>  		err = xe_gt_sriov_vf_notify_resfix_done(gt);
>  		if (!err)
>  			num_sent++;
>  	}
>  	drm_dbg(&xe->drm, "sent %d VF resource fixups done notifications\n", num_sent);
> +	return;
> +
> +skip:
> +	drm_dbg(&xe->drm, "another recovery imminent, skipping notifications\n");
>  }
>  
>  static void vf_post_migration_recovery(struct xe_device *xe)
> @@ -77,6 +96,8 @@ static void vf_post_migration_recovery(struct xe_device *xe)
>  	drm_dbg(&xe->drm, "migration recovery in progress\n");
>  	xe_pm_runtime_get(xe);
>  	err = vf_post_migration_requery_guc(xe);
> +	if (vf_post_migration_imminent(xe))
> +		goto defer;
>  	if (unlikely(err))
>  		goto fail;
>  
> @@ -85,6 +106,10 @@ static void vf_post_migration_recovery(struct xe_device *xe)
>  	xe_pm_runtime_put(xe);
>  	drm_notice(&xe->drm, "migration recovery ended\n");
>  	return;
> +defer:
> +	xe_pm_runtime_put(xe);
> +	drm_dbg(&xe->drm, "migration recovery deferred\n");
> +	return;
>  fail:
>  	xe_pm_runtime_put(xe);
>  	drm_err(&xe->drm, "migration recovery failed (%pe)\n", ERR_PTR(err));

