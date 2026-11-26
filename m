Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B698606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 08:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RluGOgy2
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1653811219F;
	Thu, 26 Nov 2026 08:47:26 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E54110E8CD
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Nov 2026 08:46:58 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 95293624E6;
 Thu, 26 Nov 2026 08:46:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33D511F000D3;
 Thu, 26 Nov 2026 08:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795682817;
 bh=LihxSYl6ssMFkqBwvU1V1LlvOET5TitZROoJD8TSoks=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=RluGOgy26w+fjEAmvEPeYDPMv0EavVm/aItgw4KOACqyf7FVajWh5YLWEDXm29tIp
 bOL9akeQEWDP9/UVAElUbsOaxgzJZh4aSOr2qwJlL9/QC7ea76KPm3pzqXZFmr1a4a
 4y1vdBA06fHSkstpUdCy/vx5xp3ctqO/gzWHMgxBKInazN2FyL4ZZiG5Ja8pXWGqUI
 kBYNxw31V+cPSblpXdBdDwhH3n5cj7DM09lPPhXAm/UhqebzsYat513aO2pBhZjy/t
 f7ESIF4kYGfpyHY604nTzTcnmvdavETtiytEx0slzuBZ3rhfXTGN/P3cbUIG9R3vXF
 1fCcPTCXmuiJQ==
Message-ID: <sashiko-outbox-235054@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/3] drm/xe/ras: Skip offline queue processing after
 device unplug
To: "Riana Tauro" <riana.tauro@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261126083516.1932195-8-riana.tauro@intel.com>
References: <20261126083516.1932195-5-riana.tauro@intel.com>
 <20261126083516.1932195-8-riana.tauro@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 08:46:56 +0000
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] drm/xe/ras: race with ras_fini() in
  xe_ras_get_offline_queue() on probe error
--

commit 34b9c8950fa648b356e8d2444006f4d6fdb7ac18
Author: Riana Tauro <riana.tauro@intel.com>

drm/xe/ras: Skip offline queue processing after device unplug

This commit wraps xe_ras_get_offline_queue() in drm_dev_enter() and
drm_dev_exit() to prevent the system controller worker from accessing the
offlined pages XArray after ras_fini() runs on device unplug.

> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index e080cbebbdbeb..89c2385eabf7c 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
[ ... ]
> @@ -486,9 +488,16 @@ static void process_offline_pages(struct xe_device *=
xe, u32 cmd, void *req, size
>  void xe_ras_get_offline_queue(struct xe_device *xe)
>  {
>  	struct xe_ras_offline_common response =3D {0};
> +	int idx;
> +
> +	/* Unplug waits for this section, so nothing runs after ras_fini() */
> +	if (!drm_dev_enter(&xe->drm, &idx))
> +		return;
> =20
>  	process_offline_pages(xe, XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE, NULL, 0, &r=
esponse,
>  			      sizeof(response), &response, true);
> +
> +	drm_dev_exit(idx);
>  }

[Severity: Medium]
Can xe_ras_get_offline_queue() still race with ras_fini() and use
xe->ras.state.lock and xe->ras.state.offlined_pages after they are
destroyed when xe_device_probe() fails?

In xe_device_probe(), xe_sysctrl_init() and xe_ras_init() register their
devm teardown actions in that order, and then xe_irq_install() enables
interrupts (including SYSCTRL_IRQ, which schedules xe->sc.work) before the
remaining fallible probe steps such as xe_gt_init().  If any of those
later steps fails, xe_device_probe() unwinds without calling
drm_dev_unplug() (even the err_unregister_display path only calls
drm_dev_unregister()), so xe->drm.unplugged remains false when devres
releases resources in reverse order:

CPU0 (probe error unwind)         CPU1 (kworker)
devres_release_all()
  ras_fini()
    xa_destroy(&state->offlined_pages)
  devm_mutex_release(&state->lock)
                                  xe_sysctrl_work()
                                    ...
                                      xe_ras_get_offline_queue()
                                        drm_dev_enter() -> true
                                        process_offline_pages()
                                          handle_page_offline()
                                            mutex_lock(&state->lock)
                                            xa_store(&state->offlined_pages)
                                              <-- use-after-destroy
  sysctrl_fini()
    disable_work_sync(&sc->work)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126083516.1932=
195-5-riana.tauro@intel.com?part=3D3
