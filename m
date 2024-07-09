Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 576F0C3DA47
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jul 2024 12:02:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C4C410E524;
	Tue,  9 Jul 2024 12:02:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CRrbZKTA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C0D710E517
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jul 2024 12:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720526566; x=1752062566;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=TPNIX+j0H5EWzSMUCPIlLlMyH3JK6NPnc7Jmvgm32OQ=;
 b=CRrbZKTAHXSP5BkuJwtAJaKBF/yPBAE4fIk3xNlVBDq5L2vJidxMJwVd
 lj4+R7IkyZhbb9v68GDJzNRXJ9FzkfUiq702GWi5xprtZm5jvOmzLhakQ
 CVLHVUB/TGrjz81eZD+jEgrMWHM2UeWXdERklEDphoq06NduxMwzjlQNc
 Mi06f36g9VTdWWdn2KBOndXqt7dMQg8484UZZ4eco/zeDJm+eiFoH6iz9
 cEa27IcSew2xqc0xp1pKz++KRBsB6+XZMzp3um0YLYC6P536m3DEi4zYx
 ZeMHzIjAQMvLq4bdFDVfCOsiSklR60vuiqgjMLgkAwON+nYGmzEKZOpW0 Q==;
X-CSE-ConnectionGUID: EwAiszE5T9yjUWai+tZ4ew==
X-CSE-MsgGUID: DVaXyjARSQW6LiG9KqVJSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="35211117"
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; d="scan'208";a="35211117"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 05:02:46 -0700
X-CSE-ConnectionGUID: DI8ivzjZTkSGryjT18EC8Q==
X-CSE-MsgGUID: HELnIuubTJS7jfRAVPk92Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; d="scan'208";a="48272340"
Received: from unknown (HELO [10.245.244.94]) ([10.245.244.94])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 05:02:44 -0700
Message-ID: <259d5f84-98d3-48eb-84c7-b2bf82d2c3f8@intel.com>
Date: Tue, 9 Jul 2024 13:02:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe: Use 64K pages for scanout buffers for Xe2
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240709111231.490440-1-zbigniew.kempczynski@intel.com>
 <20240709111231.490440-3-zbigniew.kempczynski@intel.com>
 <2a5772c2-8956-4de9-b4b6-e13260209241@intel.com>
 <20240709115716.qcgtcsysctoydgwm@zkempczy-mobl2>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240709115716.qcgtcsysctoydgwm@zkempczy-mobl2>
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

On 09/07/2024 12:57, Zbigniew Kempczyński wrote:
> On Tue, Jul 09, 2024 at 12:26:15PM +0100, Matthew Auld wrote:
>> On 09/07/2024 12:12, Zbigniew Kempczyński wrote:
>>> Set Xe2 platforms to use 64K pages for display.
>>>
>>> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_pci.c | 1 +
>>>    1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>>> index 53b67f39c7d5..b629145d23fa 100644
>>> --- a/drivers/gpu/drm/xe/xe_pci.c
>>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>>> @@ -177,6 +177,7 @@ static const struct xe_graphics_desc graphics_xe2 = {
>>>    	.name = "Xe2_LPG / Xe2_HPG",
>>>    	XE2_GFX_FEATURES,
>>> +	.vram_flags = XE_VRAM_FLAGS_DISPLAY_NEED64K,
>>
>> This change will also apply to lnl, but I don't think we have a way of
>> forcefully getting 64K pages for system memory atm. Do we just need this for
>> bmg or is it really all of xe2?
> 
> Issue we've seen was on BMG. Do you suggest to separate BMG desc entry
> to keep LNL intact?

If we go this route then yes I think best to leave lnl, if this is not 
needed there.

> 
> --
> Zbigniew
> 
>>
>>>    };
>>>    static const struct xe_media_desc media_xem = {
