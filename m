Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FC14C4450A
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 07:15:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 355F610E2F7;
	Thu, 16 Jul 2026 07:15:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GGUb5H8M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 911CF10E2F7
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jul 2026 07:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784186118; x=1815722118;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fZ9jkEIIDI95EUv84Hol6amGjcZYiFvAT6WEG3UYbiM=;
 b=GGUb5H8Mc8wfxyJ8r+zM7hmIQEltSmAE57aH6U5o/NJspYawkawPbEAr
 8ZSby7GIhHqYeWwhp1Zf3xrO8tywxgVACHNePFDYQy4TuFg2jsMKp4GaF
 TKUeCgGF1rrajgRrPozH7cYP8PIQeeJY3ctfqHcSj9hhS3qZQDucTWdU3
 o5Kxjgwsb/1AabwU4xYff2OUkEP+Yx+lxXEtddZEdJNzNi9Fw7tWCffKO
 xLTbTDqtyDB39mI6/0sfQRvwxYgfqCfE9kMepPDkBddB3lEV3SausJ3w/
 +nwPh2lSWJQPaPAiH738CHKKCE1FUncFsN8M6XE8n2TaM1TinGgKwflVm w==;
X-CSE-ConnectionGUID: GExo838VSqCVvgvMMDIQow==
X-CSE-MsgGUID: /sJqNL09RbmQbCNw+MGo5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="83819875"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="83819875"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 00:14:55 -0700
X-CSE-ConnectionGUID: bB0SV7T3SdaiWQ7hk9SawA==
X-CSE-MsgGUID: cClT5lkESMejgNrsaQT3hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="259995188"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa003.jf.intel.com with ESMTP; 16 Jul 2026 00:14:52 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
 id 7671D95; Thu, 16 Jul 2026 09:14:51 +0200 (CEST)
Date: Thu, 16 Jul 2026 10:14:49 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
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
Message-ID: <aliE6bZI_1fzA_xi@kuha>
References: <20260715153153.1243751-1-heikki.krogerus@linux.intel.com>
 <20260715153153.1243751-3-heikki.krogerus@linux.intel.com>
 <alhuIcCmf3Pu31t1@black.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alhuIcCmf3Pu31t1@black.igk.intel.com>
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

On Thu, Jul 16, 2026 at 07:37:37AM +0200, Raag Jadav wrote:
> On Wed, Jul 15, 2026 at 05:31:52PM +0200, Heikki Krogerus wrote:
> > The platforms that support the interrupt from the I2C
> > adapter can not handle the amount of interrupts the adapter
> > generates because of the way the IRQ is routed in the
> > hardware. The I2C controller driver has to be kept in
> > polling mode because of that.
> > 
> > The AMC MCU can still generate critical alerts that have to
> > be handled. The interrupt from SMBus Alert is left enabled
> > and handled separately in the Xe. The alerts from the AMC
> > will cause the device to be declared wedged for now.
> 
> ...
> 
> > +static void xe_amc_work(struct work_struct *work)
> > +{
> > +	const struct amc_request *request = &amc_get_alert_reason;
> > +	struct xe_amc *amc = from_work(amc, work, work);
> > +	struct amc_response response;
> > +	struct i2c_client *client;
> > +	int ret;
> > +
> > +	client = amc->i2c->client[XE_I2C_CLIENT_AMC];
> > +	if (!client)
> > +		goto out_reassert_interrupt;
> > +
> > +	ret = i2c_master_send(client, (u8 *)request, sizeof(*request));
> > +	if (ret < 0) {
> > +		dev_err(&client->dev, "failed to send request (%d)\n", ret);
> > +		goto out_reassert_interrupt;
> > +	}
> > +
> > +	/* AMC needs 20ms to generate the response. */
> > +	fsleep(20 * USEC_PER_MSEC);
> > +
> > +	ret = i2c_master_recv(client, (u8 *)&response, sizeof(response));
> > +	if (ret < 0) {
> > +		dev_err(&client->dev, "failed to read response (%d)\n", ret);
> > +		goto out_reassert_interrupt;
> > +	}
> > +
> > +	if (!response.header.len) {
> > +		dev_err(&client->dev, "empty response from AMC\n");
> > +		goto out_reassert_interrupt;
> > +	}
> > +
> > +	if (memcmp(&response.message, &request->message, sizeof(struct amc_message))) {
> > +		dev_err(&client->dev, "response does not match the request\n");
> > +		goto out_reassert_interrupt;
> > +	}
> > +
> > +	if (response.error) {
> > +		dev_err(&client->dev, "AMC error 0x%02x\n", response.error);
> > +		goto out_reassert_interrupt;
> > +	}
> 
> [1] See below.
> 
> > +	dev_dbg(&client->dev, "%s: Alert reason: %d\n", __func__, response.value);
> > +
> > +	switch (response.value) {
> > +	case AMC_ALERT_FW_DOWNLOAD:
> > +	case AMC_ALERT_THERMAL_TRIP:
> > +	case AMC_ALERT_OOB_REQUEST:
> > +	case AMC_ALERT_OOB_RESET:
> > +	case AMC_ALERT_CATERR:
> > +		xe_device_declare_wedged(i2c_client_to_xe_device(client));
> > +		break;
> > +	default:
> > +		break;
> > +	}
> > +
> > +out_reassert_interrupt:
> > +	xe_mmio_rmw32(amc->i2c->mmio, I2C_CONFIG_CMD, PCI_COMMAND_INTX_DISABLE, 0);
> 
> One of the rules of wedging is that it's a last resort and there shouldn't
> be any hardware access afterwards, so I think a more suitable place for
> re-assert is before[1] we process the response.

Makes sense. I'll fix this.

> > +}
> 
> ...
> 
> > +static void xe_i2c_handle_smbus_alert(struct xe_i2c *i2c)
> > +{
> > +	u32 stat;
> > +
> > +	stat = xe_mmio_read32(i2c->mmio, I2C_REG(DW_IC_SMBUS_INTR_STAT));
> > +	if (!stat)
> > +		return;
> > +
> > +	xe_mmio_write32(i2c->mmio, I2C_REG(DW_IC_CLR_SMBUS_INTR), stat);
> > +
> > +	xe_mmio_rmw32(i2c->mmio, I2C_CONFIG_CMD, 0, PCI_COMMAND_INTX_DISABLE);
> 
> As per updated arch, this is now taken care by the firmware and can be
> dropped.

Okay, good. I wanted to ask you why we do that after the i2c adapter
interrupt is cleared instead of before that, but now it does not
matter :)

Thanks Raag!

-- 
heikki
