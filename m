Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A95BC5DF94
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 22:38:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFA4810F3E1;
	Fri, 21 Aug 2026 22:38:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TrCr2M7h";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A776710F3E1
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Aug 2026 22:38:07 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 6203361126;
 Fri, 21 Aug 2026 22:37:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B74EE1F000E9;
 Fri, 21 Aug 2026 22:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787351869;
 bh=PNeWNsCjkz2WRaPVGSyuA5lzz/KwHi9TRe7xi7nuHyw=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=TrCr2M7hL5EYHyjTwMKMTcCREwNYizKll2UOCmduaPCZBZMPwfNszpP/vSr1y/ODj
 BqO3N4gj9S8snV9w69iQBjHEydiGdWUJ6wZbcQhM2peA6EWAxIreqzgcLjuclnbcuR
 WZOpdstdpJlkuNmn4k1Dxx2bgu0zYMo3z1M9ZstpAD6H4/lb8iDzeP0Ex8CpqN2Xjk
 WBBuo2DoiRAbPnFElZd4r9WtQYMdBu0JC/OLS5h9uHbZ2bVEGHsSkkSE0NWouTJCop
 ZJuytsVb9uBCQJleWoy3C2e8J3W+QiiDoyb8ueWuiV3mfsziEm8G3i1wBSJFyPeQHp
 2p6CRqAtNWHHQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] drm/xe/xe_oa: Add a lag to the reports that is
 exported to user
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260821222338.1053887-8-umesh.nerlige.ramappa@intel.com>
References: <20260821222338.1053887-5-umesh.nerlige.ramappa@intel.com>
 <20260821222338.1053887-8-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 22:37:49 +0000
Message-Id: <20260821223749.B74EE1F000E9@smtp.kernel.org>
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
- [High] The newly introduced 32-report lag reduces the maximum possible av=
ailable reports, but `wait_num_reports` validation still allows values up t=
o full buffer capacity, causing a permanent hang and `-EIO` on overflow.

Pre-existing issues:
- [High] Readers blocked in `read()` or `poll()` will hang indefinitely whe=
n the OA stream is disabled due to conditional wakeups and incomplete wait =
conditions.
--

--- Patch [3]: [PATCH 3/3] drm/xe/xe_oa: Add a lag to the reports that is e=
xported to user ---
commit 73d1f6a4433c8e56a02c188bad978ed299d6d4b6
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

drm/xe/xe_oa: Add a lag to the reports that is exported to user

This commit adds a 32-report lag to the OA stream reports exposed to the us=
er.
It updates the buffer check logic to ensure the software tail stays behind =
the
hardware tail unless the stream is disabled, in which case all remaining re=
ports
can be read.

> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index 020b27c642268..a025e6c2753f2 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
[ ... ]
> @@ -234,17 +234,23 @@ static bool xe_oa_buffer_check_unlocked(struct xe_o=
a_stream *stream)
>  	hw_tail -=3D gtt_offset;
> =20
>  	/*
> -	 * The tail pointer increases in 64 byte (cacheline size), not in repor=
t_size
> +	 * The hw_tail pointer increases in 64 byte (cacheline size), not in re=
port_size
>  	 * increments. Also report size may not be a power of 2. Compute potent=
ial
>  	 * partially landed report in OA buffer.
>  	 */
>  	partial_report_size =3D xe_oa_circ_diff(stream, hw_tail, stream->oa_buf=
fer.tail);
>  	partial_report_size %=3D report_size;
> =20
> -	/* Subtract partial amount off the tail */
> +	/* Subtract partial amount off the hw_tail */
>  	hw_tail =3D xe_oa_circ_diff(stream, hw_tail, partial_report_size);
> =20
> -	stream->oa_buffer.tail =3D hw_tail;
> +#define LAG_REPORTS 32
> +	lag =3D xe_oa_circ_diff(stream, hw_tail, stream->oa_buffer.tail);
> +	if (!stream->enabled)
> +		stream->oa_buffer.tail =3D hw_tail;
> +	else if (lag > LAG_REPORTS * report_size)
> +		stream->oa_buffer.tail =3D xe_oa_circ_diff(stream, hw_tail,
> +							 LAG_REPORTS * report_size);

[Severity: High]
Does this logic effectively reduce the maximum number of available reports
in the buffer by 32?

If so, userspace could now specify a wait_num_reports in
xe_oa_stream_open_ioctl() that is impossible to satisfy. The ioctl validati=
on
still allows values up to the full buffer capacity:

drivers/gpu/drm/xe/xe_oa.c:xe_oa_stream_open_ioctl() {
    if (param.wait_num_reports > param.oa_buffer_size / f->size) {
        ...
        ret =3D -EINVAL;
    }
}

If userspace requests a wait amount greater than (capacity - 32),
the available amount will never reach wait_num_reports. The hardware
tail will wrap around and overwrite unread data, causing read() or poll()
to hang indefinitely until the overflow is processed and returns -EIO.

Should the validation limit in xe_oa_stream_open_ioctl() be updated to
subtract LAG_REPORTS?

> =20
>  	available =3D xe_oa_circ_diff(stream, stream->oa_buffer.tail, stream->o=
a_buffer.head);
>  	stream->pollin =3D available >=3D stream->wait_num_reports * report_siz=
e;
[ ... ]
> @@ -1490,6 +1492,11 @@ static int xe_oa_disable_locked(struct xe_oa_strea=
m *stream)
>  		ret =3D xe_oa_enable_preempt_timeslice(stream);
> =20
>  	stream->enabled =3D false;
> +
> +	/* Update stream->oa_buffer.tail to allow any final reports to be read =
*/
> +	if (xe_oa_buffer_check_unlocked(stream))
> +		wake_up(&stream->poll_wq);
> +

[Severity: High]
This is a pre-existing issue, but can readers blocked in read() or poll() h=
ang
indefinitely when the OA stream is disabled here?

Because xe_oa_buffer_check_unlocked() returns true only when
available >=3D wait_num_reports, the wakeup is skipped entirely if there are
fewer pending reports than the wait threshold.

Furthermore, looking at xe_oa_wait_unlocked(), it doesn't check
!stream->enabled in its wait condition:

drivers/gpu/drm/xe/xe_oa.c:xe_oa_wait_unlocked() {
    return wait_event_interruptible(stream->poll_wq,
                                    xe_oa_buffer_check_unlocked(stream));
}

Even if an unconditional wakeup was performed here, wouldn't the thread
re-evaluate the condition and go back to sleep forever since the hardware
is stopped and timers are canceled?

>  	return ret;
>  }
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821222338.1053=
887-5-umesh.nerlige.ramappa@intel.com?part=3D3
