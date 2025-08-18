Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D74CA0ED1
	for <intel-xe@archiver.kernel.org>; Mon, 18 Aug 2025 09:19:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C25B210E401;
	Mon, 18 Aug 2025 09:19:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ix8b7TSg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BC2F10E401
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Aug 2025 09:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755508796; x=1787044796;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ARlg88jpCCpn0S1nIM8WHgSoJaujkWzFrNI9X/Y1tWM=;
 b=ix8b7TSgVMOJBEjWR+McVIzhsTZHA5h9GNm05VDEbr+vCi60SgUcr0WX
 8IqtnQEGULIscLVvG8EK5a/j6VTQNgZBOkdC8SeX/75DcOE5BHKHWzLvv
 UJoGlqANjR7d9s4InYJtmAJ+XWi0JPtgJfYfU8NlIuerU/LHnV13JX8iX
 9o8pWzJ5LLpTNmy1WMbkvJW/KuvEY1f6HZIIlZrGPqXYXKSwOvLAob5jK
 dBPPtjEjXthGnJ6FoS2LKsE8Zg1H0chY4gSRXWESZE3Xj6WY7RMOObE7F
 484qZtlzX/Sbn7G5qYguRwbCgDjb3suCJIZ6X8ldrEvBSumIiCY1wQ9+Y g==;
X-CSE-ConnectionGUID: s7SbjGJ+Q+G9jWs9wHGp1w==
X-CSE-MsgGUID: Q31UXDVVSBSjJaQ/GhsYQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="68821149"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="68821149"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 02:19:55 -0700
X-CSE-ConnectionGUID: 2IFQ+hj9TuK+eR9WQIp1Qw==
X-CSE-MsgGUID: NMr3t8ybQlmgaPcYrHX4nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="167137657"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.245.224])
 ([10.245.245.224])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 02:19:52 -0700
Message-ID: <dd4ee26cecc93ca2faff93ffa65be77c92f02196.camel@linux.intel.com>
Subject: Re: [05/15] drm/xe: Introduce an xe_validation wrapper around drm_exec
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Simon Richter <Simon.Richter@hogyros.de>
Cc: intel-xe@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Jani Nikula
 <jani.nikula@intel.com>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Matthew Auld <matthew.auld@intel.com>
Date: Mon, 18 Aug 2025 11:19:49 +0200
In-Reply-To: <20250817140518.GA2581807@psionic12.psi5.com>
References: <20250813105121.5945-6-thomas.hellstrom@linux.intel.com>
 <20250817140518.GA2581807@psionic12.psi5.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
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

