Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB817C6FD1C
	for <intel-xe@archiver.kernel.org>; Thu, 23 Mar 2023 10:58:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9F6B10E098;
	Thu, 23 Mar 2023 10:58:30 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1840D10E098
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Mar 2023 10:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679569109; x=1711105109;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=aPMJ+zMiSqdFLm8swKWvqeq0nU2gQvmECXWRBSB0oak=;
 b=I/JR8/8tJxICnwjlaLLC6b8AdRclS96r9yrurZIx0cHiiqKK4mjGenVr
 UvR3FgHnEooNtBN6fAdzp2WECqMZDOk+Yo9gkHU88gfU86/TJ2RexWPbd
 z6Nfny+f7ksJ4ejk+yf58BR5615NkTctgPaEJ2B3M82OfCS+PBGzGvy2i
 luzHPdBlKb6TZd2SpcRH/RXZP21rg/XrgcZDX6zZQL285ZJeMHIWeRovl
 vTHbZGAuy9YZjvkjvNCzEow/TLXhx+QKURfd36L0XIDBNm/TAd3pynQuP
 tzr+lQpqC4XTqQh2+aOKZxDf3IhePV/Ef+NR6Qtctd72ndvanoermLa6+ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="339487555"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="339487555"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 03:58:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="684674903"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="684674903"
Received: from rkiss-mobl.ger.corp.intel.com (HELO localhost) ([10.252.63.51])
 by fmsmga007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 03:58:24 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20230323085052.153697-1-maarten.lankhorst@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230323085052.153697-1-maarten.lankhorst@linux.intel.com>
Date: Thu, 23 Mar 2023 12:58:22 +0200
Message-ID: <875yar7n01.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH] drm/xe: Rename intel_de.h to xe_de.h
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

On Thu, 23 Mar 2023, Maarten Lankhorst <maarten.lankhorst@linux.intel.com> =
wrote:
> Rename intel_de.h to xe_de.h in order to remove #include_next,
> and change the ifdef guard to be the same as the rest of xe headers.
>
> This is consistent with the other files that are inside xe/display,
> and implement xe specific behavior.
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_de.h            | 2 +-
>  drivers/gpu/drm/xe/display/{intel_de.h =3D> xe_de.h} | 8 ++++----
>  2 files changed, 5 insertions(+), 5 deletions(-)
>  rename drivers/gpu/drm/xe/display/{intel_de.h =3D> xe_de.h} (97%)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm/i9=
15/display/intel_de.h
> index 5c223ff6b3ec..267b1108abbb 100644
> --- a/drivers/gpu/drm/i915/display/intel_de.h
> +++ b/drivers/gpu/drm/i915/display/intel_de.h
> @@ -4,7 +4,7 @@
>   */
>=20=20
>  #ifdef BUILD_FOR_XE

I wonder why this isn't just

#ifndef I915

and why do we need the separate

	-DBUILD_FOR_XE=3D1 \

in xe Makefile?

BR,
Jani.


> -#include_next "intel_de.h"
> +#include "xe_de.h"
>  #else
>  #ifndef __INTEL_DE_H__
>  #define __INTEL_DE_H__
> diff --git a/drivers/gpu/drm/xe/display/intel_de.h b/drivers/gpu/drm/xe/d=
isplay/xe_de.h
> similarity index 97%
> rename from drivers/gpu/drm/xe/display/intel_de.h
> rename to drivers/gpu/drm/xe/display/xe_de.h
> index 0d0504b483ef..9f92fdb4159a 100644
> --- a/drivers/gpu/drm/xe/display/intel_de.h
> +++ b/drivers/gpu/drm/xe/display/xe_de.h
> @@ -1,10 +1,10 @@
>  /* SPDX-License-Identifier: MIT */
>  /*
> - * Copyright =C2=A9 2019 Intel Corporation
> + * Copyright =C2=A9 2019-2022 Intel Corporation
>   */
>=20=20
> -#ifndef __INTEL_DE_H__
> -#define __INTEL_DE_H__
> +#ifndef _XE_DE_H_
> +#define _XE_DE_H_
>=20=20
>  #include "i915_drv.h"
>  #include "xe_mmio.h"
> @@ -159,4 +159,4 @@ static inline int intel_de_pcode_request(struct drm_i=
915_private *i915, u32 mbox
>  				timeout_base_ms);
>  }
>=20=20
> -#endif /* __INTEL_DE_H__ */
> +#endif

--=20
Jani Nikula, Intel Open Source Graphics Center
