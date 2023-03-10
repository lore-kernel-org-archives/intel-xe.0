Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CEAEC6FA99
	for <intel-xe@archiver.kernel.org>; Fri, 10 Mar 2023 14:43:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3D2510E8D5;
	Fri, 10 Mar 2023 14:43:57 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F24F10E8D5
 for <intel-xe@freedesktop.org>; Fri, 10 Mar 2023 14:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678459435; x=1709995435;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=7lA6eCzfXon11alljs6c5soV5h6RbuEoNc/G9v17xI4=;
 b=j8iPiA3LwB6YTZVax0joFw0aRp8hNSC8CKy0YJ6LJgZ0i+ueMAiNgEr9
 aSzkuHnD9zXF+gbdS93xtEG2sBMyS7bn3sR0O1y7g4hfGhznaGvrJedk5
 YZuWrvuid5RR4bI+wamLWC61PBMZeYF1kCw77nHVFgMw+ei80iBTQeZSw
 h4G1WCxvUuhFS67GuD2wL2MdVLYxMZR98GRtjmp03X1WKsKDu+qHoNCE1
 mWOWnGcFqLHrat5xOjP4HHD3fNuGEqUIGwCtLgP00OJ+IiLE95WUk99gy
 SpaUbSbuzoFsmZP6ILiar9bzmViIrU9XmjheUXxuUtICL7z8ujf8GIHYn A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="317127838"
X-IronPort-AV: E=Sophos;i="5.98,250,1673942400"; d="scan'208";a="317127838"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 06:43:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="708029007"
X-IronPort-AV: E=Sophos;i="5.98,250,1673942400"; d="scan'208";a="708029007"
Received: from skallurr-mobl1.ger.corp.intel.com (HELO [10.249.254.199])
 ([10.249.254.199])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 06:43:38 -0800
Message-ID: <c127862429c3dd8ea61cf274fe4da1d19ca1804a.camel@linux.intel.com>
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Date: Fri, 10 Mar 2023 15:43:35 +0100
In-Reply-To: <ZAmJG/mzIwXT6y+k@nvishwa1-DESK>
References: <20230308191013.40431-1-thomas.hellstrom@linux.intel.com>
 <ZAmJG/mzIwXT6y+k@nvishwa1-DESK>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
Subject: Re: [Intel-xe] [PATCH] drm/xe/vm: Use the correct vma destroy
 sequence on userptr failure
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
Cc: intel-xe@freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, 2023-03-08 at 23:22 -0800, Niranjana Vishwanathapura wrote:
> On Wed, Mar 08, 2023 at 08:10:13PM +0100, Thomas Hellstr=C3=B6m wrote:
> > Fix the below warning by using the correct vma destroy sequence:
> >=20
> > [=C2=A0=C2=A0 92.204921] ------------[ cut here ]------------
> > [=C2=A0=C2=A0 92.204954] WARNING: CPU: 3 PID: 2449 at
> > drivers/gpu/drm/xe/xe_vm.c:933 xe_vma_destroy+0x280/0x290 [xe]
>=20
> Unrelated to this patch...not sure why this warning is only there for
> userptr BOs whereas prep_vma_destroy() is required for all BOs.

Thanks for reviewing, Niranjana. IIRC I added that warning while doing
a big userptr overhaul without looking as to whether it was needed for
bos as well.

Thanks,
Thomas


