Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB8C0CA5FF1
	for <intel-xe@archiver.kernel.org>; Wed,  7 Oct 2026 14:05:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F78F10F5F3;
	Wed,  7 Oct 2026 14:05:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="pUPw8UIb";
	dkim-atps=neutral
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EF3A10E449
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Oct 2026 11:27:23 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-5b2b92065ffso3122591e87.1
 for <intel-xe@lists.freedesktop.org>; Wed, 07 Oct 2026 04:27:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791372441; cv=none;
 d=google.com; s=arc-20260327;
 b=jJWyqT0XoPzkqdRJ69iTa3vE3MBiy9J+29vfsuaDaOvZ9FhpDcxMosi5hIv3iXDFI9
 5Qk6EbuyZV5GWzdHp5VY94dqr4kXtu0+QnzW0N47Htj0SVKPp3PA8eS0JRTdqEsEO79H
 oyIt3YpuGakbFt5J8sJFKCIgGZaQ38m6XP4Hwl02MCF/eAQAbUa2JfVQPWEvUDyuUhVF
 sHJxMroYqBBLS2moL5UEm+DWEYoRXZN6qia1YOHVcEGcdU5xRa5yiBYOxFOPHeQl1D3R
 LdPLGF/mdz+T8Fy/IkOzhj0HhGa1ZQ+acYharsmrsisalsl+59KU19JuPeevbnL3ENZv
 8TBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
 bh=tJim+Rw5F8qmwuKnMGlLPQG3sgRGurbEvY1frkjT4os=;
 fh=8LTFHCoiWypJ+9Flx9WLSRtKe5NKw4bBykORBmZm7GY=;
 b=aNpQincEQGaqnBl8Jl8G5XjDAV1KASfr1qBYUJ6bo8Lz5tOJfOTD92J8U7mt09r3Q+
 LUXz0+/fychRPT/mQv7qSUSXPsoV1V+sz22fjZ+NT+0R7f+g2HPeRrgBZZcpvX+FeHMG
 sDCmQ9J37e3jLc8Tt2XdxG8ghp8ho3SknJElwxKL9CR8q2TVQdUlRxRk9U7Vy9tbQXB8
 Qic/YnffPb2WyhW6vIEGp6AsYmMlWksukcdnktV50Jb4tFy3ns0ZkvmzIOQG6BhDsjxW
 VnryeGDu8HMwfEVCRb2khvZ9pgpPWM7swwz8e9W/3Sdh06cT87oEJYzDTrgX1TC6ZiMh
 Gxyg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791372441; x=1791977241; darn=lists.freedesktop.org;
 h=content-type:cc:to:subject:message-id:date:from:mime-version:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=tJim+Rw5F8qmwuKnMGlLPQG3sgRGurbEvY1frkjT4os=;
 b=pUPw8UIbCYeOhJNL6aSSuotueFZXiTVJ5dRGdsXNdQqQNjW/Xq777/xiHDo2yllMI7
 GpmQrYTCjW/esdwjzpRc11xYX6wmpU1Km5Zf89vQ8Y4FzdrqAUoqxATozJ3Nq0Vj2uBj
 HYLY3GTL4J5OA1VRXjx6RB+EuqFBo2GOVtXe0SBvV7y4ZI3qT9k+gZWYVDwdJh5PCKTS
 81Hp9Ss8Emi1iiHK1z6HNM8nBXzRFuiFgo5p3cgVlXKfuE8j1wrQ65rthB/ZM7RVcj+x
 r7uolXHIdtCB+IAXB36ANp+emA1uR4JQvEWxJjd/S9PeiiGULx29h0WSMgzo3j1L1j+L
 XCag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791372441; x=1791977241;
 h=content-type:cc:to:subject:message-id:date:from:mime-version
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=tJim+Rw5F8qmwuKnMGlLPQG3sgRGurbEvY1frkjT4os=;
 b=EKi1v+Idukc1M2kMEJ6LDWLgkxIMFtgYW9106ai8pssPR98SVX7Mdi0y5oQSb4OUAH
 PEgH2Szl4zwu+DxHJ9ykh3KU1r4YdBl+puB6DrZxUDXGMgTLu+zUP6iHR72a0UZtjHNW
 TRiFxlQuaevDnZS6zqdd0sBf9Nkg3Vz9ik7nagsQSG6N/fN+jSW/hbOibpA87ARtiPkQ
 vdXkgYLse96+dpBDRVSvNV8mLh5Mt0du7+q0bL8D+iODZ3UPJquCl9CNvNMl1oi9c0uU
 8WXPGyLgM1VvwMe7oREw5FiXC7iRwz1JUFxG45TI+m3TGn6z4cwffP7KLD2MXXxDcDne
 w9Ww==
