Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D479C5475B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Mar 2024 00:16:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2494B113605;
	Thu,  7 Mar 2024 00:16:44 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29BDC113607;
 Thu,  7 Mar 2024 00:16:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Revert_=22drm/xe=3A_Do_no?=
 =?utf-8?q?t_grab_forcewakes_when_issuing_GGTT_TLB_invalidation_via_GuC=22?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 07 Mar 2024 00:16:43 -0000
Message-ID: <170977060317.563887.5639968766261547879@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240307001105.161856-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240307001105.161856-1-rodrigo.vivi@intel.com>
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
Reply-To: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

=3D=3D Series Details =3D=3D

Series: Revert "drm/xe: Do not grab forcewakes when issuing GGTT TLB invali=
dation via GuC"
URL   : https://patchwork.freedesktop.org/series/130838/
State : success

=3D=3D Summary =3D=3D

+ KERNEL=3D/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools=
.git/
+ git -C mt rev-list -n1 origin/master
7d6fb25447372de10c7d82d450bf95e4b2e2a0ab
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 82efadcb3c7094d18b6e0713bc205863c0d04e16
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Wed Mar 6 19:11:05 2024 -0500

    Revert "drm/xe: Do not grab forcewakes when issuing GGTT TLB invalidati=
on via GuC"
   =20
    This reverts commit 27ee413bbc0b04146f4ee1c7444422bf18dafd47.
   =20
    On DG2 after this patch:
   =20
    [  439.105953] general protection fault, probably for non-canonical add=
