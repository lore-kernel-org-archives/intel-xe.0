Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 062E2C4450A
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jul 2026 06:26:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B227D10E12F;
	Wed, 15 Jul 2026 06:26:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EKmDQX32";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C978910E12F
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Jul 2026 06:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784096787; x=1815632787;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=eVUYpFVTszWHgQjCjItmi+arc0pkf/Nnj8W6t60TBcE=;
 b=EKmDQX32YxkljOpTnu/aU9DRPYbv2ha1Gh2c0qmLfeZCLqOlcsD6q9uQ
 aREZnpx0Hy7BXEOf95JDnjMYg2fLUKt/aMvb4wHZ363DlWaNLWZa6f68Z
 wVLDgz9PbLO0M5qwZGUHD5j6UxR0EEqRd17c8pu1kcrRpOQK3lT50OXko
 mesuXzCvMVqjedp67BMKUr2/yNGBYYQRD9T0ox610IUI6i0bSoyJHIpNX
 q5pYV47sBZHeJEFbxUdnJTypag7C0QiCWSwGb1Qb89HX0APMRoo9E6Ir9
 XDnfhAeCqSUzgjwevTBBS9yME9MLCk5C2pA8QrjLzgNz13Yn+N8w49+L2 Q==;
X-CSE-ConnectionGUID: MDX6UHlASyC2XwZL6YA0Hg==
X-CSE-MsgGUID: 46/ibBaJQCCuAbI8e+0BDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="83846397"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="83846397"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 23:26:27 -0700
X-CSE-ConnectionGUID: QtVcexa8StmR90DYVAb1Sw==
X-CSE-MsgGUID: c/szl3/FQbWGmOckl8I3nw==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 23:26:25 -0700
Date: Wed, 15 Jul 2026 08:26:22 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 Ramesh Babu B <ramesh.babu.b@intel.com>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v4 2/3] drm/xe/i2c: Fix the interrupt handling
Message-ID: <alcoDtq2aul-tA_h@black.igk.intel.com>
References: <20260713155601.711389-1-heikki.krogerus@linux.intel.com>
 <20260713155601.711389-3-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713155601.711389-3-heikki.krogerus@linux.intel.com>
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

On Mon, Jul 13, 2026 at 05:56:00PM +0200, Heikki Krogerus wrote:
> The platforms that support the interrupt from the I2C
> adapter can not handle the amount of interrupts the adapter
> generates because of the way the IRQ is routed in the
> hardware. The I2C controller driver has to be kept in
> polling mode because of that.
> 
> The AMC MCU can still generate critical alerts that have to
> be handled. The interrupt from SMBus Alert is left enabled
> and handled separately in the Xe. The alerts from the AMC
> will cause the device to be declared wedged for now.

...

> +static void xe_amc_work(struct work_struct *work)
> +{
> +	struct xe_amc *amc = from_work(amc, work, work);
> +	struct i2c_client *client = amc->i2c->client[XE_I2C_CLIENT_AMC];
> +	const struct amc_request *request = &amc_get_alert_reason;
> +	struct amc_response response;
> +	int ret;
> +
> +	ret = i2c_master_send(client, (u8 *)request, sizeof(*request));
> +	if (ret < 0) {
> +		dev_err(&client->dev, "failed to send request (%d)\n", ret);
> +		return;
> +	}
> +
> +	fsleep(20 * USEC_PER_MSEC);

Nit: Probably worth an explanation.

> +	ret = i2c_master_recv(client, (u8 *)&response, sizeof(response));
> +	if (ret < 0) {
> +		dev_err(&client->dev, "failed to read response (%d)\n", ret);
> +		return;
> +	}
> +
> +	if (response.header.len == 0) {

Nit: Perhaps !response.header.len?

> +		dev_err(&client->dev, "empty response from AMC\n");
> +		return;
> +	}
> +
> +	if (response.header.command != request->header.command ||

Curious, what about the rest of the header? Would it be any different?

> +	    memcmp(&response.message, &request->message, sizeof(struct amc_message))) {
> +		dev_err(&client->dev, "response does not match the request\n");
> +		return;
> +	}
> +
> +	if (response.error) {
> +		dev_err(&client->dev, "AMC error 0x%02x\n", response.error);
> +		return;
> +	}
> +
> +	dev_dbg(&client->dev, "%s: Alert reason: %d\n", __func__, response.value);

See below [1].

> +	switch (response.value) {
> +	case AMC_ALERT_FW_DOWNLOAD:
> +	case AMC_ALERT_THERMAL_TRIP:
> +	case AMC_ALERT_OOB_REQUEST:
> +	case AMC_ALERT_OOB_RESET:
> +	case AMC_ALERT_CATERR:
> +		xe_device_declare_wedged(i2c_client_to_xe_device(client));
> +		break;
> +	default:
> +		break;
> +	}
> +}

...

> @@ -181,8 +187,7 @@ void xe_i2c_irq_handler(struct xe_device *xe, u32 master_ctl)
>  	if (!(master_ctl & I2C_IRQ) || !xe_i2c_irq_present(xe))
>  		return;
>  
> -	/* Forward interrupt to I2C adapter */
> -	generic_handle_irq_safe(xe->i2c->adapter_irq);
> +	xe_i2c_handle_smbus_alert(xe->i2c);

[1] Can we move the below re-assert code to wq now? Or do you suspect any
side-effects?

>  	/* Deassert after I2C adapter clears the interrupt */
>  	xe_mmio_rmw32(mmio, I2C_CONFIG_CMD, 0, PCI_COMMAND_INTX_DISABLE);
> @@ -212,45 +217,6 @@ void xe_i2c_irq_postinstall(struct xe_device *xe)
>  	xe_mmio_rmw32(mmio, I2C_CONFIG_CMD, PCI_COMMAND_INTX_DISABLE, 0);
>  }

...

> -#define XE_I2C_MAX_CLIENTS		3
> -
>  #define XE_I2C_EP_COOKIE_DEVICE		0xde
>  
>  /* Endpoint Capabilities */
>  #define XE_I2C_EP_CAP_IRQ		BIT(0)
>  
> +enum XE_I2C_CLIENT {
> +	XE_I2C_CLIENT_AMC,
> +	XE_I2C_MAX_CLIENTS = 3,

I know it was already like this but I probably missed why do we have 3
(atleast from driver POV)?

Raag

> +};
