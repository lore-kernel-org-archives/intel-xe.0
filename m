Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A851EF3718
	for <intel-xe@archiver.kernel.org>; Mon,  9 Mar 2026 17:30:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF34B10E18F;
	Mon,  9 Mar 2026 17:30:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j6buMbTL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 275FA10E18F
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Mar 2026 17:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773077410; x=1804613410;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=3AtQi3iPZShwgK6elMP27cpLht63ImoHSb4KrC9obfg=;
 b=j6buMbTL2l3Efy9JoheM4ObH280EpsvRHmBT3JRdwzx07xm5qkl7IhI5
 9Ra0g1kwJ8c0Y0JL2Zo4YejaLejs0TiTOdjU84S9Dgakv45zw+SrsKlkp
 k0qZsURB2ApjWhlA76CXA4f6YkZtG1UIxo8d5C2cMN2z5n0PialbMUU0C
 FgpbQxldqzNxdWrECM6YCoz5BuEYxopoG04mg6v8LD9M8WrJfjEAdEppC
 LTZVYMcUHZic+c2OPd3ZljZo1L5lA/Zgbu9+CyxqaSViO/aNaKacaKCW5
 Ia3Gxn46sHEFWq31CUsbp+0WiMeek3oTKFs135Z8XAdcT7ZOHx9owd/gQ w==;
X-CSE-ConnectionGUID: 2TqHMCZdQ+mU50puXkE32g==
X-CSE-MsgGUID: rZOfz2hjS3S4Y8D3G1BWDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="77960879"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="77960879"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 10:30:09 -0700
X-CSE-ConnectionGUID: 7cke/GlzSPWcnUvBnyXOaQ==
X-CSE-MsgGUID: jQr8N2+rQqaE0VeMQIZPKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="224756854"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.245.233])
 ([10.245.245.233])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 10:30:07 -0700
Message-ID: <a295b9cf93bb892505b8d209ca7806868c564b32.camel@linux.intel.com>
Subject: Re: [PATCH V6 3/4] drm/xe/xe3p_lpg: Restrict UAPI to enable L2
 flush optimization
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, "Zhang, Carl"
 <carl.zhang@intel.com>,  "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Cc: "Souza, Jose" <jose.souza@intel.com>, "Mrozek, Michal"
 <michal.mrozek@intel.com>
Date: Mon, 09 Mar 2026 18:30:05 +0100
In-Reply-To: <07e5e84d-070b-4fb9-84b9-f80f63b14799@intel.com>
References: <20260305121902.1892593-6-tejas.upadhyay@intel.com>
 <20260305121902.1892593-9-tejas.upadhyay@intel.com>
 <3d8e09d5-c82c-4d8f-91c8-6901860cfc6b@intel.com>
 <PH0PR11MB55798CDC10164A2ACEBC8B4A877AA@PH0PR11MB5579.namprd11.prod.outlook.com>
 <9bb8eb20-659c-45a3-8021-5c54620e707b@intel.com>
 <PH0PR11MB55795DE53945E3945748F1628779A@PH0PR11MB5579.namprd11.prod.outlook.com>
 <07e5e84d-070b-4fb9-84b9-f80f63b14799@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
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

