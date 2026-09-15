Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9256C88E53
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 07:26:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E8A910E260;
	Tue, 15 Sep 2026 07:26:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KTWkgJel";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20C3010F312
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Sep 2026 07:26:48 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 34D17600D1;
 Tue, 15 Sep 2026 07:26:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD2B31F000FF;
 Tue, 15 Sep 2026 07:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789457206;
 bh=eLznNrMDvN86yQi+NSB+7Z7hHy9NIYdmIjQDwxPEV5A=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=KTWkgJel1dw8rkrDNAXItufdv5X8RuOKX9495V0OqCJCUyDLa01dgC1A5G2p0d6AL
 wjxs/0Tp3Q8zDpGGXzSrMx0jDv8/d7O0vDScau3mC69dIGFfv8pG4WGmcCja8z4iGd
 NDRVFmJnBhq1CHTYC2duhux/5FKANxxrjYTiqoQvccBMMF04FdLuqWtBa+aw2Yx+Ik
 /u15VCysVRmO9UDKhzO+J0Yrr6Qx/PCdaK8mdQRSJP+y2UBBGbthTISjrxrJUeP6EM
 L3gx2+VDgKSxltBFJnmjxZzMFLbydcEoxS+exQmp39V6isLC78B3IpZREyqWzcYm1v
 qt/+hzVpAIyYQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 06/10] drm/xe/vf: Add bounds checking for queried
 GGTT base and size
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260915071159.51402-18-satyanarayana.k.v.p@intel.com>
References: <20260915071159.51402-12-satyanarayana.k.v.p@intel.com>
 <20260915071159.51402-18-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 07:26:46 +0000
Message-Id: <20260915072646.BD2B31F000FF@smtp.kernel.org>
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
- [High] drm/xe/vf: GGTT alignment uses CPU PAGE_SIZE breaking cross-page-s=
ize VMs
--

commit 974f2713618cba9d92f6442eb0ec21fab7f11630
Author: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

drm/xe/vf: Add bounds checking for queried GGTT base and size

This commit adds explicit bounds checks for GGTT base and size queried from
the PF. This is intended to detect and reject invalid configuration data to
prevent protocol violations and protect VF initialization.

> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_=
gt_sriov_vf.c
> index 81d68fe5ad7cd..53db4cf9d656b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
[ ... ]
> @@ -486,26 +487,62 @@ u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt)
>  	return value;
>  }
> =20
> +static u64 vf_get_ggtt_alignment(struct xe_gt *gt)
> +{
> +	return PAGE_SIZE;

[Severity: High]
Will this break initialization in cross-page-size virtualization environmen=
ts
(e.g., a 4KB host and 64KB guest, which is standard on ARM64 and PPC64)?

In such a configuration, the PF driver running on the host allocates a
4KB-aligned GGTT partition. The VF driver running in the guest uses its own
OS PAGE_SIZE (64KB) for alignment checks.

It receives the 4KB-aligned start_query from the PF, aligns it up to 64KB,
and aligns the end down to 64KB. This artificially shrinks the GGTT window.

If the allocated GGTT size is smaller than the alignment difference,
end <=3D start evaluates to true, and the VF aborts initialization with
-ERANGE.

Should this alignment check use the hardware page size (e.g., XE_PAGE_SIZE)
instead of the CPU page size?

> +}
> +
>  static int vf_get_ggtt_info(struct xe_gt *gt)
>  {
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915071159.5140=
2-12-satyanarayana.k.v.p@intel.com?part=3D6
