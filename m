Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05856FEC0F7
	for <intel-xe@archiver.kernel.org>; Tue, 24 Mar 2026 18:53:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F79F10E62A;
	Tue, 24 Mar 2026 18:53:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Vr3QAB3u";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56E5110E62A
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Mar 2026 18:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VMLqQoydRXNkRJh5/f47NfGAMiO5E1nbaMwkvkjoDdE=; b=Vr3QAB3uRWI9D1zD7IBs4TSsVd
 IxbMeC+TQEPp28BW7ubUMvTcltwfx2tiAbwPokYPPnVY+pP1Hoz3m/WAy0GSunP7awq6Mrtm+eMuF
 0ROi3nBwuSVBsRB8nA77+nOH7Y0GfWjqtLw6jJH0QsHdLxj/+DCev/H3Cobr8Spoa21HJ9uj0x/Oy
 /XhCi/Ne47q8nGRP46Tz3ov1jDyK2wUxGriWjswlqSWqZz4q0NL/xKRByNTM/qvFSROVdZ/+lqKE7
 foosMGFRMLO0IfA4fDQuoabX6Nz2rcMi2yVjuLwIX7KHkggcOyL9aDWsmhtCa3wRRZsA5nhTFUPKt
 ttMzt75A==;
Received: from [90.240.106.137] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1w56sM-005Thw-Vr; Tue, 24 Mar 2026 19:53:15 +0100
Message-ID: <1e161599-28e4-4844-be38-72a5d84beb17@igalia.com>
Date: Tue, 24 Mar 2026 18:53:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v25 00/12] AuxCCS handling and render compression modifiers
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com,
 Uma Shankar <uma.shankar@intel.com>
References: <20260324084018.20353-1-tvrtko.ursulin@igalia.com>
 <acKSNLF8z3Q7mpmY@intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <acKSNLF8z3Q7mpmY@intel.com>
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


On 24/03/2026 13:31, Rodrigo Vivi wrote:
> On Tue, Mar 24, 2026 at 08:40:06AM +0000, Tvrtko Ursulin wrote:
>> A series to add support for compressed surface scanout under xe with
>> Alderlake-P.
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
>> All IGTs pass for me locally.
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
>> v5:
>>   * Split out ring emission changes to smaller patches.
>>   * Fixed MAX_JOB_SIZE_DW even more.
>>   * Don't emit MI_FLUSH_DW_CCS on !BCS. This should fix Meteorlake.
>>
>>   v6:
>>   * Added AuxCCS invalidation to indirect context workarounds.
>>   * Also added the indirect context handling and some other workarounds. They are
>>     unrelated but the series depends on it.
>>   * Dropped DPT pin alignment reduction since BMG appears not to be liking it for
>>     some reason.
>>
>> v7:
>>   * Rebased on top of recent xe_fb_pin.c refactoring and also the indirect
>>     context workarounds series.
>>
>> v8:
>>   * Rebased for bo->size removal.
>>   * Corrected PIPE_CONTROL_FLUSH_L3 to bit 30. (Jose)
>>
>> v9:
>>   * Fixed fb remapping changes.
>>   * Dropped two not required patches from the series.
>>   * Fixed criteria for GGTT flushing.
>>   * Limit clflush to the compression metadata area.
>>   * Rebased for indirect context workarounds landing upstream.
>>
>> v10:
>>   * Rebase for XE_GT_WA().
>>
>> v11:
>>   * Do not use stolen for DPT on IGFX + AuxCCS.
>>
>> v12:
>>   * Rebased for some ringbuf and LRC code changes.
>>
>> v13:
>>   * Rebased for various upstream changes.
>>   * Dropped clflush and stolen avoidance patches after merging IGT MOCS 61 usage.
>>
>>   v14:
>>   * MMIO 0x4248 and MI_FLUSH_DW_CCS are MTL+. (Matt)
>>   * Consolidate engine feature checks. (Ville)
>>   * Brought back the patch to put DPT tables in system memory for 100% CI pass
>>     rate. It looks like MOCS 61 is not enough to avoid sporadic pipecrc
>>     mismatches.
>>
>> v15:
>>   * Limited to enabling on Alderlake-P only. (Dropped all Meteorlake patches.)
>>   * Dropped unrelated GGTT alignment fix. (Sent standalone.)
>>   * Use display parent interface for probing AuxCCS driver support.
>>
>> v16:
>>   * Use write-combine for DPT in stolen memory. (Ville)
>>   * Dropped clflush patches under assumption pre-production ADL machine were the
>>     reason for sporadic pipecrc failures.
>>
>> v17:
>>   * Mechanical rebase for upstream conflicts.
>>
>> v18:
>>   * Added a patch to rename XE_BO_FLAG_SCANOUT to XE_BO_FLAG_FORCE_WC. (Rodrigo)
>>   * Instead of exporting a helper function for emitting the aux invalidation
>>     into the ring, add it to the ring ops vfunc table. (Matthew)
>>
>> v19:
>>   * Tweaked comments and removed some stray hunks from v17.
>>
>> v20:
>>   * Include <linux/types.h> for u32.
>>
>> v21:
>>   * Forward declare struct xe_gt to fix standalone headers test.
>>
>> v22:
>>   * Split up "drm/xe/display: Add support for AuxCCS" into four patches for
>>     easier review.
>>
>> v23:
>>   * Fixed rebase error made in v22 when splitting up the patches.
>>
>> v24:
>>   * Fixed flag confusion in "drm/xe: Rename XE_BO_FLAG_SCANOUT to XE_BO_FLAG_FORCE_WC".
>>   * Applied r-b's.
>>
>> v25:
>>   * Rebased for upstream conflict and tidied some checkpatch warnings added in
>>     the patch split.
> 
> Pushed to drm-xe-next. Thank you so much for the work and patience.

