Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 299F0FC5915
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 12:17:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6040B10E912;
	Thu, 26 Feb 2026 12:17:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wz5yp9Ji";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26BD810E90E;
 Thu, 26 Feb 2026 12:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772108232; x=1803644232;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=TQJDoXtWhJcJJzdySbHmUnGWWj2LlxH8T6/z6pZx58s=;
 b=Wz5yp9JixT7r/BmV+sQwdU8q2M9DjNeCdJVef2AyQ94fZZ4jfVwz9JD9
 +BrXlOL5UKU/zH/8OuMktPK4zlM5VipB6vfk57F3wSh+8vuW3kFRr0IZs
 V6tIQUCGubzn25zT7AwnKeJt4tYKTmzsPhM+E+wGr0nCy9BcE3v++CRR2
 8Q0MKQtHCN1t0uMwDyt6EQNfveLbM0IoLp5bPftsPSIg3a6wZ6ghSWH9O
 Cj1qzs3cj+gQa/hlRMnoqv5leeKinfx4ajqMrk/TWzxlxaDTP93hIU8cu
 LtEdmX9b8SOYjRjd/F90aitBnEsbuj9munpd7slZrBvwx6oHgA3Du9D2U g==;
X-CSE-ConnectionGUID: a4i00Mx/Tze2aJC2yfj3SQ==
X-CSE-MsgGUID: utaBJnMHT7uXlbZkpwvQbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="90575531"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="90575531"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 04:17:04 -0800
X-CSE-ConnectionGUID: SwlkkohRR/agPFZ0Fi4Txw==
X-CSE-MsgGUID: G2vr/5b0Rn+fww45/gxzEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="254312374"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.148])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 04:17:02 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Uma Shankar <uma.shankar@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: Uma Shankar <uma.shankar@intel.com>
Subject: Re: [PATCH] Revert "drm/xe/compat: Remove unused i915_reg.h from
 compat header"
In-Reply-To: <20260226113413.2045899-1-uma.shankar@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260226113413.2045899-1-uma.shankar@intel.com>
Date: Thu, 26 Feb 2026 14:16:58 +0200
Message-ID: <31400408b96cea86d7485c1079fdc340f5c64280@intel.com>
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

On Thu, 26 Feb 2026, Uma Shankar <uma.shankar@intel.com> wrote:
> This reverts commit 4953d806a423087fcc49d4f8884fde85cd23ec1e.
> Change breaks build for drm-xe-next, hence revert.
>
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>

Acked-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/xe/compat-i915-headers/i915_reg.h | 6 ++++++
>  1 file changed, 6 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_reg.h
>
> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_reg.h b/drivers/=
gpu/drm/xe/compat-i915-headers/i915_reg.h
> new file mode 100644
> index 000000000000..8619ec015ad4
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_reg.h
> @@ -0,0 +1,6 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright =C2=A9 2023 Intel Corporation
> + */
> +
> +#include "../../i915/i915_reg.h"

--=20
Jani Nikula, Intel
