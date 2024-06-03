Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEDAFC25B76
	for <intel-xe@archiver.kernel.org>; Mon,  3 Jun 2024 19:17:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E63AA10E3CD;
	Mon,  3 Jun 2024 19:17:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZykKC3o7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 129EA10E3CD
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Jun 2024 19:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717442235; x=1748978235;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=2dUP+jmQNoiXOi5xomGrAUB1Fkcvd9c9eYkYQw0TM7s=;
 b=ZykKC3o7e7JgkeW6Y3WyX2i8U2DCEOdWV222HnGcbkBquNoYZAN8c8sb
 /p+7L1+4KqkkxOEkzRq+drX/y8EIMSCBbSCv3SPqqCxBKxH3F+Mfnpr4y
 h+AAp/5F/ACX1UoxGZpB5/r+ja1SHYlO29hYKvds8Xo9CPYlVQRtxUVj0
 CO848+fN2Y6EjYtzrmNBRgU2bNWPlSTsSlY6RgpBliAKHrv7zq1RwCr4t
 76ubUTlfdtTBnPVTVeDhyl22CRa3SjBeBMttlP7fxkou1HHOG+Axr9HOp
 n8xD8RzyIsd/I05DXFP0iLf6MflZKTlvg6dWTtDWTOtg4zHj0IiV+bAVu g==;
X-CSE-ConnectionGUID: g0+t+pjLRfadPbd8lwL5Dg==
X-CSE-MsgGUID: XC2kuAQbS4yVCuL2gz29jA==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="31456039"
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="31456039"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 12:17:14 -0700
X-CSE-ConnectionGUID: C5/8US5FT6S37WBhiFSoeA==
X-CSE-MsgGUID: NiUKrwLjR0W/oP9ULIR1yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="41402978"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa003.fm.intel.com with ESMTP; 03 Jun 2024 12:17:14 -0700
Received: from [10.246.19.248] (mwajdecz-MOBL.ger.corp.intel.com
 [10.246.19.248])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 5FDC627BD9;
 Mon,  3 Jun 2024 20:17:12 +0100 (IST)
Message-ID: <248127cd-0ada-458c-bd07-2f2fa9d2e58a@intel.com>
Date: Mon, 3 Jun 2024 21:17:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Request max GT freq during resume
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>,
 intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
References: <20240531214232.3026621-1-vinay.belgaumkar@intel.com>
 <1a85d036-42a7-4cd2-b015-98e7378461f9@intel.com>
 <bd32e680-e4ed-4269-a634-d97b2dafd968@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <bd32e680-e4ed-4269-a634-d97b2dafd968@intel.com>
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



On 03.06.2024 21:06, Belgaumkar, Vinay wrote:
> 
> On 6/3/2024 8:28 AM, Michal Wajdeczko wrote:
>>
>> On 31.05.2024 23:42, Vinay Belgaumkar wrote:
>>> We already request max freq in the load path, moving it
>>> to __xe_guc_upload will ensure this speeds up GuC load in
>>> the resume path as well.
>>>
>>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_guc.c | 6 +++---
>>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>>> index f7886c00af01..63e1b685bd4f 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>> @@ -694,6 +694,9 @@ static int __xe_guc_upload(struct xe_guc *guc)
>>>   {
>>>       int ret;
>>>   +    /* Raise GT freq to speed up HuC/GuC load */
>>> +    xe_guc_pc_init_early(&guc->pc);
>> maybe it's just me, but usually we were using _init_early() name suffix
>> for functions with some early, one-time, likely software-only
>> initialization, while here this xe_guc_pc_init_early() seems to be doing
>> something else and now it could even be called many times
> 
> It is initializing the internal variables to the fused frequency values
> as well. It is still being called only once so far. This patch just
> changes where it is called from.

this is now called from xe_uc_init_hw(), so not once per driver load:

/*
 * Should be called during driver load, after every GT reset, and after
every
 * suspend to reload / auth the firmwares.
 */
int xe_uc_init_hw(struct xe_uc *uc)
{
...	ret = xe_guc_upload(&uc->guc);


int xe_guc_upload(struct xe_guc *guc)
{
...	return __xe_guc_upload(guc);

> 
> Also, as of now, I don't see any other location where we could call this
> from. If that happens, we can rename the function.
> 
> Thanks,
> 
> Vinay.
> 
>>
>> maybe it should be split/renamed to xe_guc_pc_boost() or something?
>>
>>> +
>>>       guc_write_params(guc);
>>>       guc_prepare_xfer(guc);
>>>   @@ -779,9 +782,6 @@ int xe_guc_min_load_for_hwconfig(struct xe_guc
>>> *guc)
>>>         xe_guc_ads_populate_minimal(&guc->ads);
>>>   -    /* Raise GT freq to speed up HuC/GuC load */
>>> -    xe_guc_pc_init_early(&guc->pc);
>>> -
>>>       ret = __xe_guc_upload(guc);
>>>       if (ret)
>>>           return ret;
