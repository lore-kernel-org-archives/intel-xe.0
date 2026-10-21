Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75858606A322
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 16:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QRrFxwGC
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EC5410E30F;
	Wed, 21 Oct 2026 16:37:55 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A33A10E334
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Oct 2026 16:37:49 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 6E67D43E8E;
 Wed, 21 Oct 2026 16:37:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 225FC1F000C3;
 Wed, 21 Oct 2026 16:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1792600668;
 bh=vnfl0Qczoi/f5aRY/PNQHSbocQ+Ka2S32jM50mjh5qI=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=QRrFxwGCnlfB/YGApg1lHnVqYIvjXgfMSawd4Q+xSZaEryAmBF0zLS5AGhJYwDLhq
 pXNTuSc/NhxKyukjypea+LM96/lHB8+AK3XKO0ZcHhGp+AcGxqs/QXqK6NTc+8rtNy
 eZMn3xwzDJAUpwnyPLO5q1CKXho7r8AM9qOjAUPeV75TOl3OZiu+HyEfxpPfKyGviZ
 roH/+qmL9KMtIxIym3ILhzwCMznqGzS7A0HEYc33FGEpUiHzaPNubx988+3QPYFT67
 eY7ksz7pKi9iQBbLPM/MXzY6BFe+2qS++8EuKIlUcUGjEsdn6i0Yo93KFvTFV2nZT3
 l84L84/eQgfBQ==
Message-ID: <sashiko-outbox-180470@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/5] drm/xe/cper: Add CPER support for software errors
To: "Mallesh Koujalagi" <mallesh.koujalagi@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261021162508.265700-11-mallesh.koujalagi@intel.com>
References: <20261021162508.265700-7-mallesh.koujalagi@intel.com>
 <20261021162508.265700-11-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 16:37:47 +0000
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
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] drm/xe/cper: sleeping in atomic context in xe_cper_emit_sw_err()
--

commit 6345dec09856b9879b434e9169adbfef7ce12b5e
Author: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

drm/xe/cper: Add CPER support for software errors

This commit adds CPER record generation for software SIGIDs through
xe_cper_emit_sw_err(), storing driver error classification details and the
formatted log message in the CPER record.

> diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
> index 1dab6ea93fea3..cb4be6f3de7f4 100644
> --- a/drivers/gpu/drm/xe/xe_cper.c
> +++ b/drivers/gpu/drm/xe/xe_cper.c

[ ... ]

> @@ -453,6 +460,84 @@ static void xe_cper_emit_hw_err(struct xe_device *xe=
, int cper_sev, enum xe_sigi

[ ... ]

> +static struct xe_cper_sec_intel_error_info *
> +build_sw_einfo(const union xe_cper_error_class_u *uec, struct va_format =
*vaf,
> +	       u64 timestamp, u32 *einfo_size)
> +{
> +	struct xe_cper_sec_intel_error_info *einfo;
> +	struct xe_intel_priv_event_entry *entry;
> +	char msg[XE_CPER_SW_MSG_MAX];
> +	size_t msg_len;
> +	u32 queue_len;
> +
> +	msg_len =3D sw_format_msg(vaf, msg, sizeof(msg));
> +
> +	queue_len =3D offsetof(struct xe_intel_priv_event_entry, metadata) + ms=
g_len;
> +
> +	einfo =3D kzalloc_flex(*einfo, event_queue, queue_len);
> +	if (!einfo)
> +		return NULL;

[ ... ]

> +static void xe_cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum=
 xe_sigid sigid,
> +				u32 component, u32 location, const void *data,
> +				struct va_format *vaf)
> +{
> +	struct xe_cper_sec_intel_error_info *einfo;
> +	struct xe_cper_sec_intel_err_hdr ihdr =3D {};
> +	u64 timestamp =3D ktime_get_boottime_ns();
> +	union xe_cper_error_class_u uec =3D {};
> +	u32 einfo_size =3D 0;
> +
> +	might_sleep();
> +
> +	fill_cper_driver_error_class(&uec.driver, cper_sev, component, location=
, data);
> +
> +	einfo =3D build_sw_einfo(&uec, vaf, timestamp, &einfo_size);
> +	if (!einfo)
> +		return;
> +
> +	ihdr.error_class =3D uec.ras;
> +	xe_cper_init_intel_err_hdr(xe, timestamp, sigid, 1, &ihdr);
> +	xe_cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_DRV_ERROR, &ihdr,
> +			    einfo, einfo_size);
> +
> +	kfree(einfo);
> +}
> +
>  /**
>   * xe_cper_emit() - Emit a CPER record for a SIGID log entry
>   * @xe: The &xe_device
> @@ -479,7 +564,10 @@ void xe_cper_emit(struct xe_device *xe, int cper_sev=
, enum xe_sigid sigid,
>  		return;
>  	}
> =20
> -	/* TODO software CPER */
> +	if (is_sw_sigid(sigid)) {
> +		xe_cper_emit_sw_err(xe, cper_sev, sigid, component, location, data, va=
f);
> +		return;
> +	}
>  }

