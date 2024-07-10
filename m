Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04FDBC3DA45
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jul 2024 10:45:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB86410E2BE;
	Wed, 10 Jul 2024 10:45:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z/3klQfO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3785E10E2BE
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jul 2024 10:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720608317; x=1752144317;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=sY3pqrqTaMnV2v5295MI2UE0ruEXElC0OV9rXOjGssA=;
 b=Z/3klQfOAOlIr4fNaJ3RlATTqzcP9BBuEtW0sS0l9jurezdyBNBEbhRk
 ifJRzIkUQmculbmxrd6QNwBcBEIGMix8HXTGqHTBkjIGNhaQ0mNUu3SAD
 iOdcg1F0WJJuVo0/z6aHkcwNBBRarorIGJWLqMuIpGuZ7RICmbAEGSw5y
 WimmuZ9wA0Sei8azuncS4qyJxo2yfnPdKGj3ROeHUO5/cr3l3FIY8uP6u
 OBUIiASPoSOwb+65J9CIo+5Mh7SQHhWRPf/YMVkXa53Xq7tB2RMtM4s2Q
 mAhdWuJNz1wWMBM14iLvsWam1LMjZbQqcijIojlIoAcKifltWojJr6jf4 w==;
X-CSE-ConnectionGUID: Mu2nVfXCRxCbya9jKFmZPA==
X-CSE-MsgGUID: z3AZ+OybS3yAdtAeIi0QUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="29079661"
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; d="scan'208";a="29079661"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 03:45:16 -0700
X-CSE-ConnectionGUID: x8ZCq2PKQUioX2MBzMCsXg==
X-CSE-MsgGUID: 4PUl+MoERmW+UerR8+uDgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; d="scan'208";a="48053292"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.94.254.89])
 ([10.94.254.89])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 03:45:14 -0700
Message-ID: <071ff7b7-3a4f-4695-a527-6f83854e2167@linux.intel.com>
Date: Wed, 10 Jul 2024 12:45:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/display/xe_hdcp_gsc: Free arbiter on driver removal
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org, Suraj Kandpal <suraj.kandpal@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20240708125918.23573-1-nirmoy.das@intel.com>
 <Zo2LnVCi-g-JKytj@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <Zo2LnVCi-g-JKytj@intel.com>
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


On 7/9/2024 9:12 PM, Rodrigo Vivi wrote:
> On Mon, Jul 08, 2024 at 02:59:18PM +0200, Nirmoy Das wrote:
>> Free arbiter allocated in intel_hdcp_gsc_init().
>>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Thanks! Merged to  drm-xe-next


>
>> Fixes: 152f2df954d8 ("drm/xe/hdcp: Enable HDCP for XE")
>> Cc: Suraj Kandpal <suraj.kandpal@intel.com>
>> Cc: Arun R Murthy <arun.r.murthy@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/xe/display/xe_hdcp_gsc.c | 12 ++++++++----
>>   1 file changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
>> index 14b8b4278317..990285aa9b26 100644
>> --- a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
>> +++ b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
>> @@ -160,12 +160,16 @@ void intel_hdcp_gsc_fini(struct xe_device *xe)
>>   {
>>   	struct intel_hdcp_gsc_message *hdcp_message =
>>   					xe->display.hdcp.hdcp_message;
>> +	struct i915_hdcp_arbiter *arb = xe->display.hdcp.arbiter;
>>   
>> -	if (!hdcp_message)
>> -		return;
>> +	if (hdcp_message) {
>> +		xe_bo_unpin_map_no_vm(hdcp_message->hdcp_bo);
>> +		kfree(hdcp_message);
>> +		xe->display.hdcp.hdcp_message = NULL;
>> +	}
>>   
>> -	xe_bo_unpin_map_no_vm(hdcp_message->hdcp_bo);
>> -	kfree(hdcp_message);
>> +	kfree(arb);
>> +	xe->display.hdcp.arbiter = NULL;
>>   }
>>   
>>   static int xe_gsc_send_sync(struct xe_device *xe,
>> -- 
>> 2.42.0
>>
