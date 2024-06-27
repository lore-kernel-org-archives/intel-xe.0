Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DCC6C2BD09
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jun 2024 10:48:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12B9F10E1D0;
	Thu, 27 Jun 2024 10:48:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I0fSkERS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4009810E1D0
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jun 2024 10:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719485294; x=1751021294;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=JKWu0g9xyFkPFFTbqqjSdGYHiHKdfuljSYDwnjjGh9k=;
 b=I0fSkERSn34wVgjIimcKKeDmpM0ZzTB66FosPTx+7IyCMQZlpTJuSXLE
 h1Fhl2xqZSi/t2OS0i+F7FR87Rx9s7Zm8j2jojSC0c5ufXNrZ2gNzgCst
 PrWsM3zBnBUdZDNn/BZPdkYlqg2fJFYB/rv5+5YE1EMD73FQsyrFJkHNj
 UYLftN1ysIKzEkuEKSUcJoBDD5ZOVReIkQPK/uIg4RHje+gDonJaLoVF/
 VWGxweAoXQoBr1xH/AG6CoPG1VulmtHhmWek09OzOCHEniUdDNrA98ieN
 vNBl7iBdd3tN4LhggCAEJMcarIKUqB8AUl/Ab9gBAFKfEwhUX90q8zU4v Q==;
X-CSE-ConnectionGUID: m5sMiIzqSFy3CzTOohynwg==
X-CSE-MsgGUID: +Z1yXmRmRE69rBncCPs9tw==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="20487189"
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; d="scan'208";a="20487189"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 03:48:14 -0700
X-CSE-ConnectionGUID: MZ/a7r64SQu1xzSzMBOmqg==
X-CSE-MsgGUID: nbrpbn9IQvyZms8wb+DM1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; d="scan'208";a="75526022"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa001.fm.intel.com with ESMTP; 27 Jun 2024 03:48:09 -0700
Received: from [10.246.27.12] (unknown [10.246.27.12])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 58E32125BB;
 Thu, 27 Jun 2024 11:48:07 +0100 (IST)
Message-ID: <801d8516-36a7-43c1-a74b-751ff0b55a1c@intel.com>
Date: Thu, 27 Jun 2024 12:48:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/pf: Disable VFs on remove
To: Jani Nikula <jani.nikula@linux.intel.com>, intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
References: <20240626111827.1389-1-michal.wajdeczko@intel.com>
 <20240626111827.1389-2-michal.wajdeczko@intel.com> <87frsydc8a.fsf@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <87frsydc8a.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 27.06.2024 10:24, Jani Nikula wrote:
> On Wed, 26 Jun 2024, Michal Wajdeczko <michal.wajdeczko@intel.com> wrote:
>> We shouldn't leave VFs enabled when unloading the PF driver.
>> Otherwise we will get a message like:
>>
>>  [ ] xe 0000:4d:00.0: driver left SR-IOV enabled after remove
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_pci.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index ebff5ea79b1d..4b91a9878f41 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -749,6 +749,11 @@ static void xe_pci_remove(struct pci_dev *pdev)
>>  	if (!xe) /* driver load aborted, nothing to cleanup */
>>  		return;
>>  
>> +#ifdef CONFIG_PCI_IOV
>> +	if (IS_SRIOV_PF(xe))
>> +		xe_pci_sriov_configure(pdev, 0);
>> +#endif
>> +
> 
> Please don't add inline #ifdefs.
> 
> IS_SRIOV_PF() works for CONFIG_PCI_IOV=n. xe_pci_sriov_configure()
> should also have a stub for CONFIG_PCI_IOV=n.
> 
> Alternatively, if you also added a dedicated function for disabling VF,
> you could have a stub for that, and
> 
> #define xe_pci_sriov_configure NULL
> 
> for CONFIG_PCI_IOV=n, so you wouldn't have to have inline #ifdefs in
> xe_pci_driver initialization either.

I was somehow biased that pci_driver.sriov_config hook is only available
under CONFIG_PCI_IOV (which is not true) and that's why followed the
pattern as it was done for the .driver.pm

See [1] where both #ifdef CONFIG_PCI_IOV were removed

[1] https://patchwork.freedesktop.org/series/135472/

Thanks for spotting this,
Michal

> 
> 
> BR,
> Jani.
> 
> 
>>  	xe_device_remove(xe);
>>  	xe_pm_runtime_fini(xe);
>>  	pci_set_drvdata(pdev, NULL);
> 
