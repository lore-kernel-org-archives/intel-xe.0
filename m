Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF621EE499D
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 12:18:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A5B910E9F1;
	Wed, 11 Sep 2024 12:18:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZEiLAeE5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C43C10E995
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Sep 2024 12:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726057099; x=1757593099;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=Vc6GL0ReYK76DN7u+TyjM/GHAqsGXcOPqj3jK3KWSO8=;
 b=ZEiLAeE5wk57mI2R7Zf2kj7VTZjcSr/Knt8AU/MJ5+FaKwUNrZAIuyfx
 Bl1fps3aGJEEO4z9zVxQBnruXK296tE2hOhsdwEz1t9wSY1XqteM1ZzNJ
 Pk6Oxhj4LbXTHmYKTnZqKcGgucYLRspZ6V0kUCHym27L/hvgPzccfeEqc
 Ig+E1BNrSwdVzYD3lhm0NJ6frNNvP2KhDrHf75+N1KHqzfsZv9XZDz0V6
 6v82Lm5NCniGVB5VMBLyyRSmo1iO4faYe4kIabcHCUZfHEESjMV7HYVWp
 sRohaZwn7lUng1U+XQ/tH2oSuZWIwHKM6dsvbehyp+HGW9C1HGlKmYdud g==;
X-CSE-ConnectionGUID: M5Vh5qGZR9mlo8/dQVm5Hw==
X-CSE-MsgGUID: MjDcVoOxReG9erwhL1AAKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="36233718"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="36233718"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 05:05:31 -0700
X-CSE-ConnectionGUID: l3ZaTkRDSVW5SCp4NleYLg==
X-CSE-MsgGUID: 48py8poiQm+ICeTxAU2+rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="67403374"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 05:05:30 -0700
Date: Wed, 11 Sep 2024 15:05:54 +0300
From: Imre Deak <imre.deak@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Shankar, Uma" <uma.shankar@intel.com>
Subject: Re: [PATCH] drm/xe/pm: Move xe_rpm_lockmap_acquire
Message-ID: <ZuGHotS095lXkdBF@ideak-desk.fi.intel.com>
References: <20240911093026.643605-1-suraj.kandpal@intel.com>
 <ZuGAXqmtrLOnjAGs@ideak-desk.fi.intel.com>
 <SN7PR11MB6750912B7086DD851CB8CC07E39B2@SN7PR11MB6750.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SN7PR11MB6750912B7086DD851CB8CC07E39B2@SN7PR11MB6750.namprd11.prod.outlook.com>
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
Reply-To: imre.deak@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Sep 11, 2024 at 03:01:17PM +0300, Kandpal, Suraj wrote:
> 
> 
> > -----Original Message-----
> > From: Deak, Imre <imre.deak@intel.com>
> > Sent: Wednesday, September 11, 2024 5:05 PM
> > To: Kandpal, Suraj <suraj.kandpal@intel.com>
> > Cc: intel-xe@lists.freedesktop.org; Shankar, Uma <uma.shankar@intel.com>
> > Subject: Re: [PATCH] drm/xe/pm: Move xe_rpm_lockmap_acquire
> >
> > On Wed, Sep 11, 2024 at 03:00:25PM +0530, Suraj Kandpal wrote:
> > > Move xe_rpm_lockmap_acquire after display_pm_suspend and resume
> > > funtions to avoid cirular locking dependency because of locks being
> > > taken in intel_fbdev, intel_dp_mst_mgr suspend and resume functions.
> > >
> > > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> >
> > The actual problem is that MST is being suspended during runtime suspend. This
> > is not required (adding only unnecessary overhead) but also incorrect as it
> > involves AUX transfers which itself depends on the device being runtime
> > resumed. This is what lockdep is also trying to say.
> >
> > So the solution would be not to suspend/resume MST during runtime
> > suspend/resume.
> 
> I think that would also mean the same thing for
> intel_fb_dev_set_suspend not to suspend it during suspend resume Where
> we see

Yes, that should be addressed already by Rodrigo's

[PATCH 4/4] drm/xe/display: Reduce and streamline d3cold display sequence

patch.

