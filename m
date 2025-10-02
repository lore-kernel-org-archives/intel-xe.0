Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20512CAC5B8
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 17:11:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAB9910E09C;
	Thu,  2 Oct 2025 17:11:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Pf1Is9OY";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91E8510E09C
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 17:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=n/gvBF77JNmyVfSBxZhu+NNIGn/EZL9KyDopMJhTXQg=; b=Pf1Is9OYkSOBZrQUT+ebt6jQqs
 5goiTr47Dgxh0A3GVZ6AQ+fOM1WZFlskA/JXmh0ftAKLLQFqHEcdTRaIoivaEVncwDl3+/MGl27qs
 UmRs7g4LdX4MWr4x7L4/4+AnevTyZ6ur3EMPIzAu7RaxO+XklRx/sshPMbnjFP3EgrRyi4Jj3ycR6
 cskuDC5mCnscOoiHjgu66KXo+BOMqysf/1hnA47w/5jmABRhWleWYOdD+o7N6E9NLnrl59u3Q+UzF
 Sgkg0aO4MnPxY1HYD0urDxcAtDp3pEGzo0V+WZ1SN9xPPrcyRyZy3J0AofTbs3kVk9eEXghrXql22
 L6KqF5Gg==;
Received: from [84.66.36.92] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1v4Mpf-003TQE-6S; Thu, 02 Oct 2025 19:11:07 +0200
Message-ID: <1554a41c-1a7c-4656-a07a-1f789dbab369@igalia.com>
Date: Thu, 2 Oct 2025 18:11:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [CI 00/13] CCS uncached mocs 0 test run
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20251002142453.25574-1-tvrtko.ursulin@igalia.com>
 <aN6QAvE0zQHy_1Rj@intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <aN6QAvE0zQHy_1Rj@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


On 02/10/2025 15:45, Rodrigo Vivi wrote:
> On Thu, Oct 02, 2025 at 03:24:38PM +0100, Tvrtko Ursulin wrote:
>> HW hardcodes mocs 0 for CCS?!
>>
>> Tvrtko Ursulin (13):
>>    drm/xe: Fix ggtt fb alignment
>>    drm/xe/xelpg: Flush CCS when flushing caches
>>    drm/xe/xelp: Quiesce memory traffic before invalidating AuxCCS
>>    drm/xe/xelp: Support auxccs invalidation on blitter
>>    drm/xe/xelp: Use MI_FLUSH_DW_CCS on auxccs platforms
>>    drm/xe/xelp: Wait for AuxCCS invalidation to complete
>>    drm/xe: Export xe_emit_aux_table_inv
>>    drm/xe/xelp: Add AuxCCS invalidation to the indirect context
>>      workarounds
>>    drm/xe: Flush GGTT writes after populating DPT
>>    drm/xe: Handle DPT in system memory
>>    drm/xe/display: Add support for AuxCCS
>>    mocs 0 uncached
> 
> what is this?

It was an experiment.

In another thread Ville figured out the hardware has some weird 
behaviour with CCS and how it uses MOCS indices.

First of all, it appears using 3 (UC) is somehow ignored and things 
still behave like WB. But making MOCS 0 UC (by default it is WB on ADL) 
makes using 3 (UC) much more "uncached" (for CCS).

Also, using 3 appears wrong for CCS to start with. 61 should be used and 
that then appears to potentially work even better than making 0 UC.

I say potentially because I would somehow need to do a full CI run with 
a kernel patch series and IGT patched to use MOCS 61 instead of 3 when 
rendering to frame buffer objects. So far I only have data from local 
testing which show MOCS 61 works well. Making 0 UC for me locally is 
just as good. But on the full shards run it is not 100% reliable.

Clear like the mud? :)

Regards,

Tvrtko

> 
>>    drm/i915/display: Expose AuxCCS frame buffer modifiers for Xe
>>
>>   .../drm/i915/display/skl_universal_plane.c    |   6 -
>>   drivers/gpu/drm/xe/display/xe_fb_pin.c        | 159 ++++++++---
>>   .../gpu/drm/xe/instructions/xe_gpu_commands.h |   1 +
>>   .../gpu/drm/xe/instructions/xe_mi_commands.h  |   6 +
>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   1 +
>>   drivers/gpu/drm/xe/xe_lrc.c                   |  38 +++
>>   drivers/gpu/drm/xe/xe_mocs.c                  | 247 ++++++++++--------
>>   drivers/gpu/drm/xe/xe_ring_ops.c              | 164 ++++++------
>>   drivers/gpu/drm/xe/xe_ring_ops.h              |   3 +
>>   drivers/gpu/drm/xe/xe_ring_ops_types.h        |   2 +-
>>   10 files changed, 400 insertions(+), 227 deletions(-)
>>
>> -- 
>> 2.48.0
>>