[Severity: High]
Can xe_cper_emit_sw_err() sleep when called from atomic contexts via
xe_log_err() or xe_log_err_fatal()?

xe_cper_emit() is invoked synchronously by __xe_log_emit() ->
log_emit_cper(). With this change, software SIGIDs call
xe_cper_emit_sw_err(), which asserts might_sleep() and allocates memory
using GFP_KERNEL in both build_sw_einfo() (via kzalloc_flex()) and
xe_cper_record_emit() (via kzalloc()).

However, several paths in drivers/gpu/drm/xe/ emit software SIGID logs from
atomic contexts where sleeping is not permitted.

For example, in drivers/gpu/drm/xe/xe_guc_ct.c, xe_guc_ct_fast_path() runs
in the interrupt handler under ct->fast_lock:

drivers/gpu/drm/xe/xe_guc_ct.c:xe_guc_ct_fast_path() {
	spin_lock(&ct->fast_lock);
	do {
		len =3D g2h_read(ct, ct->fast_msg, true);
		if (len > 0)
			g2h_fast_path(ct, ct->fast_msg, len);
	} while (len > 0);
	spin_unlock(&ct->fast_lock);
}

Both g2h_read() -> ct_corrupted() and g2h_fast_path() ->
__g2h_release_space() call xe_log_err(ct_to_gt(ct), GUC, ...), which maps
to the software SIGID XE_SIGID_RUNTIME_FW. Similarly, g2h_release_space(),
__guc_ct_send_locked(), and dequeue_one_g2h() call into those helpers while
holding spin_lock_irq(&ct->fast_lock).

In drivers/gpu/drm/xe/xe_pagefault.c, xe_pagefault_handler() acquires
pf_queue->lock with spinlock_irqsave and calls xe_pagefault_queue_add():

drivers/gpu/drm/xe/xe_pagefault.c:xe_pagefault_queue_add() {
	lockdep_assert_held(&pf_queue->lock);

	do {
		/* Not possible, warn on and drop page fault */
		if (WARN_ON_ONCE(xe_pagefault_queue_full(pf_queue))) {
			xe_log_err(xe, PAGEFAULT, -ENOSPC, "Queue full!\n");
			return NULL;
		}
}

And in drivers/gpu/drm/xe/xe_pcode.c, xe_pcode_request() disables
preemption around pcode_try_request() -> pcode_mailbox_rw() ->
__pcode_mailbox_rw() -> pcode_mailbox_status(), which calls
xe_log_err(tile, PCODE, ...):

drivers/gpu/drm/xe/xe_pcode.c:xe_pcode_request() {
	preempt_disable();
	ret =3D pcode_try_request(tile, mbox, request, reply_mask, reply, &status,
				true, 50 * 1000, true);
	preempt_enable();
}

Likewise, xe_mert_irq_handler() in drivers/gpu/drm/xe/xe_mert.c runs in
hardirq context and calls mert_handle_cat_error() ->
xe_device_declare_wedged() -> xe_log_err_fatal(xe, WEDGED, -EIO, ...).

Would these paths trigger a sleeping-while-atomic regression when a
software error is logged?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021162508.2657=
00-7-mallesh.koujalagi@intel.com?part=3D4
