Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8328FC3DA5D
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 21:38:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37A2A10E464;
	Wed, 17 Jul 2024 21:38:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="edneze/Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DECE10E464
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 21:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721252315; x=1752788315;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=RncUIAep9PVLuGxMtP+s/6+ygB2vR0+Wy04JSYQFuaM=;
 b=edneze/Yzwk8C5wcXs6IghUDEbz31H2B61PuFaxxyUykYu44Ayfz2N/d
 5zVOTyFG8X0Mmrxb781KRi2Tx8ADfM3ED2AHjk62/VQXnFc8oKAVcquZL
 Vha5LnpYqU6JWBkZXzEoihEPnublQTf2I0Sis2Azsx0uWdDS8jwI+dIFV
 imY8TM9X1ci25136iGZk26Lv+gtkyY85XSFaRcQidIe0RcKtX+V2xrjcu
 F6ZGahzAp+svngMBlZo8XinJOt5XnrNxMuNaqUtSDSr5cViwHT/OrOU98
 5McZA/WnGmoavUSJ5cLhuaq+ObJ7e6fuRHlTMAYtKKMsLBz1R9EVqbS39 Q==;
X-CSE-ConnectionGUID: YyawkrzdSfWbggbfj5JROw==
X-CSE-MsgGUID: ELt/8kKgSwaH8vYjg70QSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18598839"
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="18598839"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 14:38:35 -0700
X-CSE-ConnectionGUID: l78fIfiSSTetT6CYI+Zy5g==
X-CSE-MsgGUID: wx4glKYETfyBks+s/OGlxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="55381900"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa003.jf.intel.com with ESMTP; 17 Jul 2024 14:38:33 -0700
Received: from [10.246.1.253] (mwajdecz-MOBL.ger.corp.intel.com [10.246.1.253])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id CEA982878D;
 Wed, 17 Jul 2024 22:38:32 +0100 (IST)
Message-ID: <3bb0e3ca-25f2-413e-bb94-d264eba2cd83@intel.com>
Date: Wed, 17 Jul 2024 23:38:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] drm/xe: Introduce const cast helper
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20240717195155.442-1-michal.wajdeczko@intel.com>
 <20240717195155.442-2-michal.wajdeczko@intel.com>
 <CH0PR11MB5444E1B66CFF7EDFAA997B68E5A32@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <CH0PR11MB5444E1B66CFF7EDFAA997B68E5A32@CH0PR11MB5444.namprd11.prod.outlook.com>
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



On 17.07.2024 22:07, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Michal Wajdeczko
> Sent: Wednesday, July 17, 2024 12:52 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>
> Subject: [PATCH v2 1/7] drm/xe: Introduce const cast helper
>>
>> Typically we want to preserve pointer constness when converting
>> from one xe pointer to another, but in some rare cases, like kunit
>> parameter conversions, we might want to discard this constness.
>> Add a helper that we will use to clearly indicate our intention.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_device.h | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>> index 0a2a3e7fd402..c2b1f9f066bd 100644
>> --- a/drivers/gpu/drm/xe/xe_device.h
>> +++ b/drivers/gpu/drm/xe/xe_device.h
>> @@ -20,6 +20,11 @@ static inline struct xe_device *pdev_to_xe_device(struct pci_dev *pdev)
>>  	return pci_get_drvdata(pdev);
>>  }
>>  
>> +static inline struct xe_device *xe_device_const_cast(const struct xe_device *xe)
>> +{
>> +	return pdev_to_xe_device(to_pci_dev(xe->drm.dev));
>> +}
> 
> This function is used in the next patch and no others.  It may or may not be
> better to have this patch and the next squashed together, since that's where
> this function is used, but I can see the argument go either way.

This _other_ argument was that this helper is not strictly designed for
explicit use by those new kunit helpers, or it can be implemented in a
different way, so IMO it deserved standalone patch in a series where it
was actually used for the first time.

> 
> Just something to consider.  Not blocking.
> 
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> -Jonathan Cavitt

Thanks!

> 
>> +
>>  static inline struct xe_device *ttm_to_xe_device(struct ttm_device *ttm)
>>  {
>>  	return container_of(ttm, struct xe_device, ttm);
>> -- 
>> 2.43.0
>>
>>
