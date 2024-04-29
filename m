Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E56A8C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 29 Apr 2024 11:02:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77BA710E8B3;
	Mon, 29 Apr 2024 11:02:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mf0Bstus";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 870EA10E80D
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Apr 2024 11:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714388554; x=1745924554;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=W34qIHM2hl0C7MWDHS4aOKrX/3Cd+sYUEBLHdTs93y4=;
 b=Mf0Bstus+Akd1tIc1Rzf52w8e3qBEN67fCBPN96+w63swSh/g/gFLs/e
 5hdFTG7wojJdRhbnPSpPm4INkLWGWvYtx/XgLflmzDS307qPX61zyIp4A
 4F7yFc13VdhUXXuEpBwvOp78pJCy5JK0L0LLXorKLRsEa7hTVGsHCdny3
 I5o1cwn5c1rjoJ50WBRg5xVAtQT9ItI/x/nvgoK6YagHZeAoQt8Tqn53r
 8fGJTTvUkdZWsVBe4iYjikNf5XmV9AzY+vd6eZgMsqy9T0MjVXcjtRf3/
 yKPohaz9wSQAyqBOLLWSIgUsCWucqhz5THI7pbXyhXOR5cikclX4jBCSV g==;
X-CSE-ConnectionGUID: 0tCIzBwpQMCnd6LMQ/H7uw==
X-CSE-MsgGUID: i5LLqphMSm2W+RuBuvQO/A==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="27494267"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="27494267"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 04:02:33 -0700
X-CSE-ConnectionGUID: DHiGJPxsQtuwO1dWmDYFQg==
X-CSE-MsgGUID: v2dbysNRRda0bYNL72u8qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="25950440"
Received: from aantonov-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.49.167])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 04:02:31 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Farah Kassabri <fkassabri@habana.ai>, intel-xe@lists.freedesktop.org
Cc: osharabi@habana.ai, Farah Kassabri <fkassabri@habana.ai>
Subject: Re: [PATCH 1/2] drm: print top commit sha after loading the driver
In-Reply-To: <20240424100706.269523-1-fkassabri@habana.ai>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240424100706.269523-1-fkassabri@habana.ai>
Date: Mon, 29 Apr 2024 14:02:28 +0300
Message-ID: <87bk5s4ekb.fsf@intel.com>
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

On Wed, 24 Apr 2024, Farah Kassabri <fkassabri@habana.ai> wrote:
> Add the last driver sha to the existing log message
> which prints the drm device info.

The commit message fails to answer the most important question: why?

Especially, what makes drm devices such special snowflakes that they'd
need to be the only ones in the kernel to print git commit sha1's?

BR,
Jani.

>
> Signed-off-by: Farah Kassabri <fkassabri@habana.ai>
> ---
>  drivers/gpu/drm/drm_drv.c | 6 +++---
>  include/drm/drm_drv.h     | 2 ++
>  2 files changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 535b624d4c9d..e0f7af1b6ec3 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -947,10 +947,10 @@ int drm_dev_register(struct drm_device *dev, unsigned long flags)
>  	}
>  	drm_panic_register(dev);
>  
> -	DRM_INFO("Initialized %s %d.%d.%d %s for %s on minor %d\n",
> +	DRM_INFO("Initialized %s %d.%d.%d%s %s for %s on minor %d\n",
>  		 driver->name, driver->major, driver->minor,
> -		 driver->patchlevel, driver->date,
> -		 dev->dev ? dev_name(dev->dev) : "virtual device",
> +		 driver->patchlevel, driver->git_sha ? driver->git_sha : "",
> +		 driver->date, dev->dev ? dev_name(dev->dev) : "virtual device",
>  		 dev->primary ? dev->primary->index : dev->accel->index);
>  
>  	goto out_unlock;
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index 8878260d7529..7578a1f4ce74 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -407,6 +407,8 @@ struct drm_driver {
>  	int minor;
>  	/** @patchlevel: driver patch level */
>  	int patchlevel;
> +	/** @git_sha: driver last commit sha */
> +	char *git_sha;
>  	/** @name: driver name */
>  	char *name;
>  	/** @desc: driver description */

-- 
Jani Nikula, Intel
