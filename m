Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7464B606A324
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 09:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jv/iZngk
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A0DB112246;
	Thu, 19 Nov 2026 09:59:06 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 712D8112245
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 09:58:59 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 15D1E43BEB;
 Thu, 19 Nov 2026 09:58:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE87F1F000C4;
 Thu, 19 Nov 2026 09:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795082339;
 bh=qnrVbTfTcz8pUYxYySHoEzo3E4+p0K+muFXvY2groAw=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=jv/iZngkyulg5buq8Z6NQBjXHktAqnob44RXNFshvrGHCRyfrK/30vdM1ALw8gEpq
 HS4aSLub8i86WO34AjLKB+Svz99KMDuyyg26+Glh1z+BvqHXWOeXWSsKT/fGpdDOBi
 GRDWga893RDEZbzN8W5yILiNqkPhHg9h5BSVCusADkeYdD3RxCEXRX3e+S9My4Z0Gd
 RytFJUktgK1EbaRvystX46kJnEor9YSeWdD/CInbh7hgqtEgg7P9/+bYSWdtH/xMDB
 rjwCU3uEr8C9aOOa8+4QVwCYGFauQRP0ZbzpDLQro85rQYqNCAWS5zIK3u0S0idwLl
 LQRFwg+SaFKZA==
Message-ID: <sashiko-outbox-222890@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] drm/xe/wedge: Introduce xe_wedge_mode_is_no_reset()
To: "Raag Jadav" <raag.jadav@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261119095151.2041411-3-raag.jadav@intel.com>
References: <20261119095151.2041411-1-raag.jadav@intel.com>
 <20261119095151.2041411-3-raag.jadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 09:58:58 +0000
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
- [Low] drm/xe: unconverted no-reset wedge check in
  guc_submit_hint_wedged()
--

commit 639a1a01865e9d03bd91aba733177709c6405dcb
Author: Raag Jadav <raag.jadav@intel.com>

drm/xe/wedge: Introduce xe_wedge_mode_is_no_reset()

This commit introduces the xe_wedge_mode_is_no_reset() helper and replaces
open-coded XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET checks across the driver.

[ ... ]

> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index b5c916a764dbe..fc0f50307f2f5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1435,7 +1435,7 @@ void xe_guc_submit_wedge(struct xe_guc *guc)
>  	if (!guc->submission_state.initialized)
>  		return;
> =20
> -	if (xe->wedged.mode =3D=3D XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET) {
> +	if (xe_wedge_mode_is_no_reset(xe)) {
>  		mutex_lock(&guc->submission_state.lock);
>  		xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
>  			if (xe_exec_queue_get_unless_zero(q))

[Severity: Low]
Should guc_submit_hint_wedged() right below xe_guc_submit_wedge() also use
!xe_wedge_mode_is_no_reset(xe), like drm_ras_counter_get()?

drivers/gpu/drm/xe/xe_guc_submit.c:guc_submit_hint_wedged() {
	struct xe_device *xe =3D guc_to_xe(guc);

	if (xe->wedged.mode !=3D XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
		return false;
    ...
}

It is the only remaining open-coded check of xe->wedged.mode against
XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET outside xe_wedge_mode_is_no_reset().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119095151.2041=
411-1-raag.jadav@intel.com?part=3D2
