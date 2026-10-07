Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E081DCA600D
	for <intel-xe@archiver.kernel.org>; Wed,  7 Oct 2026 14:05:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A5CF10F5FB;
	Wed,  7 Oct 2026 14:05:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fUHT0L/Y";
	dkim-atps=neutral
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3077310E477
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Oct 2026 11:42:51 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-5b2b92065ffso3143267e87.1
 for <intel-xe@lists.freedesktop.org>; Wed, 07 Oct 2026 04:42:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791373369; cv=none;
 d=google.com; s=arc-20260327;
 b=OCwFCEP37UylKpO2NrDiIQ/PlksRBi+TQd54OY1IBSAs0eiqBjq7e5Qx314iJaEV9z
 hrPEYhN/qMeTMaE1bg+Iw74DGkHbW27A63dxo2sb6UgPsL6TSI59VYvQhw65eEIAFL8B
 lrXIOCblEtljr06aL5wGH2LjA9kVjEKIWZEJXIvmsMyA7sLBgYffVsvFQXQKHHyjpdz1
 YLi7YdlSpDplnlfIjDi/UckeANJaeaWZjVKPDtEEsvoPkh8xAj5LVTQIg6XLrUGpf5qI
 g5TZRVDpXFFok74bkiI/ekm7tD53927zlwV5nM+rrjNVA/v35K1BGYZWRr0xZGiaBw2Q
 ZTLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=IMjCS63xhp2WDsieZIPxXdxMp+WK6qGYquq1HDh8w9k=;
 fh=FJV5j4cEOskA1f/+zU/CZHeqrFAdY4cSIikS/z4h9uM=;
 b=EKMvSKwk+CLNy6zNVKIhd5MRQ+7fehdRkVMAFuuecHACsiaTT2tdArs36BvYUppCfz
 t3wvhA4mlITBqbKbQwPPL6m6hbhj3KcQC8JqhbG63/v5e1yNK4QnOY+In9l3/CnLBmrO
 vMnpeb9BRreZNVVyGunI3i3aAOqJ84e8z7w06j18OGjBrvmriXQzAf7DCmN0SunQfJuy
 l5kA+EpZTNpvlB6rS8Tog+dcjyTuG9E+9g3OaMfwEujvlurEsTQ9MR1tWH3v/JpvQXYf
 FxYhSoEDGmpCOV6jVBdVdmrJ8ZCkX+ChVVaoDPzUpNqCi9ew4yU1giFhQKORtXliWW+p
 hUSA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791373369; x=1791978169; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=IMjCS63xhp2WDsieZIPxXdxMp+WK6qGYquq1HDh8w9k=;
 b=fUHT0L/Y6HtW/XVCm0t0gCS3qsRZZYRbxh5q9DNp3EK2haRDq7LPIGxLpx4844qWRT
 FgYpVBN5u/3D5CgrilWi2dn71RGQ8muikXcwTUCxdOkkPZIEGXzh0DsOBqZuTQh5Eegz
 lwKFJJZTQ+Ss4DnAWeOTSwO5a4J1dlQZWmrjb3r9aqLXbodw5exjinRRxNwuOZheqNQY
 ++LrXPSoO0MPUPjgJ6a7lyvp1cf794HgTWCOwdlyc9amxIdWMfu/lIz9tyok+KAyZw8g
 SzgeQfZ86ZI7A17zsjZcN+EdXXFfkepGqAf3vFiYRrFJCpINHhMsn7rk6uQ73nqlu/1q
 /hiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791373369; x=1791978169;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=IMjCS63xhp2WDsieZIPxXdxMp+WK6qGYquq1HDh8w9k=;
 b=Y2U+kUkWChVJPsy0RBDXO492l+ImOGhA4DtQQl6fU8JHjgw4IYWZNNtPSXlU40vlmr
 pNKc50kgYSco7c2mekhKRfLa6mQ0/ECrN8oUQt402FcvsnhOlj0nTaSvfILW4q4F9WOs
 qdWlhkvlTZ7FmMAIxQb2DH19yXNGeXIUq0dtN/3OtiaFqxon7my7ZF9SkXZ+/Gp4lL4c
 Y9h86zuwnlXcyYuSCQZnYx7rmFaZdDNX0I8i7tX0DPOVW4VFeb6gqBYD2vyWVxWY2H+w
 JCXHWSqaQ5g64jMA+spG+EUvpNsmRvxa5XVhORDA1euQfT7ynSwNyY5qcrio1bH2C6OJ
 E97g==
