Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 748F7D2169D
	for <intel-xe@archiver.kernel.org>; Tue, 15 Oct 2024 15:18:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39A6710E598;
	Tue, 15 Oct 2024 15:18:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ACAPSBnj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B03010E598
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Oct 2024 15:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729005501; x=1760541501;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=v4cFrBQqLP+FEmlY0H8UrxCA1mv8XN2lag67UovvOrQ=;
 b=ACAPSBnjTTaPGdF9bgeFb1BPQkATd1tIlZmGUm+4R12lBMFY39nzOLr4
 BPBvHkzxPJeD2/B9ib6W0Tgk/sNwZXppnHaSS34XZv6rRbh1REVMIJfaZ
 kbgfARMuMF/5eGIH1T1+BzQNRdRsMjpXvwt+kDrAqtGPsm8l03u1JvoY+
 oX3WuFwCixXqZcvy4JRMUF27o5U9RFChiWg5PM08DQOC9/bReR34gOU1R
 rh7hurRHJHqNATwMiTLQqcdGiS+wefBkYMUbRlFtF0OUefqaJA+khFjZl
 QVvo0sEggQ+0PRs98fwsdCRaFbezjc3q6Z2MtPI0WqQyViQQaf2SJ+T0z Q==;
X-CSE-ConnectionGUID: 3mZB61VbQj2+MfUmS+PX8Q==
X-CSE-MsgGUID: EdFVdrF2Q0a4zullVTNVgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="28506204"
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="28506204"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 08:18:21 -0700
X-CSE-ConnectionGUID: ac9FgGfyQnSw9w1TvdH7KA==
X-CSE-MsgGUID: Lmpl4FSzRcqOj0p0b0KGnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="77591148"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.177.104])
 ([10.245.177.104])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 08:18:19 -0700
Message-ID: <07a8e268-b972-430d-a37e-66c815cbc6a2@linux.intel.com>
Date: Tue, 15 Oct 2024 17:18:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 15/26] drm/xe/xe_gt_debugfs: Update handling of
 xe_force_wake_get return
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20241014075601.2324382-1-himal.prasad.ghimiray@intel.com>
 <20241014075601.2324382-16-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20241014075601.2324382-16-himal.prasad.ghimiray@intel.com>
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
> With xe_force_wake_get() now returning the refcount-incremented
> domain mask, a non-zero return value in the case of XE_FORCEWAKE_ALL does
> not necessarily indicate success. Use xe_force_wake_ref_has_domain()
> determine the status of the call.
>
> Modify the return handling of xe_force_wake_get() accordingly and
> pass the return value to xe_force_wake_put().
>
> v3
> - return xe_wakeref_t instead of int in xe_force_wake_get()
> - xe_force_wake_put() error doesn't need to be checked. It internally
> WARNS on domain ack failure.
>
> v5
> - return unsigned int for xe_force_wake_get()
>
> v6
> - use helper xe_force_wake_ref_has_domain()
>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_debugfs.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index cbc43973ff7e..3e8c351a0eab 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -90,22 +90,21 @@ static int hw_engines(struct xe_gt *gt, struct drm_printer *p)
>  	struct xe_device *xe = gt_to_xe(gt);
>  	struct xe_hw_engine *hwe;
>  	enum xe_hw_engine_id id;
> -	int err;
> +	unsigned int fw_ref;
>  
>  	xe_pm_runtime_get(xe);
> -	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> -	if (err) {
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
>  		xe_pm_runtime_put(xe);
> -		return err;
> +		xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +		return -ETIMEDOUT;
>  	}
>  
>  	for_each_hw_engine(hwe, gt, id)
>  		xe_hw_engine_print(hwe, p);
>  
> -	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>  	xe_pm_runtime_put(xe);
> -	if (err)
> -		return err;
>  
>  	return 0;
>  }
