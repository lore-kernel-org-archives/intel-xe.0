Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF24BC5DF70
	for <intel-xe@archiver.kernel.org>; Tue, 18 Aug 2026 07:53:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DED810E170;
	Tue, 18 Aug 2026 07:53:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KmDtg9ea";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0B8110E170
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Aug 2026 07:53:49 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 887C6401F5;
 Tue, 18 Aug 2026 07:53:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A1911F000E9;
 Tue, 18 Aug 2026 07:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787039629;
 bh=ZhpwlVy3qF6gOkdMlXGMF4IpVRQYPV2ACw5jysFAqSI=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=KmDtg9eaVQOlzSAbXaXUaCMJVdfWm/fKdymlqR1m8mW2jkuvQk11VfDqD6Hx9r7bw
 eDgH1LuShAhcJ9OzOQvVOfEp5/OrD6kRrThZUdw04+C/SDTRKl/idfTYwsrVX48fY7
 cuXjf3kzFWnzSz5jgs4Qa8xH9caChuthhbqkutQLuMRy3W4wVozkGsAYpui3t8AYzs
 Nhp8zW4lx5vpjG/sf5iXt9gYHGsQAtNRBWYybxerrC0pXpjFcrLszxcgWQOjz22ZB9
 l+6eI9rDS21b4BZh98fVXjiKEUBtqIb1GySs9UnozrUnddC0h9/K4TpBG1/FUk+0h8
 PPnpCuWxK/t9w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/xe/xe_drm_ras: Enable CONFIG_DRM_RAS
To: "Balasubramani Vivekanandan" <balasubramani.vivekanandan@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260818075454.1508724-2-balasubramani.vivekanandan@intel.com>
References: <20260818075454.1508724-2-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 07:53:48 +0000
Message-Id: <20260818075349.4A1911F000E9@smtp.kernel.org>
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
- [Low] Selecting DRM_RAS in DRM_XE without inheriting its dependency on NE=
T causes Kconfig warnings and potential build failures.
--

--- Patch [1]: [PATCH] drm/xe/xe_drm_ras: Enable CONFIG_DRM_RAS ---
commit 591f0eb274f545521022c1143984b07f3d4b5395
Author: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

drm/xe/xe_drm_ras: Enable CONFIG_DRM_RAS

This commit enables DRM RAS support for the Xe driver by adding a select
statement for DRM_RAS in the DRM_XE Kconfig entry.

> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index 4d7dcaff2b915..6c584f918edf2 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -42,6 +42,7 @@ config DRM_XE
>  	select DRM_GPUSVM if !UML
>  	select DRM_GPUVM
>  	select DRM_SCHED
> +	select DRM_RAS

[Severity: Low]
Does this select statement need to inherit the dependencies of DRM_RAS?

DRM_RAS depends on NET. Since DRM_XE selects DRM_RAS without inheriting
this dependency, it can cause Kconfig unmet direct dependency warnings and
potential build failures if the kernel is configured with CONFIG_NET
disabled.

>  	select MMU_NOTIFIER
>  	select WANT_DEV_COREDUMP
>  	select AUXILIARY_BUS

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818075454.1508=
724-2-balasubramani.vivekanandan@intel.com?part=3D1