> 4> [213.826919]
> -> #3 (xe_rpm_d3cold_map){+.+.}-{0:0}:
> <4> [213.826924]        xe_rpm_lockmap_acquire+0x5f/0x70 [xe]
> <4> [213.827102]        xe_pm_runtime_get+0x59/0x110 [xe]
> <4> [213.827270]        xe_gem_fault+0x85/0x280 [xe]
> <4> [213.827384]        __do_fault+0x36/0x140
> <4> [213.827391]        do_pte_missing+0x68/0xe10
> <4> [213.827401]        __handle_mm_fault+0x7a6/0xe60
> <4> [213.827406]        handle_mm_fault+0x12e/0x2a0
> <4> [213.827411]        do_user_addr_fault+0x366/0x970
> <4> [213.827418]        exc_page_fault+0x87/0x2b0
> <4> [213.827423]        asm_exc_page_fault+0x27/0x30
> <4> [213.827428]
> -> #2 (&mm->mmap_lock){++++}-{3:3}:
> <4> [213.827432]        __might_fault+0x63/0x90
> <4> [213.827435]        _copy_to_user+0x23/0x70
> <4> [213.827441]        tty_ioctl+0x846/0x9a0
> <4> [213.827447]        __x64_sys_ioctl+0x95/0xd0
> <4> [213.827453]        x64_sys_call+0x1205/0x20d0
> <4> [213.827459]        do_syscall_64+0x85/0x140
> <4> [213.827464]        entry_SYSCALL_64_after_hwframe+0x76/0x7e
> <4> [213.827468]
> -> #1 (&tty->winsize_mutex){+.+.}-{3:3}:
> <4> [213.827471]        __mutex_lock+0x9a/0xde0
> <4> [213.827476]        mutex_lock_nested+0x1b/0x30
> <4> [213.827480]        tty_do_resize+0x27/0x90
> <4> [213.827482]        vc_do_resize+0x3ee/0x550
> <4> [213.827488]        __vc_resize+0x23/0x30
> <4> [213.827493]        fbcon_do_set_font+0x140/0x2f0
> <4> [213.827498]        fbcon_set_font+0x30a/0x530
> <4> [213.827500]        con_font_op+0x284/0x410
> <4> [213.827503]        vt_ioctl+0x3dd/0x1580
> <4> [213.827507]        tty_ioctl+0x39e/0x9a0
> <4> [213.827510]        __x64_sys_ioctl+0x95/0xd0
> <4> [213.827515]        x64_sys_call+0x1205/0x20d0
> <4> [213.827518]        do_syscall_64+0x85/0x140
> <4> [213.827523]        entry_SYSCALL_64_after_hwframe+0x76/0x7e
> <4> [213.827526]
> -> #0 (console_lock){+.+.}-{0:0}:
> <4> [213.827530]        __lock_acquire+0x126b/0x26f0
> <4> [213.827536]        lock_acquire+0xc7/0x2e0
> <4> [213.827539]        console_lock+0x54/0xa0
> <4> [213.827545]        intel_fbdev_set_suspend+0x169/0x1f0 [xe]
> <4> [213.827729]        xe_display_pm_suspend+0x6a/0x260 [xe]
> <4> [213.827945]        xe_display_pm_runtime_suspend+0x4b/0x70 [xe]
> <4> [213.828158]        xe_pm_runtime_suspend+0xbc/0x3c0 [xe]
> <4> [213.828327]        xe_pci_runtime_suspend+0x1f/0xc0 [xe]
> <4> [213.828491]        pci_pm_runtime_suspend+0x6a/0x1e0
> <4> [213.828497]        __rpm_callback+0x48/0x120
> <4> [213.828505]        rpm_callback+0x60/0x70
> <4> [213.828509]        rpm_suspend+0x124/0x650
> <4> [213.828515]        rpm_idle+0x237/0x3d0
> <4> [213.828520]        pm_runtime_work+0x9f/0xd0
> <4> [213.828523]        process_scheduled_works+0x39f/0x730
> <4> [213.828527]        worker_thread+0x14f/0x2c0
> <4> [213.828529]        kthread+0xf5/0x130
> <4> [213.828533]        ret_from_fork+0x39/0x60
> <4> [213.828538]        ret_from_fork_asm+0x1a/0x30
> <4> [213.828542]
> other info that might help us debug this:
> <4> [213.828543] Chain exists of:
>   console_lock --> &mm->mmap_lock --> xe_rpm_d3cold_map
> <4> [213.828548]  Possible unsafe locking scenario:
> <4> [213.828549]        CPU0                    CPU1
> <4> [213.828550]        ----                    ----
> <4> [213.828551]   lock(xe_rpm_d3cold_map);
> <4> [213.828553]                                lock(&mm->mmap_lock);
> <4> [213.828555]                                lock(xe_rpm_d3cold_map);
> <4> [213.828557]   lock(console_lock);
> <4> [213.828559]
>  *** DEADLOCK ***
> 
> Regards,
> Suraj Kandpal
> >
> > > ---
> > >  drivers/gpu/drm/xe/xe_pm.c | 28 ++++++++++++++--------------
> > >  1 file changed, 14 insertions(+), 14 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > > index a3d1509066f7..7f33e553728a 100644
> > > --- a/drivers/gpu/drm/xe/xe_pm.c
> > > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > > @@ -363,6 +363,18 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
> > >     /* Disable access_ongoing asserts and prevent recursive pm calls */
> > >     xe_pm_write_callback_task(xe, current);
> > >
> > > +   /*
> > > +    * Applying lock for entire list op as xe_ttm_bo_destroy and
> > xe_bo_move_notify
> > > +    * also checks and delets bo entry from user fault list.
> > > +    */
> > > +   mutex_lock(&xe->mem_access.vram_userfault.lock);
> > > +   list_for_each_entry_safe(bo, on,
> > > +                            &xe->mem_access.vram_userfault.list,
> > vram_userfault_link)
> > > +           xe_bo_runtime_pm_release_mmap_offset(bo);
> > > +   mutex_unlock(&xe->mem_access.vram_userfault.lock);
> > > +
> > > +   xe_display_pm_runtime_suspend(xe);
> > > +
> > >     /*
> > >      * The actual xe_pm_runtime_put() is always async underneath, so
> > >      * exactly where that is called should makes no difference to us.
> > > However @@ -386,18 +398,6 @@ int xe_pm_runtime_suspend(struct
> > xe_device *xe)
> > >      */
> > >     xe_rpm_lockmap_acquire(xe);
> > >
> > > -   /*
> > > -    * Applying lock for entire list op as xe_ttm_bo_destroy and
> > xe_bo_move_notify
> > > -    * also checks and delets bo entry from user fault list.
> > > -    */
> > > -   mutex_lock(&xe->mem_access.vram_userfault.lock);
> > > -   list_for_each_entry_safe(bo, on,
> > > -                            &xe->mem_access.vram_userfault.list,
> > vram_userfault_link)
> > > -           xe_bo_runtime_pm_release_mmap_offset(bo);
> > > -   mutex_unlock(&xe->mem_access.vram_userfault.lock);
> > > -
> > > -   xe_display_pm_runtime_suspend(xe);
> > > -
> > >     if (xe->d3cold.allowed) {
> > >             err = xe_bo_evict_all(xe);
> > >             if (err)
> > > @@ -438,8 +438,6 @@ int xe_pm_runtime_resume(struct xe_device *xe)
> > >     /* Disable access_ongoing asserts and prevent recursive pm calls */
> > >     xe_pm_write_callback_task(xe, current);
> > >
> > > -   xe_rpm_lockmap_acquire(xe);
> > > -
> > >     if (xe->d3cold.allowed) {
> > >             err = xe_pcode_ready(xe, true);
> > >             if (err)
> > > @@ -463,6 +461,8 @@ int xe_pm_runtime_resume(struct xe_device *xe)
> > >
> > >     xe_display_pm_runtime_resume(xe);
> > >
> > > +   xe_rpm_lockmap_acquire(xe);
> > > +
> > >     if (xe->d3cold.allowed) {
> > >             err = xe_bo_restore_user(xe);
> > >             if (err)
> > > --
> > > 2.43.2
> > >
