Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16234EB64D9
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jul 2023 14:46:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8FE710E417;
	Thu,  6 Jul 2023 14:46:36 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82EF310E417
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jul 2023 14:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688654795; x=1720190795;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=Dc8uWbcf2RebKRQnAEkDZXq1dQOKUbEA/tO3bRVMcjI=;
 b=bKdwFhfCxk1MlMLgHMgXJI7BWJ1QRPLQHlS1WzTWlfjVUxMpQPR6weQQ
 DlK+kax+wn+9mmc0Y0QhtBZBEokUJWPb5PiPzSQaLC/dtRWJnXIxJlDdI
 Y/jJxiuMRHGQr4gPNVdHx2P/jhRdpGEa+hHP/9FMDc5GTWOjwFArSnkeX
 IkIbDp7STkm8wim4TJCQQhqYRMXaEk+F4Mjw5HkSequ69KMC96QJNUF4r
 pzCR6HZeEPo6S8PX0/Ldz6rdYFeJNSMN0NmV8ODMFF8fDgH5GMOO5iQiZ
 HzUCKa+UXQeiePsLA0weUbDVbwWfoMbFzCFkAx3ytezxkXy0L3M5Ju8HY Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="394378718"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="394378718"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 07:46:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="832969155"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="832969155"
Received: from jmvuilla-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.41.105])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 07:46:33 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20230706142728.6-3-francois.dugast@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230706142728.6-1-francois.dugast@intel.com>
 <20230706142728.6-3-francois.dugast@intel.com>
Date: Thu, 06 Jul 2023 17:46:30 +0300
Message-ID: <87pm55jdx5.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH 2/2] fixup! drm/xe/display: Implement display
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
Cc: Francois Dugast <francois.dugast@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, 06 Jul 2023, Francois Dugast <francois.dugast@intel.com> wrote:
> Fix some SPDX license identifier warnings reported by checkpatch
> in the display code.
>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  .../xe/compat-i915-headers/soc/intel_dram.h   |  5 +++++
>  .../xe/compat-i915-headers/soc/intel_pch.h    |  5 +++++
>  .../drm/xe/display/ext/intel_clock_gating.c   | 20 +-----------------
>  .../drm/xe/display/ext/intel_device_info.c    | 21 +------------------
>  .../drm/xe/display/ext/intel_device_info.h    | 21 +------------------
>  5 files changed, 13 insertions(+), 59 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_dram.h b/dr=
ivers/gpu/drm/xe/compat-i915-headers/soc/intel_dram.h
> index 1532ca7e0af6..65707e20c557 100644
> --- a/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_dram.h
> +++ b/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_dram.h
> @@ -1 +1,6 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright =C2=A9 2023 Intel Corporation
> + */
> +

The entire file is just a single line include, and it's going to stay
that way. I really did not see much point in adding license or copyright
boilerplate.

>  #include "../../../i915/soc/intel_dram.h"
> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_pch.h b/dri=
vers/gpu/drm/xe/compat-i915-headers/soc/intel_pch.h
> index 823803f7e853..9c46556d33a4 100644
> --- a/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_pch.h
> +++ b/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_pch.h
> @@ -1 +1,6 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright =C2=A9 2023 Intel Corporation
> + */
> +

Ditto.

>  #include "../../../i915/soc/intel_pch.h"
> diff --git a/drivers/gpu/drm/xe/display/ext/intel_clock_gating.c b/driver=
s/gpu/drm/xe/display/ext/intel_clock_gating.c
> index 0d67b0961d74..766c21a19181 100644
> --- a/drivers/gpu/drm/xe/display/ext/intel_clock_gating.c
> +++ b/drivers/gpu/drm/xe/display/ext/intel_clock_gating.c
> @@ -1,25 +1,7 @@
> +// SPDX-License-Identifier: MIT
>  /*
>   * Copyright =C2=A9 2012 Intel Corporation
>   *
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

The file is copy-paste from i915 for the time being. Please let's not
deviate from the original for no real benefit. It'll be easier to
deduplicate later.

>   * Authors:
>   *    Eugeni Dodonov <eugeni.dodonov@intel.com>
>   *
> diff --git a/drivers/gpu/drm/xe/display/ext/intel_device_info.c b/drivers=
/gpu/drm/xe/display/ext/intel_device_info.c
> index 29f3909e018a..fb8112ee5b28 100644
> --- a/drivers/gpu/drm/xe/display/ext/intel_device_info.c
> +++ b/drivers/gpu/drm/xe/display/ext/intel_device_info.c
> @@ -1,25 +1,6 @@
> +// SPDX-License-Identifier: MIT
>  /*
>   * Copyright =C2=A9 2016 Intel Corporation
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

Ditto.

>   */
>=20=20
>  #include "intel_cdclk.h"
> diff --git a/drivers/gpu/drm/xe/display/ext/intel_device_info.h b/drivers=
/gpu/drm/xe/display/ext/intel_device_info.h
> index 959acb261007..57f3aaaa95e5 100644
> --- a/drivers/gpu/drm/xe/display/ext/intel_device_info.h
> +++ b/drivers/gpu/drm/xe/display/ext/intel_device_info.h
> @@ -1,25 +1,6 @@
> +/* SPDX-License-Identifier: MIT */
>  /*
>   * Copyright =C2=A9 2014-2017 Intel Corporation
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

Ditto.

>   */
>=20=20
>  #ifndef _INTEL_DEVICE_INFO_H_

--=20
Jani Nikula, Intel Open Source Graphics Center
