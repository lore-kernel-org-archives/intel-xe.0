Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2835CCF9E3
	for <intel-xe@archiver.kernel.org>; Mon, 10 Nov 2025 13:49:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62C0B10E3BF;
	Mon, 10 Nov 2025 13:49:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n+u7HNJy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 759FF10E3BF
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Nov 2025 13:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762782566; x=1794318566;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=Za4GWn5JM0Kbu0aGlMEb+rY8oiCM/ifMf3a1WMfZkes=;
 b=n+u7HNJy8pI30TBt33Swd3USCMn04c8DhtimXpRqURsKshkPEWQH6Yzv
 0t44vjJGGhZzP4zO0YV2BZ7EIsOKp1AmSEeXvwI1D/lnYa7/k0tmomXSo
 U/IwFDnmSH2mzlPohC987GJQr7sQNBqntsEzAarJIz9IUdRb3wiqMJVHf
 bMVWfJbY5lvmdmtweGsr0RSjhXokboRDLHTiacxoH04SY3VSwYc4bf2NG
 OlTzgkb6q29FQa0f5tLeFSv3xF2rwMUcWUkalJagd7HOpcQJ+B3LVGlW9
 d7YXOFQECwxdBdZbfpg2nSGW8zHFaMhc7xxkLTFqiwBz66f/eJfPq6myD g==;
X-CSE-ConnectionGUID: bZGW7rgeThi/pqNXSvvHIA==
X-CSE-MsgGUID: WDO7HUmgT1augl5DX1RghQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64865683"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; d="scan'208";a="64865683"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 05:49:25 -0800
X-CSE-ConnectionGUID: HrVBwU6eRbSEnu3KYPsL1A==
X-CSE-MsgGUID: 5QH48QhwTIul3NtVy2utSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; d="scan'208";a="188513905"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.202])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 05:49:23 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jani Partanen <jiipee@sotapeli.fi>, intel-xe@lists.freedesktop.org
Cc: Alexander Usyskin <alexander.usyskin@intel.com>,
 linux-mtd@lists.infradead.org
Subject: Re: Possible bug?
In-Reply-To: <caca6c67-4f1d-49f1-948f-e63b6b937b29@sotapeli.fi>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <caca6c67-4f1d-49f1-948f-e63b6b937b29@sotapeli.fi>
Date: Mon, 10 Nov 2025 15:49:20 +0200
Message-ID: <75a84e116f2f1120a02e8ff81ca5343621bd04fc@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Sun, 09 Nov 2025, Jani Partanen <jiipee@sotapeli.fi> wrote:
> Hello, I just got Intel Arc B570. It seems to work fine but every boot I=
=20
> get this in dmesg:
>
> [=C2=A0 342.865944] ------------[ cut here ]------------
> [=C2=A0 342.865950] UBSAN: array-index-out-of-bounds in=20
> drivers/mtd/devices/mtd_intel_dg.c:750:15
> [=C2=A0 342.865954] index 0 is out of range for type '<unknown> [*]'

Cc: Alexander and linux-mtd.

It's probably due to struct intel_dg_nvm regions[] member being
__counted_by(nregions) but regions[] is indexed before nregions has been
initialized.

BR,
Jani.


