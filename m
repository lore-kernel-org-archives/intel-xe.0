Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD08C7EE30
	for <intel-xe@archiver.kernel.org>; Thu, 26 Jun 2025 14:21:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D961D10E2B3;
	Thu, 26 Jun 2025 14:21:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f1pyBahF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0E8010E2B3
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Jun 2025 14:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750947671; x=1782483671;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xIJe4c6jLTcZl6XLuk6MrvbPTebmU1QDAeRz0h/qZ1Q=;
 b=f1pyBahFMEQpgpG+MIkNop513Wx+67ECmSFo0VpOrf6damYapD6BK98q
 dRXX/W9irKWlJXCw4r4eZzRw/B73/02DF6AsD242Ms16/PHlhc0G1F3MT
 3SIf2tSBW3qXJKv1yO+9uD8phuO3J9geGymE9uqvxlbrmvvZp7LDYW7D4
 hN/0VN5nrWDVc3hMRBxLI+D9EZkJmSFteSu5/+o5NodA0u5oi71NMfeSU
 Dn+0oP/W+IeShJoARoZWyLBRFG3FrpIwsu6hwu5pzSgySpvoGd22N5ItJ
 s6y5wqDOWUBgSvneQHz1s5NRxP6QgOL+Vz0DQf4NZDs+k5TFzJqOnS8Vn Q==;
X-CSE-ConnectionGUID: 6SX75IYuROetcE57u/LWDw==
X-CSE-MsgGUID: Af88iO8SRVyAz9cgTK2aDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="64305779"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="64305779"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 07:21:11 -0700
X-CSE-ConnectionGUID: KmQEI4G7Qau7oSajweR/Lw==
X-CSE-MsgGUID: nfCr2ys8R8i137Prd6U1TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="158029284"
Received: from smile.fi.intel.com ([10.237.72.52])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 07:21:05 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1uUnTK-0000000ACLQ-1JAQ; Thu, 26 Jun 2025 17:21:02 +0300
Date: Thu, 26 Jun 2025 17:21:02 +0300
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
Subject: Re: [PATCH v4 2/4] drm/xe: Support for I2C attached MCUs
Message-ID: <aF1XTr2y1EmkRT_8@smile.fi.intel.com>
References: <20250626135610.299943-1-heikki.krogerus@linux.intel.com>
 <20250626135610.299943-3-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626135610.299943-3-heikki.krogerus@linux.intel.com>
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

On Thu, Jun 26, 2025 at 04:56:07PM +0300, Heikki Krogerus wrote:
> Adding adaption/glue layer where the I2C host adapter
> (Synopsys DesignWare I2C adapter) and the I2C clients (the
> microcontroller units) are enumerated.
> 
> The microcontroller units (MCU) that are attached to the GPU
> depend on the OEM. The initially supported MCU will be the
> Add-In Management Controller (AMC).

...

> +static int xe_i2c_register_adapter(struct xe_i2c *i2c)
> +{
> +	struct pci_dev *pci = to_pci_dev(i2c->drm_dev);
> +	struct platform_device *pdev;
> +	struct fwnode_handle *fwnode;
> +	int ret;
> +
> +	fwnode = fwnode_create_software_node(xe_i2c_adapter_properties, NULL);
> +	if (!fwnode)
> +		return -ENOMEM;
> +
> +	/*
> +	 * Not using platform_device_register_full() here because we don't have
> +	 * a handle to the platform_device before it returns. xe_i2c_notifier()
> +	 * uses that handle, but it may be called before
> +	 * platform_device_register_full() is done.
> +	 */
> +	pdev = platform_device_alloc(adapter_name, pci_dev_id(pci));
> +	if (!pdev) {
> +		ret = -ENOMEM;
> +		goto err_fwnode_remove;
> +	}
> +
> +	if (i2c->adapter_irq) {

> +		struct resource	res = { };
> +
> +		res.start = i2c->adapter_irq;
> +		res.name = "xe_i2c";
> +		res.flags = IORESOURCE_IRQ;


		struct resource	res;

		res = DEFINE_RES_IRQ_NAMED(i2c->adapter_irq, "xe_i2c");

> +		ret = platform_device_add_resources(pdev, &res, 1);
> +		if (ret)
> +			goto err_pdev_put;
> +	}
> +
> +	pdev->dev.parent = i2c->drm_dev;
> +	pdev->dev.fwnode = fwnode;
> +	i2c->adapter_node = fwnode;
> +	i2c->pdev = pdev;
> +
> +	ret = platform_device_add(pdev);
> +	if (ret)
> +		goto err_pdev_put;
> +
> +	return 0;
> +
> +err_pdev_put:
> +	platform_device_put(pdev);
> +err_fwnode_remove:
> +	fwnode_remove_software_node(fwnode);
> +
> +	return ret;
> +}

