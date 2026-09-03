Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACB0BC624A4
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 15:32:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EF6A10E12F;
	Thu,  3 Sep 2026 15:32:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DEemhYb5";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C59210E12F
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 15:32:54 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id B28DF4130D;
 Thu,  3 Sep 2026 15:32:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AD461F00A3D;
 Thu,  3 Sep 2026 15:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788449573;
 bh=3Cn0fu1HHYaG3PYxcjrva/MfHBSaWnKtTLQCZ/XSHHE=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=DEemhYb5satQ0VOpuSjqU0AsdISEWfRpXQwiElI5luNb9Lv8BC7rArDcWg6WC4YRf
 PwJfCwLK6c0EQlaARR4CBuZfJD+CK9KK+G787U8nmQzo+elZuno3Ad63gko2A5HkSN
 xxHA3P6OMsKhKdNkm/b2UxMd9/0790rBwhCryZOvzX+TQJm/TRAVMKrx3fkB0KfnN5
 TLWSePG0QkWkZHn88TZjhyB0d1R9jTjnviDTo9BJPW3ESiV5MCEL7vtbbb+I5KTIfn
 Wixaj3VKja79bSDvxIGF4IWGg0CmEAI34gW3xLqGxCyppleGi5AIzAoYdSbO7lN9JN
 CmFJTMrZHEmbg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 18/27] drm/xe: Implement SR-IOV and eudebug exclusivity
To: "Mika Kuoppala" <mika.kuoppala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260903145952.848051-19-mika.kuoppala@linux.intel.com>
References: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
 <20260903145952.848051-19-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 15:32:52 +0000
Message-Id: <20260903153253.6AD461F00A3D@smtp.kernel.org>
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
- [High] Race condition in eudebug disable path allows SR-IOV VFs to be ena=
bled while eudebug hardware polling is still running, causing hardware inte=
rference.
- [Medium] Unconditional drm_info() log spam during SR-IOV VF initializatio=
n.
--

commit 639131d56a88cb02a02b54b4b9a2563ae44da661
Author: Christoph Manszewski <c.manszewski@gmail.com>

drm/xe: Implement SR-IOV and eudebug exclusivity

EU debug functionality relies on access to specific mmio registers.
Since VFs don't have access to those registers and in order to avoid
interference with VFs, make SR-IOV and eudebug functionality exclusive.

> diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eude=
bug.c
> index 470246af9810a..2c8d8fc82898e 100644
> --- a/drivers/gpu/drm/xe/xe_eudebug.c
> +++ b/drivers/gpu/drm/xe/xe_eudebug.c
> @@ -2276,10 +2286,14 @@ int xe_eudebug_enable(struct xe_device *xe, bool =
enable)
>  	WRITE_ONCE(xe->eudebug.cap_state, enable ?
>  		   XE_EUDEBUG_CAP_ENABLED : XE_EUDEBUG_CAP_DISABLED);
> =20
> -	if (enable)
> +	if (enable) {
>  		xe_eudebug_attention_poll_start(xe);
> -	else
> +	} else {
> +		if (IS_SRIOV_PF(xe))
> +			xe_sriov_pf_end_lockdown(xe);
> +
>  		xe_eudebug_attention_poll_stop(xe);
> +	}

[Severity: High]
Does releasing the SR-IOV lockdown before stopping the eudebug worker allow
VFs to be enabled while the worker is still actively reading GT MMIO=20
registers?

Since xe_eudebug_attention_poll_stop() uses cancel_delayed_work() (which is
asynchronous), the polling worker may still be executing and accessing MMIO
registers after xe_sriov_pf_end_lockdown() releases the exclusivity guard.
Reversing the order of these two calls might still be susceptible to a race=
=20
since the cancel is async.

> =20
>  	return 0;
>  }
> [ ... ]
> @@ -2359,6 +2373,11 @@ void xe_eudebug_init(struct xe_device *xe)
>  	if (xe->eudebug.cap_state =3D=3D XE_EUDEBUG_CAP_NOT_SUPPORTED)
>  		return;
> =20
> +	if (IS_SRIOV_VF(xe)) {
> +		drm_info(&xe->drm, "eudebug not available in SR-IOV VF mode\n");
> +		goto out_not_supported;
> +	}
> +

[Severity: Medium]
Will this unconditionally spam the kernel log with drm_info messages during
SR-IOV VF initialization?

When SR-IOV is enabled, many Virtual Functions are initialized simultaneous=
ly.
Calling drm_info unconditionally during the initialization of every VF will
flood the dmesg buffer with identical "eudebug not available in SR-IOV VF=20
mode" messages.

Would drm_info_once() or drm_dbg() be more appropriate here?

>  	wq =3D drmm_alloc_ordered_workqueue(dev, "xe-eudebug-discovery", 0);
>  	if (IS_ERR(wq)) {
>  		err =3D PTR_ERR(wq);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903145952.8480=
51-1-mika.kuoppala@linux.intel.com?part=3D18
