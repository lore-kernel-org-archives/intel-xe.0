Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBCC3C83F1A
	for <intel-xe@archiver.kernel.org>; Thu, 17 Jul 2025 20:27:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 735C810E89C;
	Thu, 17 Jul 2025 20:27:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ShUxN+Wd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74C4810E89C
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Jul 2025 20:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752784044; x=1784320044;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=izyJ31zK7A4+79+kW3032aBaUvY4ugK/FLp7cbkfmcM=;
 b=ShUxN+WdNugf5nh0P3hgzAZnuhMn0mkDHXKHI6EH9aJ4dZ+RyuxWHk8J
 D9pG474m7phxkllsQ/Cj9o04n8VD1WcGrPsW+GLlHrHBVmQh0dkgaLWHt
 KsQMBw5rCC1DyQy3FCvTt6IycW4Nb3KiUMRaWt7zDKPp7dotH5Rtc8V5r
 9TXTkzUNomhYDk0XIvzruYCOQh53svStk9S6go2zR6bDQMK6jIbGIgi6r
 MEtNXTPOltlTNv/zd7nyf491SrvnkIejhT3/rWT4KULQEgtyXRDiUxei0
 liwqS5agegObTU+rrpwkp1fRxU8SlJaKak+VxC96QnLLtjQch7h1EmlAi Q==;
X-CSE-ConnectionGUID: LJA7eC4dRf6+blnVDs3NYQ==
X-CSE-MsgGUID: ET9HWWxcTVyke5Kv98Ng/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="77613045"
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; d="scan'208";a="77613045"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 13:27:23 -0700
X-CSE-ConnectionGUID: 4VHRvQBaSbqdHIWw1nNgZg==
X-CSE-MsgGUID: idTeDkyOQgSCjUgXNr3UcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; d="scan'208";a="157280938"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa010.jf.intel.com with ESMTP; 17 Jul 2025 13:27:21 -0700
Received: from [10.245.84.121] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.84.121])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 755B3332C4;
 Thu, 17 Jul 2025 21:27:20 +0100 (IST)
Message-ID: <d6386e19-3297-410c-9277-52f31a6efe00@intel.com>
Date: Thu, 17 Jul 2025 22:27:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] drm/xe/configfs: Enforce canonical device names
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20250717184825.851-1-michal.wajdeczko@intel.com>
 <20250717184825.851-3-michal.wajdeczko@intel.com>
 <duul5d3baqjos7uxl2nzvwo6q77bhvaiky5dlqa7febbzj4y7m@kh2mecfcifqi>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <duul5d3baqjos7uxl2nzvwo6q77bhvaiky5dlqa7febbzj4y7m@kh2mecfcifqi>
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



On 17.07.2025 21:43, Lucas De Marchi wrote:
> On Thu, Jul 17, 2025 at 08:48:22PM +0200, Michal Wajdeczko wrote:
>> While we expect config directory names to match PCI device name,
>> currently we are only scanning provided names for domain, bus,
>> device and function numbers, without checking their format.
>> This would pass slightly broken entries like:
>>
>>  /sys/kernel/config/xe/
>>  ├── 0000:00:02.0000000000000
>>  │   └── ...
>>  ├── 0000:00:02.0x
>>  │   └── ...
>>  ├──  0: 0: 2. 0
>>  │   └── ...
>>  └── 0:0:2.0
>>      └── ...
>>
>> To avoid such mistakes, check if the name provided exactly matches
>> the canonical PCI device address format, which we recreated from
>> the parsed BDF data. Also simplify scanf format as it can't really
>> catch all formatting errors.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_configfs.c | 9 ++++++++-
>> 1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/
>> xe_configfs.c
>> index e9b46a2d0019..90b4fe92a611 100644
>> --- a/drivers/gpu/drm/xe/xe_configfs.c
>> +++ b/drivers/gpu/drm/xe/xe_configfs.c
>> @@ -259,12 +259,19 @@ static struct config_group
>> *xe_config_make_device_group(struct config_group *gro
>>     unsigned int domain, bus, slot, function;
>>     struct xe_config_device *dev;
>>     struct pci_dev *pdev;
>> +    char canonical[16];
>>     int ret;
>>
>> -    ret = sscanf(name, "%04x:%02x:%02x.%x", &domain, &bus, &slot,
>> &function);
>> +    ret = sscanf(name, "%x:%x:%x.%d", &domain, &bus, &slot, &function);
> 
>                      ^
> 
> This should still be hex. It may work "better" because we have up to 8
> functions.
> 
> .9 and .a are equally bad, we don't need to fail one here and one below.

below is the next level of verification, that also includes check for
slot to be up to 1F (31) instead of FF that scanf would allow, so IMO
it's ok to fail one case here and other later

but since it looks that vsscanf expects signed int pointer for "%d" and
we have 'function' defined as unsigned int, so it must be "%x" - you win

> 
> Also grepping around, it's always %x that is used. Exxample:
> 
> drivers/pci/pci.c:      ret = sscanf(wpath, "%x:%x:%x.%x%c", &seg, &bus,
> &slot,
> drivers/pci/vgaarb.c:   n = sscanf(buf, "PCI:%x:%x:%x.%x", domain, bus,
> &slot, &func);
> 
> 
>>     if (ret != 4)
>>         return ERR_PTR(-EINVAL);
>>
>> +    ret = scnprintf(canonical, sizeof(canonical), "%04x:%02x:%02x.
>> %d", domain, bus,
>> +            PCI_SLOT(PCI_DEVFN(slot, function)),
>> +            PCI_FUNC(PCI_DEVFN(slot, function)));
>> +    if (ret != 12 || strcmp(name, canonical))
>> +        return ERR_PTR(-EINVAL);
> 
> do we really need this? Wouldn't it be sufficient to just fail with
> ENODEV in the line below?

with EINVAL we are saying that name format is wrong, like in this case:

	"0:0:2.0"

while ENODEV indicates that format is ok, but device is not present or
not supported, like:

	"0000:00:01.1"

> 
> Lucas De Marchi
> 
>> +
>>     pdev = pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(slot,
>> function));
>>     if (!pdev)
>>         return ERR_PTR(-ENODEV);
>> -- 
>> 2.47.1
>>

