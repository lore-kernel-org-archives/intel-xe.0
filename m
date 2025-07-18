Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD0CC83F1A
	for <intel-xe@archiver.kernel.org>; Fri, 18 Jul 2025 09:29:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7314510E339;
	Fri, 18 Jul 2025 09:29:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aEgZ2G81";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD80210E339
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Jul 2025 09:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752830991; x=1784366991;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=bwP7T9FpLi5yQHsnh8L7W7qkgyWtjbSo3ZU1xm3eDFQ=;
 b=aEgZ2G81BS4C9fuL46woPdlss8ot2z+jVFTA6DFr/2mzpc1zvC3d4EQF
 GqaHNe9JLMRprfim+JX3o542mlXARWcRdBpe2bGcQB7pJeX0FCW9wcmFR
 TQwWbOpMmHqhlh+0scTu+LTFsxSMshG/mOE4l69k7J+2TG7wn0L9yIBOm
 AWiKpbZEGw2W5KjXIhKIWcQ2Cec5q0icJJ7rZvJKsDAOjEpolAnyKf/Mb
 BJejzYrr+2tO+GA5vj3J+NiVipi2qMwqtOq7FI25eSzOeQUoI0QSwIZjj
 g1SLgtf49NW0z3SQAeyDhIUdjqj5qcukh0OEBFyDpmwRnriPt8h8OAB8D g==;
X-CSE-ConnectionGUID: BlVbNLABS5S8PNisbrv0yQ==
X-CSE-MsgGUID: Le+r88JHRLCi5feNvCZZ2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="54224864"
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; d="scan'208";a="54224864"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 02:29:51 -0700
X-CSE-ConnectionGUID: EdstXKPJTCmGsOpUkTAqJQ==
X-CSE-MsgGUID: BT8ZIJH4Rq2F6btEoDIQqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; d="scan'208";a="158719574"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa010.fm.intel.com with ESMTP; 18 Jul 2025 02:29:49 -0700
Received: from [10.246.5.201] (mwajdecz-MOBL.ger.corp.intel.com [10.246.5.201])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 34A9828196;
 Fri, 18 Jul 2025 10:29:48 +0100 (IST)
Message-ID: <9f8bb67b-4381-40cb-ad02-6eaa4b5f94e1@intel.com>
Date: Fri, 18 Jul 2025 11:29:47 +0200
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
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <CH0PR11MB544431B55F24E0F1688393E4E551A@CH0PR11MB5444.namprd11.prod.outlook.com>
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



On 17.07.2025 23:19, Cavitt, Jonathan wrote:
> -----Original Message-----
>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Michal Wajdeczko
>> Sent: Thursday, July 17, 2025 11:48 AM
>> To: intel-xe@lists.freedesktop.org
>> Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; De Marchi, Lucas <lucas.demarchi@intel.com>
>> Subject: [PATCH 4/5] drm/xe/configfs: Allow configurations only for Intel VGA devices
>>
>> The Xe driver supports only Intel GPUs devices that all are PCI
>> VGA class devices. Reject creation of configuration directories
>> for PCI device addresses that are not Intel or VGA.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_configfs.c | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
>> index 00bb4e412c12..1df8cce78f13 100644
>> --- a/drivers/gpu/drm/xe/xe_configfs.c
>> +++ b/drivers/gpu/drm/xe/xe_configfs.c
>> @@ -260,6 +260,7 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
>>  	struct xe_config_device *dev;
>>  	struct pci_dev *pdev;
>>  	char canonical[16];
>> +	bool match;
>>  	int ret;
>>  
>>  	ret = sscanf(name, "%x:%x:%x.%d", &domain, &bus, &slot, &function);
>> @@ -275,8 +276,14 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
>>  	pdev = pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(slot, function));
>>  	if (!pdev)
>>  		return ERR_PTR(-ENODEV);
>> +
>> +	match = pci_is_vga(pdev) && pdev->vendor == PCI_VENDOR_ID_INTEL;
> 
> This match check is relatively short.  Debatably, we could just do the comparison
> directly in the if-statement instead of assigning the result to a new variable.

what do you mean by the "if-statement" ?

we can't return early here as then we would leak (again) a device
reference that we just fixed in patch 1/5

> 
> I won't block on it, though, since clearly labeling these comparisons is important.  Though,
> perhaps we should call it "op_supported" instead of "match"?  I understand why it's called
> "match" here (it's more in line with how it's used in patch 5), but maybe this check and the
> check in patch 5 should be separated out?

I'm not sure that adding more flags variables will make code any
cleaner, what's important are conditions inside, and yes, this is
aligned with next patch, which adds more conditions to be checked before
we can claim that there is a "match" between device address and device
class that we may support

> 
> Just a suggestion.
> 
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> -Jonathan Cavitt
> 
>> +
>>  	pci_dev_put(pdev);
>>  
>> +	if (!match)
>> +		return ERR_PTR(-ENODEV);
>> +
>>  	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
>>  	if (!dev)
>>  		return ERR_PTR(-ENOMEM);
>> -- 
>> 2.47.1
>>
>>