...

> +static int xe_i2c_irq_map(struct irq_domain *h, unsigned int virq,
> +			  irq_hw_number_t hw_irq_num)
> +{
> +	irq_set_chip_and_handler(virq, &dummy_irq_chip, handle_simple_irq);

Wondering if you need to setup a custom lockdep class here.

> +	return 0;
> +}

...

> +static void xe_i2c_remove_irq(struct xe_i2c *i2c)
> +{
> +	if (i2c->irqdomain) {

	if (!i2c->irqdomain)
		return;

> +		irq_dispose_mapping(i2c->adapter_irq);
> +		irq_domain_remove(i2c->irqdomain);
> +	}
> +}

...

> +static void xe_i2c_remove(void *data)
> +{
> +	struct xe_i2c *i2c = data;
> +	int i;

unsigned?

> +	for (i = 0; i < XE_I2C_MAX_CLIENTS; i++)
> +		i2c_unregister_device(i2c->client[i]);
> +
> +	bus_unregister_notifier(&i2c_bus_type, &i2c->bus_notifier);
> +	xe_i2c_unregister_adapter(i2c);
> +	xe_i2c_remove_irq(i2c);
> +}

...

> +int xe_i2c_probe(struct xe_device *xe)
> +{
> +	struct xe_i2c_endpoint ep;
> +	struct regmap *regmap;
> +	struct xe_i2c *i2c;
> +	int ret;
> +
> +	xe_i2c_read_endpoint(xe_root_tile_mmio(xe), &ep);
> +	if (ep.cookie != XE_I2C_EP_COOKIE_DEVICE)
> +		return 0;
> +
> +	i2c = devm_kzalloc(xe->drm.dev, sizeof(*i2c), GFP_KERNEL);
> +	if (!i2c)
> +		return -ENOMEM;
> +
> +	INIT_WORK(&i2c->work, xe_i2c_client_work);
> +	i2c->mmio = xe_root_tile_mmio(xe);
> +	i2c->drm_dev = xe->drm.dev;
> +	i2c->ep = ep;

> +	regmap = devm_regmap_init(i2c->drm_dev, NULL, i2c, &i2c_regmap_config);

Use of i2c->drm_dev makes harder to maintain and understand the code.
Managed resources should be carefully attached to the correct device,
otherwise it's inevitable object lifetime related issues.

With

	struct device *dev = xe->drm.dev;

and using local dev, it becomes easier to get and avoid such subtle mistakes.

> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	i2c->bus_notifier.notifier_call = xe_i2c_notifier;
> +	ret = bus_register_notifier(&i2c_bus_type, &i2c->bus_notifier);
> +	if (ret)
> +		return ret;
> +
> +	ret = xe_i2c_create_irq(i2c);
> +	if (ret)
> +		goto err_unregister_notifier;
> +
> +	ret = xe_i2c_register_adapter(i2c);
> +	if (ret)
> +		goto err_remove_irq;
> +
> +	return devm_add_action_or_reset(i2c->drm_dev, xe_i2c_remove, i2c);
> +
> +err_remove_irq:
> +	xe_i2c_remove_irq(i2c);
> +
> +err_unregister_notifier:
> +	bus_unregister_notifier(&i2c_bus_type, &i2c->bus_notifier);
> +
> +	return ret;
> +}

-- 
With Best Regards,
Andy Shevchenko


