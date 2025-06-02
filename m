Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA6AC54FB3
	for <intel-xe@archiver.kernel.org>; Mon,  2 Jun 2025 13:03:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 277A710E519;
	Mon,  2 Jun 2025 13:03:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HFbEzJnQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECF3010E519
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Jun 2025 13:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748869387; x=1780405387;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=K5nk/IAeY+mpdTg6NuBLV2lz9bsm0lJWO6BlmXTmEAA=;
 b=HFbEzJnQEzo+SuvEnDSIHPfWyHZbdhz2KydIFYm9DDUi5xx8ubujP1+L
 nnyxaOA3UAOyHCkeYIqBIgRn1QGXbFbO/VFtDMKRVb3ngCeAj3wvGMtyL
 hGt8kSjUcZluE9yC+oFAkEHUlKOHlR+Kt8YddN3cDIApehtOJt034+m/3
 y8Yc6aZ5qML+M1jDMF8rh3fhkeBqtXlAt/zKQWLwwOopRW0G5SgOkQxos
 UhyWVIxW1HYwVYg32wnWQY7XYqZuTUlUsAJQEHgKqDFIH2cyKJHywAQn1
 OD7wUs8K7nPZI4SvMPShf9wopWAzQkg/Fh6r1YbLfT4i0F253lIEkbji0 A==;
X-CSE-ConnectionGUID: 1m6hWuUkSquOxoU25UqjFw==
X-CSE-MsgGUID: XzvEf3YaRGC4lHbDcSDM9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="68299269"
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; d="scan'208";a="68299269"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 06:03:06 -0700
X-CSE-ConnectionGUID: br2vThliSNSNxXb3Qj6AMw==
X-CSE-MsgGUID: 9ThLV9/XTdGJKnvZ30Bw7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; d="scan'208";a="149813661"
Received: from kuha.fi.intel.com ([10.237.72.152])
 by orviesa005.jf.intel.com with SMTP; 02 Jun 2025 06:03:02 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Mon, 02 Jun 2025 16:03:00 +0300
Date: Mon, 2 Jun 2025 16:03:00 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
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
Message-ID: <aD2hBF23eNeEJJYj@kuha.fi.intel.com>
References: <20250530141744.3605983-1-heikki.krogerus@linux.intel.com>
 <20250530141744.3605983-3-heikki.krogerus@linux.intel.com>
 <aDnWj-AnDxHp9hOj@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDnWj-AnDxHp9hOj@black.fi.intel.com>
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

On Fri, May 30, 2025 at 07:02:23PM +0300, Raag Jadav wrote:
> On Fri, May 30, 2025 at 05:17:44PM +0300, Heikki Krogerus wrote:
> > Adding adaption/glue layer where the I2C host adapter
> > (Synopsys DesignWare I2C adapter) and the I2C clients (the
> > microcontroller units) are enumerated.
> > 
> > The microcontroller units (MCU) that are attached to the GPU
> > depend on the OEM. The initially supported MCU will be the
> > Add-In Management Controller (AMC).
> 
> ...
> 
> > diff --git a/drivers/gpu/drm/xe/regs/xe_i2c_regs.h b/drivers/gpu/drm/xe/regs/xe_i2c_regs.h
> > new file mode 100644
> > index 000000000000..2acb55eeef0d
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/regs/xe_i2c_regs.h
> > @@ -0,0 +1,16 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef _XE_I2C_REGS_H_
> > +#define _XE_I2C_REGS_H_
> > +
> > +#include "xe_reg_defs.h"
> > +
> > +#define SOC_BASE			0x280000
> 
> I just noticed we already have this in xe_pmt.h, so let's not duplicate
> it. Perhaps move it to a common header (xe_regs.h) and reuse it in both
> places?

Makes sense to me. If no objections, I'll move it there in v2.

thanks,

> > +#define I2C_CONFIG_SPACE_OFFSET		(SOC_BASE + 0xf6000)
> > +#define I2C_MEM_SPACE_OFFSET		(SOC_BASE + 0xf7400)
> > +#define I2C_BRIDGE_OFFSET		(SOC_BASE + 0xd9000)
> > +
> > +#define CLIENT_DISC_COOKIE		XE_REG(SOC_BASE + 0x0164)
> > +#define CLIENT_DISC_ADDRESS		XE_REG(SOC_BASE + 0x0168)
> > +
> > +#endif /* _XE_I2C_REGS_H_ */

-- 
heikki
