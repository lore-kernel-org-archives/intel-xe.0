Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09719606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 08:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JepPVnN5
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B64031121DD;
	Thu, 26 Nov 2026 08:52:41 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB3CA11221D
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Nov 2026 08:52:35 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 8030445F27;
 Thu, 26 Nov 2026 08:52:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11AA41F000D8;
 Thu, 26 Nov 2026 08:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795683155;
 bh=EZob8tujFecS5NSgLMXh9/duvCHcJ2DoQtWP5CdWWyk=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=JepPVnN5+qPehU0LPVYRimQo0PMVNSozm2qHGl/u2abbhMlzTOyuDGcVOnslqT5eR
 Sq7uvollpQBl7Zv8mTRzakRtQzc+fpCCXIsu1BvnFTJqQWe9+1rIEMwXDb2TuI3djT
 2QfwtOqW+tEl9Gv3IeHNLorV+LYV79Cehd135IbPnt1LN0sN5uWpUUlBkDBGHnMikL
 JFJMUagHJmW0eQL9eFhZRsOg8SGWWn7/m3mBTWIJzVFcYkZ3iA9jbVez5rUKvYfidi
 P42KS8sD9zyKCmZl+IpVmsv90wQS/iACx1t6KiaS7rZqunomCgIMsFJymoAf8f5l74
 Fw9wThchb7UfQ==
Message-ID: <sashiko-outbox-235060@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] drm/xe/sysctrl: Drain page offline queue on
 queue-full event
To: "Riana Tauro" <riana.tauro@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261126083516.1932195-7-riana.tauro@intel.com>
References: <20261126083516.1932195-5-riana.tauro@intel.com>
 <20261126083516.1932195-7-riana.tauro@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 08:52:31 +0000
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
- [Low] drm/xe/sysctrl: transposed #%x format specifier in
  get_pending_event()
--

commit 05276661aef276dde9798d0d35641aafb0f1b8d7
Author: Riana Tauro <riana.tauro@intel.com>

drm/xe/sysctrl: Drain page offline queue on queue-full event

This commit handles the System Controller page offline queue full event by
draining the offline queue and serializing page offline handling with a
mutex.

> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event.c b/drivers/gpu/drm/xe/x=
e_sysctrl_event.c
> index 3239c110a66a7..b6a414bb3df73 100644
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
> +		default:
>  			xe_log_err_info(xe, SYSCTRL, -ENOPKG,
>  					"Unexpected event %#x\n", response->event);
> +		}
> =20
>  		if (!--count) {
>  			xe_log_err(xe, SYSCTRL, -EXFULL,
> @@ -49,7 +55,8 @@ static void get_pending_event(struct xe_sysctrl *sc, st=
ruct xe_sysctrl_mailbox_c
>  			return;
>  		}
> =20
> -		xe_dbg(xe, "sysctrl: %u events pending\n", response->count);
> +		xe_dbg(xe, "sysctrl: event code #%x received, %u events pending\n", re=
sponse->event,
> +		       response->count);

[Severity: Low]
Should the format specifier for response->event be "%#x" rather than
"#%x", so it prints a "0x" prefix instead of a literal "#"?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126083516.1932=
195-5-riana.tauro@intel.com?part=3D2
