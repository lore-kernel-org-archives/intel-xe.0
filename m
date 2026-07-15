Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80545C44501
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jul 2026 06:33:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CC0B10E12F;
	Wed, 15 Jul 2026 06:33:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h7SotpCX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21CAC10E12F
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Jul 2026 06:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784097223; x=1815633223;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=f0Iq/AILXA6H2H/vCrM3FJlZo9QmgFtxt6nMJEUz7kY=;
 b=h7SotpCXHNRt4xZl62Jt6nVDXtYZQTApjuMyzz3KWqHeRGp9C72h2LDc
 4v0+00v78z5f9BZy7FiwAP4oTgHVx1He6SHVrmD0wpies0+dG8BHlnx13
 EXCASy+LGsZNAWJl2brFPBFPeNeEHq8nTu9wDXlb36XHbYsftSmc2M1O/
 w5cByx+OPLs5/rxcTBA4Y2Z1ZoXzd1gQg40SslZI8RaMLapfjHeABmMST
 pgxsgEGOdqZt9fJYAfwcZADFDE1m0DahmdTIdnHRTEzpIG+nrZGnXRY61
 MNvZ2UELZYFUrcgGWeMF5NZcZU2t8MnHyPVoRr4QjU8ybh7B4yUSibToi A==;
X-CSE-ConnectionGUID: M4GHICbGRZqxNjOyYeufVg==
X-CSE-MsgGUID: yNhIsUAgREuTWfP1lb9yXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="96091310"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="96091310"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 23:33:43 -0700
X-CSE-ConnectionGUID: 9oqahBNtTeeqjGo2r0ceXQ==
X-CSE-MsgGUID: 5cBjdVtmQZOlv2MoS4MSHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="256120908"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 23:33:34 -0700
Date: Wed, 15 Jul 2026 08:33:31 +0200
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
Subject: Re: [PATCH v4 3/3] drm/xe/i2c: Keep the i2c controller always enabled
Message-ID: <alcpuxJktaVwrIaa@black.igk.intel.com>
References: <20260713155601.711389-1-heikki.krogerus@linux.intel.com>
 <20260713155601.711389-4-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713155601.711389-4-heikki.krogerus@linux.intel.com>
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

On Mon, Jul 13, 2026 at 05:56:01PM +0200, Heikki Krogerus wrote:
> Some platforms make an assumption that the i2c controller's
> enabled state indicates also the power state of the
> controller. This can create a problem when the controller is
> in disabled state, because the hardware may assume
> incorrectly that it is then also in low-power state.
> 
> To fix this, the controller is kept enabled by taking over
> the IC_ENABLE register. The controller has to be disabled
> when the configuration is updated and when the target
> address or the slave address are assigned, so disabling it
> when IC_CON, IC_TAR or IC_SAR registers are programmed, and
> then re-enabling it again.

...

> +/* See "Disabling DW_apb_i2c" in the DesignWare DW_abp_i2c databook. */
> +static void xe_i2c_disable(struct xe_i2c *i2c)
> +{
> +	int timeout = 100;
> +	u32 status;
> +
> +	xe_mmio_rmw32(i2c->mmio, I2C_REG(DW_IC_ENABLE), 1, 0);

Can we use DW_IC_ENABLE_* defines?

> +	do {
> +		status = xe_mmio_read32(i2c->mmio, I2C_REG(DW_IC_ENABLE_STATUS));
> +		if (!(status & 1))

Ditto for DW_IC_STATUS_*.

> +			return;
> +		/* Can't sleep here. */
> +		udelay(25);
> +	} while (timeout--);
> +
> +	dev_warn(&i2c->adapter->dev, "timeout in disabling adapter\n");
> +}

...

> @@ -230,7 +260,28 @@ static int xe_i2c_write(void *context, unsigned int reg, unsigned int val)
>  {
>  	struct xe_i2c *i2c = context;
>  
> -	xe_mmio_write32(i2c->mmio, XE_REG(reg + I2C_MEM_SPACE_OFFSET), val);
> +	switch (reg) {
> +	case DW_IC_CON:
> +	case DW_IC_TAR:
> +	case DW_IC_SAR:
> +		/* Disable the controller. */
> +		xe_i2c_disable(i2c);
> +
> +		/* Write the register. */
> +		xe_mmio_write32(i2c->mmio, I2C_REG(reg), val);
> +
> +		/* Enable the controller. */
> +		xe_mmio_rmw32(i2c->mmio, I2C_REG(DW_IC_ENABLE), 0, 1);

Ditto.

Raag

> +		break;
> +	case DW_IC_ENABLE:
> +		i2c->ic_enable = val;
> +		/* Other fields can be updated except the enable bit. */
> +		val |= DW_IC_ENABLE_ENABLE;
> +		fallthrough;
> +	default:
> +		xe_mmio_write32(i2c->mmio, I2C_REG(reg), val);
> +		break;
> +	}
>  
>  	return 0;
>  }
