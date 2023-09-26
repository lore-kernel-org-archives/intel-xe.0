Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFA19E81815
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 03:25:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B096110E34A;
	Tue, 26 Sep 2023 03:25:30 +0000 (UTC)
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B29F610E34A
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 03:25:28 +0000 (UTC)
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-57bb3872ff4so2125013eaf.0
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Sep 2023 20:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695698728; x=1696303528; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GCuExALM8rC0A6/FeAeys2MRFbqjxKsTGCZE3o/3ols=;
 b=Y+iwTh/A/znAbUhkHw3eaXc7Lr9aBn1BT37Qc+Yea6JF0OFzp93D3KaR270v8LWSVt
 nTNK3FOGkp6vd2KBLxcbZy1r7+L85JjgW8ETkGm7p4q0qaPb421+PKEVWKmzxPWClj+s
 Q2YmqvQaRRzFER/1vKf8FYsiMpVi6rLgE3Y33tJSWy3dVhtO1YMUFn+wfTLZNeCDVzz4
 PxH2ejmqPzGgRaRc9EmNd03Ct3b/Sins71UiTEReT2NVEasIf0E/bZ5bw8+/YENThUud
 xmuZ6fb2BAXPED7wDuN4x6idRrJe+seDUc7D4ATC1ObyctjWZgn7Epi8JyLhZVBPIvgV
 rDNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695698728; x=1696303528;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GCuExALM8rC0A6/FeAeys2MRFbqjxKsTGCZE3o/3ols=;
 b=hYH9xn3GMX33qfikeOVI437T9qPTQt24oi/lGggg2EIS15BH4dSYef5wntJzr7XPiR
 /iXMdreZ9+ey0efvLNGLNbl4A0TEGzW9TC1RrXHeG+B2JYkA4emY6CCVfCLcK7ItRHdb
 NaW3ymLy9JQOZOkNgjzq53aQo7O97QsF54IBXHbeOpcV1IJqsPYRJCai33wsaEsPozLH
 GIYpaVWEMs83CYQhAVxrV0vkjMyJknxOFEFVHgTg90BRMxJAekFEgyrR138jdg2skZNB
 TG7qbq4MYwBVxwHyGZPERm32ULbS9j1JvRd0tqQKXKO5tZNFQdSepbdudfzBxYQfHhWJ
 H5Bw==
X-Gm-Message-State: AOJu0Ywan+eRme04iDDKF7Rw+Ec86NvZDKCaUSbE1K1NoyzRS9grhHo3
 prYHmmxIhI5GVsQoy0c1MVH4Um5QbUsLG2hJLAKysbw6fBMzaA==
X-Google-Smtp-Source: AGHT+IGzg7vnoZrsHnPB2g8TpbUGsQdjQ6nz8rrc9ULoTAOhdvq/07d4E4zx5EKnvV7Z3vPg0C4/hpGr087pv8gGD5I=
X-Received: by 2002:a4a:9b0b:0:b0:56c:a41c:f264 with SMTP id
 a11-20020a4a9b0b000000b0056ca41cf264mr8050847ook.8.1695698727453; Mon, 25 Sep
 2023 20:25:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230924200226.3940-1-dev@lankhorst.se>
 <ad9397868a9d3988896182f0e37eceba3aa3963b.camel@intel.com>
In-Reply-To: <ad9397868a9d3988896182f0e37eceba3aa3963b.camel@intel.com>
From: Christopher Snowhill <kode54@gmail.com>
Date: Mon, 25 Sep 2023 20:25:16 -0700
Message-ID: <CA+aRtuarm5ANHANkbopf7F97N4b4YoUw-aqNCe1um1LAZKjYjA@mail.gmail.com>
To: "Souza, Jose" <jose.souza@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [RFC] drm/xe: Add VM snapshot support
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
Cc: "dev@lankhorst.se" <dev@lankhorst.se>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Sep 25, 2023 at 7:36=E2=80=AFAM Souza, Jose <jose.souza@intel.com> =
wrote:
>
> On Sun, 2023-09-24 at 22:02 +0200, Maarten Lankhorst wrote:
> > Just an idea I had so far. Some opens:
> > - Do we want to set a flag on a VM_BIND or on a BO to choose what to
> >   snapshot? Likely VM_BIND.
>
> +1 vote for vm_bind otherwise we miss external and userptr BOs in the sna=
pshot.

