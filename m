Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5CB2C36010
	for <intel-xe@archiver.kernel.org>; Tue,  1 Apr 2025 18:25:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80CAB10E654;
	Tue,  1 Apr 2025 18:25:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZWb6BFW0";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 191E310E654
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Apr 2025 18:25:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5A86743F67;
 Tue,  1 Apr 2025 18:25:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F390C32781;
 Tue,  1 Apr 2025 18:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743531947;
 bh=5HB9ueiryCuKloNBqcaRsUiS766sCo0OneF9+ChqGtQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=ZWb6BFW0MhFDfroKOgrJcMqj3rwOKwDCg848nDpWhDhbzOc6qt/LFd1EqwyKazQf1
 bVP7CFTO1E5a3XgO71EUv3OzeLcrwc9jrA2Mwdhyu7cRVC3VG5BmPAo8U1BvcYzUdb
 0oSMmXsQE/HkwZoXzkBFGcMLrmgotq1ZRRppMtJ/FNIzjBq1MYEc96z04fUkYXeMbX
 yh99/zavGtUHRXc6cALi9w6fku3AtB/VjvxtKDeezfqM3ErxYFOWGLbM/7WThdSk7q
 BOlF55NulEdZYzf2jpFXzWqpuTuUnGK3WwB89FVbIHmwgzkQYGXty6pyalOGEkvvOR
 0eFBXOOcx7GvQ==
Date: Tue, 1 Apr 2025 13:25:45 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: intel-xe@lists.freedesktop.org, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org, rafael@kernel.org, lenb@kernel.org,
 bhelgaas@google.com, ilpo.jarvinen@linux.intel.com,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 badal.nilawar@intel.com, varun.gupta@intel.com,
 ville.syrjala@linux.intel.com, uma.shankar@intel.com
Subject: Re: [PATCH 01/12] PCI/ACPI: Add D3cold Aux Power Limit_DSM method
Message-ID: <20250401182545.GA1675819@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401153225.96379-2-anshuman.gupta@intel.com>
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

On Tue, Apr 01, 2025 at 09:02:14PM +0530, Anshuman Gupta wrote:
> Implement _DSM method 10 and _DSM Method 11 as per PCI firmware specs
> section 4.6.10 Rev 3.3.

Thanks for splitting this into two patches.  But I think now this only
implements function 10 (0x0a), so this sentence needs to be updated.

I would write this consistently as "0x0a" or "0Ah" to match the spec
description.  I don't think the spec ever uses "10".

> Note that this implementation assumes only a single device below the
> Downstream Port will request for Aux Power Limit under a given
> Root Port because it does not track and aggregate requests
> from all child devices below the Downstream Port as required
> by Section 4.6.10 Rev 3.3.
> 
> One possible mitigation would be only allowing only first PCIe
> Non-Bridge Endpoint Function 0 driver to call_DSM method 10.
> 
> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  drivers/pci/pci-acpi.c   | 78 ++++++++++++++++++++++++++++++++++++++++
>  include/linux/pci-acpi.h |  6 ++++
>  2 files changed, 84 insertions(+)
> 
> diff --git a/drivers/pci/pci-acpi.c b/drivers/pci/pci-acpi.c
> index af370628e583..ebd49e43457e 100644
> --- a/drivers/pci/pci-acpi.c
> +++ b/drivers/pci/pci-acpi.c
> @@ -1421,6 +1421,84 @@ static void pci_acpi_optimize_delay(struct pci_dev *pdev,
>  	ACPI_FREE(obj);
>  }
>  
> +/**
> + * pci_acpi_request_d3cold_aux_power - Request D3cold aux power via ACPI DSM
> + * @dev: PCI device instance
> + * @requested_power: Requested auxiliary power in milliwatts
> + *
> + * This function sends a request to the host BIOS via ACPI _DSM Function 10
> + * to grant the required D3Cold Auxiliary power for the specified PCI device.
> + * It evaluates the _DSM (Device Specific Method) to request the Auxiliary
> + * power and handles the response accordingly.
> + *
> + * This function shall be only called by 1st non-bridge Endpoint driver
> + * on Function 0. For a Multi-Function Device, the driver for Function 0 is
> + * required to report an aggregate power requirement covering all
> + * functions contained within the device.
> + *
> + * Return: Returns 0 on success and errno on failure.

Write all this in imperative mood, e.g.,

  Request auxiliary power while device is in D3cold ...

  Return 0 on success ...

> + */
> +int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
> +{
> +	union acpi_object in_obj = {
> +		.integer.type = ACPI_TYPE_INTEGER,
> +		.integer.value = requested_power,
> +	};
> +
> +	union acpi_object *out_obj;
> +	acpi_handle handle;
> +	int result, ret = -EINVAL;
> +
> +	if (!dev || !ACPI_HANDLE(&dev->dev))
> +		return -EINVAL;
> +
> +	handle = ACPI_HANDLE(&dev->dev);

This needs an acpi_check_dsm() call to find out whether the platform
supports DSM_PCI_D3COLD_AUX_POWER_LIMIT.

We have several _DSM calls that *should* do this, but unfortunately
they don't do it yet, so they're not good examples to copy.

> +	out_obj = acpi_evaluate_dsm_typed(handle,
> +					  &pci_acpi_dsm_guid,
> +					  4,
> +					  DSM_PCI_D3COLD_AUX_POWER_LIMIT,
> +					  &in_obj,
> +					  ACPI_TYPE_INTEGER);
> +	if (!out_obj)
> +		return -EINVAL;
> +
> +	result = out_obj->integer.value;
> +
> +	switch (result) {
> +	case 0x0:
> +		dev_dbg(&dev->dev, "D3cold Aux Power %umW request denied\n",
> +			requested_power);

Use pci_dbg(dev), pci_info(dev), etc.

> +		break;
> +	case 0x1:
> +		dev_info(&dev->dev, "D3cold Aux Power request granted: %umW\n",
> +			 requested_power);
> +		ret = 0;
> +		break;
> +	case 0x2:
> +		dev_info(&dev->dev, "D3cold Aux Power: Main power won't be removed\n");
> +		ret = -EBUSY;
> +		break;
> +	default:
> +		if (result >= 0x11 && result <= 0x1F) {
> +			int retry_interval = result & 0xF;
> +
> +			dev_warn(&dev->dev, "D3cold Aux Power request needs retry."
> +				 "Interval: %d seconds.\n", retry_interval);
> +			msleep(retry_interval * 1000);

It doesn't seem right to me to do this sleep internally because it
means this interface might take up to 15 seconds to return, and the
caller has no idea what is happening during that time.

This seems like it should be done in the driver, which can decide
*whether* it wants to sleep, and if it does sleep, it may give a nice
indication to the user.

Of course, that would mean returning some kind of retry interval
information to the caller.

> +			ret = -EAGAIN;
> +		} else {
> +			dev_err(&dev->dev, "D3cold Aux Power: Reserved or "
> +				"unsupported response: 0x%x.\n", result);

Drop periods at end of messages.

> +		}
> +		break;
> +	}
> +
> +	ACPI_FREE(out_obj);
> +	return ret;
> +}
> +EXPORT_SYMBOL(pci_acpi_request_d3cold_aux_power);
