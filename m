Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBAA606A32D
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 10:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZNQXGieY
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E59A310E9E2;
	Fri,  6 Nov 2026 10:31:35 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6FB910E9EC
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Nov 2026 10:31:29 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 9C572601E3;
 Fri,  6 Nov 2026 10:31:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 315F21F0089F;
 Fri,  6 Nov 2026 10:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793961088;
 bh=8O7Z+Gahr9vFSOJ6F/cmiXRJWZ8tL4KSLyTNNu3DVTM=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=ZNQXGieY7PLYjcLriTWevXgCu8MSdSe1o4b4tCVZHMtkKcnEFkHKc9tDN6uBhVQyn
 0jaa3DH/au+pSf0MyiiEv6ZdtKPP9od7Sls8IfCJn/eMeN+85QePw94mBT/lk8tQpK
 LoxJaF4WbXYpAWx6PzMY2sJEnMvfoUxsq+0p22j3n2XLu088RBhrvqoadKSHh4L4Mr
 9Hre4HJv1D5g6Zn3KC+Q1TwPHQMlfztkU+NfDKQ2pHf2PldHxD94G3PTXULlpJKkDt
 QNnVBMcMVVt+LHNuq+SXgTYNBwc1C9jfZpWyqzqJsVC9Z2PgcGuuSXZxbzuYPl+upK
 HB93Y4CYrF85g==
Message-ID: <sashiko-outbox-201221@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] drm/xe/pm: skip BO eviction on iGPU for
 non-hibernation sleep
To: "Matthew Auld" <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261106-s4-opti-v1-2-5edaea2c6d31@intel.com>
References: <20261106-s4-opti-v1-0-5edaea2c6d31@intel.com>
 <20261106-s4-opti-v1-2-5edaea2c6d31@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 10:31:27 +0000
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

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [High] drm/xe: missing GT resume on xe_pm_runtime_suspend() error path
  [1]
--

commit 6e0e7a2f201b73b5b02bb232ce3a960f5bc33388
Author: Matthew Auld <matthew.auld@intel.com>

drm/xe/pm: skip BO eviction on iGPU for non-hibernation sleep

This commit distinguishes S4 hibernation from S2idle/S3 suspend and skips BO
eviction and pinned BO preparation on iGPU platforms when not hibernating.

> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index f483b565d323f..63bcb4aef461b 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c

[ ... ]

> @@ -193,10 +199,12 @@ int xe_pm_suspend(struct xe_device *xe)
> =20
>  	xe_display_pm_suspend(xe);
> =20
> -	/* FIXME: Super racey... */
> -	err =3D xe_bo_evict_all(xe);
> -	if (err)
> -		goto err_display;
> +	if (xe_pm_needs_bo_evict(xe, hibernate)) {
> +		/* FIXME: Super racey... */
> +		err =3D xe_bo_evict_all(xe);
> +		if (err)
> +			goto err_display;
> +	}
> =20
>  	for_each_gt(gt, xe, id) {
>  		err =3D xe_gt_suspend(gt);

[Severity: High]
This problem wasn't introduced by this patch, but if a subsequent GT fails =
to
suspend in the for_each_gt() loop in xe_pm_suspend() or
xe_pm_runtime_suspend() [1], does the error path leave earlier GTs
suspended?

drivers/gpu/drm/xe/xe_pm.c:xe_pm_suspend() {
	...
	for_each_gt(gt, xe, id) {
		err =3D xe_gt_suspend(gt);
		if (err)
			goto err_display;
	}
	...
err_display:
	xe_display_pm_resume(xe);
	xe_pxp_pm_resume(xe->pxp);
err:
	drm_dbg(&xe->drm, "Device suspend failed %d\n", err);
	xe_pm_block_end_signalling();
	return err;
}

Neither err_display in xe_pm_suspend() nor out_resume in
xe_pm_runtime_suspend() resumes the GTs that already succeeded before the
failure.  When suspend is aborted, the PM core keeps the device active while
those GTs remain physically suspended, leading to timeouts and hardware han=
gs
on subsequent access.

[1] https://sashiko.dev/#/bug/linux-5b6a3fb9-c8f9-45a4-a04c-2bc0919df0d7

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-s4-opti-v1=
-0-5edaea2c6d31@intel.com?part=3D2
