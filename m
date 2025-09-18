Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 257B4CAC597
	for <intel-xe@archiver.kernel.org>; Thu, 18 Sep 2025 09:38:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E055C10E6BD;
	Thu, 18 Sep 2025 09:38:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bdJ5GsV/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C3FD10E6BD
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Sep 2025 09:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758188296; x=1789724296;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=sP4AHCkAkbd/YxZxQkK4mSoGzrnznrymsItntTUNu0M=;
 b=bdJ5GsV/S1MWDBhcn+BLl90n2wxjVRF2gScn5QOGbm3BrrrW0ZW9MXuD
 bNeJqf2EkH4bRNFXlLIGxqbqXa0TchpdHwEodhHx4OWrl9k+gfgB2Oltm
 QVIGOohujRZh6Y0Q1xtH/iyjZSWtHbehFToX9ihxrY9oAijbMbvvir97N
 T+Pp2++AWwjkGNEJaUAUqbL1eR7dIYi7dRhXZyZhvJjZ3/P5hYXMeE5UF
 gIrF1XALFqRO6+Sw4Ub3Kjnu3RLyE5mv1iMbnUh/ynWouQxzdHB6OUYZN
 alPAQzz9JWzPbcaV1UxjNGFb6bmIb3MOZjK31AU55ciIdnnBJOnrTcu6q Q==;
X-CSE-ConnectionGUID: ZSAEQUXKR1CWxJHt7nX2AA==
X-CSE-MsgGUID: amU4IzKbQiay4uI20V6/qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="60444055"
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="60444055"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 02:38:16 -0700
X-CSE-ConnectionGUID: 3edeNqo4SM67ZVBhNH1FOg==
X-CSE-MsgGUID: EN5vAJpaQfy0XQdImMMbBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="175938149"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.244.228])
 ([10.245.244.228])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 02:38:15 -0700
Message-ID: <321635af-b292-4849-9844-a52a881ef87c@intel.com>
Date: Thu, 18 Sep 2025 10:38:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm/xe: Don't copy pinned kernel bos twice on
 suspend
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: stable@vger.kernel.org
References: <20250918092207.54472-1-thomas.hellstrom@linux.intel.com>
 <20250918092207.54472-2-thomas.hellstrom@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250918092207.54472-2-thomas.hellstrom@linux.intel.com>
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

On 18/09/2025 10:22, Thomas Hellström wrote:
> We were copying the bo content the bos on the list
> "xe->pinned.late.kernel_bo_present" twice on suspend.
> 
> Presumingly the intent is to copy the pinned external bos on
> the first pass.
> 
> This is harmless since we (currently) should have no pinned
> external bos needing copy since
> a) exernal system bos don't have compressed content,
> b) We do not (yet) allow pinning of VRAM bos.
> 
> Still, fix this up so that we copy pinned external bos on
> the first pass. We're about to allow bos pinned in VRAM.
> 
> Fixes: c6a4d46ec1d7 ("drm/xe: evict user memory in PM notifier")
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: <stable@vger.kernel.org> # v6.16+
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_bo_evict.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
> index 7484ce55a303..d5dbc51e8612 100644
> --- a/drivers/gpu/drm/xe/xe_bo_evict.c
> +++ b/drivers/gpu/drm/xe/xe_bo_evict.c
> @@ -158,8 +158,8 @@ int xe_bo_evict_all(struct xe_device *xe)
>   	if (ret)
>   		return ret;
>   
> -	ret = xe_bo_apply_to_pinned(xe, &xe->pinned.late.kernel_bo_present,
> -				    &xe->pinned.late.evicted, xe_bo_evict_pinned);
> +	ret = xe_bo_apply_to_pinned(xe, &xe->pinned.late.external,
> +				    &xe->pinned.late.external, xe_bo_evict_pinned);
>   
>   	if (!ret)
>   		ret = xe_bo_apply_to_pinned(xe, &xe->pinned.late.kernel_bo_present,

