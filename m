Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9904C83F1A
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 19:46:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FCE510E233;
	Thu, 10 Jul 2025 19:46:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fHw/y8Gk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51CD310E233
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 19:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752176787; x=1783712787;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Uqscgt4/l2xHueIUYvG43nVxe3Rmz6nPt0spcGS4kWI=;
 b=fHw/y8Gk0k930X4jTQMmcmYTfIGlPJyK53evP6x41OLE5k2kjop4P+BQ
 U2188PkmD+p1nivQP3mYOsCMSUmULoDQOB0NYlsKFiijeHemANCk0aZTC
 b+BT2SZDTUU84+8sGJ9jony+DgSfbMpQlGofxPBtam9ABwFhlwAhlD+lc
 tbmvFwwTe0k0m4wC4nUP9sA+T3czXeSRVgkFHjl9c34O7Go6+3SZoN6YL
 MZ1uVd/5oPBggVI2P8ZsEFcbZn0yOmQsCrLbyaHYsak45nH/1oUoN/AZw
 00mGad9ftP2G1Zj+hLn4zx22hA9gHnDGM+8SagUJQMR0FE94or9WhTjDM w==;
X-CSE-ConnectionGUID: IFyuBqvHR+6VTB9xaW1W7A==
X-CSE-MsgGUID: r+wishZ/THKg4lpf/qmsVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="72052776"
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="72052776"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 12:46:26 -0700
X-CSE-ConnectionGUID: jZ0/TJQzSoW8ooHcVn4PYA==
X-CSE-MsgGUID: sL1TRoUPRGih/hkatmHLZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="156733711"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa008.fm.intel.com with ESMTP; 10 Jul 2025 12:46:24 -0700
Received: from [10.245.84.121] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.84.121])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 899CF332A8;
 Thu, 10 Jul 2025 20:46:23 +0100 (IST)
Message-ID: <3bc652b8-0169-4f8c-8ac4-2b0e55893cdf@intel.com>
Date: Thu, 10 Jul 2025 21:46:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe/guc: Cancel ongoing H2G requests when stopping
 CT
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Cc: "Brost, Matthew" <matthew.brost@intel.com>
References: <20250709174038.1876-1-michal.wajdeczko@intel.com>
 <20250709174038.1876-4-michal.wajdeczko@intel.com>
 <CH0PR11MB5444F7EFE57232CCBFEDD0C3E549A@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <CH0PR11MB5444F7EFE57232CCBFEDD0C3E549A@CH0PR11MB5444.namprd11.prod.outlook.com>
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



On 09.07.2025 21:07, Cavitt, Jonathan wrote:
> 
>>
>> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Michal Wajdeczko
> Sent: Wednesday, July 9, 2025 10:41 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Brost, Matthew <matthew.brost@intel.com>
> Subject: [PATCH 3/3] drm/xe/guc: Cancel ongoing H2G requests when stopping CT
>>
>> Once we have started a GT reset sequence, which includes stopping
>> GuC CTB communication, we should also cancel all onging H2G send-
>> recv requests, as either GuC is already dead, or due to imminent
>> reset GuC will not be able to reply, or due to internal cleanup
>> we will loose pending fences. With this we will report dedicated
>> -ECANCELED error instead of misleading -ETIME.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
> 
> s/onging/ongoing
> s/loose/lose
> 
> And also, are we certain that reporting -ECANCELED here won't result
> in some test failure due to expecting -ETIME in this failure case?  

I don't think there are any tests that would rely on the specific error
code to be seen during reset, and even if there is one, it should be
modified to expect -ECANCELED since this is what we already use to
report broken attempts to send H2G when we are in STOPPED state

> I'd
> not expect so, but I'd like to be certain before proceeding.

and as expected, CI didn't catch anything ;)

> Otherwise, though:
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> -Jonathan Cavitt

thanks

> 
>> ---
>>  drivers/gpu/drm/xe/xe_guc_ct.c | 24 ++++++++++++++++++++++++
>>  1 file changed, 24 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>> index 17e5870baf33..b6acccfcd351 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -85,6 +85,7 @@ struct g2h_fence {
>>  	u16 error;
>>  	u16 hint;
>>  	u16 reason;
>> +	bool cancel;
>>  	bool retry;
>>  	bool fail;
>>  	bool done;
>> @@ -103,6 +104,13 @@ static void g2h_fence_init(struct g2h_fence *g2h_fence, u32 *response_buffer)
>>  	g2h_fence->seqno = ~0x0;
>>  }
>>  
>> +static void g2h_fence_cancel(struct g2h_fence *g2h_fence)
>> +{
>> +	g2h_fence->cancel = true;
>> +	g2h_fence->fail = true;
>> +	g2h_fence->done = true;
>> +}
>> +
>>  static bool g2h_fence_needs_alloc(struct g2h_fence *g2h_fence)
>>  {
>>  	return g2h_fence->seqno == ~0x0;
>> @@ -388,6 +396,8 @@ static void guc_ct_change_state(struct xe_guc_ct *ct,
>>  				enum xe_guc_ct_state state)
>>  {
>>  	struct xe_gt *gt = ct_to_gt(ct);
>> +	struct g2h_fence *g2h_fence;
>> +	unsigned long idx;
>>  
>>  	mutex_lock(&ct->lock);		/* Serialise dequeue_one_g2h() */
>>  	spin_lock_irq(&ct->fast_lock);	/* Serialise CT fast-path */
>> @@ -406,6 +416,14 @@ static void guc_ct_change_state(struct xe_guc_ct *ct,
>>  
>>  	spin_unlock_irq(&ct->fast_lock);
>>  
>> +	/* cancel all in-flight send-recv requests */
>> +	xa_for_each(&ct->fence_lookup, idx, g2h_fence)
>> +		g2h_fence_cancel(g2h_fence);
>> +
>> +	/* make sure guc_ct_send_recv() will see g2h_fence changes */
>> +	smp_mb();
>> +	wake_up_all(&ct->g2h_fence_wq);
>> +
>>  	/*
>>  	 * Lockdep doesn't like this under the fast lock and he destroy only
>>  	 * needs to be serialized with the send path which ct lock provides.
>> @@ -1098,6 +1116,11 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>  		goto retry;
>>  	}
>>  	if (g2h_fence.fail) {
>> +		if (g2h_fence.cancel) {
>> +			xe_gt_dbg(gt, "H2G request %#x canceled!\n", action[0]);
>> +			ret = -ECANCELED;
>> +			goto unlock;
>> +		}
>>  		xe_gt_err(gt, "H2G request %#x failed: error %#x hint %#x\n",
>>  			  action[0], g2h_fence.error, g2h_fence.hint);
>>  		ret = -EIO;
>> @@ -1106,6 +1129,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>  	if (ret > 0)
>>  		ret = response_buffer ? g2h_fence.response_len : g2h_fence.response_data;
>>  
>> +unlock:
>>  	mutex_unlock(&ct->lock);
>>  
>>  	return ret;
>> -- 
>> 2.47.1
>>
>>

