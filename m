Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B6BCDD1CD
	for <intel-xe@archiver.kernel.org>; Fri, 27 Sep 2024 16:43:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A294F10ECEC;
	Fri, 27 Sep 2024 16:43:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CXszfRdw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66BC310ECEC
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Sep 2024 16:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727455396; x=1758991396;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=7PUR1U/RteCDONn1C/oXwfHGNPrjLVCKDqlcL3BcRT4=;
 b=CXszfRdwpnWl+i/Jd5ChUz/ObpdUhT+GIVh3ktOCUpKLRKd9ozVwqwj7
 x23E3fbLzw+5Dm1QBE5CbbJM11aztbSPY92SBfeJRkNW5ugp7NM3u1zPa
 SrvuloAPGUYGG6F/w2+ny+s6gShIHPDP6VIzUN/yCe3tQigz0Wd/cN6Bb
 RZcYLytyckOebr3JXf51GtuxmskH65T9HkatTUrxw91L1a4Tn8dITHVtM
 dkYsUaFu++d15eNVlUO9dWs6QkguzMRTBJZ2A9tWopMIZRj4EFOala6cc
 x39qdJqyTlo9KATUeLm4mos9LWu6uR/PhXchB9W9+iskusCi8DZKHJNQ0 A==;
X-CSE-ConnectionGUID: 43xsvYHFTAuaueXRjSoBBg==
X-CSE-MsgGUID: l5Vk2iesQyKg9vkQVxu5/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="30315646"
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; d="scan'208";a="30315646"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 09:43:15 -0700
X-CSE-ConnectionGUID: a03z3rnbRiSpwNMuz8fiRg==
X-CSE-MsgGUID: Vo7JUqTcQlqbF38aZwYiXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; d="scan'208";a="77099343"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.244.81])
 ([10.245.244.81])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 09:43:13 -0700
Message-ID: <11dd509281e5278eb27f1ad7be2adc3db92058bb.camel@linux.intel.com>
Subject: Re: [PATCH v4 1/1] drm/xe: Prevent null pointer access in
 xe_migrate_copy
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, Zhanjun Dong
 <zhanjun.dong@intel.com>,  intel-xe@lists.freedesktop.org
Date: Fri, 27 Sep 2024 18:43:11 +0200
In-Reply-To: <80cc7152-4aa1-4618-a9b9-80687e74b301@intel.com>
References: <20240927161308.862323-1-zhanjun.dong@intel.com>
 <20240927161308.862323-2-zhanjun.dong@intel.com>
 <80cc7152-4aa1-4618-a9b9-80687e74b301@intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
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

