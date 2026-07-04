Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74479C43602
	for <intel-xe@archiver.kernel.org>; Sat,  4 Jul 2026 10:48:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F33B010E049;
	Sat,  4 Jul 2026 10:48:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H0z+3ALn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2652B10E049;
 Sat,  4 Jul 2026 10:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783162113; x=1814698113;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=qlFLDJjwyPabsvIjvFHwqYHw43f4MmCvv+wPRcLCPVM=;
 b=H0z+3ALnHLBBLxG/NtqhtAilCXNmtUrsEvRDHCsLpgEHOeP9E+IN0GPH
 gTwOF+6j+wtEerK+eLKv4/Suqci/xJ6WRMqwOd4NFNpoN/rqcRby6eXwA
 EpOa/f5XA6GtNpHSi4pKjrdGbKxrDHvAH5A98pMZ2d3ctQrSP2JzU77k0
 3QSy/no1bC6u4hm5QVibA9QOyN3IYcvp/zn99J32Tl9gpckRliYHxIWEa
 GtyH0s6hy9DyrLLl8hnIvTb0KQNnyHF/nPhYMuO6DJl4QvFliF2Yh2+k8
 XhONiLQosvfN/LlvVDQwf2F37r/xNfVI+LzoSslHAdZ1+2ZIB7ohNfjgw Q==;
X-CSE-ConnectionGUID: fETzBRQTSaC8KY7KD5lf7Q==
X-CSE-MsgGUID: 0WVlvrNPSI6dSiOXhHP6rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="106673990"
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; d="scan'208";a="106673990"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2026 03:48:33 -0700
X-CSE-ConnectionGUID: cJxgmuCmSImdxJNtafUM2A==
X-CSE-MsgGUID: 0xqurR09SXufkCGOF7e8zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; d="scan'208";a="257172067"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2026 03:48:32 -0700
Date: Sat, 4 Jul 2026 12:48:29 +0200 (CEST)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Imre Deak <imre.deak@intel.com>
cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v2 26/34] drm/i915/kunit: Enable KUnit tests
In-Reply-To: <20260701153204.4124150-27-imre.deak@intel.com>
Message-ID: <9dca3ec7-42ef-57a3-3a89-79d289aeb0cc@intel.com>
References: <20260701153204.4124150-1-imre.deak@intel.com>
 <20260701153204.4124150-27-imre.deak@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-794184202-1783116513=:605841"
Content-ID: <379528f1-8e3f-68f2-481d-0c0b38efb50f@intel.com>
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-794184202-1783116513=:605841
Content-Type: text/plain; CHARSET=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <f5d7634c-55f9-683a-8688-f10d4bc66c82@intel.com>

On Wed, 1 Jul 2026, Imre Deak wrote:
> Add KUnit configuration for i915 and a local .kunitconfig to run the
> tests.
>
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
> drivers/gpu/drm/i915/.kunitconfig  | 12 ++++++++++++

Shouldn't .gitignore be updated with .kunitconfig, similar to PATCH
28/34 ("drm/xe/kunit: Add display test config")?

Otherwise:
Reviewed-by: Micha³ Grzelak <michal.grzelak@intel.com>

BR,
Micha³

> drivers/gpu/drm/i915/Kconfig.debug | 12 ++++++++++++
> 2 files changed, 24 insertions(+)
> create mode 100644 drivers/gpu/drm/i915/.kunitconfig
>
> diff --git a/drivers/gpu/drm/i915/.kunitconfig b/drivers/gpu/drm/i915/.kunitconfig
> new file mode 100644
> index 0000000000000..70e55432bad64
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/.kunitconfig
> @@ -0,0 +1,12 @@
> +CONFIG_EXPERT=y
> +CONFIG_MODULES=y
> +CONFIG_KUNIT=y
> +CONFIG_PCI=y
> +CONFIG_DEBUG_FS=y
> +CONFIG_MAGIC_SYSRQ=y
> +CONFIG_DEBUG_KERNEL=y
> +CONFIG_DEBUG_INFO=y
> +CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
> +CONFIG_DRM=y
> +CONFIG_DRM_I915=y
> +CONFIG_DRM_I915_KUNIT_TEST=y
> diff --git a/drivers/gpu/drm/i915/Kconfig.debug b/drivers/gpu/drm/i915/Kconfig.debug
> index 52a3a59b4ba2c..dc43dcfbadb6e 100644
> --- a/drivers/gpu/drm/i915/Kconfig.debug
> +++ b/drivers/gpu/drm/i915/Kconfig.debug
> @@ -220,6 +220,18 @@ config DRM_I915_SELFTEST_BROKEN
>
> 	  If in doubt, say "N".
>
> +config DRM_I915_KUNIT_TEST
> +	tristate "KUnit tests for the drm i915 driver" if !KUNIT_ALL_TESTS
> +	depends on DRM_I915 && KUNIT && DEBUG_FS
> +	default KUNIT_ALL_TESTS
> +	help
> +	  Choose this option to allow the driver to perform selftests under
> +	  the kunit framework
> +
> +	  Recommended for driver developers only.
> +
> +	  If in doubt, say "N".
> +
> config DRM_I915_LOW_LEVEL_TRACEPOINTS
> 	bool "Enable low level request tracing events"
> 	depends on DRM_I915
> -- 
> 2.49.1
>
>
--8323329-794184202-1783116513=:605841--
