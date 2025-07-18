Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CE73C83F1A
	for <intel-xe@archiver.kernel.org>; Fri, 18 Jul 2025 09:06:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0232C10E138;
	Fri, 18 Jul 2025 09:06:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SH5S6X8X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A8B710E138
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Jul 2025 09:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752829611; x=1784365611;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=VkpFLUSqqCb+Xt5aO4IdIuzt9p5Q4F+L+MKtap57Z4U=;
 b=SH5S6X8Xp3sqReRnWMOt69g3hdsmIxfpO8oy9RK/0RqIzYOndUDLitRJ
 QCarfPoksZPCYE/WD0nK6znmUCMem6UDP7Snzlm3ixgGE3mnCDuZhXP9C
 fK5BPJO3HKGGblFHABe1sbgGOdmcIspBcDnsWmS8sClibIKQZG+1jIqO7
 u2sz3r89DFzOBfAEwadBCkcszT3poDotQCY7D/zk41L+j0Ud52SVjgXz/
 v3uNA4slCIH8VjxZ7Ees3h9PnTtK4kUGa70CGe9SXXKYFgIiMfB7sQcVc
 ojQ7X5uoGkyXUjeWG0tnLjeEWwJDBvHZgDPhP23xdpFYH3BF4snRA5h14 w==;
X-CSE-ConnectionGUID: MKbq8n+CS/2fxBzZvTWmuQ==
X-CSE-MsgGUID: qGvV5FGxSHWysL9ZoEpndQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="55060834"
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; d="scan'208";a="55060834"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 02:06:51 -0700
X-CSE-ConnectionGUID: BYxGxfD2SQKHqM4lWpA+UA==
X-CSE-MsgGUID: pDmd4uf2QlOcCSI6mq1T1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; d="scan'208";a="162037863"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa003.fm.intel.com with ESMTP; 18 Jul 2025 02:06:49 -0700
Received: from [10.246.5.201] (mwajdecz-MOBL.ger.corp.intel.com [10.246.5.201])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id CC4AE27BDE;
 Fri, 18 Jul 2025 10:06:48 +0100 (IST)
Message-ID: <8741334c-1582-488f-82c7-41d1a998f879@intel.com>
Date: Fri, 18 Jul 2025 11:06:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] drm/xe/configfs: Enforce canonical device names
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>
References: <20250717184825.851-1-michal.wajdeczko@intel.com>
 <20250717184825.851-3-michal.wajdeczko@intel.com>
 <CH0PR11MB5444B56DB80D45010E720F8FE551A@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <CH0PR11MB5444B56DB80D45010E720F8FE551A@CH0PR11MB5444.namprd11.prod.outlook.com>
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



On 17.07.2025 23:17, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Michal Wajdeczko
> Sent: Thursday, July 17, 2025 11:48 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; De Marchi, Lucas <lucas.demarchi@intel.com>
> Subject: [PATCH 2/5] drm/xe/configfs: Enforce canonical device names
>>
>> While we expect config directory names to match PCI device name,
>> currently we are only scanning provided names for domain, bus,
>> device and function numbers, without checking their format.
>> This would pass slightly broken entries like:
>>
>>   /sys/kernel/config/xe/
>>   ├── 0000:00:02.0000000000000
>>   │   └── ...
>>   ├── 0000:00:02.0x
>>   │   └── ...
>>   ├──  0: 0: 2. 0
>>   │   └── ...
>>   └── 0:0:2.0
>>       └── ...
>>
>> To avoid such mistakes, check if the name provided exactly matches
>> the canonical PCI device address format, which we recreated from
>> the parsed BDF data. Also simplify scanf format as it can't really
>> catch all formatting errors.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_configfs.c | 9 ++++++++-
>>  1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
>> index e9b46a2d0019..90b4fe92a611 100644
>> --- a/drivers/gpu/drm/xe/xe_configfs.c
>> +++ b/drivers/gpu/drm/xe/xe_configfs.c
>> @@ -259,12 +259,19 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
>>  	unsigned int domain, bus, slot, function;
>>  	struct xe_config_device *dev;
>>  	struct pci_dev *pdev;
>> +	char canonical[16];
>>  	int ret;
>>  
>> -	ret = sscanf(name, "%04x:%02x:%02x.%x", &domain, &bus, &slot, &function);
>> +	ret = sscanf(name, "%x:%x:%x.%d", &domain, &bus, &slot, &function);
>>  	if (ret != 4)
>>  		return ERR_PTR(-EINVAL);
>>  
>> +	ret = scnprintf(canonical, sizeof(canonical), "%04x:%02x:%02x.%d", domain, bus,
>> +			PCI_SLOT(PCI_DEVFN(slot, function)),
>> +			PCI_FUNC(PCI_DEVFN(slot, function)));
> 
> Does this function have an external-facing interface?  If so, I'm a bit worried this might
> break some customer tooling.  It's probably not a big deal, as the tools should be passing
> the canonical addresses anyways, but I'm unfortunately somewhat familiar with even
> debug formatting changes breaking external tools, and they've causes endless
> headaches in the past that would be good to avoid.

even if there are tools that were passing non-canonical device names,
then they are already broken, as even if we allowed to create config
directory with with non-canonical name and let configure other
parameters, then driver will never use it as it uses canonical name
while doing lookup for device config, so all those config changes were
effectively silently ignored (without tool being aware of that)

now we will just error early to let the tool know that it is doing
something wrong, so owner of the tool have a chance to fix it

> 
> We could probably fix that by using "canonical" instead of "name" later in this function,
> such that even the 'slightly broken' names can be parsed without introducing any new
> rejection cases.

after strcmp() we are rather certain that both 'name' and 'canonical'
are the same strings, so what could be more 'slightly broken' ?

> 
> I'll leave that up to you to decide, though.
> 
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> -Jonathan Cavitt
> 
>> +	if (ret != 12 || strcmp(name, canonical))
>> +		return ERR_PTR(-EINVAL);
>> +
>>  	pdev = pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(slot, function));
>>  	if (!pdev)
>>  		return ERR_PTR(-ENODEV);
>> -- 
>> 2.47.1
>>
>>

