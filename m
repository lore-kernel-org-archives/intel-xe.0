Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 925A6C02180
	for <intel-xe@archiver.kernel.org>; Mon, 13 Jan 2025 18:51:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE73310E7AC;
	Mon, 13 Jan 2025 18:51:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=tywoniak.eu header.i=@tywoniak.eu header.b="fqHENJCw";
	dkim-atps=neutral
Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com
 [91.218.175.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDE3E10E72B
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Jan 2025 16:47:41 +0000 (UTC)
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tywoniak.eu; s=key1;
 t=1736786855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hzpn51QiZJyUvaz7DG2nQq/0Fe2ycrJkn1XU8qZD9Gs=;
 b=fqHENJCwM0vBPCovHlKDVHpznC++LYoN/9D0EYwUtv3biJighj9hC3JJN/K31YgeiJYThM
 M+5yOEn+8x2n8AImiW4t9MVc0BYdLVTjvZpnBH1AxB/rRHuy7zPlaPwbLNh7w4e5joWKlE
 TpPlzm21h6q68e58Ede3EpAZ3qVwC9MC+r4km2jJnYV4xqJhBWVvyLqsY95Vy2axOWU5iq
 y9UDXXo3/NSU5lC8i15TIFfLWp27wIo6CdK92TaIizRXktjzmkI1XY3HV9umdBgSOlw524
 gLpSyUJMAnHDrcxLS8B3HhyrrPKnD/VCSzMQ8cqAWElsWXiPZ5z4VFt/GRGtlg==
Date: Mon, 13 Jan 2025 16:47:33 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: "Emil J Tywoniak" <emil@tywoniak.eu>
Message-ID: <81d88d898ed648606a14b6e618c40421f469dbec@tywoniak.eu>
TLS-Required: No
Subject: Re: oops in xe_bo_evict on 6.12.8
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <Z4VCPB0j_maA1oCo@intel.com>
References: <1686df0ae8f7caf0d97369a685c810e09afdbca1@tywoniak.eu>
 <Z4VCPB0j_maA1oCo@intel.com>
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Mon, 13 Jan 2025 18:51:19 +0000
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

Hi Rodrigo,

just a while ago I reported it here: https://gitlab.freedesktop.org/drm/x=
e/kernel/-/issues/4055
You're right, I attached the wrong trace. The gitlab issue has the correc=
t one. Feel free to suggest remote+branch(+commit) that I should try, but=
 since I haven't been able to reproduce this oops, switching kernels won'=
t yield any information immediately.

Cheers
Emil

[January 13, 2025 at 5:41 PM, "Rodrigo Vivi" <rodrigo.vivi@intel.com> wro=
te:



>=20
>=20On Fri, Jan 10, 2025 at 05:19:31PM +0000, Emil J Tywoniak wrote:
>=20
>=20>=20
>=20> What's up gamers,
> >=20
>=20>=20=20
>=20>=20
>=20>  hope this is the right place to report this oops which possibly is=
 due to amdgpu interaction. The community guidelines link for this list (=
https://01.org/linuxgraphics/community) doesn't work. Feel free to redire=
ct me if not, even to /dev/null. The Video(DRI - Intel) section on kernel=
 bugzilla doesn't seem to get much life.
> >=20
>=20
> Hi Emil,
>=20
>=20Thanks for your interest and report on Xe bugs.
>=20
>=20Please follow this link instead: https://drm.pages.freedesktop.org/in=
tel-docs/how-to-file-i915-bugs.html
>=20
>=20The entire dmesg would be needed to help us to understand what's goin=
g on here. From the pasted
>=20
>=20portion below it doesn't even look like xe is in the picture.
>=20
>=20But only more details could help to determine what's going on. Also, =
keep in mind that Xe,
>=20
>=20specially for BMG, was in very active development and a lot might hav=
e changed since 6.12.
>=20
>=20So, it would be great if you could run some experiments with newer ke=
rnel as well.
>=20
>=20Thanks,
>=20
>=20Rodrigo.
>=20
>=20>=20
>=20> I see there have been recent changes to things around bo eviction o=
n xe and today I caught the following oops when spawning a second VS Code=
 window in sway with the New Window command (Ctrl+Shift+N). VS Code was n=
ot running on XWayland. So far I haven't been able to reproduce this. I h=
ave amdgpu loaded as a fall back for my ryzen 7900X builtin graphics sinc=
e I installed the funny GPU (Intel Arc B580 / BMG G21). I'm on Mesa 24.3.=
3.
> >=20
>=20>=20=20
>=20>=20
>=20>  ------------[ cut here ]------------
> >=20
>=20>  workqueue: WQ_MEM_RECLAIM sdma0:drm_sched_run_job_work [gpu_sched]=
 is flushing !WQ_MEM_RECLAIM events:amdgpu_device_delay_enable_gfx_off [a=
mdgpu]
> >=20
>=20>  WARNING: CPU: 5 PID: 29199 at kernel/workqueue.c:3704 check_flush_=
dependency+0x10f/0x130
> >=20
>=20>  Modules linked in: rfcomm snd_seq_dummy snd_hrtimer snd_seq cmac a=
lgif_hash algif_skcipher af_alg nft_chain_nat xt_MASQUERADE nf_conntrack_=
netlink xfrm_user xfrm_algo xt_addrtype overlay af_packet bnep btusb btrt=
l btintel btbcm btmtk bluetooth mousedev cdc_acm joydev nls_iso8859_1 nls=
_cp437 vfat fat mei_gsc_proxy mei_gsc mei_me mei xt_conntrack ip6t_rpfilt=
er mt7921e ipt_rpfilter mt7921_common mt792x_lib snd_hda_codec_hdmi mt76_=
connac_lib edac_mce_amd edac_core mt76 snd_hda_intel amd_atl intel_rapl_m=
sr snd_intel_dspcfg xt_pkttype intel_rapl_common snd_intel_sdw_acpi crct1=
0dif_pclmul xt_LOG mac80211 snd_usb_audio uvcvideo nf_log_syslog snd_usbm=
idi_lib crc32_pclmul snd_hda_codec xt_tcpudp polyval_clmulni videobuf2_vm=
alloc xe snd_ump polyval_generic uvc snd_hda_core ghash_clmulni_intel cfg=
80211 nft_compat snd_rawmidi sha512_ssse3 videobuf2_memops spd5118 sha256=
_ssse3 snd_seq_device videobuf2_v4l2 snd_hwdep r8169 sha1_ssse3 battery s=
p5100_tco videobuf2_common aesni_intel snd_pcm watchdog realtek gf128mul
> >=20
>=20>  crypto_simd mdio_devres videodev snd_timer cryptd libphy rfkill sn=
d i2c_piix4 drm_gpuvm wmi_bmof rapl libarc4 led_class mc nf_tables i2c_sm=
bus k10temp soundcore sch_fq_codel tpm_crb rtc_cmos evdev mac_hid tpm_tis=
 gpio_amdpt tiny_power_button tpm_tis_core gpio_generic button uinput hid=
_xpadneo(O) ff_memless atkbd libps2 serio vivaldi_fmap loop xt_nat nf_nat=
 nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c br_netfilter veth t=
un tap macvlan bridge stp llc kvm_amd ccp kvm fuse efi_pstore configfs nf=
netlink efivarfs tpm libaescfb ecdh_generic ecc rng_core dmi_sysfs ip_tab=
les x_tables autofs4 ext4 crc32c_generic mbcache jbd2 hid_generic usbhid =
hid ahci libahci xhci_pci libata nvme xhci_hcd scsi_mod nvme_core crc32c_=
intel scsi_common nvme_auth dm_mod dax amdgpu video wmi amdxcp i2c_algo_b=
it drm_ttm_helper ttm drm_exec gpu_sched drm_suballoc_helper drm_buddy dr=
m_display_helper cec crc16
> >=20
>=20>  CPU: 5 UID: 0 PID: 29199 Comm: kworker/u96:0 Tainted: G W O 6.12.8=
 #1-NixOS
> >=20
>=20>  Tainted: [W]=3DWARN, [O]=3DOOT_MODULE
> >=20
>=20>  Hardware name: Micro-Star International Co., Ltd. MS-7D75/MAG B650=
 TOMAHAWK WIFI (MS-7D75), BIOS 1.60 05/30/2023
> >=20
>=20>  Workqueue: sdma0 drm_sched_run_job_work [gpu_sched]
> >=20
>=20>  RIP: 0010:check_flush_dependency+0x10f/0x130
> >=20
>=20>  Code: c0 f3 01 01 90 49 8b 45 18 48 8d b2 c0 00 00 00 48 8d 8b c0 =
00 00 00 49 89 e8 48 c7 c7 a0 c7 df b4 48 89 c2 e8 82 7e fd ff 90 <0f> 0b=
 90 90 e9 0a ff ff ff 80 3d 99 c0 f3 01 00 75 8f e9 42 ff ff
> >=20
>=20>  RSP: 0018:ffff95dd9ef97c60 EFLAGS: 00010046
> >=20
>=20>  RAX: 0000000000000000 RBX: ffff9265c01b8e00 RCX: 0000000000000000
> >=20
>=20>  RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> >=20
>=20>  RBP: ffffffffc0438c00 R08: 0000000000000000 R09: 0000000000000000
> >=20
>=20>  R10: 0000000000000000 R11: 0000000000000000 R12: ffff92681a13b200
> >=20
>=20>  R13: ffff9265c94338c0 R14: 0000000000000001 R15: ffff9265c01bce00
> >=20
>=20>  FS: 0000000000000000(0000) GS:ffff926cb7e80000(0000) knlGS:0000000=
000000000
> >=20
>=20>  CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> >=20
>=20>  CR2: 000000000050d6d0 CR3: 00000002a38d6000 CR4: 0000000000f50ef0
> >=20
>=20>  PKRU: 55555554
> >=20
>=20>  Call Trace:
> >=20
>=20>  <TASK>
> >=20
>=20>  ? check_flush_dependency+0x10f/0x130
> >=20
>=20>  ? __warn.cold+0x93/0xf6
> >=20
>=20>  ? check_flush_dependency+0x10f/0x130
> >=20
>=20>  ? report_bug+0x10d/0x150
> >=20
>=20>  ? srso_alias_return_thunk+0x5/0xfbef5
> >=20
>=20>  ? handle_bug+0x61/0xb0
> >=20
>=20>  ? exc_invalid_op+0x17/0x80
> >=20
>=20>  ? asm_exc_invalid_op+0x1a/0x20
> >=20
>=20>  ? __pfx_amdgpu_device_delay_enable_gfx_off+0x10/0x10 [amdgpu]
> >=20
>=20>  ? check_flush_dependency+0x10f/0x130
> >=20
>=20>  __flush_work+0x10c/0x320
> >=20
>=20>  cancel_delayed_work_sync+0x62/0x80
> >=20
>=20>  amdgpu_gfx_off_ctrl+0xb7/0x150 [amdgpu]
> >=20
>=20>  amdgpu_ring_alloc+0x40/0x70 [amdgpu]
> >=20
>=20>  amdgpu_ib_schedule+0xf0/0x750 [amdgpu]
> >=20
>=20>  amdgpu_job_run+0x8e/0x200 [amdgpu]
> >=20
>=20>  drm_sched_run_job_work+0x283/0x420 [gpu_sched]
> >=20
>=20>  process_one_work+0x18a/0x350
> >=20
>=20>  worker_thread+0x235/0x370
> >=20
>=20>  ? __pfx_worker_thread+0x10/0x10
> >=20
>=20>  ? __pfx_worker_thread+0x10/0x10
> >=20
>=20>  kthread+0xcd/0x100
> >=20
>=20>  ? __pfx_kthread+0x10/0x10
> >=20
>=20>  ret_from_fork+0x31/0x50
> >=20
>=20>  ? __pfx_kthread+0x10/0x10
> >=20
>=20>  ret_from_fork_asm+0x1a/0x30
> >=20
>=20>  </TASK>
> >=20
>=20>  ---[ end trace 0000000000000000 ]---
> >=20
>=20>=20=20
>=20>=20
>=20>  I hope this tells you something. I'm willing to switch to some cut=
ting edge kernel commit and report back if I get an oops again, so feel f=
ree which remote and commit I should go get, or any other troubleshooting=
 steps I could follow.
> >=20
>=20>=20=20
>=20>=20
>=20>  Thanks for all your hard work,
> >=20
>=20>=20=20
>=20>=20
>=20>  Emil J. Tywoniak (widlarizer)
> >
>