X-Gm-Message-State: AFq9FYIfS8eHnUQlxoqcpza81iMVEi4/sd/M6BJwSsGLdpnBZr/PfQzC
 I5lzJyThYpSiotrDDX6apMIjBWZ5g8/AAXb/3BGaIRy94BRWBbmpi6jkfNA397gFguHXQPHVuoj
 4HhwQ/7BzZT/9wwb6iwkbm529t9+YT8iWm6aEakQ=
X-Gm-Gg: AYBFou2gFn9oL9qW1/GD5lSZy75YSLtQVMFRuABtvxWxyXG9bsjYK0vMf5qbfvtUGw/
 xAWfXXsLPzlihHwPOjxEUb/ByHwz4eSPCHkPuRjXR+eoCCDB81zzZQT7XV+0QJourrjZ6NO8Tuh
 qtoFPHIS/Kf6ZbwzDtwnP3NKa2mHpuBPZaHkkHgGS35XFYIbsJUO8pDJa/1wiHdr85NsYhAIZI8
 /+KfNvqtWdol839pcG2Dgx6CYuM5tShrFDt2L8qDJYW56uvXf4/ZYfChO+e3OOSJWzhb0dPKu/t
 9pUyRDELe8P2rNccUne9jdUyBUS8iQc9wtMEv4DtnSBFLYFrVW72UIw8s4b8gMh4faiF
X-Received: by 2002:a05:6512:3f2a:b0:5b8:ead0:bfa with SMTP id
 2adb3069b0e04-5bcd0634848mr609842e87.2.1791372440677; Wed, 07 Oct 2026
 04:27:20 -0700 (PDT)
MIME-Version: 1.0
From: Jame Jao <jaojame6@gmail.com>
Date: Wed, 7 Oct 2026 19:27:08 +0800
X-Gm-Features: AclHuK9BrqrLtr9aIpTxb4BW95jBPK4HsPqmLOYdpwLbLTSFUAvs9EbJRfrM_6k
Message-ID: <CAN52AYstOLqaX_=_HBLEGKvcEmY+VGwKSbRRRyQbG4ytr6FD_A@mail.gmail.com>
Subject: Re: [RESEND PATCH 0/5] platform/x86: bitland-mifs-wmi: MIFS v2
 firmware support, Xiaomi Book Pro 14 2026
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, jani.nikula@linux.intel.com, 
 intel-gfx@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="000000000000fcb15d065d3e654e"
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

--000000000000fcb15d065d3e654e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

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

  [    7.10xxxx] xe 0000:00:02.0: [drm] Found pantherlake (device ID b081)
integrated display version 30.00 stepping B0
  [    7.11xxxx] ------------[ cut here ]------------
  [    7.11xxxx] xe 0000:00:02.0: [drm] Port A asks to use VBT
vswing/preemph tables
  [    7.11xxxx] WARNING: drivers/gpu/drm/i915/display/intel_bios.c:2813 at
intel_bios_init+0x17fd/0x1f60 [xe], CPU#1: (udev-worker)/207
  [    7.11xxxx] Modules linked in: xe(+) drm_ttm_helper ttm drm_buddy
