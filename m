Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54E69D7236C
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jan 2026 11:42:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFAFE10EACD;
	Fri, 23 Jan 2026 11:42:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iKpulLSK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6773110EAC8;
 Fri, 23 Jan 2026 11:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769168575; x=1800704575;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=rreJ9wbFxkZSzyhi1n32Dm1Bdgf+97iqF/Ip1QsPq3s=;
 b=iKpulLSKl5EeL/3S72G1WGX5ojA1u/VKX0I96hUbevPojzxIppXqn+ax
 BpAgRRGNVA1ngr69ZEY3sXQ2fgiIPkoYNk1hmLTl6xIDfmeMZaMEFniRj
 MAvdHoOzyTRUFHs0I2wqEVysYTex3GO86pEYlbwG//Sgo79hJUtjFFPZf
 8yVRIDPUSWYIpmBzJyuO2JVzqFYhpg7zlRYHfk7qAEK/z4PTVV3kDzd5h
 yHnN5zi/4RjZnBpsLN753j/vDwfLCbOaWUMFBFnne68gR35WFOrlMnX4W
 eJ0rE22stn2+aeMpZFaVa/MWP57oP/WZZIPzawWueC50tHaFiP3XgfaO2 w==;
X-CSE-ConnectionGUID: T6kZOmDuQx6c+1O3nFDH/g==
X-CSE-MsgGUID: HJs0dbCxTzeGP//Vafh68g==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="87998467"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="87998467"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 03:42:55 -0800
X-CSE-ConnectionGUID: bB6z3lh3Qm2/vuXwlVmSmA==
X-CSE-MsgGUID: 8QmwtAOLQbGVNP34C0FpLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="238263812"
Received: from aotchere-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.2])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 03:42:53 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>
Subject: Re: [PATCH v1 0/1] rename GEN6_PCODE_DATA to match spec
In-Reply-To: <20260123105525.572035-1-michal.grzelak@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260123105525.572035-1-michal.grzelak@intel.com>
Date: Fri, 23 Jan 2026 13:42:50 +0200
Message-ID: <74be2b0358f824af7aa7ddcbf15aed3e8424b1a0@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Fri, 23 Jan 2026, Micha=C5=82 Grzelak <michal.grzelak@intel.com> wrote:
> This patch should be applied on top of [1].
>
> [1]
> https://lore.kernel.org/intel-gfx/20260115113337.4079184-1-jani.nikula@in=
tel.com

There's not a whole lot of point in sending patches that depend on other
patches, because you won't get CI results, and any review depends on the
other patch having been merged.

BR,
Jani.

>
> BR,
> Micha=C5=82
>
> Micha=C5=82 Grzelak (1):
>   drm/{i915,xe}/pcode: rename GEN6_PCODE_DATA to match spec
>
>  drivers/gpu/drm/i915/display/intel_parent.c   |  4 ++--
>  drivers/gpu/drm/i915/display/intel_parent.h   |  2 +-
>  drivers/gpu/drm/i915/gvt/handlers.c           |  2 +-
>  drivers/gpu/drm/i915/i915_reg.h               |  2 +-
>  drivers/gpu/drm/i915/intel_gvt_mmio_table.c   |  2 +-
>  drivers/gpu/drm/i915/intel_pcode.c            | 14 +++++++-------
>  drivers/gpu/drm/i915/intel_pcode.h            |  2 +-
>  drivers/gpu/drm/xe/display/xe_display_pcode.c |  4 ++--
>  drivers/gpu/drm/xe/xe_pcode.c                 |  4 ++--
>  drivers/gpu/drm/xe/xe_pcode.h                 |  2 +-
>  10 files changed, 19 insertions(+), 19 deletions(-)

--=20
Jani Nikula, Intel