X-Gm-Message-State: AFq9FYK6tdBCo1wTJoWI1Ga/uNyRDKl6JKCSXmAwdJ1OQtbUiEkgrifZ
 14q1ZjNyKkORE7b7hqMPPS0tlxm2twdmQBHfK1yQ3irKVuzITJx7MEm5xGOZz4C9lHyz5hXglpf
 YDYDPYtr8u1jsnhRYyQrpv1RDPuaKd4ak3QIG+zQ=
X-Gm-Gg: AYBFou0FxosjUkYcrPHSNCqm4Yh8Qi6JyR/82j93y1oSN3mwfvLvmUE25zVZPr9bgMg
 THThzhUSecSXuTcsFG5GIsFf4Dp1VUo6JYB+SRP3Rw1vz7/XcEd7LteTUZZm4L/U6oemR9mn+/Z
 ppiRzttZVkTg9M58x5ZP4g9baes3fF8FvNSqj66eKjWW+LN6GtjG4fl4F/9RnhFZeyVjDCk051d
 YFcPV5dflQDHt1tE4UexJI0j2IoJzFR07/NXXyOjQrZusMZnW3GZHMk4MsRqdHjOHinAU0bUQLc
 DYoGmDCvDXHtApZvfk3B6u1oT7BuUhdOo6UtVSkQebph6bXUCQ8Pem3ALqgJ8pQhaBaB
X-Received: by 2002:a05:6512:308d:b0:5b8:e89a:5cb2 with SMTP id
 2adb3069b0e04-5bcd0716e07mr799097e87.30.1791373369086; Wed, 07 Oct 2026
 04:42:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAN52AYstOLqaX_=_HBLEGKvcEmY+VGwKSbRRRyQbG4ytr6FD_A@mail.gmail.com>
In-Reply-To: <CAN52AYstOLqaX_=_HBLEGKvcEmY+VGwKSbRRRyQbG4ytr6FD_A@mail.gmail.com>
From: Jame Jao <jaojame6@gmail.com>
Date: Wed, 7 Oct 2026 19:42:37 +0800
X-Gm-Features: AclHuK8CkjCb4LCo3rA5_TpDH7jOz1RVJG5an8ba1-VN7tJJS0Mt-AcDBN_QK4U
Message-ID: <CAN52AYscu2K0SC9MNhq5Rq0_YxmPJXK9TeB_33mMQb_BZ17nHw@mail.gmail.com>
Subject: Fwd: [RESEND PATCH 0/5] platform/x86: bitland-mifs-wmi: MIFS v2
 firmware support, Xiaomi Book Pro 14 2026
To: intel-xe@lists.freedesktop.org
Cc: "Cc:" <rodrigo.vivi@intel.com>, jani.nikula@linux.intel.com, 
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 07 Oct 2026 14:05:56 +0000
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

Hello,

I would like to report a WARNING that appears on every boot on a Panther
Lake laptop, and that is also visible on screen (before the desktop comes
up) when resuming from hibernation.

Hardware / software
-------------------

  laptop    XIAOMI REDMI Book Pro 14 2026 (board TM2426)
  BIOS      RMAPT4B0P0909 (2026-05-21), EC firmware 1.9
  GPU       Intel Panther Lake [Arc B370] [8086:b081] (rev 04)
            xe: "Found pantherlake (device ID b081) integrated display
                 version 30.00 stepping B0"
  kernel    7.2.9 (Arch linux-zen packaging: vanilla 7.2.9 + zen patchset
            + one unrelated local one-file platform/x86 patch)
  xe        srcversion BB102CAE6B929F8604B5647

What happens
------------

Every boot, about 7.1 s in, while the xe module initializes the display:

  [    7.10xxxx] xe 0000:00:02.0: [drm] Found pantherlake (device ID
b081) integrated display version 30.00 stepping B0
  [    7.11xxxx] ------------[ cut here ]------------
  [    7.11xxxx] xe 0000:00:02.0: [drm] Port A asks to use VBT
vswing/preemph tables
  [    7.11xxxx] WARNING:
drivers/gpu/drm/i915/display/intel_bios.c:2813 at
intel_bios_init+0x17fd/0x1f60 [xe], CPU#1: (udev-worker)/207
  [    7.11xxxx] Modules linked in: xe(+) drm_ttm_helper ttm drm_buddy