> [=C2=A0 342.865957] CPU: 6 UID: 0 PID: 6184 Comm: (udev-worker) Not taint=
ed=20
> 6.17.7-300.fc43.x86_64 #1 PREEMPT(lazy)
> [=C2=A0 342.865961] Hardware name: ASUS System Product Name/ROG CROSSHAIR=
=20
> VIII HERO (WI-FI), BIOS 5302 10/03/2025
> [=C2=A0 342.865963] Call Trace:
> [=C2=A0 342.865967]=C2=A0 <TASK>
> [=C2=A0 342.865972]=C2=A0 dump_stack_lvl+0x5d/0x80
> [=C2=A0 342.865979]=C2=A0 ubsan_epilogue+0x5/0x2b
> [=C2=A0 342.865984]=C2=A0 __ubsan_handle_out_of_bounds.cold+0x54/0x59
> [=C2=A0 342.865991]=C2=A0 intel_dg_mtd_probe+0x21b/0x240 [mtd_intel_dg]
> [=C2=A0 342.865998]=C2=A0 ? __pfx_intel_dg_mtd_probe+0x10/0x10 [mtd_intel=
_dg]
> [=C2=A0 342.866002]=C2=A0 auxiliary_bus_probe+0x49/0x80
> [=C2=A0 342.866006]=C2=A0 ? srso_return_thunk+0x5/0x5f
> [=C2=A0 342.866012]=C2=A0 really_probe+0xde/0x340
> [=C2=A0 342.866015]=C2=A0 ? pm_runtime_barrier+0x55/0x90
> [=C2=A0 342.866019]=C2=A0 __driver_probe_device+0x78/0x140
> [=C2=A0 342.866022]=C2=A0 driver_probe_device+0x1f/0xa0
> [=C2=A0 342.866025]=C2=A0 ? __pfx___driver_attach+0x10/0x10
> [=C2=A0 342.866027]=C2=A0 __driver_attach+0xcb/0x1e0
> [=C2=A0 342.866030]=C2=A0 bus_for_each_dev+0x85/0xd0
> [=C2=A0 342.866036]=C2=A0 bus_add_driver+0x12f/0x210
> [=C2=A0 342.866040]=C2=A0 ? __pfx_intel_dg_mtd_driver_init+0x10/0x10 [mtd=
_intel_dg]
> [=C2=A0 342.866044]=C2=A0 driver_register+0x75/0xe0
> [=C2=A0 342.866047]=C2=A0 __auxiliary_driver_register+0x6e/0xd0
> [=C2=A0 342.866050]=C2=A0 do_one_initcall+0x5b/0x300
> [=C2=A0 342.866058]=C2=A0 do_init_module+0x84/0x280
> [=C2=A0 342.866063]=C2=A0 init_module_from_file+0x8a/0xe0
> [=C2=A0 342.866071]=C2=A0 idempotent_init_module+0x114/0x310
> [=C2=A0 342.866078]=C2=A0 __x64_sys_finit_module+0x6d/0xd0
> [=C2=A0 342.866081]=C2=A0 ? syscall_trace_enter+0x108/0x1d0
> [=C2=A0 342.866086]=C2=A0 do_syscall_64+0x7e/0x250
> [=C2=A0 342.866090]=C2=A0 ? srso_return_thunk+0x5/0x5f
> [=C2=A0 342.866092]=C2=A0 ? switch_fpu_return+0x4e/0xd0
> [=C2=A0 342.866097]=C2=A0 ? srso_return_thunk+0x5/0x5f
> [=C2=A0 342.866099]=C2=A0 ? arch_exit_to_user_mode_prepare.isra.0+0x6a/0x=
80
> [=C2=A0 342.866102]=C2=A0 ? srso_return_thunk+0x5/0x5f
> [=C2=A0 342.866105]=C2=A0 ? do_syscall_64+0xb6/0x250
> [=C2=A0 342.866108]=C2=A0 ? srso_return_thunk+0x5/0x5f
> [=C2=A0 342.866111]=C2=A0 ? terminate_walk+0xef/0x100
> [=C2=A0 342.866115]=C2=A0 ? srso_return_thunk+0x5/0x5f
> [=C2=A0 342.866118]=C2=A0 ? path_openat+0x116/0x2a0
> [=C2=A0 342.866122]=C2=A0 ? srso_return_thunk+0x5/0x5f
> [=C2=A0 342.866125]=C2=A0 ? do_filp_open+0xd8/0x180
> [=C2=A0 342.866131]=C2=A0 ? __pfx_page_put_link+0x10/0x10
> [=C2=A0 342.866137]=C2=A0 ? srso_return_thunk+0x5/0x5f
> [=C2=A0 342.866141]=C2=A0 ? srso_return_thunk+0x5/0x5f
> [=C2=A0 342.866144]=C2=A0 ? do_sys_openat2+0xa2/0xe0
> [=C2=A0 342.866149]=C2=A0 ? srso_return_thunk+0x5/0x5f
> [=C2=A0 342.866152]=C2=A0 ? syscall_exit_work+0x143/0x1b0
> [=C2=A0 342.866155]=C2=A0 ? srso_return_thunk+0x5/0x5f
> [=C2=A0 342.866157]=C2=A0 ? do_syscall_64+0xb6/0x250
> [=C2=A0 342.866161]=C2=A0 ? srso_return_thunk+0x5/0x5f
> [=C2=A0 342.866163]=C2=A0 ? srso_return_thunk+0x5/0x5f
> [=C2=A0 342.866166]=C2=A0 ? irqentry_exit_to_user_mode+0x2c/0x1c0
> [=C2=A0 342.866169]=C2=A0 entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [=C2=A0 342.866172] RIP: 0033:0x7fc5052ff34d
> [=C2=A0 342.866187] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e=
 fa=20