Not sure how useful this is, but I attempted to use this dumper on a
GuC hang, and the dump function crashed with a NULL pointer
dereference.

[   43.520440] xe 0000:28:00.0: [drm] Timedout job: seqno=3D4294967169,
guc_id=3D106, flags=3D0x8
[   43.520520] *ERROR*
               H2G CTB (all sizes in DW):
[   43.520527] *ERROR*      size: 1024
[   43.520530] *ERROR*      resv_space: 0
[   43.520533] *ERROR*      head: 857
[   43.520536] *ERROR*      tail: 490
[   43.520538] *ERROR*      space: 366
[   43.520541] *ERROR*      broken: 0
[   43.520543] *ERROR*      head (memory): 490
[   43.520545] *ERROR*      tail (memory): 490
[   43.520548] *ERROR*      status (memory): 0x0
[   43.520550] *ERROR*
               G2H CTB (all sizes in DW):
[   43.520552] *ERROR*      size: 4096
[   43.520555] *ERROR*      resv_space: 1024
[   43.520557] *ERROR*      head: 2689
[   43.520559] *ERROR*      tail: 0
[   43.520562] *ERROR*      space: 3071
[   43.520564] *ERROR*      broken: 0
[   43.520566] *ERROR*      head (memory): 2689
[   43.520568] *ERROR*      tail (memory): 2689
[   43.520570] *ERROR*      status (memory): 0x0
[   43.520573] *ERROR*      g2h outstanding: 0
[   43.520585] *ERROR*
               GuC ID: 106
