Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B29C5DF70
	for <intel-xe@archiver.kernel.org>; Tue, 18 Aug 2026 10:55:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9719F10E4A4;
	Tue, 18 Aug 2026 10:55:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WnkfoqO1";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3D8310E4A4
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Aug 2026 10:55:43 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id D1B56601E0;
 Tue, 18 Aug 2026 10:55:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6719D1F000E9;
 Tue, 18 Aug 2026 10:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787050542;
 bh=rTfxX7q6s46qEczGRCVyo2S9MwZBQubYfipZUSkYCB0=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=WnkfoqO1Kc1lJoEe99k22X1G/btDKjKk4g8Inp/nmbnAnIqIfYEV0mpM0fUXI5869
 LDzU65j2YwDzvdj3lYap4kp7QSdkTBnmTsOdbjnIfB0eandHZ59091vtE4cQIjPZbY
 /pGxkXe3B/WafCfYnNP4QqnUhtXTFhKOD1NQaaX888PxIQshlBWCUKVqM5S+nrTUoX
 TN7YGIqPWKZCiccCUxoR2QDwTpzrmsopS6TlRKKXxjsQXiWLiHyMK+cDOGJ4/rzbSw
 MUFZ6sGxeuxjJr4fzM1lXyRy73IhY3EkWFL67xEOiWi46PDRK4RdjCwk5y0s+wX/H8
 ypD5wt7oxTZYg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V17 12/12] drm/xe: Add fault-inject based VRAM page
 offline injection
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260818104055.3833974-26-tejas.upadhyay@intel.com>
References: <20260818104055.3833974-14-tejas.upadhyay@intel.com>
 <20260818104055.3833974-26-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 10:55:42 +0000
Message-Id: <20260818105542.6719D1F000E9@smtp.kernel.org>
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
- [High] Missing SR-IOV VF check exposes physical VRAM offlining and restri=
cted MMIO access to guest VMs.
--

--- Patch [12]: [PATCH V17 12/12] drm/xe: Add fault-inject based VRAM page =
offline injection ---
commit 7bef89dbe3ddc0e065bfce2e6d297191374f2aa4
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>

drm/xe: Add fault-inject based VRAM page offline injection

This commit adds a fault-inject based debugfs interface for testing VRAM
page offlining. It exposes standard fault-inject knobs and a custom
trigger file on Crescent Island platforms to simulate VRAM page faults.

> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debu=
gfs.c
> index 28135f84e2869..95d4dc067b4b8 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c

[ ... ]

> @@ -44,12 +45,18 @@
>  DECLARE_FAULT_ATTR(gt_reset_failure);
>  DECLARE_FAULT_ATTR(inject_csc_hw_error);
>  DECLARE_FAULT_ATTR(wedge_cold_reset);
> +DECLARE_FAULT_ATTR(inject_mempage_offline);
> =20
>  static bool csc_hw_error_available(struct xe_device *xe)
>  {
>  	return !IS_SRIOV_VF(xe) && xe->info.platform =3D=3D XE_BATTLEMAGE;
>  }
> =20
> +static bool is_crescent_island(struct xe_device *xe)
> +{
> +	return xe->info.platform =3D=3D XE_CRESCENTISLAND;

[Severity: High]
Are we unintentionally exposing the VRAM offlining debugfs trigger to SR-IOV
Virtual Functions (VFs)?

The csc_hw_error_available() check right above explicitly restricts its
debugfs entry to the Physical Function (PF) using !IS_SRIOV_VF(xe).

If a guest VM writes to the exposed inject_mempage_offline_trigger file, it
invokes xe_ttm_vram_handle_addr_fault() and xe_ttm_vram_addr_to_region(),
which directly reads the GSMBASE MMIO register.

Could this access of PF-restricted MMIO from a VF cause unsupported requests
or timeouts, and violate the virtualization boundary by allowing a VF to
offline physical VRAM pages?

> +}
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818104055.3833=
974-14-tejas.upadhyay@intel.com?part=3D12
