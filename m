Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C18C8302D
	for <intel-xe@archiver.kernel.org>; Mon, 30 Jun 2025 12:43:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49D1410E440;
	Mon, 30 Jun 2025 12:43:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="C/QxFthI";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88BAC10E437
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Jun 2025 12:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XrnxDOc70n46cafx4Mb9CP0YMvzQYk2yYg+s0DMSUX4=; b=C/QxFthIDOZC2lmmvumZoXr65A
 o8Fn09Gl508pmIM9Ko6I6/6euemJRSHPJAXP0g2RMq48JQZM7Ox4nbNPEatORt4UpHkvD1D4Rbf2K
 c/jy8gjd8w3wBNvt5hQLVj8luWTTv6ZWsZYCyNyXTuhNv0vigYAQMbEeI2WSykrDkzV59nQJQMBUb
 wzKAjLFDutLCqBOT+0+/AinedA+Il0R8sR0gIQool+GDBL0isOBSfYR74QuI05u2BPgCpu/t3Jxst
 nsLcbSGWZ2s6ZAgdVudHq24HYk7IDHHFdzV0XfeJIkPcRCd+iaEPeC2GiZLKVk2D5y/n+TiyfpkVL
 b87WQNrA==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uWDqo-00ATZt-Le; Mon, 30 Jun 2025 14:43:10 +0200
Message-ID: <bdcc81af-4eba-4129-a945-e45a71f79285@igalia.com>
Date: Mon, 30 Jun 2025 13:43:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 11/24] drm/xe: Flush L3 when flushing render cache
To: "Souza, Jose" <jose.souza@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Cc: "kernel-dev@igalia.com" <kernel-dev@igalia.com>
References: <20250627133340.54603-1-tvrtko.ursulin@igalia.com>
 <20250627133340.54603-12-tvrtko.ursulin@igalia.com>
 <371c413dbaeb584cf56264bd7d1d44d0ca284ec5.camel@intel.com>
 <3bbea88dc4e95e6e976f0143a38ae40b813a9728.camel@intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <3bbea88dc4e95e6e976f0143a38ae40b813a9728.camel@intel.com>
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


On 27/06/2025 19:57, Souza, Jose wrote:
> On Fri, 2025-06-27 at 11:23 -0700, José Roberto de Souza wrote:
>> On Fri, 2025-06-27 at 14:33 +0100, Tvrtko Ursulin wrote:
>>> I915 sets PIPE_CONTROL_FLUSH_L3 (bit 27) when flushing render caches but
>>> interesting thing is Tigerlake PRM lists that bit as reserved.
>>>
>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>> ---
>>> Is xe missing this? Or has this been wrong for so long in i915? Or is this
>>> an undocumented bit?
>>> ---
>>>   drivers/gpu/drm/xe/instructions/xe_gpu_commands.h |  1 +
>>>   drivers/gpu/drm/xe/xe_ring_ops.c                  | 10 ++++++++++
>>>   2 files changed, 11 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
>>> index 78c0e87dbd37..27892984403c 100644
>>> --- a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
>>> +++ b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
>>> @@ -47,6 +47,7 @@
>>>   
>>>   #define   PIPE_CONTROL_COMMAND_CACHE_INVALIDATE		(1<<29)
>>>   #define   PIPE_CONTROL_TILE_CACHE_FLUSH			(1<<28)
>>> +#define   PIPE_CONTROL_FLUSH_L3                         (1<<27)
>>
>> On spec this bit is Protected Memory Disable. I think what you want is bit 30.
> 
> That is also wrong on i915 oO.

Yeah, most of the series is me copying "reference" implementation from i915.

But you are right, bit 27 appears wrong, and the history of the whole 
area is a bit confusing.

The existing PIPE_CONTROL_FLUSH_L3 definition was added back in 2015 in:

0160f055393f ("drm/i915/gen8: Add WaClearSlmSpaceAtContextSwitch 
workaround")

But if I look at the public PRMs for BDW and CHV bit 27 is reserved MBZ. 
Bit 30 is the same. Was it something undocumented? I don't know.

Furthermore, the public PRM has no mention of 
WaClearSlmSpaceAtContextSwitch. It has this 
WaFlushCoherentL3CacheLinesAtContextSwitch which is not quite the thing:

"""
Coherent L3 cache lines are not getting flushed during context switch 
which is causing
issues like corruption. Need to set bit 21 of MMIO b118, then send PC 
with DC flush and
then reset bit 21 of MMIO b118. This programming sequence needs to be 
part of the indirect
context WA BB.
"""

This WA was later extnded to KBL:

066d46288851 ("drm/i915/kbl: Add WaClearSlmSpaceAtContextSwitch")

But KBL public PRM is the same - I don't see any WA which mention SLM or 
bit 30. And bits 27 and 30 are still reserved.

There is a new bit 26 (Flush LLC) on SKL and KBL but we do not use it or 
define it.

That also feels odd.

And finally L3 flushing was added to the plain ring programming in:

0c7c0c8e6f09 ("drm/i915/gen12: Flush L3")

As you discovered this is most likely wrong since bspec say bit 30 on 
TGL is L3 Fabric Flush.

So more questions than answers and it looks access to internal docs will 
be required to get to the bottom of it all.

> Will give some testing here and submit a i915 patch.

I at least tried changing it to bit 30 on ADL but that on it's own 
appeared to make no positive improvement to the transient cache dirt in 
some AuxCCS IGTs. It still requires the large hammer of "drm/xe: Force 
flush system memory AuxCCS framebuffers before scan out".

I am curious to what your testing will show with the use cases you have 
in mind.

Regards,

Tvrtko

>>
>>>   #define   PIPE_CONTROL_AMFS_FLUSH			(1<<25)
>>>   #define   PIPE_CONTROL_GLOBAL_GTT_IVB			(1<<24)
>>>   #define   PIPE_CONTROL_LRI_POST_SYNC			BIT(23)
>>> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
>>> index a1289f086191..8f655b6fe913 100644
>>> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
>>> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
>>> @@ -197,6 +197,16 @@ static int emit_render_cache_flush(struct xe_sched_job *job, u32 *dw, int i)
>>>   	if (XE_WA(gt, 1409600907))
>>>   		flags |= PIPE_CONTROL_DEPTH_STALL;
>>>   
>>> +	/*
>>> +	 * L3 fabric flush is needed for AUX CCS invalidation
>>> +	 * which happens as part of pipe-control so we can
>>> +	 * ignore PIPE_CONTROL_FLUSH_L3. Also PIPE_CONTROL_FLUSH_L3
>>> +	 * deals with Protected Memory which is not needed for
>>> +	 * AUX CCS invalidation and lead to unwanted side effects.
>>> +	 */
>>> +	if (GRAPHICS_VERx100(xe) < 1270)
>>> +		flags |= PIPE_CONTROL_FLUSH_L3;
>>> +
>>>   	if (lacks_render)
>>>   		flags &= ~PIPE_CONTROL_3D_ARCH_FLAGS;
>>>   	else if (job->q->class == XE_ENGINE_CLASS_COMPUTE)

