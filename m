Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC71C7EE30
	for <intel-xe@archiver.kernel.org>; Tue,  1 Jul 2025 12:45:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1046010E288;
	Tue,  1 Jul 2025 12:45:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K8RJxvPX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2114A10E288
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Jul 2025 12:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751373928; x=1782909928;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8/zmwOwLzAK8T5B+sPvRSllq5AcW9W6+UmpHBMo9FYs=;
 b=K8RJxvPX2JohmcIt9T1J8LWnhOiapViIHHYsZ3A9qp0VlFzpUEj70NQN
 V2VXPz+Mx8zw9PUJBDpwgPZRiKUJp76hHanFCL9dLLDVRXZIIDe5Pgysy
 2pHWK18kEB58cEFT4xU1rhC4DPB95Bapvf+SfLXrFel180hHRAbIDYD+3
 JsjE2ig2YZ5LfYKYXvsoOBuv3jh8VhmQZT7s1j4yNRQ0s6xm3y5MT+g0B
 Em45wWeotWz+GDKPQOXa8EbSUNF7G9iSNJ9r2B9EzL9Hv4y46GiPK7lBn
 RUN3VWCVJXEe4Chtg0LhRvAKQ/NM8z4tr+zGb0SesZlqZPNtmtQqHTzyT A==;
X-CSE-ConnectionGUID: KL8SIuuARwWT3OOQwEbYlw==
X-CSE-MsgGUID: 4a3qC/V/SS6DjQdwxm/lpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53507892"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="53507892"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 05:42:53 -0700
X-CSE-ConnectionGUID: x8FgYkrQQW+gNYN4KhhCRQ==
X-CSE-MsgGUID: RBqvSRXiRSufYiZGGa2lHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="184698685"
Received: from smile.fi.intel.com ([10.237.72.52])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 05:42:46 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1uWaJu-0000000Bb8V-47cV; Tue, 01 Jul 2025 15:42:42 +0300
Date: Tue, 1 Jul 2025 15:42:42 +0300
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
Subject: Re: [PATCH v6 1/5] i2c: designware: Use polling by default when
 there is no irq resource
Message-ID: <aGPXwll6Hh2cZfnp@smile.fi.intel.com>
References: <20250701122252.2590230-1-heikki.krogerus@linux.intel.com>
 <20250701122252.2590230-2-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701122252.2590230-2-heikki.krogerus@linux.intel.com>
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

On Tue, Jul 01, 2025 at 03:22:48PM +0300, Heikki Krogerus wrote:
> The irq resource itself can be used as a generic way to
> determine when polling is needed.
> 
> This not only removes the need for special additional device
> properties that would soon be needed when the platform may
> or may not have the irq, but it also removes the need to
> check the platform in the first place in order to determine
> is polling needed or not.

> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
> Hi guys,
> 
> I found the thread with Jarkko's comments from my archives. He wanted
> the local flags variable to be added because he wants the order of the
> calls to remain as it is now - the device is allocated only after the
> irq is checked.

Yes, thanks.

...

> +	u32 flags = (uintptr_t)device_get_match_data(&pdev->dev);

> +	irq = platform_get_irq_optional(pdev, 0);
> +	if (irq == -ENXIO)
> +		flags |= ACCESS_POLLING;
> +	else if (irq < 0)
>  		return irq;

>  	if (device_property_present(device, "wx,i2c-snps-model"))
> +		flags = MODEL_WANGXUN_SP | ACCESS_POLLING;

Now I'm a bit puzzled why do we need to add this flag explicitly here?
Does Wnagxun provides an IRQ and chooses at the same time to poll?
Shouldn't this patch rather fix that?

-- 
With Best Regards,
Andy Shevchenko


