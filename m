Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5DCE606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 00:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HJ6EcDhK
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB14410E255;
	Thu, 19 Nov 2026 00:39:54 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94B9210ECCE
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 00:39:48 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 7D1D843707;
 Thu, 19 Nov 2026 00:39:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37DF81F000C4;
 Thu, 19 Nov 2026 00:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795048788;
 bh=E2v8vZzD81D/j3IEo0sAkJJ9whOabpJbA0Hge8wLLZs=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=HJ6EcDhKwbzJJUtV4APyc2H9vKXfWNhjVLks9bJKbVHORMa3c02kGPT0D++Ss428e
 u8rLupKmgDQATwg4dkOmBY3g+WOOzishMR/s8ILufr7noYdtFBIYuW2yIhJpBnU5bL
 aVIKcFyDbccXYZaA1cGY8vReglWQFEZ4duHSYP8g/Qf3xxNxvEBLJ6OJzdaSK6XBIz
 Wi2UpkJSGWSXKqWtaKUGuPphl0Rz1db/Ujk+6iI0mrVooyWzDftKx1bfmcsP1pkZVA
 f3BLlvNZPydg4FFLM15obCa2ZowszQVNN9TPtRqRLwBYCcMHxjDj1NsKMhMvKKMaBM
 COMyK2QsFAdZw==
Message-ID: <sashiko-outbox-222253@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 1/8] drm/xe/oa: Ignore a HW tail pointer outside the
 OA buffer
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261119002737.3899877-11-umesh.nerlige.ramappa@intel.com>
References: <20261119002737.3899877-10-umesh.nerlige.ramappa@intel.com>
 <20261119002737.3899877-11-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 00:39:47 +0000
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] drm/xe/oa: early false return in
  xe_oa_buffer_check_unlocked() desyncs pollin
- [Low] drm/xe/oa: Fixes trailer cites 3a1fc394ba85 instead of
  cffd77865f47
--

commit 42d5de4e7078897659a5043b18ec1b877eb0c6b7
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

> drm/xe/oa: Ignore a HW tail pointer outside the OA buffer
>
> A device that stopped responding, e.g. during PCI error recovery or
> after a surprise removal, returns all ones for the OA tail pointer, and
> a reset device returns 0. Subtracting the GGTT address of the OA buffer
> then leaves a tail offset way past the end of the OA buffer.
>
> Since xe_oa_circ_diff() replaced the masked OA_TAKEN(), nothing brings
> such an offset back into the OA buffer. xe_oa_buffer_check_unlocked()
> walks backward from it, reading report ids and timestamps out of bounds
> of the OA buffer mapping, from the poll hrtimer in hardirq context and
> with the OA buffer lock held.
>
> Ignore a HW tail outside the OA buffer, as if no new reports landed.
>
> Fixes: 3a1fc394ba85 ("drm/xe/oa: Changes to OA_TAKEN")
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

[Severity: Low]
Should the Fixes: tag point to cffd77865f47 ("drm/xe/oa: Enable Xe2+
overrun mode") instead?

Commit 3a1fc394ba85 ("drm/xe/oa: Changes to OA_TAKEN") only renamed
OA_TAKEN() to xe_oa_circ_diff() while keeping the (XE_OA_BUFFER_SIZE - 1)
mask.  Commit cffd77865f47 ("drm/xe/oa: Enable Xe2+ overrun mode")
removed that mask and added stream->oa_buffer.circ_size.

> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index 838802482adaf..fdd2d11ce4e7a 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -270,6 +270,15 @@ static bool xe_oa_buffer_check_unlocked(struct xe_oa=
_stream *stream)
>  	hw_tail =3D xe_oa_hw_tail_read(stream);
>  	hw_tail -=3D gtt_offset;
> =20
> +	/*
> +	 * A device that stopped responding, or was reset, returns a tail outsi=
de the OA
> +	 * buffer. Don't walk the buffer from there.
> +	 */
> +	if (hw_tail >=3D stream->oa_buffer.circ_size) {
> +		spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
> +		return false;
> +	}

[Severity: Medium]
Should this return stream->pollin (or recompute it from the unread data
between stream->oa_buffer.head and stream->oa_buffer.tail) instead of
false?

If reports had already landed and set stream->pollin =3D true before a
reset or PCI error makes hw_tail out of bounds, xe_oa_poll_locked() will
still report EPOLLIN via stream->pollin, while a blocking read in
xe_oa_wait_unlocked() will wait in wait_event_interruptible() for
xe_oa_buffer_check_unlocked(stream) and stall instead of draining the
buffered reports.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119002737.3899=
877-10-umesh.nerlige.ramappa@intel.com?part=3D1
