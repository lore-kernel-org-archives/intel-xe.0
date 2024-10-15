Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 517ADD216A3
	for <intel-xe@archiver.kernel.org>; Tue, 15 Oct 2024 13:29:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 143F110E588;
	Tue, 15 Oct 2024 13:29:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BL48GrPP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4C2910E588
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Oct 2024 13:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728998963; x=1760534963;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=idbRncJxcd2FjYvbepprtagcZa+qx21lJl10NxqnEgQ=;
 b=BL48GrPPZjqcY0eT91lgN3g7hDanpmNmKFw/kMG3U/9goYadhha0bQ6/
 xaHljSQA/jcuwjX9TyKymuGWq2TERIz2aa2isM7ROBEX6SHkdCjfRcQL8
 vklNhaoLq057NBWhcwDoe3E45YIoJcfXhuXjL902BBEYDghHn/n/NKVLx
 og1lM06LhVs6nVqdRn6YXrl5TbjJ194q0eLj7JIKGe4Mn7INDr7Q18GHM
 BXWGoSrEK5vLIOIwMoL0J2Ad/lTL+MvYpp8h/1a1/GWNNWzScUoUvEQ8k
 y39DtlO+agJvYfedcAjQtzYfUZ4h1eSDCqonPQnCCxK6ba91xLFW+vDOm Q==;
X-CSE-ConnectionGUID: fvDPtzCJRR+b1djUlTanjQ==
X-CSE-MsgGUID: tY1slZyWR3Cat/+uzpS7ig==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28481007"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28481007"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 06:29:23 -0700
X-CSE-ConnectionGUID: 5mXm4kNoR1GNYSwrrFwNkA==
X-CSE-MsgGUID: IYRCz8ZESHqGE7SPwW2+mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="77853310"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.166.105])
 ([10.245.166.105])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 06:29:21 -0700
Message-ID: <28c3edbc-1486-4e6e-a350-f50d3394b824@linux.intel.com>
Date: Tue, 15 Oct 2024 15:29:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 07/26] drm/xe/hdcp: Update handling of
 xe_force_wake_get return
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Suraj Kandpal <suraj.kandpal@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20241014075601.2324382-1-himal.prasad.ghimiray@intel.com>
 <20241014075601.2324382-8-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20241014075601.2324382-8-himal.prasad.ghimiray@intel.com>
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
> xe_force_wake_get() now returns the reference count-incremented domain
> mask. If it fails for individual domains, the return value will always
> be 0. However, for XE_FORCEWAKE_ALL, it may return a non-zero value even
> in the event of failure. Update the return handling of xe_force_wake_get()
> to reflect this behavior, and ensure that the return value is passed as
> input to xe_force_wake_put().
>
> v3
> - return xe_wakeref_t instead of int in xe_force_wake_get()
>
> v5
> - return unsigned int for xe_force_wake_get()
>
> v7
> - Fix commit message
>
> Cc: Suraj Kandpal <suraj.kandpal@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>(#rev2)
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/display/xe_hdcp_gsc.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> index 6619a40aed15..3567f474b6cb 100644
> --- a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> +++ b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> @@ -41,6 +41,7 @@ bool intel_hdcp_gsc_check_status(struct xe_device *xe)
>  	struct xe_gt *gt = tile->media_gt;
>  	struct xe_gsc *gsc = &gt->uc.gsc;
>  	bool ret = true;
> +	unsigned int fw_ref;
>  
>  	if (!gsc && !xe_uc_fw_is_enabled(&gsc->fw)) {
>  		drm_dbg_kms(&xe->drm,
> @@ -49,7 +50,8 @@ bool intel_hdcp_gsc_check_status(struct xe_device *xe)
>  	}
>  
>  	xe_pm_runtime_get(xe);
> -	if (xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC)) {
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
> +	if (!fw_ref) {
>  		drm_dbg_kms(&xe->drm,
>  			    "failed to get forcewake to check proxy status\n");
>  		ret = false;
> @@ -59,7 +61,7 @@ bool intel_hdcp_gsc_check_status(struct xe_device *xe)
>  	if (!xe_gsc_proxy_init_done(gsc))
>  		ret = false;
>  
> -	xe_force_wake_put(gt_to_fw(gt), XE_FW_GSC);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>  out:
>  	xe_pm_runtime_put(xe);
>  	return ret;
