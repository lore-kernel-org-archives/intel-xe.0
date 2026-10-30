Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D053A606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 17:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PIubHjQH
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DF3C10E7FA;
	Fri, 30 Oct 2026 17:50:06 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FFA310E8A6
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Oct 2026 17:50:00 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id E904C407BE;
 Fri, 30 Oct 2026 17:49:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A82351F000C1;
 Fri, 30 Oct 2026 17:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793382599;
 bh=YLrqb/P4Roe6AwqrTn+jImYoFMcDLifPFJmN+upg3os=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=PIubHjQHsO3VZ5lnosh+KOUcqYVokJtEDzm1P0ru617UVl0GUs4x+b9h3BWxFKkz8
 HLgt2MO5+nYMJKVF++n1UQJny0t8erslrwGJhf7rgF0ZeeBmg9MAeOsUQfehA+cof6
 jAGqlCqyAgmubESjyOM6K5AGTCwIgPDGWSt2sFs9CxoedkZEE8lNSwJkvoZPgb6Xa7
 QnMggNo62ZWUdtZ0uqn/Qm3FkqQhFNP7pxXM2AS3DnisfJwK3Jlu8W1SeO230e/vEJ
 k/hmMdP1l3912CMKfzcmegqFiMpb65b1BCBw61DOx2PON7sUQ0kyB28fi6JrJ2cyqH
 IgFP3upKhKbiw==
Message-ID: <sashiko-outbox-191358@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] drm/xe/cri: Implement Wa_14028586678
To: "Daniel Charles" <daniel.charles@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261030173619.266260-1-daniel.charles@intel.com>
References: <20261030173619.266260-1-daniel.charles@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 17:49:59 +0000
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

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] drm/xe: xe_wa_apply_tile_workarounds() runs before xe_pcode_read=
y() on resume
--

commit 3d1f950d0d5e813299acdbeedeb799005ea2bb7c
Author: Fei Yang <fei.yang@intel.com>

drm/xe/cri: Implement Wa_14028586678

This commit implements hardware workaround Wa_14028586678 on Crescent
Island by updating DWNSTRM_ACCESS_MODE_GAMREQ_MERTSS in
xe_wa_apply_tile_workarounds() and calling xe_wa_apply_tile_workarounds()
on runtime D3cold resume.

> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 5a562d8daeb94..d4f93de368fc4 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -687,6 +687,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>   */
>  int xe_pm_runtime_resume(struct xe_device *xe)
>  {
> +	struct xe_tile *tile;
>  	struct xe_gt *gt;
>  	u8 id;
>  	int err =3D 0;
> @@ -702,6 +703,9 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>  		if (err)
>  			goto out;
> =20
> +		for_each_tile(tile, xe, id)
> +			xe_wa_apply_tile_workarounds(tile);
> +

[Severity: Medium]
In xe_pm_runtime_resume(), xe_wa_apply_tile_workarounds() is called after
xe_pcode_ready(xe, true).

However, in the system resume path in drivers/gpu/drm/xe/xe_pm.c,
xe_pm_resume() calls xe_wa_apply_tile_workarounds() before
xe_pcode_ready(xe, true):

drivers/gpu/drm/xe/xe_pm.c:xe_pm_resume() {
	...
	for_each_tile(tile, xe, id)
		xe_wa_apply_tile_workarounds(tile);

	err =3D xe_pcode_ready(xe, true);
	if (err)
		return err;
	...
}

As noted in xe_device_probe_early() in drivers/gpu/drm/xe/xe_device.c:

	/*
	 * Check for pcode uncore_init status to confirm if the SoC
	 * initialization is complete. Until done, any MMIO or lmem access from
	 * the driver will be blocked
	 */
	err =3D xe_pcode_probe_early(xe);

When resuming from system suspend, can the MMIO read-modify-write to
DWNSTRM_ACCESS_MODE_GAMREQ_MERTSS in xe_wa_apply_tile_workarounds() run
before PCODE SoC initialization has completed and while MMIO access is
still blocked, leaving Wa_14028586678 unapplied or corrupting other fields
of the register?

Should xe_pm_resume() also wait for xe_pcode_ready(xe, true) before calling
xe_wa_apply_tile_workarounds()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030173619.2662=
60-1-daniel.charles@intel.com?part=3D1
