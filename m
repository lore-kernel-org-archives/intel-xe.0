Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 228EBC77B7F
	for <intel-xe@archiver.kernel.org>; Fri, 27 Jun 2025 14:13:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFBFF10E328;
	Fri, 27 Jun 2025 14:13:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fHlNP7WU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4782310E328
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Jun 2025 14:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751033624; x=1782569624;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=32FONBh62JeuahpO4SNalmBjx2BSgd3T8J+Zdzf/Kbs=;
 b=fHlNP7WULHIDKAf0hYCBsGrW5WAwsz2WawwFqsKDxu7dhr5jQ1jn2Nom
 kXOliRpP3iwgqmLtsER+XYna+4maLAMK4NQgYRUKbPPWkNunoRqZVb7V7
 1axm0Lv5t/Qet01xS2DbfaeZ4b5raGOUPYeM+ISrIDO2xOAr9sOK1Of5s
 +Eb0frW4/4Zn7PKIYg9Y/uAtL6D+jN9QBVHsj+l9xkNwhpvuL7zQlOBxL
 QzLYrYQFnBH+DqYRIQCZ/bX71b5yiJ1lXbhbMXJjsPGCl9fFRqzW5m/pv
 n0vUR3Kuiw+f2ngTQyeO1SZriP5WS/QeAiGrS3vHCmsj2JayU69GvHaP+ Q==;
X-CSE-ConnectionGUID: n2wpFqqiT0OwoQFUZm/5vA==
X-CSE-MsgGUID: Qb4iLbx4TiWJXLvhKcrnLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="53431117"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="53431117"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 07:13:44 -0700
X-CSE-ConnectionGUID: gszeNA2iR2uE3ieEJVDy/w==
X-CSE-MsgGUID: usucIBTtQGqZWoiNmz2b9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="183713491"
Received: from smile.fi.intel.com ([10.237.72.52])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 07:13:40 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1uV9pg-0000000AV7n-3zOe; Fri, 27 Jun 2025 17:13:36 +0300
Date: Fri, 27 Jun 2025 17:13:36 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
 Raag Jadav <raag.jadav@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>,
 "Adatrao, Srinivasa" <srinivasa.adatrao@intel.com>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 intel-xe@lists.freedesktop.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/4] i2c: designware: Add quirk for Intel Xe
Message-ID: <aF6nEOVhLURyf616@smile.fi.intel.com>
References: <20250627135314.873972-1-heikki.krogerus@linux.intel.com>
 <20250627135314.873972-2-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627135314.873972-2-heikki.krogerus@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
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

On Fri, Jun 27, 2025 at 04:53:11PM +0300, Heikki Krogerus wrote:
> The regmap is coming from the parent also in case of Xe
> GPUs. Reusing the Wangxun quirk for that.

...

>  static int dw_i2c_plat_probe(struct platform_device *pdev)
>  {
> +	u32 flags = (uintptr_t)device_get_match_data(&pdev->dev);

> -	dev->flags = (uintptr_t)device_get_match_data(device);
>  	if (device_property_present(device, "wx,i2c-snps-model"))
> -		dev->flags = MODEL_WANGXUN_SP | ACCESS_POLLING;
> +		flags = MODEL_WANGXUN_SP | ACCESS_POLLING;
>  
>  	dev->dev = device;
>  	dev->irq = irq;
> +	dev->flags = flags;

Maybe I'm missing something, but why do we need these (above) changes?


-- 
With Best Regards,
Andy Shevchenko


