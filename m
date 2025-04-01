Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33382C36010
	for <intel-xe@archiver.kernel.org>; Tue,  1 Apr 2025 18:30:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB98910E0E0;
	Tue,  1 Apr 2025 18:30:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DAHRh+/o";
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CF4310E0E0
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Apr 2025 18:30:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 204D15C6263;
 Tue,  1 Apr 2025 18:28:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A5CDC4CEE4;
 Tue,  1 Apr 2025 18:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743532231;
 bh=4os2+XbhmtioCCLMDuFXfGu111eWd2jMSbaGOz3FyPc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=DAHRh+/oTEELBMDZFuJyitH+sbvoLVMs1xVnGHazWk23/GFAxn/k8udDP/jhl34wI
 jE3e5UIZQForRM9/zCaHFU4mHsFJ/0LZw/B2SNHn40suKvJTjxz47Gv1BrlSiZPWsl
 XeTpOtwry9aP1jdvbMrFbaDJiPvbXgPAZ9rfbUvNWxgIE0gVYdswG2V1VWQxuWv06y
 KPILXd4N5DS/ymQcjhXui8Lu0XQf0YWftEKl0pi4j9wh8hC4PvdCxUJJSx8fSCgNJx
 qHGFzu/MgaH9Ymm7i9fzlot8fMKjJ5I8Cgl0Lhkby8688D7EAN6/xl4q/iTDcF+3KX
 qjuircOLlW5kw==
Date: Tue, 1 Apr 2025 13:30:30 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: intel-xe@lists.freedesktop.org, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org, rafael@kernel.org, lenb@kernel.org,
 bhelgaas@google.com, ilpo.jarvinen@linux.intel.com,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 badal.nilawar@intel.com, varun.gupta@intel.com,
 ville.syrjala@linux.intel.com, uma.shankar@intel.com
Subject: Re: [PATCH 02/12] PCI/ACPI: Add PERST# Assertion Delay _DSM method
Message-ID: <20250401183030.GA1676293@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401153225.96379-3-anshuman.gupta@intel.com>
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

On Tue, Apr 01, 2025 at 09:02:15PM +0530, Anshuman Gupta wrote:
> Implement _DSM Method 11 as per PCI firmware specs
> section 4.6.11 Rev 3.3.

"PCI Firmware r3.3, sec 4.6.11" so the citation is major to minor.

"0xb" or "0Bh" to match spec usage.

> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  drivers/pci/pci-acpi.c   | 53 ++++++++++++++++++++++++++++++++++++++++
>  include/linux/pci-acpi.h |  7 ++++++
>  2 files changed, 60 insertions(+)
> 
> diff --git a/drivers/pci/pci-acpi.c b/drivers/pci/pci-acpi.c
> index ebd49e43457e..04149f037664 100644
> --- a/drivers/pci/pci-acpi.c
> +++ b/drivers/pci/pci-acpi.c
> @@ -1499,6 +1499,59 @@ int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
>  }
>  EXPORT_SYMBOL(pci_acpi_request_d3cold_aux_power);
>  
> +/**
> + * pci_acpi_add_perst_assertion_delay - Request PERST# delay via ACPI DSM
> + * @dev: PCI device instance
> + * @delay_us: Requested delay_us
> + *
> + * This function sends a request to the host BIOS via ACPI _DSM to grant the
> + * required PERST# delay for the specified PCI device. It evaluates the _DSM
> + * to request the PERST# delay and handles the response accordingly.
> + *
> + * Return: returns 0 on success and errno on failure.
> + */
> +int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
> +{
> +	union acpi_object in_obj = {
> +		.integer.type = ACPI_TYPE_INTEGER,
> +		.integer.value = delay_us,
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

acpi_check_dsm().

> +	out_obj = acpi_evaluate_dsm_typed(handle, &pci_acpi_dsm_guid, 4,
> +					  DSM_PCI_PERST_ASSERTION_DELAY,
> +					  &in_obj, ACPI_TYPE_INTEGER);
> +	if (!out_obj)
> +		return -EINVAL;
> +
> +	result = out_obj->integer.value;
> +
> +	if (result == delay_us) {
> +		dev_info(&dev->dev, "PERST# Assertion Delay set to"
> +			 "%u microseconds\n", delay_us);

pci_info().

Join these into a single string, even though they won't fit in a line
without wrapping.  This is to make them easier to grep for when a user
reports seeing the message.  (Do this on the previous patch too, where
I forgot to mention it.)

> +		ret = 0;
> +	} else if (result == 0) {
> +		dev_warn(&dev->dev, "PERST# Assertion Delay request failed,"
> +			 "no previous valid request\n");
> +	} else {
> +		dev_warn(&dev->dev,
> +			 "PERST# Assertion Delay request failed"
> +			 "Previous valid delay: %u microseconds\n", result);
> +	}
> +
> +	ACPI_FREE(out_obj);
> +	return ret;
> +}
> +EXPORT_SYMBOL(pci_acpi_add_perst_assertion_delay);