i2c_algo_bit drm_suballoc_helper nvme gpu_sched drm_gpuvm nvme_core
drm_exec ...
  [    7.11xxxx] CPU: 1 UID: 0 PID: 207 Comm: (udev-worker) Tainted: G
U   7.2.9-zen1-1.1-zen #1 PREEMPT(full)
  [    7.11xxxx] Hardware name: XIAOMI REDMI Book Pro 14 2026/TM2426, BIOS
RMAPT4B0P0909 05/21/2026
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

Note: the local testing and the preparation of this report were done with
the
assistance of a local AI assistant (DeepSeek Harness WebUI, deepseek-flash
model); every command, log and result quoted above was actually executed on
this machine and reviewed by me.

Eason
1836949523@qq.com

list=EF=BC=88redmibook 14 pro 2026=EF=BC=89display=EF=BC=9A
[    7.113744] RDX: ffff8d974652d290 RSI: fffffffc0c47b38 RDI:
fffffffc0604cb80
[    7.113746] RBP: 0000000000000000 R08: 0000000000000041 R09:
0000000000000000
[    7.113748] R10: 0000000001d4c9 R11: 0000000000000000 R12:
0000000000000041
[    7.113750] R13: 0000000000000001 R14: 0000000000000000 R15:
ffff8d974a3bb240
[    7.113751] FS: 00007f706f7fcc0(0000) GS:ffff8d9f939e0000(0000)
knlGS:0000000000000000
[    7.113754] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    7.113756] CR2: 0000771a22aa8000 CR3: 000000010c3ba004 CR4:
0000000108f70ef0
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
[    7.114638]  xe_init+0x27/0x90 [xe
fe9955369cf4efd202cb08e060d7d8898245273a]
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
[    7.114898] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48
89 f8 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f=
0
ff 73 01 c3 48 8b 0d 73 a2 0f 00 f7 d8 64 89 01 48
[    7.114901] RSP: 002b:00007ffed2945a18 EFLAGS: 00000246 ORIG_RAX:
0000000000000139
[    7.114904] RAX: ffffffffffffffda RBX: 0000563adfc26cf0 RCX:
0000000000000000
[    7.114905] RDX: 0000000000000004 RSI: 0000563adfc26190 RDI:
0000000000000005
[    7.114907] RBP: 00007ffed2945ab0 R08: 0000000000000000 R09:
0000563adfc28010
[    7.114909] R10: 0000000000000000 R11: 00007f705f77fbcc R12:
0000563adfc26190
[    7.114910] R13: 0000000000020000 R14: 0000563adfc197b0 R15:
0000563adfc26cf0
[    7.114912]  </TASK>
[    7.114914] ---[ end trace 0000000000000000 ]---

