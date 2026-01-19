Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7FDBD29C2D
	for <intel-xe@archiver.kernel.org>; Mon, 19 Jan 2026 13:34:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9692F10E45E;
	Mon, 19 Jan 2026 13:34:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="lyXtIdlc";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70A7F10E45E
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Jan 2026 13:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T74UgsmOi7s8QRwzwtqWj8hkGdBKN6XzqOPGTzVusbI=; b=lyXtIdlcFSbp100KBtd4pIhhj5
 KO5i+BhoEaV23z9ntr2bG/Y1BmO2Wtht8VY0XoS90ypK8gYhWhq9P0VEJOqnnb/gcQFf47zYEVlpp
 YLdb8k4EB2EvRotP7Mw+ynPykuxyVMAtrM6u26jcHH2Dr/hlHxUFy96h8Xh8V9G3qAGWue6SXaBfW
 9p42Fp3tt4oK5LY/GMZ5OaQs50ZsO2bHl/pL7M+qyAHpkbW1BqS8t7AlfhT+2CkJs47g4ujhXQq8a
 7pVavksfkgUPpGgGyxoI6B2zfEvpYbkElDvo/jdaYtAfddk2H4hWSTmmiS1LOh1Axs9WU44aUFtSm
 9ghH/o3w==;
Received: from [90.240.106.137] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vhpON-0079Ha-Jo; Mon, 19 Jan 2026 14:34:03 +0100
Message-ID: <69008123-6899-49e4-9a30-b1cbff279ee4@igalia.com>
Date: Mon, 19 Jan 2026 13:34:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/xelp: Fix Wa_18022495364
To: Matt Roper <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, stable@vger.kernel.org
References: <20260116095040.49335-1-tvrtko.ursulin@igalia.com>
 <20260116164624.GE458813@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20260116164624.GE458813@mdroper-desk1.amr.corp.intel.com>
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


On 16/01/2026 16:46, Matt Roper wrote:
> On Fri, Jan 16, 2026 at 09:50:40AM +0000, Tvrtko Ursulin wrote:
>> It looks I mistyped CS_DEBUG_MODE2 as CS_DEBUG_MODE1 when adding the
>> workaround. Fix it.
> 
> This matches the explanation of "option 1" for the workaround, but I'm
> wondering if we want/need this workaround at all.  Option 1 is to write
> the CS_DEBUG_MODE2 register (as you're doing here), but Option 2 is to
> do a constant cache invalidation (PIPE_CONTROL[DW1][Bit3]) during
> top-of-pipe invalidation and it looks like we already do that in general
> in emit_pipe_invalidate(), so it seems like we're implementing both
> options at the same time.  It looks like there's similar redundancy in
> i915 as well...
> 
> Are you seeing the programming of the correct register here actually
> change/fix anything?  If so, does just deleting the programming of the
> wrong register without programming the right one also fix the issue?

So far the off-line reports from people doing the testing appear to 
suggest this fix indeed, well, fixes it.

If that is confirmed we will need to add:

Closes: https://gitlab.freedesktop.org/mesa/mesa/-/issues/13630

As to your wider conundrum - could it be that preemption is at play? 
When done from the indirect context the workaround will trigger after 
preemption, unlike when done from emit_pipe_invalidate(). So perhaps 
"Option 1" and "Option 2" you mention miss that angle?

Regards,

Tvrtko

>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Fixes: ca33cd271ef9 ("drm/xe/xelp: Add Wa_18022495364")
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: <stable@vger.kernel.org> # v6.18+
>> ---
>>   drivers/gpu/drm/xe/xe_lrc.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>> index 70eae7d03a27..44f112df4eb2 100644
>> --- a/drivers/gpu/drm/xe/xe_lrc.c
>> +++ b/drivers/gpu/drm/xe/xe_lrc.c
>> @@ -1200,7 +1200,7 @@ static ssize_t setup_invalidate_state_cache_wa(struct xe_lrc *lrc,
>>   		return -ENOSPC;
>>   
>>   	*cmd++ = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1);
>> -	*cmd++ = CS_DEBUG_MODE1(0).addr;
>> +	*cmd++ = CS_DEBUG_MODE2(0).addr;
>>   	*cmd++ = _MASKED_BIT_ENABLE(INSTRUCTION_STATE_CACHE_INVALIDATE);
>>   
>>   	return cmd - batch;
>> -- 
>> 2.52.0
>>
> 

