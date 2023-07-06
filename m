Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B12EB64D9
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jul 2023 14:49:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61C5710E41B;
	Thu,  6 Jul 2023 14:49:17 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C94D10E41B
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jul 2023 14:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688654955; x=1720190955;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=Rhtx069BQv6yE+wc8PUfkzz5r2Cv5q4EJElsehTsa9M=;
 b=EvcuCR6CdByjNJq5prkKujhnR4smlmRM3zYV4oMb5JfmbLkMksxKi1kC
 UwQnWsvdLMyavRSq1z3uaZdDkwwjrTvJ8WF2lDSJ5bIfoq/zsZUgOQ1oV
 rktLT2FztUFL1MdIY28QbdPF4/KMsFDHHcD0msZAByuyLClt1J9YAN0LG
 97t5wCPxo2u1wBrHepmQ8mIcVvhAxEjHsV7EWcDZqguptvrcpnqtCnWrq
 9ogcWu0ziJDm1gOXn1Md/EgHzECMVfMe7hO9iaMrfhBflyPdjPSfCbi0u
 C3Y9iRQBnjOMN8dazVFURA5yDMH/RL5W0+Spw5Hh1mwf/QCxztahVzY9O w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="429661553"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="429661553"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 07:49:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="696867484"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="696867484"
Received: from jmvuilla-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.41.105])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 07:49:03 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20230706142728.6-2-francois.dugast@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230706142728.6-1-francois.dugast@intel.com>
 <20230706142728.6-2-francois.dugast@intel.com>
Date: Thu, 06 Jul 2023 17:49:01 +0300
Message-ID: <87mt09jdsy.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH 1/2] fixup! drm/xe: Introduce a new DRM
 driver for Intel GPUs
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
> Fix some SPDX license identifier warnings reported by checkpatch.
>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_map.h   | 2 +-
>  drivers/gpu/drm/xe/xe_trace.c | 2 +-
>  drivers/gpu/drm/xe/xe_trace.h | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_map.h b/drivers/gpu/drm/xe/xe_map.h
> index 032c2e8b5438..f62e0c8b67ab 100644
> --- a/drivers/gpu/drm/xe/xe_map.h
> +++ b/drivers/gpu/drm/xe/xe_map.h
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: MIT
> +/* SPDX-License-Identifier: MIT */
>  /*
>   * Copyright =C2=A9 2022 Intel Corporation
>   */
> diff --git a/drivers/gpu/drm/xe/xe_trace.c b/drivers/gpu/drm/xe/xe_trace.c
> index 1026fb37f75b..70c8a5f1a9ca 100644
> --- a/drivers/gpu/drm/xe/xe_trace.c
> +++ b/drivers/gpu/drm/xe/xe_trace.c
> @@ -1,4 +1,4 @@
> -// SPDX-Liense-Identifier: GPL-2.0
> +// SPDX-License-Identifier: MIT

The trace system is GPL-2.0, and all trace users are innately tied to
the guts of it, not linked to. Usually trace stuff has been GPL-2.0 for
this reason.

>  /*
>   * Copyright =C2=A9 2022 Intel Corporation
>   */
> diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> index 02861c26e145..b92ad4ab1c79 100644
> --- a/drivers/gpu/drm/xe/xe_trace.h
> +++ b/drivers/gpu/drm/xe/xe_trace.h
> @@ -1,4 +1,4 @@
> -/* SPDX-Liense-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: MIT */

Ditto.

>  /*
>   * Copyright =C2=A9 2022 Intel Corporation
>   */

--=20
Jani Nikula, Intel Open Source Graphics Center
