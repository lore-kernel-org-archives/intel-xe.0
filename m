Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A29C28B20
	for <intel-xe@archiver.kernel.org>; Wed,  2 Apr 2025 15:30:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0C9410E1E7;
	Wed,  2 Apr 2025 15:30:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="LQvuWyFt";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A5D010E1E7
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Apr 2025 15:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1+H6oTShs6TFwtS5LlE4qw8edoi5GgFF8hg4nnGqm8w=; b=LQvuWyFtpOtRo4tuUZwJFw/YMb
 rJVDLikb7iHXk7cGuwTPnaFKLbxi4qYA8gtdwPaA76lSSFkVtcywf+5bEcWApOQbqluZbutq/MrBP
 b+SJ1oZuJ2RYF8/lJ8ES6Nuot0WWVEioM8CbmuaQWHdiiekj49cz0Br9a9GiIYMvcHm9VvfAz/ux2
 vxj40i4dcRDUBdfKdX/g2WBe5xBLiaPvT1Z9jccR0mI2PEnKth6k4QslBp09vnmx/A+iOXoei0ZvT
 MSxtBbBGTyfboP/j32EIi4cpBpw7LgWPIlmpvNIOLoiRs+ldC/9sizY5/zfGMmHFJcHyHQqKiIetS
 1W6OUjNQ==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1u0036-00ARAi-V6; Wed, 02 Apr 2025 17:30:41 +0200
Message-ID: <7417aea1-ced3-48ba-b128-8ab41814eeff@igalia.com>
Date: Wed, 2 Apr 2025 16:30:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/9] AuxCCS handling and render compression modifiers
To: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20250328163537.58942-1-tvrtko.ursulin@igalia.com>
 <CAJ=qYWSj2ingLCapCSrYz5OgJoP_A_SgvPMkeYH+p4jEqBhS8w@mail.gmail.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <CAJ=qYWSj2ingLCapCSrYz5OgJoP_A_SgvPMkeYH+p4jEqBhS8w@mail.gmail.com>
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


Hi Juha-Pekka,

On 02/04/2025 12:42, Juha-Pekka Heikkilä wrote:
> Hi Tvrtko,
> 
> I was going to run tests on your patches but there had just been
> changes onto emit_pipe_invalidate() exactly at place where you had
> added WA_14016712196 handling, so I didn't go figuring out what's the
> correct form. Can you do rebase and I'll see what I get with mtl.

I've rebased and split out the bad commit into many small ones so it is 
bisectable:

https://gitlab.freedesktop.org/tursulin/kernel/-/commits/adl-auxccs

I however thing the error of my ways was that I trusted MAX_JOB_SIZE_DW 
too much.

That is, when I added a new pipe control or two, I would bump it by 6 or 
12 respectively. What I did not account for that it may be wrong to 
start with. Because today I hand counted the worst case ring emission in 
__emit_job_gen12_render_compute and counted 57 dwords. While the define 
claims it is 48.

Hence I now have a first patch in the series which bumps it straight 
away to 58:

https://gitlab.freedesktop.org/tursulin/kernel/-/commit/8ce33fadee59dea5ba8272eeb0e2bf53d22fcb58

Then I bump it more as I am adding new commands.

Fingers crossed that was the bug and the only bug.

Thank you for testing!

Regards,

Tvrtko

> On Fri, Mar 28, 2025 at 6:35 PM Tvrtko Ursulin
> <tvrtko.ursulin@igalia.com> wrote:
>>
>> A series to fix and add xe support for AuxCSS framebuffers via DPT.
>>
>> Currently the auxiliary buffer data isn't mapped into the page tables at all so
>> cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if built for Xe")
>> had to disable the support.
>>
>> On top of that there are missing flushes, invalidations and similar.
>>
>> Tested with KDE Wayland, on Lenovo Carbon X1 ADL-P:
>>
>>    [PLANE:32:plane 1A]: type=PRI
>>            uapi: [FB:242] AR30 little-endian (0x30335241),0x100000000000008,2880x1800, visible=visible, src=2880.000000x1800.000000+0.000000+0.000000, dst=2880x1800+0+0, rotation=0 (0x00000001)
>>            hw: [FB:242] AR30 little-endian (0x30335241),0x100000000000008,2880x1800, visible=yes, src=2880.000000x1800.000000+0.000000+0.000000, dst=2880x1800+0+0, rotation=0 (0x00000001)
>>
>> Display working fine - no artefacts, no DMAR/PIPE faults.
>>
>> v2:
>>   * More patches added to fix kms_flip_tiling.
>>
>> v3:
>>   * Rebased after some cleanup patches from v2 were merged.
>>   * Added people to Cc as suggested by Rodrigo.
>>   * Adjusted last patch title. (Rodrigo)
>>   * Apply GGTT flushing only to iomapped system memory buffers.
>>
>> v4:
>>   * Added patch for potentially misplaced Wa_14016712196.
>>   * Fixed (hopefully) MAX_JOB_SIZE_DW on Meteorlake.
>>
>> Cc: José Roberto de Souza <jose.souza@intel.com>
>> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>> Cc: Michael J. Ruhl <michael.j.ruhl@intel.com>
>> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
>>
>> Tvrtko Ursulin (9):
>>    drm/xe/xelpg: Move Wa_14016712196 to the invalidate path
>>    drm/xe: Add ring buffer handling for AuxCCS
>>    drm/xe: Use fb cached min alignment
>>    drm/xe: Reduce DPT table alignment as in i915
>>    drm/xe: Flush GGTT writes after populating DPT
>>    drm/xe: Handle DPT in system memory
>>    drm/xe: Force flush system memory AuxCCS framebuffers before scan out
>>    drm/xe/display: Add support for AuxCCS
>>    drm/i915/display: Expose AuxCCS frame buffer modifiers for Xe
>>
>>   .../drm/i915/display/skl_universal_plane.c    |   6 -
>>   drivers/gpu/drm/xe/display/xe_fb_pin.c        | 181 +++++++++++++----
>>   .../gpu/drm/xe/instructions/xe_gpu_commands.h |   2 +
>>   .../gpu/drm/xe/instructions/xe_mi_commands.h  |   6 +
>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   1 +
>>   drivers/gpu/drm/xe/xe_bo_types.h              |  14 +-
>>   drivers/gpu/drm/xe/xe_ring_ops.c              | 190 ++++++++++--------
>>   drivers/gpu/drm/xe/xe_ring_ops_types.h        |   2 +-
>>   8 files changed, 273 insertions(+), 129 deletions(-)
>>
>> --
>> 2.48.0
>>

