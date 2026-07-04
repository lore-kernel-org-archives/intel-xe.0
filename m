Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86968C43458
	for <intel-xe@archiver.kernel.org>; Sat,  4 Jul 2026 10:49:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4505710E6A3;
	Sat,  4 Jul 2026 10:49:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eoSJ2xnc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38B0610E6A3;
 Sat,  4 Jul 2026 10:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783162193; x=1814698193;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=OvlpBuyF90McYUgrPnhkRgtA01r29rfl9tPj4ld5RnA=;
 b=eoSJ2xnctzeaR7cn9qe+/mh6ugVFJnygT8DxG7RYi9K80Jy3vMtud2Cs
 ZA1bpTT/biUUD1zf2RKDJ2g3eZ0A9OmoXrxElcn8/pNGxb3mgiLON6+Pq
 u7hlstwNTqsfPyERbe5rLMr41/aYgQzXAmlfbXukb+1PM6SzDF8RHOFY6
 XkNksDf+aYZHBQACmKLvEZydb5Fu6+dCSsdBh0bxcBIi5jtzJme1ezFb/
 c5JvyTUHz4DxZRGEnZxjDEUn6mrFInFJK2qNISzv1+WKtzlYpbH0LWWsQ
 ei6FosHLTS/Oeyc0Q4jhYM3IlkLqPz7xRlanjiPfF4n1DKVgkpN5LsdX8 w==;
X-CSE-ConnectionGUID: w1sOxAkSQNKJ6IupJ6P+cQ==
X-CSE-MsgGUID: senvFb6YRaG0BuMxVs+URg==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="95382520"
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; d="scan'208";a="95382520"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2026 03:49:53 -0700
X-CSE-ConnectionGUID: OsVSMu88Ql6QLYHnsZAIEA==
X-CSE-MsgGUID: SL4Aqed3SFipq6BsA2tjcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; d="scan'208";a="257172115"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2026 03:49:52 -0700
Date: Sat, 4 Jul 2026 12:49:49 +0200 (CEST)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Imre Deak <imre.deak@intel.com>
cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v2 29/34] drm/xe/kunit: Build DP link display tests
In-Reply-To: <20260701153204.4124150-30-imre.deak@intel.com>
Message-ID: <b651cf45-e19f-f509-fa21-e17c026f003b@intel.com>
References: <20260701153204.4124150-1-imre.deak@intel.com>
 <20260701153204.4124150-30-imre.deak@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-346222691-1783117240=:605841"
Content-ID: <0089ecbd-0590-a9cc-7499-b873a7c377fa@intel.com>
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

--8323329-346222691-1783117240=:605841
Content-Type: text/plain; CHARSET=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <1e587008-e2bb-2531-e411-c52df0aacbf0@intel.com>

On Wed, 1 Jul 2026, Imre Deak wrote:
> Hook the shared i915 display DP link KUnit tests into the xe display
> test build.
>
> Build the shared display test source from the i915 display test directory
> when xe display support is enabled.
>
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
> drivers/gpu/drm/xe/Makefile               |  3 +++
> drivers/gpu/drm/xe/display/tests/Makefile | 11 +++++++++++
> 2 files changed, 14 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/display/tests/Makefile
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index e5a04253e73bf..3ff58186c7678 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -373,6 +373,9 @@ xe-$(CONFIG_DRM_XE_DP_TUNNEL) += \
>
> obj-$(CONFIG_DRM_XE) += xe.o
> obj-$(CONFIG_DRM_XE_KUNIT_TEST) += tests/
> +ifeq ($(CONFIG_DRM_XE_DISPLAY),y)
> +	obj-$(CONFIG_DRM_XE_KUNIT_TEST) += display/tests/
> +endif
>
> # header test
> hdrtest_find_args := -not -path xe_rtp_helpers.h
> diff --git a/drivers/gpu/drm/xe/display/tests/Makefile b/drivers/gpu/drm/xe/display/tests/Makefile
> new file mode 100644
> index 0000000000000..1a582febe17a6
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/display/tests/Makefile
> @@ -0,0 +1,11 @@

Not sure but I think # SPDX ... boilterplate is missing.

Otherwise or if does not apply:

Reviewed-by: Micha³ Grzelak <michal.grzelak@intel.com>

BR,
Micha³

> +subdir-ccflags-$(CONFIG_DRM_XE_DISPLAY) += \
> +	-I$(srctree)/drivers/gpu/drm/i915/display/
> +
> +# Rule to build display code shared with i915
> +$(obj)/i915-display/tests/%.o: $(srctree)/drivers/gpu/drm/i915/display/tests/%.c FORCE
> +	$(call cmd,force_checksrc)
> +	$(call if_changed_rule,cc_o_c)
> +
> +obj-$(CONFIG_DRM_XE_KUNIT_TEST) += xe_display_test.o
> +xe_display_test-y = \
> +		i915-display/tests/intel_dp_link_test.o
> -- 
> 2.49.1
>
>
--8323329-346222691-1783117240=:605841--
