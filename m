Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D8E5C7EE23
	for <intel-xe@archiver.kernel.org>; Tue, 23 May 2023 13:13:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1808910E030;
	Tue, 23 May 2023 13:13:42 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF90310E030
 for <intel-xe@lists.freedesktop.org>; Tue, 23 May 2023 13:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684847619; x=1716383619;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=fXc1xeMYhEGyQcdSwrxgnx+MSu89o7PG5+BoPpSfFlE=;
 b=ibuPm0CNjNjUwujdtBLD2RBQ/SsbW8rrOeq0DaIUQRjHS0sCYxVlbTDa
 J2F2x4C5dZqYhVdjjMnTqpJeyXnqMXvtkkC9oDcFYuEDJKyGUy0KZtwov
 s82DLtxoR4Njqk8FY8du+VvjlJXDC+9KisZWpW9GndnSVb9uKdCrPhxm7
 RG1XrXBIIDdhn01xFBGV8zQ1xOc9wpjFAAUAAI85XacQPL+Ea4w690ojX
 qylq5jBPRXjCdnOvpiH+9JPXx912euRJCVt0MfDB6VMLZGQRCLjcd0Bia
 +mo8drufVNjYsxdeWAPpdtLOYC+B6wdxO/M4hTr41dSSG31T2JXv8ani2 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="333594582"
X-IronPort-AV: E=Sophos;i="6.00,186,1681196400"; d="scan'208";a="333594582"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2023 06:13:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="950533765"
X-IronPort-AV: E=Sophos;i="6.00,186,1681196400"; d="scan'208";a="950533765"
Received: from eakeogh-mobl1.ger.corp.intel.com (HELO [10.252.0.142])
 ([10.252.0.142])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2023 06:13:31 -0700
Message-ID: <12d07bb7-1f99-7d32-035a-c800afde8782@intel.com>
Date: Tue, 23 May 2023 14:13:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Content-Language: en-GB
To: Rodrigo Vivi <rodrigo.vivi@kernel.org>
References: <20230523094727.162266-1-matthew.auld@intel.com>
 <20230523094727.162266-4-matthew.auld@intel.com>
 <ZGy6hq9YtcOqsCga@rdvivi-mobl4>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <ZGy6hq9YtcOqsCga@rdvivi-mobl4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH v9 4/8] drm/xe: tweak lock ordering for
 freq_lock
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 23/05/2023 14:07, Rodrigo Vivi wrote:
> On Tue, May 23, 2023 at 10:47:23AM +0100, Matthew Auld wrote:
>> Lockdep spits out:
>>
>> Possible unsafe locking scenario:
>>     CPU0				CPU1
>>     ----				----
>>     lock(&xe->mem_access.lock);
>> 				lock(&pc->freq_lock);
>> 				lock(&xe->mem_access.lock);
>>     lock(&pc->freq_lock);
>>
>> It looks like we already mostly take care to ensure that the mem_access
>> ref is taken outside of taking freq_lock, since that is also grabbed
>> from the runtime_pm callbacks, except for a couple of spots in
>> xe_guc_pc and guc_ct_send_recv(). But tt looks like all the callers are
>> already holding the mem_access.ref, so just switch over to use
>> guc_ct_send_locked().
>>
>> v2:
>>   - There are few more cases it seems.
> 
> should we do this to all the ct_send? and kill this function in favor
> of the locked one?

Yeah, my new thinking is that everything calling ct_send or similar 
needs to already be holding the mem_access.ref i.e we drop the 
mem_access_get() and just keep the assert. But need to check all the 
callers...


> 
> or how we can be sure that we are done with all the cases?
> 
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_ct.c | 4 +++-
>>   drivers/gpu/drm/xe/xe_guc_pc.c | 8 ++++++--
>>   2 files changed, 9 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>> index 9dc906f2651a..7a8c9d6a03f3 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -689,7 +689,9 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>   retry:
>>   	g2h_fence_init(&g2h_fence, response_buffer);
>>   retry_same_fence:
>> -	ret = guc_ct_send(ct, action, len, 0, 0, &g2h_fence);
>> +	mutex_lock(&ct->lock);
>> +	ret = guc_ct_send_locked(ct, action, len, 0, 0, &g2h_fence);
>> +	mutex_unlock(&ct->lock);
>>   	if (unlikely(ret == -ENOMEM)) {
>>   		void *ptr;
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
>> index e799faa1c6b8..3b56e57d29af 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -225,7 +225,9 @@ static int pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value)
>>   	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
>>   		return -EAGAIN;
>>   
>> -	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
>> +	mutex_lock(&ct->lock);
>> +	ret = xe_guc_ct_send_locked(ct, action, ARRAY_SIZE(action), 0, 0);
>> +	mutex_unlock(&ct->lock);
>>   	if (ret)
>>   		drm_err(&pc_to_xe(pc)->drm, "GuC PC set param failed: %pe",
>>   			ERR_PTR(ret));
>> @@ -242,7 +244,9 @@ static int pc_action_setup_gucrc(struct xe_guc_pc *pc, u32 mode)
>>   	};
>>   	int ret;
>>   
>> -	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
>> +	mutex_lock(&ct->lock);
>> +	ret = xe_guc_ct_send_locked(ct, action, ARRAY_SIZE(action), 0, 0);
>> +	mutex_unlock(&ct->lock);
>>   	if (ret)
>>   		drm_err(&pc_to_xe(pc)->drm, "GuC RC enable failed: %pe",
>>   			ERR_PTR(ret));
>> -- 
>> 2.40.1
>>
