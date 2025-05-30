Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7AEFC5B543
	for <intel-xe@archiver.kernel.org>; Fri, 30 May 2025 16:02:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9966B10E0DF;
	Fri, 30 May 2025 16:02:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OQf1pj6d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EBBE10E0DF
 for <intel-xe@lists.freedesktop.org>; Fri, 30 May 2025 16:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748620951; x=1780156951;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qtzGHVKWROgUsl/JT7shH/Whylxk7WmScH3cN5YJhls=;
 b=OQf1pj6d8s1qHeN6bXGDf+v4Ue2tmZeSrXMqDeMFjKIkvK1cIZs7DsnU
 mWSAtqQLlOhB6HZc8XxQCOsJhUaVIV6Bi0WSJyf1r1hqz9ZSVHoIq+H49
 o9Vg79pWjN37LlyHiaE43DryBWgg8Glkju9Lvr9i5sb/UuAW7qTuIX1+G
 OKeq74eiX6jCci6zU68MwfmDmtcGyEMo5f+dwjshFi9AzUO9Og8dFw/Nz
 QwIRPx+ki81zsEm8/bnQyKdFAo2uzIqHpLgfjQMUyqaNPcsn1oY07bTdf
 mwczAfzSFZHWVfmfMEZ6ZBnrstN43fMyb+gwONpfJheiajwcT4KnRJRtT g==;
X-CSE-ConnectionGUID: 35HkF9SYSKWnMpn185rikg==
X-CSE-MsgGUID: XAXp6Km+QjmALtWBfcpy2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="50820752"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; d="scan'208";a="50820752"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 09:02:30 -0700
X-CSE-ConnectionGUID: iatMaMblTOCqy9a732VN8g==
X-CSE-MsgGUID: +f6uIb0hSLyOIGX31ICatg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; d="scan'208";a="149187620"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 09:02:27 -0700
Date: Fri, 30 May 2025 19:02:23 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
 "Tauro, Riana" <riana.tauro@intel.com>,
 "Adatrao, Srinivasa" <srinivasa.adatrao@intel.com>,
 intel-xe@lists.freedesktop.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: Re: [PATCH v1 2/2] drm/xe: Support for I2C attached MCUs
Message-ID: <aDnWj-AnDxHp9hOj@black.fi.intel.com>
References: <20250530141744.3605983-1-heikki.krogerus@linux.intel.com>
 <20250530141744.3605983-3-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530141744.3605983-3-heikki.krogerus@linux.intel.com>
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

On Fri, May 30, 2025 at 05:17:44PM +0300, Heikki Krogerus wrote:
> Adding adaption/glue layer where the I2C host adapter
> (Synopsys DesignWare I2C adapter) and the I2C clients (the
> microcontroller units) are enumerated.
> 
> The microcontroller units (MCU) that are attached to the GPU
> depend on the OEM. The initially supported MCU will be the
> Add-In Management Controller (AMC).

...

> diff --git a/drivers/gpu/drm/xe/regs/xe_i2c_regs.h b/drivers/gpu/drm/xe/regs/xe_i2c_regs.h
> new file mode 100644
> index 000000000000..2acb55eeef0d
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/regs/xe_i2c_regs.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _XE_I2C_REGS_H_
> +#define _XE_I2C_REGS_H_
> +
> +#include "xe_reg_defs.h"
> +
> +#define SOC_BASE			0x280000

I just noticed we already have this in xe_pmt.h, so let's not duplicate
it. Perhaps move it to a common header (xe_regs.h) and reuse it in both
places?

> +#define I2C_CONFIG_SPACE_OFFSET		(SOC_BASE + 0xf6000)
> +#define I2C_MEM_SPACE_OFFSET		(SOC_BASE + 0xf7400)
> +#define I2C_BRIDGE_OFFSET		(SOC_BASE + 0xd9000)
> +
> +#define CLIENT_DISC_COOKIE		XE_REG(SOC_BASE + 0x0164)
> +#define CLIENT_DISC_ADDRESS		XE_REG(SOC_BASE + 0x0168)
> +
> +#endif /* _XE_I2C_REGS_H_ */

Raag
