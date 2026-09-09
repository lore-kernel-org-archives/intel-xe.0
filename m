Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32AC5C79FB6
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 12:52:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC50C10E18F;
	Wed,  9 Sep 2026 12:52:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ck5c/Kcr";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A29510E18F
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 12:52:54 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 54770415C4;
 Wed,  9 Sep 2026 12:52:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 189381F00A3A;
 Wed,  9 Sep 2026 12:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788958374;
 bh=nsW+t4Z0S9C/T7CNUD4w1Q1SjYb4JOeSRiGbgztk6FU=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=ck5c/KcrwlPSDXQtNVV/q1vSvvG7DMQ+DyzLHWbtbMyYieZ3X2mJB8g9lbcA6XdS8
 pcKxn4RuKotsndrX8W1ABm6F4KxkQDLG6ngY/ETfGc1bnoXtnO73NBV4jX3hUrsPeq
 oeewZ62CP0vWmFX/DO0hgEjxbc0RjmPi7Xs9wmrsEaQZzvipMxyQe2f2DCqbohh3Eb
 IcQL+oMH0DeGBz3RICbVRZ2l3fmeix7eNMJfXtK4aCJDLHO4jjM8/g5qDB17fN2/Mq
 6DPIgHdn8AdysSiGABEb6YxFy2fpu5Pd03GLHAWi+NwPrGve0OMvdJs8fCY8aL8sCy
 ejxl1lH7SVJ/g==
From: sashiko-bot@kernel.org
Subject: Re: [RFC v2 14/21] drm/xe/uapi: Add access counter parameter
 extension for exec queue
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260909124457.1610890-37-himal.prasad.ghimiray@intel.com>
References: <20260909124457.1610890-23-himal.prasad.ghimiray@intel.com>
 <20260909124457.1610890-37-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 12:52:53 +0000
Message-Id: <20260909125254.189381F00A3A@smtp.kernel.org>
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
- [Medium] UAPI documentation instructs userspace to query a nonexistent ca=
pability flag and leaks a kernel-internal field name.
--

commit 3d110c0f571b1add5c665f09230f782329d185d1
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

drm/xe/uapi: Add access counter parameter extension for exec queue

This commit introduces a new UAPI extension for exec queue creation to
allow configuring access counter notifications. It adds the required UAPI
structures and implements the kernel-side handler to store these parameters.

> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 578f0c1eb43e8..c68e88d4d4904 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
[ ... ]
> + * **What if access counters are not supported?**
> + *
> + * Attaching this extension on hardware that does not support access cou=
nters
> + * (i.e., when ``xe.info.has_access_counter`` is zero) causes
> + * %DRM_IOCTL_XE_EXEC_QUEUE_CREATE to return ``-EINVAL``.  Applications =
should
> + * either verify hardware capability using %DRM_IOCTL_XE_DEVICE_QUERY be=
fore
> + * using this extension, or be prepared to handle ``-EINVAL`` and fall b=
ack to

[Severity: Medium]
The UAPI documentation instructs userspace to verify hardware support using
DRM_IOCTL_XE_DEVICE_QUERY before using the extension. Does the driver
actually expose an access counter capability flag in the query interface?

Userspace developers attempting to follow this documentation will find no
way to programmatically check the capability upfront if the corresponding
flag is missing from the query API.

Additionally, this documentation references the kernel-internal struct memb=
er
xe.info.has_access_counter, which is invisible to userspace. Could this be
reworded to avoid leaking internal kernel variables in the UAPI header?

> + * creating the exec queue without the extension.
> + *

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909124457.1610=
890-23-himal.prasad.ghimiray@intel.com?part=3D14
