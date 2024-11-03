Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9451FD11190
	for <intel-xe@archiver.kernel.org>; Sun,  3 Nov 2024 20:39:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DACB10E027;
	Sun,  3 Nov 2024 20:39:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="By9DeapX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E012D10E027
 for <intel-xe@lists.freedesktop.org>; Sun,  3 Nov 2024 20:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730666380; x=1762202380;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=nTemQGaF5+Uw9UFsLHiaglsHpheNiZ18BS14xk0yDAg=;
 b=By9DeapXJVyRQNWyAjVdrIE41qzGm42tAyzalsRujdGj/oh4M1gZu5wU
 d2wgUr3e6Gp7+vBlxCX+xBZVMcGPhWnInVY3xwdhvu52LZaNaEQqNVuAm
 6wOAVgcfWWVgoS/YNwFarb2MNBDmdfr2yUwtnOVIuXRfuj3VkmGXdpDZB
 /X1TWfw5kKZJ71k+kd6pKSJfy3XFJFOzZl2Jr4CQ7WteEg1feUlZPpqaP
 XjHG4tsD+0uYq9Al45c7GE2kmDw44g24lq5wMXkw5d+JYk2Wq7DCt8wzX
 Hbya45lWkHjbFQl/dZUx0eEnzdh33kPh9gzGlN6xFs/GAhWbcYkxYhVsP Q==;
X-CSE-ConnectionGUID: lKYdEg+PTo+2TQIdEGpKOw==
X-CSE-MsgGUID: /BgQ4rSvSJqVTZCPODzRCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11245"; a="41732350"
X-IronPort-AV: E=Sophos;i="6.11,255,1725346800"; d="scan'208";a="41732350"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2024 12:39:39 -0800
X-CSE-ConnectionGUID: 60cw5Wr0Q3WR0KN22HQXeg==
X-CSE-MsgGUID: k7MPV4r6Qb6GfDq01PerAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,255,1725346800"; d="scan'208";a="82992462"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa006.fm.intel.com with ESMTP; 03 Nov 2024 12:39:38 -0800
Received: from [10.245.85.128] (unknown [10.245.85.128])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 388BB28789;
 Sun,  3 Nov 2024 20:39:37 +0000 (GMT)
Message-ID: <a9c3d081-c23f-46f5-8442-b689b366324d@intel.com>
Date: Sun, 3 Nov 2024 21:39:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] drm/xe/vf: React to MIGRATED interrupt
To: Tomasz Lis <tomasz.lis@intel.com>, intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
References: <20241029193956.1043614-1-tomasz.lis@intel.com>
 <20241029193956.1043614-2-tomasz.lis@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20241029193956.1043614-2-tomasz.lis@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 29.10.2024 20:39, Tomasz Lis wrote:
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> new file mode 100644
> index 000000000000..b8c54926bdaa
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -0,0 +1,77 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023-2024 Intel Corporation
> + */
> +
> +#include <drm/drm_managed.h>
> +
> +#include "xe_assert.h"
> +#include "xe_device.h"
> +#include "xe_gt_sriov_printk.h"
> +#include "xe_sriov.h"
> +#include "xe_sriov_vf.h"
> +#include "xe_sriov_printk.h"

nit: wrong include order

