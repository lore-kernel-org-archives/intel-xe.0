Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A1CC02185
	for <intel-xe@archiver.kernel.org>; Mon, 13 Jan 2025 13:45:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A31310E29A;
	Mon, 13 Jan 2025 13:45:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=tywoniak.eu header.i=@tywoniak.eu header.b="N5gEzSUn";
	dkim-atps=neutral
X-Greylist: delayed 533 seconds by postgrey-1.36 at gabe;
 Fri, 10 Jan 2025 17:28:31 UTC
Received: from out-184.mta1.migadu.com (out-184.mta1.migadu.com
 [95.215.58.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7249710E510
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Jan 2025 17:28:31 +0000 (UTC)
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tywoniak.eu; s=key1;
 t=1736529574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UeDkC1+PosNNXObbEcTb6QebaHdNCFJGEfxpl4jxWbI=;
 b=N5gEzSUnPTHzz0CF04awMVEtfFRYWqUlS1JDSYF4+0OkYgYy67bhdBDvzVg6BmyF+oIahc
 msKukw7KUqdAHTOqXvZrOEK47F59LfpdlYXiENPlcOVz/0wNuq/96uAjSspw/YYHF18hct
 7GGBp2GD/KPy6RNMabowXthM+C9agKQMPIl8kOEKWk1vkDHPhtaLfB+etKJLZ5AWJ+mKVd
 dSJQq2KEF+M8tetGxmmlcdQi0GBj163UZNSRbStjC35peat0kEPO3V42pLPH+/uFWxHZuL
 zMg1t/iFZlhUhPjD7MJ3ERuorBPDUwYENzHeN1rCpPCMVXp3Nw30ipxYgwsHLg==
Date: Fri, 10 Jan 2025 17:19:31 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: "Emil J Tywoniak" <emil@tywoniak.eu>
Message-ID: <1686df0ae8f7caf0d97369a685c810e09afdbca1@tywoniak.eu>
TLS-Required: No
Subject: oops in xe_bo_evict on 6.12.8
To: intel-xe@lists.freedesktop.org
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Mon, 13 Jan 2025 13:45:52 +0000
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

What's up gamers,

hope this is the right place to report this oops which possibly is due to=
 amdgpu interaction. The community guidelines link for this list (https:/=
/01.org/linuxgraphics/community) doesn't work. Feel free to redirect me i=
f not, even to /dev/null. The Video(DRI - Intel) section on kernel bugzil=
la doesn't seem to get much life.

I see there have been recent changes to things around bo eviction on xe a=
nd today I caught the following oops when spawning a second VS Code windo=
w in sway with the New Window command (Ctrl+Shift+N). VS Code was not run=
ning on XWayland. So far I haven't been able to reproduce this. I have am=
dgpu loaded as a fall back for my ryzen 7900X builtin graphics since I in=
stalled the funny GPU (Intel Arc B580 / BMG G21). I'm on Mesa 24.3.3.

------------[ cut here ]------------
workqueue: WQ_MEM_RECLAIM sdma0:drm_sched_run_job_work [gpu_sched] is flu=
shing !WQ_MEM_RECLAIM events:amdgpu_device_delay_enable_gfx_off [amdgpu]
WARNING: CPU: 5 PID: 29199 at kernel/workqueue.c:3704 check_flush_depende=
ncy+0x10f/0x130
Modules linked in: rfcomm snd_seq_dummy snd_hrtimer snd_seq cmac algif_ha=
sh algif_skcipher af_alg nft_chain_nat xt_MASQUERADE nf_conntrack_netlink=
 xfrm_user xfrm_algo xt_addrtype overlay af_packet bnep btusb btrtl btint=
el btbcm btmtk bluetooth mousedev cdc_acm joydev nls_iso8859_1 nls_cp437 =
vfat fat mei_gsc_proxy mei_gsc mei_me mei xt_conntrack ip6t_rpfilter mt79=
21e ipt_rpfilter mt7921_common mt792x_lib snd_hda_codec_hdmi mt76_connac_=
lib edac_mce_amd edac_core mt76 snd_hda_intel amd_atl intel_rapl_msr snd_=
intel_dspcfg xt_pkttype intel_rapl_common snd_intel_sdw_acpi crct10dif_pc=
lmul xt_LOG mac80211 snd_usb_audio uvcvideo nf_log_syslog snd_usbmidi_lib=
 crc32_pclmul snd_hda_codec xt_tcpudp polyval_clmulni videobuf2_vmalloc x=
e snd_ump polyval_generic uvc snd_hda_core ghash_clmulni_intel cfg80211 n=
ft_compat snd_rawmidi sha512_ssse3 videobuf2_memops spd5118 sha256_ssse3 =
snd_seq_device videobuf2_v4l2 snd_hwdep r8169 sha1_ssse3 battery sp5100_t=
co videobuf2_common aesni_intel snd_pcm watchdog realtek gf128mul
 crypto_simd mdio_devres videodev snd_timer cryptd libphy rfkill snd i2c_=
piix4 drm_gpuvm wmi_bmof rapl libarc4 led_class mc nf_tables i2c_smbus k1=
0temp soundcore sch_fq_codel tpm_crb rtc_cmos evdev mac_hid tpm_tis gpio_=
amdpt tiny_power_button tpm_tis_core gpio_generic button uinput hid_xpadn=
eo(O) ff_memless atkbd libps2 serio vivaldi_fmap loop xt_nat nf_nat nf_co=
nntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c br_netfilter veth tun tap=
 macvlan bridge stp llc kvm_amd ccp kvm fuse efi_pstore configfs nfnetlin=
k efivarfs tpm libaescfb ecdh_generic ecc rng_core dmi_sysfs ip_tables x_=
tables autofs4 ext4 crc32c_generic mbcache jbd2 hid_generic usbhid hid ah=
ci libahci xhci_pci libata nvme xhci_hcd scsi_mod nvme_core crc32c_intel =
scsi_common nvme_auth dm_mod dax amdgpu video wmi amdxcp i2c_algo_bit drm=
_ttm_helper ttm drm_exec gpu_sched drm_suballoc_helper drm_buddy drm_disp=
lay_helper cec crc16
CPU: 5 UID: 0 PID: 29199 Comm: kworker/u96:0 Tainted: G        W  O      =
 6.12.8 #1-NixOS
Tainted: [W]=3DWARN, [O]=3DOOT_MODULE
Hardware name: Micro-Star International Co., Ltd. MS-7D75/MAG B650 TOMAHA=
WK WIFI (MS-7D75), BIOS 1.60 05/30/2023
Workqueue: sdma0 drm_sched_run_job_work [gpu_sched]
RIP: 0010:check_flush_dependency+0x10f/0x130
Code: c0 f3 01 01 90 49 8b 45 18 48 8d b2 c0 00 00 00 48 8d 8b c0 00 00 0=
0 49 89 e8 48 c7 c7 a0 c7 df b4 48 89 c2 e8 82 7e fd ff 90 <0f> 0b 90 90 =
e9 0a ff ff ff 80 3d 99 c0 f3 01 00 75 8f e9 42 ff ff
RSP: 0018:ffff95dd9ef97c60 EFLAGS: 00010046
RAX: 0000000000000000 RBX: ffff9265c01b8e00 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffffffffc0438c00 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: ffff92681a13b200
R13: ffff9265c94338c0 R14: 0000000000000001 R15: ffff9265c01bce00
FS:  0000000000000000(0000) GS:ffff926cb7e80000(0000) knlGS:0000000000000=
000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000000050d6d0 CR3: 00000002a38d6000 CR4: 0000000000f50ef0
PKRU: 55555554
Call Trace:
 <TASK>
 ? check_flush_dependency+0x10f/0x130
 ? __warn.cold+0x93/0xf6
 ? check_flush_dependency+0x10f/0x130
 ? report_bug+0x10d/0x150
 ? srso_alias_return_thunk+0x5/0xfbef5
 ? handle_bug+0x61/0xb0
 ? exc_invalid_op+0x17/0x80
 ? asm_exc_invalid_op+0x1a/0x20
 ? __pfx_amdgpu_device_delay_enable_gfx_off+0x10/0x10 [amdgpu]
 ? check_flush_dependency+0x10f/0x130
 __flush_work+0x10c/0x320
 cancel_delayed_work_sync+0x62/0x80
 amdgpu_gfx_off_ctrl+0xb7/0x150 [amdgpu]
 amdgpu_ring_alloc+0x40/0x70 [amdgpu]
 amdgpu_ib_schedule+0xf0/0x750 [amdgpu]
 amdgpu_job_run+0x8e/0x200 [amdgpu]
 drm_sched_run_job_work+0x283/0x420 [gpu_sched]
 process_one_work+0x18a/0x350
 worker_thread+0x235/0x370
 ? __pfx_worker_thread+0x10/0x10
 ? __pfx_worker_thread+0x10/0x10
 kthread+0xcd/0x100
 ? __pfx_kthread+0x10/0x10
 ret_from_fork+0x31/0x50
 ? __pfx_kthread+0x10/0x10
 ret_from_fork_asm+0x1a/0x30
 </TASK>
---[ end trace 0000000000000000 ]---

I hope this tells you something. I'm willing to switch to some cutting ed=
ge kernel commit and report back if I get an oops again, so feel free whi=
ch remote and commit I should go get, or any other troubleshooting steps =
I could follow.

Thanks for all your hard work,

Emil J. Tywoniak (widlarizer)
