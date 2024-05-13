Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF890C25B10
	for <intel-xe@archiver.kernel.org>; Mon, 13 May 2024 07:38:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DA9010E42E;
	Mon, 13 May 2024 07:38:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H7ain4Jw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 482DB10E42E
 for <intel-xe@lists.freedesktop.org>; Mon, 13 May 2024 07:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715585910; x=1747121910;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=hON3nwplEkAxffI2I4prODnaFUXOd5lTNVSqjY2XvJw=;
 b=H7ain4JwNrBx5uz7gFkbour//ciAXhhcnHdpwwLRFpN7hFB/ngrvu10c
 svBx8Tix1/2cYYeaEGvUewcjn7eQJs7oZHJScn/oz8Zeuna84j4tHmXPZ
 oRMzTiATjW2HKFqGz2oGiqYg9mor4R6oDp4VBKVQsECrtJsXf58B2VxvB
 S6Izbf4/cr2Nv7yuQB8eNKIXms0KdOul/XNvSYiUbawJR3KOBpfxRL6Jc
 1fBA830f3E7Un3xG7KLNyizalhyEy+o69Rexz/7cc1AWFz2UNk6/X5FEI
 iP6x75grqNrtTDRPlgxxv9DXmCZ/VQQ+CvneYKXa+JqU1TCbAk3IT7mvO w==;
X-CSE-ConnectionGUID: KrGciycnTue2q1pZfMc0KA==
X-CSE-MsgGUID: kiEdIDT/QH+vJWuHZ7qxwQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="34016233"
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; d="scan'208";a="34016233"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 00:38:30 -0700
X-CSE-ConnectionGUID: 7eqtSyHDS3uITnCYyp4AXQ==
X-CSE-MsgGUID: 1Sb7krTwRX+BHGSoZsby/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; d="scan'208";a="30336147"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.245.99.210])
 ([10.245.99.210])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 00:38:29 -0700
Message-ID: <78d7fb5d-07d6-43a2-b3ad-0481707d8665@intel.com>
Date: Mon, 13 May 2024 09:38:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/20] drm/xe/coredump: move over to devm
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240510181212.264622-22-matthew.auld@intel.com>
 <20240510181212.264622-35-matthew.auld@intel.com>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240510181212.264622-35-matthew.auld@intel.com>
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

On 10.05.2024 20:12, Matthew Auld wrote:
> Here we are using drmm to ensure we release the coredump when unloading
> the module, however the coredump is very much tied to the struct device
> underneath. We can see this when we hotunplug the device, for which we
> have already got a coredump attached. In such a case the coredump still
> remains and adding another is not possible. However we still register
> the release action via xe_driver_devcoredump_fini(), so in effect two or
> more releases for one dump.  The other consideration is that the
> coredump state is embedded in the xe_driver instance, so technically
> once the drmm release action fires we might free the coredumpe state
> from a different driver instance, assuming we have two release actions
> and they can race. Rather use devm here to remove the coredump when the
> device is released.
> 
> References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1679
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej
> ---
>   drivers/gpu/drm/xe/xe_devcoredump.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> index 3d7980232be1..e70aef797193 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -238,13 +238,15 @@ void xe_devcoredump(struct xe_sched_job *job)
>   		      xe_devcoredump_read, xe_devcoredump_free);
>   }
>   
> -static void xe_driver_devcoredump_fini(struct drm_device *drm, void *arg)
> +static void xe_driver_devcoredump_fini(void *arg)
>   {
> +	struct drm_device *drm = arg;
> +
>   	dev_coredump_put(drm->dev);
>   }
>   
>   int xe_devcoredump_init(struct xe_device *xe)
>   {
> -	return drmm_add_action_or_reset(&xe->drm, xe_driver_devcoredump_fini, xe);
> +	return devm_add_action_or_reset(xe->drm.dev, xe_driver_devcoredump_fini, &xe->drm);
>   }
>   #endif

