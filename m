Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1AD1C5DF94
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 06:46:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63DB810E133;
	Tue, 25 Aug 2026 06:46:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oDhXqpkG";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDF1B10E133
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 06:46:24 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id F025C6013A;
 Tue, 25 Aug 2026 06:46:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 872091F000E9;
 Tue, 25 Aug 2026 06:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787640383;
 bh=PY1zIZGOsOSJntPs1tFj5i8MhwmNoW7VUVVDbtiXJNs=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=oDhXqpkGpDUKGUmS1pTBsn1akYqyqMrADJEYM9El82K6sk3+vG/BLK1RPb6YJ1FvY
 uQlTAJ+W5NTE2nbvgsJrs17qKeDu1PRu2GRKTOgiY00LlWF1bJFctTuRfKQEx4dWk+
 4PLeuiACOKysDtp4fRcbvmzXvqQobgQr5g2oyLeSMe4wNLvWQa76XKrRTsAMnrDIx+
 HlLVIp8rY1EgDTegkz6XzHUnpVJ2kCsTXcEqFDVv643qZ+v+SvOCFdQQ+HFB3isVCm
 dDR2JMX7DK3E2lk34gX6msehI29NS4ADHNRj0L0+up6LYvHUChp48FrKFvgZ4XuTDK
 UxJtzKIl8JlCQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/5] drm/xe/xe_drm_ras: Rename ras to drm_ras in xe_device
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260825063615.3697317-8-riana.tauro@intel.com>
References: <20260825063615.3697317-7-riana.tauro@intel.com>
 <20260825063615.3697317-8-riana.tauro@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 06:46:22 +0000
Message-Id: <20260825064623.872091F000E9@smtp.kernel.org>
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

Pre-existing issues:
- [High] Missing bounds check on severity and component indices in xe_drm_r=
as_event()
--

--- Patch [1]: [PATCH 1/5] drm/xe/xe_drm_ras: Rename ras to drm_ras in xe_d=
evice ---
commit 32a6f8d58b55e63675c6423a6648130b2ff82f4c
Author: Riana Tauro <riana.tauro@intel.com>

drm/xe/xe_drm_ras: Rename ras to drm_ras in xe_device

Rename ras to drm_ras in xe_device to distinguish drm-ras functionality
from device related RAS functionality. No functional changes.

> diff --git a/drivers/gpu/drm/xe/xe_drm_ras.c b/drivers/gpu/drm/xe/xe_drm_=
ras.c
> index 78184b6ea7d48..9f37ae732770a 100644
> --- a/drivers/gpu/drm/xe/xe_drm_ras.c
> +++ b/drivers/gpu/drm/xe/xe_drm_ras.c

[ ... ]

> @@ -196,7 +196,7 @@ static int register_nodes(struct xe_device *xe)
>   */
>  void xe_drm_ras_event(struct xe_device *xe, u32 component, u32 severity,=
 u32 value)
>  {
> -	struct xe_drm_ras *ras =3D &xe->ras;
> +	struct xe_drm_ras *ras =3D &xe->drm_ras;
>  	struct xe_drm_ras_counter *info =3D ras->info[severity];

[Severity: High]
This is a pre-existing issue, but is it possible for severity or component
to be out of bounds here?

If firmware or hardware sends a telemetry event with an unrecognized
severity or component, fallback paths might return DRM_XE_RAS_ERR_SEV_MAX
or DRM_XE_RAS_ERR_COMP_MAX.

Since ras->info is sized up to DRM_XE_RAS_ERR_SEV_MAX, using it as an index
reads past the end of the array. Because info is the final member of
struct xe_drm_ras inside struct xe_device, ras->info[DRM_XE_RAS_ERR_SEV_MAX]
could fetch the adjacent xe->i2c pointer.=20

The code would then treat this as an array of struct xe_drm_ras_counter,=20
which could lead to an invalid pointer dereference when evaluating=20
info[component].name later in the function.

Should there be bounds checks for severity and component before indexing
the arrays in xe_drm_ras_event()?

>  	struct drm_ras_node *node;
>  	int ret;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825063615.3697=
317-7-riana.tauro@intel.com?part=3D1
