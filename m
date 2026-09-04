Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86BC2C624DE
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 17:14:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 489DE10E55D;
	Fri,  4 Sep 2026 17:14:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EujeKO3Z";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67E5B10E55D
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 17:14:21 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 582A5602D4;
 Fri,  4 Sep 2026 17:14:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E21DF1F00A3D;
 Fri,  4 Sep 2026 17:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788542060;
 bh=4IxalBbJjja4OGGXm9ynNm5HqwGLVhl3y7LqR6xtFK0=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=EujeKO3ZQp5FV7Qi9a75LRnbtJhrAY0KgCh/QKxOHvKkM4BtxuUvrYl++cWm2/oXK
 +7Zr6gRGsZZgvmf2YSoWUjsR6yqewZyG3k/wlel98u4cwZCZvCyBFS5Isc2ThO6Dj8
 qHhvYBE6tYfPyZR/Y2U/Twp8hwM1/8eMvNonvk219ZbvkJVEvYN/Xt+YqKqlwsfBBB
 xJLF5p2bS5/rNbUr6dXflr8NNq1VUJMF7+jo2gJBqdLxAZ5I+8qZ2EeS0NVs5YVgGf
 iaAFl6YwXpBuPLK8wnO0uzwAfqZxBV0Uk/+FNFtai/6zpXhNAGmx0dcS2O2V7p4NrD
 swHH0dcGrprWg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/6] drm/xe: Keep reference to device descriptor
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260904170531.516-3-michal.wajdeczko@intel.com>
References: <20260904170531.516-1-michal.wajdeczko@intel.com>
 <20260904170531.516-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 17:14:19 +0000
Message-Id: <20260904171419.E21DF1F00A3D@smtp.kernel.org>
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
- [Medium] In test initialization, `xe->subplatform_desc` is incorrectly as=
signed a pointer to a sentinel element instead of `NULL` when no subplatfor=
m is matched.
--

commit 2fbc7ea3deaa915eef829a4c64ec08fac1f4a8a9
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>

drm/xe: Keep reference to device descriptor

This patch stores a reference to the whole device descriptor and the
matched subplatform descriptor within the xe_device structure. This
change enables access to additional non-mutable device parameters.

> diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests=
/xe_pci.c
> index 4965a01f6ba52..48d5ee478fe69 100644
> --- a/drivers/gpu/drm/xe/tests/xe_pci.c
> +++ b/drivers/gpu/drm/xe/tests/xe_pci.c
> @@ -374,6 +374,8 @@ int xe_pci_fake_device_init(struct xe_device *xe)
>  		return -ENODEV;
> =20
>  done:
> +	xe->desc =3D desc;
> +	xe->subplatform_desc =3D subplatform_desc;

[Severity: Medium]
Will this assign a pointer to a sentinel element instead of NULL when no
subplatform is matched?

In xe_pci_fake_device_init(), the search loop terminates when it reaches the
sentinel element:

	for (subplatform_desc =3D desc->subplatforms;
	     subplatform_desc && subplatform_desc->subplatform;
	     subplatform_desc++)
		if (subplatform_desc->subplatform =3D=3D data->subplatform)
			break;

If data->subplatform is XE_SUBPLATFORM_NONE, the loop exits with
subplatform_desc pointing to the sentinel element of desc->subplatforms, not
NULL. The subsequent check (!subplatform_desc) evaluates to false.

By directly assigning this value to xe->subplatform_desc, the test mock
environment now gets a non-NULL pointer (the sentinel) for devices without a
subplatform. Could this create a state inconsistency with production code,
causing tests checking if (xe->subplatform_desc) to falsely evaluate to
true?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904170531.516-=
1-michal.wajdeczko@intel.com?part=3D2
