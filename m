Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A71F3C83F17
	for <intel-xe@archiver.kernel.org>; Fri, 18 Jul 2025 08:58:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5048D10E926;
	Fri, 18 Jul 2025 08:58:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mJBbJX9d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D8D910E926
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Jul 2025 08:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752829108; x=1784365108;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=0ZnqyoCZ+Cs3mFnS0Ze8Fl3rXKs1rqo7PeE+0DzRx0Y=;
 b=mJBbJX9dPyxNyXd48ftDhwT45DqESo0lHsNW355RpWHfKW0QOADCAQYo
 m/OfJvDNs4F65KQwsCb9TJANYCPLQ4F+ucwbYvd88qQwiHb9ml0STdiTj
 We3NZx7Gsbg/YEhz4UN2vl4qkxvr0/k0wnRcb20+SVOw/bqLMyOrLWJU6
 7QGaSXBAXCNWlQs1EA2tuhtorjeEjWmkUDoQdkY48nfA9bB/rP45nZca9
 7tIL8sZlXfOELmmDiKjj7WHprdN/nVVJGJBZDHkevir6tkNajBfOkeA/C
 FPibgHKdW5WXPPxdAF65nQuaJgbGKQjkT5RGQQDhnv6Bhz/WlgOvEVc/8 A==;
X-CSE-ConnectionGUID: rfWHJHSyQ3ybsaipb2CJgw==
X-CSE-MsgGUID: npdfjZhkTSO6dvKXhJCXaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="80563083"
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; d="scan'208";a="80563083"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 01:58:28 -0700
X-CSE-ConnectionGUID: ywWFnuP+RiO75Xude9+6FA==
X-CSE-MsgGUID: IBpOJX2GT5CQVcgzMhug2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; d="scan'208";a="158088242"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa007.jf.intel.com with ESMTP; 18 Jul 2025 01:58:27 -0700
Received: from [10.246.5.201] (mwajdecz-MOBL.ger.corp.intel.com [10.246.5.201])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id A719827BD5;
 Fri, 18 Jul 2025 09:58:25 +0100 (IST)
Message-ID: <83826115-1846-433f-b087-a695faf3d0fc@intel.com>
Date: Fri, 18 Jul 2025 10:58:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] drm/xe/configfs: Fix pci_dev reference leak
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>
References: <20250717184825.851-1-michal.wajdeczko@intel.com>
 <20250717184825.851-2-michal.wajdeczko@intel.com>
 <CH0PR11MB5444593FFB130CD1644E3244E551A@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <CH0PR11MB5444593FFB130CD1644E3244E551A@CH0PR11MB5444.namprd11.prod.outlook.com>
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



On 17.07.2025 23:16, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Michal Wajdeczko
> Sent: Thursday, July 17, 2025 11:48 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; De Marchi, Lucas <lucas.demarchi@intel.com>
> Subject: [PATCH 1/5] drm/xe/configfs: Fix pci_dev reference leak
>>
>> We are using pci_get_domain_bus_and_slot() function to verify if
>> the given config directory name matches any existing PCI device,
>> but we missed to call matching pci_dev_put() to release reference.
>>
>> While around, also change error code in case of no device match,
>> to make it more specific than generic formatting error.
>>
>> Fixes: 16280ded45fb ("drm/xe: Add configfs to enable survivability mode")
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>
> Since we're already being fairly granular with the changes in this patch series,
> it probably would've been okay for us to separate the pci_dev_put addition
> from the errno change here.  

while we could split this small patch even further, note that changes
are still around the same logical feature ("check for existing PCI
device") so IMO combining them in single patch is still ok (and since it
has Fixes tag we have a chance to propagate both together)

> But I won't make it a requirement.

hint: usually such comments are then prefixed with "nit:" to make it
clear that comment is just a suggestion or personal preference

> 
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> -Jonathan Cavitt
> 
>> ---
>>  drivers/gpu/drm/xe/xe_configfs.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
>> index 8ec1ff1e4e80..e9b46a2d0019 100644
>> --- a/drivers/gpu/drm/xe/xe_configfs.c
>> +++ b/drivers/gpu/drm/xe/xe_configfs.c
>> @@ -267,7 +267,8 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
>>  
>>  	pdev = pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(slot, function));
>>  	if (!pdev)
>> -		return ERR_PTR(-EINVAL);
>> +		return ERR_PTR(-ENODEV);
>> +	pci_dev_put(pdev);
>>  
>>  	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
>>  	if (!dev)
>> -- 
>> 2.47.1
>>
>>

