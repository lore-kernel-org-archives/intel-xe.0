Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C97B4D36122
	for <intel-xe@archiver.kernel.org>; Tue,  5 Nov 2024 20:01:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75DBB10E424;
	Tue,  5 Nov 2024 20:01:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cTkmNE2o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CAE910E424
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Nov 2024 20:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730836916; x=1762372916;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Kbz+64ww4auJ3y1GGCJJ/pvH4HWnoJvfFp4orsRHDJw=;
 b=cTkmNE2opG69dxfEiTolsJNLJzQN6W4zd1PHmNAy8k2A6gAo1CEPRcqX
 38g5Ft8f6iSu+POlooX8ntQ0kTqILIIlFlPgPFKCsksg8r0W7tv6y79kB
 Dd36+RfWqorFwhh2XpcjyFMG9qiOQpQzwS7YAy+sIw9LBy5NXYG7MSOMv
 6ayxzUvHCGE9hjzdHUnX8H1prJmXuIGDf3Jn7pJP46JP7+NIc74Xc9Vob
 Qb9oQuNwmBwtRc5EFo7JSYuO4UJYqKxMc3wzgIOVcEjH+jeUW1pOE5+MJ
 V86lIQ0uhqVySe1S5oqRunlak1+Rn7BgzS4PT0sr9CTxop6nAGY3LcLaw g==;
X-CSE-ConnectionGUID: wKlSxpZbTUeC/ZeTLfR8fQ==
X-CSE-MsgGUID: aFJaR4zpTUKVrYCIcy0c4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53177234"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="53177234"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 12:01:56 -0800
X-CSE-ConnectionGUID: EzVHaBDxSLm6NZDwYH/aVw==
X-CSE-MsgGUID: efskn9wkQWeqE2mMFWrRVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; d="scan'208";a="88649305"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa005.fm.intel.com with ESMTP; 05 Nov 2024 12:01:55 -0800
Received: from [10.245.120.199] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.120.199])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 542CF312D4;
 Tue,  5 Nov 2024 20:01:53 +0000 (GMT)
Message-ID: <18db27f8-8fe0-45ff-828e-87843f2f21be@intel.com>
Date: Tue, 5 Nov 2024 21:01:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/xe/guc: Don't read data from G2H prior to length
 check
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20241105173032.1947-1-michal.wajdeczko@intel.com>
 <20241105173032.1947-4-michal.wajdeczko@intel.com>
 <ZypzyPc1W/BX9ESg@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <ZypzyPc1W/BX9ESg@lstrano-desk.jf.intel.com>
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



On 05.11.2024 20:36, Matthew Brost wrote:
> On Tue, Nov 05, 2024 at 06:30:31PM +0100, Michal Wajdeczko wrote:
>> While highly unlikely, incoming G2H message might be too short
>> so we shouldn't read any data from it prior to checking a length.
>>
> 
> Is this really needed though? The *msg is a per CT member:
> 
> xe_guc_ct_types.h
> 
> 147         /** @msg: Message buffer */
> 148         u32 msg[GUC_CTB_MSG_MAX_LEN];
> 149         /** @fast_msg: Message buffer */
> 150         u32 fast_msg[GUC_CTB_MSG_MAX_LEN];
> 
> 
> I suppose this good practice but this is not an actual problem though, right?

it's not a problem in sense that it will not crash per today's
implementation, hence no Fixes: tag, but if that CT implementation would
change in the future then per function signature agreement it will be
the GuC submit code fault to read outside provided message len.

note that since we are provided with len and msg we shouldn't make any
further assumptions about implementation, as otherwise it would be
sufficient to access message directly using already provided guc:

	msg = guc->ct.msg;

> 
> Matt 
> 
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_guc_submit.c | 18 +++++++++++++-----
>>  1 file changed, 13 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index 4481890be941..147000fd1177 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -1885,12 +1885,14 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
>>  int xe_guc_sched_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
>>  {
>>  	struct xe_exec_queue *q;
>> -	u32 guc_id = msg[0];
>> -	u32 runnable_state = msg[1];
>> +	u32 guc_id, runnable_state;
>>  
>>  	if (unlikely(len < 2))
>>  		return -EPROTO;
>>  
>> +	guc_id = msg[0];
>> +	runnable_state = msg[1];
>> +
>>  	q = g2h_exec_queue_lookup(guc, guc_id);
>>  	if (unlikely(!q))
>>  		return -EPROTO;
>> @@ -1924,11 +1926,13 @@ static void handle_deregister_done(struct xe_guc *guc, struct xe_exec_queue *q)
>>  int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
>>  {
>>  	struct xe_exec_queue *q;
>> -	u32 guc_id = msg[0];
>> +	u32 guc_id;
>>  
>>  	if (unlikely(len < 1))
>>  		return -EPROTO;
>>  
>> +	guc_id = msg[0];
>> +
>>  	q = g2h_exec_queue_lookup(guc, guc_id);
>>  	if (unlikely(!q))
>>  		return -EPROTO;
>> @@ -1950,11 +1954,13 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
>>  {
>>  	struct xe_gt *gt = guc_to_gt(guc);
>>  	struct xe_exec_queue *q;
>> -	u32 guc_id = msg[0];
>> +	u32 guc_id;
>>  
>>  	if (unlikely(len < 1))
>>  		return -EPROTO;
>>  
>> +	guc_id = msg[0];
>> +
>>  	q = g2h_exec_queue_lookup(guc, guc_id);
>>  	if (unlikely(!q))
>>  		return -EPROTO;
>> @@ -2010,11 +2016,13 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>>  {
>>  	struct xe_gt *gt = guc_to_gt(guc);
>>  	struct xe_exec_queue *q;
>> -	u32 guc_id = msg[0];
>> +	u32 guc_id;
>>  
>>  	if (unlikely(len < 1))
>>  		return -EPROTO;
>>  
>> +	guc_id = msg[0];
>> +
>>  	q = g2h_exec_queue_lookup(guc, guc_id);
>>  	if (unlikely(!q))
>>  		return -EPROTO;
>> -- 
>> 2.43.0
>>