--000000000000fcb15d065d3e654e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<br><br>I would like to report a WARNING that appear=
s on every boot on a Panther<br>Lake laptop, and that is also visible on sc=
reen (before the desktop comes<br>up) when resuming from hibernation.<br><b=
r>Hardware / software<br>-------------------<br><br>=C2=A0 laptop =C2=A0 =
=C2=A0XIAOMI REDMI Book Pro 14 2026 (board TM2426)<br>=C2=A0 BIOS =C2=A0 =
=C2=A0 =C2=A0RMAPT4B0P0909 (2026-05-21), EC firmware 1.9<br>=C2=A0 GPU =C2=
=A0 =C2=A0 =C2=A0 Intel Panther Lake [Arc B370] [8086:b081] (rev 04)<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xe: &quot;Found pantherlake (device =
ID b081) integrated display<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0version 30.00 stepping B0&quot;<br>=C2=A0 kernel =C2=A0=
 =C2=A07.2.9 (Arch linux-zen packaging: vanilla 7.2.9 + zen patchset<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 + one unrelated local one-file platf=
orm/x86 patch)<br>=C2=A0 xe =C2=A0 =C2=A0 =C2=A0 =C2=A0srcversion BB102CAE6=
B929F8604B5647<br><br>What happens<br>------------<br><br>Every boot, about=
 7.1 s in, while the xe module initializes the display:<br><br>=C2=A0 [ =C2=
=A0 =C2=A07.10xxxx] xe 0000:00:02.0: [drm] Found pantherlake (device ID b08=
1) integrated display version 30.00 stepping B0<br>=C2=A0 [ =C2=A0 =C2=A07.=
11xxxx] ------------[ cut here ]------------<br>=C2=A0 [ =C2=A0 =C2=A07.11x=
xxx] xe 0000:00:02.0: [drm] Port A asks to use VBT vswing/preemph tables<br=
>=C2=A0 [ =C2=A0 =C2=A07.11xxxx] WARNING: drivers/gpu/drm/i915/display/inte=
l_bios.c:2813 at intel_bios_init+0x17fd/0x1f60 [xe], CPU#1: (udev-worker)/2=
07<br>=C2=A0 [ =C2=A0 =C2=A07.11xxxx] Modules linked in: xe(+) drm_ttm_help=
er ttm drm_buddy i2c_algo_bit drm_suballoc_helper nvme gpu_sched drm_gpuvm =
nvme_core drm_exec ...<br>=C2=A0 [ =C2=A0 =C2=A07.11xxxx] CPU: 1 UID: 0 PID=
: 207 Comm: (udev-worker) Tainted: G =C2=A0 =C2=A0 U =C2=A0 7.2.9-zen1-1.1-=
zen #1 PREEMPT(full)<br>=C2=A0 [ =C2=A0 =C2=A07.11xxxx] Hardware name: XIAO=
MI REDMI Book Pro 14 2026/TM2426, BIOS RMAPT4B0P0909 05/21/2026<br>=C2=A0 [=
 =C2=A0 =C2=A07.11xxxx] RIP: 0010:intel_bios_init+0x1806/0x1f60 [xe]<br>=C2=
=A0 [ =C2=A0 =C2=A07.11xxxx] Call Trace:<br>=C2=A0 [ =C2=A0 =C2=A07.11xxxx]=
 =C2=A0&lt;TASK&gt;<br>=C2=A0 [ =C2=A0 =C2=A07.11xxxx] =C2=A0intel_display_=
driver_probe_noirq+0x3b/0x2e0 [xe]<br>=C2=A0 [ =C2=A0 =C2=A07.11xxxx] =C2=
=A0xe_display_init_early+0x8b/0x140 [xe]<br>=C2=A0 [ =C2=A0 =C2=A07.11xxxx]=
 =C2=A0xe_device_probe+0x46d/0xc20 [xe]<br>=C2=A0 [ =C2=A0 =C2=A07.11xxxx] =
=C2=A0xe_pci_probe+0xdf7/0x13d0 [xe]<br>=C2=A0 [ =C2=A0 =C2=A07.11xxxx] =C2=
=A0pci_call_probe+0x9a/0x270<br>=C2=A0 [ =C2=A0 =C2=A07.11xxxx] =C2=A0pci_d=
evice_probe+0xdb/0x180<br>=C2=A0 [ =C2=A0 =C2=A07.11xxxx] =C2=A0really_prob=
e+0xe9/0x440<br>=C2=A0 [ =C2=A0 =C2=A07.11xxxx] =C2=A0__driver_probe_device=
+0x90/0x190<br>=C2=A0 [ =C2=A0 =C2=A07.11xxxx] =C2=A0__driver_attach+0xb3/0=
x370<br>=C2=A0 [ =C2=A0 =C2=A07.11xxxx] =C2=A0bus_for_each_dev+0x12f/0x1d0<=
br>=C2=A0 [ =C2=A0 =C2=A07.11xxxx] =C2=A0bus_add_driver+0x153/0x310<br>=C2=
=A0 [ =C2=A0 =C2=A07.11xxxx] =C2=A0driver_register+0x75/0xe0<br>=C2=A0 [ =
=C2=A0 =C2=A07.11xxxx] =C2=A0xe_init+0x27/0x90 [xe]<br>=C2=A0 [ =C2=A0 =C2=
=A07.11xxxx] =C2=A0? __pfx_init_module+0x10/0x10 [xe]<br>=C2=A0 [ =C2=A0 =
=C2=A07.11xxxx] =C2=A0do_one_initcall+0x8e/0x3d0<br>=C2=A0 [ =C2=A0 =C2=A07=
.11xxxx] =C2=A0do_init_module+0x6a/0x2b0<br>=C2=A0 [ =C2=A0 =C2=A07.11xxxx]=
 =C2=A0init_module_from_file+0xc8/0x180<br>=C2=A0 [ =C2=A0 =C2=A07.11xxxx] =
