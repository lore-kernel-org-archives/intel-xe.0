Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C43C61DD6
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 11:07:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6EF710E4D2;
	Wed,  2 Sep 2026 11:07:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cicAH65+";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55E3B10E4C9;
 Wed,  2 Sep 2026 11:07:34 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 1E4AA43CF4;
 Wed,  2 Sep 2026 11:07:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C03171F000E9;
 Wed,  2 Sep 2026 11:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788347254;
 bh=zntox/NKHKwaBCJ0cemPJI1Q3HpMLwToc3DvNlF1hII=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=cicAH65+/juHKnbFew/aA1VESgUv07NK3jI99BOV+IHpOFvmjmLz+Mz1l/WDNF8Si
 7x0gyO2Wzsvps+aiN53EY1IViC48KbsVPQIRULwKmNfsuDFx/UDyM5Vto4AvW1lWtV
 3TLvSrzTQC6SsKlqpDkFcYR66HGH3Nm2cv4BQIxIdFLAAZFdW6Z2Vl9NnbH1S/taKJ
 MTNzxi45NwSKq7y8a2HkL/d0Y7Z5vZqJY5mjKZSdHhSVPmiqw6V7WoiGt9OvIORrFh
 SJwqdpF6oDM6/DSdzsZ3OpGkTFMy2b/88wqUlnCD9mcekduFx6qoPPXrv0UUWf2Whz
 DCdEb9XqmRrAQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] drm/i915/display: Reject flipq for pipe or
 timing changes
To: "Mika Kahola" <mika.kahola@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <20260902105448.809455-2-mika.kahola@intel.com>
References: <20260902105448.809455-1-mika.kahola@intel.com>
 <20260902105448.809455-2-mika.kahola@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 11:07:33 +0000
Message-Id: <20260902110733.C03171F000E9@smtp.kernel.org>
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
- [Low] Dead code in intel_flipq_commit_is_eligible() due to redundant pipe=
/timing update checks.
--

commit 6779c5cb91fea91170f2e668dc4b0daaf17635f8
Author: Mika Kahola <mika.kahola@intel.com>

drm/i915/display: Reject flipq for pipe or timing changes

This commit introduces intel_flipq_commit_is_eligible() to check if a
commit can use flipq. It explicitly rejects pipe, M/N, and LRR updates in
addition to the existing exclusions.

> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/d=
rm/i915/display/intel_display.c
> index fc30a455bed36..a2f5c3005dec1 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c

[ ... ]

> +static bool intel_flipq_commit_is_eligible(struct intel_atomic_state *st=
ate,
> +					   struct intel_crtc *crtc)
> +{
> +	struct intel_display *display =3D to_intel_display(state);
> +	const struct intel_crtc_state *new_crtc_state =3D
> +		intel_atomic_get_new_crtc_state(state, crtc);
> +
> +	if (!intel_flipq_supported(display))
> +		return false;
> +
> +	if (intel_crtc_needs_modeset(new_crtc_state) ||
> +	    intel_crtc_needs_fastset(new_crtc_state) ||
> +	    intel_crtc_needs_color_update(new_crtc_state))
> +		return false;

[ ... ]

> +	/*
> +	 * Flipq is only suitable for simple queued plane updates that do
> +	 * not require additional pipe or timing programming.
> +	 */
> +	if (new_crtc_state->update_pipe ||
> +	    new_crtc_state->update_m_n ||
> +	    new_crtc_state->update_lrr)
> +		return false;

[Severity: Low]
Are these final checks reachable?

Since intel_crtc_needs_fastset() directly evaluates to
new_crtc_state->update_pipe, any commit where update_pipe is true will retu=
rn
early from the first set of checks in this function.

Additionally, any commit requiring M/N or LRR changes is initially evaluated
as a full modeset. If the commit is later downgraded from a full modeset to=
 a
fastset, new_crtc_state->update_pipe is unconditionally set to true.

Therefore, if update_m_n or update_lrr is true, the commit is guaranteed to
either be a full modeset (intel_crtc_needs_modeset() =3D=3D true) or a fast=
set
(intel_crtc_needs_fastset() =3D=3D true). This appears to make this final b=
lock of
code structurally unreachable.

Can these redundant checks be removed, or is there a specific case where th=
ey
can still be evaluated?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902105448.8094=
55-1-mika.kahola@intel.com?part=3D1
