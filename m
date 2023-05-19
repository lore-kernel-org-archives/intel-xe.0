Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 157B0C7EE26
	for <intel-xe@archiver.kernel.org>; Fri, 19 May 2023 16:49:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD73E10E4C8;
	Fri, 19 May 2023 16:49:58 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B7D810E5BA
 for <intel-xe@lists.freedesktop.org>; Fri, 19 May 2023 16:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684514998; x=1716050998;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=OWMnGJBFxAAVgOALmvUaeM6IMMPncQm8NSNKkmcuKdc=;
 b=QPq99q/P28w5WWYW1QbzIXe0rPOrq9oBvvnybIToowwB4+cgluPwMJhU
 lOwOfFMRjtG3XFo7hcWKLDBjdkqXLcyJK0IUrRVIZi+1oulC9kIH3YS/L
 W/s4udaF2Y0gGE8iewl+34N+3oKNnNHaCp0lPfTWOrA9VA8aFyENWKUuf
 5jjrY+AACQV+W6uFYjWuVFmRzDVMwL6InDetcY6CKj76Yk5Bt62LMfePq
 lOtJOqDBRNZHj+pxAbW4h1vBuCRMS9cJ+FcZ1tZVKzzyBGt3Qsvi79PVP
 X3KAjNbUQ6rgrNGpb2DkhAHq1FCZP5CUCf/PRA5/ua8bZmdTIB8Q2MM6Z A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="418119218"
X-IronPort-AV: E=Sophos;i="6.00,177,1681196400"; d="scan'208";a="418119218"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 09:49:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="696772483"
X-IronPort-AV: E=Sophos;i="6.00,177,1681196400"; d="scan'208";a="696772483"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orsmga007.jf.intel.com with ESMTP; 19 May 2023 09:49:55 -0700
Received: from [10.249.143.198] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.143.198])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 49E4F33BE2;
 Fri, 19 May 2023 17:49:54 +0100 (IST)
Message-ID: <e58e0776-014e-32ed-c0e6-98eea9376adc@intel.com>
Date: Fri, 19 May 2023 18:49:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>
References: <20230519095618.1160-1-michal.wajdeczko@intel.com>
 <20230519163944.GD10045@mdroper-desk1.amr.corp.intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20230519163944.GD10045@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH] drm/xe: Change GuC interrupt data
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 19.05.2023 18:39, Matt Roper wrote:
> On Fri, May 19, 2023 at 11:56:18AM +0200, Michal Wajdeczko wrote:
>> Both GUC_HOST_INTERRUPT and MED_GUC_HOST_INTERRUPT can pass
>> additional payload data to the GuC but this capability is not
>> used by the firmware yet.
>>
>> Stop using value mandated by legacy GuC interrupt register and
>> use default notify value (zero) instead.
>>
>> Bspec: 49813, 63363
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> 
> Looks like GUC_SEND_TRIGGER was only relevant to the old
> HOST2GUC_INT_REG register (0xc4c8) that was used through gen9.  Should
> we remove the #define for that bit from the header as well?

I've already prepared follow up patches to fix that, will post now:

drm/xe: Reorder GuC interrupt register definition
drm/xe: Drop legacy GuC interrupt register definition

> 
> Aside from that,
> 
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

thanks,
Michal

> 
>> ---
>>  drivers/gpu/drm/xe/xe_guc.c | 8 +++++++-
>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index eb4af4c71124..effd8b1ff59d 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -600,8 +600,14 @@ int xe_guc_suspend(struct xe_guc *guc)
>>  void xe_guc_notify(struct xe_guc *guc)
>>  {
>>  	struct xe_gt *gt = guc_to_gt(guc);
>> +	const u32 default_notify_data = 0;
>>  
>> -	xe_mmio_write32(gt, guc->notify_reg, GUC_SEND_TRIGGER);
>> +	/*
>> +	 * Both GUC_HOST_INTERRUPT and MED_GUC_HOST_INTERRUPT can pass
>> +	 * additional payload data to the GuC but this capability is not
>> +	 * used by the firmware yet. Use default value in the meantime.
>> +	 */
>> +	xe_mmio_write32(gt, guc->notify_reg, default_notify_data);
>>  }
>>  
>>  int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr)
>> -- 
>> 2.25.1
>>
> 