[   43.520588] *ERROR*      Name: rcs106
[   43.520590] *ERROR*      Class: 0
[   43.520592] *ERROR*      Logical mask: 0x1
[   43.520594] *ERROR*      Width: 1
[   43.520596] *ERROR*      Ref: 1
[   43.520598] *ERROR*      Timeout: 1 (ms)
[   43.520601] *ERROR*      Timeslice: 1000 (us)
[   43.520603] *ERROR*      Preempt timeout: 640000 (us)
[   43.520606] *ERROR*      HW Context Desc: 0x03c54000
[   43.520608] *ERROR*      LRC Head: (memory) 0
[   43.520611] *ERROR*      LRC Tail: (internal) 128, (memory) 128
[   43.520614] *ERROR*      Start seqno: (memory) -128
[   43.520617] *ERROR*      Seqno: (memory) -128
[   43.520619] *ERROR*      Schedule State: 0x83
[   43.520621] *ERROR*      Flags: 0x8
[   43.520664] *ERROR*  rcs0 (physical), logical instance=3D0
[   43.520667] *ERROR*      Forcewake: domain 0x2, ref 1
[   43.520670] *ERROR*      HWSTAM: 0xffffffff
[   43.520672] *ERROR*      RING_HWS_PGA: 0x01100000
[   43.520674] *ERROR*      RING_EXECLIST_STATUS_LO: 0x4000309c
[   43.520677] *ERROR*      RING_EXECLIST_STATUS_HI: 0x00003480
[   43.520680] *ERROR*      RING_EXECLIST_SQ_CONTENTS_LO: 0x03c34119
[   43.520682] *ERROR*      RING_EXECLIST_SQ_CONTENTS_HI: 0x00003480
[   43.520685] *ERROR*      RING_EXECLIST_CONTROL: 0x00000000
[   43.520688] *ERROR*      RING_START: 0x03c30000
[   43.520690] *ERROR*      RING_HEAD:  0x00000044
[   43.520693] *ERROR*      RING_TAIL:  0x00000080
[   43.520695] *ERROR*      RING_CTL: 0x00003001
[   43.520698] *ERROR*      RING_MODE: 0x00001000
[   43.520700] *ERROR*      RING_MODE: 0x00000008
[   43.520702] *ERROR*      RING_IMR:   0x00000000
[   43.520705] *ERROR*      RING_ESR:   0x00000000
[   43.520707] *ERROR*      RING_EMR:   0xffffffff
[   43.520709] *ERROR*      RING_EIR:   0x00000000
[   43.520711] *ERROR*      ACTHD:  0x0000fffe_fffb0598
[   43.520714] *ERROR*      BBADDR: 0x0000fffe_fffb0599
[   43.520717] *ERROR*      DMA_FADDR: 0x00000000_03c30080
[   43.520720] *ERROR*      IPEIR: 0x00000000
[   43.520722] *ERROR*      IPEHR: 0x00000000
[   43.520727] *ERROR*   VM root: A:0x17d0d000 VRAM
[   43.520856] BUG: kernel NULL pointer dereference, address: 0000000000000=
000
[   43.520860] #PF: supervisor read access in kernel mode
[   43.520864] #PF: error_code(0x0000) - not-present page
[   43.520867] PGD 0 P4D 0
[   43.520873] Oops: 0000 [#1] PREEMPT SMP NOPTI
[   43.520877] CPU: 4 PID: 179 Comm: kworker/u64:8 Tainted: G
 OE      6.5.0-rc7-1-drm-xe-next-git-gfc8ec3c56efa #1
84e429abf7e368cdba3d886f5336f003bc701ca6
[   43.520885] Hardware name: Micro-Star International Co., Ltd
MS-7C02/B450 TOMAHAWK (MS-7C02), BIOS 1.J1 05/06/2023
[   43.520888] Workqueue: gt-ordered-wq drm_sched_job_timedout [gpu_sched]
[   43.520908] RIP: 0010:memcpy_orig+0x1e/0x140
[   43.520917] Code: 90 90 90 90 90 90 90 90 90 90 90 90 66 0f 1f 00
48 89 f8 48 83 fa 20 0f 82 86 00 00 00 40 38 fe 7c 35 48 83 ea 20 48
83 ea 20 <4c> 8b 06 4c 8b 4e 08 4c 8b 56 10 4c 8b 5e 18 48 8d 76 20 4c
89 07
[   43.520920] RSP: 0018:ffffb87283f7fd28 EFLAGS: 00010206
[   43.520925] RAX: ffff91a47df00000 RBX: ffff91a3c6be0a08 RCX: 00000000000=
00005
[   43.520928] RDX: 000000000003ffc0 RSI: 0000000000000000 RDI: ffff91a47df=
00000
[   43.520932] RBP: 0000000000000000 R08: 000000000003ac80 R09: 00000000000=
00006
[   43.520935] R10: 0000000000000100 R11: 0000000000000000 R12: 00000000000=
40000
[   43.520938] R13: ffff91a42e761000 R14: ffff91a25433a000 R15: ffff91a4610=
66800
[   43.520941] FS:  0000000000000000(0000) GS:ffff91a85eb00000(0000)
knlGS:0000000000000000
[   43.520945] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   43.520948] CR2: 0000000000000000 CR3: 00000003ad168000 CR4: 00000000003=
506e0
[   43.520951] Call Trace:
[   43.520957]  <TASK>
[   43.520963]  ? __die+0x23/0x70
[   43.520971]  ? page_fault_oops+0x171/0x4e0
[   43.520981]  ? exc_page_fault+0x7f/0x180
[   43.520986]  ? asm_exc_page_fault+0x26/0x30
[   43.520998]  ? memcpy_orig+0x1e/0x140
[   43.521003]  ? srso_return_thunk+0x5/0x10
[   43.521010]  xe_vm_snapshot_capture+0xa8/0x170 [xe
2d6cf954368321174df27f792849d0eb5304d230]
[   43.521162]  xe_devcoredump+0x102/0x1e0 [xe
2d6cf954368321174df27f792849d0eb5304d230]
[   43.521261]  guc_exec_queue_timedout_job+0x57c/0x6a0 [xe
2d6cf954368321174df27f792849d0eb5304d230]
[   43.521365]  ? __pfx___drm_printfn_err+0x10/0x10
[   43.521378]  drm_sched_job_timedout+0x7a/0x110 [gpu_sched
28e3bb42b2e864ccc46d70e2cc73354eced387a9]
[   43.521393]  process_one_work+0x1e1/0x3f0
[   43.521402]  worker_thread+0x51/0x390
[   43.521409]  ? __pfx_worker_thread+0x10/0x10
[   43.521412]  kthread+0xe8/0x120
[   43.521418]  ? __pfx_kthread+0x10/0x10
[   43.521423]  ret_from_fork+0x34/0x50
[   43.521432]  ? __pfx_kthread+0x10/0x10
[   43.521436]  ret_from_fork_asm+0x1b/0x30
[   43.521448]  </TASK>
[   43.521450] Modules linked in: rfcomm snd_seq_dummy snd_hrtimer
snd_seq xt_nat xt_tcpudp veth xt_conntrack nf_conntrack_netlink
xt_addrtype br_netfilter xt_MASQUERADE xt_mark vhost_net vhost
vhost_iotlb tap tun nf_tables nfnetlink ip6table_nat ip6table_filter
ip6_tables iptable_nat nf_nat nf_conntrack nf_defrag_ipv6
nf_defrag_ipv4 iptable_filter cmac algif_hash algif_skcipher af_alg
bnep nct6775 nct6775_core hwmon_vid overlay hid_logitech_hidpp
mousedev snd_hda_codec_realtek amdgpu snd_hda_codec_generic xe
ledtrig_audio btusb snd_hda_codec_hdmi btrtl intel_rapl_msr btbcm
snd_hda_intel btintel intel_rapl_common uvcvideo snd_intel_dspcfg
drm_exec btmtk snd_intel_sdw_acpi amdxcp videobuf2_vmalloc drm_buddy
snd_usb_audio edac_mce_amd snd_hda_codec gpu_sched uvc i2c_algo_bit
videobuf2_memops snd_usbmidi_lib bluetooth drm_suballoc_helper
snd_hda_core bridge videobuf2_v4l2 vfat kvm_amd drm_ttm_helper
snd_rawmidi fat hid_apple snd_hwdep snd_seq_device ecdh_generic
videodev stp ttm snd_pcm kvm drm_display_helper
[   43.521576]  apple_mfi_fastcharge llc videobuf2_common snd_timer
crc16 joydev mc hid_logitech_dj irqbypass cec snd cfg80211 rapl
wmi_bmof acpi_cpufreq video k10temp pcspkr soundcore i2c_piix4 rfkill
gpio_amdpt gpio_generic mac_hid winesync(OE) uinput i2c_dev loop fuse
ip_tables x_tables usbhid crct10dif_pclmul crc32_pclmul
polyval_clmulni polyval_generic gf128mul r8169 nvme
ghash_clmulni_intel realtek sha512_ssse3 aesni_intel mdio_devres
crypto_simd cryptd nvme_core sp5100_tco sr_mod libphy ccp xhci_pci
cdrom nvme_common xhci_pci_renesas wmi btrfs blake2b_generic xor
raid6_pq libcrc32c crc32c_generic crc32c_intel dm_mirror
dm_region_hash dm_log pkcs8_key_parser sg dm_multipath vhba(OE)
crypto_user dm_mod
[   43.521680] CR2: 0000000000000000
[   43.521685] ---[ end trace 0000000000000000 ]---
[   43.521688] RIP: 0010:memcpy_orig+0x1e/0x140
[   43.521695] Code: 90 90 90 90 90 90 90 90 90 90 90 90 66 0f 1f 00
48 89 f8 48 83 fa 20 0f 82 86 00 00 00 40 38 fe 7c 35 48 83 ea 20 48
83 ea 20 <4c> 8b 06 4c 8b 4e 08 4c 8b 56 10 4c 8b 5e 18 48 8d 76 20 4c
89 07
[   43.521700] RSP: 0018:ffffb87283f7fd28 EFLAGS: 00010206
[   43.521704] RAX: ffff91a47df00000 RBX: ffff91a3c6be0a08 RCX: 00000000000=
00005
[   43.521707] RDX: 000000000003ffc0 RSI: 0000000000000000 RDI: ffff91a47df=
00000
[   43.521710] RBP: 0000000000000000 R08: 000000000003ac80 R09: 00000000000=
00006
[   43.521712] R10: 0000000000000100 R11: 0000000000000000 R12: 00000000000=
40000
[   43.521715] R13: ffff91a42e761000 R14: ffff91a25433a000 R15: ffff91a4610=
66800
[   43.521719] FS:  0000000000000000(0000) GS:ffff91a85eb00000(0000)
knlGS:0000000000000000
[   43.521723] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   43.521727] CR2: 0000000000000000 CR3: 00000003ad168000 CR4: 00000000003=
506e0
[   43.521730] note: kworker/u64:8[179] exited with irqs disabled
[   44.141636] xe 0000:28:00.0: [drm] Engine reset: guc_id=3D105
[   44.322709] logitech-hidpp-device 0003:046D:4082.0009: HID++ 4.5
device connected.
[   44.808898] xe 0000:28:00.0: [drm] Engine reset: guc_id=3D97