>=20
> This patch looks good to me.
> Reviewed-by: Niranjana Vishwanathapura
> <niranjana.vishwanathapura@intel.com>
>=20
> > [=C2=A0=C2=A0 92.205002] Modules linked in: ccm nft_objref cmac
> > nf_conntrack_netbios_ns nf_conntrack_broadcast nft_fib_inet
> > nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4
> > nf_reject_ipv6 nft_reject nft_ct nft_chain_nat ip6table_nat
> > ip6table_mangle ip6table_raw ip6table_security iptable_nat nf_nat
> > nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 iptable_mangle
> > iptable_raw iptable_security ip_set nf_tables nfnetlink
> > ip6table_filter iptable_filter bnep sunrpc vfat fat iwlmvm mac80211
> > intel_rapl_msr ee1004 ppdev intel_rapl_common snd_hda_codec_realtek
> > libarc4 iTCO_wdt snd_hda_codec_generic intel_pmc_bxt
> > x86_pkg_temp_thermal iTCO_vendor_support intel_powerclamp coretemp
> > intel_cstate iwlwifi btusb btrtl btbcm snd_hda_intel btintel
> > snd_intel_dspcfg eeepc_wmi snd_hda_codec asus_wmi bluetooth
> > snd_hwdep snd_seq ledtrig_audio snd_hda_core snd_seq_device
> > sparse_keymap cfg80211 snd_pcm intel_uncore joydev platform_profile
> > mei_me wmi_bmof intel_wmi_thunderbolt snd_timer pcspkr ecdh_generic
> > i2c_i801 snd
> > [=C2=A0=C2=A0 92.205060]=C2=A0 ecc mei rfkill soundcore idma64 i2c_smbu=
s
> > parport_pc parport acpi_pad acpi_tad xe drm_ttm_helper ttm
> > i2c_algo_bit drm_suballoc_helper kunit drm_buddy gpu_sched
> > drm_display_helper drm_kms_helper drm crct10dif_pclmul crc32_pclmul
> > crc32c_intel nvme nvme_core e1000e ghash_clmulni_intel
> > drm_panel_orientation_quirks video wmi pinctrl_tigerlake
> > usb_storage ip6_tables ip_tables fuse
> > [=C2=A0=C2=A0 92.205242] CPU: 3 PID: 2449 Comm: xe_vm Tainted: G=C2=A0=
=C2=A0=C2=A0=C2=A0
> > U=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 6.1.0+ #120
> > [=C2=A0=C2=A0 92.205254] Hardware name: ASUS System Product Name/PRIME =
B560M-
> > A AC, BIOS 0403 01/26/2021
> > [=C2=A0=C2=A0 92.205266] RIP: 0010:xe_vma_destroy+0x280/0x290 [xe]
> > [=C2=A0=C2=A0 92.205299] Code: 74 15 48 8b 93 a0 01 00 00 48 8b 83 a8 0=
1 00
> > 00 48 89 42 08 48 89 10 4c 89 ab a0 01 00 00 4c 89 ab a8 01 00 00
> > e9 1b fe ff ff <0f> 0b e9 a3 fe ff ff 0f 0b e9 82 fe ff ff 66 90 0f
> > 1f 44 00 00 48
> > [=C2=A0=C2=A0 92.205322] RSP: 0018:ffffaadd465c3a58 EFLAGS: 00010246
> > [=C2=A0=C2=A0 92.205331] RAX: 0000000000000000 RBX: ffff9706d53ed400 RC=
X:
> > 0000000000000001
> > [=C2=A0=C2=A0 92.205341] RDX: ffff9706d53ed480 RSI: ffffffffa756dc2b RD=
I:
> > ffffffffa760a05e
> > [=C2=A0=C2=A0 92.205351] RBP: 0000000000000000 R08: 0000000000000000 R0=
9:
> > 000000002c5370a2
> > [=C2=A0=C2=A0 92.205361] R10: ffff9706ca520000 R11: 0000000022c5370a R1=
2:
> > ffff9706cad03800
> > [=C2=A0=C2=A0 92.205370] R13: 000000000004ffff R14: fffffffffffffff2 R1=
5:
> > 0000000000000000
> > [=C2=A0=C2=A0 92.205380] FS:=C2=A0 00007fe98203a940(0000)
> > GS:ffff970dffac0000(0000) knlGS:0000000000000000
> > [=C2=A0=C2=A0 92.205392] CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 00000000=
80050033
> > [=C2=A0=C2=A0 92.205400] CR2: 00007fe982ccb000 CR3: 000000010d6e6003 CR=
4:
> > 0000000000770ee0
> > [=C2=A0=C2=A0 92.205410] PKRU: 55555554
> > [=C2=A0=C2=A0 92.205415] Call Trace:
> > [=C2=A0=C2=A0 92.205419]=C2=A0 <TASK>
> > [=C2=A0=C2=A0 92.205426]=C2=A0 vm_bind_ioctl_lookup_vma+0x9bb/0xbf0 [xe=
]
> > [=C2=A0=C2=A0 92.205461]=C2=A0 ? lock_is_held_type+0xe3/0x140
> > [=C2=A0=C2=A0 92.205472]=C2=A0 ? xe_vm_find_overlapping_vma+0x77/0x90 [=
xe]
> > [=C2=A0=C2=A0 92.205503]=C2=A0 ? __vm_bind_ioctl_lookup_vma.constprop.0=
+0x9e/0xe0
> > [xe]
> > [=C2=A0=C2=A0 92.205533]=C2=A0 ? __lock_acquire+0x3a3/0x1fb0
> > [=C2=A0=C2=A0 92.205543]=C2=A0 ? register_lock_class+0x38/0x480
> > [=C2=A0=C2=A0 92.205550]=C2=A0 ? __lock_acquire+0x3a3/0x1fb0
> > [=C2=A0=C2=A0 92.205558]=C2=A0 ? __lock_acquire+0x3a3/0x1fb0
> > [=C2=A0=C2=A0 92.205567]=C2=A0 ? __lock_acquire+0x3a3/0x1fb0
> > [=C2=A0=C2=A0 92.205579]=C2=A0 ? lock_acquire+0xbf/0x2b0
> > [=C2=A0=C2=A0 92.205586]=C2=A0 ? lock_acquire+0xcf/0x2b0
> > [=C2=A0=C2=A0 92.205597]=C2=A0 xe_vm_bind_ioctl+0x977/0x1c30 [xe]
> > [=C2=A0=C2=A0 92.205630]=C2=A0 ? find_held_lock+0x2b/0x80
> > [=C2=A0=C2=A0 92.205640]=C2=A0 ? lock_release+0x131/0x2c0
> > [=C2=A0=C2=A0 92.205648]=C2=A0 ? xe_vm_ttm_bo+0x40/0x40 [xe]
> > [=C2=A0=C2=A0 92.205677]=C2=A0 drm_ioctl_kernel+0xa1/0x150 [drm]
> > [=C2=A0=C2=A0 92.205706]=C2=A0 drm_ioctl+0x221/0x420 [drm]
> > [=C2=A0=C2=A0 92.205727]=C2=A0 ? xe_vm_ttm_bo+0x40/0x40 [xe]
> > [=C2=A0=C2=A0 92.205764]=C2=A0 __x64_sys_ioctl+0x8d/0xd0
> > [=C2=A0=C2=A0 92.205774]=C2=A0 do_syscall_64+0x37/0x90
> > [=C2=A0=C2=A0 92.205781]=C2=A0 entry_SYSCALL_64_after_hwframe+0x63/0xcd
> > [=C2=A0=C2=A0 92.205790] RIP: 0033:0x7fe982be8d6f
> > [=C2=A0=C2=A0 92.205797] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c=
7 04
> > 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10
> > 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 18 48 8b 44 24 18 64 48 2b
> > 04 25 28 00 00
> > [=C2=A0=C2=A0 92.205821] RSP: 002b:00007ffde9f9c560 EFLAGS: 00000246
> > ORIG_RAX: 0000000000000010
> > [=C2=A0=C2=A0 92.205832] RAX: ffffffffffffffda RBX: 00007fadeadbe000 RC=
X:
> > 00007fe982be8d6f
> > [=C2=A0=C2=A0 92.205842] RDX: 00007ffde9f9c5f0 RSI: 0000000040786445 RD=
I:
> > 0000000000000003
> > [=C2=A0=C2=A0 92.205851] RBP: 00007ffde9f9c5f0 R08: 00007fadeadbe000 R0=
9:
> > 0000000000040000
> > [=C2=A0=C2=A0 92.205861] R10: 0000000000000003 R11: 0000000000000246 R1=
2:
> > 0000000040786445
> > [=C2=A0=C2=A0 92.205871] R13: 0000000000000003 R14: 0000000000000003 R1=
5:
> > 00007fe982e02000
> > [=C2=A0=C2=A0 92.205888]=C2=A0 </TASK>
> > [=C2=A0=C2=A0 92.205892] irq event stamp: 82723
> > [=C2=A0=C2=A0 92.205897] hardirqs last=C2=A0 enabled at (82731):
> > [<ffffffffa617660e>] __up_console_sem+0x5e/0x70
> > [=C2=A0=C2=A0 92.205910] hardirqs last disabled at (82738):
> > [<ffffffffa61765f3>] __up_console_sem+0x43/0x70
> > [=C2=A0=C2=A0 92.205922] softirqs last=C2=A0 enabled at (82182):
> > [<ffffffffa60f026d>] __irq_exit_rcu+0xed/0x160
> > [=C2=A0=C2=A0 92.205935] softirqs last disabled at (82163):
> > [<ffffffffa60f026d>] __irq_exit_rcu+0xed/0x160
> > [=C2=A0=C2=A0 92.205947] ---[ end trace 0000000000000000 ]---
> >=20
> > Reported-by: Francois Dugast <francois.dugast@intel.com>
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_vm.c | 3 ++-
> > 1 file changed, 2 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > b/drivers/gpu/drm/xe/xe_vm.c
> > index 6cf7172e84cc..e8e178922082 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -2811,7 +2811,8 @@ static struct xe_vma
> > *vm_bind_ioctl_lookup_vma(struct xe_vm *vm,
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0err =3D xe_vma_userptr_pin_pages(vma);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0if (err) {
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0xe_vma=
_destroy(vma, NULL);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0prep_v=
ma_destroy(vm, vma);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0xe_vma=
_destroy_unlocked(vma);
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
return ERR_PTR(err);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0} else {
> > --=20
> > 2.39.2
> >=20

