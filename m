Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3865CE7A81
	for <intel-xe@archiver.kernel.org>; Mon, 25 Sep 2023 11:49:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DB6D10E146;
	Mon, 25 Sep 2023 11:49:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F76F10E146
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Sep 2023 11:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695642589; x=1727178589;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=VCN2e5xdiiG7txEAnPBrcuAfaaYBHGqBdD5y+41cyfQ=;
 b=MSvrmdOhN1Ri95yRGQ9OabjViGf/80s0vKhQowEUg0sKq4X3IZZfaMzk
 +WVgRYi/KcnW6c/wxVaQtQ1CxOLSPLjbXb4zuubVLh4TU7gaD8ulBCHuC
 bPAgACPUk1ru0s6FxDvuGyQk0m4dqgPyr2YYwTHF34xrS0UywMX/dqsfx
 /yB2Kl08Cp0kAiqvR/l9MV4kWNHrzSaP8wpgtD3y8yFKs/V/LYc7LmhaW
 AkMGmmUhhT338zmGLc7giOek5rATTBzi9DuDU5Tyla38UinWuymaPmS3K
 cBE9vGfoEDtLsHQq9yixm+7x3AWjom4BPloG7Gw+UR50wsHqG44NfGQ5X Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="445340372"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; d="scan'208";a="445340372"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 04:49:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="863852567"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; d="scan'208";a="863852567"
Received: from nurqayrx-mobl2.gar.corp.intel.com (HELO intel.com)
 ([10.213.34.118])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 04:49:30 -0700
Date: Mon, 25 Sep 2023 13:49:23 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Message-ID: <ZRFzw4BJNhb0v5mu@ashyti-mobl2.lan>
References: <20230925081842.3566834-1-badal.nilawar@intel.com>
 <20230925081842.3566834-5-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230925081842.3566834-5-badal.nilawar@intel.com>
Subject: Re: [Intel-xe] [PATCH v6 4/5] drm/xe/hwmon: Expose hwmon energy
 attribute
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
Cc: linux-hwmon@vger.kernel.org, rodrigo.vivi@intel.com,
 intel-xe@lists.freedesktop.org, linux@roeck-us.net
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Badal,

[...]

> +/*
> + * xe_hwmon_energy_get - Obtain energy value
> + *
> + * The underlying energy hardware register is 32-bits and is subject to
> + * overflow. How long before overflow? For example, with an example
> + * scaling bit shift of 14 bits (see register *PACKAGE_POWER_SKU_UNIT) and
> + * a power draw of 1000 watts, the 32-bit counter will overflow in
> + * approximately 4.36 minutes.
> + *
> + * Examples:
> + *    1 watt:  (2^32 >> 14) /    1 W / (60 * 60 * 24) secs/day -> 3 days
> + * 1000 watts: (2^32 >> 14) / 1000 W / 60             secs/min -> 4.36 minutes
> + *
> + * The function significantly increases overflow duration (from 4.36
> + * minutes) by accumulating the energy register into a 'long' as allowed by
> + * the hwmon API. Using x86_64 128 bit arithmetic (see mul_u64_u32_shr()),
> + * a 'long' of 63 bits, SF_ENERGY of 1e6 (~20 bits) and
> + * hwmon->scl_shift_energy of 14 bits we have 57 (63 - 20 + 14) bits before
> + * energy1_input overflows. This at 1000 W is an overflow duration of 278 years.
> + */
> +static void
> +xe_hwmon_energy_get(struct xe_hwmon *hwmon, long *energy)

can we call it rather xe_hwmon_energy_update() as this is not
sending anything, but just updating the energy values.

Anyway...

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi
