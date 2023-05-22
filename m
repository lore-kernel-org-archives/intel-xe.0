Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 556BAC77B73
	for <intel-xe@archiver.kernel.org>; Mon, 22 May 2023 04:39:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8CF710E242;
	Mon, 22 May 2023 04:39:42 +0000 (UTC)
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7E6010E242
 for <intel-xe@lists.freedesktop.org>; Mon, 22 May 2023 04:39:41 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id
 5614622812f47-38eda4ef362so3299030b6e.2
 for <intel-xe@lists.freedesktop.org>; Sun, 21 May 2023 21:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684730380; x=1687322380;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gLi4LxNoPx1X9MSBC4L25upgct4+5VpjEeYgx34MbVU=;
 b=EwH9V6IXQxP0q+ODXXqtpbmJAigB1hTaMbGxxri38cxOT8tiMvMEU5NyXl+Kxa74Cl
 f/UOs3G1DyY3HOHuOPUgU2w6/P6NnC+Rv3/9MypffTmnq/u1BAzrIS5M/8hWQrD8xhLi
 Nr4Z6io/mTgPAQ2Ag/UYR9HVv6KXUUm0f28NXePlko5kgRt5vyE7OsTtEhPb6H16ixrk
 0IAnKbcKP2LqVuh9BODocEwvUD4AKbum7anriUP7eLge7FD/7axWtUy4B2/+2fXp5Xzh
 biKqvFwp/XLz8OjN+b7UhfLgLj7XYLsd8XpOuRZYgnLaQVAyDy/gq8b5grzPc57sTS+A
 Yxtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684730380; x=1687322380;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gLi4LxNoPx1X9MSBC4L25upgct4+5VpjEeYgx34MbVU=;
 b=XuHowHPBiCTwgS7tp74ZgUZfDR8ke3JZAl1gQV+Xmdd1dV/0cOvgWf0izNR9E9NtLa
 Pd8uOraHeXtLcUY6u06Xzn2VdG0Dt5E8uqiXoXf2lxYIYXtxQeFPG2QM4Tuv1wAWPXjd
 NreaKFW2C1KZOu/QsLQvkXJvFdJ0eycJNcN2dx+VL67G9k5yoIP2im7NKySVSfNafiYM
 QKf7myg2tIInwphK5mq0tFAn9tkJgN7nF/Skxr/wMf+LyWhau5yTEzxj2kJhEHluw2Zh
 449YpyqToeVthg62incdSQXQEZTs5iqej15lQk0DB72DTCENQf71TtJWhAnhcogGH16v
 zkHA==
X-Gm-Message-State: AC+VfDxNZ42B3PJntHGlau1L1rXt8/we4vfPQ/W6NVTT2KutfabJ9kB4
 RB9DtgfdsxoeXlOQe2nzrI/vCUzK2CchegOQyMwMEjtV2sg=
X-Google-Smtp-Source: ACHHUZ4zEg7aC3IRIqAHDB0siyhIHQR/NRS0mijB9eipGv/gUxmwHV8o3WaK1pgXRvVpEtZ/Br7AGXxUjxq9Tf7YXp8=
X-Received: by 2002:a05:6808:7d9:b0:396:fc6:ef8f with SMTP id
 f25-20020a05680807d900b003960fc6ef8fmr4589959oij.59.1684730380429; Sun, 21
 May 2023 21:39:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230522015040.3849776-1-matthew.brost@intel.com>
In-Reply-To: <20230522015040.3849776-1-matthew.brost@intel.com>
From: Christopher Snowhill <kode54@gmail.com>
Date: Sun, 21 May 2023 21:39:29 -0700
Message-ID: <CA+aRtuY_4Pq7JmpyvE96s6TS7ey=iTG_seF9Jhr6j+5LJBPG_w@mail.gmail.com>
To: Matthew Brost <matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH 0/8] Scheduler changes for upstreaming
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Sun, May 21, 2023 at 6:50=E2=80=AFPM Matthew Brost <matthew.brost@intel.=
com> wrote:
>
> First 8 patches of the follow series /w comments addressed:
> https://patchwork.freedesktop.org/series/117156/
>
> A follow up with submit a GuC doorbell series and a GPUVA series.

Somehow, this patch series fails for me with CONFIG_DRM_XE_DISPLAY=3Dy,
on initializing the display, with a kernel bug due to null pointer
dereference.

