Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C53AECFC293
	for <intel-xe@archiver.kernel.org>; Fri, 21 Nov 2025 13:53:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A769F10E8A5;
	Fri, 21 Nov 2025 13:53:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sotapeli.fi header.i=@sotapeli.fi header.b="ESKn4yE7";
	dkim-atps=neutral
Received: from se.sotapeli.fi (se.sotapeli.fi [206.168.212.219])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FA4910E10C
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Nov 2025 00:16:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D4C49181AA00
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Nov 2025 01:16:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sotapeli.fi; s=dkim;
 t=1763424967; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:autocrypt;
 bh=NmXmUI4fGOk+rzoE7VDAiwJvK24RkWZGifrJKBmmQ3M=;
 b=ESKn4yE77B+cMpv3rESR3Z+0V2B8kWNs8ER8CmFsWAuJ63/oxTRPAYi3lb+4QGwk9oRNcE
 J+SeS2YVVNGYrLGY+ShGZ1ziucAXHTCbtnVUyXJByMOew1tfpuu1LjlRD8d+xj37UaOLNk
 P9ec9GfTApBZfa5Y+7ei2j318qW08kuTTHT/W3GQuFjsuCzajj6kZPig867DaJGdbuh+m2
 vqYkoo9KlyUXyJQWsyp9dN7rVXlkzLKp8xRXPyVxYtQ3LlfDIo0MvrR9X55fHt650kjo9B
 Oz8rnhDeKnDy+CWVPrdeaXAEuz7oawRANvGcgaZwA+qMtkNRV/FiLxnxbo8F7g==
Message-ID: <12d4e567-0592-42d1-af84-a8b079b33785@sotapeli.fi>
Date: Tue, 18 Nov 2025 02:16:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: intel-xe@lists.freedesktop.org
Content-Language: en-US
From: Jani Partanen <jiipee@sotapeli.fi>
Subject: Few bugs with Arc B570
Autocrypt: addr=jiipee@sotapeli.fi; keydata=
 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
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Approved-At: Fri, 21 Nov 2025 13:53:11 +0000
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

Hello, my Arc B570 just caused this to show up in dmesg.

Kernel is "custom" build by me with mtd patch. Other than that its stock 
Fedora kernel.


