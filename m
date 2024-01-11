Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C928C47077
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jan 2024 09:44:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A07310E8C0;
	Thu, 11 Jan 2024 09:44:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A401410E8C0
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jan 2024 09:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704966263; x=1736502263;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=OH4BeRfW8zRsrBJYCWWBhsQi+X8l9ga4AXLAX3Wuyxk=;
 b=LzaTxYzVzGYt0BHrHKSrTtuJ6owpamkRvZgnIITNuMWbJLM+u23hat5h
 obptV5vY7PX5+/IlwmGXUvSvr4TqhU2IMq+PDZh9iAIwftpEPPajeZPfx
 4knzGmMrCg3ZrlUi8BRV1eDfKRRBF9LcuP+gKSvygZodAhT2YyObYUql4
 72h0hMaL77qfFHaNgi1V4o5jFmhdlw2NigPfQ2llW5YaDVjeB2xXkqxqm
 xooDKcr8XkCn2R0z0MVV6kTSIVxqeQ9uIdXSsGWTZQwuje2Ck3Ezgjrdd
 DOkfSpwBc67fk60YwlmE3ElvBXGKC4UKs+aN25h4S8Nm8TowVgtN4Z55p g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="17397098"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; d="scan'208";a="17397098"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 01:44:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="732166297"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; d="scan'208";a="732166297"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orsmga003.jf.intel.com with ESMTP; 11 Jan 2024 01:44:19 -0800
Received: from [10.249.150.229] (unknown [10.249.150.229])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id B4AF740DFF;
 Thu, 11 Jan 2024 09:44:13 +0000 (GMT)
Message-ID: <0e721f1e-abcd-4d56-b544-5cf11b11c0bd@intel.com>
Date: Thu, 11 Jan 2024 10:44:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/guc: Use HXG definitions on HXG messages
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>
References: <20240110195951.453-1-michal.wajdeczko@intel.com>
 <ZZ8i5fdH/cplEAQ8@DUT025-TGLU.fm.intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <ZZ8i5fdH/cplEAQ8@DUT025-TGLU.fm.intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 11.01.2024 00:06, Matthew Brost wrote:
> On Wed, Jan 10, 2024 at 08:59:50PM +0100, Michal Wajdeczko wrote:
>> While parsing and processing CTB G2H messages we should extract
>> underlying HXG message and use HXG definitions on such message.
>> Using outer CTB layer message in HXG definitions require use of
>> shifted dword index, which might be confusing:
>>
>> 	FIELD_GET(GUC_HXG_MSG_0_xxx, msg[1])
>>
>> instead of:
>>
>> 	FIELD_GET(GUC_HXG_MSG_0_xxx, hxg[0])
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_guc_ct.c | 72 +++++++++++++++++++++-------------
>>  1 file changed, 44 insertions(+), 28 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>> index c29f095aa1b9..d6b7020a2d2f 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -796,9 +796,20 @@ int xe_guc_ct_send_recv_no_fail(struct xe_guc_ct *ct, const u32 *action,
>>  	return guc_ct_send_recv(ct, action, len, response_buffer, true);
>>  }
>>  
>> +static u32 *msg_to_hxg(u32 *msg)
>> +{
>> +	return msg + GUC_CTB_MSG_MIN_LEN;
>> +}
>> +
>> +static u32 msg_len_to_hxg(u32 len)
> 
> msg_len_to_hxg_len?

ok