Thank you and all who helped with reviews! And now fingers crossed there 
are no serious regressions.

Regards,

Tvrtko

>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>
>> Tvrtko Ursulin (12):
>>    drm/xe: Rename XE_BO_FLAG_SCANOUT to XE_BO_FLAG_FORCE_WC
>>    drm/xe: Use write-combine mapping when populating DPT
>>    drm/xe/xelpg: Limit AuxCCS ring buffer programming to Alderlake
>>    drm/xe/xelp: Quiesce memory traffic before invalidating AuxCCS
>>    drm/xe/xelp: Wait for AuxCCS invalidation to complete
>>    drm/xe: Move aux table invalidation to ring ops
>>    drm/xe/xelp: Add AuxCCS invalidation to the indirect context
>>      workarounds
>>    drm/xe/display: Move remapped plane loop out of __xe_pin_fb_vma_dpt
>>    drm/xe/display: Change write_dpt_remapped_tiled function signature
>>    drm/xe/display: Respect remapped plane alignment
>>    drm/xe/display: Add support for AuxCCS
>>    drm/xe/xelp: Expose AuxCCS frame buffer modifiers on Alderlake-P
>>
>>   drivers/gpu/drm/xe/display/intel_fbdev_fb.c   |  12 +-
>>   drivers/gpu/drm/xe/display/xe_display.c       |   8 ++
>>   drivers/gpu/drm/xe/display/xe_display_bo.c    |   6 +-
>>   drivers/gpu/drm/xe/display/xe_dsb_buffer.c    |   4 +-
>>   drivers/gpu/drm/xe/display/xe_fb_pin.c        | 116 +++++++++++++-----
>>   drivers/gpu/drm/xe/display/xe_initial_plane.c |   2 +-
>>   .../gpu/drm/xe/instructions/xe_mi_commands.h  |   6 +
>>   drivers/gpu/drm/xe/xe_bo.c                    |  17 +--
>>   drivers/gpu/drm/xe/xe_bo.h                    |   2 +-
>>   drivers/gpu/drm/xe/xe_lrc.c                   |  23 ++++
>>   drivers/gpu/drm/xe/xe_ring_ops.c              | 106 ++++++++++++----
>>   drivers/gpu/drm/xe/xe_ring_ops_types.h        |   8 +-
>>   12 files changed, 238 insertions(+), 72 deletions(-)
>>
>> -- 
>> 2.52.0
>>

