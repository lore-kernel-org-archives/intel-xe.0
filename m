Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 035B7CCD18E
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 08:47:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B15F110E74C;
	Wed, 15 Oct 2025 08:47:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RfDVmPKL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5C5E10E74C
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 08:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760518060; x=1792054060;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=cNjZhZldkWnWnucTd6VhRwnR6rbUqu44jvizT1Jgn1I=;
 b=RfDVmPKLJ6iU9ApeASn3TTy4f+enFfe6TXfoZlNubiEg9KRPqWR6j7VG
 aFnwnNYnKB0sFxo/jhGYo9xyHYKJyWLK+Zr4/LVf7YuTPDdLd8nKT+9x/
 wGeYtK8/M4L35Xj16pWAxhTfY9j9BJL4dUvvU/EPKpHujHCJSS8YA9Ml1
 UFOrdsNEkSORMAwHlkJU5GXtEVUiDeJkKK/z32qvq1YxOJDaqJQRIGxE+
 mxzD8+oCDPSBe2uoVfwspejgFQM0VK2+1sxtcfpMRtFeabKSGeSQeg0wN
 aGsZRQd85XDGbCW0oq+AET7kiH1x9tvdF6BHvgTrxWUnMex54+8Hvi16w w==;
X-CSE-ConnectionGUID: omy8J03UQUaG2Xz6Q9u3Jg==
X-CSE-MsgGUID: Y+3dzseiT96P6r9nuE4OJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="62782221"
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="62782221"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 01:47:39 -0700
X-CSE-ConnectionGUID: QGBjIWPUT0qH1pFbBfZ5Hg==
X-CSE-MsgGUID: mI3gCuklSouzXiXREhvzVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="212716632"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.245.90])
 ([10.245.245.90])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 01:47:38 -0700
Message-ID: <baedfa4e-3ace-446b-bbf5-ceabf41f600e@intel.com>
Date: Wed, 15 Oct 2025 09:47:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/uapi: Add documentation for
 DRM_XE_GEM_CREATE_FLAG_SCANOUT
To: Sanjay Yadav <sanjay.kumar.yadav@intel.com>, intel-xe@lists.freedesktop.org
References: <20251014142823.3701228-2-sanjay.kumar.yadav@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20251014142823.3701228-2-sanjay.kumar.yadav@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 14/10/2025 15:28, Sanjay Yadav wrote:
> Add documentation for drm_xe_gem_create structure flag
> DRM_XE_GEM_CREATE_FLAG_SCANOUT.
> 
> Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   include/uapi/drm/xe_drm.h | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 40ff19f52a8d..2d7945cda739 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -771,7 +771,11 @@ struct drm_xe_device_query {
>    *    until the object is either bound to a virtual memory region via
>    *    VM_BIND or accessed by the CPU. As a result, no backing memory is
>    *    reserved at the time of GEM object creation.
> - *  - %DRM_XE_GEM_CREATE_FLAG_SCANOUT
> + *  - %DRM_XE_GEM_CREATE_FLAG_SCANOUT - Indicates that the GEM object is
> + *    intended for scanout via the display engine. When set, kernel ensures
> + *    that the allocation is placed in a memory region compatible with the
> + *    display engine requirements. This may impose restrictions on tiling,
> + *    alignment, and memory placement to guarantee proper display functionality.
>    *  - %DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM - When using VRAM as a
>    *    possible placement, ensure that the corresponding VRAM allocation
>    *    will always use the CPU accessible part of VRAM. This is important

