Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F62606A328
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 00:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nmClNNXP
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 433FF10E311;
	Thu,  5 Nov 2026 00:44:36 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DCCE10E311
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Nov 2026 00:44:31 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id AC66141FEA;
 Thu,  5 Nov 2026 00:44:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A6C21F000C1;
 Thu,  5 Nov 2026 00:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793839470;
 bh=7/1y5wI9HKFPqn2EYQXR9FV4ekr0F60HCVgBMOQRg6I=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=nmClNNXP2KtdYaziF7SoEPivL1xUHfbSpkDa9pr5j+T2mu1r08Z5JpiUygU3JZWXD
 mfJJmj6XB6wEJ6imuDPStm50tL6zCvvoC7+l+0487AZ0mIbm6aSrM1Ztly74ol/Wg/
 q3Nf7Pao2MQhS0vWNHZXN9yhKIdhwK1dGC1mh5976GThskODEYUKPSVP4a39nmv+tH
 QyKJ7td2G5dF35fawnNb0z7RD1tKTaZPoHzdvrDo2xa+RhkHOXn0CZLJ3+uBFK6lgo
 WRQ0lAI5jt3ICTvDswyg20GLjUsjc1ow6cwukSzdOfedh3S3tEmc4dOkbEnon0M3rT
 MeAUoTQCgefdg==
Message-ID: <sashiko-outbox-198369@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/7] drm/xe/oa: Skip OA HW teardown on a wedged device
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261105001559.3288915-13-umesh.nerlige.ramappa@intel.com>
References: <20261105001559.3288915-9-umesh.nerlige.ramappa@intel.com>
 <20261105001559.3288915-13-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 00:44:29 +0000
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

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] drm/xe/oa: active hrtimer freed in xe_oa_destroy_locked() when=
 wedged
--

commit c641d0f6b741ae6f9b164a82fa739d83e4b9de65
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

drm/xe/oa: Skip OA HW teardown on a wedged device

This commit skips OA hardware disable and teardown operations when closing =
an
OA stream on a wedged device to avoid MMIO waits, batch submissions, and
forcewake hardware accesses on an unresponsive or disabled device.

> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index fabbbcf16f4ef..7552ace821caf 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c

[ ... ]

> @@ -1705,7 +1712,8 @@ static void xe_oa_destroy_locked(struct xe_oa_strea=
m *stream)
>  {
>  	xe_pm_runtime_get(gt_to_xe(stream->gt));
> =20
> -	if (stream->enabled)
> +	/* A wedged device may be unresponsive, skip HW access */
> +	if (stream->enabled && !xe_wedged(gt_to_xe(stream->gt)))
>  		xe_oa_disable_locked(stream);

[Severity: Critical]
When an enabled sampling OA stream (where stream->sample is true) is closed
after the device becomes wedged, does skipping xe_oa_disable_locked(stream)
here leave stream->poll_check_timer armed while the stream and its OA buffer
are freed?

When a sampling stream is enabled via
xe_oa_enable_locked() -> xe_oa_stream_enable(), it starts
stream->poll_check_timer. The only place that cancels this timer is
xe_oa_stream_disable(), which is called from xe_oa_disable_locked():

drivers/gpu/drm/xe/xe_oa.c:xe_oa_stream_disable() {
	xe_oa_disable(stream);

	if (stream->sample)
		hrtimer_cancel(&stream->poll_check_timer);
	...
}

When xe_wedged() is true, xe_oa_destroy_locked() now skips
xe_oa_disable_locked() and proceeds directly to:

xe_oa_destroy_locked()
  -> xe_oa_stream_destroy()
    -> xe_oa_stream_free_resources()
      -> xe_oa_free_oa_buffer()
  -> kfree(stream)

This frees the active hrtimer and unpins and frees stream->oa_buffer.bo
while stream->poll_check_timer is still queued. When
xe_oa_poll_check_timer_cb() next fires, it will dereference the freed stream
and stream->oa_buffer.bo, read MMIO on the wedged device via
xe_oa_hw_tail_read(), and re-arm itself with HRTIMER_RESTART:

drivers/gpu/drm/xe/xe_oa.c:xe_oa_poll_check_timer_cb() {
	struct xe_oa_stream *stream =3D
		container_of(hrtimer, typeof(*stream), poll_check_timer);

	if (xe_oa_buffer_check_unlocked(stream))
		wake_up(&stream->poll_wq);

	hrtimer_forward_now(hrtimer, ns_to_ktime(stream->poll_period_ns));

	return HRTIMER_RESTART;
}

Even with the subsequent patch in this series that handles device unplug in
xe_oa_release(), closing an OA stream fd on a wedged device that has not
been unplugged still enters the drm_dev_enter() branch in xe_oa_release()
and calls xe_oa_destroy_locked().

Should stream->poll_check_timer still be cancelled when stream->enabled and
stream->sample are true, even when the hardware disable in xe_oa_disable()
is skipped for a wedged device?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105001559.3288=
915-9-umesh.nerlige.ramappa@intel.com?part=3D4