On Mon, 2026-03-09 at 17:22 +0000, Matthew Auld wrote:
> On 09/03/2026 15:29, Zhang, Carl wrote:
> >=20
> >=20
> > > -----Original Message-----
> > > From: Auld, Matthew <matthew.auld@intel.com>
> > > Sent: Friday, March 6, 2026 6:09 PM
> > > To: Zhang, Carl <carl.zhang@intel.com>; Upadhyay, Tejas
> > > <tejas.upadhyay@intel.com>; intel-xe@lists.freedesktop.org
> > > Cc: thomas.hellstrom@linux.intel.com; Souza, Jose
> > > <jose.souza@intel.com>;
> > > Mrozek, Michal <michal.mrozek@intel.com>
> > > Subject: Re: [PATCH V6 3/4] drm/xe/xe3p_lpg: Restrict UAPI to
> > > enable L2 flush
> > > optimization
> > >=20
> > > On 06/03/2026 07:11, Zhang, Carl wrote:
> > > > My understanding:
> > > > 1. GuC uses a timer to monitor media activity status. The mode
> > > > becomes
> > > active only when no media tasks have been detected for 5 seconds.
> > > From the
> > > media perspective, this allows legacy behavior to be maintained
> > > without
> > > requiring any changes.
> > > > 2. The media UMD only needs to set usage hints to gmmlib, which
> > > > then
> > > manages the PAT index. Therefore, the UMD itself should not
> > > require
> > > changes=E2=80=94only gmmlib needs to be updated to return PAT index 1=
9 on
> > > NVL for
> > > imported surfaces.
> > > > My open is:
> > > > 1. In some applications (e.g., ChromeOS), memory is allocated
> > > > centrally
> > > (possibly by minigbm) and then shared across different
> > > components. If there
> > > are no media tasks, the system operates in persistent mode.
> > > However, based
> > > on current interfaces, imported memory should be configured as
> > > transient +
> > > 1-way coherency. This raises a question: if this memory is used
> > > exclusively by
> > > compute (not media), is this the expected behavior?
> > >=20
> > > 2way is also allowed.
> > >=20
> > =C2=A0=20
> > But 2way is slower than 1 way , right?
>=20
> Likely it would be, I think. But for Media only, not sure.
>=20
> >=20
> > > > 2. For userptr memory that is used by only one component, I
> > > > believe 1-way
> > > coherency should be sufficient?
> > >=20
> > > I think for 1) and 2), it mostly comes down to CPU/host <-> GPU
> > > coherency,
> > > right? If you don't use 2WAY or XA, userspace would now have to
> > > manually
> > > handle the coherency, in case in "persistent" mode. It doesn't
> > > matter if there
> > > is just one component/app, the coherency issue would still be
> > > there.
> > >=20
> > For Media (vdbox, vebox), does not use L2 cache,=C2=A0 so, if it is
> > userptr
> > 1-way is enough, just need snoop cpu cache.
> >=20
> > > For example, for 2) if you only use 1way without XA, then AFAIK
> > > you now
> > > need manual flushing, if GPU side is cached and CPU is expecting
> > > to see
> > > coherent view. Like say GPU writes something and CPU later reads
> > > it. The 1-
> > > way here would just ensure that GPU snoops the CPU caches on the
> > > first
> > > access. But if it then gets cached on GPU side, there is now no
> > > guaranteed
> > > flush when that GPU job is complete, when in "persistent" mode.
> > >=20
> > a. my understanding , L2 is used only for RCS and VCS. Not for VCS
> > and VECS.
> > Please correct me if there is any misunderstanding.=C2=A0 So, if one
> > external resource
> > is only used by media . never be used by CCS RCS. whether we should
> > still have
> > such limitation.
>=20
> Yeah, that matches my understanding. It sounded like Media access
> does=20
> not go via l2, so I assume goes directly to system memory. Hence why
> l2=20
> needs to be fully flushed if sharing something with Media (which is=20
> assumed whenever Media is currently turned on).
>=20
> >=20
> > b. if there is media task, seems it cant be "persistent" mode. Of
> > course, maybe,
> > it is "persistent" mode, then media task comes, it turns to
> > "transient" mode.
> > But the data is still in cache , not flushed.=C2=A0 for this case, I
> > agree that any resource
> > used firstly by CCS or RCS then shared it to media, it should be
> > set to 2-way or
> > 1-way + XA.
> >=20
> > > So assumption was that for userptr, the memory comes from the
> > > host, and
> > > access is likely shared with CPU/host, so seems reasonable you
> > > would want
> > > XA or 2WAY. For foreign imported memory you are likely sharing
> > > with host or
> > > some other device/driver, so seems reasonable you would probably
> > > want XA
> > > or 2WAY.
> > >=20
> > > We can drop the restrictions, if userspace really needs it, but
> > > it would be up to
> > > userspace to deal with all the CPU/host vs GPU coherency fun, if
> > > applicable.
> > > The restrictions do simplify things a little on the KMD side,
> > > plus the validation
> > > angle in IGT.
> > >=20
> > I am thinking whether it is too strict.=C2=A0 There is different
> > useagecases.
>=20
> Do you know which index(s) you would pick instead, for Media only
> cases?=20
> I think that is the only edge case you are concerned with here?
>=20
> Is it not the case that if you are only submitting within Media and
> it=20
> if it doesn't actually use l2, wouldn't the XA and l2 cache mode
> stuff=20
> be a no-op anyway, since the access from Media side never goes
> through l2?

I was wondering whether that could actually be the case as well.

/Thomas


