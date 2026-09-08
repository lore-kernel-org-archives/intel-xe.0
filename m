Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 930CBC79FA1
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 22:37:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 403B010E109;
	Tue,  8 Sep 2026 22:37:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="k15Paazs";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9814010E109
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 22:37:29 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 5483141AD1;
 Tue,  8 Sep 2026 22:37:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17A8C1F00A3A;
 Tue,  8 Sep 2026 22:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788907049;
 bh=NaxbCI1zEH/bUxI3TDQuAgRSx8JOciyq5LDyRx0Ftus=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=k15PaazsPAJYEdkYUsdu4NCchPI+SdzSq1R4VLGw86Buh58cqpfyZ3UeaaTTYE2pV
 YBnSTQwamgoT13ossJTpbK1YHLd5te7QBVejTAdZOm1VZBxKbdqsa98sAmUYBnjXAw
 /yt/sPovx1ypz475qIFOJl5jzIkd0TDWWKxYBT5Iy3M4zjSCqVSUi0QfEA2Jkzwg9s
 7GeCGg0pmFQCnLtD1mVmEwq6N9BKy4IkYLOpmMYSmX9WUrQIsGRJlWiEXniEmWdZaR
 JZnWeE6tZz/xJRDFXd6XTCbvXRoS6pxUNFpbGEJXu/xY74H+kxUqpYM4quJT3hxNVl
 RqwBQlmPetASw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] drm/xe/xe_oa: Add a lag to the reports that is
 exported to user
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260908222356.1210175-8-umesh.nerlige.ramappa@intel.com>
References: <20260908222356.1210175-5-umesh.nerlige.ramappa@intel.com>
 <20260908222356.1210175-8-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 22:37:28 +0000
Message-Id: <20260908223729.17A8C1F00A3A@smtp.kernel.org>
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
- [High] Blocked readers in xe_oa_wait_unlocked hang indefinitely if the st=
ream is disabled while the buffer is empty.
--

commit 497d599879fc02405141ca1b9f088558ace82618
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

drm/xe/xe_oa: Add a lag to the reports that is exported to user

This commit adds a lag to the OA reports exported to the user to ensure
they have landed in memory before being read. It also updates the stream
disablement path to allow remaining reports up to the HW tail to be read.

> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index 08d6e94f5fcee..034c9c27538c8 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
[ ... ]
> @@ -234,20 +234,29 @@ static bool xe_oa_buffer_check_unlocked(struct xe_o=
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
> +	num_reports =3D stream->wait_num_reports;
> +	if (!stream->enabled) {
> +		num_reports =3D 1;
> +		stream->oa_buffer.tail =3D hw_tail;
> +	} else if (lag > LAG_REPORTS * report_size) {
> +		stream->oa_buffer.tail =3D xe_oa_circ_diff(stream, hw_tail,
> +							 LAG_REPORTS * report_size);
> +	}
> =20
>  	available =3D xe_oa_circ_diff(stream, stream->oa_buffer.tail, stream->o=
a_buffer.head);
> -	stream->pollin =3D available >=3D stream->wait_num_reports * report_siz=
e;
> +	stream->pollin =3D available >=3D num_reports * report_size;

[Severity: High]
This is a pre-existing issue, but does this condition allow blocked readers=
 to
hang indefinitely if the stream is disabled while the buffer is empty?

When available is 0 and stream->enabled is false, num_reports is set to 1.
This makes the condition 0 >=3D 1 * report_size evaluate to false.

Because xe_oa_wait_unlocked() relies entirely on this function returning tr=
ue:

drivers/gpu/drm/xe/xe_oa.c:xe_oa_wait_unlocked() {
	return wait_event_interruptible(stream->poll_wq,
					xe_oa_buffer_check_unlocked(stream));
}

A reader waiting on an empty disabled stream will never be unblocked.

Additionally, if the wait condition were modified to return true here, does=
 the
while loop in xe_oa_read() need a check for !stream->enabled?

drivers/gpu/drm/xe/xe_oa.c:xe_oa_read() {
		do {
			ret =3D xe_oa_wait_unlocked(stream);
			if (ret)
				return ret;

			mutex_lock(&stream->stream_lock);
			ret =3D __xe_oa_read(stream, buf, count, &offset);
			mutex_unlock(&stream->stream_lock);
		} while (!offset && !ret);
}

Since __xe_oa_read() returns 0 when empty, lacking an EOF check for a disab=
led
stream could cause this loop to spin infinitely.

> =20
>  	spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
> =20
[ ... ]
> @@ -1490,6 +1495,11 @@ static int xe_oa_disable_locked(struct xe_oa_strea=
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
This is a pre-existing issue, but does skipping the wake up here leave thre=
ads
blocked indefinitely if they were waiting on an empty stream?

If xe_oa_buffer_check_unlocked() evaluates to false because there are no
available reports, the wake_up() is skipped. Since the polling timer is also
canceled during stream disable, any thread sleeping in xe_oa_wait_unlocked()
will remain blocked.

Would it be better to wake up the wait queue unconditionally when disabling
the stream, and then ensure the wait condition handles !stream->enabled
appropriately?

>  	return ret;
>  }
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908222356.1210=
175-5-umesh.nerlige.ramappa@intel.com?part=3D3
