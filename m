Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA91FC4345F
	for <intel-xe@archiver.kernel.org>; Mon, 29 Apr 2024 11:15:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4845C112731;
	Mon, 29 Apr 2024 11:15:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nTT6cJ95";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C524A112B90
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Apr 2024 11:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714389353; x=1745925353;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=687Xdj6gjzUuk6Vo6aMBxLwRP0DOf75ruP4r/WUVgow=;
 b=nTT6cJ95ZxfzGdwaoWkLAh8VWTKrKuI33gl7cV3DEm1K9MAOJ/NgTBmj
 vxxqvoYmumD0uTpsBNwyqzL/hOrg/+UN9/D2qOvgGsTNw8tpegGOUx8Cd
 SpamwHu8scJqCsXenHwvr49h7PzOs269dQJAupv8lBXVXWbkhdb9sv8mq
 GXGqEwfaK/hZ+JOsgIo3RXKawq4PLobfm1sM8hTVAE6kSN8rzS1NR5pc2
 ovKGff9h36qDSD+/LKMYkTUsbRKIOLXgJ2OHAtYAxd0cED9Qb8TFUVXLk
 URhKiQEpbuDQsZQTXXjSH6blR7M93rLhxluQZVAQLUt7126ds4j7V0faC g==;
X-CSE-ConnectionGUID: V4QaaKuXQKeZrCFJd36dNA==
X-CSE-MsgGUID: cnzScfB0REWZLQCYe+snfA==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="20731875"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="20731875"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 04:15:52 -0700
X-CSE-ConnectionGUID: +AyyDhS9Q5iHLTOTgggczw==
X-CSE-MsgGUID: 2+BFmC70Sfm8NYhqdWqOZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="26070975"
Received: from aantonov-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.49.167])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 04:15:50 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Farah Kassabri <fkassabri@habana.ai>, intel-xe@lists.freedesktop.org
Cc: osharabi@habana.ai, Farah Kassabri <fkassabri@habana.ai>
Subject: Re: [PATCH 2/2] drm/xe: set last driver commit sha
In-Reply-To: <20240424100706.269523-2-fkassabri@habana.ai>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240424100706.269523-1-fkassabri@habana.ai>
 <20240424100706.269523-2-fkassabri@habana.ai>
Date: Mon, 29 Apr 2024 14:15:47 +0300
Message-ID: <878r0w4dy4.fsf@intel.com>
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
> This patch will set the last driver commit sha into the drm driver
> info data structure, which will be used in the log message which
> prints the device info at the end of the driver initialization.
>
> Signed-off-by: Farah Kassabri <fkassabri@habana.ai>
> ---
>  drivers/gpu/drm/xe/Makefile    | 4 ++++
>  drivers/gpu/drm/xe/xe_device.c | 1 +
>  2 files changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 8321ec4f9b46..acccb517b7bb 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -309,6 +309,10 @@ ifeq ($(CONFIG_DEBUG_FS),y)
>  		i915-display/intel_pipe_crc.o
>  endif
>  
> +GIT_SHA ?= $(shell cd $(srctree) && git rev-parse --short HEAD)

There are no guarantees that the kernel is being built from a git
checkout. Or if it is, that there are no uncommitted changes. Etc. See
scripts/setlocalversion.

IMO it's just not so simple that we could reasonably add this into a
local Makefile.

BR,
Jani.

> +DRV_CFLAGS_MODULE="-DXE_DRIVER_GIT_SHA=-$(GIT_SHA)"
> +CFLAGS_MODULE += ${DRV_CFLAGS_MODULE}
> +
>  obj-$(CONFIG_DRM_XE) += xe.o
>  obj-$(CONFIG_DRM_XE_KUNIT_TEST) += tests/
>  
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 55bbc8b8df15..2e74aa18e953 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -215,6 +215,7 @@ static struct drm_driver driver = {
>  	.major = DRIVER_MAJOR,
>  	.minor = DRIVER_MINOR,
>  	.patchlevel = DRIVER_PATCHLEVEL,
> +	.git_sha = __stringify(XE_DRIVER_GIT_SHA),
>  };
>  
>  static void xe_device_destroy(struct drm_device *dev, void *dummy)

-- 
Jani Nikula, Intel