May 21 21:33:21 mrgency kernel: BUG: kernel NULL pointer dereference,
address: 0000000000000138
May 21 21:33:21 mrgency kernel: #PF: supervisor write access in kernel mode
May 21 21:33:21 mrgency kernel: #PF: error_code(0x0002) - not-present page
May 21 21:33:21 mrgency kernel: PGD 0 P4D 0
May 21 21:33:21 mrgency kernel: Oops: 0002 [#1] PREEMPT SMP NOPTI
May 21 21:33:21 mrgency kernel: CPU: 11 PID: 2154 Comm: (udev-worker)
Tainted: P           OE
6.3.0-1-drm-xe-next-git-g383c5ce3a443-dirty #1
b24caf80fd67830e41ffc6ebbfe686bf240451cd
May 21 21:33:21 mrgency kernel: Hardware name: Micro-Star
International Co., Ltd MS-7C02/B450 TOMAHAWK (MS-7C02), BIOS 1.I0
07/25/2022
May 21 21:33:21 mrgency kernel: RIP: 0010:drm_sched_job_arm+0x31/0x90
[gpu_sched]
May 21 21:33:21 mrgency kernel: Code: 00 00 55 53 48 8b 6f 58 48 8b 45
18 48 85 ed 74 6c 48 89 fb 48 89 ef 48 85 c0 74 2e e8 98 33 00 00 48
89 43 18 ba 01 00 00 00 <f0> 48 0f c1 90 38 01 00 00 48 83 c2 01 48 8b
73 58 48 8b 7b 20 48
May 21 21:33:21 mrgency kernel: RSP: 0018:ffff9907c3923a90 EFLAGS: 00010a93
May 21 21:33:21 mrgency kernel: RAX: 0000000000000000 RBX:
ffff8b91e3bbf800 RCX: 6db6db6db6db6db7
May 21 21:33:21 mrgency kernel: RDX: 0000000000000001 RSI:
ffff9907c3923a98 RDI: ffff8b91ce1e5208
May 21 21:33:21 mrgency kernel: RBP: ffff8b91ce1e5208 R08:
00000000ffffff81 R09: ffff8b91f5694680
May 21 21:33:21 mrgency kernel: R10: 000000000003ac80 R11:
ffff8b98ff37b000 R12: 0000000000000008
May 21 21:33:21 mrgency kernel: R13: ffff8b91e3bbf800 R14:
ffff8b91ee063308 R15: ffff8b91ee0611a0
May 21 21:33:21 mrgency kernel: FS:  00007f2e12630140(0000)
GS:ffff8b98decc0000(0000) knlGS:0000000000000000
May 21 21:33:21 mrgency kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
May 21 21:33:21 mrgency kernel: CR2: 0000000000000138 CR3:
0000000117c7e000 CR4: 00000000003506e0
May 21 21:33:21 mrgency kernel: Call Trace:
May 21 21:33:21 mrgency kernel:  <TASK>
May 21 21:33:21 mrgency kernel:  xe_gt_record_default_lrcs+0x20c/0x6c0
[xe 57541513fa5b289cc38266676905e9768b2732be]
May 21 21:33:21 mrgency kernel:  xe_uc_init_hw+0x92/0xf0 [xe
57541513fa5b289cc38266676905e9768b2732be]
May 21 21:33:21 mrgency kernel:  xe_gt_init+0x29a/0x380 [xe
57541513fa5b289cc38266676905e9768b2732be]
May 21 21:33:21 mrgency kernel:  xe_device_probe+0x244/0x2c0 [xe
57541513fa5b289cc38266676905e9768b2732be]
May 21 21:33:21 mrgency kernel:  xe_pci_probe+0x4d7/0x7e0 [xe
57541513fa5b289cc38266676905e9768b2732be]
May 21 21:33:21 mrgency kernel:  local_pci_probe+0x42/0xa0
May 21 21:33:21 mrgency kernel:  pci_device_probe+0xc1/0x260
May 21 21:33:21 mrgency kernel:  ? sysfs_do_create_link_sd+0x6e/0xe0
May 21 21:33:21 mrgency kernel:  really_probe+0x19b/0x3e0
May 21 21:33:21 mrgency kernel:  ? __pfx___driver_attach+0x10/0x10
May 21 21:33:21 mrgency kernel:  __driver_probe_device+0x78/0x160
May 21 21:33:21 mrgency kernel:  driver_probe_device+0x1f/0x90
May 21 21:33:21 mrgency kernel:  __driver_attach+0xd2/0x1c0
May 21 21:33:21 mrgency kernel:  bus_for_each_dev+0x85/0xd0
May 21 21:33:21 mrgency kernel:  bus_add_driver+0x116/0x220
May 21 21:33:21 mrgency kernel:  driver_register+0x59/0x100
May 21 21:33:21 mrgency kernel:  ? __pfx_init_module+0x10/0x10 [xe
57541513fa5b289cc38266676905e9768b2732be]
May 21 21:33:21 mrgency kernel:  xe_init+0x25/0x70 [xe
57541513fa5b289cc38266676905e9768b2732be]
May 21 21:33:21 mrgency kernel:  ? __pfx_init_module+0x10/0x10 [xe
57541513fa5b289cc38266676905e9768b2732be]
May 21 21:33:21 mrgency kernel:  ? __pfx_init_module+0x10/0x10 [xe
57541513fa5b289cc38266676905e9768b2732be]
May 21 21:33:21 mrgency kernel:  do_one_initcall+0x5a/0x240
May 21 21:33:21 mrgency kernel:  do_init_module+0x4a/0x200
May 21 21:33:21 mrgency kernel:  __do_sys_init_module+0x17f/0x1b0
May 21 21:33:21 mrgency kernel:  do_syscall_64+0x5d/0x90
May 21 21:33:21 mrgency kernel:  entry_SYSCALL_64_after_hwframe+0x72/0xdc
May 21 21:33:21 mrgency kernel: RIP: 0033:0x7f2e13023f9e
May 21 21:33:21 mrgency kernel: Code: 48 8b 0d bd ed 0c 00 f7 d8 64 89
01 48 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 49 89
ca b8 af 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 8a ed 0c
00 f7 d8 64 89 01 48
May 21 21:33:21 mrgency kernel: RSP: 002b:00007ffe4ba9e158 EFLAGS:
00000246 ORIG_RAX: 00000000000000af
May 21 21:33:21 mrgency kernel: RAX: ffffffffffffffda RBX:
000055dfe9060ca0 RCX: 00007f2e13023f9e
May 21 21:33:21 mrgency kernel: RDX: 00007f2e13173343 RSI:
000000000043db10 RDI: 00007f2e10b36010
May 21 21:33:21 mrgency kernel: RBP: 00007f2e13173343 R08:
0000000000261000 R09: 0000000000000000
May 21 21:33:21 mrgency kernel: R10: 000000000000ede1 R11:
0000000000000246 R12: 0000000000020000
May 21 21:33:21 mrgency kernel: R13: 000055dfe905efa0 R14:
000055dfe9060ca0 R15: 000055dfe905fba0
May 21 21:33:21 mrgency kernel:  </TASK>
May 21 21:33:21 mrgency kernel: Modules linked in: vfat fat
snd_hda_codec_realtek snd_hda_codec_generic xe(+) ledtrig_audio
snd_hda_intel uvcvideo snd_intel_dspcfg videobuf2_vmalloc drm_buddy
snd_intel_sdw_acpi snd_usb_audio intel_rapl_msr uvc gpu_sched btusb
intel_rapl_common snd_hda_codec videobuf2_memops video btrtl
snd_usbmidi_lib snd_hda_core edac_mce_amd i2c_algo_bit btbcm
videobuf2_v4l2 snd_rawmidi snd_hwdep btintel drm_suballoc_helper
snd_seq_device drm_ttm_helper kvm_amd btmtk ttm bluetooth videodev
snd_pcm kvm drm_display_helper ecdh_generic videobuf2_common snd_timer
apple_mfi_fastcharge mousedev crc16 irqbypass mc snd wmi_bmof cec
pcspkr soundcore k10temp i2c_piix4 bridge rapl stp llc gpio_amdpt
gpio_generic acpi_cpufreq mac_hid cfg80211 rfkill uinput i2c_dev loop
fuse ip_tables x_tables hid_logitech_hidpp hid_logitech_dj hid_apple
usbhid zfs(POE) crct10dif_pclmul crc32_pclmul polyval_clmulni
polyval_generic gf128mul ghash_clmulni_intel r8169 sha512_ssse3
spl(OE) realtek aesni_intel nvme mdio_devres crypto_simd cryptd ccp
May 21 21:33:21 mrgency kernel:  sp5100_tco libphy nvme_core xhci_pci
xhci_pci_renesas nvme_common wmi btrfs blake2b_generic xor raid6_pq
libcrc32c crc32c_generic crc32c_intel dm_mirror dm_region_hash dm_log
pkcs8_key_parser sg dm_multipath vhba(OE) crypto_user dm_mod
May 21 21:33:21 mrgency kernel: CR2: 0000000000000138
May 21 21:33:21 mrgency kernel: ---[ end trace 0000000000000000 ]---
May 21 21:33:21 mrgency kernel: RIP: 0010:drm_sched_job_arm+0x31/0x90
[gpu_sched]
May 21 21:33:21 mrgency kernel: Code: 00 00 55 53 48 8b 6f 58 48 8b 45
18 48 85 ed 74 6c 48 89 fb 48 89 ef 48 85 c0 74 2e e8 98 33 00 00 48
89 43 18 ba 01 00 00 00 <f0> 48 0f c1 90 38 01 00 00 48 83 c2 01 48 8b
73 58 48 8b 7b 20 48
May 21 21:33:21 mrgency kernel: RSP: 0018:ffff9907c3923a90 EFLAGS: 00010a93
May 21 21:33:21 mrgency kernel: RAX: 0000000000000000 RBX:
ffff8b91e3bbf800 RCX: 6db6db6db6db6db7
May 21 21:33:21 mrgency kernel: RDX: 0000000000000001 RSI:
ffff9907c3923a98 RDI: ffff8b91ce1e5208
May 21 21:33:21 mrgency kernel: RBP: ffff8b91ce1e5208 R08:
00000000ffffff81 R09: ffff8b91f5694680
May 21 21:33:21 mrgency kernel: R10: 000000000003ac80 R11:
ffff8b98ff37b000 R12: 0000000000000008
May 21 21:33:21 mrgency kernel: R13: ffff8b91e3bbf800 R14:
ffff8b91ee063308 R15: ffff8b91ee0611a0
May 21 21:33:21 mrgency kernel: FS:  00007f2e12630140(0000)
GS:ffff8b98decc0000(0000) knlGS:0000000000000000
May 21 21:33:21 mrgency kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
May 21 21:33:21 mrgency kernel: CR2: 0000000000000138 CR3:
0000000117c7e000 CR4: 00000000003506e0
May 21 21:33:21 mrgency kernel: note: (udev-worker)[2154] exited with
irqs disabled




>
> Matthew Brost (8):
>   fixup! drm/sched: Convert drm scheduler to use a work queue rather
>     than kthread
>   drm/sched: Move schedule policy to scheduler
>   drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY scheduling policy
>   drm/xe: Use DRM_SCHED_POLICY_SINGLE_ENTITY mode
>   drm/xe: Long running job update
>   drm/xe: Ensure LR engines are not persistent
>   drm/xe: Only try to lock external BOs in VM bind
>   drm/xe: VM LRU bulk move
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  3 +-
>  drivers/gpu/drm/etnaviv/etnaviv_sched.c    |  5 +-
>  drivers/gpu/drm/lima/lima_sched.c          |  5 +-
>  drivers/gpu/drm/msm/msm_ringbuffer.c       |  5 +-
>  drivers/gpu/drm/panfrost/panfrost_job.c    |  5 +-
>  drivers/gpu/drm/scheduler/sched_entity.c   | 62 +++++++++++---
>  drivers/gpu/drm/scheduler/sched_fence.c    |  2 +-
>  drivers/gpu/drm/scheduler/sched_main.c     | 88 ++++++++++++++++---
>  drivers/gpu/drm/v3d/v3d_sched.c            | 25 +++---
>  drivers/gpu/drm/xe/xe_bo.c                 | 32 ++++++-
>  drivers/gpu/drm/xe/xe_bo.h                 |  4 +-
>  drivers/gpu/drm/xe/xe_devcoredump_types.h  |  1 +
>  drivers/gpu/drm/xe/xe_dma_buf.c            |  2 +-
>  drivers/gpu/drm/xe/xe_engine.c             | 36 +++++++-
>  drivers/gpu/drm/xe/xe_engine.h             |  4 +
>  drivers/gpu/drm/xe/xe_exec.c               | 14 +++
>  drivers/gpu/drm/xe/xe_execlist.c           |  3 +-
>  drivers/gpu/drm/xe/xe_guc_engine_types.h   |  2 +
>  drivers/gpu/drm/xe/xe_guc_submit.c         | 99 +++++++++++++++++++---
>  drivers/gpu/drm/xe/xe_trace.h              |  5 ++
>  drivers/gpu/drm/xe/xe_vm.c                 | 12 ++-
>  drivers/gpu/drm/xe/xe_vm_types.h           |  3 +
>  include/drm/gpu_scheduler.h                | 29 +++++--
>  23 files changed, 371 insertions(+), 75 deletions(-)
>
> --
> 2.34.1
>
