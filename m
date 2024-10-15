Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0943DCFC277
	for <intel-xe@archiver.kernel.org>; Tue, 15 Oct 2024 15:21:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE72810E598;
	Tue, 15 Oct 2024 15:21:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m706f42A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D4B110E598
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Oct 2024 15:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729005707; x=1760541707;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+srKpG+W+9HpdEtXeUFIoc3RE4ascn8NWyW5IV6sY68=;
 b=m706f42A/t9cAeSIGpAMAb7QlACDKXwlV8BbpcF7up9JsPD0OK1xm4ha
 Hub954gwP6KwxeFjwF9/+LWCcV2sez/g0pOEs5KjrYrLSklo2J0VtPBpc
 oAKc/KikP6zF+de8c+ghxMWsCBQwvCylUTXc3YOz8RIdEIbwjDXm85mao
 Cc3iL3OZUGOvl/mMcnd3+YNRgAbt0G2ph7g7rls0s96t58Jysc8uGuIKK
 pmRDcGkLd0CjNajGNaoo+WZ1Dhi6v2tzeMQzZm7Klhxu+tZ+/vX07pZkc
 YARvJkmTGqD6C+o1Ep53rfdAs2o+M0YTJurisgv+QRvxoTzp82UZLAhdi w==;
X-CSE-ConnectionGUID: o0f1/oSdR2K0xnbYyruc+A==
X-CSE-MsgGUID: 6HVBxgUlQcWFOrmSvVAhXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28198767"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28198767"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 08:21:47 -0700
X-CSE-ConnectionGUID: kJWOSYSISTeWXwpXl7FYIw==
X-CSE-MsgGUID: 4BMRT5V6Qg6jca/+mBMMXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="77549961"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.177.104])
 ([10.245.177.104])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 08:21:44 -0700
Message-ID: <0dc6be1f-a9bd-445e-a714-b0e7c321803e@linux.intel.com>
Date: Tue, 15 Oct 2024 17:21:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 18/26] drm/xe/oa: Handle force_wake_get failure in
 xe_oa_stream_init()
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20241014075601.2324382-1-himal.prasad.ghimiray@intel.com>
 <20241014075601.2324382-19-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20241014075601.2324382-19-himal.prasad.ghimiray@intel.com>
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


On 10/14/2024 9:55 AM, Himal Prasad Ghimiray wrote:
> With xe_force_wake_get() now returning the refcount-incremented domain
> mask, a non-zero return value in the case of XE_FORCEWAKE_ALL does not
> necessarily indicate success. use xe_force_wake_ref_has_domain ()
> to determine the status of the call.
>
> Modify the return handling of xe_force_wake_get() accordingly and pass
> the return value to xe_force_wake_put().
>
> v3
> - return xe_wakeref_t instead of int in xe_force_wake_get()
> - xe_force_wake_put() error doesn't need to be checked. It internally
> WARNS on domain ack failure.
>
> v5
> - return unsigned int from xe_force_wake_get()
>
> v6
> - Use helper xe_force_wake_ref_has_domain()
>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_oa.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index bbe03db0c401..5951ea175533 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -837,7 +837,7 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
>  
>  	xe_oa_free_oa_buffer(stream);
>  
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> +	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>  	xe_pm_runtime_put(stream->oa->xe);
>  
>  	/* Wa_1509372804:pvc: Unset the override of GUCRC mode to enable rc6 */
> @@ -1353,6 +1353,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
>  {
>  	struct xe_oa_unit *u = param->hwe->oa_unit;
>  	struct xe_gt *gt = param->hwe->gt;
> +	unsigned int fw_ref;
>  	int ret;
>  
>  	stream->exec_q = param->exec_q;
> @@ -1413,7 +1414,11 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
>  
>  	/* Take runtime pm ref and forcewake to disable RC6 */
>  	xe_pm_runtime_get(stream->oa->xe);
> -	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
> +		ret = -ETIMEDOUT;
> +		goto err_fw_put;
> +	}
>  
>  	ret = xe_oa_alloc_oa_buffer(stream);
>  	if (ret)
> @@ -1455,7 +1460,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
>  err_free_oa_buf:
>  	xe_oa_free_oa_buffer(stream);
>  err_fw_put:
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>  	xe_pm_runtime_put(stream->oa->xe);
>  	if (stream->override_gucrc)
>  		xe_gt_WARN_ON(gt, xe_guc_pc_unset_gucrc_mode(&gt->uc.guc.pc));
