Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E012C5DF87
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 12:42:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2ADB10E293;
	Fri, 21 Aug 2026 12:42:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BvR9bOB5";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A57510E293
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Aug 2026 12:42:56 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id A339F42E33;
 Fri, 21 Aug 2026 12:42:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C09C1F000E9;
 Fri, 21 Aug 2026 12:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787316175;
 bh=/MfTLpHehiKjt4LWSy2RqaXmwg+T4HaNsqZLgWyZfP8=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=BvR9bOB5mJxDpbCp9BN/tziNqWkUhinQsjPtrMXrAAwvzTo9yCCIEUqqRW5oqAfyY
 5pJq53HuB56cimlisNBx3ACgxuVKulTq4TZxlrFgkcSYCcli05lLcJO3jMwe3B/lfh
 JrOMtjxQY3VC+pCVu+uJyGLyR4AWKfSVnmExBLr2hZYKiDQFdiLSfQXCTTCuvF+hOq
 DkkElSY48+vFBz9Y9jdCBB3bWI+Iy60XhclBSk5RF8pnfO/Kt2FU/7mBs6pFOLHFVF
 Ytf9uV9IUzWlIjdvYGQnMez6Hwaozjlm/cganga2I2Y0RrlAAOj3VQhb8frvwhVmGK
 MSvtcfltxdjmw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1] drm/xe/guc: Allow GuC CT for wedged device
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260821122114.567725-1-raag.jadav@intel.com>
References: <20260821122114.567725-1-raag.jadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 12:42:54 +0000
Message-Id: <20260821124255.5C09C1F000E9@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Removing the `xe_device_wedged` check from `__guc_ct_send_locked=
` causes a full 1-second delay in `xe_device_declare_wedged` when a GuC han=
g occurs.
- [Low] The kernel-doc comment for `xe_guc_ct_send()` is stale and incorrec=
tly claims that non-blocking send helpers return `-ENOTRECOVERABLE` when th=
e device is wedged.
--

--- Patch [1]: [PATCH v1] drm/xe/guc: Allow GuC CT for wedged device ---
commit baa99b44631241d9eb913ee6996cb7221b0a82f2
Author: Raag Jadav <raag.jadav@intel.com>

    drm/xe/guc: Allow GuC CT for wedged device
   =20
    Commit 50fa9acac26f ("drm/xe/guc: distinguish wedged from recoverable
    cancellation") introduced distinguishable error codes for g2h failure
    cases, but also blocked GuC CT for wedged device. This is problematic
    in cases where we want to prevent user from accessing the device but
    also keep GuC CT functioning on temporarily wedged device. First user
    of such requirement is PCIe FLR handling where we require uC firmware
    loading while the device is temporarily wedged.
   =20
    Fixes: 50fa9acac26f ("drm/xe/guc: distinguish wedged from recoverable c=
ancellation")
    Signed-off-by: Raag Jadav <raag.jadav@intel.com>

> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_c=
t.c
> index fe70c0fd85c52..541c74180bcaf 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -1065,11 +1065,6 @@ static int __guc_ct_send_locked(struct xe_guc_ct *=
ct, const u32 *action,
>  	xe_gt_assert(gt, g2h_len || !num_g2h);
>  	lockdep_assert_held(&ct->lock);
> =20
> -	if (xe_device_wedged(ct_to_xe(ct))) {
> -		ret =3D -ENOTRECOVERABLE;
> -		goto out;
> -	}
> -

[Severity: Medium]
Will removing this check cause a 1-second delay during device wedging?

If guc_ct_send_locked() is executing when a GuC hang occurs and the CTB is =
full,
it enters a retry loop holding ct->lock. If xe_device_declare_wedged() exec=
utes
concurrently, it attempts to call xe_guc_ct_stop() and blocks waiting for
ct->lock.

Without this xe_device_wedged() check, the retry loop relies entirely on the
ct->state =3D=3D XE_GUC_CT_STATE_STOPPED condition to abort early. However,=
 because
the wedging thread is blocked on ct->lock, the state cannot be updated. This
causes the loop in guc_ct_send_locked() to retry until the 1-second timeout
expires.

[Severity: Low]
Should the kernel-doc for xe_guc_ct_send() be updated to reflect this chang=
e?

The documentation currently claims that non-blocking send helpers return
-ENOTRECOVERABLE when the device is wedged:

 * * -ENOTRECOVERABLE: the xe device is wedged. Stop submitting new GuC wor=
k; the
 *   request cannot make progress until the device is recovered.

Since the wedged check was removed from the send path, this error code is
no longer returned in that scenario.

>  	if (unlikely(ct->ctbs.h2g.info.broken)) {
>  		ret =3D -EPIPE;
>  		goto out;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821122114.5677=
25-1-raag.jadav@intel.com?part=3D1
