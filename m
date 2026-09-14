Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46806C88E50
	for <intel-xe@archiver.kernel.org>; Mon, 14 Sep 2026 09:56:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB7AA10E530;
	Mon, 14 Sep 2026 09:56:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ISQbfQ77";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C95610E530
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Sep 2026 09:56:18 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 3AA0F601EF;
 Mon, 14 Sep 2026 09:56:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD02E1F000FF;
 Mon, 14 Sep 2026 09:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789379776;
 bh=HXXHjjOjbB8v3XUJ/+fmxGHrQd8L7tMYVOMi8rSZl/U=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=ISQbfQ77lWA9Kh/AvT703ou9KQZihV+F2sTMrFrhei7BGUZmyby/53lhYdk3RznIg
 Qwo+diHTqAvHUe8yBZUiBNK5b57Z3ZjiVTypnZ4KNjvNnhjnkUVL9pLm6loS1mbA2d
 snZUjcPGwKa2m+Aux089fQ+tiXCLAKFYX8ahi99ttWPPb8Opd80LJENwvyXII01Pne
 LdfHWgsTOCvf3i0PQ6CUxZwkoby8lQmPg9B40E9QvkMxEe1orbplrfnk+N1kKAjrJh
 1PuCFAALHmnGZW3BGYC1IaaTJb2gO52PlBwyFaVt4rBk6GJjVSHnfwYJnmMKbR0Qse
 Uh9J87ko6cJ4g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/xe: Make p2pdma distance check verbose via dynamic
 debug
To: =?utf-8?b?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260914094641.8779-1-thomas.hellstrom@linux.intel.com>
References: <20260914094641.8779-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 09:56:16 +0000
Message-Id: <20260914095616.BD02E1F000FF@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Unconditional use of the internal `_dynamic_func_call` macro causes=
 a build failure when `CONFIG_DYNAMIC_DEBUG` is disabled.
--

commit 6e70a101effbf7ae91a2873e2642ceaadc4900a3
Author: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

drm/xe: Make p2pdma distance check verbose via dynamic debug

pci_p2pdma_distance() can optionally print details about how it computed
the ACS/PCIe topology distance between the two devices. Tie the verbose
argument to a dedicated dynamic-debug callsite tagged "xe dma-buf p2p
debug" so the extra p2pdma distance logging can be switched on without a
recompile.

> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_=
buf.c
> index 5d9f1cd24b7f3..b63fd70fb4de9 100644
> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> @@ -22,13 +22,21 @@
> =20
>  MODULE_IMPORT_NS("DMA_BUF");
> =20
> +static void xe_ddebug_flip_bool(const struct _ddebug *desc, bool *flag)
> +{
> +	*flag =3D true;
> +}
> +
>  static int xe_dma_buf_attach(struct dma_buf *dmabuf,
>  			     struct dma_buf_attachment *attach)
>  {
>  	struct drm_gem_object *obj =3D attach->dmabuf->priv;
> +	bool verbose_p2p_dist =3D drm_debug_enabled(DRM_UT_DRIVER);
> +
> +	_dynamic_func_call("xe dma-buf p2p debug", xe_ddebug_flip_bool, &verbos=
e_p2p_dist);
        ^^^^^^^^^^^^^^^^^^

[Severity: Low]
Does this unconditional use of the internal _dynamic_func_call macro cause a
build failure when CONFIG_DYNAMIC_DEBUG is disabled?

Since _dynamic_func_call has no stub definition in the #else block of
include/linux/dynamic_debug.h, compiling the xe driver with CONFIG_DRM_XE
enabled but CONFIG_DYNAMIC_DEBUG disabled results in an implicit function
declaration error.

If the macro call is guarded by an ifdef, does xe_ddebug_flip_bool() also n=
eed
an ifdef guard or __maybe_unused to avoid a -Wunused-function warning?

> =20
>  	if (attach->peer2peer &&
> -	    pci_p2pdma_distance(to_pci_dev(obj->dev->dev), attach->dev, false) =
< 0)
> +	    pci_p2pdma_distance(to_pci_dev(obj->dev->dev), attach->dev, verbose=
_p2p_dist) < 0)
>  		attach->peer2peer =3D false;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914094641.8779=
-1-thomas.hellstrom@linux.intel.com?part=3D1
