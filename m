Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9ED606A324
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 13:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WU1lep3a
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C5CF1122F4;
	Thu, 29 Oct 2026 13:37:44 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 304C11122D9
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Oct 2026 13:37:31 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 19FC143CAD;
 Thu, 29 Oct 2026 13:37:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAAE01F0124B;
 Thu, 29 Oct 2026 13:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793281051;
 bh=0bG578fXgW51OH2MTr0xWQeq32IEVaJz+wSPVLGTfNM=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=WU1lep3aRuXpILzIOWYLUkBKxh7OM5oAyw74xmYi2tf+Udk0IjYUIbtZEBiJuaJo/
 wmwcQH+xEtrcpPfSrOd0JxdVKr6GY0QuwfJ6F+tV/8X77sJbdtlBQCOpUh7EXZ6wMk
 ywr9P4S8riUWL3fQdM8KYYKdHYkI94XZVXHs2/xX2nbJNp2WkHe9HBeuK/riagZ2UF
 1X62jSWS88jUzlVFZPI1k1qwYNOpP2QfwQfC4mdLLlHZStIWvNNOdpZw+eEl+L46B2
 nU7G747LTSFCnBiQoKYUOiTyVbcDXjpBYpKBOjMRHlalhQwd4A6MlCjMqfQrysi7Z0
 f7Fw555UubfaA==
Message-ID: <sashiko-outbox-189398@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/6] drm/xe/cper: Support software CPER records
To: "Mallesh Koujalagi" <mallesh.koujalagi@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261029132609.907017-12-mallesh.koujalagi@intel.com>
References: <20261029132609.907017-8-mallesh.koujalagi@intel.com>
 <20261029132609.907017-12-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 13:37:30 +0000
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

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] drm/xe/cper: sleeping in atomic context in cper_emit_sw_err()
- [High] drm/xe/cper: NULL pointer dereference in cper_emit_sw_err() when x=
e is NULL
--

commit c16a87d05ae708e1a17ac24623a75a82d558972b
Author: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

drm/xe/cper: Support software CPER records

This commit adds support for handling software SIGIDs in xe_cper_emit() by
formatting the log message and emitting driver-notification CPER records via
cper_emit_sw_err().

> diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
> index e802f534eb45a..ec61605d0a314 100644
> --- a/drivers/gpu/drm/xe/xe_cper.c
> +++ b/drivers/gpu/drm/xe/xe_cper.c

[ ... ]

> @@ -239,6 +246,37 @@ static void cper_emit_hw_err(struct xe_device *xe, i=
nt cper_sev, enum xe_sigid s
>  	xe_cper_emit_counter(xe, cper_sev, sigid, counter, &response);
>  }
> =20
> +#define XE_CPER_SW_MSG_MAX	256
> +
> +static size_t cper_format_sw_msg(struct va_format *vaf, char *buf, size_=
t size)
> +{
> +	return scnprintf(buf, size, "%pV", vaf) + 1;
> +}
> +
> +static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe=
_sigid sigid,
> +			     u32 component, u32 location, const void *data,
> +			     struct va_format *vaf)
> +{
> +	struct xe_cper_intel_hdr ihdr =3D {};
> +	struct xe_cper_driver_error_class *driver =3D &ihdr.driver;
> +	u64 timestamp =3D ktime_get_boottime_ns();
> +	char msg[XE_CPER_SW_MSG_MAX];
> +	size_t msg_len;
> +
> +	might_sleep();
> +
> +	driver->error_type =3D cper_sev;
> +	driver->error_component =3D component;
> +	driver->tile =3D location;
> +	if (IS_ERR(data))
> +		driver->cause =3D -PTR_ERR(data);
> +
> +	msg_len =3D cper_format_sw_msg(vaf, msg, sizeof(msg));
> +
> +	cper_init_intel_hdr(xe, timestamp, sigid, 1, &ihdr);
> +	cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_DRV_ERROR, &ihdr, msg=
, msg_len);
> +}

[Severity: High]
Can cper_emit_sw_err() sleep in atomic context when software SIGIDs are
logged?

In drivers/gpu/drm/xe/xe_log.c, __xe_log_emit() unconditionally calls
log_emit_cper() -> xe_cper_emit(). With this change, software SIGIDs are
routed to cper_emit_sw_err(), which calls might_sleep() and then calls
cper_record_emit() in drivers/gpu/drm/xe/xe_cper.c:

    total_len =3D sizeof(struct xe_cper_nonstd_record) + einfo_len;
    rec =3D kzalloc(total_len, GFP_KERNEL);

However, several paths in the driver emit software SIGID logs from hardirq
context, while holding spinlocks, or with preemption disabled:

