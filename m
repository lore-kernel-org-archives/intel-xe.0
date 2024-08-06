Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D082BC52D70
	for <intel-xe@archiver.kernel.org>; Tue,  6 Aug 2024 19:20:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6008910E3DC;
	Tue,  6 Aug 2024 19:20:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AQquNjcK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58D2010E3DC
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Aug 2024 19:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722972015; x=1754508015;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=dEFbb0Zu5qcTwsjOj1S3Tm7mT09zb3574/CmKqrlBvY=;
 b=AQquNjcK14qhlVzYw1o2z9zJwvOoFXDF3l9PA8Zje4Z5FRlH1qxEAKha
 u+esyfjNRzuzD1NmDD2/FkLyYQ0M0TyRK84xWyN5LW9UJJBafzOQtBztW
 CQTmOBqfOWC9iVNCJ0q4ISBWbZrxZ2LtabYiGwmdb6G9vp5tHlt3SBhXK
 SMC7GeaPOOUFo6nSMl53VtnItqBJ7sw9LwWUInnbPL56tdg86+PQIIY4X
 ycPih58LyZWSGgrc1e8cfzx1FOKy1/80hiOuwQFwF8ICT/dc0+b4NCYb8
 a37izBC7pxlCd2RaOyUDg54j0t3JoKsSLn+pRoYhcPgnd2TQxCOO0y/w8 Q==;
X-CSE-ConnectionGUID: 3SVDPVELQoOJGdFuNVYPVg==
X-CSE-MsgGUID: bhyiwpIgQI+OWkn4eHwxkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="20866239"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; d="scan'208";a="20866239"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 12:20:14 -0700
X-CSE-ConnectionGUID: nXfVQyYmRjuDPguixqvvbw==
X-CSE-MsgGUID: bKBT1vmjTLuIE3do4X8d+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; d="scan'208";a="61431123"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa003.jf.intel.com with ESMTP; 06 Aug 2024 12:20:12 -0700
Received: from [10.246.1.253] (mwajdecz-MOBL.ger.corp.intel.com [10.246.1.253])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 92C742FC4C;
 Tue,  6 Aug 2024 20:20:10 +0100 (IST)
Message-ID: <359e6a57-3723-4f84-8c03-17aa5297f896@intel.com>
Date: Tue, 6 Aug 2024 21:20:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/pf: Fix VF config validation on multi-GT platforms
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Cc: "Piorkowski, Piotr" <piotr.piorkowski@intel.com>
References: <20240806180516.618-1-michal.wajdeczko@intel.com>
 <CH0PR11MB5444D43F49E815158EA5B1C3E5BF2@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <CH0PR11MB5444D43F49E815158EA5B1C3E5BF2@CH0PR11MB5444.namprd11.prod.outlook.com>
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



On 06.08.2024 21:06, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Michal Wajdeczko
> Sent: Tuesday, August 6, 2024 11:05 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Piorkowski, Piotr <piotr.piorkowski@intel.com>
> Subject: [PATCH] drm/xe/pf: Fix VF config validation on multi-GT platforms
>>
>> When validating VF config on the media GT, we may wrongly report
>> that VF is already partially configured on it, as we consider GGTT
>> and LMEM provisioning done on the primary GT (since both GGTT and
>> LMEM are tile-level resources, not a GT-level).
>>
>> This will cause skipping a VF auto-provisioning on the media-GT and
>> in result will block a VF from successfully initialize that GT.
>>
>> Fix that by considering GGTT and LMEM configurations only when
>> checking if a VF provisioning is complete, and omit GGTT and LMEM
>> when reporting empty/partial provisioning.
>>
>> Fixes: 234670cea9a2 ("drm/xe/pf: Skip fair VFs provisioning if already provisioned")
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 11 ++++++++---
>>  1 file changed, 8 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>> index 52c7277d243d..227527785afd 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>> @@ -1928,6 +1928,7 @@ static int pf_validate_vf_config(struct xe_gt *gt, unsigned int vfid)
>>  {
>>  	struct xe_gt *primary_gt = gt_to_tile(gt)->primary_gt;
>>  	struct xe_device *xe = gt_to_xe(gt);
>> +	bool is_primary = !xe_gt_is_media_type(gt);
>>  	bool valid_ggtt, valid_ctxs, valid_dbs;
>>  	bool valid_any, valid_all;
>>  
>> @@ -1936,13 +1937,17 @@ static int pf_validate_vf_config(struct xe_gt *gt, unsigned int vfid)
>>  	valid_dbs = pf_get_vf_config_dbs(gt, vfid);
>>  
>>  	/* note that GuC doorbells are optional */
>> -	valid_any = valid_ggtt || valid_ctxs || valid_dbs;
>> -	valid_all = valid_ggtt && valid_ctxs;
>> +	valid_any = valid_ctxs || valid_dbs;
>> +	valid_all = valid_ctxs;
>> +
>> +	/* and GGTT/LMEM is configured on primary GT only */
>> +	valid_all = valid_all && valid_ggtt;
>> +	valid_any = valid_any || (valid_ggtt && is_primary);
> 
> I can see why you would want to keep the ggtt configuration separate from
> the rest of the config, though it might be cleaner to just keep it all collected
> together like it was before. 

it's still collected together as it was, just final flags are calculated
separately ;)

> Not blocking on this, though:
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

thanks!

> -Jonathan Cavitt
> 
>>  
>>  	if (IS_DGFX(xe)) {
>>  		bool valid_lmem = pf_get_vf_config_ggtt(primary_gt, vfid);
>>  
>> -		valid_any = valid_any || valid_lmem;
>> +		valid_any = valid_any || (valid_lmem && is_primary);
>>  		valid_all = valid_all && valid_lmem;
>>  	}
>>  
>> -- 
>> 2.43.0
>>
>>
