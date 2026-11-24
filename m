Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6EA606A682
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 06:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KwtKWv2K
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6291B10E337;
	Tue, 24 Nov 2026 06:12:47 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7AA110E337
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 06:12:40 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 006A860A9B;
 Tue, 24 Nov 2026 06:12:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99F9D1F000C0;
 Tue, 24 Nov 2026 06:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795500759;
 bh=InKtT6Mm5P9gir2axHvUgfRm0TpZ7NSI1EPWfju9B6U=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=KwtKWv2K4Ejla7YzL0IsPSx9hga4c2IIseU9iJ42iAMiSc6XCoFvmfqEqh5xUWHSQ
 /mYx6CQJ1GwRDuqEyDuxqU3JSkPY43pqdCLy59wlAR63CpBqbQeOtIybpJnchq1TDF
 6Q48W1SEbUc0020XoqR56QdePmjyAfsZRlVFgs6KBq0XwLKv3Qcp2koWJBYZN3jyMf
 WPvxedwPo+Ur0DHDtVH3S1rbGx0juNAs2c9LSwRd2yr0aOSgA1AiQ6MTclkSz5Pxui
 /YW3R9xD/1mRrwYMAUfbITYWRAntG4FeI9lb08JVTX07vcdet0flABY7ozTztSsnNK
 2ZbmLE82OXjsw==
Message-ID: <sashiko-outbox-230579@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] drm/xe/xe_ras: Skip gpu_health sysfs commands when
 wedged
To: "Ravi Kishore Koppuravuri" <ravi.kishore.koppuravuri@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261124060407.1973645-1-ravi.kishore.koppuravuri@intel.com>
References: <20261123065719.1782607-1-ravi.kishore.koppuravuri@intel.com>
 <20261124060407.1973645-1-ravi.kishore.koppuravuri@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 06:12:39 +0000
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
- [High] drm/xe: undeclared xe_wedge_mode_is_no_reset() breaks build in
  xe_ras.c
--

commit 97ae0e7219ad0cf2ac082e8167bb0a134f624b31
Author: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>

drm/xe/xe_ras: Skip gpu_health sysfs commands when wedged

This commit skips system controller health commands in gpu_health_show()
and gpu_health_store() when the device is wedged and not in no-reset mode.

> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 0fb891d00b36a..978dbaa82fe2c 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -1134,6 +1134,9 @@ static ssize_t gpu_health_show(struct device *dev, =
struct device_attribute *attr
>  	size_t rlen;
>  	int ret;
> =20
> +	if (xe_wedged(xe) && !xe_wedge_mode_is_no_reset(xe))
> +		return -ECANCELED;
> +
>  	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_C=
MD_GET_HEALTH,
>  				  &request, sizeof(request), &response, sizeof(response));
>  	guard(xe_pm_runtime)(xe);
> @@ -1177,6 +1180,9 @@ static ssize_t gpu_health_store(struct device *dev,=
 struct device_attribute *att
>  	if (state < 0)
>  		return -EINVAL;
> =20
> +	if (xe_wedged(xe) && !xe_wedge_mode_is_no_reset(xe))
> +		return -ECANCELED;
> +
>  	request.health =3D state;
> =20
>  	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_C=
MD_SET_HEALTH,

[Severity: High]
Does calling xe_wedge_mode_is_no_reset() here break the build?

xe_wedge_mode_is_no_reset() is neither declared nor defined anywhere in
the tree, so compiling drivers/gpu/drm/xe/xe_ras.c fails with an implicit
function declaration error.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124060407.1973=
645-1-ravi.kishore.koppuravuri@intel.com?part=3D1
