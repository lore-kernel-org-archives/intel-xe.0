Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06AF3C3600B
	for <intel-xe@archiver.kernel.org>; Thu, 27 Mar 2025 13:25:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A612810E0DA;
	Thu, 27 Mar 2025 13:25:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="WuDEof5M";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1117210E0DA
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Mar 2025 13:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2GSq/+H2Iyn/W3YQpdK/jLkuSiV8Osbggvjd1kps93g=; b=WuDEof5MXsKc3J9/DuY7KoU08t
 +sVu7NZkjhWrKUobi46Ga9MvUze/LBx6yLfwNOuHZCX3OgBNakn0BR99xVg4coWeDwbk2xyxgfiyb
 o3egv6E4bn293pNyJomTK3RaMbm2zXK7qmM7FMtI+s6wflaww19HeFpCd56bj/7KtENEnu1mOMf4f
 3Z34mUYWQ9vepCT3DepEB+C9xWNG6o2vNbYyMvAfEzvcrP/JbT25pRl+cK70N58eGFJ6k41zfY7rN
 qpGTFA5vKPPZaxuJan8FJ3PBisbr4bsB8i01XqQkgYBU+kamIV+pZwe6/uuTmvrK0usfkUXaifAg4
 LhM6euIw==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1txnEj-007Enl-L3; Thu, 27 Mar 2025 14:25:33 +0100
Message-ID: <490c1c4f-a1e6-4075-b30a-2d3a2a0b3df7@igalia.com>
Date: Thu, 27 Mar 2025 13:25:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/8] AuxCCS handling and render compression modifiers
To: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20250318162224.78846-1-tvrtko.ursulin@igalia.com>
 <CAJ=qYWR-OqU+RKSFic6OH-eRSzKLGDwR2GJxRjQSYv_ED=c9eA@mail.gmail.com>
 <6be0c617-49b7-44d5-9b75-e0a21703ac9c@igalia.com>
 <CAJ=qYWQmh_4TMONXA2pfC0RfDtcOu3r3P250dkn2Dey5wVBS2Q@mail.gmail.com>
 <CAJ=qYWRUzgyP2+Smj6p_RKfKkGzdnhs11YQG8Hs2+0Q8JNfNVg@mail.gmail.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <CAJ=qYWRUzgyP2+Smj6p_RKfKkGzdnhs11YQG8Hs2+0Q8JNfNVg@mail.gmail.com>
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


Hi,

On 25/03/2025 17:39, Juha-Pekka Heikkilä wrote:
> First patch that freezes mtl for me is
> 
> Author: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Date:   Tue Mar 18 16:22:16 2025 +0000
> 
>      drm/xe: Add ring buffer handling for AuxCCS
> 
>      Align the ring buffer handling of required AuxCCS flushes and
>      invalidations with the reference implementation from i915.
> 
>      Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> 
> 
> If it's of any use, last messages I saw on dmesg are
> 
> [  +0,004882] xe 0000:00:02.0: [drm:xe_guc_capture_steered_list_init
> [xe]] GT0: capture found 48 ext-regs.
> [  +0,021150] xe 0000:00:02.0: [drm:xe_guc_ads_populate [xe]] GT0: ADS
> capture alloc size changed from 45056 to 20480
> [  +0,000765] xe 0000:00:02.0: [drm:__xe_guc_upload [xe]] GT0: load
> still in progress, timeouts = 0, freq = 2250MHz (req 2250MHz), status
> = 0x00000072 [0x39/00]
> [  +0,005246] xe 0000:00:02.0: [drm:__xe_guc_upload [xe]] GT0: load
> still in progress, timeouts = 0, freq = 2250MHz (req 2250MHz), status
> = 0x80000534 [0x1A/05]
> [  +0,001414] xe 0000:00:02.0: [drm:__xe_guc_upload [xe]] GT0: init
> took 6ms, freq = 2250MHz (req = 2250MHz), before = 2250MHz, status =
> 0x8002F034, timeouts = 0
> [  +0,000282] xe 0000:00:02.0: [drm:xe_guc_ct_enable [xe]] GT0: GuC CT
> communication channel enabled
> [  +0,000973] xe 0000:00:02.0: [drm:xe_gt_record_default_lrcs [xe]]
> GT0: LRC WA rcs0 save-restore batch
> [  +0,000075] xe 0000:00:02.0: [drm:xe_gt_record_default_lrcs [xe]]
> GT0: REG[0x7004] = 0x08000800
> [  +0,000070] xe 0000:00:02.0: [drm:xe_gt_record_default_lrcs [xe]]
> GT0: REG[0x7044] = 0x00200020

It could be the very first job submission.

I had another round of cross checking things and found two more 
differences against what i915 does on Meteorlake.

