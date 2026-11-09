Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4D4606A31C
	for <intel-xe@archiver.kernel.org>; Mon,  9 Nov 2026 11:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G2KC1uWo
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B0D310F1E1;
	Mon,  9 Nov 2026 11:51:14 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF19110F1C4
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Nov 2026 11:51:07 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id B4F0760D44;
 Mon,  9 Nov 2026 11:51:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 510E91F0089F;
 Mon,  9 Nov 2026 11:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794225066;
 bh=lpuVMQbdBIoZn4s46DUn4CdLf4AsSd5hOniIBmNQ6YU=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=G2KC1uWoeQS7J/ksU4Pi1qRmNmqx+0PILQ+rPyZllGmHhagM2Wk62ZceI3OfaXsGd
 3qdndJKYw21CsUq78qicSLd/Iy/Bd81pMPWesL9Hqut0kSCQ6L/UXLHIL8NFVCZIW7
 xP5KELytBiUydDmmqNV6HsAvka+E63z1UhpPZhuutS8kloxe9FjQ3ZrejAMirPVmZM
 scPkfp1t2WHDk/JphWqET2m5G36QssZ0jpOo/Bc8efZiFLWQmcc+TCWqxjDuH0DkDF
 Ky3hI+YMjsWe/mAFuC8z5pfLDAirkrVpMQrVwbdmqp27Use+Bf92wzVbo1LUZk2522
 INXFB/y+XaFpA==
Message-ID: <sashiko-outbox-204904@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] drm/xe: Use intel_display_gse_irq_handler()
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261109114554.19597-5-ville.syrjala@linux.intel.com>
References: <20261109114554.19597-1-ville.syrjala@linux.intel.com>
 <20261109114554.19597-5-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 11:51:05 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] drm/xe: call to undeclared and undefined
  intel_display_gse_irq_handler()
--

commit da9b4f3b875bfbf33a72170de1fb2c018547566b
Author: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

drm/xe: Use intel_display_gse_irq_handler()

This commit replaces the direct call to intel_opregion_asle_intr() in
xe_display_gse_irq_handler() with intel_display_gse_irq_handler().

> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe=
/display/xe_display.c
> index 21692408f9be0..0236f69a0f883 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -220,7 +220,7 @@ void xe_display_gse_irq_handler(struct xe_device *xe,=
 u32 gu_misc_iir)
>  		return;
> =20
>  	if (gu_misc_iir & GU_MISC_GSE)
> -		intel_opregion_asle_intr(display);
> +		intel_display_gse_irq_handler(display);
>  }

[Severity: High]
Does this break the build when CONFIG_DRM_XE_DISPLAY is enabled?
intel_display_gse_irq_handler() is neither declared nor defined anywhere
in the tree, causing an implicit function declaration error during
compilation and an undefined symbol at link time.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109114554.1959=
7-1-ville.syrjala@linux.intel.com?part=3D4
