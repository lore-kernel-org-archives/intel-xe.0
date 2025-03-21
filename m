Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75383C35FFF
	for <intel-xe@archiver.kernel.org>; Fri, 21 Mar 2025 10:23:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32DD110E77E;
	Fri, 21 Mar 2025 10:23:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T76ZJ4Ao";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5763010E77E
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Mar 2025 10:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742552627; x=1774088627;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=vmyaIluxFroOMPg2wHlOP8xpoSYBbG1FBx5PR1nYFDc=;
 b=T76ZJ4AoAHuPYTRk2AFYvJe77MFAPFB953WWnaGThuDS/XUitm5TxGSs
 0k4YS9/teTxYjVz39X6/pm4NpjFxOgEuamgIOS+AaSm0sjPzSZ+AD0pUm
 w+Mluxwn32tvzcUiGWy5JlghjmZ60WmzXo3TU5hac5qhlxH7D9UshOjrs
 rqZ90yOMNkoji5gHLuPjAIeP252mtTDVSVcLWYmWjdRbdL7yXPvb8K1Id
 M/uet59LCWMO9hhpRymUyjI/r3eOI14+Sx4fYd+fhmWr4dbloJgknG2mm
 Kc4Fisfq3135EGo2sCBjaik/5AvG0eEj0JaGJD+5eAYTgaSl8simzX+Rf g==;
X-CSE-ConnectionGUID: IDVARLxjR0eiw/Shn3FpAQ==
X-CSE-MsgGUID: i3yMHDu+QC2A+EAHjRHTSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="31404707"
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; d="scan'208";a="31404707"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 03:23:43 -0700
X-CSE-ConnectionGUID: FpdvEO7RSvCE/Bg1mdjU9Q==
X-CSE-MsgGUID: UHn59NyFSy6x1PIYOQDSMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; d="scan'208";a="123345350"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.246.196])
 ([10.245.246.196])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 03:23:43 -0700
Message-ID: <60417daf928897560acf961ad0e14b51e170e676.camel@linux.intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Copy cpu_caching when importing DMA-BUF.
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>, intel-xe@lists.freedesktop.org
Date: Fri, 21 Mar 2025 11:23:39 +0100
In-Reply-To: <20250320211519.632432-2-dev@lankhorst.se>
References: <20250320211519.632432-1-dev@lankhorst.se>
 <20250320211519.632432-2-dev@lankhorst.se>
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

Hi, Maarten.

On Thu, 2025-03-20 at 22:15 +0100, Maarten Lankhorst wrote:
> When testing xe with P2PDMA DMA-BUF import,
> VM_BIND was failing because cpu_caching was not set.
>=20
> Set cpu_caching if available from another xe driver,
> to allow uncached VM_BIND on imported DMA-BUF.
>=20
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>

I don't think this is correct, we shouldn't assume anything about
imported dma-bufs, really. If we do we might end up in a situation
where code works for dma-bufs imported from one device but not from
another.

I think what we can do is to relax the COH mode check. It only really
matters on IGPU. On DGPU, all accesses to system memory is coherent.

Next step would perhaps be to assume that on p2p access, a dma-buf is
coherently cleared when all KERNEL dma-fences are signaled, but that
would require a cross-driver agreement, so in essence allow non-
coherent VM_BIND to device memory. This would matter only for IGPU
mapping a device p2p.

/Thomas



> ---
> =C2=A0drivers/gpu/drm/xe/xe_dma_buf.c | 13 +++++++++----
> =C2=A01 file changed, 9 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c
> b/drivers/gpu/drm/xe/xe_dma_buf.c
> index c5b95470fa324..9b1813e65e0a4 100644
> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> @@ -266,12 +266,12 @@ struct drm_gem_object
> *xe_gem_prime_import(struct drm_device *dev,
> =C2=A0	const struct dma_buf_attach_ops *attach_ops;
> =C2=A0	struct dma_buf_attachment *attach;
> =C2=A0	struct drm_gem_object *obj;
> -	struct xe_bo *bo;
> +	struct xe_bo *bo, *foreign_bo =3D NULL;
> =C2=A0
> -	if (dma_buf->ops =3D=3D &xe_dmabuf_ops) {
> +	if (dma_buf->ops =3D=3D &xe_dmabuf_ops &&
> +	=C2=A0=C2=A0=C2=A0 !XE_TEST_ONLY(test && test->force_different_devices)=
) {
> =C2=A0		obj =3D dma_buf->priv;
> -		if (obj->dev =3D=3D dev &&
> -		=C2=A0=C2=A0=C2=A0 !XE_TEST_ONLY(test && test-
> >force_different_devices)) {
> +		if (obj->dev =3D=3D dev) {
> =C2=A0			/*
> =C2=A0			 * Importing dmabuf exported from out own
> gem increases
> =C2=A0			 * refcount on gem itself instead of f_count
> of dmabuf.
> @@ -279,6 +279,8 @@ struct drm_gem_object *xe_gem_prime_import(struct
> drm_device *dev,
> =C2=A0			drm_gem_object_get(obj);
> =C2=A0			return obj;
> =C2=A0		}
> +
> +		foreign_bo =3D gem_to_xe_bo(obj);
> =C2=A0	}
> =C2=A0
> =C2=A0	/*
> @@ -310,6 +312,9 @@ struct drm_gem_object *xe_gem_prime_import(struct
> drm_device *dev,
> =C2=A0
> =C2=A0	get_dma_buf(dma_buf);
> =C2=A0	obj->import_attach =3D attach;
> +	if (foreign_bo)
> +		bo->cpu_caching =3D foreign_bo->cpu_caching;
> +
> =C2=A0	return obj;
> =C2=A0
> =C2=A0out_err:

