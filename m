Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D2FFC5DF6B
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 22:17:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06A8B10F14C;
	Wed, 12 Aug 2026 22:17:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Kbr4ytKh";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4F2B10E45F
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 19:51:04 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id E60D7600AD;
 Wed, 12 Aug 2026 19:51:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7368C1F000E9;
 Wed, 12 Aug 2026 19:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1786564263;
 bh=rWBGW//HxQB+cewbn1cwSNGSpAK+5iQba9uwxUzxLH0=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Kbr4ytKhcGm4JzOS3wn3qEHn6D7QzshriaWu1hEO6VUnXyQgFfs8mARoA/T8VNaAt
 C3gHNwGlVhXgIo5pkQPereA/L6HvuNLXWYROZY46Ez3mNNKm/5ImACJ+2JZTpLLN5s
 /S4Y0JKWBQ5rZ05AqwHI0YNH+DfFb9joZkhZs24tKdGqMQEpjD86n5Vihj+9dz6SoN
 p+FzpzQufKmqFHjXrleo1FFTLZVkAeUflkKWzMXfeEh2xRKaLesYb8K8bvzPxOH1az
 flSC+9qJP6CoBVpVrChSTmG7Q1gowuMBQ33wev228KnFrfeWzu3YODQIexat086JL2
 j3ySMZ2btSIjw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 26/32] drm/xe/pcode: Report 'timeout, retrying' error
 using SIGID
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260812191450.11690-27-michal.wajdeczko@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-27-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 19:51:03 +0000
Message-Id: <20260812195103.7368C1F000E9@smtp.kernel.org>
X-Mailman-Approved-At: Wed, 12 Aug 2026 22:17:09 +0000
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

Pre-existing issues:
- [High] Uncapped exponential backoff causes udelay() to exceed architectur=
e limits, risking integer overflow and undefined delay times.
--

--- Patch [26]: [PATCH v4 26/32] drm/xe/pcode: Report 'timeout, retrying' e=
rror using SIGID ---
commit 75f6f9c4d8c1d251fab2b4d894d2352070119c43
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>

drm/xe/pcode: Report 'timeout, retrying' error using SIGID

This commit replaces a drm_err message with the xe_log_err helper to report=
=20
PCODE timeout retries using the SIGID tagging infrastructure.

> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
> index 014632e113388..14b13a11d1d6d 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.c
> +++ b/drivers/gpu/drm/xe/xe_pcode.c
[ ... ]
> @@ -218,8 +218,7 @@ int xe_pcode_request(struct xe_tile *tile, u32 mbox, =
u32 request,
>  	 * requests, and for any quirks of the PCODE firmware that delays
>  	 * the request completion.
>  	 */
> -	drm_err(&tile_to_xe(tile)->drm,
> -		"PCODE timeout, retrying with preemption disabled\n");
> +	xe_log_err(tile, PCODE, ret, "timeout, retrying with preemption disable=
d\n");
>  	preempt_disable();
>  	ret =3D pcode_try_request(tile, mbox, request, reply_mask, reply, &stat=
us,
>  				true, 50 * 1000, true);

[Severity: High]
This is a pre-existing issue, but does this 50ms atomic timeout risk
integer overflow in udelay?

Looking at pcode_try_request, which is called here with atomic set to true:

static int pcode_try_request(..., bool atomic, int timeout_us, ...)
{
        int slept, wait =3D 10;
        ...
        for (slept =3D 0; slept < timeout_us; slept +=3D wait) {
                ...
                if (atomic)
                        udelay(wait);
                else
                        usleep_range(wait, wait << 1);
                wait <<=3D 1;
        }
        ...
}

The wait variable grows exponentially without a cap. For a 50,000us timeout
loop, wait will repeatedly double and can reach well over 20,000us before t=
he
timeout expires. This significantly exceeds typical architecture limits for
udelay, which are often around 1 to 2 milliseconds.

Can this uncapped exponential growth cause internal timer math to overflow
and trigger the hard lockup detector when firmware becomes unresponsive?

>  	preempt_enable();

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812191450.1169=
0-1-michal.wajdeczko@intel.com?part=3D26
