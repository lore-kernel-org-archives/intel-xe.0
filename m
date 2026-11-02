Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9213D606A326
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 08:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aOtNZD44
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35ECB10EC01;
	Mon,  2 Nov 2026 08:18:18 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86B5110E073;
 Mon,  2 Nov 2026 08:18:11 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 1BEA4402E7;
 Mon,  2 Nov 2026 08:18:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C20711F000C1;
 Mon,  2 Nov 2026 08:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793607491;
 bh=Y7hdZTUeorA9PihYPLt3qa6RSGrtTiXIML9FB/T6cBE=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=aOtNZD44kiYpYCUA4C8TW+9Uyl6DY6S3jtgd2QkJ9ulOf3vmV8jXN59IH9l3Xxj5P
 Z/LbmOEAXHBJDudtBXjg3EDMheDnk1rIQy4O/dqgB+ooeiWRs0515VInNmaemUILlQ
 s8QspZdqLKiq/NGnMe5JegzxH9fav8UMZJRhjgksXIwOKbNcGShqxPC122f6/0wT1C
 ENofAUx66TooTxFG/ymFbc3XRkhNli2VkMCrtf/cBSyiy1+mZKVC5hJWwJbQfxBY+q
 0orvgZAeeYuIzQTARW6/7xBrNlXEB79lUlGHvvgq3adyHdjgls7Q4e9VhUBdUlj3r7
 b6WxnWYaxFNmw==
Message-ID: <sashiko-outbox-193094@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/i915/display: Run the selective fetch update after
 the crtc checks
To: "Mika Kahola" <mika.kahola@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261102080705.2027571-1-mika.kahola@intel.com>
References: <20261102080705.2027571-1-mika.kahola@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 08:18:10 +0000
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] drm/i915/display: sel fetch loop misapplied to intel_async_flip_ch=
eck_uapi()
--

commit 95230b3cd094aeb1ee4f35af24d1f7d8002a6446
Author: Mika Kahola <mika.kahola@intel.com>

drm/i915/display: Run the selective fetch update after the crtc checks

This commit moves the call to intel_psr2_sel_fetch_update() out of
intel_crtc_atomic_check() into a separate loop so that selective fetch is
computed after all joined pipes have had their scaler states updated.

> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/d=
rm/i915/display/intel_display.c
> index d5d4453f283bb..e3831260ca4a1 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -4444,10 +4444,6 @@ static int intel_crtc_atomic_check(struct intel_at=
omic_state *state,
> =20
>  	}
> =20
> -	ret =3D intel_psr2_sel_fetch_update(state, crtc);
> -	if (ret)
> -		return ret;
> -
>  	return 0;
>  }
> =20
> @@ -6188,6 +6184,19 @@ static int intel_async_flip_check_uapi(struct inte=
l_atomic_state *state,
>  		}
>  	}
> =20
> +	/* Selective fetch needs the scaler state of all the joined pipes. */
> +	for_each_new_intel_crtc_in_state(state, crtc, crtc_state) {
> +		int ret;
> +
> +		ret =3D intel_psr2_sel_fetch_update(state, crtc);
> +		if (ret) {
> +			drm_dbg_atomic(display->drm,
> +				       "[CRTC:%d:%s] selective fetch check failed\n",
> +				       crtc->base.base.id, crtc->base.name);
> +			return ret;
> +		}
> +	}

[Severity: High]
Was this hunk misapplied to intel_async_flip_check_uapi() instead of
intel_atomic_check_crtcs()?

In drivers/gpu/drm/i915/display/intel_display.c, intel_async_flip_check_uap=
i()
declares new_crtc_state rather than crtc_state, so expanding
for_each_new_intel_crtc_in_state(state, crtc, crtc_state) fails to compile
with an undeclared identifier error:

drivers/gpu/drm/i915/display/intel_display.c:intel_async_flip_check_uapi() {
	struct intel_display *display =3D to_intel_display(state);
	const struct intel_crtc_state *new_crtc_state =3D
		intel_atomic_get_new_crtc_state(state, crtc);
	...
	if (!new_crtc_state->uapi.async_flip)
		return 0;
	...
	if (new_crtc_state->joiner_pipes) {
		drm_dbg_kms(display->drm,
			    "[CRTC:%d:%s] async flip disallowed with joiner\n",
			    crtc->base.base.id, crtc->base.name);
		return -EINVAL;
	}
}

In addition, intel_async_flip_check_uapi() returns early for synchronous
commits and rejects joined pipes, and runs in intel_atomic_check() before
intel_atomic_check_crtcs() configures the scalers. With the call removed
from intel_crtc_atomic_check(), normal atomic commits never run
intel_psr2_sel_fetch_update().

Should this loop be placed at the end of intel_atomic_check_crtcs()
instead, as described in the commit message?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102080705.2027=
571-1-mika.kahola@intel.com?part=3D1
