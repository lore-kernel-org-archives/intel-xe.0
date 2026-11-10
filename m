Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCB7606A331
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 19:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f6sYYyW4
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9185710E082;
	Tue, 10 Nov 2026 19:17:30 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77E6C10E082
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Nov 2026 19:17:24 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 5A5F860F27;
 Tue, 10 Nov 2026 19:17:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5EAE1F0089F;
 Tue, 10 Nov 2026 19:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794338243;
 bh=Esn7sThHEtXL50uj08YbGpWvxfX5+xh3YRchWRAwNGY=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=f6sYYyW4chyvLa9vEXaichxdKXJOi/Fr2IxsHTSN65p8XHhZSMXNR5skeuf27kM3f
 2LBZfWkgCIM5jymBGdvlGEX4h33Lgy198pt3eKjSqab5KGKCk3SIIg7UYDfOPV5CRL
 DuPBvlHf4xWy2AXpGvIoCqH07lAEzvN0eiQ7AHvEfXoY8EAcuBSahA5lyKGlwizeCn
 WAeOM6bP4E5uNpvEIQJ0NJZvv2XpfWHxBg6viZvOOoceOomOlC3OjkjYiOt+o7L1eu
 9K+mEe25Emd8yT3OXC9RWGTbOiveqdPiBHrPB3l59Lg/Xal+PXohPKpVs+4k1ipQZm
 KdXf7IZT63x4A==
Message-ID: <sashiko-outbox-207649@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/7] drm/xe/oa: Skip OA HW teardown on a wedged device
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261110190052.3514226-13-umesh.nerlige.ramappa@intel.com>
References: <20261110190052.3514226-9-umesh.nerlige.ramappa@intel.com>
 <20261110190052.3514226-13-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 19:17:22 +0000
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
- [High] drm/xe/oa: build failure from non-existent xe_wedge.h and
  xe_wedged()
--

commit cfe215fb928c6338b6dd8582d19a4f894fb6bd7d
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

drm/xe/oa: Skip OA HW teardown on a wedged device

This commit skips OA stream disabling and hardware teardown when destroying
an OA stream on a wedged device, and ensures the poll timer is unconditiona=
lly
canceled in xe_oa_stream_destroy().

> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index df9a3ea0875d1..6383a2e036ab0 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -43,6 +43,7 @@
>  #include "xe_sriov.h"
>  #include "xe_sync.h"
>  #include "xe_wa.h"
> +#include "xe_wedge.h"

[ ... ]

> @@ -905,7 +911,12 @@ static void xe_oa_stream_destroy(struct xe_oa_stream=
 *stream)
> =20
>  	mutex_destroy(&stream->stream_lock);
> =20
> -	xe_oa_stream_hw_teardown(stream);
> +	/* The poll timer may still be armed if the OA disable was skipped */
> +	hrtimer_cancel(&stream->poll_check_timer);
> +
> +	if (!xe_wedged(stream->oa->xe))
> +		xe_oa_stream_hw_teardown(stream);
> +
>  	xe_oa_free_oa_buffer(stream);
>  	xe_oa_stream_free_resources(stream);
>  }
> @@ -1704,7 +1715,8 @@ static void xe_oa_destroy_locked(struct xe_oa_strea=
m *stream)
>  {
>  	xe_pm_runtime_get(gt_to_xe(stream->gt));
> =20
> -	if (stream->enabled)
> +	/* A wedged device may be unresponsive, skip HW access */
> +	if (stream->enabled && !xe_wedged(gt_to_xe(stream->gt)))
>  		xe_oa_disable_locked(stream);

[Severity: High]
Does this break the build?  Neither xe_wedge.h nor xe_wedged() exists in the
tree.  The helper for checking whether an xe_device is wedged is
xe_device_wedged() in drivers/gpu/drm/xe/xe_device.h, which xe_oa.c already
includes.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110190052.3514=
226-9-umesh.nerlige.ramappa@intel.com?part=3D4
