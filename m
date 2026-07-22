Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC5AC44536
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jul 2026 15:47:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 118C010EE41;
	Wed, 22 Jul 2026 15:47:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FTkpqFSk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E269A10EE41
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Jul 2026 15:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784735271; x=1816271271;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XO62lPtnHpUWFOte2XHf8/s0qIvpCMei+b3KA8XEtfc=;
 b=FTkpqFSkahFytnU2JdFn+WBJSfOF7I7g7kDXI2IamuZ5Rjg1BpYZifXJ
 6+nQfrVR49hW/sp1yxq+W6ZHtpudQg1Ptt1folSMmNZX0/Hs5/awLNjIu
 BXusTOwTVQDSu6XITvuYwVJyzp4BppUqKIF/Qkzz2Ebn+IeIHSpZGphR0
 AGw6b5d2leEUP6WTKfvIyA/Scizd3tr+nCxOQGqPDE9jXNfwpqAlBpvNA
 Ll7E6ihpm0t2s3wPUwoyjQxCAx1JQ/uyLQYklWlGJrYJjpq1noXUrZ7zm
 Fm0Uotrsht14MVngBwsqA0hbdPS3SKzWbgaO+Us4aV4bKZUSpSfM2a+e3 g==;
X-CSE-ConnectionGUID: stDFPjrnRrCC4LrLKtjvLQ==
X-CSE-MsgGUID: g08NVWstRHOrAEMVjn/zXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="89265359"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="89265359"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 08:47:50 -0700
X-CSE-ConnectionGUID: lNj6nqdGS1eEt1ywx38z+Q==
X-CSE-MsgGUID: 81JxR5/UQ+e1KX3XOfCpXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="257588009"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa008.jf.intel.com with ESMTP; 22 Jul 2026 08:47:49 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
 id 0323F98; Wed, 22 Jul 2026 17:47:48 +0200 (CEST)
Date: Wed, 22 Jul 2026 18:47:46 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org, matthew.d.roper@intel.com
Subject: Re: [PATCH v1] drm/xe/i2c: Allow per domain unique id
Message-ID: <amDmItz-EnvDNV9f@kuha>
References: <20260721113438.651100-1-raag.jadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721113438.651100-1-raag.jadav@intel.com>
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

On Tue, Jul 21, 2026 at 05:04:38PM +0530, Raag Jadav wrote:
> PCI bus, device and function can be same for devices existing across
> different domains. Allow per domain unique identifier while registering
> platform device to prevent name conflict.
> 
> Fixes: f0e53aadd702 ("drm/xe: Support for I2C attached MCUs")
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

FWIW:

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/gpu/drm/xe/xe_i2c.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
> index bd956776b10b..a26c38bb17a1 100644
> --- a/drivers/gpu/drm/xe/xe_i2c.c
> +++ b/drivers/gpu/drm/xe/xe_i2c.c
> @@ -95,18 +95,21 @@ static int xe_i2c_register_adapter(struct xe_i2c *i2c)
>  	struct platform_device *pdev;
>  	struct fwnode_handle *fwnode;
>  	int ret;
> +	u32 id;
>  
>  	fwnode = fwnode_create_software_node(xe_i2c_adapter_properties, NULL);
>  	if (IS_ERR(fwnode))
>  		return PTR_ERR(fwnode);
>  
> +	id = (pci_domain_nr(pci->bus) << 16) | pci_dev_id(pci);
> +
>  	/*
>  	 * Not using platform_device_register_full() here because we don't have
>  	 * a handle to the platform_device before it returns. xe_i2c_notifier()
>  	 * uses that handle, but it may be called before
>  	 * platform_device_register_full() is done.
>  	 */
> -	pdev = platform_device_alloc(adapter_name, pci_dev_id(pci));
> +	pdev = platform_device_alloc(adapter_name, id);
>  	if (!pdev) {
>  		ret = -ENOMEM;
>  		goto err_fwnode_remove;
> -- 
> 2.43.0

-- 
heikki
