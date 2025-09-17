Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47249CA0EE8
	for <intel-xe@archiver.kernel.org>; Wed, 17 Sep 2025 10:01:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AB3C10E193;
	Wed, 17 Sep 2025 10:01:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fg0gdw0S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7339210E645
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Sep 2025 10:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758103268; x=1789639268;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=S3ZkL1af2GxGr3lL2cmtk4YpsfzQt7SmW4kp1qR76uc=;
 b=fg0gdw0S/rPVtbJWjYpjn08nt91vrK4fU93KrYSmgLqgU57/7EWElQbA
 0jNKbNyrpOgITZtOeludMV57adwjs9XUREQOiBZA57ZLDB7QwFrRhtVgJ
 dgqoP3pWTs9OppmZ80030/G+rTN7zT9QFQE52E5MLbpQ5bSy5foGAlyPw
 Wdbs2QzJcuXEzrLGiQYYmmgYth3uWkJaAycaFZFLSZPLTy4dJbCyj8Pav
 SNJFhQkrXkU0dmoRhCHvk610cDWuqyeTHGTfbQJluN6rNqu6fO89HBbLg
 z1kzm8vl/tCBI5rdfLcgZaV3/3uveKQ3/JOxzR1IiO6IKgdtXGGwbLn30 w==;
X-CSE-ConnectionGUID: 708V+4xWQQiTGmL20Cb07w==
X-CSE-MsgGUID: AwpsxuUIQTev+7a8gM4JOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="64223429"
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; d="scan'208";a="64223429"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 03:01:07 -0700
X-CSE-ConnectionGUID: k9OdnbERRTKVyolQoSH+tQ==
X-CSE-MsgGUID: elNnPCK9Q7aoQbW4a3DY8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; d="scan'208";a="175979001"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.244.67])
 ([10.245.244.67])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 03:01:06 -0700
Message-ID: <43b64396-710d-47db-82dc-328c5169fb76@intel.com>
Date: Wed, 17 Sep 2025 11:01:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Handle NULL TTM case in xe_bo_move
To: Jonathan Cavitt <jonathan.cavitt@intel.com>, intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com
References: <20250916220604.83613-2-jonathan.cavitt@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250916220604.83613-2-jonathan.cavitt@intel.com>
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

On 16/09/2025 23:06, Jonathan Cavitt wrote:
> It is possible for xe_bo_move to pass a NULL TTM pointer to
> xe_tt_map_sg, which would result in a NULL pointer dereference.
> Whether or not this issue realistically occurs, it would be good
> to add an error handler to guard agains this.
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 8422f3cab113..bfeae8fd1650 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -834,7 +834,9 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>   		(!ttm && ttm_bo->type == ttm_bo_type_device);
>   
>   	if (new_mem->mem_type == XE_PL_TT) {
> -		ret = xe_tt_map_sg(xe, ttm);
> +		ret = -ENOENT;
> +		if (ttm)

When the destination mem_type (new_mem) needs a ttm_tt, like with PL_TT, 
ttm must ensure there is a both a tt attached and that it is populated 
with pages before calling into the driver bo_move(). See 
ttm_bo_handle_move_mem() and the new_use_tt check. If there is no tt or 
it is not populated at this point then that would be a major bug since 
there would be no system memory pages to move to.

If we turn this into a normal error condition and return here the worry 
is that we might then hide this bug instead of crashing early and loudly 
here with NPD.

> +			ret = xe_tt_map_sg(xe, ttm);
>   		if (ret)
>   			goto out;
>   	}