i2c_algo_bit drm_suballoc_helper nvme gpu_sched drm_gpuvm nvme_core
drm_exec ...
  [    7.11xxxx] CPU: 1 UID: 0 PID: 207 Comm: (udev-worker) Tainted: G
    U   7.2.9-zen1-1.1-zen #1 PREEMPT(full)
  [    7.11xxxx] Hardware name: XIAOMI REDMI Book Pro 14 2026/TM2426,
BIOS RMAPT4B0P0909 05/21/2026
  [    7.11xxxx] RIP: 0010:intel_bios_init+0x1806/0x1f60 [xe]
  [    7.11xxxx] Call Trace:
  [    7.11xxxx]  <TASK>
  [    7.11xxxx]  intel_display_driver_probe_noirq+0x3b/0x2e0 [xe]
  [    7.11xxxx]  xe_display_init_early+0x8b/0x140 [xe]
  [    7.11xxxx]  xe_device_probe+0x46d/0xc20 [xe]
  [    7.11xxxx]  xe_pci_probe+0xdf7/0x13d0 [xe]
  [    7.11xxxx]  pci_call_probe+0x9a/0x270
  [    7.11xxxx]  pci_device_probe+0xdb/0x180
  [    7.11xxxx]  really_probe+0xe9/0x440
  [    7.11xxxx]  __driver_probe_device+0x90/0x190
  [    7.11xxxx]  __driver_attach+0xb3/0x370
  [    7.11xxxx]  bus_for_each_dev+0x12f/0x1d0
  [    7.11xxxx]  bus_add_driver+0x153/0x310
  [    7.11xxxx]  driver_register+0x75/0xe0
  [    7.11xxxx]  xe_init+0x27/0x90 [xe]
  [    7.11xxxx]  ? __pfx_init_module+0x10/0x10 [xe]
  [    7.11xxxx]  do_one_initcall+0x8e/0x3d0
  [    7.11xxxx]  do_init_module+0x6a/0x2b0
  [    7.11xxxx]  init_module_from_file+0xc8/0x180
  [    7.11xxxx]  idempotent_init_module+0x23e/0x360
  [    7.11xxxx]  __x64_sys_finit_module+0x7f/0x110
  [    7.11xxxx]  do_syscall_64+0xaa/0x660
  [    7.11xxxx]  entry_SYSCALL_64_after_hwframe+0x4b/0x53
  [    7.11xxxx] ---[ end trace 0000000000000000 ]---

which is exactly the check at intel_bios.c:2813:

  /*
   * FIXME need to implement support for VBT
   * vswing/preemph tables should this ever trigger.
   */
  drm_WARN(display->drm, child->use_vbt_vswing,
           "Port %c asks to use VBT vswing/preemph tables\n",
           port_name(port));

So the VBT of this machine sets use_vbt_vswing for DDI port A.

Impact here
-----------

The display works normally (eDP panel comes up, external output over USB-C
works, no visible corruption), so for me this is a warning and not a
functional failure. Two reasons I still wanted to report it:

  - it dumps a full backtrace on every boot, which looks alarming in dmesg;
  - after resume from hibernation the console output stays on screen until
    the display driver takes over, so this warning is what the user actuall=
y
    sees ("a long line with a register dump") before the desktop comes back=
.
    It is not hibernation-specific: a plain cold boot shows it too.

Questions
---------

  - Is this expected for this VBT, i.e. should the OEM VBT not set
    use_vbt_vswing for port A at all?
  - Is support for the VBT vswing/preemph tables planned, or would it make
    sense to downgrade/ignore the warning for this case (e.g. when the DP
    link is working fine)?
  - Is there any information from the VBT you would like me to extract?

I can provide
-------------

  - full dmesg / journalctl -k output for a cold boot and for a
    hibernation/resume cycle;
  - acpidump output;
  - the VBT binary (please tell me the preferred way to extract it from thi=
s
    platform - e.g. the intel-gpu-tools VBT/opregion decoders - and I will
    attach it);
  - a boot with drm.debug=3D0xe, or any other debug options you want;
  - testing of patches, including on mainline, since I can build kernels
    locally for this machine.

Thanks a lot for your work on xe.

Note: the local testing and the preparation of this report were done with t=
he
assistance of a local AI assistant (DeepSeek Harness WebUI, deepseek-flash
model); every command, log and result quoted above was actually executed on
this machine and reviewed by me.

Eason
1836949523@qq.com