> 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f=20
> 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 83 6a 0f 00 f7 d8 64 89 01 48
> [=C2=A0 342.866189] RSP: 002b:00007ffc546026d8 EFLAGS: 00000246 ORIG_RAX:=
=20
> 0000000000000139
> [=C2=A0 342.866193] RAX: ffffffffffffffda RBX: 0000557240396680 RCX:=20
> 00007fc5052ff34d
> [=C2=A0 342.866194] RDX: 0000000000000004 RSI: 00007fc5059d85e1 RDI:=20
> 0000000000000021
> [=C2=A0 342.866196] RBP: 00007ffc54602770 R08: 0000000000000000 R09:=20
> 00005572401f3fd0
> [=C2=A0 342.866197] R10: 0000000000000000 R11: 0000000000000246 R12:=20
> 00007fc5059d85e1
> [=C2=A0 342.866199] R13: 0000000000020000 R14: 0000557240210540 R15:=20
> 0000000000000000
> [=C2=A0 342.866205]=C2=A0 </TASK>
> [=C2=A0 342.866207] ---[ end trace ]---
> [=C2=A0 342.866225] ------------[ cut here ]------------
> [=C2=A0 342.866226] UBSAN: array-index-out-of-bounds in=20
> drivers/mtd/devices/mtd_intel_dg.c:751:15
> [=C2=A0 342.866229] index 0 is out of range for type '<unknown> [*]'
> [=C2=A0 342.866232] CPU: 6 UID: 0 PID: 6184 Comm: (udev-worker) Not taint=
ed=20
> 6.17.7-300.fc43.x86_64 #1 PREEMPT(lazy)
> [=C2=A0 342.866234] Hardware name: ASUS System Product Name/ROG CROSSHAIR=
=20
> VIII HERO (WI-FI), BIOS 5302 10/03/2025
> [=C2=A0 342.866236] Call Trace:
> [=C2=A0 342.866237]=C2=A0 <TASK>
> [=C2=A0 342.866239]=C2=A0 dump_stack_lvl+0x5d/0x80
> [=C2=A0 342.866242]=C2=A0 ubsan_epilogue+0x5/0x2b
> [=C2=A0 342.866245]=C2=A0 __ubsan_handle_out_of_bounds.cold+0x54/0x59
> [=C2=A0 342.866249]=C2=A0 intel_dg_mtd_probe+0x1fa/0x240 [mtd_intel_dg]
> [=C2=A0 342.866254]=C2=A0 ? __pfx_intel_dg_mtd_probe+0x10/0x10 [mtd_intel=
_dg]
> [=C2=A0 342.866258]=C2=A0 auxiliary_bus_probe+0x49/0x80
> [=C2=A0 342.866261]=C2=A0 ? srso_return_thunk+0x5/0x5f
> [=C2=A0 342.866264]=C2=A0 really_probe+0xde/0x340
> [=C2=A0 342.866266]=C2=A0 ? pm_runtime_barrier+0x55/0x90
> [=C2=A0 342.866269]=C2=A0 __driver_probe_device+0x78/0x140
> [=C2=A0 342.866272]=C2=A0 driver_probe_device+0x1f/0xa0
> [=C2=A0 342.866275]=C2=A0 ? __pfx___driver_attach+0x10/0x10
> [=C2=A0 342.866277]=C2=A0 __driver_attach+0xcb/0x1e0
> [=C2=A0 342.866280]=C2=A0 bus_for_each_dev+0x85/0xd0
> [=C2=A0 342.866284]=C2=A0 bus_add_driver+0x12f/0x210
> [=C2=A0 342.866289]=C2=A0 ? __pfx_intel_dg_mtd_driver_init+0x10/0x10 [mtd=
_intel_dg]
> [=C2=A0 342.866292]=C2=A0 driver_register+0x75/0xe0
> [=C2=A0 342.866295]=C2=A0 __auxiliary_driver_register+0x6e/0xd0
> [=C2=A0 342.866298]=C2=A0 do_one_initcall+0x5b/0x300
> [=C2=A0 342.866304]=C2=A0 do_init_module+0x84/0x280
> [=C2=A0 342.866307]=C2=A0 init_module_from_file+0x8a/0xe0
> [=C2=A0 342.866316]=C2=A0 idempotent_init_module+0x114/0x310
> [=C2=A0 342.866322]=C2=A0 __x64_sys_finit_module+0x6d/0xd0
> [=C2=A0 342.866325]=C2=A0 ? syscall_trace_enter+0x108/0x1d0
> [=C2=A0 342.866329]=C2=A0 do_syscall_64+0x7e/0x250
> [=C2=A0 342.866331]=C2=A0 ? srso_return_thunk+0x5/0x5f
> [=C2=A0 342.866334]=C2=A0 ? switch_fpu_return+0x4e/0xd0
> [=C2=A0 342.866337]=C2=A0 ? srso_return_thunk+0x5/0x5f
> [=C2=A0 342.866340]=C2=A0 ? arch_exit_to_user_mode_prepare.isra.0+0x6a/0x=
80
> [=C2=A0 342.866342]=C2=A0 ? srso_return_thunk+0x5/0x5f
> [=C2=A0 342.866345]=C2=A0 ? do_syscall_64+0xb6/0x250
> [=C2=A0 342.866348]=C2=A0 ? srso_return_thunk+0x5/0x5f
> [=C2=A0 342.866350]=C2=A0 ? terminate_walk+0xef/0x100
> [=C2=A0 342.866353]=C2=A0 ? srso_return_thunk+0x5/0x5f
> [=C2=A0 342.866356]=C2=A0 ? path_openat+0x116/0x2a0
> [=C2=A0 342.866360]=C2=A0 ? srso_return_thunk+0x5/0x5f
> [=C2=A0 342.866363]=C2=A0 ? do_filp_open+0xd8/0x180
> [=C2=A0 342.866369]=C2=A0 ? __pfx_page_put_link+0x10/0x10
> [=C2=A0 342.866374]=C2=A0 ? srso_return_thunk+0x5/0x5f
> [=C2=A0 342.866378]=C2=A0 ? srso_return_thunk+0x5/0x5f
> [=C2=A0 342.866381]=C2=A0 ? do_sys_openat2+0xa2/0xe0
> [=C2=A0 342.866385]=C2=A0 ? srso_return_thunk+0x5/0x5f
> [=C2=A0 342.866388]=C2=A0 ? syscall_exit_work+0x143/0x1b0
> [=C2=A0 342.866391]=C2=A0 ? srso_return_thunk+0x5/0x5f
> [=C2=A0 342.866394]=C2=A0 ? do_syscall_64+0xb6/0x250
> [=C2=A0 342.866397]=C2=A0 ? srso_return_thunk+0x5/0x5f
> [=C2=A0 342.866399]=C2=A0 ? srso_return_thunk+0x5/0x5f
> [=C2=A0 342.866402]=C2=A0 ? irqentry_exit_to_user_mode+0x2c/0x1c0
> [=C2=A0 342.866405]=C2=A0 entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [=C2=A0 342.866407] RIP: 0033:0x7fc5052ff34d
> [=C2=A0 342.866411] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e=
 fa=20
