Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D930C88E77
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 21:20:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0563910E8A2;
	Tue, 15 Sep 2026 21:20:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ni/iKqf2";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0683D10E8A2
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Sep 2026 21:20:51 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id CB6C64164F;
 Tue, 15 Sep 2026 21:20:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E5CB1F000FF;
 Tue, 15 Sep 2026 21:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789507250;
 bh=Tw/ovex2Ulsjxz5WV+SOrcGKlo40lOqrIxpkZg65vIM=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Ni/iKqf2h96244PY07hZRrEj5xA+csCKt5p1if6Vrtm2TMNSyp2pbyV3wOugKwCml
 MC6IkCfKTEjkBhpq71VFYWLGsxBgYT5/c4n8e9x5qyuqmCmHZOTAM9V+lmKq7uI0GN
 nY5Zw7pVjhdrX1PmF0DeaIdj3Y2uXjTPV6ySMdYekeO+O+8TLi5nxYA6cL9MfK2xBt
 1agmVT9Y/XBIdTFe+YxuzRIR3uC/FwIE4K5bOmuv1X2554xk0cQALOK5qXd5h1db1X
 9vFo8gIRx4t0NXR1o6RrWDOXhIaqROxBZzmjgUmQaoHCQHYYoTdJKT43K9dxeNSrHP
 jOaYMNEROp+9Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5] drm/xe: Poll GT for C6 before D3
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260915210113.2915363-1-vinay.belgaumkar@intel.com>
References: <20260915210113.2915363-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 21:20:50 +0000
Message-Id: <20260915212050.8E5CB1F000FF@smtp.kernel.org>
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
- [Medium] drm/xe: D3cold runtime suspend always fails due to C6 check afte=
r GT PG disable
--

commit 691645f0da262033183939383983163842757c50
Author: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

drm/xe: Poll GT for C6 before D3

This commit adds a check for GT C6 state before the D3 transition in the
runtime suspend flow, aborting and resuming if the check fails.

> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 00b2b5dfb8f6c..488745ce0473f 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
[ ... ]
> @@ -1394,6 +1394,17 @@ static int xe_pci_runtime_suspend(struct device *d=
ev)
>  	if (err)
>  		return err;
> =20
> +	err =3D xe_pm_check_device_idle(xe);
> +	if (err) {
> +		drm_dbg(&xe->drm, "Resuming - Device idle check failed!");
> +		ret =3D xe_pm_runtime_resume(xe);

[Severity: Medium]
Will this idle check always fail when D3cold is allowed?

Looking at the sequence, xe_pci_runtime_suspend() calls
xe_pm_runtime_suspend() right before this check. When D3cold is allowed,
xe_pm_runtime_suspend() executes xe_gt_suspend():

drivers/gpu/drm/xe/xe_pm.c:xe_pm_runtime_suspend() {
...
	for_each_gt(gt, xe, id) {
		err =3D xe->d3cold.allowed ? xe_gt_suspend(gt) : xe_gt_runtime_suspend(gt=
);
...
}

xe_gt_suspend() then prepares the GT for power removal by explicitly disabl=
ing
power gating:

drivers/gpu/drm/xe/xe_gt.c:xe_gt_suspend() {
...
	xe_gt_idle_disable_pg(gt);
...
}

Because xe_gt_idle_disable_pg() writes 0 to the POWERGATE_ENABLE register,
the hardware is prevented from entering the C6 power gating state. Won't
the subsequent poll for GT_IDLE_C6 in xe_pm_check_device_idle() always
timeout and return -EAGAIN, causing the device to constantly abort suspend
and immediately resume?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915210113.2915=
363-1-vinay.belgaumkar@intel.com?part=3D1
