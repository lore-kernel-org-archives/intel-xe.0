Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61B17C83F17
	for <intel-xe@archiver.kernel.org>; Fri, 18 Jul 2025 09:23:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2794B10E92E;
	Fri, 18 Jul 2025 09:23:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mUb5XBzi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A64C510E92E
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Jul 2025 09:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752830633; x=1784366633;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=V64zkxc0BTMOGSAyG25KwJf/uD+Ytwqqv3jZGx/dQp4=;
 b=mUb5XBziF/fPXsgEkFFOVQBnFsADHrby+6Asb8BOumXI3fKKj00Xld7e
 JbvEJABqe/BGyny2uluCT3wjP+wE/uRRTsxRIzc9CFpAW3SkaNCc5PRG9
 33WfoupoPSHY1Fqg2EGzRmtLVsMQOfxtrAwoyUFXLOaYPglPdZqq0Q0zt
 hUPXQWrdfBEFplTMUPVN+9eutNKblIfUIRSIGHrmDmKU6Ai137g1I9HWF
 /QzgZJ/W1FqogwXN8upgMIfkAhP2fD9VHm0/Au6gGrCpiVayjcECmBAAn
 OjBB3ui49KVsTQ/tN3MFXBguB5hnX4tVFiSLqWnQgm2TpfIDKG9D4uIlX Q==;
X-CSE-ConnectionGUID: GH+uVcwwShK4MVlArrCZjw==
X-CSE-MsgGUID: OT/7xnCCStWroM2EqhhWhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="65379485"
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; d="scan'208";a="65379485"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 02:23:53 -0700
X-CSE-ConnectionGUID: V7ntyrHySkCHIa/6x0bAlA==
X-CSE-MsgGUID: VVxPuQV+Qc6FqJMPVqDVqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; d="scan'208";a="158132870"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa006.fm.intel.com with ESMTP; 18 Jul 2025 02:23:52 -0700
Received: from [10.246.5.201] (mwajdecz-MOBL.ger.corp.intel.com [10.246.5.201])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 03E0428196;
 Fri, 18 Jul 2025 10:23:50 +0100 (IST)
Message-ID: <97755849-44a3-441a-abfe-29d1815aefa7@intel.com>
Date: Fri, 18 Jul 2025 11:23:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] drm/xe/configfs: Use pci_name() for lookup
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>
References: <20250717184825.851-1-michal.wajdeczko@intel.com>
 <20250717184825.851-4-michal.wajdeczko@intel.com>
 <CH0PR11MB544443198055F40D7E90C1E0E551A@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <CH0PR11MB544443198055F40D7E90C1E0E551A@CH0PR11MB5444.namprd11.prod.outlook.com>
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



On 17.07.2025 23:18, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Michal Wajdeczko
> Sent: Thursday, July 17, 2025 11:48 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; De Marchi, Lucas <lucas.demarchi@intel.com>
> Subject: [PATCH 3/5] drm/xe/configfs: Use pci_name() for lookup
>>
>> There is no need to manually build PCI device name from BDF data,
>> since it was already prepared and assigned and can be accessed by
>> calling pci_name() function.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_configfs.c | 6 +-----
>>  1 file changed, 1 insertion(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
>> index 90b4fe92a611..00bb4e412c12 100644
>> --- a/drivers/gpu/drm/xe/xe_configfs.c
>> +++ b/drivers/gpu/drm/xe/xe_configfs.c
>> @@ -312,13 +312,9 @@ static struct configfs_subsystem xe_configfs = {
>>  static struct xe_config_device *configfs_find_group(struct pci_dev *pdev)
>>  {
>>  	struct config_item *item;
>> -	char name[64];
>> -
>> -	snprintf(name, sizeof(name), "%04x:%02x:%02x.%x", pci_domain_nr(pdev->bus),
>> -		 pdev->bus->number, PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn));
>>  
>>  	mutex_lock(&xe_configfs.su_mutex);
>> -	item = config_group_find_item(&xe_configfs.su_group, name);
>> +	item = config_group_find_item(&xe_configfs.su_group, pci_name(pdev));
> 
> Oddly, it doesn't seem like pci_name is a helper function that generates the name we were
> previously constructing manually.  Instead, it looks like it returns either pdev->dev->init_name
> or pdev->dev->kobj->name.
> 
> On the other hand, I can't imagine a function called "pci_name" returning anything other
> than what we were looking for prior, so I'm going to trust you did your due diligence
> and that pci_name returns the same thing during runtime that the snprintf was previously
> constructing.

you missed dev_set_name() called from pci_setup_device() here [1]

[1]
https://elixir.bootlin.com/linux/v6.16-rc6/source/drivers/pci/probe.c#L2006

> 
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> -Jonathan Cavitt
>  
>>  	mutex_unlock(&xe_configfs.su_mutex);
>>  
>>  	if (!item)
>> -- 
>> 2.47.1
>>
>>

