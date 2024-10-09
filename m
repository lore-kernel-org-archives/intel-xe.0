Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73CB6CED630
	for <intel-xe@archiver.kernel.org>; Wed,  9 Oct 2024 08:57:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D20E10E6A5;
	Wed,  9 Oct 2024 08:57:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XqsKZHHE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FE3010E6A5
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Oct 2024 08:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728464242; x=1760000242;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=puxB61VMLRlJtZclFNT8ifpRayOmxK2SIkc63DLJ9wk=;
 b=XqsKZHHE1JtJWdEh5igl7EOD5v1nRAsEFphvB0usfaKyYk2T/ufX5Pzq
 v+04hgU2LGkqZ7qndEktm/bks5jumAlM1a4jUtPW8PS0dR8OBAhwSnDRU
 QDK10W8zPGnswP7coeznfu1Dn8cp9ilTCB8+g+G5TMGDL6MMIa0cfHNEZ
 uZSKgl1exujsASfA4ydsoNDC/ZEQg6X1NNhlSbus9LlwAFh3AQGOggzAM
 5XnnQt9zsoliB6OITv/nRB9A4SyGIBJUfKxGdVReEA8XwLVDFT2ANfh0F
 X0ZMLsM1uDBworfqhAQQRkeUG8gRM4q7XnV0Xq4/sq3ZjfSR70QHy7kic g==;
X-CSE-ConnectionGUID: Nwhy57UGR0eZfNVZ5xeTMw==
X-CSE-MsgGUID: xKOWTNaATp2ReycmYooqjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="39141845"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="39141845"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 01:57:22 -0700
X-CSE-ConnectionGUID: LQBkB+cpRTGgneDbv4iBYw==
X-CSE-MsgGUID: Snjqnj81RkmWjw/5NJgk2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="81026403"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.131.59])
 ([10.245.131.59])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 01:57:20 -0700
Message-ID: <8916b5eb-1880-460f-90e4-a9e3825f0064@linux.intel.com>
Date: Wed, 9 Oct 2024 10:57:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/xe: fix unbalanced rpm put() with
 declare_wedged()
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
References: <20241009084808.204432-3-matthew.auld@intel.com>
 <20241009084808.204432-4-matthew.auld@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20241009084808.204432-4-matthew.auld@intel.com>
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


On 10/9/2024 10:48 AM, Matthew Auld wrote:
> Technically the or_reset() means we call the action on failure, however
> that would lead to unbalanced rpm put(). Move the get() earlier to fix
> this. It should be extremely unlikely to ever trigger this in practice.
>
> Fixes: 452bca0edbd0 ("drm/xe: Don't suspend device upon wedge")
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index cd241a8e1838..962751c966d1 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1016,13 +1016,13 @@ void xe_device_declare_wedged(struct xe_device *xe)
>  		return;
>  	}
>  
> +	xe_pm_runtime_get_noresume(xe);
> +
>  	if (drmm_add_action_or_reset(&xe->drm, xe_device_wedged_fini, xe)) {
>  		drm_err(&xe->drm, "Failed to register xe_device_wedged_fini clean-up. Although device is wedged.\n");
>  		return;
>  	}
>  
> -	xe_pm_runtime_get_noresume(xe);
> -
>  	if (!atomic_xchg(&xe->wedged.flag, 1)) {
>  		xe->needs_flr_on_fini = true;
>  		drm_err(&xe->drm,
