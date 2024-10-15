Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24BB4CFC27C
	for <intel-xe@archiver.kernel.org>; Tue, 15 Oct 2024 15:31:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5EB910E5A9;
	Tue, 15 Oct 2024 15:31:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RI4Q3iv3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89F4810E5A9
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Oct 2024 15:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729006311; x=1760542311;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=e1UhvyGNnzE9bH/zjSLZ2coutX1TrxVvVirIEn3bRI0=;
 b=RI4Q3iv3aJxLF7In2O3cWlKcpzGQYO3kSa7IGZcEGDqEVcgD03t+rnEe
 FMYfLlGzOUZdKIxKphf+u2EqeLvYGm5NYv/BYrPCfPEtP6Esbh5I3frDP
 m0p/lZ07ehesnqoKny+2Z50nVw4gHuTva+fPTsldjXbEHdiBzFt79sd2e
 duNo0q1IEKhifGTlusEp/ABDMUJQ9ri9lRJMixtwrjiKNIzViQxcFDZjX
 kuJ7888gzy4kZOODfonky/uMFTOlWb4Y+lG8UVtKNpTLsvaVL5QutB93e
 WHo5VuTtoxGzo+0LIEj6zBGU3+MlEu0XzMegD32sFg6GLFYlRcS1ayc+R A==;
X-CSE-ConnectionGUID: U5LK+bazRKyAd/h85R4/+A==
X-CSE-MsgGUID: PAAiFXvmThS9XLPWU2LoQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28200662"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28200662"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 08:31:51 -0700
X-CSE-ConnectionGUID: 2eXBDVWmQ4qp4rvuhcopmw==
X-CSE-MsgGUID: Mj8EgaiwSpOCUaj9Bot1EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="77553804"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.177.104])
 ([10.245.177.104])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 08:31:49 -0700
Message-ID: <20233d0c-1e56-418a-8461-7b8f9b4a5867@linux.intel.com>
Date: Tue, 15 Oct 2024 17:31:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 22/26] drm/xe/query: Update handling of
 xe_force_wake_get return
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20241014075601.2324382-1-himal.prasad.ghimiray@intel.com>
 <20241014075601.2324382-23-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20241014075601.2324382-23-himal.prasad.ghimiray@intel.com>
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
> domain mask, a non-zero return value in the case of XE_FORCEWAKE_ALL
> does not necessarily indicate success. Use xe_force_wake_ref_has_domain()
> to determine the status of the call.
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
> - return unsigned int from xe_force_wake_get()
>
> v6
> - Use helper Use xe_force_wake_ref_has_domain()
>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_query.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 5093a243e9fe..dcd1291da057 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -117,6 +117,7 @@ query_engine_cycles(struct xe_device *xe,
>  	__ktime_func_t cpu_clock;
>  	struct xe_hw_engine *hwe;
>  	struct xe_gt *gt;
> +	unsigned int fw_ref;
>  
>  	if (query->size == 0) {
>  		query->size = size;
> @@ -149,13 +150,16 @@ query_engine_cycles(struct xe_device *xe,
>  	if (!hwe)
>  		return -EINVAL;
>  
> -	if (xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL))
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))  {
> +		xe_force_wake_put(gt_to_fw(gt), fw_ref);
>  		return -EIO;
> +	}
>  
>  	hwe_read_timestamp(hwe, &resp.engine_cycles, &resp.cpu_timestamp,
>  			   &resp.cpu_delta, cpu_clock);
>  
> -	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>  
>  	if (GRAPHICS_VER(xe) >= 20)
>  		resp.width = 64;