ress 0xdffffc0000000000: 0000 [#1] PREEMPT SMP KASAN NOPTI
    [  439.117349] KASAN: null-ptr-deref in range [0x0000000000000000-0x000=
0000000000007]
    [  439.124924] CPU: 8 PID: 7160 Comm: insmod Tainted: G     U     OE   =
   6.8.0-rc7+ #5
    [  439.132669] Hardware name: iBUYPOWER INTEL/B660 DS3H AC DDR4-Y1, BIO=
S F5 12/17/2021
    [  439.140332] RIP: 0010:xe_ggtt_invalidate+0x150/0x260 [xe]
    [  439.145860] Code: 48 8d 7d 18 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 85=
 b3 00 00 00 48 b8 00 00 00 00 00 fc ff df 48 8b 5d 18 48 89 da 48 c1 ea 03=
 <80> 3c 02 00 0f 85 87 00 00 00 48 b8 00 00 00 00 00 fc ff df 48 8b
    [  439.164609] RSP: 0018:ffffc9000201eee8 EFLAGS: 00010246
    [  439.169843] RAX: dffffc0000000000 RBX: 0000000000000000 RCX: 0000000=
000000000
    [  439.176980] RDX: 0000000000000000 RSI: ffffffffb6ae4040 RDI: ffff888=
18231a478
    [  439.184121] RBP: ffff88818231a460 R08: 0000000000000001 R09: fffffbf=
ff7563e5c
    [  439.191259] R10: fffff52000403d92 R11: 0000000000000001 R12: ffff888=
185330028
    [  439.198401] R13: ffffffffffffffff R14: 0000000000001000 R15: 0000000=
000000000
    [  439.205543] FS:  00007f6c0fd92740(0000) GS:ffff888f76400000(0000) kn=
lGS:0000000000000000
    [  439.213634] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
    [  439.219393] CR2: 00007ffedd41de70 CR3: 00000001063ec000 CR4: 0000000=
000750ef0
    [  439.226534] PKRU: 55555554
    [  439.229256] Call Trace:
    [  439.231713]  <TASK>
    [  439.233832]  ? die_addr+0x3c/0xa0
    [  439.237165]  ? exc_general_protection+0x158/0x240
    [  439.241882]  ? asm_exc_general_protection+0x22/0x30
    [  439.246774]  ? xe_ggtt_invalidate+0x150/0x260 [xe]
    [  439.251679]  ? xe_ggtt_invalidate+0xa0/0x260 [xe]
    [  439.256490]  __xe_ggtt_insert_bo_at+0x24b/0x720 [xe]
    [  439.261556]  ? __pfx____xe_bo_create_locked+0x10/0x10 [xe]
    [  439.267144]  ? __pfx___xe_ggtt_insert_bo_at+0x10/0x10 [xe]
    [  439.272737]  __xe_bo_create_locked+0x4af/0x1080 [xe]
    [  439.277806]  xe_bo_create_pin_map_at+0x40/0x400 [xe]
    [  439.282873]  ? xe_uc_fw_check_version_requirements+0x496/0x900 [xe]
    [  439.289255]  xe_managed_bo_create_from_data+0x38/0x130 [xe]
    [  439.294934]  xe_uc_fw_init+0xe71/0x3270 [xe]
    [  439.299317]  ? __pfx_xe_uc_fw_init+0x10/0x10 [xe]
    [  439.304127]  ? __pfx_lock_acquired+0x10/0x10
    [  439.308406]  ? __pfx___drm_printfn_info+0x10/0x10
    [  439.313118]  ? _raw_spin_unlock_irqrestore+0x4b/0x80
    [  439.318093]  ? __pm_runtime_resume+0x7f/0x110
    [  439.322458]  xe_guc_init+0x8d/0x890 [xe]
    [  439.326497]  xe_uc_init+0x65/0x1a0 [xe]
    [  439.330440]  xe_gt_init_hwconfig+0xdc/0x180 [xe]
    [  439.335161]  xe_device_probe+0x747/0x1060 [xe]
    [  439.339712]  ? __pfx___drmm_mutex_release+0x10/0x10
    [  439.344599]  ? __drmm_add_action+0x19d/0x280
    [  439.348883]  ? __pfx___drmm_mutex_release+0x10/0x10
    [  439.353769]  xe_pci_probe+0x168b/0x2f30 [xe]
    [  439.358154]  ? __pfx_lock_acquired+0x10/0x10
    [  439.362433]  ? __pfx_xe_pci_probe+0x10/0x10 [xe]
    [  439.367158]  ? _raw_spin_unlock_irqrestore+0x62/0x80
    [  439.372131]  ? lockdep_hardirqs_on+0xc7/0x140
    [  439.376498]  ? _raw_spin_unlock_irqrestore+0x4b/0x80
    [  439.381473]  ? __pfx_xe_pci_probe+0x10/0x10 [xe]
    [  439.386196]  local_pci_probe+0xd6/0x190
    [  439.390042]  pci_device_probe+0x223/0x740
    [  439.394064]  ? __pfx_pci_device_probe+0x10/0x10
    [  439.398605]  ? kernfs_create_link+0x167/0x230
    [  439.402970]  ? do_raw_spin_unlock+0x54/0x1f0
    [  439.407252]  really_probe+0x3df/0xb80
    [  439.410926]  __driver_probe_device+0x18c/0x450
    [  439.415382]  driver_probe_device+0x4a/0x120
    [  439.419572]  __driver_attach+0x1e1/0x4a0
    [  439.423505]  ? __pfx___driver_attach+0x10/0x10
    [  439.427963]  bus_for_each_dev+0xf2/0x160
    [  439.431897]  ? __pfx_bus_for_each_dev+0x10/0x10
    [  439.436436]  bus_add_driver+0x29d/0x570
    [  439.440283]  driver_register+0x130/0x450
    [  439.444218]  ? __pfx_xe_init+0x10/0x10 [xe]
    [  439.448507]  xe_init+0x81/0x140 [xe]
    [  439.452188]  ? __pfx_xe_init+0x10/0x10 [xe]
    [  439.456478]  do_one_initcall+0xcf/0x420
    [  439.460326]  ? __pfx_do_one_initcall+0x10/0x10
    [  439.464783]  ? kasan_unpoison+0x40/0x70
    [  439.468631]  do_init_module+0x238/0x730
    [  439.472478]  load_module+0x5ff7/0x6c30
    [  439.476242]  ? __pfx_load_module+0x10/0x10
    [  439.480356]  ? ima_post_read_file+0x163/0x190
    [  439.484722]  ? __pfx_ima_post_read_file+0x10/0x10
    [  439.489435]  ? security_kernel_post_read_file+0x6d/0xb0
    [  439.494673]  ? __pfx_kernel_read_file+0x10/0x10
    [  439.499220]  ? init_module_from_file+0xc0/0x100
    [  439.503758]  init_module_from_file+0xc0/0x100
    [  439.508125]  ? __pfx_init_module_from_file+0x10/0x10
    [  439.513103]  ? do_raw_spin_unlock+0x54/0x1f0
    [  439.517382]  idempotent_init_module+0x241/0x660
    [  439.521924]  ? __pfx_idempotent_init_module+0x10/0x10
    [  439.526986]  ? security_capable+0x6d/0xb0
    [  439.531003]  __x64_sys_finit_module+0xba/0x130
    [  439.535459]  do_syscall_64+0x97/0x190
    [  439.539135]  ? lockdep_hardirqs_on_prepare+0x17b/0x420
    [  439.544282]  ? do_syscall_64+0xa7/0x190
    [  439.548125]  ? lockdep_hardirqs_on+0xc7/0x140
    [  439.552493]  ? do_syscall_64+0xa7/0x190
    [  439.556341]  ? do_syscall_64+0xa7/0x190
    [  439.560188]  ? lockdep_hardirqs_on+0xc7/0x140
    [  439.564556]  ? do_syscall_64+0xa7/0x190
    [  439.568401]  ? do_syscall_64+0xa7/0x190
    [  439.572249]  ? lockdep_hardirqs_on_prepare+0x17b/0x420
    [  439.577395]  entry_SYSCALL_64_after_hwframe+0x6e/0x76
    [  439.582460] RIP: 0033:0x7f6c0f73160d
    [  439.586047] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa=
 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05=
 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d f3 47 0c 00 f7 d8 64 89 01 48
    [  439.604792] RSP: 002b:00007ffd0ecad3b8 EFLAGS: 00000246 ORIG_RAX: 00=
00000000000139
    [  439.612368] RAX: ffffffffffffffda RBX: 0000565382a36740 RCX: 00007f6=
c0f73160d
    [  439.619506] RDX: 0000000000000000 RSI: 0000565382a362a0 RDI: 0000000=
000000003
    [  439.626644] RBP: 00007ffd0ecad470 R08: 0000000000000000 R09: 0000565=
382a37760
    [  439.633782] R10: 0000000000000003 R11: 0000000000000246 R12: 0000565=
382a362a0
    [  439.640925] R13: 0000000000000000 R14: 0000565382a38790 R15: 0000565=
382a362a0
    [  439.648066]  </TASK>
    [  439.650263] Modules linked in: xe(OE+) snd_hda_codec_hdmi snd_seq_du=
mmy snd_hrtimer rfcomm nf_conntrack_netbios_ns nf_conntrack_broadcast nft_f=
ib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf=
_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack nf_defrag_=
ipv6 nf_defrag_ipv4 ip_set nf_tables nfnetlink qrtr bnep sunrpc binfmt_misc=
 vfat fat intel_rapl_msr snd_sof_pci_intel_tgl iwlmvm intel_rapl_common snd=
_sof_intel_hda_common snd_soc_hdac_hda snd_sof_pci intel_uncore_frequency s=
nd_sof_xtensa_dsp intel_uncore_frequency_common snd_sof_intel_hda x86_pkg_t=
emp_thermal snd_sof intel_powerclamp mac80211 snd_sof_utils snd_soc_acpi_in=
tel_match snd_soc_acpi snd_soc_core coretemp snd_compress snd_sof_intel_hda=
_mlink snd_hda_ext_core kvm_intel snd_hda_intel snd_intel_dspcfg libarc4 sn=
d_hda_codec kvm snd_hwdep snd_hda_core btusb iwlwifi irqbypass snd_seq btrt=
l snd_seq_device iTCO_wdt btintel rapl pmt_telemetry intel_pmc_bxt snd_pcm =
intel_cstate btbcm ee1004 iTCO_vendor_support btmtk mei_hdcp
    [  439.650319]  mei_pxp pmt_class cfg80211 i2c_i801 snd_timer intel_unc=
ore wmi_bmof gigabyte_wmi bluetooth pcspkr snd i2c_smbus mei_me soundcore m=
ei idma64 rfkill intel_vsec intel_hid joydev acpi_tad acpi_pad sparse_keyma=
p loop zram drm_gpuvm hid_logitech_hidpp i915 crct10dif_pclmul crc32_pclmul=
 crc32c_intel polyval_clmulni polyval_generic ghash_clmulni_intel nvme r816=
9 sha512_ssse3 nvme_core pinctrl_alderlake hid_logitech_dj ip6_tables ip_ta=
bles fuse
    [  439.739896] Unloaded tainted modules: xe(OE):2 [last unloaded: xe(OE=
)]
    [  439.786092] ---[ end trace 0000000000000000 ]---
    [  439.790733] RIP: 0010:xe_ggtt_invalidate+0x150/0x260 [xe]
    [  439.796254] Code: 48 8d 7d 18 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 85=
 b3 00 00 00 48 b8 00 00 00 00 00 fc ff df 48 8b 5d 18 48 89 da 48 c1 ea 03=
 <80> 3c 02 00 0f 85 87 00 00 00 48 b8 00 00 00 00 00 fc ff df 48 8b
    [  439.815026] RSP: 0018:ffffc9000201eee8 EFLAGS: 00010246
    [  439.820262] RAX: dffffc0000000000 RBX: 0000000000000000 RCX: 0000000=
000000000
    [  439.827407] RDX: 0000000000000000 RSI: ffffffffb6ae4040 RDI: ffff888=
18231a478
    [  439.834549] RBP: ffff88818231a460 R08: 0000000000000001 R09: fffffbf=
ff7563e5c
    [  439.841691] R10: fffff52000403d92 R11: 0000000000000001 R12: ffff888=
185330028
    [  439.848835] R13: ffffffffffffffff R14: 0000000000001000 R15: 0000000=
000000000
    [  439.855978] FS:  00007f6c0fd92740(0000) GS:ffff888f76400000(0000) kn=
lGS:0000000000000000
    [  439.864072] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
    [  439.869824] CR2: 00007ffedd41de70 CR3: 00000001063ec000 CR4: 0000000=
000750ef0
    [  439.876966] PKRU: 55555554
   =20
    Fixes: 27ee413bbc0b ("drm/xe: Do not grab forcewakes when issuing GGTT =
TLB invalidation via GuC")
    Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch ba2149e0e3add9f607c6d41e20479d85ceb0769d drm-intel
82efadcb3c70 Revert "drm/xe: Do not grab forcewakes when issuing GGTT TLB i=
nvalidation via GuC"


