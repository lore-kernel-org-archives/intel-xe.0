Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C58D606A326
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 16:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c4GyEVNg
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D588710E575;
	Thu, 19 Nov 2026 16:57:11 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25F1C10E264
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 16:57:05 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 81625637EE;
 Thu, 19 Nov 2026 16:57:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1394C1F000C4;
 Thu, 19 Nov 2026 16:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795107424;
 bh=1kMRbjEiDBHnjd78nV+6mtiB3Bw/QXTenuJkrFszfAk=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=c4GyEVNgY7dHri3LrKMONFY4MKIY6UIJ6bTVCqHJ9V33KCUIZ4yqUSU539QOxlVds
 Mz318F9tYgb6ZkXiiaJzxqtSjmR1xnPxqXABp8eR5eB3FbdNHLuAK2Mlu9AuNxS0Jl
 tgjMAVeoGVJ1mjR/10SMhoP2SCFXCUg4h//CDnHDuTbJcFKbCerdmtwA+1H1UeoSCw
 yTazfu8qyNsevkauo3c3nRxwD4CUGu0MkrjG7UETFuwDiCAtoNxZ9Q5llya8TwzcJ1
 yJan9YDsbChhgrjdrxZptonz00ShbzrA6vRyI/0H8nHN6pl6yKUOgVaQqZnAf0AN8A
 1ivatGjAfpySA==
Message-ID: <sashiko-outbox-223600@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/1] drm/xe/xe_ras: Skip gpu_health sysfs commands
 during reset or wedged
To: "Ravi Kishore Koppuravuri" <ravi.kishore.koppuravuri@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261119163913.1760721-2-ravi.kishore.koppuravuri@intel.com>
References: <20261119163913.1760721-1-ravi.kishore.koppuravuri@intel.com>
 <20261119163913.1760721-2-ravi.kishore.koppuravuri@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 16:57:03 +0000
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
- [Low] drm/xe/xe_ras: un-ratelimited xe_err() in gpu_health sysfs when
  wedged
- [Low] drm/xe/xe_ras: missing Fixes: trailer for gpu_health
  wedged/reset guard
--

commit 0948e71b1e312f40ff2a8325669e3afa172811c6
Author: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>

> drm/xe/xe_ras: Skip gpu_health sysfs commands during reset or wedged
>
> Accessing gpu_health sysfs attribute sends a command to the system
> controller. Add a guard to verify and skip if the device is wedged or in
> reset. It protects against touching the fw or device when it is not in
> usable state.
>
> Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.c=
om>

[Severity: Low]
Since this fixes accessing gpu_health while the device is wedged or in
reset, should this include a Fixes: tag?

  Fixes: 53a7115f9862 ("drm/xe/xe_ras: Add RAS GPU health indicator")

> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 2c01c183d02b1..e8e168d345532 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -1116,6 +1116,12 @@ static ssize_t gpu_health_show(struct device *dev,=
 struct device_attribute *attr
>  	size_t rlen;
>  	int ret;
> =20
> +	if (xe_wedged(xe) || xe_device_is_in_reset(xe)) {
> +		xe_err(xe, "[RAS]: GPU is wedged or in reset\n");
> +		return -ECANCELED;
> +	}
> +
> +
>  	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_C=
MD_GET_HEALTH,
>  				  &request, sizeof(request), &response, sizeof(response));
>  	guard(xe_pm_runtime)(xe);
> @@ -1159,6 +1165,11 @@ static ssize_t gpu_health_store(struct device *dev=
, struct device_attribute *att
>  	if (state < 0)
>  		return -EINVAL;
> =20
> +	if (xe_wedged(xe) || xe_device_is_in_reset(xe)) {
> +		xe_err(xe, "[RAS]: GPU is wedged or in reset\n");
> +		return -ECANCELED;
> +	}

[Severity: Low]
Should gpu_health_show() and gpu_health_store() avoid logging an
un-ratelimited xe_err() when the device is wedged or in reset?

Because gpu_health is world-readable (0644) and intended for polling by
monitoring tools, repeated reads while the GPU is wedged or resetting will
flood dmesg with error messages.  Using xe_dbg() or dropping the log line
would match other -ECANCELED wedged/reset checks in the driver.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119163913.1760=
721-1-ravi.kishore.koppuravuri@intel.com?part=3D1
