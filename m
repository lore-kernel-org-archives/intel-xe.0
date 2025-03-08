Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3821C28B25
	for <intel-xe@archiver.kernel.org>; Sat,  8 Mar 2025 16:12:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14D4C10E1D9;
	Sat,  8 Mar 2025 16:12:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ewPDEqm2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AF8F10E1D9
 for <intel-xe@lists.freedesktop.org>; Sat,  8 Mar 2025 16:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741450347; x=1772986347;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gTK25YLfOtoW6NjENdLaJKf/OCuEEsPZZTzzPJVNs98=;
 b=ewPDEqm2ArAqbO2MQEc2en2usZ3w+kK4tcPPPiUV6vuq9WuZWOGtQoUi
 1Q6uiugD8QItIezpqdy8KN3V1ZfmX3+PzM9a9ZFvYjn9mlfj2XWLcV7Va
 a7qqynZgKwc2n3zPXru1nuBMQMjhwAPZfcw4gFcpQcONV8FxQQKr4jDLy
 UCRjpkORxcdg0qdGsLfI5Pmw/p8EdE1TL9kT9B6QquIEWehmum84Uj0WI
 mZNiYuNhVhbKY9mnzX2JKvZLOWIhWIbCe1svFdABrm6Bb3llTN7jCP5cZ
 l/2k8bKAh3l9QGFyGXjWb8964hxyH0Nlh2Y04sUaI7wYTTZbboTclFana g==;
X-CSE-ConnectionGUID: Bm0MQ7nxRyOis/kf8iXvIA==
X-CSE-MsgGUID: APF2qfPlRFuKHfIA81RLeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11367"; a="45286254"
X-IronPort-AV: E=Sophos;i="6.14,232,1736841600"; d="scan'208";a="45286254"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2025 08:12:22 -0800
X-CSE-ConnectionGUID: W3+ZpCTzRZCQgwkKfZbL+A==
X-CSE-MsgGUID: 3UIPY30iSvG7LNu5iJ/vSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,232,1736841600"; d="scan'208";a="142809813"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2025 08:12:20 -0800
Date: Sat, 8 Mar 2025 18:12:16 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: lucas.demarchi@intel.com, matthew.d.roper@intel.com,
 andi.shyti@linux.intel.com, intel-xe@lists.freedesktop.org,
 anshuman.gupta@intel.com, riana.tauro@intel.com,
 badal.nilawar@intel.com, karthik.poosa@intel.com,
 aravind.iddamsetty@linux.intel.com
Subject: Re: [PATCH v2] drm/xe/hwmon: expose fan speed
Message-ID: <Z8xsYAhf96iptwm2@black.fi.intel.com>
References: <20250307125112.575242-1-raag.jadav@intel.com>
 <Z8sDoWxu0dUEpAQ-@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8sDoWxu0dUEpAQ-@intel.com>
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

On Fri, Mar 07, 2025 at 09:33:05AM -0500, Rodrigo Vivi wrote:
> On Fri, Mar 07, 2025 at 06:21:12PM +0530, Raag Jadav wrote:

...

> > @@ -454,6 +485,7 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
> >  	HWMON_CHANNEL_INFO(curr, HWMON_C_LABEL, HWMON_C_CRIT | HWMON_C_LABEL),
> >  	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT | HWMON_I_LABEL, HWMON_I_INPUT | HWMON_I_LABEL),
> >  	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT | HWMON_E_LABEL, HWMON_E_INPUT | HWMON_E_LABEL),
> > +	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT, HWMON_F_INPUT, HWMON_F_INPUT),
> 
> here as well... I believe we should not expose the fan files if !has_fan_control

I'm not sure if I'm following here. We'll still to define channel attributes
to be able to let hwmon expose them at runtime based on has_fan_control flag.

One way I could think of is to do a manual sysfs_create_file(), but at that
point it defeats the purpose of having hwmon.

Raag