On Fri, 2024-09-27 at 17:34 +0100, Matthew Auld wrote:
> On 27/09/2024 17:13, Zhanjun Dong wrote:
> > xe_migrate_copy designed to copy content of TTM resources. When
> > source
> > resource is null, it will trigger a NULL pointer dereference in
> > xe_migrate_copy. To avoid this situation, update lacks source flag
> > to
> > true for this case, the flag will trigger xe_migrate_clear rather
> > than
> > xe_migrate_copy.
> >=20
> > Issue trace:
> > <7> [317.089847] xe 0000:00:02.0: [drm:xe_migrate_copy [xe]] Pass
> > 14,
> > =C2=A0 sizes: 4194304 & 4194304
> > <7> [317.089945] xe 0000:00:02.0: [drm:xe_migrate_copy [xe]] Pass
> > 15,
> > =C2=A0 sizes: 4194304 & 4194304
> > <1> [317.128055] BUG: kernel NULL pointer dereference, address:
> > =C2=A0 0000000000000010
> > <1> [317.128064] #PF: supervisor read access in kernel mode
> > <1> [317.128066] #PF: error_code(0x0000) - not-present page
> > <6> [317.128069] PGD 0 P4D 0
> > <4> [317.128071] Oops: Oops: 0000 [#1] PREEMPT SMP NOPTI
> > <4> [317.128074] CPU: 1 UID: 0 PID: 1440 Comm: kunit_try_catch
> > Tainted:
> > =C2=A0 G=C2=A0=C2=A0=C2=A0=C2=A0 U=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 N 6.11.0-rc7-xe #1
> > <4> [317.128078] Tainted: [U]=3DUSER, [N]=3DTEST
> > <4> [317.128080] Hardware name: Intel Corporation Lunar Lake Client
> > =C2=A0 Platform/LNL-M LP5 RVP1, BIOS LNLMFWI1.R00.3221.D80.2407291239
> > 07/29/2024
> > <4> [317.128082] RIP: 0010:xe_migrate_copy+0x66/0x13e0 [xe]
> > <4> [317.128158] Code: 00 00 48 89 8d e0 fe ff ff 48 8b 40 10 4c 89
> > 85 c8
> > =C2=A0 fe ff ff 44 88 8d bd fe ff ff 65 48 8b 3c 25 28 00 00 00 48 89 7=
d
> > d0 31
> > =C2=A0 ff <8b> 79 10 48 89 85 a0 fe ff ff 48 8b 00 48 89 b5 d8 fe ff ff
> > 83 ff
> > <4> [317.128162] RSP: 0018:ffffc9000167f9f0 EFLAGS: 00010246
> > <4> [317.128164] RAX: ffff8881120d8028 RBX: ffff88814d070428 RCX:
> > =C2=A0 0000000000000000
> > <4> [317.128166] RDX: ffff88813cb99c00 RSI: 0000000004000000 RDI:
> > =C2=A0 0000000000000000
> > <4> [317.128168] RBP: ffffc9000167fbb8 R08: ffff88814e7b1f08 R09:
> > =C2=A0 0000000000000001
> > <4> [317.128170] R10: 0000000000000001 R11: 0000000000000001 R12:
> > =C2=A0 ffff88814e7b1f08
> > <4> [317.128172] R13: ffff88814e7b1f08 R14: ffff88813cb99c00 R15:
> > =C2=A0 0000000000000001
> > <4> [317.128174] FS:=C2=A0 0000000000000000(0000)
> > GS:ffff88846f280000(0000)
> > =C2=A0 knlGS:0000000000000000
> > <4> [317.128176] CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > <4> [317.128178] CR2: 0000000000000010 CR3: 000000011f676004 CR4:
> > =C2=A0 0000000000770ef0
> > <4> [317.128180] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
> > =C2=A0 0000000000000000
> > <4> [317.128182] DR3: 0000000000000000 DR6: 00000000ffff07f0 DR7:
> > =C2=A0 0000000000000400
> > <4> [317.128184] PKRU: 55555554
> > <4> [317.128185] Call Trace:
> > <4> [317.128187]=C2=A0 <TASK>
> > <4> [317.128189]=C2=A0 ? show_regs+0x67/0x70
> > <4> [317.128194]=C2=A0 ? __die_body+0x20/0x70
> > <4> [317.128196]=C2=A0 ? __die+0x2b/0x40
> > <4> [317.128198]=C2=A0 ? page_fault_oops+0x15f/0x4e0
> > <4> [317.128203]=C2=A0 ? do_user_addr_fault+0x3fb/0x970
> > <4> [317.128205]=C2=A0 ? lock_acquire+0xc7/0x2e0
> > <4> [317.128209]=C2=A0 ? exc_page_fault+0x87/0x2b0
> > <4> [317.128212]=C2=A0 ? asm_exc_page_fault+0x27/0x30
> > <4> [317.128216]=C2=A0 ? xe_migrate_copy+0x66/0x13e0 [xe]
> > <4> [317.128263]=C2=A0 ? __lock_acquire+0xb9d/0x26f0
> > <4> [317.128265]=C2=A0 ? __lock_acquire+0xb9d/0x26f0
> > <4> [317.128267]=C2=A0 ? sg_free_append_table+0x20/0x80
> > <4> [317.128271]=C2=A0 ? lock_acquire+0xc7/0x2e0
> > <4> [317.128273]=C2=A0 ? mark_held_locks+0x4d/0x80
> > <4> [317.128275]=C2=A0 ? trace_hardirqs_on+0x1e/0xd0
> > <4> [317.128278]=C2=A0 ? _raw_spin_unlock_irqrestore+0x31/0x60
> > <4> [317.128281]=C2=A0 ? __pm_runtime_resume+0x60/0xa0
> > <4> [317.128284]=C2=A0 xe_bo_move+0x682/0xc50 [xe]
> > <4> [317.128315]=C2=A0 ? lock_is_held_type+0xaa/0x120
> > <4> [317.128318]=C2=A0 ttm_bo_handle_move_mem+0xe5/0x1a0 [ttm]
> > <4> [317.128324]=C2=A0 ttm_bo_validate+0xd1/0x1a0 [ttm]
> > <4> [317.128328]=C2=A0 shrink_test_run_device+0x721/0xc10 [xe]
> > <4> [317.128360]=C2=A0 ? find_held_lock+0x31/0x90
> > <4> [317.128363]=C2=A0 ? lock_release+0xd1/0x2a0
> > <4> [317.128365]=C2=A0 ?
> > __pfx_kunit_generic_run_threadfn_adapter+0x10/0x10
> > =C2=A0 [kunit]
> > <4> [317.128370]=C2=A0 xe_bo_shrink_kunit+0x11/0x20 [xe]
> > <4> [317.128397]=C2=A0 kunit_try_run_case+0x6e/0x150 [kunit]
> > <4> [317.128400]=C2=A0 ? trace_hardirqs_on+0x1e/0xd0
> > <4> [317.128402]=C2=A0 ? _raw_spin_unlock_irqrestore+0x31/0x60
> > <4> [317.128404]=C2=A0 kunit_generic_run_threadfn_adapter+0x1e/0x40
> > [kunit]
> > <4> [317.128407]=C2=A0 kthread+0xf5/0x130
> > <4> [317.128410]=C2=A0 ? __pfx_kthread+0x10/0x10
> > <4> [317.128412]=C2=A0 ret_from_fork+0x39/0x60
> > <4> [317.128415]=C2=A0 ? __pfx_kthread+0x10/0x10
> > <4> [317.128416]=C2=A0 ret_from_fork_asm+0x1a/0x30
> > <4> [317.128420]=C2=A0 </TASK>
> >=20
> > Fixes: 266c85885263 ("drm/xe/xe2: Handle flat ccs move for igfx.")
> > Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> > Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0 drivers/gpu/drm/xe/xe_bo.c | 4 ++--
> > =C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > b/drivers/gpu/drm/xe/xe_bo.c
> > index 5f2f1ec46b57..5e8f60a8d431 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -682,8 +682,8 @@ static int xe_bo_move(struct ttm_buffer_object
> > *ttm_bo, bool evict,
> > =C2=A0=C2=A0	tt_has_data =3D ttm && (ttm_tt_is_populated(ttm) ||
> > =C2=A0=C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (ttm->page_flags &
> > TTM_TT_FLAG_SWAPPED));
> > =C2=A0=20
> > -	move_lacks_source =3D handle_system_ccs ? (!bo-
> > >ccs_cleared)=C2=A0 :
> > -
> > 						(!mem_type_is_vram(old_mem_type) && !tt_has_data);
> > +	move_lacks_source =3D !old_mem || (handle_system_ccs ? (!bo-
> > >ccs_cleared) :
> > +				=09
> > (!mem_type_is_vram(old_mem_type) && !tt_has_data));
>=20
> So is the issue us leaving bo->ccs_cleared set, even after purging
> the=20
> object? Seems like when purging the object the bo->ccs_cleared should
> be=20
> reset since backing storage is now gone? If we ever have purging for=20
> real userspace stuff we probably need that anyway.

Hmm, good point. But is purging removing the bo->resource. I guess it
does....

/Thomas


>=20
> > =C2=A0=20
> > =C2=A0=C2=A0	needs_clear =3D (ttm && ttm->page_flags &
> > TTM_TT_FLAG_ZERO_ALLOC) ||
> > =C2=A0=C2=A0		(!ttm && ttm_bo->type =3D=3D ttm_bo_type_device);

