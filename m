Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156B3606A31A
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 16:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CaIBW2dT
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C708110F6D1;
	Tue, 27 Oct 2026 16:08:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 503FD10F6D1
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Oct 2026 16:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793117324; x=1824653324;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=lhnRg0Q1vgroWgMsF+VMpP9Qc/hEMxj8PjAshLb9Pak=;
 b=CaIBW2dTfyG7DRQ/9RrfyMPX/GHEYxg6lPMLvsSLk06zr8kacFCPjaKJ
 gYWEMopg5D4sfYC6fJzZMoO4uxEC0XeWi/6RMCxiUILPqCWhJFzCB+luv
 JG06CvzIb+I7CHjOujKE0jCnT+W8exhTtRh8pFHmEYo51LTLRfxWbaSkI
 cXqNOnV6Qwn4N5PHoWaDZH94Mh64X5l7hRQrh3KTXhVx2MxF7OgGUv+Bj
 v/w84rvgjn6xjy3rselT4KWHQUZWJaNklBOJjyrzyJtA03tSYE5fFNQ7d
 JUpzmzShOOjOkQbvkslQNIUDyA90dBjywq+Zo37BCUutL1I15Vd0mlX6A A==;
X-CSE-ConnectionGUID: hB7FCZ93RlyhJA6aSxQUxA==
X-CSE-MsgGUID: u6mqO1IAR3SqzNWYTb3Ufg==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1912757"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1912757"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 09:08:44 -0700
X-CSE-ConnectionGUID: 5o1ETF1RRFKlW0GYPpCotg==
X-CSE-MsgGUID: 0FTUuZmQSr2JRQ01ZhoQKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4535171"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.247])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 09:08:41 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, sk.anirban@intel.com, raag.jadav@intel.com,
 aravind.iddamsetty@linux.intel.com, Mallesh Koujalagi
 <mallesh.koujalagi@intel.com>
Subject: Re: [PATCH v2] drm/xe/hwmon: Use overflows_type() for temperature
 range check
In-Reply-To: <20261023143632.461084-2-mallesh.koujalagi@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261023143632.461084-2-mallesh.koujalagi@intel.com>
Date: Tue, 27 Oct 2026 18:08:38 +0200
Message-ID: <06bca621edbbf5fae4b83a4f5a84535204df9db1@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 23 Oct 2026, Mallesh Koujalagi <mallesh.koujalagi@intel.com> wrote:
> The temperature value is calculated as an s64 before being stored
> in a long. Check whether the value fits in the target type using
> overflows_type() instead of comparing against LONG_MAX directly.
>
> This keeps the overflow check correct on both 32-bit and 64-bit
> systems and avoids architecture-specific handling.
>
> Fixes: 24ec15d64617 ("drm/xe/hwmon: Decode CRI temperature registers as IEEE-754")
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
> v2:
> - Use overflows_type(), instead of #ifdef. (Jani)
> ---
>  drivers/gpu/drm/xe/xe_hwmon.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 42acfeb8818c..515b288f18e5 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -6,6 +6,7 @@
>  #include <linux/hwmon-sysfs.h>
>  #include <linux/hwmon.h>
>  #include <linux/jiffies.h>
> +#include <linux/overflow.h>
>  #include <linux/types.h>
>  #include <linux/units.h>
>  
> @@ -1322,8 +1323,8 @@ static int xe_hwmon_temperature_decode(u32 reg_val, long *temperature)
>  		value = 0;
>  	}
>  
> -	/* Ensure the magnitude fits in long, which is 32-bit on some arches. */
> -	if (value > LONG_MAX)
> +	/* Ensure the decoded value fits in a long. */
> +	if (overflows_type(value, *temperature))
>  		return -ERANGE;
>  
>  	if (reg_val & IEEE754_SIGN)

-- 
Jani Nikula, Intel