On Sun, 2025-08-17 at 16:05 +0200, Simon Richter wrote:
> Hi,
>=20
> On Wed, Aug 13, 2025 at 12:51:11PM +0200, Thomas Hellstr=C3=B6m wrote:
>=20
> > +static int xe_validation_lock(struct xe_validation_ctx *ctx)
> > +{
> > +	struct xe_validation_device *val =3D ctx->val;
> > +	int ret =3D 0;
> > +
> > +	if (ctx->flags & DRM_EXEC_INTERRUPTIBLE_WAIT) {
> > +		if (ctx->request_exclusive)
> > +			ret =3D down_write_killable(&val->lock);
> > +		else
> > +			ret =3D down_read_interruptible(&val->lock);
> > +	} else {
> > +		if (ctx->request_exclusive)
> > +			down_write(&val->lock);
> > +		else
> > +			down_read(&val->lock);
> > +	}
> > +
> > +	if (!ret) {
> > +		ctx->lock_held =3D true;
> > +		ctx->lock_held_exclusive =3D ctx->request_exclusive;
> > +	}
> > +
> > +	return ret;
> > +}
>=20
> This can fail if DRM_EXEC_INTERRUPTIBLE_WAIT is set, ...
>=20
> > +int xe_validation_ctx_init(struct xe_validation_ctx *ctx, struct
> > xe_validation_device *val,
> > +			=C2=A0=C2=A0 struct drm_exec *exec, u32 flags,
> > unsigned int nr,
> > +			=C2=A0=C2=A0 bool exclusive)
> > +{
> > +	int ret;
> > +
> > +	ctx->exec =3D exec;
> > +	ctx->val =3D val;
> > +	ctx->lock_held =3D false;
> > +	ctx->lock_held_exclusive =3D false;
> > +	ctx->request_exclusive =3D exclusive;
> > +	ctx->flags =3D flags;
> > +	ctx->nr =3D nr;
> > +
> > +	ret =3D xe_validation_lock(ctx);
> > +	if (ret)
> > +		return ret;
>=20
> ... causing an error to be returned here, which...
>=20
> > +DEFINE_CLASS(xe_validation, struct xe_validation_ctx *,
> > +	=C2=A0=C2=A0=C2=A0=C2=A0 if (!IS_ERR(_T)) xe_validation_ctx_fini(_T);=
,
> > +	=C2=A0=C2=A0=C2=A0=C2=A0 ({_ret =3D xe_validation_ctx_init(_ctx, _val=
, _exec,
> > _flags, 0, _excl);
> > +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _ret ? NULL : _ctx; }),
> > +	=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_validation_ctx *_ctx, struct
> > xe_validation_device *_val,
> > +	=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_exec *_exec, u32 _flags, int _ret=
, bool
> > _excl);
>=20
> ... causes a NULL pointer to be recorded for the scoped guard here,
> which
> is then passed to xe_validation_ctx_fini on scope exit, causing
>=20
> Kernel attempted to read user page (0) - exploit attempt? (uid: 1000)
> BUG: Kernel NULL pointer dereference on read at 0x00000000
> Faulting instruction address: 0xc008000014bcf2a8
> Oops: Kernel access of bad area, sig: 11 [#1]
> LE PAGE_SIZE=3D64K MMU=3DRadix=C2=A0 SMP NR_CPUS=3D2048 NUMA PowerNV
> Modules linked in: xt_conntrack nft_chain_nat xt_MASQUERADE nf_nat
> nf_conntrack_netlink nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4
> xfrm_user xfrm_algo xt_addrtype nft_compat x_tables nf_tables
> nfnetlink br_netfilter bridge stp llc overlay binfmt_misc mei_gsc
> mei_me snd_hda_codec_intelhdmi mei snd_hda_codec_hdmi mtd_intel_dg xe
> joydev evdev drm_gpuvm drm_buddy gpu_sched drm_exec
> drm_suballoc_helper drm_ttm_helper ttm drm_display_helper hid_generic
> usbhid cec hid rc_core drm_client_lib drm_kms_helper snd_hda_intel
> snd_intel_dspcfg drm snd_hda_codec snd_hda_core aes_gcm_p10_crypto
> crypto_simd snd_hwdep cryptd xts snd_pcm drm_panel_orientation_quirks
> ghash_generic ofpart snd_timer vmx_crypto powernv_flash i2c_algo_bit
> snd ipmi_powernv gf128mul mtd ipmi_devintf configfs ipmi_msghandler
> opal_prd at24 soundcore regmap_i2c ext4 crc16 mbcache jbd2 dm_mod
> xhci_pci xhci_hcd nvme tg3 usbcore nvme_core libphy nvme_keyring
> nvme_auth mdio_bus usb_common
> CPU: 24 UID: 0 PID: 2438 Comm: Xorg Not tainted 6.17.0-rc1+ #1
> VOLUNTARY
> Hardware name: T2P9D01 REV 1.01 POWER9 0x4e1202 opal:skiboot-9858186
> PowerNV
> NIP:=C2=A0 c008000014bcf2a8 LR: c008000014bd5724 CTR: c0080000141a0248
> REGS: c00000000fa0f4a0 TRAP: 0300=C2=A0=C2=A0 Not tainted=C2=A0 (6.17.0-r=
c1+)
> MSR:=C2=A0 900000000280b033 <SF,HV,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>=C2=A0 CR=
:
> 88002844=C2=A0 XER: 00000
>=20
> CFAR: c008000014bd5720 DAR: 0000000000000000 DSISR: 40000000 IRQMASK:
> 0
> GPR00: c008000014bd5724 c00000000fa0f740 c008000014df9200
> 0000000000000000
> GPR04: c000000023340000 c000000023340000 0000000000000031
> fffffffffffe0000
> GPR08: c00000002d0075a8 fffffffffffff000 0000000000000000
> c008000014d8d3b8
> GPR12: c0080000141a0248 c0000007fffcc800 0000000000000000
> 0000000000000000
> GPR16: 0000000000000001 0000000000000000 0000000000000001
> c0002000084dff40
> GPR20: c000000019230308 fffffffffffff000 0000000000000000
> fffffffffffff000
> GPR24: 0000000000000000 0000000000000000 0000000000000001
> c0002000134ab000
> GPR28: 0000000000000000 c00020001333e818 0000000000000000
> 0000000000000000
> NIP [c008000014bcf2a8] xe_validation_ctx_fini+0x20/0x90 [xe]
> LR [c008000014bd5724] new_vma+0x32c/0x400 [xe]
> Call Trace:
> [c00000000fa0f740] [0000000000000001] 0x1 (unreliable)
> [c00000000fa0f770] [c008000014bd5724] new_vma+0x32c/0x400 [xe]
> [c00000000fa0f860] [c008000014bd5abc]
> vm_bind_ioctl_ops_parse+0x2c4/0x9b0 [xe]
> [c00000000fa0f920] [c008000014bd9dac] xe_vm_bind_ioctl+0x1344/0x17a0
> [xe]
> [c00000000fa0faf0] [c00800001349ca58] drm_ioctl_kernel+0x100/0x1a0
> [drm]
> [c00000000fa0fb50] [c00800001349cd88] drm_ioctl+0x290/0x690 [drm]
> [c00000000fa0fcc0] [c008000014b1fcdc] xe_drm_ioctl+0x74/0xd0 [xe]
> [c00000000fa0fd10] [c0000000006ec654] sys_ioctl+0x594/0x1020
> [c00000000fa0fe10] [c00000000002c020]
> system_call_exception+0x120/0x240
> [c00000000fa0fe50] [c00000000000cfdc]
> system_call_vectored_common+0x15c/0x2ec

Right, that's been pointed out also by Matt Brost's review.=C2=A0
The idea here is that if the interruptible lock returns -EINTR, then we
should not enter the code within xe_validation_guard() either so on top
of the fix for this, it looks like I need to mark it as conditional.

Thanks,
Thomas



>=20
> =C2=A0=C2=A0 Simon

