Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0258606A33B
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 12:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ggjr5CX6
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 812AF10F661;
	Tue, 10 Nov 2026 12:41:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B3FF10F677
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Nov 2026 12:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794314456; x=1825850456;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=BBd9zCPOUgaQQPBTdhyDerdJf+Jf/olmFOwPTjgWUWI=;
 b=Ggjr5CX6jwD5mk2U9gxmTa1mew1QuPfK7N9I5JEWeu2UhGdzL8MQniS4
 KJZXPR5FO/tYjt289UCIzZ4s1kGuZFc0Abzyci/wVPB/7lomgDGBWpX51
 6t4O7sdyuPji0kRkKY8PZmxjZqNrKU/4I2mb1nmuGkbWfIFfK2d9ujGdV
 ZJ3h/1LekTNyTcTUPpbhRe3fX0mZvtVtzxqWDRM99tLslEg+rxO6+60/U
 22EYLV9as7t033ljSkgc32M4DvvbxG2Ss1UmvNggcbNx+xnlVsXEoeGXE
 Jid3sLvDJ5MuP7fhmTL0Tl12xWdJHCnTjXJGoN28sSH7eAzBNpKHCL2lz w==;
X-CSE-ConnectionGUID: llvNxgr+QkKn3KEvpiGbsA==
X-CSE-MsgGUID: l1Ufv5TdRDqRpgZCogb4dA==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3095455"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="3095455"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 04:40:53 -0800
X-CSE-ConnectionGUID: 0Jzne6HqTiG4w9PYBixIYg==
X-CSE-MsgGUID: Z4hdrdk4Tyi2pBDmorM4YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="9883611"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 04:40:52 -0800
Date: Tue, 10 Nov 2026 13:40:49 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@linux.intel.com,
 mallesh.koujalagi@intel.com, badal.nilawar@intel.com
Subject: Re: [PATCH v4 2/8] drm/xe/hw_error: Initialize hw_error_work per tile
Message-ID: <avMQ0euV7JlPysFr@black.igk.intel.com>
References: <20261106071944.2693854-10-riana.tauro@intel.com>
 <20261106071944.2693854-12-riana.tauro@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106071944.2693854-12-riana.tauro@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 06, 2026 at 12:49:47PM +0530, Riana Tauro wrote:
> From: Raag Jadav <raag.jadav@intel.com>
> 
> Since hw_error_work is now being reused generically, initialize it per tile
> so that we don't hit uninitialized work for non-root tile. While at it,
> disable hw_error_work on fini to prevent UAF during unwind.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> Reviewed-by: Riana Tauro <riana.tauro@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
> v2: add dgfx and sriov check (Sashiko)
> 
> v3: retain original patch and fix unload issue in later patches
> ---
>  drivers/gpu/drm/xe/xe_hw_error.c | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
> index a934b649575c..f7031b341ce0 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.c
> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
> @@ -537,6 +537,19 @@ static void process_hw_errors(struct xe_device *xe)
>  	}
>  }
>  
> +static void hw_error_fini(void *arg)
> +{
> +	struct xe_device *xe = arg;
> +	struct xe_tile *tile;
> +	u8 id;
> +
> +	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))

Why is this needed? fini is not even registered for these cases.
Not everything is a bug because AI says so :)

Raag

> +		return;
> +
> +	for_each_tile(tile, xe, id)
> +		disable_work_sync(&tile->hw_error_work);
> +}
> +
>  /**
>   * xe_hw_error_init - Initialize hw errors
>   * @xe: xe device instance
> @@ -546,12 +559,15 @@ static void process_hw_errors(struct xe_device *xe)
>   */
>  void xe_hw_error_init(struct xe_device *xe)
>  {
> -	struct xe_tile *tile = xe_device_get_root_tile(xe);
> +	struct xe_tile *tile;
> +	u8 id;
>  
>  	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
>  		return;
>  
> -	INIT_WORK(&tile->hw_error_work, hw_error_work);
> +	for_each_tile(tile, xe, id)
> +		INIT_WORK(&tile->hw_error_work, hw_error_work);
>  
>  	process_hw_errors(xe);
> +	devm_add_action_or_reset(xe->drm.dev, hw_error_fini, xe);
>  }
> -- 
> 2.47.1
> 
