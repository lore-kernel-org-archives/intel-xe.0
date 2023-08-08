Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24ACBC001B0
	for <intel-xe@archiver.kernel.org>; Tue,  8 Aug 2023 10:48:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D947D10E0A8;
	Tue,  8 Aug 2023 10:48:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C76F110E0A8
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Aug 2023 10:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691491697; x=1723027697;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=ZT7L1wsVKpY1RQlWQAzWiPuphZiyrMWl0zTj130N0Dg=;
 b=M4PtR34mK/0YipKEgAGYNJMkyfoQmELKYDtCmw9NxekHKqeKyzg0MGG1
 dQfbVE993lUHOf/DvedalHdh9lT3BhW7ha4suxtF8ik1hStAs192XqFva
 QVYrsyZNnmwo+2+50oxszJwb8rfk+/EWSDGdEe4jGLA4ZqC6Uw71klfqw
 U8SfsdsjrUPb9YszgB2OZ81UHPUaXybpGGWWFiZoTXcuYqeze9L6p0AIf
 xnRu+TQI+BNeCBsNtEAUqBzKwUo09IaDgBtjacJ4NFF5X1mUSfytxJ84D
 FsGxkfq1Q5bmPOPESLWQ4M6PBFzySu2CIK9qfvHLOPQjvXmsdilNucPG/ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="370777628"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; d="scan'208";a="370777628"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 03:48:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="874672166"
Received: from sschwar3-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.49.159])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 03:48:19 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20230801143631.536243-1-rodrigo.vivi@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230801143631.536243-1-rodrigo.vivi@intel.com>
Date: Tue, 08 Aug 2023 13:48:14 +0300
Message-ID: <87cyzxu7wx.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH] fixup! drm/xe/display: Implement display
 support
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, 01 Aug 2023, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> Removing unused declarations.
>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Pushed.

BR,
Jani.

> ---
>  .../drm/xe/display/ext/intel_device_info.c    |  1 -
>  .../drm/xe/display/ext/intel_device_info.h    | 38 -------------------
>  drivers/gpu/drm/xe/xe_device_types.h          |  1 -
>  3 files changed, 40 deletions(-)
>  delete mode 100644 drivers/gpu/drm/xe/display/ext/intel_device_info.h
>
> diff --git a/drivers/gpu/drm/xe/display/ext/intel_device_info.c b/drivers=
/gpu/drm/xe/display/ext/intel_device_info.c
> index 9e9ccdef81f1..614cc2900104 100644
> --- a/drivers/gpu/drm/xe/display/ext/intel_device_info.c
> +++ b/drivers/gpu/drm/xe/display/ext/intel_device_info.c
> @@ -25,7 +25,6 @@
>  #include "intel_cdclk.h"
>  #include "intel_de.h"
>  #include "intel_display.h"
> -#include "intel_device_info.h"
>  #include "i915_drv.h"
>  #include "i915_reg.h"
>  #include <drm/drm_drv.h>
> diff --git a/drivers/gpu/drm/xe/display/ext/intel_device_info.h b/drivers=
/gpu/drm/xe/display/ext/intel_device_info.h
> deleted file mode 100644
> index 959acb261007..000000000000
> --- a/drivers/gpu/drm/xe/display/ext/intel_device_info.h
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -/*
> - * Copyright =C2=A9 2014-2017 Intel Corporation
> - *
> - * Permission is hereby granted, free of charge, to any person obtaining=
 a
> - * copy of this software and associated documentation files (the "Softwa=
re"),
> - * to deal in the Software without restriction, including without limita=
tion
> - * the rights to use, copy, modify, merge, publish, distribute, sublicen=
se,
> - * and/or sell copies of the Software, and to permit persons to whom the
> - * Software is furnished to do so, subject to the following conditions:
> - *
> - * The above copyright notice and this permission notice (including the =
next
> - * paragraph) shall be included in all copies or substantial portions of=
 the
> - * Software.
> - *
> - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SH=
ALL
> - * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR =
OTHER
> - * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG
> - * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER D=
EALINGS
> - * IN THE SOFTWARE.
> - *
> - */
> -
> -#ifndef _INTEL_DEVICE_INFO_H_
> -#define _INTEL_DEVICE_INFO_H_
> -
> -#include <linux/types.h>
> -#include "xe_device_types.h"
> -
> -struct drm_i915_private;
> -
> -/* Minimal parts used by xe */
> -#define intel_runtime_info xe_device_display_info
> -
> -void intel_device_info_runtime_init(struct drm_i915_private *dev_priv);
> -
> -#endif
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe=
_device_types.h
> index b156f69d7320..c60ce94c1aac 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -18,7 +18,6 @@
>  #include "xe_step_types.h"
>=20=20
>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> -#include "ext/intel_device_info.h"
>  #include "soc/intel_pch.h"
>  #include "intel_display_core.h"
>  #include "intel_display_device.h"

--=20
Jani Nikula, Intel Open Source Graphics Center