>=20
> Do you know which index that we don't allow, would give=20
> different/preferred behaviour for Media only case?
>=20
> >=20
> > > >=20
> > > > Thanks
> > > > Carl
> > > >=20
> > > > > -----Original Message-----
> > > > > From: Auld, Matthew <matthew.auld@intel.com>
> > > > > Sent: Thursday, March 5, 2026 10:00 PM
> > > > > To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
> > > > > xe@lists.freedesktop.org
> > > > > Cc: thomas.hellstrom@linux.intel.com; Zhang, Carl
> > > <carl.zhang@intel.com>;
> > > > > Souza, Jose <jose.souza@intel.com>; Mrozek, Michal
> > > > > <michal.mrozek@intel.com>
> > > > > Subject: Re: [PATCH V6 3/4] drm/xe/xe3p_lpg: Restrict UAPI to
> > > > > enable L2
> > > flush
> > > > > optimization
> > > > >=20
> > > > > On 05/03/2026 12:19, Tejas Upadhyay wrote:
> > > > > > When set, starting xe3p_lpg, the L2 flush optimization
> > > > > > feature will
> > > > > > control whether L2 is in Persistent or Transient mode
> > > > > > through
> > > > > > monitoring of media activity.
> > > > > >=20
> > > > > > To enable L2 flush optimization include new feature flag
> > > > > > GUC_CTL_ENABLE_L2FLUSH_OPT for Novalake platforms when
> > > > > > media
> > > type
> > > > > is
> > > > > > detected.
> > > > > >=20
> > > > > > Tighten UAPI validation to restrict userptr, svm and dmabuf
> > > > > > mappings
> > > > > > to be either 2WAY or XA+1WAY
> > > > > >=20
> > > > > > V5(Thomas): logic correction
> > > > > > V4(MattA): Modify uapi doc and commit
> > > > > > V3(MattA): check valid op and pat_index value
> > > > > > V2(MattA): validate dma-buf bos and madvise pat-index
> > > > > >=20
> > > > > > Acked-by: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>
> > > > > > Acked-by: Michal Mrozek <michal.mrozek@intel.com>
> > > > > > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > > > > ---
> > > > > > =C2=A0=C2=A0=C2=A0 drivers/gpu/drm/xe/xe_guc.c=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 +++
> > > > > > =C2=A0=C2=A0=C2=A0 drivers/gpu/drm/xe/xe_guc_fwif.h=C2=A0=C2=A0=
 |=C2=A0 1 +
