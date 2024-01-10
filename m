Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCFBBC4707B
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jan 2024 17:55:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9753010E7A5;
	Wed, 10 Jan 2024 17:55:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 450FF10E7A5
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jan 2024 17:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704909310; x=1736445310;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Dkw478Bwg694z84n9lfeujvU3Y3jBtm0ulJtVuTddvU=;
 b=NmaJXhNl72xTCRLwx1Lu033RINqFv4yxde6M/nWAQvPHoB+emxjxpD/m
 pzgluB9aWe727c0EfkJ1+CZhhOR+cyI4MQ60h22sllsDiFwGjRopCy7zJ
 xaKpgXC24AqrbcjmUHoFIyE8GUDKakyYjNHJAFwYOMl0JpcqF2DDSONMz
 ao7AJ61Xo1wft7xgVTIt1ghtH+hMtpqKTyKasaMEB+uaLmZ/jZm14+YfG
 e99tYToVHEA/Qja4S8jARNGD88FU8Fiw5jFxvBKPHTb+n9cxw14vfqLJR
 nXM+MhlcAZ+k1dYVDUhYdBacFrfHU1X5IXFBVg5Tv2YvJYb7HuHg2Bb4R g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="402374950"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="402374950"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 09:55:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="758463416"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="758463416"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orsmga006.jf.intel.com with ESMTP; 10 Jan 2024 09:55:08 -0800
Received: from [10.249.134.210] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.134.210])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id CB7E7B4387;
 Wed, 10 Jan 2024 17:55:07 +0000 (GMT)
Message-ID: <fc79394c-90e2-49b9-9c41-3b7cc7900251@intel.com>
Date: Wed, 10 Jan 2024 18:55:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/guc: Fix arguments passed to relay G2H handlers
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>
References: <20240109230015.365-1-michal.wajdeczko@intel.com>
 <20240109230015.365-2-michal.wajdeczko@intel.com>
 <ZZ3pGXZiuIWo+N4Y@DUT025-TGLU.fm.intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <ZZ3pGXZiuIWo+N4Y@DUT025-TGLU.fm.intel.com>
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 10.01.2024 01:47, Matthew Brost wrote:
> On Tue, Jan 09, 2024 at 04:00:15PM -0700, Michal Wajdeczko wrote:
>> By default CT code was passing just payload of th G2H event/request
>> message, while Relay code expects full G2H message including HXG
>> header which contains DATA0 field. Fix that.
>>
>> Fixes: 152577060697 ("drm/xe/guc: Start handling GuC Relay event messages")
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_guc_ct.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>> index 9d1d855da229..721564dbfda6 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -975,10 +975,10 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *hxg, u32 len)
>>  							   adj_len);
>>  		break;
>>  	case XE_GUC_ACTION_GUC2PF_RELAY_FROM_VF:
>> -		ret = xe_guc_relay_process_guc2pf(&guc->relay, payload, adj_len);
>> +		ret = xe_guc_relay_process_guc2pf(&guc->relay, hxg, len);
> 
> Should we change this function definition:
> 
> int xe_guc_relay_process_guc2pf(struct xe_guc_relay *relay, const u32 *msg, u32 len)
> ->
> int xe_guc_relay_process_guc2pf(struct xe_guc_relay *relay, const u32 *hxg, u32 len)

only CT layer deals with two kind of "messages": CTB and HXG, so we need
some way of naming to distinguish between them, while rest of the code
is expecting only HXG messages so IMO no need to use hxg as message name

> 
>>  		break;
>>  	case XE_GUC_ACTION_GUC2VF_RELAY_FROM_PF:
>> -		ret = xe_guc_relay_process_guc2vf(&guc->relay, payload, adj_len);
>> +		ret = xe_guc_relay_process_guc2vf(&guc->relay, hxg, len);
> 
> Same here?
> 
> Fix itself LGTM.
> 
> Matt
> 
>>  		break;
>>  	default:
>>  		drm_err(&xe->drm, "unexpected action 0x%04x\n", action);
>> -- 
>> 2.25.1
>>
