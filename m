Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26A2606A31C
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 22:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aiEQqNXG
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3A0810E34B;
	Tue, 10 Nov 2026 22:27:02 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 203E510E34B
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Nov 2026 22:26:57 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id C2B814088B;
 Tue, 10 Nov 2026 22:26:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BFD01F008A2;
 Tue, 10 Nov 2026 22:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794349616;
 bh=amevf5bXpGB3PfddZn1NQbz4hRUqx2U9MyYdveeY2e0=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=aiEQqNXG+vBktCUvqLXIMnopQPjBcqTd8zYoB1nmYdcauABek095xMeZoCl2dADAj
 nUkXeFLBVeBvjcsYv37wLWjayczXVlmsv5j/JQ2Oof3kw4TV1l894ilojsWVqN8Psc
 Sxzre4uyf2aQpelUMyGmSkYRJD4dzF3RPv8MC5b1ojSY0/IJZklppKo6mZq+mxIQCT
 oHV0KCUZ2ZAN5rrCxXOCK0MeVLOH5GcB+0jcH+SrhrDAUg/hIu4ldchsphRlMvoFFM
 2cR5v0SFxfU3jrhytjQ5w3Y2QzJF4EhADtXpyXUUKlNF5H1QQ12V6jB4KkwRpItVQC
 KQAQjV5urJiUw==
Message-ID: <sashiko-outbox-207828@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] drm/xe/forcewake: flush delayed release at power
 and teardown boundaries
To: "Zongyao Bai" <zongyao.bai@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261110220542.432595-3-zongyao.bai@intel.com>
References: <20261017031856.2723986-1-zongyao.bai@intel.com>
 <20261110220542.432595-1-zongyao.bai@intel.com>
 <20261110220542.432595-3-zongyao.bai@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 22:26:56 +0000
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
- [Medium] drm/xe/forcewake: delayed domains stranded if runtime suspend
  aborts
--

commit f7553aeb9060950e90243740fda0d4e4ec003892
Author: Zongyao Bai <zongyao.bai@intel.com>

drm/xe/forcewake: flush delayed release at power and teardown boundaries

This commit adds xe_force_wake_flush() and xe_force_wake_stop() to cancel
delayed forcewake releases and put delayed domains to sleep across suspend,
shutdown, and device removal paths.

> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 5ed96807fe342..a0a238f1a4515 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c

[ ... ]

> @@ -1104,7 +1106,7 @@ int xe_gt_runtime_suspend(struct xe_gt *gt)
>  {
>  	xe_gt_dbg(gt, "runtime suspending\n");
> =20
> -	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	CLASS(xe_force_wake_flush, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>  	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL)) {
>  		xe_gt_err(gt, "runtime suspend failed (%pe)\n", ERR_PTR(-ETIMEDOUT));
>  		return -ETIMEDOUT;

[Severity: Medium]
Can an aborted runtime suspend leave fw->delayed_domains awake with no
worker pending?

Once rpm_suspend() sets the device status to RPM_SUSPENDING,
xe_pm_runtime_get_if_active() returns false, so
xe_force_wake_delayed_release_work() exits early without sleeping
fw->delayed_domains or requeuing itself, relying on the suspend flush here
and in xe_gt_suspend().

However, xe_pm_runtime_suspend() can fail before reaching this flush on all
GTs:

drivers/gpu/drm/xe/xe_pm.c:xe_pm_runtime_suspend() {
	...
	if (xe->d3cold.allowed) {
		err =3D xe_bo_evict_all(xe);
		if (err)
			goto out_resume;
	}

	for_each_gt(gt, xe, id) {
		err =3D xe->d3cold.allowed ? xe_gt_suspend(gt) : xe_gt_runtime_suspend(gt=
);
		if (err)
			goto out_resume;
	}
	...
}

If xe_bo_evict_all() fails, or an earlier GT fails in the loop, rpm_suspend=
()
restores the device status to RPM_ACTIVE without flushing the remaining GTs.
Any domain in fw->delayed_domains whose worker ran during the RPM_SUSPENDING
window then stays awake with ref =3D=3D 0 and delayed_release_work inactive,
violating the DELAYED HOLD invariant documented in struct xe_force_wake and
preventing GT C6 power saving until a later forcewake access or suspend.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110220542.4325=
95-1-zongyao.bai@intel.com?part=3D2
