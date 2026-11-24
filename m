Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB3A606A685
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 14:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Eya9lGlU
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44AEC10F608;
	Tue, 24 Nov 2026 14:04:12 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2B2610F607
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 14:04:06 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 28C7841E9A;
 Tue, 24 Nov 2026 14:04:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBA9D1F000D4;
 Tue, 24 Nov 2026 14:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795529045;
 bh=R5HcPZ3OXfR1Hd7JaN9lkndOKIy418iHw3H43nq7zaE=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=Eya9lGlUFfGLGuucbwi/uLtGxbp5ipoc+VP0KSg1uKZgrtXAJ/+iebSOd/OuXuLXo
 sA6oWUQWUNGvGYovM3EXEngTRjZDaCQk1Hx7JvfEEMRqJnzBLKE/5FFML7Kb0p/Iud
 dGxmIoWsxLL+G1QS07j2fe+VQcsPZPNEUwTnVWYwzebLF4xoK73sRZN61Qo9eHGE5L
 b1DLeZEMnQROhuBWMBHbKYPuDyeEMANbVd5bt7sgQ/XdCC9TAQIXStyapP2cEFNYG7
 7+EePQuNeSDVmMHFLdzZB1+NPsKr/kv/4gBJzpoTJ6oFJ+MGyaz2JNKlpgmtspef+L
 TdZU34rl5Qh8A==
Message-ID: <sashiko-outbox-231296@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] drm/xe/sysctrl: Drain page offline queue on
 queue-full event
To: "Riana Tauro" <riana.tauro@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261124134323.1529876-2-riana.tauro@intel.com>
References: <20261124134323.1529876-2-riana.tauro@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 14:04:05 +0000
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

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] drm/xe/ras: ignored handle_page_offline() error in
  process_offline_pages()
- [Medium] drm/xe/sysctrl: xa_node leak in xe_ras_get_offline_queue() on
  teardown
- [Medium] drm/xe/ras: race in handle_page_offline() between sysctrl and
  hw_error workers
--

commit 0742a26c8b6bd03e3b9869cb12c67ca9f93c1626
Author: Riana Tauro <riana.tauro@intel.com>

drm/xe/sysctrl: Drain page offline queue on queue-full event

This commit exposes xe_ras_get_offline_queue() and invokes it when the
System Controller reports XE_SYSCTRL_EVENT_PAGE_OFFLINE_QUEUE_FULL so the
driver drains the firmware page offline queue at runtime.

> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index b35c77caeaae4..4014945b47bae 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -483,11 +483,13 @@ static void process_offline_pages(struct xe_device =
*xe, u32 cmd, void *req, size
>  	} while (common->additional_data);
>  }
> =20
> -/*
> - * Retrieve firmware queued pages from warm-retained SRAM during probe. =
Handle and soft-offline
> - * each page as required.
> +/**
> + * xe_ras_get_offline_queue() - Drain page offline queue
> + * @xe: xe device instance
> + *
> + * Retrieve firmware queued pages from warm-retained SRAM and process ea=
ch page as required.
>   */
> -static void get_offline_queue(struct xe_device *xe)
> +void xe_ras_get_offline_queue(struct xe_device *xe)

[Severity: Medium]
Should process_offline_pages() check the return value of
handle_page_offline() and wedge the device on failure?

Previously get_offline_queue() only ran during xe_ras_init() at probe time,
before VRAM BOs were allocated.  Calling xe_ras_get_offline_queue() at
runtime means a queued address can belong to an active kernel BO or pinned
user BO, causing handle_page_offline() to return -EIO before notifying
firmware:

