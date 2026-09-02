Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 663CEC61DD6
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 16:35:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B91F10F2D3;
	Wed,  2 Sep 2026 16:35:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FP2YP/B6";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89CD210F2D3
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 16:35:06 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 4361440E8A;
 Wed,  2 Sep 2026 16:35:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFA9E1F000E9;
 Wed,  2 Sep 2026 16:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788366906;
 bh=+beh4Z2wYwLi+077g24+ZFAjwe5c+r9izZojB30DtKE=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=FP2YP/B6qoB4guV5DBO73Y1lD15sTYFLMpFS9m2FJ91xCQIqvS3x251ORR213nNVH
 JB8qLh4kASqKNvLsHtG/aeAEp89UrQErJutUKCVwtRjx6pwADdVbaJ+M6otHlennyL
 PI22uqs2NCBy2Vxqiur9RpajgRBO5A9MfnywSghS74RkE/eT5wIwmxzZlf0elDl0I5
 GTGLTkszal0v5dI+CJxU4tq1S0LS3Bth/WNnRcR4+MEbgIHyn7X7Kh/SarHpjRFjFR
 XPX95M+qpNFjL2fhnDknNMNzAWqPxUhPhEUYDFZnHOzAROC/OgfCUHdr41CN1ybPgN
 9JGwqFJyXHL2w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V20 10/15] drm/xe/configfs: Add
 disable_vram_page_offline attribute
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260902145343.465686-27-tejas.upadhyay@intel.com>
References: <20260902145343.465686-17-tejas.upadhyay@intel.com>
 <20260902145343.465686-27-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 16:35:05 +0000
Message-Id: <20260902163505.EFA9E1F000E9@smtp.kernel.org>
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
- [Low] Misplaced documentation comment restricting the attribute to CRI.
--

commit 4299f8f46041fce362473361938b350fd32fe701
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>

drm/xe/configfs: Add disable_vram_page_offline attribute

This commit adds a new configfs attribute disable_vram_page_offline
to control how bad VRAM pages are handled. It allows administrators to=20
disable active VRAM page offlining on Crescent Island (CRI) platforms,
falling back to logging only.

> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_con=
figfs.c
> index 052cce9621611..a9c72504c8a44 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
[ ... ]
> @@ -157,6 +158,18 @@
>   *
>   *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/enable_psmi
>   *
> + * This attribute can only be set on CRI before binding to the device.

[Severity: Low]
Does this documentation string apply to enable_psmi or the newly added
disable_vram_page_offline attribute?

Because it is placed above the "Disable VRAM page offline:" heading, it
appears to document enable_psmi. However, since the code restricts
disable_vram_page_offline to XE_CRESCENTISLAND (CRI), it seems this
restriction text was intended for the new attribute instead.

Additionally, placing the new text here pushes the original
"This attribute can only be set before binding to the device." text
down into the disable_vram_page_offline section, which removes it from
the enable_psmi section where it previously belonged.

> + *
> + * Disable VRAM page offline:
> + * ----------------------------
> + *
> + *  0, n, N, false - Do not disable (Offlining is active - default)
> + *  1, y, Y, true  - Disable vram page offline (Logging only)
> + *
> + *  Example to disable VRAM offline::
> + *
> + *      # echo 1 > /sys/kernel/config/xe/0000:03:00.0/disable_vram_page_=
offline
> + *
>   * This attribute can only be set before binding to the device.
>   *
>   * Context restore BB

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902145343.4656=
86-17-tejas.upadhyay@intel.com?part=3D10
