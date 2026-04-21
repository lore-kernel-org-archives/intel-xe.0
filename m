Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27A40F8FA90
	for <intel-xe@archiver.kernel.org>; Tue, 21 Apr 2026 15:09:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D529210EB50;
	Tue, 21 Apr 2026 15:09:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="lLCeCYep";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2922110EB50
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Apr 2026 15:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=p9B8Qt2oRG8/qwzcjUyXCkccz6Xb3kE22c28rGUWAX0=; b=lLCeCYepiC9Efkman12VwmXSW0
 x3P3YGXdlD/rujFEULwvfJT87unW5GAwPDGZRxpMlT52lrSsyi6caIyTkBY3S6xYi+vMK2oZ8y9Yy
 j2Qzbf+eunMzMIkFXjo2KGrTLxy0/yxAXdwcDqdIVARhZ7pijX7fwovmUXrCglXkbJJrU8qwVclvH
 SozRnnB+FIitDJUbbZeA73II6eanbJSqmLwS0rWBsfMy7wczNGv4ZxS6/miczGwROxbjwjWjW9PCe
 7f2AP1JDu830JZL4Uycmt3hjT0trN4R2C+T6AbI1TzBBzF64J5BwG9e3JufURVJs2kXnJ1M5cMyHK
 HgJkAznQ==;
Received: from [90.240.106.137] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1wFCj8-001yGK-JM; Tue, 21 Apr 2026 17:09:26 +0200
Message-ID: <866fe0f9-73a6-47b3-ac37-41bb26c0c6a6@igalia.com>
Date: Tue, 21 Apr 2026 16:09:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/xelp: Fix Wa_18022495364
To: Matt Roper <matthew.d.roper@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, stable@vger.kernel.org
References: <20260420131603.70357-1-tvrtko.ursulin@igalia.com>
 <384adac7-2aa4-4568-b7a5-987e914fbaf2@ursulin.net>
 <20260420202932.GH7476@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20260420202932.GH7476@mdroper-desk1.amr.corp.intel.com>
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


On 20/04/2026 21:29, Matt Roper wrote:
> On Mon, Apr 20, 2026 at 02:24:05PM +0100, Tvrtko Ursulin wrote:
>>
>> On 20/04/2026 14:16, Tvrtko Ursulin wrote:
>>> Command parser relative MMIO addressing needs to be enabled when writing
>>> to the register.
>>>
>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>> Fixes: ca33cd271ef9 ("drm/xe/xelp: Add Wa_18022495364")
>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Cc: <stable@vger.kernel.org> # v6.18+
> 
> I don't think we want/need the stable Cc here; this workaround doesn't
> apply to any of the Xe2 and later platforms that the Xe driver supports
> for users.  While it's possible for developers to manually override the
> driver's detection flags and force it to load on Xe1-era platforms that
> this workaround does apply to, doing so will taint the kernel and we
> already know that a lot of Xe1 era workarounds aren't implemented.

You are right, I just blindly copied the output of dim fixes. But it 
doesn't matter hugely either way since as long as there is Fixes: it 
would get picked up for -stable anyway.

> 
>>> ---
>>>    drivers/gpu/drm/xe/xe_lrc.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>>> index 9d12a0d2f0b5..c725cde4508d 100644
>>> --- a/drivers/gpu/drm/xe/xe_lrc.c
>>> +++ b/drivers/gpu/drm/xe/xe_lrc.c
>>> @@ -1214,7 +1214,7 @@ static ssize_t setup_invalidate_state_cache_wa(struct xe_lrc *lrc,
>>>    	if (xe_gt_WARN_ON(lrc->gt, max_len < 3))
>>>    		return -ENOSPC;
>>> -	*cmd++ = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1);
>>> +	*cmd++ = MI_LOAD_REGISTER_IMM | MI_LRI_LRM_CS_MMIO | MI_LRI_NUM_REGS(1);
>>
>> Or if this register exists only for RCS would it be better to define
>> CS_DEBUG_MODE2 as the absolute 0x20d8 (as in i915)? Unfortunately the public
>> TGL PRM does not list neither the register or the workaround so I am not
>> sure.
> 
> CS_DEBUG_MODE2 exists on both the RCS and CCS engines, so I think the
> current register definition is fine.
> 
> Personally I might have changed the line farther down to
> CS_DEBUG_MODE2(hwe->mmio_base) so that we're using an absolute offset
> instead of relative, but adding the MI_LRI_LRM_CS_MMIO flag and passing
> the relative offset should work fine too.

Good to know, thanks! I am happy to change to absolute if you prefer.
  > Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

Thank you!

I assume someone will pull the patch in?

Regards,

Tvrtko