drivers/gpu/drm/xe/xe_ras.c:process_offline_pages() {
    ...
		for (i =3D 0; i < common->pages_returned && i < XE_RAS_NUM_PAGES; i++) {
			handle_page_offline(xe, common->page_addresses[i], notify_fw);
    ...
}

Unlike handle_device_memory_errors(), which calls
xe_wedge_declare(xe, DRM_WEDGE_RECOVERY_BUS_RESET) when
handle_page_offline() fails, process_offline_pages() drops the error and
leaves the device running with a poisoned BO while the page remains in the
firmware queue.

[ ... ]

> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event.c b/drivers/gpu/drm/xe/x=
e_sysctrl_event.c
> index 3239c110a66a7..fed85e4fee6d0 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_event.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_event.c
> @@ -37,11 +37,17 @@ static void get_pending_event(struct xe_sysctrl *sc, =
struct xe_sysctrl_mailbox_c
>  			return;
>  		}
> =20
> -		if (response->event =3D=3D XE_SYSCTRL_EVENT_THRESHOLD_CROSSED)
> +		switch (response->event) {
> +		case XE_SYSCTRL_EVENT_THRESHOLD_CROSSED:
>  			xe_ras_counter_threshold_crossed(xe, response);
> -		else
> +			break;
> +		case XE_SYSCTRL_EVENT_PAGE_OFFLINE_QUEUE_FULL:
> +			xe_ras_get_offline_queue(xe);
> +			break;

[Severity: Medium]
Can xe_ras_get_offline_queue() leak XArray nodes in
xe->ras.state.offlined_pages during device teardown?

In xe_device_probe(), xe_sysctrl_init() registers sysctrl_fini() before
xe_ras_init() registers ras_fini(), so devres teardown runs ras_fini()
before sysctrl_fini() disables sc->work:

CPU0 (devres release)             CPU1 (sc->work)
irq_uninstall()
ras_fini()
  xa_destroy(&state->offlined_pages)
                                  xe_sysctrl_work()
                                    ...
                                      xe_ras_get_offline_queue()
                                        ...
                                          send_page_offline_cmd()
                                            xa_store(&state->offlined_pages=
, ...)
                                              <-- allocates into destroyed =
XArray
sysctrl_fini()
  disable_work_sync(&sc->work)

Any XArray nodes allocated by xa_store() in that window are leaked because
ras_fini() has already completed.

[Severity: Medium]
What serializes handle_page_offline() when sc->work and tile->hw_error_work
process the same page address concurrently?

get_pending_event() runs from sc->work under sc->event_lock, while
tile->hw_error_work calls xe_ras_process_errors() ->
handle_device_memory_errors() -> handle_page_offline() without holding
sc->event_lock or any RAS page-offlining lock:

CPU0 (sc->work)                   CPU1 (tile->hw_error_work)
xe_ras_get_offline_queue()        handle_device_memory_errors()
  ...                               handle_page_offline(xe, addr, true)
    handle_page_offline(xe, addr, true)
      xe_ttm_vram_handle_addr_fault()
        -> -EEXIST
                                      xe_ttm_vram_handle_addr_fault()
                                        -> -EEXIST
      xa_load(&state->offlined_pages)
        -> NULL
                                      xa_load(&state->offlined_pages)
                                        -> NULL
      send_page_offline_cmd(..., OFFLINE)
                                      send_page_offline_cmd(..., OFFLINE)
                                        <-- duplicate OFFLINE command

Because xe_ttm_vram_handle_addr_fault() drops vram_mgr->lock before
handle_page_offline() checks state->offlined_pages and send_page_offline_cm=
d()
only records XE_RAS_PAGE_OFFLINED after the mailbox command completes, both
workers can send XE_RAS_PAGE_ACTION_OFFLINE for the same page (or a second
occurrence can send XE_RAS_PAGE_ACTION_OFFLINE before the first occurrence
finishes xe_ttm_vram_purge_page() and sends XE_RAS_PAGE_ACTION_REMOVE). If
firmware rejects the duplicate or out-of-order command,
handle_device_memory_errors() wedges the device with
DRM_WEDGE_RECOVERY_BUS_RESET.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124134323.1529=
876-2-riana.tauro@intel.com?part=3D1
