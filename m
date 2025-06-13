Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F982C71136
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 14:33:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD7F310E9F2;
	Fri, 13 Jun 2025 14:33:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bM4ncg1P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3052210E9EA
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 14:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749825183; x=1781361183;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=caD6OBpxGoxtC5+6wKecCHpOAwXop3ZVp3jxer3cL9A=;
 b=bM4ncg1PFL0f61h7kJmHSeWPh9xjTevrUUuSk94Meiex9v0qG8FKYwfe
 fG9a9ip19DyM0eC5ENVlT+QcWVcrjCMU2KWp4hm8Z9HZsLfBeTWxlw5sp
 +oDzcltXp58WHxJj5/bdlgN7w29+9BOZCWqStCulRtKE+NfdDjPRK39oa
 FXkvBQ1vJsWn6iZXpfaeCecoH6krCE0JkBZ00G0L/YlbOVVYEHUVNM/jK
 mVFEQJf5ReVzxR0XMHQ9/j+Dwpx7XdD+V0lTUi+guGlktzJEWIwzp8dqU
 Npnfp7r3vNsu+vWmY0NLZW6Mey9Ug+I5qi8kCYhXdtuX1Zbg+p9FzExOn A==;
X-CSE-ConnectionGUID: 6J6iU9cXROCl9zXloAg/vQ==
X-CSE-MsgGUID: kjFPDWT5SbKKHtKIXR1lQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="62694676"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="62694676"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 07:33:03 -0700
X-CSE-ConnectionGUID: AjB2n2GDRVqT5stLliJLgg==
X-CSE-MsgGUID: 8KQdUb7pR6myT/QhYWIX8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="148390129"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa007.jf.intel.com with ESMTP; 13 Jun 2025 07:33:01 -0700
Received: from [10.245.96.176] (unknown [10.245.96.176])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 2FD0F33BF5;
 Fri, 13 Jun 2025 15:33:00 +0100 (IST)
Message-ID: <48915a0c-f795-4b0a-96a5-1f2eb62cc301@intel.com>
Date: Fri, 13 Jun 2025 16:32:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/xe/guc: Set wedged on Xe micro hardware
 initialization error
To: Zhanjun Dong <zhanjun.dong@intel.com>, intel-xe@lists.freedesktop.org,
 Matthew Brost <matthew.brost@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
References: <20250612220925.2286286-1-zhanjun.dong@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250612220925.2286286-1-zhanjun.dong@intel.com>
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

Hi,

maybe title should start with "drm/xe/uc:" instead?

On 13.06.2025 00:09, Zhanjun Dong wrote:

the commit message should also say "why" not just "what", see [1]

[1] https://docs.kernel.org/process/submitting-patches.html#explanation-body

> Declare wedged on Xe micro controller hardware initialization
> failed.

failure ?
error ?

> 
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> Reviewed-by: Stuart Summers <stuart.summers@intel.com>
> 

no empty lines between tags!

> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4917
> 
> ---
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Change list:
> v4: Fix typo and add new line
> v3: v2 CI re-run
> v2: Remove unnecessary jump to err-out
>     Drop disable ct, switch to set wedge
> ---
>  drivers/gpu/drm/xe/xe_uc.c | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 3a8751a8b92d..77175938fc40 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -157,19 +157,22 @@ static int vf_uc_init_hw(struct xe_uc *uc)
>  
>  	err = xe_guc_enable_communication(&uc->guc);
>  	if (err)
> -		return err;
> +		goto err_out;
>  
>  	err = xe_gt_sriov_vf_connect(uc_to_gt(uc));
>  	if (err)
> -		return err;
> +		goto err_out;
>  
>  	uc->guc.submission_state.enabled = true;
>  
>  	err = xe_gt_record_default_lrcs(uc_to_gt(uc));
>  	if (err)
> -		return err;
> +		goto err_out;
>  
>  	return 0;

add separation line here please

> +err_out:
> +	xe_device_declare_wedged(uc_to_xe(uc));
> +	return err;
>  }
>  
>  /*
> @@ -197,19 +200,19 @@ int xe_uc_init_hw(struct xe_uc *uc)
>  
>  	ret = xe_guc_enable_communication(&uc->guc);
>  	if (ret)
> -		return ret;
> +		goto err_out;
>  
>  	ret = xe_gt_record_default_lrcs(uc_to_gt(uc));
>  	if (ret)
> -		return ret;
> +		goto err_out;
>  
>  	ret = xe_guc_post_load_init(&uc->guc);
>  	if (ret)
> -		return ret;
> +		goto err_out;
>  
>  	ret = xe_guc_pc_start(&uc->guc.pc);
>  	if (ret)
> -		return ret;
> +		goto err_out;
>  
>  	xe_guc_engine_activity_enable_stats(&uc->guc);
>  
> @@ -221,6 +224,10 @@ int xe_uc_init_hw(struct xe_uc *uc)
>  	xe_gsc_load_start(&uc->gsc);
>  
>  	return 0;
> +
> +err_out:
> +	xe_device_declare_wedged(uc_to_xe(uc));

hmm, but shouldn't this be really decided at the caller layer?

this is already done in this way by xe_gt.c:gt_reset() and it looks that
 xe_gt.c:xe_gt_resume() or xe_device.c:xe_device_probe() are not
handling that in the same way, so maybe fix should be there?

and from the issue #4917 it looks that indeed the fix should be
somewhere in xe_device_probe() or more specifically in the xe_gt_tlb
code which missed to do proper unwind that would include explicit
xe_gt_tlb_invalidation_reset() like done by the declare_wedged()

without that we could see that delayed TLB work hit UAF

+ Matt

> +	return ret;
>  }
>  
>  int xe_uc_fini_hw(struct xe_uc *uc)