=C2=A0idempotent_init_module+0x23e/0x360<br>=C2=A0 [ =C2=A0 =C2=A07.11xxxx]=
 =C2=A0__x64_sys_finit_module+0x7f/0x110<br>=C2=A0 [ =C2=A0 =C2=A07.11xxxx]=
 =C2=A0do_syscall_64+0xaa/0x660<br>=C2=A0 [ =C2=A0 =C2=A07.11xxxx] =C2=A0en=
try_SYSCALL_64_after_hwframe+0x4b/0x53<br>=C2=A0 [ =C2=A0 =C2=A07.11xxxx] -=
--[ end trace 0000000000000000 ]---<br><br>which is exactly the check at in=
tel_bios.c:2813:<br><br>=C2=A0 /*<br>=C2=A0 =C2=A0* FIXME need to implement=
 support for VBT<br>=C2=A0 =C2=A0* vswing/preemph tables should this ever t=
rigger.<br>=C2=A0 =C2=A0*/<br>=C2=A0 drm_WARN(display-&gt;drm, child-&gt;us=
e_vbt_vswing,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Port %c ask=
s to use VBT vswing/preemph tables\n&quot;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0port_name(port));<br><br>So the VBT of this machine sets use_v=
bt_vswing for DDI port A.<br><br>Impact here<br>-----------<br><br>The disp=
lay works normally (eDP panel comes up, external output over USB-C<br>works=
, no visible corruption), so for me this is a warning and not a<br>function=
al failure. Two reasons I still wanted to report it:<br><br>=C2=A0 - it dum=
ps a full backtrace on every boot, which looks alarming in dmesg;<br>=C2=A0=
 - after resume from hibernation the console output stays on screen until<b=
r>=C2=A0 =C2=A0 the display driver takes over, so this warning is what the =
user actually<br>=C2=A0 =C2=A0 sees (&quot;a long line with a register dump=
&quot;) before the desktop comes back.<br>=C2=A0 =C2=A0 It is not hibernati=
on-specific: a plain cold boot shows it too.<br><br>Questions<br>---------<=
br><br>=C2=A0 - Is this expected for this VBT, i.e. should the OEM VBT not =
set<br>=C2=A0 =C2=A0 use_vbt_vswing for port A at all?<br>=C2=A0 - Is suppo=
rt for the VBT vswing/preemph tables planned, or would it make<br>=C2=A0 =
=C2=A0 sense to downgrade/ignore the warning for this case (e.g. when the D=
P<br>=C2=A0 =C2=A0 link is working fine)?<br>=C2=A0 - Is there any informat=
ion from the VBT you would like me to extract?<br><br>I can provide<br>----=
---------<br><br>=C2=A0 - full dmesg / journalctl -k output for a cold boot=
 and for a<br>=C2=A0 =C2=A0 hibernation/resume cycle;<br>=C2=A0 - acpidump =
