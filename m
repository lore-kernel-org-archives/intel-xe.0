Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27934C3DA4A
	for <intel-xe@archiver.kernel.org>; Mon, 19 Aug 2024 09:20:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E26E310E22E;
	Mon, 19 Aug 2024 09:20:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="izK4U2bK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66DE810E239
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Aug 2024 09:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724059203; x=1755595203;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=01MmijrRXX68EXSiyvDyi6Q1zCuv119EzH2kODmJogY=;
 b=izK4U2bKe5YiKXnLh3FkndWXwmTTgUtaBFovt/Yrej7XWgMVocpWRwfA
 MedcNxuDc46RgYC2fRgTjFdiEC4SQ7sAc+9EWKNxbnYblySl8jsjMm7CK
 ww0Ls65jYpHgj6XGUcPSyKuVM4NqfWdBohqCqvpSs5re1/TFMrG57xB8h
 4oMZ4iRKNjZrYU5GKTC19KcOtnyK87M7F0EcZM6XS8VtpHtK0odlT5TWW
 tsNaQzuZUbcAqzZB0bpl8+A7sQdFZqT/ey7EVI0CXPrZd6znX0sFPmA+D
 ZKTb9Y9PmxGfc+UTNNgq/rtlQjnC0Cbch20KzSOoKZ6GzGzrgiKVnBt1U Q==;
X-CSE-ConnectionGUID: fykeKtdyR32Iie/xj/6kcA==
X-CSE-MsgGUID: QiqnoGj9Rvyk3BudQ+EH5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="13088656"
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="13088656"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 02:20:03 -0700
X-CSE-ConnectionGUID: 88sWeFVLR1yh5YzbLaWVwg==
X-CSE-MsgGUID: nGai0Pd/Q2OqAbICwbVWYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="83532468"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.70])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 02:20:00 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v2 02/12] drm/xe/pxp: Allocate PXP execution resources
In-Reply-To: <20240816190024.2176976-3-daniele.ceraolospurio@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240816190024.2176976-1-daniele.ceraolospurio@intel.com>
 <20240816190024.2176976-3-daniele.ceraolospurio@intel.com>
Date: Mon, 19 Aug 2024 12:19:57 +0300
Message-ID: <87sev06f9e.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri, 16 Aug 2024, Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com> wrote:
> diff --git a/drivers/gpu/drm/xe/xe_pxp_submit.c b/drivers/gpu/drm/xe/xe_pxp_submit.c
> new file mode 100644
> index 000000000000..b777b0765c8a
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pxp_submit.c
> @@ -0,0 +1,201 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright(c) 2024 Intel Corporation.
> + */
> +
> +#include "xe_pxp_submit.h"
> +
> +#include <drm/xe_drm.h>

include/drm/xe_drm.h does not exist... but include/uapi/drm/xe_drm.h
does.

This seems to be prevalent in xe. Why does xe not use #include
<uapi/drm/xe_drm.h>?

BR,
Jani.


-- 
Jani Nikula, Intel
