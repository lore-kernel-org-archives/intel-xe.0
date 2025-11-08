Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00FF2CCFA1A
	for <intel-xe@archiver.kernel.org>; Sat,  8 Nov 2025 07:40:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BC5110E09A;
	Sat,  8 Nov 2025 07:40:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="f3DqREQC";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52E2110E09A
 for <intel-xe@lists.freedesktop.org>; Sat,  8 Nov 2025 07:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1762587618;
 bh=crK0/63Ab3p44lO3J0xjIdWwIphVbo9BjJvI/T/0fHA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=f3DqREQCEtu2uBp+dCT7F0xMVJW7GU6CerkNOPzw+gwypYJ4Q1iymribtENF/Tu2B
 M6vmmObwyYHb4NqOkG5IJoAAFh7FRITxbhNfPSuWGpcrx2QdaEJM/KRTpMVYJewd0O
 vLGVTxr54ILdEXK7TOn19fYx/WBDZ2hXkw4dntc1t6HJTppFvMdsLMMYX97CEKxL0E
 05YgB3Yzci8VpTlfVOsUdcMCT74JUIW8/ic2fjyT5QMR0wxSUQgVbSWUDHDralMO6D
 Go2c02mo3DQiJFFtXx2Ol6+Rotw1e5AJN2ilHnswxt7grZl0WEVKM+sorvx7EgwjuX
 WhZvEJWyQTY2w==
Message-ID: <3cdfe321-0cf2-4992-9163-f227581ef1a6@lankhorst.se>
Date: Sat, 8 Nov 2025 08:40:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [FOR-CI 01/10] drm/i915/display: Make get_vblank_counter use
 intel_de_read_fw()
To: Matt Roper <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20251107193946.1075137-1-dev@lankhorst.se>
 <20251107193946.1075137-2-dev@lankhorst.se>
 <20251107204300.GJ3905809@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <20251107204300.GJ3905809@mdroper-desk1.amr.corp.intel.com>
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

Hey,

Den 2025-11-07 kl. 21:43, skrev Matt Roper:
> On Fri, Nov 07, 2025 at 08:39:36PM +0100, Maarten Lankhorst wrote:
>> Fixes the following lockdep splat on PREEMPT_RT:
>> <3> BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48
>> <3> in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 1373, name: xe_module_load
>> <3> preempt_count: 1, expected: 0
>> <3> RCU nest depth: 0, expected: 0
>> <4> 11 locks held by xe_module_load/1373:
>> <4>  #0: ffff888107b691a0 (&dev->mutex){....}-{3:3}, at: __driver_attach+0x104/0x220
>> <4>  #1: ffff88813cd30280 (&dev->clientlist_mutex){+.+.}-{3:3}, at: drm_client_register+0x32/0xe0
>> <4>  #2: ffffffff837f88f8 (registration_lock){+.+.}-{3:3}, at: register_framebuffer+0x1b/0x50
>> <4>  #3: ffffffff835985e0 (console_lock){+.+.}-{0:0}, at: fbcon_fb_registered+0x6f/0x90
>> <4>  #4: ffff88812589e6a0 (&helper->lock){+.+.}-{3:3}, at: __drm_fb_helper_restore_fbdev_mode_unlocked+0x7b/0x110
>> <4>  #5: ffff88813cd30158 (&dev->master_mutex){+.+.}-{3:3}, at: drm_master_internal_acquire+0x20/0x50
>> <4>  #6: ffff88812589e488 (&client->modeset_mutex){+.+.}-{3:3}, at: drm_client_modeset_commit_locked+0x2a/0x1b0
>> <4>  #7: ffffc9000031eef0 (crtc_ww_class_acquire){+.+.}-{0:0}, at: drm_client_modeset_commit_atomic+0x4c/0x2b0
>> <4>  #8: ffffc9000031ef18 (crtc_ww_class_mutex){+.+.}-{3:3}, at: drm_client_modeset_commit_atomic+0x4c/0x2b0
>> <4>  #9: ffff888114f7b8b8 (&intel_dp->psr.lock){+.+.}-{3:3}, at: intel_psr_lock+0xc5/0xf0 [xe]
>> <4>  #10: ffff88812a0cbbc0 (&wl->lock){+.+.}-{2:2}, at: intel_dmc_wl_get+0x3c/0x140 [xe]
>>
>> This splat will happen otherwise on all tracepoints too, for similar reasons.
> 
> Drive-by comment, but this isn't really a proper fix, right?  Using the
> *_fw register access variants means that (among other things) the call
> doesn't acquire uncore->lock.  On some older i915 platforms,
> simultaneous register access from two different threads would hang the
> system.  The uncore spinlock ensures that register accesses are always
> serialized so that we can't trigger those crashes (the uncore spinlock
> also protects other stuff like forcewake handling, but that's not
> relevant here).  If we use the "_fw" variant of register access, we're
> removing the protection and allowing register accesses to race again if
> we aren't already holding the lock explicitly at a higher level of the
> code.  I'm not sure exactly which platform(s) had the problems with
> simultaneous register access; it isn't a concern for newer platforms so
> Xe doesn't need to worry about it, only i915.
> 
> PREEMPT_RT creates a huge mess because it silently changes spinlock_t
> from a real spinlock into a into a sleeping mutex, and that means it
> can't be used anywhere that sleeping is disallowed.  Since regular
> register reads/writes require spinlock protection in i915, that also
> means that we suddenly can't perform regular register reads/writes in
> those areas either.
> 
> I guess a real fix would be to convert uncore->lock into a
> raw_spinlock_t which is still a "real" spinlock, even with PREEMPT.
I think you misunderstand the fix.

Vblank evasion flow:
 - spin_lock(uncore->lock);
 - local_irq_disable();
 - while (in_vblank()) {
	local_irq_enable();
	spin_unlock();

	/* Wait for vblank completion */

	spin_lock();
	irq_disable();
 - }

 - /* vblank evasion programming */

 - local_irq_enable();
 - spin_unlock(uncore->lock);

The other timing sensitive call:

i915_get_crtc_scanoutpos()
  - intel_vblank_section_enter()
      spin_lock(uncore->lock);
  - preempt_disable();

  (do magic stuff)

  - preempt_enable();
  - intel_vblank_section_enter()
      spin_unlock(uncore->lock);


Using raw_spin_lock would just mean adding more contention. And still deadlock when using the _fw calls..

> 
> 
> Matt
> 
>>
>> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
>> ---
>>  drivers/gpu/drm/i915/display/intel_vblank.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_vblank.c b/drivers/gpu/drm/i915/display/intel_vblank.c
>> index 671f357c65638..2b106ffa3f5f5 100644
>> --- a/drivers/gpu/drm/i915/display/intel_vblank.c
>> +++ b/drivers/gpu/drm/i915/display/intel_vblank.c
>> @@ -133,7 +133,7 @@ u32 g4x_get_vblank_counter(struct drm_crtc *crtc)
>>  	if (!vblank->max_vblank_count)
>>  		return 0;
>>  
>> -	return intel_de_read(display, PIPE_FRMCOUNT_G4X(display, pipe));
>> +	return intel_de_read_fw(display, PIPE_FRMCOUNT_G4X(display, pipe));
>>  }
>>  
>>  static u32 intel_crtc_scanlines_since_frame_timestamp(struct intel_crtc *crtc)
>> -- 
>> 2.51.0
>>
> 