output;<br>=C2=A0 - the VBT binary (please tell me the preferred way to ext=
ract it from this<br>=C2=A0 =C2=A0 platform - e.g. the intel-gpu-tools VBT/=
opregion decoders - and I will<br>=C2=A0 =C2=A0 attach it);<br>=C2=A0 - a b=
oot with drm.debug=3D0xe, or any other debug options you want;<br>=C2=A0 - =
testing of patches, including on mainline, since I can build kernels<br>=C2=
=A0 =C2=A0 locally for this machine.<br><br>Thanks a lot for your work on x=
e.<br><br>Note: the local testing and the preparation of this report were d=
one with the<br>assistance of a local AI assistant (DeepSeek Harness WebUI,=
 deepseek-flash<br>model); every command, log and result quoted above was a=
ctually executed on<br>this machine and reviewed by me.<br><br>Eason<br><a =
href=3D"mailto:1836949523@qq.com">1836949523@qq.com</a><br><br>list=EF=BC=
=88redmibook 14 pro 2026=EF=BC=89display=EF=BC=9A<br>[ =C2=A0 =C2=A07.11374=
4] RDX: ffff8d974652d290 RSI: fffffffc0c47b38 RDI: fffffffc0604cb80<br>[ =
=C2=A0 =C2=A07.113746] RBP: 0000000000000000 R08: 0000000000000041 R09: 000=
0000000000000<br>[ =C2=A0 =C2=A07.113748] R10: 0000000001d4c9 R11: 00000000=
00000000 R12: 0000000000000041<br>[ =C2=A0 =C2=A07.113750] R13: 00000000000=
00001 R14: 0000000000000000 R15: ffff8d974a3bb240<br>[ =C2=A0 =C2=A07.11375=
1] FS: 00007f706f7fcc0(0000) GS:ffff8d9f939e0000(0000) knlGS:00000000000000=
00<br>[ =C2=A0 =C2=A07.113754] CS: =C2=A00010 DS: 0000 ES: 0000 CR0: 000000=
0080050033<br>[ =C2=A0 =C2=A07.113756] CR2: 0000771a22aa8000 CR3: 000000010=
c3ba004 CR4: 0000000108f70ef0<br>[ =C2=A0 =C2=A07.113758] PKRU: 55555554<br=
>[ =C2=A0 =C2=A07.113759] Call Trace:<br>[ =C2=A0 =C2=A07.113761] =C2=A0&lt=
;TASK&gt;<br>[ =C2=A0 =C2=A07.113764] =C2=A0intel_display_driver_probe_noir=
q+0x3b/0x2e0 [xe fe9955369cf4efd202cb08e060d7d8898245273a]<br>[ =C2=A0 =C2=
=A07.113959] =C2=A0xe_display_init_early+0xb0/0x140 [xe fe9955369cf4efd202c=
b08e060d7d8898245273a]<br>[ =C2=A0 =C2=A07.114142] =C2=A0xe_device_probe+0x=
45d/0xc20 [xe fe9955369cf4efd202cb08e060d7d8898245273a]<br>[ =C2=A0 =C2=A07=
.114283] =C2=A0xe_pci_probe+0xd7f/0x13d0 [xe fe9955369cf4efd202cb08e060d7d8=
898245273a]<br>[ =C2=A0 =C2=A07.114461] =C2=A0pci_call_probe+0x9a/0x270<br>=
[ =C2=A0 =C2=A07.114468] =C2=A0? pci_match_device+0x1b7/0x200<br>[ =C2=A0 =
=C2=A07.114472] =C2=A0pci_device_probe+0xb0b/0x180<br>[ =C2=A0 =C2=A07.1144=
76] =C2=A0really_probe+0xe9/0x440<br>[ =C2=A0 =C2=A07.114480] =C2=A0? __pm_=
runtime_resume+0x5f/0x90<br>[ =C2=A0 =C2=A07.114483] =C2=A0? __pfx__driver_=
attach+0x10/0x10<br>[ =C2=A0 =C2=A07.114486] =C2=A0__driver_probe_device+0x=
90/0x190<br>[ =C2=A0 =C2=A07.114488] =C2=A0driver_attach+0xb3/0x370<br>[ =
=C2=A0 =C2=A07.114491] =C2=A0bus_for_each_dev+0x12f/0x1d0<br>[ =C2=A0 =C2=
=A07.114495] =C2=A0bus_add_driver+0x153/0x310<br>[ =C2=A0 =C2=A07.114500] =
=C2=A0? __pfx_init_module+0x10/0x10 [xe fe9955369cf4efd202cb08e060d7d889824=
5273a]<br>[ =C2=A0 =C2=A07.114635] =C2=A0driver_register+0x75/0xe0<br>[ =C2=
=A0 =C2=A07.114638] =C2=A0xe_init+0x27/0x90 [xe fe9955369cf4efd202cb08e060d=
7d8898245273a]<br>[ =C2=A0 =C2=A07.114751] =C2=A0? __pfx_init_module+0x10/0=
x10 [xe fe9955369cf4efd202cb08e060d7d8898245273a]<br>[ =C2=A0 =C2=A07.11485=
6] =C2=A0do_one_initcall+0xbe/0x3d0<br>[ =C2=A0 =C2=A07.114862] =C2=A0do_in=
it_module+0x6a/0x280<br>[ =C2=A0 =C2=A07.114865] =C2=A0init_module_from_fil=
e+0xc8/0x180<br>[ =C2=A0 =C2=A07.114870] =C2=A0idempotent_init_module+0x23e=
/0x360<br>[ =C2=A0 =C2=A07.114874] =C2=A0__x64_sys_finit_module+0x7f/0x110<=
br>[ =C2=A0 =C2=A07.114877] =C2=A0do_syscall_64+0xaa/0x660<br>[ =C2=A0 =C2=
=A07.114881] =C2=A0? do_syscall_64+0x5f/0x660<br>[ =C2=A0 =C2=A07.114884] =
=C2=A0? irqentry_exit+0x354/0x7b0<br>[ =C2=A0 =C2=A07.114888] =C2=A0? fred_=
sysvec_reschedule_ipi+0x1d/0xf0<br>[ =C2=A0 =C2=A07.114891] =C2=A0asm_fred_=
entrypoint_user+0x41/0x41<br>[ =C2=A0 =C2=A07.114895] RIP: 0033:0x7f705f91b=
4cd<br>[ =C2=A0 =C2=A07.114898] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 9=
0 f3 0f 1e fa 48 89 f8 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0=
f 05 &lt;48&gt; 3d 01 f0<br>ff 73 01 c3 48 8b 0d 73 a2 0f 00 f7 d8 64 89 01=
 48<br>[ =C2=A0 =C2=A07.114901] RSP: 002b:00007ffed2945a18 EFLAGS: 00000246=
 ORIG_RAX: 0000000000000139<br>[ =C2=A0 =C2=A07.114904] RAX: ffffffffffffff=
da RBX: 0000563adfc26cf0 RCX: 0000000000000000<br>[ =C2=A0 =C2=A07.114905] =
RDX: 0000000000000004 RSI: 0000563adfc26190 RDI: 0000000000000005<br>[ =C2=
=A0 =C2=A07.114907] RBP: 00007ffed2945ab0 R08: 0000000000000000 R09: 000056=
3adfc28010<br>[ =C2=A0 =C2=A07.114909] R10: 0000000000000000 R11: 00007f705=
f77fbcc R12: 0000563adfc26190<br>[ =C2=A0 =C2=A07.114910] R13: 000000000002=
0000 R14: 0000563adfc197b0 R15: 0000563adfc26cf0<br>[ =C2=A0 =C2=A07.114912=
] =C2=A0&lt;/TASK&gt;<br>[ =C2=A0 =C2=A07.114914] ---[ end trace 0000000000=
000000 ]---<br><br></div>

--000000000000fcb15d065d3e654e--