> 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f=20
> 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 83 6a 0f 00 f7 d8 64 89 01 48
> [=C2=A0 342.866413] RSP: 002b:00007ffc546026d8 EFLAGS: 00000246 ORIG_RAX:=
=20
> 0000000000000139
> [=C2=A0 342.866415] RAX: ffffffffffffffda RBX: 0000557240396680 RCX:=20
> 00007fc5052ff34d
> [=C2=A0 342.866416] RDX: 0000000000000004 RSI: 00007fc5059d85e1 RDI:=20
> 0000000000000021
> [=C2=A0 342.866418] RBP: 00007ffc54602770 R08: 0000000000000000 R09:=20
> 00005572401f3fd0
> [=C2=A0 342.866419] R10: 0000000000000000 R11: 0000000000000246 R12:=20
> 00007fc5059d85e1
> [=C2=A0 342.866420] R13: 0000000000020000 R14: 0000557240210540 R15:=20
> 0000000000000000
> [=C2=A0 342.866427]=C2=A0 </TASK>
> [=C2=A0 342.866451] ---[ end trace ]---
>
>
> I also double checked that it's not some config error in my end by=20
> starting up Fedora 43 live enviroment what cave me this same error.
>
> As far as I know its related to mtd and here is what I can see:
>
> mtdinfo -a
> Count of MTD devices:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A04
> Present MTD devices:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mtd0, mtd1,=
 mtd2, mtd3