First one is that Wa 14016712196 is applied before pipe control 
invalidate and flush. Xe only has it before flush.

Other is PIPE_CONTROL_CCS_FLUSH is set on flushes.

I cannot test it but if you could, the patch below at least compiles.

Regards,

Tvrtko

diff --git a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h 
b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
index 93e4687feb71..38d723e47a04 100644
--- a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
+++ b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
@@ -42,6 +42,7 @@
  #define GFX_OP_PIPE_CONTROL(len)	((0x3<<29)|(0x3<<27)|(0x2<<24)|((len)-2))

  #define	  PIPE_CONTROL0_HDC_PIPELINE_FLUSH		BIT(9)	/* gen12 */
+#define   PIPE_CONTROL0_CCS_FLUSH                       BIT(13) /* MTL+ */

  #define   PIPE_CONTROL_COMMAND_CACHE_INVALIDATE		(1<<29)
  #define   PIPE_CONTROL_TILE_CACHE_FLUSH			(1<<28)
diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c 
b/drivers/gpu/drm/xe/xe_ring_ops.c
index a380964f3166..02b09826f831 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -141,8 +141,9 @@ emit_pipe_control(u32 *dw, int i, u32 bit_group_0, 
u32 bit_group_1, u32 offset,
  	return i;
  }

