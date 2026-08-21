Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51A0DC5DF8C
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 20:21:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1779410E17E;
	Fri, 21 Aug 2026 20:21:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="c76ztsQn";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 653C710E17E
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Aug 2026 20:21:14 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 991DC61126;
 Fri, 21 Aug 2026 20:21:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B6BA1F000E9;
 Fri, 21 Aug 2026 20:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787343673;
 bh=UR24eUUE9sZGvo99cQgepc67JcX8Su/0sbFRU0GFDUM=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=c76ztsQn+zsL5EJ/YGCiEnaDVOb4vP+Qfs+3X2SRe3UYJCbVmrrc2s7ialSBrQjmV
 8eEik/e+np/5zA6peT4TDl7YFCdW1CxNbDIIwsxfYnI9cVP+T0Tr+Nb+ycRq760nSY
 Yte2bVnxbbkvtIxakCtgfxGDEDI7nmIWI7rfi/u1Q8yRpB2j3izsL+mUyM7eNHTjGt
 Za8ebDokgJeuOY/2sD/vo3LuVPn7tH0B3OEKfHk782GnZ+rovkbky21YOlMx4BncQx
 mjq5cec/daHYYV8BJ8CkiQxfq4ENtyAVcZwyworxhVLivfaRlRWMf3aXjvS1NSTXDF
 5pBzoBjHvSU0Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] drm/xe/xe_oa: Add a lag to the reports that is
 exported to user
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260821200728.1048699-8-umesh.nerlige.ramappa@intel.com>
References: <20260821200728.1048699-5-umesh.nerlige.ramappa@intel.com>
 <20260821200728.1048699-8-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 20:21:12 +0000
Message-Id: <20260821202113.1B6BA1F000E9@smtp.kernel.org>
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
- [High] Readers can block indefinitely on disabled streams because `stream=
->enabled` is set to false too late, failing to flush the final OA reports.
- [Medium] Data race on `stream->enabled` between `xe_oa_buffer_check_unloc=
ked` and `xe_oa_disable_locked`/`xe_oa_enable_locked`.
--

--- Patch [3]: [PATCH 3/3] drm/xe/xe_oa: Add a lag to the reports that is e=
xported to user ---
commit 4ec3e1c770bffdf39a86c1db169059b4bc510058
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

drm/xe/xe_oa: Add a lag to the reports that is exported to user

This commit delays the visibility of OA reports to user space by holding
back the tail by 32 reports to ensure they have landed in memory. It also
attempts to flush all remaining reports when the stream is disabled.

> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c

[ ... ]

> @@ -234,17 +234,23 @@ static bool xe_oa_buffer_check_unlocked(struct xe_o=
a_stream *stream)
>  	/* Subtract partial amount off the hw_tail */
>  	hw_tail =3D xe_oa_circ_diff(stream, hw_tail, partial_report_size);
> =20
> -	stream->oa_buffer.tail =3D hw_tail;
> +#define LAG_REPORTS 32
> +	lag =3D xe_oa_circ_diff(stream, hw_tail, stream->oa_buffer.tail);
> +	if (!stream->enabled)

[Severity: Medium]
Is it safe to read stream->enabled here? It appears to be read while holding
the stream->oa_buffer.ptr_lock spinlock, but modified in
xe_oa_disable_locked() and xe_oa_enable_locked() while holding the
stream->stream_lock mutex. Could this cause data races?

[Severity: High]
Will readers waiting on a disabled stream block indefinitely?

When a thread calls DRM_XE_OBSERVATION_IOCTL_DISABLE, xe_oa_disable_locked()
is executed:

xe_oa_disable_locked() {
    xe_oa_stream_disable(stream);
    ...
    stream->enabled =3D false;
}

xe_oa_stream_disable() cancels the poll timer and calls
xe_oa_buffer_check_unlocked() to flush the final reports. However, since
stream->enabled is still true when xe_oa_buffer_check_unlocked() is called,
this bypass check will evaluate to false.

If the tail is held back by the lag, pollin evaluates to false, and
wake_up() is never called, could this cause userspace threads blocking in
read() or poll() to hang indefinitely with stranded reports?

> +		stream->oa_buffer.tail =3D hw_tail;
> +	else if (lag > LAG_REPORTS * report_size)
> +		stream->oa_buffer.tail =3D xe_oa_circ_diff(stream, hw_tail,
> +							 LAG_REPORTS * report_size);
> =20
>  	available =3D xe_oa_circ_diff(stream, stream->oa_buffer.tail, stream->o=
a_buffer.head);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821200728.1048=
699-5-umesh.nerlige.ramappa@intel.com?part=3D3