> Sysfs interface supported:=C2=A0 =C2=A0 =C2=A0 yes
>
> mtd0
> Name:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xe.nvm.3584.DESCRIPTOR
> Type:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dataflash
> Eraseblock size:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 4=
096 bytes, 4.0 KiB
> Amount of eraseblocks:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1 (4096 bytes, 4=
.0 KiB)
> Minimum input/output unit size: 1 byte
> Sub-page size:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 1 byte
> Character device major/minor:=C2=A0 =C2=A090:0
> Bad blocks are allowed:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0false
> Device is writable:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0false
>
> mtd1
> Name:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xe.nvm.3584.GSC
> Type:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dataflash
> Eraseblock size:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 4=
096 bytes, 4.0 KiB
> Amount of eraseblocks:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1357 (5558272 by=
tes, 5.3 MiB)
> Minimum input/output unit size: 1 byte
> Sub-page size:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 1 byte
> Character device major/minor:=C2=A0 =C2=A090:2
> Bad blocks are allowed:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0false
> Device is writable:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0false
>
> mtd2
> Name:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xe.nvm.3584.OptionROM
> Type:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dataflash
> Eraseblock size:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 4=
096 bytes, 4.0 KiB
> Amount of eraseblocks:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 512 (2097152 byt=
es, 2.0 MiB)
> Minimum input/output unit size: 1 byte
> Sub-page size:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 1 byte
> Character device major/minor:=C2=A0 =C2=A090:4
> Bad blocks are allowed:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0false
> Device is writable:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0false
>
> mtd3
> Name:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xe.nvm.3584.DAM
> Type:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dataflash
> Eraseblock size:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 4=
096 bytes, 4.0 KiB
> Amount of eraseblocks:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 16 (65536 bytes,=
 64.0 KiB)
> Minimum input/output unit size: 1 byte
> Sub-page size:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 1 byte
> Character device major/minor:=C2=A0 =C2=A090:6
> Bad blocks are allowed:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0false
> Device is writable:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0false
>

--=20
Jani Nikula, Intel