-static int emit_pipe_invalidate(u32 mask_flags, bool invalidate_tlb, 
u32 *dw,
-				int i)
+static int
+emit_pipe_invalidate(struct xe_gt *gt, u32 mask_flags, bool invalidate_tlb,
+		     u32 *dw, int i)
  {
  	u32 flags = PIPE_CONTROL_CS_STALL |
  		PIPE_CONTROL_COMMAND_CACHE_INVALIDATE |
@@ -159,6 +160,10 @@ static int emit_pipe_invalidate(u32 mask_flags, 
bool invalidate_tlb, u32 *dw,

  	flags &= ~mask_flags;

+	if (XE_WA(gt, 14016712196))
+		i = emit_pipe_control(dw, i, 0, PIPE_CONTROL_DEPTH_CACHE_FLUSH,
+				      LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR, 0);
+
  	return emit_pipe_control(dw, i, 0, flags, 
LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR, 0);
  }

@@ -180,12 +185,16 @@ static int emit_render_cache_flush(struct 
xe_sched_job *job, bool flush_l3,
  	struct xe_gt *gt = job->q->gt;
  	struct xe_device *xe = gt_to_xe(gt);
  	bool lacks_render = !(gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK);
+	u32 bit_group_0 = PIPE_CONTROL0_HDC_PIPELINE_FLUSH;
  	u32 flags;

  	if (XE_WA(gt, 14016712196))
  		i = emit_pipe_control(dw, i, 0, PIPE_CONTROL_DEPTH_CACHE_FLUSH,
  				      LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR, 0);

+	if (GRAPHICS_VERx100(xe) >= 1270)
+		bit_group_0 |= PIPE_CONTROL0_CCS_FLUSH;
+
  	flags = (PIPE_CONTROL_CS_STALL |
  		 PIPE_CONTROL_TILE_CACHE_FLUSH |
  		 PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH |
@@ -211,7 +220,7 @@ static int emit_render_cache_flush(struct 
xe_sched_job *job, bool flush_l3,
  	else if (job->q->class == XE_ENGINE_CLASS_COMPUTE)
  		flags &= ~PIPE_CONTROL_3D_ENGINE_FLAGS;

-	return emit_pipe_control(dw, i, PIPE_CONTROL0_HDC_PIPELINE_FLUSH, 
flags, 0, 0);
+	return emit_pipe_control(dw, i, bit_group_0, flags, 0, 0);
  }

  static int emit_pipe_control_to_ring_end(struct xe_hw_engine *hwe, u32 
*dw, int i)
@@ -363,7 +372,7 @@ static void __emit_job_gen12_render_compute(struct 
xe_sched_job *job,
  		mask_flags = PIPE_CONTROL_3D_ENGINE_FLAGS;

  	/* See __xe_pt_bind_vma() for a discussion on TLB invalidations. */
-	i = emit_pipe_invalidate(mask_flags, invalidate_tlb, dw, i);
+	i = emit_pipe_invalidate(gt, mask_flags, invalidate_tlb, dw, i);

  	/* hsdes: 1809175790 */
  	if (aux_ccs)


> 
> /Juha-Pekka
> 
> On Thu, Mar 20, 2025 at 7:11 PM Juha-Pekka Heikkilä
> <juhapekka.heikkila@gmail.com> wrote:
>>
>> I'll try to find some moment to do bisecting, probably will be next week when I get to do this.
>>
>> /Juha-Pekka
>>
>> to 20. maalisk. 2025 klo 10.25 Tvrtko Ursulin <tvrtko.ursulin@igalia.com> kirjoitti:
>>>
>>>
>>> Hi,
>>>
>>> On 19/03/2025 13:41, Juha-Pekka Heikkilä wrote:
>>>> Hi Tvrtko,
>>>>
>>>> I did quick run with these patches. With these changes on top of
>>>> today's drm-tip I got a complete system freeze on mtl and its variants
>>>> when do modprobe. I had kgdb enabled but I wasn't even thrown there,
>>>> the machine went completely unresponsive. On 3/3 tries modprobe xe
>>>> always completely froze the box.
>>>
>>> I don't have MTL to try and neither apparently does CI, which otherwise
>>> seems happy, as is my ADL-P laptop.
>>>
>>> Would you have time to bisect? Or maybe netconsole to see what explodes?
>>>
>>> Not much comes to mind looking at the patches.. Maybe something runs to
>>> early before something else is initialised. Guessing only.
>>>
>>> Regards,
>>>
>>> Tvrtko
>>>
>>>> On Tue, Mar 18, 2025 at 6:22 PM Tvrtko Ursulin
>>>> <tvrtko.ursulin@igalia.com> wrote:
>>>>>
>>>>> A series to fix and add xe support for AuxCSS framebuffers via DPT.
>>>>>
>>>>> Currently the auxiliary buffer data isn't mapped into the page tables at all so
>>>>> cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if built for Xe")
>>>>> had to disable the support.
>>>>>
>>>>> On top of that there are missing flushes and invalidations both from the ring
>>>>> buffer side and from the CPU side.
>>>>>
>>>>> Tested with KDE Wayland, on Lenovo Carbon X1 ADL-P:
>>>>>
>>>>>     [PLANE:32:plane 1A]: type=PRI
>>>>>             uapi: [FB:242] AR30 little-endian (0x30335241),0x100000000000008,2880x1800, visible=visible, src=2880.000000x1800.000000+0.000000+0.000000, dst=2880x1800+0+0, rotation=0 (0x00000001)
>>>>>             hw: [FB:242] AR30 little-endian (0x30335241),0x100000000000008,2880x1800, visible=yes, src=2880.000000x1800.000000+0.000000+0.000000, dst=2880x1800+0+0, rotation=0 (0x00000001)
>>>>>
>>>>> Display seems working fine - no artefacts, no DMAR/PIPE faults. CI also appears
>>>>> to be happy with v2.
>>>>>
>>>>> v2:
>>>>>    * More patches added to fix kms_flip_tiling.
>>>>>
>>>>> v3:
>>>>>    * Rebased after some cleanup patches from v2 were merged.
>>>>>    * Added people to Cc as suggested by Rodrigo.
>>>>>    * Adjusted last patch title. (Rodrigo)
>>>>>    * Apply GGTT flushing only to iomapped system memory buffers.
>>>>>
>>>>> Cc: José Roberto de Souza <jose.souza@intel.com>
>>>>> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>>>>> Cc: Michael J. Ruhl <michael.j.ruhl@intel.com>
>>>>> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
>>>>>
>>>>> Tvrtko Ursulin (8):
>>>>>     drm/xe: Add ring buffer handling for AuxCCS
>>>>>     drm/xe: Use fb cached min alignment
>>>>>     drm/xe: Reduce DPT table alignment as in i915
>>>>>     drm/xe: Flush GGTT writes after populating DPT
>>>>>     drm/xe: Handle DPT in system memory
>>>>>     drm/xe: Force flush system memory AuxCCS framebuffers before scan out
>>>>>     drm/xe/display: Add support for AuxCCS
>>>>>     drm/i915/display: Expose AuxCCS frame buffer modifiers for Xe
>>>>>
>>>>>    .../drm/i915/display/skl_universal_plane.c    |   6 -
>>>>>    drivers/gpu/drm/xe/display/xe_fb_pin.c        | 181 ++++++++++++++----
>>>>>    .../gpu/drm/xe/instructions/xe_gpu_commands.h |   1 +
>>>>>    .../gpu/drm/xe/instructions/xe_mi_commands.h  |   6 +
>>>>>    drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   1 +
>>>>>    drivers/gpu/drm/xe/xe_bo_types.h              |  14 +-
>>>>>    drivers/gpu/drm/xe/xe_ring_ops.c              | 173 +++++++++--------
>>>>>    drivers/gpu/drm/xe/xe_ring_ops_types.h        |   2 +-
>>>>>    8 files changed, 261 insertions(+), 123 deletions(-)
>>>>>
>>>>> --
>>>>> 2.48.0
>>>>>
>>>

