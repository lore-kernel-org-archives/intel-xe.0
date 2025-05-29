Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C77E6C54FB3
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 21:57:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C2A310E12F;
	Thu, 29 May 2025 21:57:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i6PBfebw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B948A10E12F
 for <intel-xe@lists.freedesktop.org>; Thu, 29 May 2025 21:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748555826; x=1780091826;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Q5m5LwduiDAi79so+2oUpFh3hy74EZUg/SO/rtagSxE=;
 b=i6PBfebwPcLFT7Gy6eHqIIVVoqzyZ8WFPL/xpWPOGjdIMA9gJcX/FurZ
 v/70Cb5FeShntjUx51T71pniRKdxt73qmr9ReZ60WfE0Yo72iuuJL5i5F
 Vr040P9Mfea0AhHrrHRjdhwMMyYSt4zriIdR6pOrcoS6t26cpkQC4cJWg
 8FLLt3QuTyqlp5VTmJfc7bic9X8dGiiJCVthy4Q0MPXoZcm8Knza8YR/U
 +5/XF/XqOPeqn4+/4dwIf719jElD8jDhwm4Ml7F9KcJ15k27/96ZBo9X2
 fxwDX29+i00sm1I1ptnN5eQR4ffnvFnRcXI3Wx2VsLfZ2wJumOw3O4873 Q==;
X-CSE-ConnectionGUID: 1zhIL8L1SdmNd6fPUT1Txg==
X-CSE-MsgGUID: Bhxi0qtXSByogVLSZsltJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="61268905"
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; d="scan'208";a="61268905"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 14:57:04 -0700
X-CSE-ConnectionGUID: XHYYuFR1QfS0+B1NuOcZrg==
X-CSE-MsgGUID: CufcH5FgQ8ObWPNna/XvfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; d="scan'208";a="174682216"
Received: from linux.intel.com ([10.54.29.200])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 14:57:03 -0700
Received: from [10.124.222.225] (unknown [10.124.222.225])
 by linux.intel.com (Postfix) with ESMTP id 9F6DC20B5736;
 Thu, 29 May 2025 14:57:02 -0700 (PDT)
Message-ID: <7bf8430d-fbb5-4e6f-9b09-11f6bc1ff67e@linux.intel.com>
Date: Thu, 29 May 2025 14:57:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/11] PCI/ACPI: Add PERST# Assertion Delay _DSM method
To: Badal Nilawar <badal.nilawar@intel.com>, intel-xe@lists.freedesktop.org,
 linux-acpi@vger.kernel.org, linux-pci@vger.kernel.org
Cc: anshuman.gupta@intel.com, rafael@kernel.org, lenb@kernel.org,
 bhelgaas@google.com, ilpo.jarvinen@linux.intel.com,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com, varun.gupta@intel.com,
 ville.syrjala@linux.intel.com, uma.shankar@intel.com
References: <20250529111654.3140766-1-badal.nilawar@intel.com>
 <20250529111654.3140766-4-badal.nilawar@intel.com>
Content-Language: en-US
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20250529111654.3140766-4-badal.nilawar@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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


On 5/29/25 4:16 AM, Badal Nilawar wrote:
> From: Anshuman Gupta <anshuman.gupta@intel.com>
>
> Implement _DSM Method 0Bh as per PCI firmware specs
> section 4.6.11 Rev 3.3.
>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   drivers/pci/pci-acpi.c   | 57 ++++++++++++++++++++++++++++++++++++++++
>   include/linux/pci-acpi.h |  8 +++++-
>   2 files changed, 64 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pci/pci-acpi.c b/drivers/pci/pci-acpi.c
> index d33efba4ca94..88044491feaa 100644
> --- a/drivers/pci/pci-acpi.c
> +++ b/drivers/pci/pci-acpi.c
> @@ -1531,6 +1531,63 @@ int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power,
>   }
>   EXPORT_SYMBOL_GPL(pci_acpi_request_d3cold_aux_power);
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
> +	if (!dev)
> +		return -EINVAL;
> +
> +	handle = ACPI_HANDLE(&dev->dev);
> +	if (!handle)
> +		return -EINVAL;
> +
> +	if (!acpi_check_dsm(handle, &pci_acpi_dsm_guid, 4, 1 << DSM_PCI_PERST_ASSERTION_DELAY)) {
> +		pci_dbg(dev, "ACPI _DSM 0%Xh not supported\n", DSM_PCI_PERST_ASSERTION_DELAY);
> +		return -ENODEV;
> +	}
> +
> +	out_obj = acpi_evaluate_dsm_typed(handle, &pci_acpi_dsm_guid, 4,
> +					  DSM_PCI_PERST_ASSERTION_DELAY,
> +					  &in_obj, ACPI_TYPE_INTEGER);
> +	if (!out_obj)
> +		return -EINVAL;
> +
> +	result = out_obj->integer.value;
> +
> +	if (result == delay_us) {
> +		pci_info(dev, "PERST# Assertion Delay set to %u microseconds\n", delay_us);
> +		ret = 0;

I think above is a debug message. If it is set properly, why would you want to know
the details?

> +	} else if (result == 0) {
> +		pci_warn(dev, "PERST# Assertion Delay request failed, no previous valid request\n");
> +	} else {
> +		pci_warn(dev, "PERST# Assertion Delay request failed, Previous valid delay: %u microseconds\n",
> +			 result);
> +	}

May be you don't need to elaborate the error details. Will following work?

pci_warn(dev, "PERST# Assertion Delay request failed, result:%u micro seconds\n", result);

> +
> +	ACPI_FREE(out_obj);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(pci_acpi_add_perst_assertion_delay);
> +
>   static void pci_acpi_set_external_facing(struct pci_dev *dev)
>   {
>   	u8 val;
> diff --git a/include/linux/pci-acpi.h b/include/linux/pci-acpi.h
> index 6079306ad754..e53d4893cf56 100644
> --- a/include/linux/pci-acpi.h
> +++ b/include/linux/pci-acpi.h
> @@ -122,6 +122,7 @@ extern const guid_t pci_acpi_dsm_guid;
>   #define DSM_PCI_POWER_ON_RESET_DELAY		0x08
>   #define DSM_PCI_DEVICE_READINESS_DURATIONS	0x09
>   #define DSM_PCI_D3COLD_AUX_POWER_LIMIT		0x0A
> +#define DSM_PCI_PERST_ASSERTION_DELAY		0x0B
>   
>   #ifdef CONFIG_PCIE_EDR
>   void pci_acpi_add_edr_notifier(struct pci_dev *pdev);
> @@ -135,7 +136,7 @@ int pci_acpi_set_companion_lookup_hook(struct acpi_device *(*func)(struct pci_de
>   void pci_acpi_clear_companion_lookup_hook(void);
>   int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power,
>   				      u32 *retry_interval);
> -
> +int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us);
>   #else	/* CONFIG_ACPI */
>   static inline void acpi_pci_add_bus(struct pci_bus *bus) { }
>   static inline void acpi_pci_remove_bus(struct pci_bus *bus) { }
> @@ -144,6 +145,11 @@ static inline int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 req
>   {
>   	return -EOPNOTSUPP;
>   }
> +
> +static inline int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
> +{
> +	return -EOPNOTSUPP;
> +}
>   #endif	/* CONFIG_ACPI */
>   
>   #endif	/* _PCI_ACPI_H_ */

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer

