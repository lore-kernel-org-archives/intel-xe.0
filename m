Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCEEAD46C15
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 23:11:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A199E10E77C;
	Wed, 28 Jan 2026 23:11:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I8nCJhCg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C710810E77A;
 Wed, 28 Jan 2026 23:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769641884; x=1801177884;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=6trxM7cNz5iev1gEWGh1IBZRuCLMJ/J4o7zOpOpXXFQ=;
 b=I8nCJhCg8MZz1MnHp3PgvWBEzWnpIFKHtroXKGTNImfTgFly1mEbNuz9
 an+UKUu7cHuhE1J/tvFloZCpXOHSiplmdv967a6X/+7z3mJSnZdKp2uqK
 JSb0qwlgfEJOl4d3i9VHKHoDyfBWlOKY9+eVF8SNXRQhcIs7PiLTd+o7B
 c3SOOhVI8M7ROv1W3EbR2bR1IjAl4IFo27bQp7hmqDL1oiH4jHGpCARN7
 AZ62RXH5f250NfuCd7t7PXNY3C+ECaKl7FhVuLkZWeM9RBTFtPsS+A/+n
 2lTwGpLh90KCP2ElCruSM7F8d3YiYak+Mx/futCbyVXOh1M2s4hiF3FZ+ g==;
X-CSE-ConnectionGUID: p6lkqjekSXCu3Qn5qGj6Hg==
X-CSE-MsgGUID: +ZFremh1QZWwu3xVy9ALvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="81185551"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="81185551"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 15:11:24 -0800
X-CSE-ConnectionGUID: ziyoWdzmSvGwn3gJUwfq+g==
X-CSE-MsgGUID: kJnZrfehR4Kd0Ss3pptBgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="239135491"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 15:11:21 -0800
Date: Thu, 29 Jan 2026 00:11:19 +0100 (CET)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
cc: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Andi Shyti <andi.shyti@linux.intel.com>, 
 Krzysztof Karas <krzysztof.karas@intel.com>, 
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>, 
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>, 
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: [PATCH v1] i915/i915_driver: move intel_gvt_init() level
 higher
In-Reply-To: <9f706b79a949d51fc97e8a5c2f68327413a22645@intel.com>
Message-ID: <8e1ee0f6-12e8-cb6f-2845-c2f5cbde6fa0@intel.com>
References: <20260128180933.2561419-1-michal.grzelak@intel.com>
 <9f706b79a949d51fc97e8a5c2f68327413a22645@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-747331900-1769641883=:2563562"
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-747331900-1769641883=:2563562
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 28 Jan 2026, Jani Nikula wrote:
> On Wed, 28 Jan 2026, Michał Grzelak <michal.grzelak@intel.com> wrote:
>> i915_driver_probe() cannot currently handle error of intel_gvt_init()
>> because it is called from i915_driver_hw_probe(). Nevertheless, it's
>> error path is done in i915_driver_probe(). Fault of
>> i915_driver_hw_probe() thus causes list corruption, since
>> intel_gvt_driver_remove() was called twice.
>>
>> Move intel_gvt_init() up to i915_driver_probe(). Adjust error path of
>> i915_driver_hw_probe() so that intel_gvt_driver_remove() is called
>> always once.
>>
>> Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
>> ---
>>  drivers/gpu/drm/i915/i915_driver.c | 18 +++++++++---------
>>  1 file changed, 9 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
>> index 1e087dfe03d0..0f507b8ae2f1 100644
>> --- a/drivers/gpu/drm/i915/i915_driver.c
>> +++ b/drivers/gpu/drm/i915/i915_driver.c
>> @@ -557,10 +557,6 @@ static int i915_driver_hw_probe(struct drm_i915_private *dev_priv)
>>  			drm_dbg(&dev_priv->drm, "can't enable MSI");
>>  	}
>>
>> -	ret = intel_gvt_init(dev_priv);
>> -	if (ret)
>> -		goto err_msi;
>> -
>>  	intel_opregion_setup(display);
>>
>>  	ret = i915_pcode_init(dev_priv);
>> @@ -581,9 +577,6 @@ static int i915_driver_hw_probe(struct drm_i915_private *dev_priv)
>>
>>  err_opregion:
>>  	intel_opregion_cleanup(display);
>> -err_msi:
>> -	if (pdev->msi_enabled)
>> -		pci_disable_msi(pdev);
>
> Why's this being moved?
>

No sane reason, it's me overlooking err_opregion error path.
Will fix it in next version.

BR,
Michał

>>  err_mem_regions:
>>  	intel_memory_regions_driver_release(dev_priv);
>>  err_ggtt:
>> @@ -870,9 +863,13 @@ int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>>  	if (ret < 0)
>>  		goto out_cleanup_mmio;
>>
>> +	ret = intel_gvt_init(i915);
>> +	if (ret)
>> +		goto out_cleanup_hw;
>> +
>>  	ret = intel_display_driver_probe_noirq(display);
>>  	if (ret < 0)
>> -		goto out_cleanup_hw;
>> +		goto out_cleanup_gvt;
>>
>>  	ret = intel_irq_install(i915);
>>  	if (ret)
>> @@ -921,6 +918,10 @@ int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>>  	intel_irq_uninstall(i915);
>>  out_cleanup_modeset:
>>  	intel_display_driver_remove_nogem(display);
>> +out_cleanup_gvt:
>> +	if (pdev->msi_enabled)
>> +		pci_disable_msi(pdev);
>> +	intel_gvt_driver_remove(i915);
>>  out_cleanup_hw:
>>  	i915_driver_hw_remove(i915);
>>  	intel_memory_regions_driver_release(i915);
>> @@ -928,7 +929,6 @@ int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>>  	i915_gem_drain_freed_objects(i915);
>>  	i915_ggtt_driver_late_release(i915);
>>  out_cleanup_mmio:
>> -	intel_gvt_driver_remove(i915);
>>  	i915_driver_mmio_release(i915);
>>  out_runtime_pm_put:
>>  	enable_rpm_wakeref_asserts(&i915->runtime_pm);
>
> -- 
> Jani Nikula, Intel
>
--8323329-747331900-1769641883=:2563562--
