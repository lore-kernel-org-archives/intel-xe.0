Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11EBBC83F1A
	for <intel-xe@archiver.kernel.org>; Thu, 17 Jul 2025 20:51:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2A5710E29F;
	Thu, 17 Jul 2025 20:51:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ONEeTYk/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B48F410E29F
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Jul 2025 20:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752785499; x=1784321499;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=nXBgF8iI4JzKguMd6nFNQf+ZOlA8cTHh/5HvtYxWRMk=;
 b=ONEeTYk/A0n890Yn95iVwV38wKNuhWiSsUlfaMjt678CIUQClI17w56J
 cwLEhxP0rtQE9QulQYa2BWl+csEJG2bbbEVlBUaP/rf/IFXE6BjVSnOF5
 eaUvzESZ8HED6LY3NNZ9qp70r2szD52cJkk+PttGfa4EjFgqgGagvgSQl
 MLE4CPRH1c3xxnhHIFC2Y1w+xXsajvDkJVdhs6OSlQJbeJvwsB3iO+7j/
 /riGEoLdtA7UC/DzCCtHfjdVQw0kWxuFrcYm8xGIxxoXkUMeVY9BzrpKF
 Xbe15b8/e7nQ5+vd9LcRr0q2wXILKllQZLCtUnE44iqQEW/XqcJro9n4E w==;
X-CSE-ConnectionGUID: MTbbUF8rTDe8WP4iyp/FZw==
X-CSE-MsgGUID: RMdC5ObrQBqLTvbuphbBaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="54788507"
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; d="scan'208";a="54788507"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 13:51:39 -0700
X-CSE-ConnectionGUID: JnFCBHV1QE+fZ1RRyqI1PQ==
X-CSE-MsgGUID: ycJHQBpGRa+nzJq07zPASQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; d="scan'208";a="163524189"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa005.jf.intel.com with ESMTP; 17 Jul 2025 13:51:38 -0700
Received: from [10.245.84.121] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.84.121])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 301EC332D0;
 Thu, 17 Jul 2025 21:51:37 +0100 (IST)
Message-ID: <828bb2f9-e486-48bb-9d88-75c54a370640@intel.com>
Date: Thu, 17 Jul 2025 22:51:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] drm/xe/configfs: Allow configurations only for Intel
 VGA devices
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20250717184825.851-1-michal.wajdeczko@intel.com>
 <20250717184825.851-5-michal.wajdeczko@intel.com>
 <4giwyvxxjwwopctdrugqgnwjdytushpvumxd7lbmzobg2bamax@nuegb34lc4qi>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <4giwyvxxjwwopctdrugqgnwjdytushpvumxd7lbmzobg2bamax@nuegb34lc4qi>
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



On 17.07.2025 21:52, Lucas De Marchi wrote:
> On Thu, Jul 17, 2025 at 08:48:24PM +0200, Michal Wajdeczko wrote:
>> The Xe driver supports only Intel GPUs devices that all are PCI
>> VGA class devices. Reject creation of configuration directories
>> for PCI device addresses that are not Intel or VGA.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_configfs.c | 7 +++++++
>> 1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/
>> xe_configfs.c
>> index 00bb4e412c12..1df8cce78f13 100644
>> --- a/drivers/gpu/drm/xe/xe_configfs.c
>> +++ b/drivers/gpu/drm/xe/xe_configfs.c
>> @@ -260,6 +260,7 @@ static struct config_group
>> *xe_config_make_device_group(struct config_group *gro
>>     struct xe_config_device *dev;
>>     struct pci_dev *pdev;
>>     char canonical[16];
>> +    bool match;
>>     int ret;
>>
>>     ret = sscanf(name, "%x:%x:%x.%d", &domain, &bus, &slot, &function);
>> @@ -275,8 +276,14 @@ static struct config_group
>> *xe_config_make_device_group(struct config_group *gro
>>     pdev = pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(slot,
>> function));
>>     if (!pdev)
>>         return ERR_PTR(-ENODEV);
>> +
>> +    match = pci_is_vga(pdev) && pdev->vendor == PCI_VENDOR_ID_INTEL;
> 
> although not officially supported by xe, we had devices in the past with
> class 0x0380 and (I think) 0x302.

I can look directly at pdev->class to check for all legacy classes

> 
> is the goal here to error early on typos that cause the config to not
> "stick" and now error/warning to the user? 

they would stick, but what's the point to allow user adding config for
the PCI devices that we will never be able to use?

IMO since we error early if given PCI device address is not present on
current system, we should also try to error early if someone enters data
using PCI address of not our device

> Maybe we should rather have a
> positive indication during bind that the user can grep for in the log?

that could be added independently as a confirmation that driver noticed
specific configuration was prepared for given device:

 [ ] xe 0000:00:02.0: [drm] found custom settings in configfs!

I guess individual params, if different than default, should be logged
on the go, like something like this one from engines_allowed:

 [ ] xe 0000:00:02.0: [drm] GT1: vcs0 disabled via configfs

> 
> Lucas De Marchi
> 
>> +
>>     pci_dev_put(pdev);
>>
>> +    if (!match)
>> +        return ERR_PTR(-ENODEV);
>> +
>>     dev = kzalloc(sizeof(*dev), GFP_KERNEL);
>>     if (!dev)
>>         return ERR_PTR(-ENOMEM);
>> -- 
>> 2.47.1
>>