[277607.590294] ------------[ cut here ]------------
[277607.590299] xe 0000:0e:00.0: [drm] drm_WARN_ON_ONCE(ret == -110)
[277607.590335] WARNING: CPU: 6 PID: 393822 at 
drivers/gpu/drm/xe/xe_gt_mcr.c:628 mcr_lock+0x9e/0xb0 [xe]
[277607.590440] Modules linked in: ib_core uinput nft_reject_ipv4 
act_csum cls_u32 sch_htb xt_conntrack nft_compat rfcomm snd_seq_dummy 
snd_hrtimer vhost_net tap vhost_vsock vmw_vsock_virtio_transport_common 
vhost vhost_iotlb vsock bridge stp llc nf_nat_tftp nf_conntrack_tftp 
nft_masq nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet 
nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat 
nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nf_tables overlay bnep 
binfmt_misc dm_cache_smq dm_cache dm_persistent_data dm_bio_prison 
intel_rapl_msr ee1004 mei_gsc_proxy asus_ec_sensors amd_atl 
intel_rapl_common snd_hda_codec_alc882 btusb snd_hda_codec_realtek_lib 
snd_hda_codec_intelhdmi edac_mce_amd snd_hda_codec_generic 
snd_hda_codec_hdmi btrtl btintel kvm_amd btbcm btmtk iwlmvm 
snd_hda_intel eeepc_wmi vfat kvm bluetooth asus_wmi mac80211 
sparse_keymap snd_hda_codec irqbypass fat mxm_wmi platform_profile rapl 
snd_hda_core wmi_bmof pcspkr snd_intel_dspcfg i2c_piix4 k10temp 
snd_intel_sdw_acpi libarc4 snd_hwdep
[277607.590545]  i2c_smbus snd_seq raid456 mei_gsc mtd_intel_dg 
snd_seq_device mei_me async_raid6_recov mtd snd_pcm mei pmt_telemetry 
async_memcpy snd_timer pmt_crashlog pmt_discovery async_pq iwlwifi 
pmt_class snd async_xor soundcore async_tx r8169 cfg80211 igb dca 
realtek rfkill joydev tun loop nfnetlink zram lz4hc_compress 
lz4_compress dm_crypt xe hid_logitech_hidpp intel_vsec drm_ttm_helper 
ttm i2c_algo_bit drm_suballoc_helper drm_buddy raid1 video gpu_sched 
drm_gpuvm drm_exec mpt3sas drm_display_helper hid_logitech 
polyval_clmulni nvme ff_memless raid_class cec ghash_clmulni_intel 
scsi_transport_sas nvme_core sp5100_tco nvme_keyring nvme_auth wmi 
hid_logitech_dj nbd fuse i2c_dev nct6775 nct6775_core hwmon_vid
[277607.590635] CPU: 6 UID: 0 PID: 393822 Comm: kworker/6:2 Not tainted 
6.17.7-300.xe.fc43.x86_64 #1 PREEMPT(lazy)
[277607.590639] Hardware name: ASUS System Product Name/ROG CROSSHAIR 
VIII HERO (WI-FI), BIOS 5302 10/03/2025
[277607.590642] Workqueue: pm pm_runtime_work
[277607.590649] RIP: 0010:mcr_lock+0x9e/0xb0 [xe]
[277607.590750] Code: 48 8b 5f 50 48 85 db 75 03 48 8b 1f e8 cb 4b d9 d5 
48 c7 c1 c0 b2 d5 c0 48 89 da 48 c7 c7 de b2 d5 c0 48 89 c6 e8 82 d2 19 
d5 <0f> 0b eb 86 0f 1f 00 66 66 2e 0f 1f 84 00 00 00 00 00 90 90 90 90
[277607.590753] RSP: 0018:ffffcf23a224bc50 EFLAGS: 00010246
[277607.590757] RAX: 0000000000000000 RBX: ffff88bc01d5dd30 RCX: 
0000000000000027
[277607.590760] RDX: ffff88c6fed1cf88 RSI: 0000000000000001 RDI: 
ffff88c6fed1cf80
[277607.590763] RBP: ffff88bc011be000 R08: 0000000000000000 R09: 
ffffcf23a224baf8
[277607.590765] R10: ffffffff98139a88 R11: 00000000ffffdfff R12: 
ffff88bc16b50028
[277607.590768] R13: 0000000000010003 R14: 0000000000000000 R15: 
0000000000000008
[277607.590772] FS:  0000000000000000(0000) GS:ffff88c765d44000(0000) 
knlGS:0000000000000000
[277607.590775] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[277607.590777] CR2: 00007efc41502484 CR3: 000000011509c000 CR4: 
0000000000350ef0
[277607.590780] Call Trace:
[277607.590784]  <TASK>
[277607.590790]  xe_gt_mcr_unicast_read_any+0x46/0xe0 [xe]
[277607.590901]  xe_gt_disable_host_l2_vram+0x4a/0x90 [xe]
[277607.591023]  xe_gt_suspend+0x7e/0xf0 [xe]
[277607.591144]  xe_pm_runtime_suspend+0x159/0x2f0 [xe]
[277607.591286]  ? update_load_avg+0x85/0x400
[277607.591292]  ? __pfx_pci_pm_runtime_suspend+0x10/0x10
[277607.591297]  xe_pci_runtime_suspend+0x1e/0xe0 [xe]
[277607.591434]  ? __pfx_pci_pm_runtime_suspend+0x10/0x10
[277607.591438]  pci_pm_runtime_suspend+0x6a/0x1a0
[277607.591443]  ? __pfx_pci_pm_runtime_suspend+0x10/0x10
[277607.591447]  __rpm_callback+0x48/0x1f0
[277607.591451]  ? srso_return_thunk+0x5/0x5f
[277607.591457]  ? srso_return_thunk+0x5/0x5f
[277607.591461]  ? __pfx_pci_pm_runtime_suspend+0x10/0x10
[277607.591466]  rpm_callback+0x6d/0x80
[277607.591470]  rpm_suspend+0xe5/0x5e0
[277607.591473]  ? finish_task_switch.isra.0+0x99/0x2c0
[277607.591480]  pm_runtime_work+0x98/0xb0
[277607.591485]  process_one_work+0x192/0x350
[277607.591491]  worker_thread+0x25a/0x3a0
[277607.591497]  ? __pfx_worker_thread+0x10/0x10
[277607.591501]  kthread+0xfc/0x240
[277607.591505]  ? __pfx_kthread+0x10/0x10
[277607.591510]  ? __pfx_kthread+0x10/0x10
[277607.591515]  ret_from_fork+0xf4/0x110
[277607.591520]  ? __pfx_kthread+0x10/0x10
[277607.591524]  ret_from_fork_asm+0x1a/0x30
[277607.591536]  </TASK>
[277607.591538] ---[ end trace 0000000000000000 ]---


I am also seeing this, but sadly this always happens at time when I am 
not front of computer so dump gets trashed. I have not figured out how I 
could change timeout from 1h to something else. I have seen this on 
stock kernel also.


[213377.351299] xe 0000:0e:00.0: [drm] GT0: Engine reset: 
engine_class=rcs, logical_mask: 0x1, guc_id=109
[213377.351361] xe 0000:0e:00.0: [drm] GT0: Timedout job: seqno=7579, 
lrc_seqno=7579, guc_id=109, flags=0x0 in zenity [306155]
[213377.403140] xe 0000:0e:00.0: [drm] Xe device coredump has been created
[213377.403145] xe 0000:0e:00.0: [drm] Check your 
/sys/class/drm/card1/device/devcoredump/data
[217090.855547] xe 0000:0e:00.0: [drm] Xe device coredump has been deleted.


It also give me this at boot time, should I report this somewhere else? 
This has happen every boot after I installed card.


[   40.507361] snd_hda_intel 0000:0f:00.0: Unknown capability 0


I believe it's something to do with card HDMI audio.


// Jani


