Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532BC606A31E
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 15:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ehcijcc7
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D1EB10E579;
	Tue, 24 Nov 2026 15:42:13 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED02910E579
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 15:42:06 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id A6725440DC;
 Tue, 24 Nov 2026 15:42:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44EC01F000CF;
 Tue, 24 Nov 2026 15:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795534926;
 bh=J6BQ9IdyyFBZg9sD/JX7OPILEnDVCvBgz8jhBrLYiDY=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=ehcijcc7TZ2t62xw88pU1C6ECvwa00NdC+KO7dEhEqh1wyJlAK1Rwzf/ocMzi/7hB
 HxqH+qFpKAl2d9a9YvLzmRCAje4uXQmisE2i+PjGromfv/QdU+SmMEpHr2NBEMCh+s
 VwETe6/EAbPMPehSKeSnIvnRgE8/NCMLYyIFFqOREiMIYaWrbfYedJI2hwzKlkv4wq
 CacZ4SDQKpjz8vq3F7+UozkyGjaoZw459Ndz2yy7+Qh8y++X2FiiTRH2IsSPjHrSux
 dt5JyG+Hxd5FYS83KbD79nNn4RaFpjd8aP96tlYtMTIQUUomDIXS6G+nVbmzTgqq31
 zTBEVxDlBFcXg==
Message-ID: <sashiko-outbox-231452@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/xe/vf: Support PCIe FLR
To: "Lukasz Laguna" <lukasz.laguna@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261124151645.411812-1-lukasz.laguna@intel.com>
References: <20261124151645.411812-1-lukasz.laguna@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 15:42:05 +0000
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
- [High] drm/xe/vf: skipped exec queue teardown in xe_guc_flr_prepare()
  on VF FLR
--

commit 1f41ab3661146300f9d5cbbfdfcce6ad967d0c93
Author: Lukasz Laguna <lukasz.laguna@intel.com>

drm/xe/vf: Support PCIe FLR

This commit enables PCIe Function Level Reset on SR-IOV VFs and resets the
GuC VF state over MMIO across all GTs before re-initializing the device.

> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pc=
i_error.c
> index d288bb291aa1b..4a14eb36173b6 100644
> --- a/drivers/gpu/drm/xe/xe_pci_error.c
> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
[ ... ]
> @@ -234,7 +235,7 @@ static void xe_pci_error_resume(struct pci_dev *pdev)
> =20
>  static inline bool xe_pci_reset_skip(struct xe_device *xe)
>  {
> -	return !IS_DGFX(xe) || IS_SRIOV_VF(xe) || xe_sriov_pf_num_vfs(xe) || xe=
->info.probe_display;
> +	return !IS_DGFX(xe) || xe_sriov_pf_num_vfs(xe) || xe->info.probe_displa=
y;
>  }

[Severity: High]
Does enabling FLR on VFs skip tearing down GuC exec queues during
xe_pci_reset_prepare()?

On VFs, uc_fw_vf_override() sets guc->fw.status to
XE_UC_FIRMWARE_PRELOADED, for which xe_uc_fw_is_loadable() returns false.
When xe_pci_reset_prepare() calls xe_device_suspend(xe, false, true) ->
xe_gt_flr_prepare() -> xe_uc_flr_prepare() -> xe_guc_flr_prepare(), it
returns early without running xe_guc_submit_pause_abort():

drivers/gpu/drm/xe/xe_guc.c:xe_guc_flr_prepare() {
	if (!xe_uc_fw_is_loadable(&guc->fw))
		return;

	xe_guc_submit_stop(guc);
	xe_guc_submit_pause_abort(guc);
}

As a result, existing user and VM-bind exec queues are not killed and
pending jobs are not aborted during FLR preparation.  On resume in
xe_pci_reset_done(), guc_exec_queue_start() sees those queues still alive
and accesses their wiped VRAM LRC buffers (q->lrc[i]) and resubmits pending
jobs against VRAM state cleared by the FLR.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124151645.4118=
12-1-lukasz.laguna@intel.com?part=3D1
