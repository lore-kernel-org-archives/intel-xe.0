Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AEB5C61DC2
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 11:15:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C38F210EFA5;
	Thu, 27 Aug 2026 11:15:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kKuLqB2I";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88F0E10EFA5
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 11:15:35 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 8BA49600D3;
 Thu, 27 Aug 2026 11:15:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20BE51F00A3A;
 Thu, 27 Aug 2026 11:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787829334;
 bh=GlOm1JX44K2NK2E1KJqOJRpmseoQRXbLZBNRGx2SJyE=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=kKuLqB2IgUReAnGrxIf0MWJcQLXzJtEjpFtxcqydPnVMphp4vtd6YVGPpp9Se0SUP
 5qqVCZsBfjmAKNGB754LZ1d2m2PnvjI4uJ6Ny7IWR5jdG6rJgZM5O3vE7ANurvCOip
 NlPtKILR726IvkiaEkBFpdP7Sg1lfWYrBeSLh4/+cQ16oJPVY9grI3dTnWcMbXiepk
 CrzR+Dwuj6wac2H3S1Sr8Jho3bwYBIr4QRXbPVy+gzuvrtoxUNkKGk5kfAccVcrf8F
 wkWcSg7ep6BgBUQsXGw5oy5lK/kW4WgYJZ/DeY2jwC8K45tOFPHUXTiaCtxSIQPEUb
 9HaXyMl+bAZcw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/4] drm/xe/guc: Start use explicitly usable GuC IDs
 for for submission
To: =?utf-8?b?UGnDs3Jrb3dza2ksIFBpb3Ry?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260827105750.1248792-4-piotr.piorkowski@intel.com>
References: <20260827105750.1248792-1-piotr.piorkowski@intel.com>
 <20260827105750.1248792-4-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 27 Aug 2026 11:15:33 +0000
Message-Id: <20260827111534.20BE51F00A3A@smtp.kernel.org>
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
- [High] Direct dereference of xe_device_get_gt() return value without a NU=
LL check
--

commit 115f41f646ebc2f7ba925f4f7342a88fd5ea0b31
Author: Piotr Pi=C3=B3rkowski <piotr.piorkowski@intel.com>

drm/xe/guc: Start use explicitly usable GuC IDs for for submission

This commit updates GuC submission to explicitly allocate context IDs from
the usable ID pool instead of assuming all IDs are available. It configures
the GuC ID manager according to the device operating mode by using dedicated
initialization paths for native, PF, and VF modes.

> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 4286bd05c6861..14b12bcfaf548 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c

[ ... ]

[Severity: High]
This is a pre-existing issue, but I noticed a potential NULL pointer
dereference during GuC initialization in guc_g2g_alloc():

drivers/gpu/drm/xe/xe_guc.c:guc_g2g_alloc() {
	...
	if (gt->info.id !=3D 0) {
		struct xe_gt *root_gt =3D xe_device_get_gt(xe, 0);
		struct xe_guc *root_guc =3D &root_gt->uc.guc;
		struct xe_bo *bo;

		bo =3D xe_bo_get(root_guc->g2g.bo);
	...
}

The subsystem guidelines state that xe_device_get_gt() can return NULL for
invalid GT indices and its result must always be checked. Here, the return
value is immediately used to calculate a pointer (&root_gt->uc.guc) and then
dereferenced to access root_guc->g2g.bo.

Could this lead to a memory corruption or crash if xe_device_get_gt() retur=
ns
NULL? If we specifically need the primary GT of the root tile, would it be
safer to use xe_root_mmio_gt() instead to avoid the NULL check requirement?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260827105750.1248=
792-1-piotr.piorkowski@intel.com?part=3D3
