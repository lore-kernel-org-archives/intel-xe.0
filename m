Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2460E9B262
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 13:07:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FD2810E151;
	Tue, 24 Feb 2026 13:07:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ATq4tqFY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83E4F10E151;
 Tue, 24 Feb 2026 13:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771938445; x=1803474445;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=FPlDcscWZgNNb7zWv7mk6QT1Eft5bG06Ej2rgu+VTb8=;
 b=ATq4tqFYKs8SeLu4oNAdD+SUnEOjC2L6ihixb/Z3xC5iFUSq2nWSVBID
 EfFBrRBMwpGdVofwrgpZq6aMReRrAe+ZuicpHrBNG+KOZ5oQ6zbK+po0E
 SoGHapMCyCVwjprN2paOpVaGozPBFN5P2/swIYGtAUU+CdjJhpwre2+OE
 nnOHeL4mkwW7t+BvAE5pXPSWCU8yGjfOx8Oy2J8sAUbTIqhsfxQmMXP3l
 4fT+51cG9HEoPFFGIQKIXEgaSa7VejHTmkaA3iPCucrnelkSdlSseCwWl
 ZUN0wLwzO3Uqe01Diw6Nq0Nje4nuAV6FZRHP64epIwkC/XpeCao05E+Bv A==;
X-CSE-ConnectionGUID: adi7m6t3QaKNT2/isAa2WQ==
X-CSE-MsgGUID: 6V2AKgnZSTS4/r00A9Hxjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="73014965"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="73014965"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 05:07:25 -0800
X-CSE-ConnectionGUID: WzQQQks8TKCGyHZv9Z7LOw==
X-CSE-MsgGUID: Rq1T8d5cRxW9x0E+TkUz5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="215759147"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.20])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 05:07:23 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Uma Shankar <uma.shankar@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, Uma Shankar <uma.shankar@intel.com>
Subject: Re: [PATCH] drm/xe/compat: Remove unused i915_reg.h from compat header
In-Reply-To: <20260223171015.1035550-1-uma.shankar@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260223171015.1035550-1-uma.shankar@intel.com>
Date: Tue, 24 Feb 2026 15:07:19 +0200
Message-ID: <9f4d35467196e95d548030876a7f73386ed36d79@intel.com>
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

On Mon, 23 Feb 2026, Uma Shankar <uma.shankar@intel.com> wrote:
> Display Code is made independent of i915_reg.h, hence
> it can be dropped from compat header.
>
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>

I already sent the same patch earlier, but *shrug*.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/xe/compat-i915-headers/i915_reg.h | 6 ------
>  1 file changed, 6 deletions(-)
>  delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_reg.h
>
> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_reg.h b/drivers/=
gpu/drm/xe/compat-i915-headers/i915_reg.h
> deleted file mode 100644
> index 8619ec015ad4..000000000000
> --- a/drivers/gpu/drm/xe/compat-i915-headers/i915_reg.h
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -/* SPDX-License-Identifier: MIT */
> -/*
> - * Copyright =C2=A9 2023 Intel Corporation
> - */
> -
> -#include "../../i915/i915_reg.h"

--=20
Jani Nikula, Intel
