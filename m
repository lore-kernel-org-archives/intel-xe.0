Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D32F3FA3757
	for <intel-xe@archiver.kernel.org>; Fri, 13 Sep 2024 13:40:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8026510E217;
	Fri, 13 Sep 2024 13:40:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VyBSHgZI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5A6B10E217
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Sep 2024 13:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726234858; x=1757770858;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=53Hjl9yVTSWRpV5LHwG6iNnQajAxYeh/4kEDldH+zgI=;
 b=VyBSHgZIzYWxnoK56fgPw/eWlEQYR7UgE2ttksPGH9nhb3TqYLgBmR8w
 vhZ70GrEgVXUR0vCifDCk1psNQY70bW+Z0Eqo/AAudRRjPRoEhMpP6828
 4qFbIoeEhM0K952P1tfA3enZJOoxSK2HbvHJNEtBr4ohRUdDd4uL5qiLh
 HaKrvpG//QFF9bpHMppCsTQN4kN05zduJo4TGgHl+AX6QtI1mmyFUNgtt
 2SkhgsZfsa/kR/3nnjptEyUgIOtar8OufXLM/bgm3uKNF+Kn36+g2mINF
 VZVyWs7A+DV6HElLKcEIXgkI6nfhtqwGTJIim2Q0Ea2j1bdnj4p/NAUiH w==;
X-CSE-ConnectionGUID: sAHblUnTQAObunacyq23mQ==
X-CSE-MsgGUID: AW+P9408RLa5ePgW5gvgBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="36269273"
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; d="scan'208";a="36269273"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 06:40:57 -0700
X-CSE-ConnectionGUID: 0vL8LXJvSZOcVBu2LBRf2A==
X-CSE-MsgGUID: IYCSQwHeQxay1dUXykQCVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; d="scan'208";a="98889622"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa001.fm.intel.com with ESMTP; 13 Sep 2024 06:40:55 -0700
Received: from [10.245.84.117] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.84.117])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 8911D2879A;
 Fri, 13 Sep 2024 14:40:54 +0100 (IST)
Message-ID: <29286880-69f4-41da-810c-e16339ca7ea2@intel.com>
Date: Fri, 13 Sep 2024 15:40:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/sriov: Drop TIMESTAMP_OVERRIDE from Xe2
 runtime regs
To: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
References: <20240912215559.4070443-3-matthew.d.roper@intel.com>
 <20240912215559.4070443-4-matthew.d.roper@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240912215559.4070443-4-matthew.d.roper@intel.com>
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



On 12.09.2024 23:56, Matt Roper wrote:
> TIMESTAMP_OVERRIDE is never used to initialize the GT clock frequency on
> Xe2 platforms (and the register itself no longer exists on LNL) so drop
> it from the list of runtime registers.
> 
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
> index 924e75b94aec..a5bd577227d4 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
> @@ -173,7 +173,6 @@ static const struct xe_reg ver_2000_runtime_regs[] = {
>  	XE2_GT_GEOMETRY_DSS_2,		/* _MMIO(0x9154) */
>  	CTC_MODE,			/* _MMIO(0xa26c) */
>  	HUC_KERNEL_LOAD_INFO,		/* _MMIO(0xc1dc) */
> -	TIMESTAMP_OVERRIDE,		/* _MMIO(0x44074) */
>  };
>  
>  static const struct xe_reg *pick_runtime_regs(struct xe_device *xe, unsigned int *count)

Acked-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
