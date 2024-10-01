Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFBF2CEB2E8
	for <intel-xe@archiver.kernel.org>; Tue,  1 Oct 2024 06:48:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A41AF10E187;
	Tue,  1 Oct 2024 06:48:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VJQ+sr2s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13D7E10E187
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Oct 2024 06:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727765324; x=1759301324;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=WpB72R7bSIuMu6Q8D92YAOzBZZMpmgmvBb5bbD9gR20=;
 b=VJQ+sr2s5klPC4/gXz+/p6xT1r/nrAisb/L+6X5KRTBTSW/IjhUlASVZ
 lJFyxAcIDZ542pI95CTU1mgB5BRADb7Z2qW8qpLddMQ9gsQIBg3TcA6Y+
 FR7q6XgEtOCG/ENyaUi4OWW21dnVQ6h1UdINXvFWKUD0+NIzp+Cyx1NCE
 htDxiHcspr1tqvuTPWgotEj+3oLpZqaz0LDKHyUdqfEN0UmhTDztB51WT
 2zkbOk4nsd0OoJCoawInCUEPe/aLEUIaWexC7LLMfmJBsklMgdlqx8A7z
 Pq/CJMAGjdBKsprFGLO8k9UI07HyAxzlvyAyZvltuKDDHLnHrzRKoTVR6 w==;
X-CSE-ConnectionGUID: 8pPYLx6RQQeQ7RJmSzeiUg==
X-CSE-MsgGUID: oq6cnd7wR+WB3SOnN/joXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="49404346"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="49404346"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 23:48:44 -0700
X-CSE-ConnectionGUID: 1LuXbCxxTReXFhi6gF8ENg==
X-CSE-MsgGUID: YUF/vYy7To6Agrl/lUystA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="111033084"
Received: from apaszkie-mobl2.apaszkie-mobl2 (HELO [10.245.245.112])
 ([10.245.245.112])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 23:48:43 -0700
Message-ID: <9b74d6f8-8da4-446b-9008-c9c14ff1dd9d@intel.com>
Date: Tue, 1 Oct 2024 07:48:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/ct: prevent UAF in send_recv()
To: "Nilawar, Badal" <badal.nilawar@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, stable@vger.kernel.org
References: <20240930122940.65850-3-matthew.auld@intel.com>
 <7759ab78-f9e3-4781-a1e1-adebaad57192@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <7759ab78-f9e3-4781-a1e1-adebaad57192@intel.com>
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

On 01/10/2024 06:22, Nilawar, Badal wrote:
> Hi Matthew,
> 
> On 30-09-2024 17:59, Matthew Auld wrote:
>> Ensure we serialize with completion side to prevent UAF with fence going
>> out of scope on the stack, since we have no clue if it will fire after
>> the timeout before we can erase from the xa. Also we have some dependent
>> loads and stores for which we need the correct ordering, and we lack the
>> needed barriers. Fix this by grabbing the ct->lock after the wait, which
>> is also held by the completion side.
>>
>> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>> Cc: <stable@vger.kernel.org> # v6.8+
>> ---
>>   drivers/gpu/drm/xe/xe_guc_ct.c | 17 ++++++++++++++++-
>>   1 file changed, 16 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c 
>> b/drivers/gpu/drm/xe/xe_guc_ct.c
>> index 4b95f75b1546..232eb69bd8e4 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -903,16 +903,26 @@ static int guc_ct_send_recv(struct xe_guc_ct 
>> *ct, const u32 *action, u32 len,
>>       }
>>       ret = wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done, HZ);
>> +
>> +    /*
>> +     * Ensure we serialize with completion side to prevent UAF with 
>> fence going out of scope on
>> +     * the stack, since we have no clue if it will fire after the 
>> timeout before we can erase
>> +     * from the xa. Also we have some dependent loads and stores 
>> below for which we need the
>> +     * correct ordering, and we lack the needed barriers.
>> +     */
> 
> Before acquiring lock it is still possible that fence will be fired. To 
> know it it would be good to print g2h_fence.done in error message below.

Ok, will add.

> 
> Regards,
> Badal
> 
>> +    mutex_lock(&ct->lock);
>>       if (!ret) {
>>           xe_gt_err(gt, "Timed out wait for G2H, fence %u, action %04x",
>>                 g2h_fence.seqno, action[0]);
>>           xa_erase_irq(&ct->fence_lookup, g2h_fence.seqno);
>> +        mutex_unlock(&ct->lock);
>>           return -ETIME;
>>       }
>>       if (g2h_fence.retry) {
>>           xe_gt_dbg(gt, "H2G action %#x retrying: reason %#x\n",
>>                 action[0], g2h_fence.reason);
>> +        mutex_unlock(&ct->lock);
>>           goto retry;
>>       }
>>       if (g2h_fence.fail) {
>> @@ -921,7 +931,12 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, 
>> const u32 *action, u32 len,
>>           ret = -EIO;
>>       }
>> -    return ret > 0 ? response_buffer ? g2h_fence.response_len : 
>> g2h_fence.response_data : ret;
>> +    if (ret > 0)
>> +        ret = response_buffer ? g2h_fence.response_len : 
>> g2h_fence.response_data;
>> +
>> +    mutex_unlock(&ct->lock);
>> +
>> +    return ret;
>>   }
>>   /**
> 
