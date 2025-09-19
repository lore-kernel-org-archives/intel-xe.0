Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA66CAC592
	for <intel-xe@archiver.kernel.org>; Fri, 19 Sep 2025 16:23:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBEE610EA67;
	Fri, 19 Sep 2025 16:23:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nlmPAF7L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1050610EA67
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Sep 2025 16:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758298983; x=1789834983;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=OHVIAhrfSGigtKrUtVkLBYHcLmWgahpnSRQUZ+ZLD7U=;
 b=nlmPAF7LJMKlP2l1+7hY+0j4pZXj2NpMvwlujgtA/fcmxRmidXHtt0t4
 PG6BS3DxrHRIkQcE8LNlHfRJUZH60DHm5MXPYWt0zZXM/N5Z+fhZI/Q2m
 djCgOZseZZ+1I4wLHuKJVGTkWbhmJcMHdbojX74jDKiD0xwGt2Usme9BF
 UtYMkCuvNw79wY5frJxjz9RWF1HHdn3LtQEvTV7D5j8SyTuOVREGjgO+J
 GckUYZeQN5nurvCf16zDpAyecg9R1KQk/Y+j8XPSDiG7oO1uqpZdUSL62
 WQuoUzoSHMg7KxF2RNU7khz27GakEF7MeIpR/TB4Q0JovbTS09ZHxUqKz g==;
X-CSE-ConnectionGUID: 3DvIyIBDSiy3Ei+rKmfuzA==
X-CSE-MsgGUID: uP493aFgRAy0iKtgOa/HGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11558"; a="70896975"
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; d="scan'208";a="70896975"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2025 09:23:03 -0700
X-CSE-ConnectionGUID: n0j3V7tGSSO+GS+92H9Rcg==
X-CSE-MsgGUID: 3JPe/JlmRBuL3aiBCjnasw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; d="scan'208";a="175795582"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.85.180])
 ([10.245.85.180])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2025 09:23:01 -0700
Message-ID: <3455f6e5-89a6-4eb2-8b56-9b792d0b42b9@linux.intel.com>
Date: Fri, 19 Sep 2025 18:22:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/pf: Keep VF LMEM BAR size low if no VFs enabled
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
References: <20250918164355.1459200-1-marcin.bernatowicz@linux.intel.com>
 <4c0f7b32-db6f-4758-89f9-22f6848d99a5@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <4c0f7b32-db6f-4758-89f9-22f6848d99a5@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 9/18/2025 8:24 PM, Michal Wajdeczko wrote:
> 
> 
> On 9/18/2025 6:43 PM, Marcin Bernatowicz wrote:
>> When VFs are enabled on dGFX the driver resizes the PF VF_LMEM_BAR to
>> fit the requested layout. After VFs are disabled the PF VF BAR
>> size is left as-is. On platforms with tight MMIO apertures a
>> subsequent unplug/rescan followed by another enable may fail with:
>>
>>    "VF BAR …: can't assign; no space"
>>
>> because the PCI core reserves address space based on the (now large) VF
>> template, often multiplied by totalvfs.
>>
>> v2: Use pci.total_vfs in helper (Michał Wajdeczko)
> 
> internal reviews don't count

Ack. I’ll drop the v2 note tied to internal review.

> 
>>
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5937
>> Fixes: 94eae6ee4c2d ("drm/xe/pf: Set VF LMEM BAR size")
>> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>> Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Michał Winiarski <michal.winiarski@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pci_sriov.c | 22 ++++++++++++++++++++++
>>   1 file changed, 22 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
>> index af05db07162e..ff003a650f79 100644
>> --- a/drivers/gpu/drm/xe/xe_pci_sriov.c
>> +++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
>> @@ -144,11 +144,26 @@ static int resize_vf_vram_bar(struct xe_device *xe, int num_vfs)
>>   	return pci_iov_vf_bar_set_size(pdev, VF_LMEM_BAR, __fls(sizes));
>>   }
>>   
>> +static void reduce_vf_vram_bar_size(struct xe_device *xe)
> 
> is it "reduce" or "restore" ?

Agree — “restore” is clearer. We’re resetting the VF LMEM BAR template 
to the order that fits total_vfs, not just shrinking it. I’ll rename to 
restore_vf_vram_bar_size()

> 
>> +{
>> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>> +	int err;
>> +
>> +	if (!IS_DGFX(xe))
>> +		return;
>> +
>> +	err = resize_vf_vram_bar(xe, pci_sriov_get_totalvfs(pdev));
> 
> pci_sriov_get_totalvfs() might also return tweaked value based on xe.max_vfs modparam
> 
> https://elixir.bootlin.com/linux/v6.17-rc6/source/drivers/pci/iov.c#L1276
> 

Good catch. I’ll use the driver’s cached device total VFs:
xe->sriov.pf.device_total_vfs

>> +	if (err)
>> +		xe_sriov_info(xe, "Failed to reduce VF LMEM BAR size: %d\n",
>> +			      err);
> 
> we try to show nice error codes using (%pe)

Ack
> 
>> +}
>> +
>>   static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
>>   {
>>   	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>   	int total_vfs = xe_sriov_pf_get_totalvfs(xe);
>>   	int err;
>> +	bool vf_vram_bar_resized = false;
> 
> please try to keep vars in reverse-xmas-tree order

Ack>
>>   
>>   	xe_assert(xe, IS_SRIOV_PF(xe));
>>   	xe_assert(xe, num_vfs > 0);
>> @@ -178,6 +193,8 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
>>   		err = resize_vf_vram_bar(xe, num_vfs);
>>   		if (err)
>>   			xe_sriov_info(xe, "Failed to set VF LMEM BAR size: %d\n", err);
>> +		else
>> +			vf_vram_bar_resized = true;
>>   	}
>>   
>>   	err = pci_enable_sriov(pdev, num_vfs);
>> @@ -194,6 +211,9 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
>>   	return num_vfs;
>>   
>>   failed:
>> +	if (vf_vram_bar_resized)
>> +		reduce_vf_vram_bar_size(xe);
> 
> in pf_disable_vfs() below it's called unconditionally
> why can't we do the same here? or it's broken there?
>
Makes sense, I do not see a reason to not call it unconditionally here 
and drop vf_vram_bar_resized

>> +
>>   	pf_unprovision_vfs(xe, num_vfs);
>>   	xe_pm_runtime_put(xe);
>>   out:
>> @@ -218,6 +238,8 @@ static int pf_disable_vfs(struct xe_device *xe)
>>   
>>   	pci_disable_sriov(pdev);
>>   
>> +	reduce_vf_vram_bar_size(xe);
>> +
>>   	pf_reset_vfs(xe, num_vfs);
>>   
>>   	pf_unprovision_vfs(xe, num_vfs);
> 