1. In drivers/gpu/drm/xe/xe_guc_ct.c, xe_guc_ct_fast_path() runs from the
interrupt handler under xe->irq.lock and ct->fast_lock:

    spin_lock(&ct->fast_lock);
    do {
        len =3D g2h_read(ct, ct->fast_msg, true);
        if (len > 0)
            g2h_fast_path(ct, ct->fast_msg, len);
    } while (len > 0);
    spin_unlock(&ct->fast_lock);

Within this critical section (as well as in g2h_release_space(),
dequeue_one_g2h(), and __guc_ct_send_locked() while holding ct->fast_lock),
g2h_read() -> ct_corrupted() and g2h_fast_path() -> __g2h_release_space()
call xe_log_err() for the GuC component:

    xe_log_err(ct_to_gt(ct), GUC, err, "CT: %pV", &vaf);

2. In drivers/gpu/drm/xe/xe_pagefault.c, xe_pagefault_handler() (called from
hardirq context via xe_guc_ct_fast_path()) and xe_pagefault_queue_pop() hold
pf_queue->lock and call xe_pagefault_queue_add():

    guard(spinlock_irqsave)(&pf_queue->lock);

    empty =3D xe_pagefault_queue_empty(pf_queue);
    lpf =3D xe_pagefault_queue_add(pf_queue, pf);

When the queue is full, xe_pagefault_queue_add() calls:

    if (WARN_ON_ONCE(xe_pagefault_queue_full(pf_queue))) {
        xe_log_err(xe, PAGEFAULT, -ENOSPC, "Queue full!\n");
        return NULL;
    }

3. In drivers/gpu/drm/xe/xe_wedge.c, xe_wedge_declare() is documented as sa=
fe
for atomic callers and is invoked from hardirq context via
dg1_irq_handler() -> xe_mert_irq_handler() -> mert_handle_cat_error():

    xe_log_err_fatal(xe, WEDGED, -EIO, "Device declared wedged!\n");

4. In drivers/gpu/drm/xe/xe_pcode.c, xe_pcode_request() disables preemption
around pcode_try_request() -> pcode_mailbox_rw() -> __pcode_mailbox_rw() ->
pcode_mailbox_status(), which logs PCODE errors via xe_log_err():

    preempt_disable();
    ret =3D pcode_try_request(tile, mbox, request, reply_mask, reply, &stat=
us,
                            true, 50 * 1000, true);
    preempt_enable();

> +
>  /**
>   * xe_cper_emit() - Emit a CPER record for a SIGID log entry
>   * @xe: The &xe_device
> @@ -272,7 +310,8 @@ void xe_cper_emit(struct xe_device *xe, int cper_sev,=
 enum xe_sigid sigid,
>  		return;
>  	}
> =20
> -	/* TODO software CPER */
> +	if (is_sw_sigid(sigid))
> +		cper_emit_sw_err(xe, cper_sev, sigid, component, location, data, vaf);
>  }

[Severity: High]
Could this dereference a null xe pointer when xe_cper_emit() is called duri=
ng
early PCI probe?

In drivers/gpu/drm/xe/xe_log.c, log_emit_cper() resolves the device pointer
via xe_any_to_xe():

    xe_cper_emit(xe_any_to_xe(pdev), cper_sev, sigid,
                 component, location, data, len, vaf);

When a struct pci_dev pointer is passed to the logging macros before
pci_set_drvdata() has been called in __xe_pci_probe(), pdev_to_xe_device(pd=
ev)
returns NULL. This happens in drivers/gpu/drm/xe/xe_pci.c in xe_pci_probe()
when a device ID is blocked or if __xe_pci_probe() fails during early setup
(such as in devres_open_group(), pcim_enable_device(), or
xe_device_create()):

    if (id_blocked(pdev->device)) {
        xe_log_info(pdev, PROBE, "driver loading blocked for device '%04x'\=
n",
                    pdev->device);
        return -ENODEV;
    }

    if (xe_display_driver_probe_defer(pdev))
        return -EPROBE_DEFER;

    err =3D __xe_pci_probe(pdev, desc);
    if (err) {
        xe_log_err_fatal(pdev, PROBE, err, "driver loading failed for devic=
e '%04x'\n",
                         pdev->device);
        return err;
    }

Because those probe logs use a software SIGID, xe_cper_emit() now calls
cper_emit_sw_err() -> cper_init_intel_hdr() with xe set to NULL, which
dereferences xe->drm.dev in drivers/gpu/drm/xe/xe_cper.c:

    strscpy(ihdr->pci_bdf, pci_name(to_pci_dev(xe->drm.dev)), sizeof(ihdr->=
pci_bdf));

Should xe_cper_emit() check for a null xe pointer before proceeding?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261029132609.9070=
17-8-mallesh.koujalagi@intel.com?part=3D4