> > > > > > =C2=A0=C2=A0=C2=A0 drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 8 ++++++++
> > > > > > =C2=A0=C2=A0=C2=A0 drivers/gpu/drm/xe/xe_vm_madvise.c | 23
> > > > > > +++++++++++++++++++++++
> > > > > > =C2=A0=C2=A0=C2=A0 include/uapi/drm/xe_drm.h=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 +++-
> > > > > > =C2=A0=C2=A0=C2=A0 5 files changed, 38 insertions(+), 1 deletio=
n(-)
> > > > > >=20
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_guc.c
> > > > > > b/drivers/gpu/drm/xe/xe_guc.c
> > > > > > index 54d2fc780127..43dc4353206f 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_guc.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > > > > > @@ -98,6 +98,9 @@ static u32 guc_ctl_feature_flags(struct
> > > > > > xe_guc *guc)
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0	if (xe_guc_using_main_gamctrl_queues(g=
uc))
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0		flags |=3D GUC_CTL_MAIN_GAMCTRL_QUEUE=
S;
> > > > > >=20
> > > > > > +	if (GRAPHICS_VER(xe) >=3D 35 && !IS_DGFX(xe) &&
> > > > > xe_gt_is_media_type(guc_to_gt(guc)))
> > > > > > +		flags |=3D GUC_CTL_ENABLE_L2FLUSH_OPT;
> > > > >=20
> > > > > Pending whether we also need this on primary GT or not. Since
> > > > > it sounded
> > > > > like it would also need to know whether to do a targeted or
> > > > > full flush
> > > based
> > > > > on current Media status, and it's unclear if here we are
> > > > > meant to opt into
> > > that
> > > > > for every GT/GuC instance vs just the Media GuC.
> > > > >=20
> > > > > Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> > > > >=20
> > > > > > +
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0	return flags;
> > > > > > =C2=A0=C2=A0=C2=A0 }
> > > > > >=20
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h
> > > > > > b/drivers/gpu/drm/xe/xe_guc_fwif.h
> > > > > > index bb8f71d38611..b73fae063fac 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> > > > > > +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
> > > > > > @@ -67,6 +67,7 @@ struct guc_update_exec_queue_policy {
> > > > > > =C2=A0=C2=A0=C2=A0 #define=C2=A0=C2=A0 GUC_CTL_ENABLE_PSMI_LOGG=
ING	BIT(7)
> > > > > > =C2=A0=C2=A0=C2=A0 #define=C2=A0=C2=A0 GUC_CTL_MAIN_GAMCTRL_QUE=
UES	BIT(9)
> > > > > > =C2=A0=C2=A0=C2=A0 #define=C2=A0=C2=A0 GUC_CTL_DISABLE_SCHEDULE=
R	BIT(14)
> > > > > > +#define=C2=A0=C2=A0 GUC_CTL_ENABLE_L2FLUSH_OPT	BIT(15)
> > > > > >=20
> > > > > > =C2=A0=C2=A0=C2=A0 #define GUC_CTL_DEBUG			3
> > > > > > =C2=A0=C2=A0=C2=A0 #define=C2=A0=C2=A0 GUC_LOG_VERBOSITY		REG_G=
ENMASK(1, 0)
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > > > > > b/drivers/gpu/drm/xe/xe_vm.c
> > > > > > index da0ce0b3704c..0b236e08c158 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > > > > @@ -3481,6 +3481,10 @@ static int
> > > > > > vm_bind_ioctl_check_args(struct
> > > > > xe_device *xe, struct xe_vm *vm,
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0				 op =3D=3D
> > > > > DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0		=C2=A0=C2=A0=C2=A0 XE_IOCTL_DBG(xe, c=
oh_mode =3D=3D
> > > > > > XE_COH_NONE &&
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0				 op =3D=3D
> > > > > DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
> > > > > > +		=C2=A0=C2=A0=C2=A0 XE_IOCTL_DBG(xe,
> > > > > > xe_device_is_l2_flush_optimized(xe) &&
> > > > > > +				 (op =3D=3D
> > > > > DRM_XE_VM_BIND_OP_MAP_USERPTR ||
> > > > > > +				=C2=A0 is_cpu_addr_mirror) &&
> > > > > > +				 (pat_index !=3D 19 &&
> > > > > > coh_mode !=3D
> > > > > XE_COH_2WAY)) ||
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0		=C2=A0=C2=A0=C2=A0 XE_IOCTL_DBG(xe, c=
omp_en &&
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0				 op =3D=3D
> > > > > DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0		=C2=A0=C2=A0=C2=A0 XE_IOCTL_DBG(xe, o=
p =3D=3D
> > > > > DRM_XE_VM_BIND_OP_MAP_USERPTR && @@
> > > > > > -3615,6 +3619,10 @@ static int
> > > > > > xe_vm_bind_ioctl_validate_bo(struct
> > > > > xe_device *xe, struct xe_bo *bo,
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0	if (XE_IOCTL_DBG(xe, bo->ttm.base.impo=
rt_attach &&
> > > > > > comp_en))
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0		return -EINVAL;
> > > > > >=20
> > > > > > +	if (XE_IOCTL_DBG(xe, bo->ttm.base.import_attach &&
> > > > > xe_device_is_l2_flush_optimized(xe) &&
> > > > > > +			 (pat_index !=3D 19 && coh_mode !=3D
> > > > > > XE_COH_2WAY)))
> > > > > > +		return -EINVAL;
> > > > > > +
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0	/* If a BO is protected it can only be=
 mapped if
> > > > > > the key is still valid */
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0	if ((bind_flags & DRM_XE_VM_BIND_FLAG_=
CHECK_PXP)
> > > > > > &&
> > > > > xe_bo_is_protected(bo) &&
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0	=C2=A0=C2=A0=C2=A0 op !=3D DRM_XE_VM_B=
IND_OP_UNMAP && op !=3D
> > > > > > DRM_XE_VM_BIND_OP_UNMAP_ALL) diff --git
> > > > > > a/drivers/gpu/drm/xe/xe_vm_madvise.c
> > > > > > b/drivers/gpu/drm/xe/xe_vm_madvise.c
> > > > > > index 07169586e35f..376c014239ee 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> > > > > > @@ -411,6 +411,7 @@ int xe_vm_madvise_ioctl(struct
> > > > > > drm_device *dev,
> > > > > void *data, struct drm_file *fil
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0	struct xe_vmas_in_madvise_range madvis=
e_range =3D
> > > > > > {.addr =3D args-
> > > > > > start,
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0						=09
> > > > > > .range =3D=C2=A0 args-
> > > > > > range, };
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0	struct xe_madvise_details details;
> > > > > > +	u16 pat_index, coh_mode;
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0	struct xe_vm *vm;
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0	struct drm_exec exec;
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0	int err, attr_type;
> > > > > > @@ -447,6 +448,17 @@ int xe_vm_madvise_ioctl(struct
> > > > > > drm_device
> > > *dev,
> > > > > void *data, struct drm_file *fil
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0	if (err || !madvise_range.num_vmas)
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0		goto madv_fini;
> > > > > >=20
> > > > > > +	if (args->type =3D=3D DRM_XE_MEM_RANGE_ATTR_PAT) {
> > > > > > +		pat_index =3D array_index_nospec(args-
> > > > > > >pat_index.val, xe-
> > > > > > pat.n_entries);
> > > > > > +		coh_mode =3D xe_pat_index_get_coh_mode(xe,
> > > > > > pat_index);
> > > > > > +		if (XE_IOCTL_DBG(xe,
> > > > > > madvise_range.has_svm_userptr_vmas
> > > > > &&
> > > > > > +			=09
> > > > > > xe_device_is_l2_flush_optimized(xe) &&
> > > > > > +				 (pat_index !=3D 19 &&
> > > > > > coh_mode !=3D
> > > > > XE_COH_2WAY))) {
> > > > > > +			err =3D -EINVAL;
> > > > > > +			goto madv_fini;
> > > > > > +		}
> > > > > > +	}
> > > > > > +
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0	if (madvise_range.has_bo_vmas) {
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0		if (args->type =3D=3D
> > > > > > DRM_XE_MEM_RANGE_ATTR_ATOMIC) {
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0			if (!check_bo_args_are_sane(vm,
> > > > > madvise_range.vmas, @@ -464,6
> > > > > > +476,17 @@ int xe_vm_madvise_ioctl(struct drm_device *dev,
> > > > > > void
> > > *data,
> > > > > > struct drm_file *fil
> > > > > >=20
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0				if (!bo)
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0					continue;
> > > > > > +
> > > > > > +				if (args->type =3D=3D
> > > > > DRM_XE_MEM_RANGE_ATTR_PAT) {
> > > > > > +					if
> > > > > > (XE_IOCTL_DBG(xe, bo-
> > > > > > ttm.base.import_attach &&
> > > > > > +
> > > > > xe_device_is_l2_flush_optimized(xe) &&
> > > > > > +						=09
> > > > > > (pat_index !=3D 19 &&
> > > > > > +							=C2=A0
> > > > > > coh_mode !=3D
> > > > > XE_COH_2WAY))) {
> > > > > > +						err =3D -
> > > > > > EINVAL;
> > > > > > +						goto
> > > > > > err_fini;
> > > > > > +					}
> > > > > > +				}
> > > > > > +
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0				err =3D
> > > > > > drm_exec_lock_obj(&exec, &bo-
> > > > > > ttm.base);
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0				drm_exec_retry_on_contenti
> > > > > > on(&exec);
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0				if (err)
> > > > > > diff --git a/include/uapi/drm/xe_drm.h
> > > > > > b/include/uapi/drm/xe_drm.h
> > > > > > index ef2565048bdf..862fed3cf1ed 100644
> > > > > > --- a/include/uapi/drm/xe_drm.h
> > > > > > +++ b/include/uapi/drm/xe_drm.h
> > > > > > @@ -1103,7 +1103,9 @@ struct drm_xe_vm_bind_op {
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0	 * incoherent GT access is possible.
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0	 *
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0	 * Note: For userptr and externally im=
ported dma-
> > > > > > buf the kernel
> > > > > expects
> > > > > > -	 * either 1WAY or 2WAY for the @pat_index.
> > > > > > +	 * either 1WAY or 2WAY for the @pat_index.
> > > > > > Starting from NVL-P, for
> > > > > > +	 * userptr, svm, madvise and externally imported
> > > > > > dma-buf the kernel
> > > > > expects
> > > > > > +	 * either 2WAY or 1WAY and XA @pat_index.
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0	 *
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0	 * For DRM_XE_VM_BIND_FLAG_NULL bindin=
gs there are
> > > > > > no KMD
> > > > > restrictions
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0	 * on the @pat_index. For such mapping=
s there is
> > > > > > no actual memory
> > > > > > being
> > > >=20
> >=20
