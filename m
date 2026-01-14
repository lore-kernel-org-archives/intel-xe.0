Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD0FD39013
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jan 2026 19:55:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E441D10E243;
	Wed, 14 Jan 2026 19:55:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JmdQHlCQ";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F153B10E243
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jan 2026 19:55:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D04EE60122;
 Wed, 14 Jan 2026 19:55:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A235C4CEF7;
 Wed, 14 Jan 2026 19:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768420517;
 bh=G+2/M+4Q8mm6hgo26tgTr4BiRZcgbZIH/MZ4w1dufao=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=JmdQHlCQYcE053SD6Qgg2zOOFZKF98+m220JFoc9RWNJcGlki6duwmMjff12+4Ng6
 g8F4TXNvRJHE5B0aCnxtBYHt0YZPzCxC/Qm1nsIU67P95q8m91muTJ4A2LYfdC9PDc
 IZu+KdKGO8JABYgx6eEsPavlu3Jkhx8n8hT/2SFVBrXLNwsgpUMHuaJlunXMssDM0f
 wHNO8/MymzgexplWGeaxxtytI+HyFj5PbVo4V5SskVgngTifZ01d8JQL9dZy4We0Q/
 uVCaPpy/c58fx3Yq47YlKPIvmhcsf7iooHjynXgKXU7eYwGKUkBFzHa2rv7nd6YPoi
 H2R1dHpi0ahCg==
Date: Wed, 14 Jan 2026 13:55:16 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Badal Nilawar <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org, anshuman.gupta@intel.com,
 rafael@kernel.org, lenb@kernel.org, bhelgaas@google.com,
 ilpo.jarvinen@linux.intel.com, rodrigo.vivi@intel.com,
 varun.gupta@intel.com, ville.syrjala@linux.intel.com,
 uma.shankar@intel.com, karthik.poosa@intel.com,
 matthew.auld@intel.com, sk.anirban@intel.com, raag.jadav@intel.com
Subject: Re: [PATCH v6 02/12] PCI/ACPI: Add PERST# Assertion Delay _DSM method
Message-ID: <20260114195516.GA830795@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260113164200.1151788-16-badal.nilawar@intel.com>
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

On Tue, Jan 13, 2026 at 10:12:03PM +0530, Badal Nilawar wrote:
> From: Anshuman Gupta <anshuman.gupta@intel.com>
> 
> Implement _DSM Method 0Bh as per PCI Firmware r3.3, sec 4.6.10, to request
> fixed delay in timing between the time the PME_TO_Ack message is received
> at the PCI Express Downstream Port that originated the PME_Turn_Off
> message, and the time the platform asserts PERST# to the slot during the
> corresponding Endpoint’s or PCI Express Upstream Port’s transition to
> D3cold while the system is in an ACPI operational state.
> Host platform supporting this feature ensures that device is observing
> this delay in every applicable D3Cold transition.

Thanks for this work!

Add blank lines between paragraphs.

s/D3Cold/D3cold/ to match other uses in drivers/pci/

> Co-developed-by: Badal Nilawar <badal.nilawar@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
> For VRSR feature with PERST# Assertion delay device will get enough time
> to transition to auxiliary power before main power removal.
> ---
>  drivers/pci/pci-acpi.c   | 60 ++++++++++++++++++++++++++++++++++++++++
>  include/linux/pci-acpi.h |  9 +++++-
>  2 files changed, 68 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/pci-acpi.c b/drivers/pci/pci-acpi.c
> index 645d3005ba50..73eaee20a270 100644
> --- a/drivers/pci/pci-acpi.c
> +++ b/drivers/pci/pci-acpi.c
> @@ -1554,6 +1554,66 @@ int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_mw,
>  }
>  EXPORT_SYMBOL_GPL(pci_acpi_request_d3cold_aux_power);
>  
> +/**
> + * pci_acpi_add_perst_assertion_delay - Request PERST# Delay via ACPI DSM
> + * @dev: PCI device instance
> + * @delay_us: Requested delay_us
> + *
> + * Request PERST# Assertion Delay to platform firmware, via Root Port/
> + * Switch Downstream Port ACPI _DSM Function 0Bh, for the specified
> + * PCI device.
> + * Evaluate the _DSM and handle the response accordingly.

Add blank line between paragraphs.  Actually, you can just omit the
last sentence because it doesn't tell us anything useful.

> + * Return: returns 0 on success and errno on failure.

s/Return: returns 0/Return: 0/

> + */
> +int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
> +{
> +	union acpi_object in_obj = {
> +		.integer.type = ACPI_TYPE_INTEGER,
> +		.integer.value = delay_us,
> +	};
> +

Spurious blank line.

> +	union acpi_object *out_obj;
> +	int result, ret = -EINVAL;

"ret" is unnecessary; see below.

> +	struct pci_dev *bdev;
> +	acpi_handle handle;
> +
> +	if (!dev)
> +		return -EINVAL;
> +
> +	for (bdev = dev; bdev; bdev = pci_upstream_bridge(bdev)) {

I think bdev should start with pci_upstream_bridge(dev).

IIUC you intend that "dev" is the Endpoint or Upstream Port for which
a driver wants PERST# assertion to be delayed.  Per sec 4.6.11, the
_DSM must be in a Downstream Port, not the device itself.

Sec 4.6.11 also says we should track this per Downstream Port and
request the maximum of delays requested by any child.  So I think we
need to:

  - add a perst_delay in struct pci_dev

  - when we find this _DSM, set
    bdev.perst_delay = max(bdev.perst_delay, delay_us)

  - pass bdev.perst_delay to the _DSM instead of delay_us

> +		handle = ACPI_HANDLE(&bdev->dev);
> +		if (handle &&
> +		    acpi_check_dsm(handle, &pci_acpi_dsm_guid, 4,
> +				   1 << DSM_PCI_PERST_ASSERTION_DELAY))
> +			break;
> +	}
> +
> +	if (!bdev)
> +		return -ENODEV;
> +
> +	out_obj = acpi_evaluate_dsm_typed(ACPI_HANDLE(&bdev->dev),
> +					  &pci_acpi_dsm_guid, 4,
> +					  DSM_PCI_PERST_ASSERTION_DELAY,
> +					  &in_obj, ACPI_TYPE_INTEGER);
> +	if (!out_obj)
> +		return -EINVAL;
> +
> +	result = out_obj->integer.value;
> +	ACPI_FREE(out_obj);
> +
> +	if (result == delay_us) {
> +		pci_info(dev, "PERST# Assertion Delay set to %u microseconds\n", delay_us);

I think this message should use "bdev" instead of "dev".  I know the
request is for "dev", but the delay connected to bdev and applies to
all functions below the Downstream Port.

Wrap such that the string itself isn't broken across lines, but the
"delay_us" is one the next line (as in the "failed" message below).

> +		ret = 0;
> +	} else {
> +		pci_info(dev, "PERST# Assertion Delay request failed, using %u microseconds\n",
> +			 result);
> +	}
> +
> +	return ret;

No need for the "else"; we can just return error early and unindent
the normal path:

  if (result != delay_us) {
    pci_info(bdev, "... failed");
    return -EINVAL;
  }

  pci_info(bdev, "... set");
  return 0;

> +}
