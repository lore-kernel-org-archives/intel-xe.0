Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C685CAC5B9
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 09:49:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FCDF10E312;
	Fri, 26 Sep 2025 09:49:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TILlSB9m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69C1810E312
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Sep 2025 09:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758880170; x=1790416170;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=EILjQWXJDdPuBTm0f/W/vjXhfUsjySw7q5yRkNSrTAI=;
 b=TILlSB9mOiX/xMBOHQk4THkJDKdZTs/Oo97v7cVEx8RON2fu9jov0lfd
 RR3Xn/zYhLD1emPGf6K5Q8vlkFKsMUCHwBYRKXMKooUSn+5YnYjGJ2uPZ
 kgtHEB25Zc98V9pq4T2AWMsLa5Ouf7ysCmQ9qBkHWXvpXWr7DXgr7J/y/
 KjUS7opjGLg6tNKGQ7DgL7R/pGIq53S8lOZtIPbg7OrhEw8csYQQmereG
 p0/L0G3/BzBg5Vv1DHdR/TiyiOYzCf4WxcxFrqQ6ZhwOs+pUq3H+JywMT
 z/zO4l6E8ozRP69cU0aXbWIfincbXOUVPZYKNYs9Ra+smWQB5LE5C4/LZ Q==;
X-CSE-ConnectionGUID: eE4KVP9pT+GcXUdItd/nfg==
X-CSE-MsgGUID: TlkyttxZSGmHtZawHQKYeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="61101493"
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="61101493"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 02:49:30 -0700
X-CSE-ConnectionGUID: 5LJO7a0hTjG8x3a6uZlWjQ==
X-CSE-MsgGUID: G8GrYl57TZCJY+hxoI+eSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="181576899"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.245.9])
 ([10.245.245.9])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 02:49:29 -0700
Message-ID: <6788ad59-dbb3-4491-8788-e169dd48fda6@intel.com>
Date: Fri, 26 Sep 2025 10:49:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] drm/xe/pf: Force use user VRAM for LMEM
 provisioning
To: =?UTF-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20250922170707.1556781-1-piotr.piorkowski@intel.com>
 <20250922170707.1556781-5-piotr.piorkowski@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250922170707.1556781-5-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 22/09/2025 18:07, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
> 
> The LMEM assigned to VFs should be allocated from the general-purpose
> VRAM pool, not from the kernel-reserved region.
> Let's force the use of general-purpose VRAM for BOs intended for VFs.
> 
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 6344b5205c08..b2e5c52978e6 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -1484,7 +1484,8 @@ static int pf_provision_vf_lmem(struct xe_gt *gt, unsigned int vfid, u64 size)
>   					 XE_BO_FLAG_VRAM_IF_DGFX(tile) |
>   					 XE_BO_FLAG_NEEDS_2M |
>   					 XE_BO_FLAG_PINNED |
> -					 XE_BO_FLAG_PINNED_LATE_RESTORE);
> +					 XE_BO_FLAG_PINNED_LATE_RESTORE |
> +					 XE_BO_FLAG_FORCE_USER_VRAM);
>   	if (IS_ERR(bo))
>   		return PTR_ERR(bo);
>   

