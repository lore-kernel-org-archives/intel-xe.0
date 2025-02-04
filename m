Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C077C02194
	for <intel-xe@archiver.kernel.org>; Tue,  4 Feb 2025 18:53:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0B2110E0B4;
	Tue,  4 Feb 2025 18:53:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VtSx46k3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6568010E0B4
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Feb 2025 18:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738695212; x=1770231212;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=cJNY2DejMVMLUhB2Zsh4Mj+Z/2VbP3spEIKA2kKWQbs=;
 b=VtSx46k3QYQwBsW089nLHV7sFCWjQypLbAVOYDCxrHoQoGSd96i9T5MC
 hz22OvoERxC/7ea/NRM3GeCTVMcSboFvL/vcfXEEtlI/XYkCcHqyCg1Sn
 ZA2/PWIZpFPeObSJvaeYkcM2ssVLgm/9shRfC5GO5LzOzXYCM4gfcUB2f
 f6J2jY7VrJj2n2J0Y4ZLLSAIZ9rmkmejcm4kkhowPjD2Q+ol0hxOU3PHD
 aNDqsOuvlMxE332M1zw88kQS7f0QeEf+G1EsJFmrVNJtnlpokGl6uLFcO
 mGvSEhpIU4IbWOvbfPYL4PVNPQvvITJwKBbb7CvBrGWAzZLqiL4xUJBQj w==;
X-CSE-ConnectionGUID: CF3DO6xZQgOWW8ys4MTejA==
X-CSE-MsgGUID: DW1mjtsIRli8NsUm36bJsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50656115"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="50656115"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 10:53:31 -0800
X-CSE-ConnectionGUID: slxN4vOWTTG387CkSCVNDw==
X-CSE-MsgGUID: M5jeHBgBRnmN9Y+O/iHREQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="110500499"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa010.jf.intel.com with ESMTP; 04 Feb 2025 10:53:30 -0800
Received: from [10.246.16.98] (mwajdecz-MOBL.ger.corp.intel.com [10.246.16.98])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 043FB32EB9;
 Tue,  4 Feb 2025 18:53:27 +0000 (GMT)
Message-ID: <6b7039b2-f123-4a67-93ec-239d14b8f971@intel.com>
Date: Tue, 4 Feb 2025 19:53:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/xe/vf: Return error code from
 xe_hw_engine_read_timestamp()
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20250204180522.2327214-1-marcin.bernatowicz@linux.intel.com>
 <20250204180522.2327214-3-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250204180522.2327214-3-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 04.02.2025 19:05, Marcin Bernatowicz wrote:
> Modify xe_hw_engine_read_timestamp() to return an error code instead
> of a u64 timestamp. Return -EOPNOTSUPP when called from Virtual Function
> (VF) mode to avoid reading the inaccessible RING_TIMESTAMP register.
> 
> Update function signature to pass the timestamp via a pointer argument.
> 
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hw_engine.c | 10 ++++++++--
>  drivers/gpu/drm/xe/xe_hw_engine.h |  2 +-
>  2 files changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index fc447751fe78..ab91c15f3a8b 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -981,9 +981,15 @@ const char *xe_hw_engine_class_to_str(enum xe_engine_class class)
>  	return NULL;
>  }
>  
> -u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe)
> +int xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe, u64 *gpu_timestamp)
>  {
> -	return xe_mmio_read64_2x32(&hwe->gt->mmio, RING_TIMESTAMP(hwe->mmio_base));
> +	if (IS_SRIOV_VF(gt_to_xe(hwe->gt)))
> +		return -EOPNOTSUPP;

there seems to be 1 caller of this function
is it worth to make change here instead of fixing the caller ?

> +
> +	*gpu_timestamp = xe_mmio_read64_2x32(&hwe->gt->mmio,
> +					     RING_TIMESTAMP(hwe->mmio_base));
> +
> +	return 0;
>  }
>  
>  enum xe_force_wake_domains xe_hw_engine_to_fw_domain(struct xe_hw_engine *hwe)
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
> index 6b5f9fa2a594..df377da82770 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
> @@ -73,7 +73,7 @@ static inline bool xe_hw_engine_is_valid(struct xe_hw_engine *hwe)
>  }
>  
>  const char *xe_hw_engine_class_to_str(enum xe_engine_class class);
> -u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe);
> +int xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe, u64 *gpu_timestamp);
>  enum xe_force_wake_domains xe_hw_engine_to_fw_domain(struct xe_hw_engine *hwe);
>  
>  void xe_hw_engine_mmio_write32(struct xe_hw_engine *hwe, struct xe_reg reg, u32 val);

and this patch will not compile without 3/3