> 
>> +{
>> +	return len - GUC_CTB_MSG_MIN_LEN;
>> +}
>> +
>>  static int parse_g2h_event(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>  {
>> -	u32 action = FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, msg[1]);
>> +	u32 *hxg = msg_to_hxg(msg);
>> +	u32 action = FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, hxg[0]);
>>  
>>  	lockdep_assert_held(&ct->lock);
>>  
>> @@ -817,9 +828,10 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>  {
>>  	struct xe_gt *gt =  ct_to_gt(ct);
>>  	struct xe_device *xe = gt_to_xe(gt);
>> -	u32 response_len = len - GUC_CTB_MSG_MIN_LEN;
>> +	const u32 *hxg = msg_to_hxg(msg);
> 
> Some places do:
> const u32 *hxg = msg_to_hxg(msg);
> 
> Others do:
> u32 *hxg = msg_to_hxg(msg);
> 
> I do not see any reason why we have 2 different conventions.

I was trying to add constness concept of parsed/processed HXG message,
but since it wasn't done correctly for passed CTB message arguments I
gave up, missed to cleanup this one leftover

will drop const for now

> 
> Everything else LGTM.
> 
> Matt
> 
>> +	u32 hxg_len = msg_len_to_hxg(len);
>>  	u32 fence = FIELD_GET(GUC_CTB_MSG_0_FENCE, msg[0]);
>> -	u32 type = FIELD_GET(GUC_HXG_MSG_0_TYPE, msg[1]);
>> +	u32 type = FIELD_GET(GUC_HXG_MSG_0_TYPE, hxg[0]);
>>  	struct g2h_fence *g2h_fence;
>>  
>>  	lockdep_assert_held(&ct->lock);
>> @@ -836,8 +848,8 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>  		if (type == GUC_HXG_TYPE_RESPONSE_FAILURE)
>>  			xe_gt_err(gt, "FAST_REQ H2G fence 0x%x failed! e=0x%x, h=%u\n",
>>  				  fence,
>> -				  FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, msg[1]),
>> -				  FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, msg[1]));
>> +				  FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, hxg[0]),
>> +				  FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, hxg[0]));
>>  		else
>>  			xe_gt_err(gt, "unexpected response %u for FAST_REQ H2G fence 0x%x!\n",
>>  				  type, fence);
>> @@ -857,18 +869,14 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>  
>>  	if (type == GUC_HXG_TYPE_RESPONSE_FAILURE) {
>>  		g2h_fence->fail = true;
>> -		g2h_fence->error =
>> -			FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, msg[1]);
>> -		g2h_fence->hint =
>> -			FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, msg[1]);
>> +		g2h_fence->error = FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, hxg[0]);
>> +		g2h_fence->hint = FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, hxg[0]);
>>  	} else if (type == GUC_HXG_TYPE_NO_RESPONSE_RETRY) {
>>  		g2h_fence->retry = true;
>> -		g2h_fence->reason =
>> -			FIELD_GET(GUC_HXG_RETRY_MSG_0_REASON, msg[1]);
>> +		g2h_fence->reason = FIELD_GET(GUC_HXG_RETRY_MSG_0_REASON, hxg[0]);
>>  	} else if (g2h_fence->response_buffer) {
>> -		g2h_fence->response_len = response_len;
>> -		memcpy(g2h_fence->response_buffer, msg + GUC_CTB_MSG_MIN_LEN,
>> -		       response_len * sizeof(u32));
>> +		g2h_fence->response_len = hxg_len;
>> +		memcpy(g2h_fence->response_buffer, hxg, hxg_len * sizeof(u32));
>>  	}
>>  
>>  	g2h_release_space(ct, GUC_CTB_HXG_MSG_MAX_LEN);
>> @@ -884,14 +892,13 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>  static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>  {
>>  	struct xe_device *xe = ct_to_xe(ct);
>> -	u32 hxg, origin, type;
>> +	const u32 *hxg = msg_to_hxg(msg);
>> +	u32 origin, type;
>>  	int ret;
>>  
>>  	lockdep_assert_held(&ct->lock);
>>  
>> -	hxg = msg[1];
>> -
>> -	origin = FIELD_GET(GUC_HXG_MSG_0_ORIGIN, hxg);
>> +	origin = FIELD_GET(GUC_HXG_MSG_0_ORIGIN, hxg[0]);
>>  	if (unlikely(origin != GUC_HXG_ORIGIN_GUC)) {
>>  		drm_err(&xe->drm,
>>  			"G2H channel broken on read, origin=%d, reset required\n",
>> @@ -901,7 +908,7 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>  		return -EPROTO;
>>  	}
>>  
>> -	type = FIELD_GET(GUC_HXG_MSG_0_TYPE, hxg);
>> +	type = FIELD_GET(GUC_HXG_MSG_0_TYPE, hxg[0]);
>>  	switch (type) {
>>  	case GUC_HXG_TYPE_EVENT:
>>  		ret = parse_g2h_event(ct, msg, len);
>> @@ -927,14 +934,19 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>  {
>>  	struct xe_device *xe = ct_to_xe(ct);
>>  	struct xe_guc *guc = ct_to_guc(ct);
>> -	u32 action = FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, msg[1]);
>> -	u32 *payload = msg + GUC_CTB_HXG_MSG_MIN_LEN;
>> -	u32 adj_len = len - GUC_CTB_HXG_MSG_MIN_LEN;
>> +	u32 hxg_len = msg_len_to_hxg(len);
>> +	u32 *hxg = msg_to_hxg(msg);
>> +	u32 action, adj_len;
>> +	u32 *payload;
>>  	int ret = 0;
>>  
>> -	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, msg[1]) != GUC_HXG_TYPE_EVENT)
>> +	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, hxg[0]) != GUC_HXG_TYPE_EVENT)
>>  		return 0;
>>  
>> +	action = FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, hxg[0]);
>> +	payload = hxg + GUC_HXG_EVENT_MSG_MIN_LEN;
>> +	adj_len = hxg_len - GUC_HXG_EVENT_MSG_MIN_LEN;
>> +
>>  	switch (action) {
>>  	case XE_GUC_ACTION_SCHED_CONTEXT_MODE_DONE:
>>  		ret = xe_guc_sched_done_handler(guc, payload, adj_len);
>> @@ -995,6 +1007,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>>  	u32 tail, head, len;
>>  	s32 avail;
>>  	u32 action;
>> +	u32 *hxg;
>>  
>>  	lockdep_assert_held(&ct->fast_lock);
>>  
>> @@ -1045,10 +1058,11 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>>  				   avail * sizeof(u32));
>>  	}
>>  
>> -	action = FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, msg[1]);
>> +	hxg = msg_to_hxg(msg);
>> +	action = FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, hxg[0]);
>>  
>>  	if (fast_path) {
>> -		if (FIELD_GET(GUC_HXG_MSG_0_TYPE, msg[1]) != GUC_HXG_TYPE_EVENT)
>> +		if (FIELD_GET(GUC_HXG_MSG_0_TYPE, hxg[0]) != GUC_HXG_TYPE_EVENT)
>>  			return 0;
>>  
>>  		switch (action) {
>> @@ -1074,9 +1088,11 @@ static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>  {
>>  	struct xe_device *xe = ct_to_xe(ct);
>>  	struct xe_guc *guc = ct_to_guc(ct);
>> -	u32 action = FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, msg[1]);
>> -	u32 *payload = msg + GUC_CTB_HXG_MSG_MIN_LEN;
>> -	u32 adj_len = len - GUC_CTB_HXG_MSG_MIN_LEN;
>> +	u32 hxg_len = msg_len_to_hxg(len);
>> +	u32 *hxg = msg_to_hxg(msg);
>> +	u32 action = FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, hxg[0]);
>> +	u32 *payload = hxg + GUC_HXG_MSG_MIN_LEN;
>> +	u32 adj_len = hxg_len - GUC_HXG_MSG_MIN_LEN;
>>  	int ret = 0;
>>  
>>  	switch (action) {
>>
>> base-commit: bb9e8031d2feb59becdea41e54e62f1bc47f3ef9
>> -- 
>> 2.25.1
>>
