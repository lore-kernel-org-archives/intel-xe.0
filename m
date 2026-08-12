Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19728C5B56A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 17:41:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1CBB10E308;
	Wed, 12 Aug 2026 17:41:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FHMsAZzh";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B444F10E405
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 12:44:03 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id BEC8E60A84;
 Wed, 12 Aug 2026 12:44:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C0251F000E9;
 Wed, 12 Aug 2026 12:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1786538642;
 bh=TN8mrCMJACqSCCsbrwFu7Gn9+CAsXl2JOXJWvbA1Bzs=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=FHMsAZzhbh6cqG2f0hEgcYXgqiTlVLw9ZFE9vZb+1DckKjvqHBoIr0vcL7HmfvvB2
 7/h2uHreU7cOf+4tO3JBi507P9haMmWu/Xhpq4TCc/jzWovyAO69r1DEC1VjEXJUSu
 0/EVutYrA6e6ZbLt8I+B14gxPe8SMqSa3Krz1Xoat05N4ObeH1GP+j1MZArpCMnuIa
 Qoeigk5YIR3UHLeDenMDheKkZdiYTP61n7tDBH5eXuX0mGYUk7jgX603ju6uM3HFy9
 8rbvKkiBjgqbkXgi3SYbtGnziIYp5IvTLUxvrJOqAvaeByJUNwlWIaVBho+2YzOzDA
 7e1tKRFP8RgHw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] drm/xe/pcode: Improve PCODE logging using xe_log
 helper
To: "Mallesh Koujalagi" <mallesh.koujalagi@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260812123449.239480-7-mallesh.koujalagi@intel.com>
References: <20260812123449.239480-5-mallesh.koujalagi@intel.com>
 <20260812123449.239480-7-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 12:44:01 +0000
Message-Id: <20260812124402.4C0251F000E9@smtp.kernel.org>
X-Mailman-Approved-At: Wed, 12 Aug 2026 17:41:21 +0000
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

New issues:
- [Medium] Incomplete migration to xe_log_err for PCODE errors

Pre-existing issues:
- [High] Unbounded exponential backoff in PCODE polling loop causes massive=
 sleeps and dangerous udelay() calls
--

--- Patch [2]: [PATCH v2 2/3] drm/xe/pcode: Improve PCODE logging using xe_=
log helper ---
commit be49e77e4b5b367f065e60c69fb19b1b95cdf273
Author: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

drm/xe/pcode: Improve PCODE logging using xe_log helper

This commit updates the driver to use the xe_log_err() helper for PCODE
errors instead of drm_err(). This aims to add the PCODE component tag to the
log messages to make issues easier to track.

> Use xe_log helper for PCODE errors instead of drm_err(). This
> adds PCODE component tag, making issues easier to detect and
> track with automated tools.

[Severity: Medium]
Did we miss updating the drm_err() call in pcode_mailbox_status()?

drivers/gpu/drm/xe/xe_pcode.c:pcode_mailbox_status() {
	if (err) {
		drm_err(&tile_to_xe(tile)->drm, "PCODE Mailbox failed: %d %s",
			err_decode, err_str);

		return err_decode;
	}
...
}

It seems this error logging statement was left unconverted. Leaving it as
drm_err() means automated tools tracking the PCODE component tag might miss
these critical hardware mailbox failures.

> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
> index ccc3bdeed6bb2..c69440ea477b4 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.c
> +++ b/drivers/gpu/drm/xe/xe_pcode.c

[ ... ]

> @@ -219,8 +220,8 @@ int xe_pcode_request(struct xe_tile *tile, u32 mbox, =
u32 request,
>  	 * requests, and for any quirks of the PCODE firmware that delays
>  	 * the request completion.
>  	 */
> -	drm_err(&tile_to_xe(tile)->drm,
> -		"PCODE timeout, retrying with preemption disabled\n");
> +	xe_log_err(tile, PCODE, -ETIMEDOUT,
> +		   "Timeout, retrying with preemption disabled\n");
>  	preempt_disable();
>  	ret =3D pcode_try_request(tile, mbox, request, reply_mask, reply, &stat=
us,
>  				true, 50 * 1000, true);

[Severity: High]
This isn't a bug introduced by this patch, but does the polling loop in
pcode_try_request() have an unbounded exponential backoff?

Looking at the pcode_try_request() function called here:

	for (slept =3D 0; slept < timeout_us; slept +=3D wait) {
		...
		if (atomic)
			udelay(wait);
		else
			usleep_range(wait, wait << 1);
		wait <<=3D 1;
	}

Because wait is doubled on every iteration without an upper limit, it
exponentially grows. When called from xe_pcode_request() during a timeout
retry with atomic =3D true and a 50,000us timeout, wait reaches 32,768us,
resulting in a udelay(32768). Busy-waiting for over 32 milliseconds with
preemption disabled can trigger CPU soft lockups.

Similarly, when pcode_try_request() is called for operations with a 3-minute
timeout (timeout_us =3D 180000000) during initialization in xe_pcode_ready(=
),
the wait value grows to over 90 seconds. This causes a massive
usleep_range(90000000, 180000000) that stalls the thread for minutes at a
time without checking the hardware status, which could severely degrade
driver probe times.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812123449.2394=
80-5-mallesh.koujalagi@intel.com?part=3D2
