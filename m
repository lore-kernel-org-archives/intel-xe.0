Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3012CCD8CA7
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 21:09:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D110510E38B;
	Mon,  8 Jun 2026 21:09:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="asYzhiof";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57CCC10E38B
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 21:09:51 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 692A56001D;
 Mon,  8 Jun 2026 21:09:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75CF81F00893;
 Mon,  8 Jun 2026 21:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1780952990;
 bh=Q03hzgAEFKjAzA1mhoaliZ3oYPy90njOHf2VXFpaGxE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=asYzhiofMdVAkQiT6bFx2a3H0YyM1CghweIzqcFU2jzxDNqsGj3Kx3rYYOnmkrUcD
 s7mnX4yvftP0U4vLtpdJfzApuRnIeKlpe8ab7PmBfFGmldbrPPJ6d+3FrYUFQaFofO
 XhtqLSOV8B6orplc6+v6JAfuPqKGLvhOVrZSo5JYxIgrTzplhCU+hhvmZVRf0zFaAC
 l+I+mo8HCWPf3edw9z+soiFM8uQ0cuTN9fERCKxwEVYuOsAMP9tYemclTzFzqouShV
 HqAVckeqAm14OrOgnGZHI/2YYqu7rMgHYl4QkvTfSBUQ4iUEuT6sylEyF00MkUcoUO
 D3L5cMVN/tqCA==
Date: Mon, 8 Jun 2026 23:09:47 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Soham Purkait <soham.purkait@intel.com>
Cc: intel-xe@lists.freedesktop.org, riana.tauro@intel.com, 
 anshuman.gupta@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, 
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, 
 andi.shyti@intel.com, rodrigo.vivi@intel.com, anoop.c.vijay@intel.com
Subject: Re: [PATCH v3 2/3] drm/xe/xe_ras: Add types and commands for RAS GPU
 health indicator
Message-ID: <aicuwb6lk-CoRduh@zenone.zhora.eu>
References: <20260608052556.1744123-5-soham.purkait@intel.com>
 <20260608052556.1744123-7-soham.purkait@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608052556.1744123-7-soham.purkait@intel.com>
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

Hi Soham,

...

> +/**
> + * enum xe_ras_health_status - Device health status values
> + *
> + * @XE_RAS_HEALTH_STATUS_OK: Device is healthy and operating normally.
> + * @XE_RAS_HEALTH_STATUS_WARNING: Device has minor issues but is still operational.
> + * @XE_RAS_HEALTH_STATUS_CRITICAL: Device is in a critical state and may not be operational.
> + * @XE_RAS_HEALTH_STATUS_MAX: Sentinel value for validation
> + */
> +enum xe_ras_health_status {
> +	XE_RAS_HEALTH_STATUS_OK = 0,
> +	XE_RAS_HEALTH_STATUS_WARNING,
> +	XE_RAS_HEALTH_STATUS_CRITICAL,
> +	XE_RAS_HEALTH_STATUS_MAX

do we need this *_MAX status? In the next patch you can also use
ARRAY_SIZE().

> +};

...

> +/**
> + * struct xe_ras_get_health_response - Response structure for get health
> + */
> +struct xe_ras_get_health_response {
> +	/** @current_health: Current GPU health, see &enum xe_ras_health_status */
> +	u8 current_health;

should this be of the type "enum xe_ras_health_status"? Same fot
he next variables.

Thanks,
Andi

> +	/** @reserved: Reserved for future use */
> +	u8 reserved[3];
> +} __packed;