> > - Handle BO mapping in atomic context? Right now I bind the mapping on =
VM_BIND,
> >   because it's easier there when we have all the locks. Due to signalin=
g
> >   context usage, we can never take the BO lock there reliably..
> >
> > Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> > ---
> >  drivers/gpu/drm/xe/xe_bo.c                |   5 +-
> >  drivers/gpu/drm/xe/xe_devcoredump.c       |   9 ++
> >  drivers/gpu/drm/xe/xe_devcoredump_types.h |   2 +
> >  drivers/gpu/drm/xe/xe_vm.c                | 126 ++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_vm.h                |   6 ++
> >  drivers/gpu/drm/xe/xe_vm_types.h          |  19 ++++
> >  6 files changed, 166 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index 27726d4f3423..1f6229da2b2d 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -469,6 +469,8 @@ static int xe_bo_trigger_rebind(struct xe_device *x=
e, struct xe_bo *bo,
> >
> >               trace_xe_vma_evict(vma);
> >
> > +             xe_vma_move_notify(vma);
> > +
> >               if (xe_vm_in_fault_mode(vm)) {
> >                       /* Wait for pending binds / unbinds. */
> >                       long timeout;
> > @@ -1799,7 +1801,8 @@ int xe_gem_create_ioctl(struct drm_device *dev, v=
oid *data,
> >                       return -EINVAL;
> >
> >               bo_flags |=3D XE_BO_NEEDS_CPU_ACCESS;
> > -     }
> > +     } else if (!(bo_flags & XE_BO_CREATE_VRAM_MASK))
> > +             bo_flags |=3D XE_BO_NEEDS_CPU_ACCESS;
> >
> >       if (args->vm_id) {
> >               vm =3D xe_vm_lookup(xef, args->vm_id);
> > diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/x=
e_devcoredump.c
> > index 68abc0b195be..298be162ed0c 100644
> > --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> > +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> > @@ -16,6 +16,7 @@
> >  #include "xe_guc_ct.h"
> >  #include "xe_guc_submit.h"
> >  #include "xe_hw_engine.h"
> > +#include "xe_vm.h"
> >
> >  /**
> >   * DOC: Xe device coredump
> > @@ -98,6 +99,10 @@ static ssize_t xe_devcoredump_read(char *buffer, lof=
f_t offset,
> >               if (coredump->snapshot.hwe[i])
> >                       xe_hw_engine_snapshot_print(coredump->snapshot.hw=
e[i],
> >                                                   &p);
> > +     if (coredump->snapshot.vm) {
> > +             drm_printf(&p, "\n**** VM state ****\n");
> > +             xe_vm_snapshot_print(coredump->snapshot.vm, &p);
> > +     }
> >
> >       return count - iter.remain;
> >  }
> > @@ -116,6 +121,7 @@ static void xe_devcoredump_free(void *data)
> >       for (i =3D 0; i < XE_NUM_HW_ENGINES; i++)
> >               if (coredump->snapshot.hwe[i])
> >                       xe_hw_engine_snapshot_free(coredump->snapshot.hwe=
[i]);
> > +     xe_vm_snapshot_free(coredump->snapshot.vm);
> >
> >       coredump->captured =3D false;
> >       drm_info(&coredump_to_xe(coredump)->drm,
> > @@ -151,6 +157,8 @@ static void devcoredump_snapshot(struct xe_devcored=
ump *coredump,
> >
> >       coredump->snapshot.ct =3D xe_guc_ct_snapshot_capture(&guc->ct, tr=
ue);
> >       coredump->snapshot.ge =3D xe_guc_exec_queue_snapshot_capture(q);
> > +     if (q->vm)
> > +             coredump->snapshot.vm =3D xe_vm_snapshot_capture(q->vm);
> >
> >       for_each_hw_engine(hwe, q->gt, id) {
> >               if (hwe->class !=3D q->hwe->class ||
> > @@ -194,3 +202,4 @@ void xe_devcoredump(struct xe_exec_queue *q)
> >                     xe_devcoredump_read, xe_devcoredump_free);
> >  }
> >  #endif
> > +
> > diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/dr=
m/xe/xe_devcoredump_types.h
> > index 7fdad9c3d3dd..93c2ad7bdc54 100644
> > --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
> > +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> > @@ -33,6 +33,8 @@ struct xe_devcoredump_snapshot {
> >       struct xe_guc_submit_exec_queue_snapshot *ge;
> >       /** @hwe: HW Engine snapshot array */
> >       struct xe_hw_engine_snapshot *hwe[XE_NUM_HW_ENGINES];
> > +     /** @vm: Snapshot of VM state */
> > +     struct xe_vm_snapshot *vm;
> >  };
> >
> >  /**
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 2b225c0692a6..276b03847ecc 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -889,6 +889,11 @@ static struct xe_vma *xe_vma_create(struct xe_vm *=
vm,
> >       if (is_null)
> >               vma->gpuva.flags |=3D DRM_GPUVA_SPARSE;
> >
> > +     if (bo && bo->flags & XE_BO_NEEDS_CPU_ACCESS) {
> > +             INIT_LIST_HEAD(&vma->snap.link);
> > +             vma->gpuva.flags |=3D XE_VMA_SNAPSHOTTABLE;
> > +     }
> > +
> >       if (tile_mask) {
> >               vma->tile_mask =3D tile_mask;
> >       } else {
> > @@ -1238,6 +1243,9 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, =
u32 flags)
> >
> >       INIT_LIST_HEAD(&vm->extobj.list);
> >
> > +     mutex_init(&vm->snap.lock);
> > +     INIT_LIST_HEAD(&vm->snap.list);
> > +
> >       if (!(flags & XE_VM_FLAG_MIGRATION))
> >               xe_device_mem_access_get(xe);
> >
> > @@ -1354,6 +1362,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, =
u32 flags)
> >       dma_resv_unlock(&vm->resv);
> >       drm_gpuva_manager_destroy(&vm->mgr);
> >  err_put:
> > +     mutex_destroy(&vm->snap.lock);
> >       dma_resv_fini(&vm->resv);
> >       for_each_tile(tile, xe, id)
> >               xe_range_fence_tree_fini(&vm->rftree[id]);
> > @@ -1638,6 +1647,14 @@ xe_vm_unbind_vma(struct xe_vma *vma, struct xe_e=
xec_queue *q,
> >                                            cf ? &cf->base : fence);
> >       }
> >
> > +     if (vma->gpuva.flags & XE_VMA_SNAPSHOTTABLE &&
> > +         !list_empty(&vma->snap.link)) {
> > +             mutex_lock(&vm->snap.lock);
> > +             list_del(&vma->snap.link);
> > +             vm->snap.num--;
> > +             mutex_unlock(&vm->snap.lock);
> > +     }
> > +
> >       return cf ? &cf->base : !fence ? dma_fence_get_stub() : fence;
> >
> >  err_fences:
> > @@ -1669,6 +1686,13 @@ xe_vm_bind_vma(struct xe_vma *vma, struct xe_exe=
c_queue *q,
> >
> >       trace_xe_vma_bind(vma);
> >
> > +     /* Map for coredump */
> > +     if (vma->gpuva.flags & XE_VMA_SNAPSHOTTABLE) {
> > +             err =3D xe_bo_vmap(xe_vma_bo(vma));
> > +             if (err)
> > +                     return ERR_PTR(err);
> > +     }
> > +
> >       if (number_tiles > 1) {
> >               fences =3D kmalloc_array(number_tiles, sizeof(*fences),
> >                                      GFP_KERNEL);
> > @@ -1715,6 +1739,14 @@ xe_vm_bind_vma(struct xe_vma *vma, struct xe_exe=
c_queue *q,
> >                                            cf ? &cf->base : fence);
> >       }
> >
> > +     if (vma->gpuva.flags & XE_VMA_SNAPSHOTTABLE &&
> > +         list_empty(&vma->snap.link)) {
> > +             mutex_lock(&vm->snap.lock);
> > +             list_add_tail(&vma->snap.link, &vm->snap.list);
> > +             vm->snap.num++;
> > +             mutex_unlock(&vm->snap.lock);
> > +     }
> > +
> >       return cf ? &cf->base : fence;
> >
> >  err_fences:
> > @@ -3561,3 +3593,97 @@ int xe_analyze_vm(struct drm_printer *p, struct =
xe_vm *vm, int gt_id)
> >
> >       return 0;
> >  }
> > +
> > +struct xe_vm_snapshot {
> > +     unsigned long num_snaps;
> > +     struct {
> > +             uint64_t ofs;
> > +             unsigned long len;
> > +             void *data;
> > +     } snap[];
> > +};
> > +
> > +struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm)
> > +{
> > +     unsigned long num_snaps, i;
> > +     struct xe_vm_snapshot *snap;
> > +     struct xe_vma *vma;
> > +
> > +     mutex_lock(&vm->snap.lock);
> > +     num_snaps =3D vm->snap.num;
> > +
> > +     snap =3D kvmalloc(offsetof(struct xe_vm_snapshot, snap[num_snaps]=
), GFP_NOWAIT);
> > +     if (!snap)
> > +             goto out_unlock;
> > +
> > +     snap->num_snaps =3D num_snaps;
> > +     i =3D 0;
> > +     list_for_each_entry(vma, &vm->snap.list, snap.link) {
> > +             struct xe_bo *bo =3D gem_to_xe_bo(vma->gpuva.gem.obj);
> > +             unsigned long bo_ofs =3D xe_vma_bo_offset(vma);
> > +
> > +             snap->snap[i].ofs =3D xe_vma_start(vma);
> > +             snap->snap[i].len =3D xe_vma_size(vma);
> > +             snap->snap[i].data =3D kvmalloc(snap->snap[i].len, GFP_NO=
WAIT);
> > +             if (!snap->snap[i].data)
> > +                     goto next;
> > +
> > +             /* TODO: Some way around trylock? */
> > +             xe_map_memcpy_from(vm->xe, snap->snap[i].data,
> > +                                &bo->vmap, bo_ofs, snap->snap[i].len);
> > +
> > +next:
> > +             i++;
> > +     }
> > +
> > +out_unlock:
> > +     mutex_unlock(&vm->snap.lock);
> > +     return snap;
> > +}
> > +
> > +void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_prin=
ter *p)
> > +{
> > +     unsigned long i, j;
> > +
> > +     for (i =3D 0; i < snap->num_snaps; i++) {
> > +             if (!snap->snap[i].data) {
> > +                     drm_printf(p, "Unable to capture range [%llx-%llx=
]\n",
> > +                                snap->snap[i].ofs, snap->snap[i].ofs +=
 snap->snap[i].len - 1);
> > +                     continue;
> > +             }
> > +
> > +             for (j =3D 0; j < snap->snap[i].len; j +=3D 64) {
> > +                     uint32_t *x =3D snap->snap[i].data + j;
> > +
> > +                     drm_printf(p, "[%llx] =3D { %x, %x, %x, %x, %x, %=
x, %x, %x, %x, %x, %x, %x, %x, %x, %x, %x }\n",
> > +                                snap->snap[i].ofs + j, x[0], x[1], x[2=
], x[3], x[4], x[5], x[6], x[7],
> > +                                x[8], x[9], x[10], x[11], x[12], x[13]=
, x[14], x[15]);
> > +             }
> > +     }
> > +}
> > +
> > +void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
> > +{
> > +     unsigned long i;
> > +
> > +     for (i =3D 0; i < snap->num_snaps; i++)
> > +             kvfree(snap->snap[i].data);
> > +     kvfree(snap);
> > +}
> > +
> > +void xe_vma_move_notify(struct xe_vma *vma)
> > +{
> > +     struct xe_vm *vm =3D xe_vma_vm(vma);
> > +
> > +     if (!(vma->gpuva.flags & XE_VMA_SNAPSHOTTABLE))
> > +             return;
> > +
> > +     if (list_empty(&vma->snap.link))
> > +             return;
> > +
> > +     mutex_lock(&vm->snap.lock);
> > +     list_del(&vma->snap.link);
> > +     vm->snap.num--;
> > +     mutex_unlock(&vm->snap.lock);
> > +}
> > +
> > diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> > index f966ed39b711..b0b96f158f8b 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.h
> > +++ b/drivers/gpu/drm/xe/xe_vm.h
> > @@ -234,3 +234,9 @@ static inline void vm_dbg(const struct drm_device *=
dev,
> >  { /* noop */ }
> >  #endif
> >  #endif
> > +
> > +struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm);
> > +void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_prin=
ter *p);
> > +void xe_vm_snapshot_free(struct xe_vm_snapshot *snap);
> > +void xe_vma_move_notify(struct xe_vma *vma);
> > +
> > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_v=
m_types.h
> > index 52e5eaed91c3..eb558e5a7f27 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > @@ -33,6 +33,7 @@ struct xe_vm;
> >  #define XE_VMA_PTE_4K                (DRM_GPUVA_USERBITS << 5)
> >  #define XE_VMA_PTE_2M                (DRM_GPUVA_USERBITS << 6)
> >  #define XE_VMA_PTE_1G                (DRM_GPUVA_USERBITS << 7)
> > +#define XE_VMA_SNAPSHOTTABLE (DRM_GPUVA_USERBITS << 8)
> >
> >  /** struct xe_userptr - User pointer */
> >  struct xe_userptr {
> > @@ -123,6 +124,14 @@ struct xe_vma {
> >               struct list_head link;
> >       } extobj;
> >
> > +     struct {
> > +             /**
> > +              * @snap.link: Link into list of xe_vm's snapshottable vm=
a's.
> > +              * protected by vm->snap.lock.
> > +              */
> > +             struct list_head link;
> > +     } snap;
> > +
> >       /**
> >        * @userptr: user pointer state, only allocated for VMAs that are
> >        * user pointers
> > @@ -336,6 +345,16 @@ struct xe_vm {
> >
> >       /** @batch_invalidate_tlb: Always invalidate TLB before batch sta=
rt */
> >       bool batch_invalidate_tlb;
> > +
> > +     /** @snap: Snapshot support structures */
> > +     struct {
> > +             /** @mutex: Mutex held in signaling context */
> > +             struct mutex lock;
> > +             /** @list: List of all vma's to snapshot */
> > +             struct list_head list;
> > +             /** @num: Number of snapshottable vma's */
> > +             unsigned long num;
> > +     } snap;
> >  };
> >
> >  /** struct xe_vma_op_map - VMA map operation */
>
