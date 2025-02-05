Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B3CC02198
	for <intel-xe@archiver.kernel.org>; Wed,  5 Feb 2025 17:50:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66E8310E24A;
	Wed,  5 Feb 2025 17:50:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i6tncawz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 947E210E24A
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Feb 2025 17:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738777844; x=1770313844;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hcmi1+XWDqMTdbPS6M6lvOyIkoBDMQHm8tvFr79cT1s=;
 b=i6tncawz/mpZP5OaCEzOmLv/g3Cc1qQwRy12+1pmb8IdHZsfRORPE54Q
 Dl6olIP3ByBkKyZcnNgxuxtya2rDSbqzOWLGAPRZIiAKwPRqfaTWl1LUs
 brpJIIQCPE+EmTq44mzF4wL/FMhOCIQWP3tYMvQCiD5glsrgWVgJoan6c
 mWPH+DNr6wv6paJywvA/22XTaGTix1EIXz5kDAGdGtyepfM1YwvNivFdS
 /bjDQgY7A/tVO7j0fYGyI1yCBoK6UdCqkVItglR9SE1SfxWHmiu7WQu/E
 9zSUr4TIh8q/hQzEghd/D45AseIOASbvMj7pCeEeoxOk0XOSQaRrYBMPh Q==;
X-CSE-ConnectionGUID: iXqvR+WSREev9f5qGMyVyA==
X-CSE-MsgGUID: SwHRgT0uT2OmFUpO9hfXmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="43110433"
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; d="scan'208";a="43110433"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 09:50:44 -0800
X-CSE-ConnectionGUID: hXcv+Z1RRFGU4qBX6NFzRw==
X-CSE-MsgGUID: CAOQwxWNR/OJj0bPGYZ56w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; d="scan'208";a="111152575"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 09:50:41 -0800
Date: Wed, 5 Feb 2025 19:50:38 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 matthew.d.roper@intel.com, intel-xe@lists.freedesktop.org,
 anshuman.gupta@intel.com, riana.tauro@intel.com,
 badal.nilawar@intel.com, karthik.poosa@intel.com
Subject: Re: [PATCH v2] drm/xe/hwmon: expose package and vram temperature
Message-ID: <Z6Ok7v0cubcdf2t3@black.fi.intel.com>
References: <20250131054502.1528555-1-raag.jadav@intel.com>
 <Z5zRn9tijHkPxrhy@ashyti-mobl2.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5zRn9tijHkPxrhy@ashyti-mobl2.lan>
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

On Fri, Jan 31, 2025 at 02:35:27PM +0100, Andi Shyti wrote:
> Hi Raag,
> 
> ...
> 
> > diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> > index 519dd1067a19..f5e5234857c1 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> > @@ -34,6 +34,9 @@
> >  
> >  #define PCU_CR_PACKAGE_ENERGY_STATUS		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x593c)
> >  
> > +#define PCU_CR_PACKAGE_TEMPERATURE		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x5978)
> > +#define   TEMP_MASK				REG_GENMASK(7, 0)
> 
> is it called TEMP also in the docs? It can somehow be confused
> with "temporary".

Doc just calls it DATA, but I went with GENMASK() macro convention here.
And since it'll be used by temperature functions, the room for confusion is
less likely.

> In any case:
> 
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

I don't believe we allow duplicate tags (context: it's already in the patch),
but at some point we might want to allow it for (re-)assurance :D

Thank you (x2).

Raag
