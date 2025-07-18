Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A916DC83F1A
	for <intel-xe@archiver.kernel.org>; Fri, 18 Jul 2025 14:34:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 667B010E9CC;
	Fri, 18 Jul 2025 14:34:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V3TmkqfK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD63D10E9CC
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Jul 2025 14:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752849241; x=1784385241;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=RHUHUaBE0e7W6nc7qC6KHBXDzpuQFtahCLHTew7OrW0=;
 b=V3TmkqfKZIGhysmpmivcJUrMOdoULq4WF2/6Ct/tjBERcA2NpZVYia+X
 AvcMXu9fd8oYHlLPWZ3flgJ9gY5ogvw4UrJeQCt7/8K6ygbhWR9OkUl2A
 9jKipXQMsvLO9e52OzH6JeV0NnfXLImgaHvgVikRtSnvqtRDN7y+Eb4HQ
 eVO+9p48hn14pYvNRSgSgCjXNFZ9lRKl4V5qOszD4WsnmvfStU6CB9vp1
 yOs6JWwROk28CWXvmD+Nm870b2GsjZahNXGcPsy+fN7SfE8QP3B0FYsEJ
 6xYzIvG4LGEhO6i3r1//rSR7U+DEylSOAEAcoyjcKstSdVzxFW0G9al8z A==;
X-CSE-ConnectionGUID: gjzwJRQoS+iSueBMbZF5jw==
X-CSE-MsgGUID: q6tlwRZjT2acrC745GFbSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="66209367"
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; d="scan'208";a="66209367"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 07:34:01 -0700
X-CSE-ConnectionGUID: ivOxO4DKTuykBihu7xG5uA==
X-CSE-MsgGUID: ebd3FbuUTxaEaAJkbqjzKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; d="scan'208";a="158196294"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa006.fm.intel.com with ESMTP; 18 Jul 2025 07:33:59 -0700
Received: from [10.245.96.74] (unknown [10.245.96.74])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id CED45312CF;
 Fri, 18 Jul 2025 15:33:57 +0100 (IST)
Message-ID: <cda446a2-bcf5-4865-b30a-c807e82d5e3e@intel.com>
Date: Fri, 18 Jul 2025 16:33:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] drm/xe/configfs: Allow configurations only for Intel
 VGA devices
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>
References: <20250717184825.851-1-michal.wajdeczko@intel.com>
 <20250717184825.851-5-michal.wajdeczko@intel.com>
 <CH0PR11MB544431B55F24E0F1688393E4E551A@CH0PR11MB5444.namprd11.prod.outlook.com>
 <9f8bb67b-4381-40cb-ad02-6eaa4b5f94e1@intel.com>
 <CH0PR11MB544405DF502241716CBE896EE550A@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <CH0PR11MB544405DF502241716CBE896EE550A@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
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



On 18.07.2025 16:27, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Wajdeczko, Michal <Michal.Wajdeczko@intel.com> 
> Sent: Friday, July 18, 2025 2:30 AM
> To: Cavitt, Jonathan <jonathan.cavitt@intel.com>; intel-xe@lists.freedesktop.org
> Cc: De Marchi, Lucas <lucas.demarchi@intel.com>
> Subject: Re: [PATCH 4/5] drm/xe/configfs: Allow configurations only for Intel VGA devices
>>
>> On 17.07.2025 23:19, Cavitt, Jonathan wrote:
>>> -----Original Message-----
>>>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Michal Wajdeczko
>>>> Sent: Thursday, July 17, 2025 11:48 AM
>>>> To: intel-xe@lists.freedesktop.org
>>>> Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; De Marchi, Lucas <lucas.demarchi@intel.com>
>>>> Subject: [PATCH 4/5] drm/xe/configfs: Allow configurations only for Intel VGA devices
>>>>
>>>> The Xe driver supports only Intel GPUs devices that all are PCI
>>>> VGA class devices. Reject creation of configuration directories
>>>> for PCI device addresses that are not Intel or VGA.
>>>>
>>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>> ---
>>>>  drivers/gpu/drm/xe/xe_configfs.c | 7 +++++++
>>>>  1 file changed, 7 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
>>>> index 00bb4e412c12..1df8cce78f13 100644
>>>> --- a/drivers/gpu/drm/xe/xe_configfs.c
>>>> +++ b/drivers/gpu/drm/xe/xe_configfs.c
>>>> @@ -260,6 +260,7 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
>>>>  	struct xe_config_device *dev;
>>>>  	struct pci_dev *pdev;
>>>>  	char canonical[16];
>>>> +	bool match;
>>>>  	int ret;
>>>>  
>>>>  	ret = sscanf(name, "%x:%x:%x.%d", &domain, &bus, &slot, &function);
>>>> @@ -275,8 +276,14 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
>>>>  	pdev = pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(slot, function));
>>>>  	if (!pdev)
>>>>  		return ERR_PTR(-ENODEV);
>>>> +
>>>> +	match = pci_is_vga(pdev) && pdev->vendor == PCI_VENDOR_ID_INTEL;
>>>
>>> This match check is relatively short.  Debatably, we could just do the comparison
>>> directly in the if-statement instead of assigning the result to a new variable.
>>
>> what do you mean by the "if-statement" ?
>>
>> we can't return early here as then we would leak (again) a device
>> reference that we just fixed in patch 1/5
> 
> By 'if-statement', I meant this one lower down, after the pci_dev_put:
> 
> """
> 	if (!match)
> """
> 
> I was suggesting that we could perform the check there instead.  Something like:
> 
> """
> 	if (!pci_is_vga(pdev) || pdev->vendor != PCI_VENDOR_ID_INTEL)
> """
> 
> Doing so would eliminate the need for the new variable 'match' defined in this patch.
> 
> However, I understand why we're not doing it that way.

just to confirm (as this is a different reason than I mentioned above):
after pci_dev_put() we shouldn't access pdev any more

> -Jonathan Cavitt
> 
>>
>>>
>>> I won't block on it, though, since clearly labeling these comparisons is important.  Though,
>>> perhaps we should call it "op_supported" instead of "match"?  I understand why it's called
>>> "match" here (it's more in line with how it's used in patch 5), but maybe this check and the
>>> check in patch 5 should be separated out?
>>
>> I'm not sure that adding more flags variables will make code any
>> cleaner, what's important are conditions inside, and yes, this is
>> aligned with next patch, which adds more conditions to be checked before
>> we can claim that there is a "match" between device address and device
>> class that we may support
>>
>>>
>>> Just a suggestion.
>>>
>>> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>>> -Jonathan Cavitt
>>>
>>>> +
>>>>  	pci_dev_put(pdev);
>>>>  
>>>> +	if (!match)
>>>> +		return ERR_PTR(-ENODEV);
>>>> +
>>>>  	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
>>>>  	if (!dev)
>>>>  		return ERR_PTR(-ENOMEM);
>>>> -- 
>>>> 2.47.1
>>>>
>>>>
>>
>>

