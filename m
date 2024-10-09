Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2263CCEDD84
	for <intel-xe@archiver.kernel.org>; Wed,  9 Oct 2024 11:31:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8A8410E25E;
	Wed,  9 Oct 2024 11:31:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XAHIr8ZT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2ACD10E25E
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Oct 2024 11:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728473461; x=1760009461;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=yDnYZpjNPA4+C9Fvy1cgbmln85qK7XgFzpV8FTsmwTo=;
 b=XAHIr8ZTKHY1qAU03RpCgnH0zRLhO7/P6jBpm1n/vDmZsbDM/Jzb+70T
 8+1e7WT/W/ahxwZHQA1nDSQWZI/LAMuMG5V51g8yOTzMVGbnK6rZTRm3E
 wTyjDN9DNO69koJIklG/h2FBeUUCk+Svlxsaj+AjJ0rkZgUkspXTD/Rq+
 90kw3P2EYEq95x7vy1BrvO1t4OzTq04LeUKgEBL1PdyVgKtjJAYT0OaaW
 HFVnoAjwEM5EI2tDMM93GQV1O4W5WX6088JLF+itAVGB0IjattHgu4u/z
 Kl9a3vcIAOiKlKuwdxhu0fxft+PWY2zTcnPNo92vh2AXz9/3VdOcnPRlt g==;
X-CSE-ConnectionGUID: L49WKDZYTIKDkemNDyP5nw==
X-CSE-MsgGUID: MiPsdGeMRMC1lOqE5SCVKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="50302484"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="50302484"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 04:31:01 -0700
X-CSE-ConnectionGUID: bTUvcU5OSuOG/A1U6sK1Qg==
X-CSE-MsgGUID: D/3k6aMgQTWE5OFRA3v0jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="81060782"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.80])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 04:30:59 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>, Badal Nilawar
 <badal.nilawar@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v8 06/26] drm/xe/device: Update handling of
 xe_force_wake_get return
In-Reply-To: <20241008071115.1862704-7-himal.prasad.ghimiray@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241008071115.1862704-1-himal.prasad.ghimiray@intel.com>
 <20241008071115.1862704-7-himal.prasad.ghimiray@intel.com>
Date: Wed, 09 Oct 2024 14:30:56 +0300
Message-ID: <87bjzta4y7.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 08 Oct 2024, Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com> wrote:
>  void xe_device_l2_flush(struct xe_device *xe)
>  {
>  	struct xe_gt *gt;
> -	int err;
> +	uint fw_ref;

uint?

>  
>  	gt = xe_root_mmio_gt(xe);
>  
>  	if (!XE_WA(gt, 16023588340))
>  		return;
>  
> -	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> -	if (err)
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (!fw_ref)
>  		return;
>  
>  	spin_lock(&gt->global_invl_lock);
> @@ -929,7 +932,7 @@ void xe_device_l2_flush(struct xe_device *xe)
>  		xe_gt_err_once(gt, "Global invalidation timeout\n");
>  	spin_unlock(&gt->global_invl_lock);
>  
> -	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>  }
>  
>  u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size)

-- 
Jani Nikula, Intel
