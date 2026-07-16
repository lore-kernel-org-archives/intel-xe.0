Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73D54C43458
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 05:37:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 365EE10E29F;
	Thu, 16 Jul 2026 05:37:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M1dcmkur";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E54A010E29F
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jul 2026 05:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784180264; x=1815716264;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Kf2e4uDaGU2viHeO5KG2/v9cm4M69hdJAZ6pVTKozyw=;
 b=M1dcmkurWTdn+H+yz8traj0Nvp8TnrsCg/0FeglGJ41BoFuGSnyI1yVg
 odZSkE4aD4Mbn6AJV06wRuWKOteuOsJ/b79DiDurFBWqh229wnxlXZUFI
 zv3nKDe6VXl/RPOGoY/oeZEd5RtiZ8+3rdh2GvCub4M+C3jwc//k6HpIW
 Wd+t3Y4mfAzZNcgE/f6Yo0utLF2iIoDtdeSibEEBPaLa+6TVUF73NY9hB
 p+Kin3IfqmrE80lK0nQjqmEKJ/oegzhEU0WPT8S7FxNfHkd5pEH9ctRme
 RRqdmNTGuZilk/uIPRdvIImDrMkZKXXnATmMasZW1AER3eGVlUV2pbHvx g==;
X-CSE-ConnectionGUID: s8G/Xcp3QDOedoKHSc8NgA==
X-CSE-MsgGUID: mr7daja2SNWW0TVJAZ6Cuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="85029838"
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; d="scan'208";a="85029838"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 22:37:43 -0700
X-CSE-ConnectionGUID: aRBjKR3YRiihfAMakFrNDA==
X-CSE-MsgGUID: ehuVDOaxThSf6bdgvIeSJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; d="scan'208";a="258365204"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 22:37:40 -0700
Date: Thu, 16 Jul 2026 07:37:37 +0200
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
Subject: Re: [PATCH v5 2/3] drm/xe/i2c: Fix the interrupt handling
Message-ID: <alhuIcCmf3Pu31t1@black.igk.intel.com>
References: <20260715153153.1243751-1-heikki.krogerus@linux.intel.com>
 <20260715153153.1243751-3-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715153153.1243751-3-heikki.krogerus@linux.intel.com>
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

On Wed, Jul 15, 2026 at 05:31:52PM +0200, Heikki Krogerus wrote:
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
> +	const struct amc_request *request = &amc_get_alert_reason;
> +	struct xe_amc *amc = from_work(amc, work, work);
> +	struct amc_response response;
> +	struct i2c_client *client;
> +	int ret;
> +
> +	client = amc->i2c->client[XE_I2C_CLIENT_AMC];
> +	if (!client)
> +		goto out_reassert_interrupt;
> +
> +	ret = i2c_master_send(client, (u8 *)request, sizeof(*request));
> +	if (ret < 0) {
> +		dev_err(&client->dev, "failed to send request (%d)\n", ret);
> +		goto out_reassert_interrupt;
> +	}
> +
> +	/* AMC needs 20ms to generate the response. */
> +	fsleep(20 * USEC_PER_MSEC);
> +
> +	ret = i2c_master_recv(client, (u8 *)&response, sizeof(response));
> +	if (ret < 0) {
> +		dev_err(&client->dev, "failed to read response (%d)\n", ret);
> +		goto out_reassert_interrupt;
> +	}
> +
> +	if (!response.header.len) {
> +		dev_err(&client->dev, "empty response from AMC\n");
> +		goto out_reassert_interrupt;
> +	}
> +
> +	if (memcmp(&response.message, &request->message, sizeof(struct amc_message))) {
> +		dev_err(&client->dev, "response does not match the request\n");
> +		goto out_reassert_interrupt;
> +	}
> +
> +	if (response.error) {
> +		dev_err(&client->dev, "AMC error 0x%02x\n", response.error);
> +		goto out_reassert_interrupt;
> +	}

[1] See below.

> +	dev_dbg(&client->dev, "%s: Alert reason: %d\n", __func__, response.value);
> +
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
> +
> +out_reassert_interrupt:
> +	xe_mmio_rmw32(amc->i2c->mmio, I2C_CONFIG_CMD, PCI_COMMAND_INTX_DISABLE, 0);

One of the rules of wedging is that it's a last resort and there shouldn't
be any hardware access afterwards, so I think a more suitable place for
re-assert is before[1] we process the response.

> +}

...

> +static void xe_i2c_handle_smbus_alert(struct xe_i2c *i2c)
> +{
> +	u32 stat;
> +
> +	stat = xe_mmio_read32(i2c->mmio, I2C_REG(DW_IC_SMBUS_INTR_STAT));
> +	if (!stat)
> +		return;
> +
> +	xe_mmio_write32(i2c->mmio, I2C_REG(DW_IC_CLR_SMBUS_INTR), stat);
> +
> +	xe_mmio_rmw32(i2c->mmio, I2C_CONFIG_CMD, 0, PCI_COMMAND_INTX_DISABLE);

As per updated arch, this is now taken care by the firmware and can be
dropped.

Raag

> +	if (stat & DW_IC_SMBUS_INTR_ALERT && i2c->amc)
> +		xe_amc_handle_alert(i2c);
> +	else
> +		xe_mmio_rmw32(i2c->mmio, I2C_CONFIG_CMD, PCI_COMMAND_INTX_DISABLE, 0);
> +}
