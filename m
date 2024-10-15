Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9994D2169D
	for <intel-xe@archiver.kernel.org>; Tue, 15 Oct 2024 15:17:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA8B510E598;
	Tue, 15 Oct 2024 15:17:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A8nMhiTz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A740E10E598
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Oct 2024 15:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729005437; x=1760541437;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=wY6+wegKwDO56tJcayn6UZJejcX4UCN95laFgTzpepw=;
 b=A8nMhiTz/M0Gml2N5ixVVCGoinU8a/XVpzv0QrwudTW0Jz3eZQZmQliz
 XeN88iO42ZjDePV9jjNyriocYsW0ZPCRyIWOFQILXgnfUlmUyq8WbTp0o
 bvZGqmEqIlgxakuGMDIfpuq9clQfIv2XZAjfqmD9ZQK7LDvpBjOnTWO4F
 UzjU0JuReEoI8oYafuSbY9Gv9/pdEycq9ewh3Qb7Pw9HVkQAT8v140UpW
 76qRescC1KQcp+2Xuy2pB4Q6G/RsMlmzvFJpKLxTkqgneuahedt4FUOLe
 xMpwbV2ifiDG0LrT9kLCvP8dy0w9V86mgaTocxd5j86hKS3gSiTArctOq g==;
X-CSE-ConnectionGUID: o1zJBDB6RIaV6YLVdtdSlA==
X-CSE-MsgGUID: ldi9EC36TLy7mo1pMasZRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28361269"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28361269"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 08:17:17 -0700
X-CSE-ConnectionGUID: YS7xGSOdT1WymYxmU98M1w==
X-CSE-MsgGUID: SojR4owdSI+EevfGIKQ01w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="78284139"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.177.104])
 ([10.245.177.104])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 08:17:14 -0700
Message-ID: <c9090096-51b9-48b4-a014-02044e5865ea@linux.intel.com>
Date: Tue, 15 Oct 2024 17:17:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 14/26] drm/xe/xe_drm_client: Update handling of
 xe_force_wake_get return
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20241014075601.2324382-1-himal.prasad.ghimiray@intel.com>
 <20241014075601.2324382-15-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20241014075601.2324382-15-himal.prasad.ghimiray@intel.com>
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
> in the event of failure. Use helper xe_force_wake_ref_has_domain to
> verify all domains are initialized or not. Update the return handling of
> xe_force_wake_get() to reflect this behavior, and ensure that the return
> value is passed as input to xe_force_wake_put().
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
> - use xe_force_wake_ref_has_domain()
>
> v7
> - Fix commit message
>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>


> ---
>  drivers/gpu/drm/xe/xe_drm_client.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
> index fb52a23e28f8..22f0f1a6dfd5 100644
> --- a/drivers/gpu/drm/xe/xe_drm_client.c
> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
> @@ -278,6 +278,7 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>  	struct xe_hw_engine *hwe;
>  	struct xe_exec_queue *q;
>  	u64 gpu_timestamp;
> +	unsigned int fw_ref;
>  
>  	xe_pm_runtime_get(xe);
>  
> @@ -303,13 +304,16 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>  			continue;
>  
>  		fw = xe_hw_engine_to_fw_domain(hwe);
> -		if (xe_force_wake_get(gt_to_fw(gt), fw)) {
> +
> +		fw_ref = xe_force_wake_get(gt_to_fw(gt), fw);
> +		if (!xe_force_wake_ref_has_domain(fw_ref, fw)) {
>  			hwe = NULL;
> +			xe_force_wake_put(gt_to_fw(gt), fw_ref);
>  			break;
>  		}
>  
>  		gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
> -		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw));
> +		xe_force_wake_put(gt_to_fw(gt), fw_ref);
>  		break;
>  	}
>  
