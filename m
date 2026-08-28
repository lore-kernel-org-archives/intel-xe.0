Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B71ADC61DB9
	for <intel-xe@archiver.kernel.org>; Fri, 28 Aug 2026 11:44:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E61B10F367;
	Fri, 28 Aug 2026 11:44:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YfUdhwdN";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E223210F367
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Aug 2026 11:44:36 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 5FEBF40AED;
 Fri, 28 Aug 2026 11:44:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 221BA1F000E9;
 Fri, 28 Aug 2026 11:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787917476;
 bh=kNPed7HUNMYScIGk7C/O6f7WMP2qeoAm8eOyNzzOJ1A=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=YfUdhwdNV5y5d+zCoFyjWE3XJAB1+snwXTsxdeFplXV6LX+fC0D+Kx8gyzpyI3bIP
 9oSG6WLHSbkhYnhJraY7Rpksj3U4VMj+UG3xZdcE15TAAHUeMFbN+bygxkbS8O+49F
 hzNUsiNVQJlefl1v3TU6wSKKmF95XQCdupxqD66CWXAaVrn05DBL8cdwHAqUW4eCSZ
 T3gL2aMXTE+TZjfKA8AYKiS/6MSdUULbYqQxBZPEJQPQwvFreKYvhZ1qZs/f+eIH8r
 QNpbWuMK9yo/ZSDoBurzgCc5CgPmLHR0awxtttG4z75VIDanzXGXpbxgx9GUpPiPg+
 lV2oMBOUx9UhA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] drm/xe/xe_guc: Skip GuC reset post SBR
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260828113104.319843-6-riana.tauro@intel.com>
References: <20260828113104.319843-4-riana.tauro@intel.com>
 <20260828113104.319843-6-riana.tauro@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 11:44:35 +0000
Message-Id: <20260828114436.221BA1F000E9@smtp.kernel.org>
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
- [High] Returning 0 from xe_guc_reset() when the device is in PCI reset fa=
lsely signals success, causing a racing GT reset worker to attempt massive =
MMIO access on a disconnected device.
--

commit cd9fc028eb46b88c6e7e520f4ef7e342f490d472
Author: Riana Tauro <riana.tauro@intel.com>

drm/xe/xe_guc: Skip GuC reset post SBR

Secondary Bus Reset causes VRAM and hardware state loss. This patch skips
GuC reset during teardown when the device is in PCI reset to avoid accessing
the device in an unknown state.

> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index c7f8bbd4cb927..2c7f411b89a79 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -986,6 +986,11 @@ int xe_guc_reset(struct xe_guc *guc)
>  	u32 guc_status, gdrst;
>  	int ret;
> =20
> +	if (xe_device_is_in_reset(gt_to_xe(gt))) {
> +		xe_gt_dbg(gt, "Skipping GuC reset, device is in reset\n");
> +		return 0;
> +	}
> +

[Severity: High]
Could returning 0 here falsely signal a successful reset to callers?

When a GT reset worker (like do_gt_restart) races with a PCI error handler,
the worker might pass its initial reset checks before the PCI handler sets
the in_reset flag. If the worker then reaches xe_guc_reset() and receives 0
(success) because the device is in reset, it appears to proceed with MMIO
initialization (via xe_uc_load_hw()).

Since the device is disconnected or undergoing a Secondary Bus Reset,
would this lead to unintentional and extensive MMIO accesses, potentially
causing PCIe bus hangs, AER cascades, and multi-second thread hangs in
guc_wait_ucode()? Would returning an error code (like -ENODEV) safely abort
the racing GT reset worker while still being handled gracefully by teardown
paths like guc_fini_hw()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828113104.3198=
43-4-riana.tauro@intel.com?part=3D2
