Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42135CD4F49
	for <intel-xe@archiver.kernel.org>; Mon, 18 May 2026 14:17:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2E7A10E30B;
	Mon, 18 May 2026 14:17:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fA5mLwqM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CDEF10E30B
 for <intel-xe@lists.freedesktop.org>; Mon, 18 May 2026 14:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779113850; x=1810649850;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=XomeIdoSVFSpCakZgmz1lEVACxOGzoajYaddL5DzmLE=;
 b=fA5mLwqM6PmhhD0vKdR//Vb/fJpt9qFNVJHE38FQeYjSvtBXYEmtynDU
 H2DqatAvl8c7mOI2kZpHZkQZgMM0xLuFrEtApzu8QGs6GtIQWo5ZUW+sL
 oQ6R+rqKWA59bc7/ys2z1XX8gFx5Q2gV+Urw1fHTjCy28EyAiqTo77GF9
 Ta165ZVSRm/yPjdUmDlomsY09PjQIFNgsbpzPIAiuwDrWuJmOoKLyIOMf
 SaJVGI9bZbBCwDruwWrGc0cxIJHfMnk+SGf2T//bkMYT+ZPAFDy5/OY2z
 hyOYzjirS5J7XLBJUM+PCCgUFj+5ZpRa0cjQV517nx6pVmjwZUaiO/Dn6 g==;
X-CSE-ConnectionGUID: N9BbcgaHQFabERNeDIZWiw==
X-CSE-MsgGUID: tN/PnJUbSBmZtKQuiB19YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="80086714"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; d="scan'208";a="80086714"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 07:17:30 -0700
X-CSE-ConnectionGUID: w5FfrFgQR3ak8/0o/CLBcw==
X-CSE-MsgGUID: 8cJ9bzOWSliLD4NfDXVr4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; d="scan'208";a="236810232"
Received: from vpanait-mobl.ger.corp.intel.com (HELO [10.245.244.99])
 ([10.245.244.99])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 07:17:29 -0700
Message-ID: <559613ff276c92d19fc9a976a8c1ffde044a2c46.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Revoke drm_vma_node on xe_mmio_gem free
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: "Levi, Ilia" <ilia.levi@intel.com>, Shuicheng Lin
 <shuicheng.lin@intel.com>, 	intel-xe@lists.freedesktop.org
Date: Mon, 18 May 2026 16:17:26 +0200
In-Reply-To: <ba5b737e-0200-4912-b839-39fe4ec6aaeb@intel.com>
References: <20260514191649.592407-1-shuicheng.lin@intel.com>
 <ba5b737e-0200-4912-b839-39fe4ec6aaeb@intel.com>
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

Hi!

On Sun, 2026-05-17 at 13:47 +0300, Levi, Ilia wrote:
> On 5/14/2026 10:16 PM, Shuicheng Lin wrote:
> > xe_mmio_gem_create() calls drm_vma_node_allow() but nothing ever
> > calls
> > drm_vma_node_revoke(). The drm_vma_offset_file rb-tree entry
> > allocated
> > by drm_vma_node_allow() is not freed by drm_gem_object_release(),
> > so
> > it is leaked on every create/destroy cycle.
> >=20
> > Store the owning drm_file in struct xe_mmio_gem and call
> > drm_vma_node_revoke() from xe_mmio_gem_free().
>=20
>=20
> Good catch, but I don't think it makes sense to cache the drm_file.
> Consider adding it as a parameter to xe_mmio_gem_destroy and
> call drm_vma_node_revoke from there.
>=20
> - Ilia

What's the proposed use-case of xe_mmio_gem? We shouldn't really have
unused code present in the upstream driver until we have an agreed-upon
use-case and UAPI?

Thanks,
Thomas




>=20
>=20
> >=20
> > The xe_mmio_gem helpers currently have no in-tree users; this
> > prevents
> > a latent leak once they are used.
> >=20
> > Fixes: 1ffcf8b8ae8a ("drm/xe: Support for mmap-ing mmio regions")
> > Assisted-by: Claude:claude-opus-4.6
> > Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> > ---
> > Cc: Ilia Levi <ilia.levi@intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/xe/xe_mmio_gem.c | 5 +++++
> > =C2=A01 file changed, 5 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_mmio_gem.c
> > b/drivers/gpu/drm/xe/xe_mmio_gem.c
> > index 8c803ef233cc..78f6cc6fe9a1 100644
> > --- a/drivers/gpu/drm/xe/xe_mmio_gem.c
> > +++ b/drivers/gpu/drm/xe/xe_mmio_gem.c
> > @@ -36,6 +36,7 @@ static vm_fault_t xe_mmio_gem_vm_fault(struct
> > vm_fault *);
> > =C2=A0
> > =C2=A0struct xe_mmio_gem {
> > =C2=A0	struct drm_gem_object base;
> > +	struct drm_file *file;
> > =C2=A0	phys_addr_t phys_addr;
> > =C2=A0};
> > =C2=A0
> > @@ -96,6 +97,8 @@ struct xe_mmio_gem *xe_mmio_gem_create(struct
> > xe_device *xe, struct drm_file *fi
> > =C2=A0	if (err)
> > =C2=A0		goto free_gem;
> > =C2=A0
> > +	obj->file =3D file;
> > +
> > =C2=A0	return obj;
> > =C2=A0
> > =C2=A0free_gem:
> > @@ -121,6 +124,8 @@ static void xe_mmio_gem_free(struct
> > drm_gem_object *base)
> > =C2=A0{
> > =C2=A0	struct xe_mmio_gem *obj =3D to_xe_mmio_gem(base);
> > =C2=A0
> > +	if (obj->file)
> > +		drm_vma_node_revoke(&base->vma_node, obj->file);
> > =C2=A0	drm_gem_object_release(base);
> > =C2=A0	kfree(obj);
> > =C2=A0}
>=20