list=EF=BC=88redmibook 14 pro 2026=EF=BC=89display=EF=BC=9A
[    7.113744] RDX: ffff8d974652d290 RSI: fffffffc0c47b38 RDI: fffffffc0604=
cb80
[    7.113746] RBP: 0000000000000000 R08: 0000000000000041 R09: 00000000000=
00000
[    7.113748] R10: 0000000001d4c9 R11: 0000000000000000 R12: 0000000000000=
041
[    7.113750] R13: 0000000000000001 R14: 0000000000000000 R15: ffff8d974a3=
bb240
[    7.113751] FS: 00007f706f7fcc0(0000) GS:ffff8d9f939e0000(0000)
knlGS:0000000000000000
[    7.113754] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    7.113756] CR2: 0000771a22aa8000 CR3: 000000010c3ba004 CR4: 0000000108f=
70ef0
[    7.113758] PKRU: 55555554
[    7.113759] Call Trace:
[    7.113761]  <TASK>
[    7.113764]  intel_display_driver_probe_noirq+0x3b/0x2e0 [xe
fe9955369cf4efd202cb08e060d7d8898245273a]
[    7.113959]  xe_display_init_early+0xb0/0x140 [xe
fe9955369cf4efd202cb08e060d7d8898245273a]
[    7.114142]  xe_device_probe+0x45d/0xc20 [xe
fe9955369cf4efd202cb08e060d7d8898245273a]
[    7.114283]  xe_pci_probe+0xd7f/0x13d0 [xe
fe9955369cf4efd202cb08e060d7d8898245273a]
[    7.114461]  pci_call_probe+0x9a/0x270
[    7.114468]  ? pci_match_device+0x1b7/0x200
[    7.114472]  pci_device_probe+0xb0b/0x180
[    7.114476]  really_probe+0xe9/0x440
[    7.114480]  ? __pm_runtime_resume+0x5f/0x90
[    7.114483]  ? __pfx__driver_attach+0x10/0x10
[    7.114486]  __driver_probe_device+0x90/0x190
[    7.114488]  driver_attach+0xb3/0x370
[    7.114491]  bus_for_each_dev+0x12f/0x1d0
[    7.114495]  bus_add_driver+0x153/0x310
[    7.114500]  ? __pfx_init_module+0x10/0x10 [xe
fe9955369cf4efd202cb08e060d7d8898245273a]
[    7.114635]  driver_register+0x75/0xe0
[    7.114638]  xe_init+0x27/0x90 [xe fe9955369cf4efd202cb08e060d7d88982452=
73a]
[    7.114751]  ? __pfx_init_module+0x10/0x10 [xe
fe9955369cf4efd202cb08e060d7d8898245273a]
[    7.114856]  do_one_initcall+0xbe/0x3d0
[    7.114862]  do_init_module+0x6a/0x280
[    7.114865]  init_module_from_file+0xc8/0x180
[    7.114870]  idempotent_init_module+0x23e/0x360
[    7.114874]  __x64_sys_finit_module+0x7f/0x110
[    7.114877]  do_syscall_64+0xaa/0x660
[    7.114881]  ? do_syscall_64+0x5f/0x660
[    7.114884]  ? irqentry_exit+0x354/0x7b0
[    7.114888]  ? fred_sysvec_reschedule_ipi+0x1d/0xf0
[    7.114891]  asm_fred_entrypoint_user+0x41/0x41
[    7.114895] RIP: 0033:0x7f705f91b4cd
[    7.114898] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e
fa 48 89 f8 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05
<48> 3d 01 f0
ff 73 01 c3 48 8b 0d 73 a2 0f 00 f7 d8 64 89 01 48
[    7.114901] RSP: 002b:00007ffed2945a18 EFLAGS: 00000246 ORIG_RAX:
0000000000000139
[    7.114904] RAX: ffffffffffffffda RBX: 0000563adfc26cf0 RCX: 00000000000=
00000
[    7.114905] RDX: 0000000000000004 RSI: 0000563adfc26190 RDI: 00000000000=
00005
[    7.114907] RBP: 00007ffed2945ab0 R08: 0000000000000000 R09: 0000563adfc=
28010
[    7.114909] R10: 0000000000000000 R11: 00007f705f77fbcc R12: 0000563adfc=
26190
[    7.114910] R13: 0000000000020000 R14: 0000563adfc197b0 R15: 0000563adfc=
26cf0
[    7.114912]  </TASK>
[    7.114914] ---[ end trace 0000000000000000 ]---
