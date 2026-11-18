Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BF9606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 15:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=duk8YXAz
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E793F10FE04;
	Wed, 18 Nov 2026 15:44:12 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1846310E7DF
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 15:44:06 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id DC8C840671;
 Wed, 18 Nov 2026 15:44:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F56A1F000CB;
 Wed, 18 Nov 2026 15:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795016645;
 bh=S9r67wAy91UpbSpn0XveMVJdKRs8Bji4HqL6b07fZkE=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=duk8YXAzZBLfrl2Ap1ULYBFmBksU2tS4zWXX3YC3UDyZlj/EsZP4x2HV0x/vgIMMM
 ML1bMxHc2EE/2ezTcGxUdeCcqKEnQ28tsKx6Sn5RdoEZekFY+N/rgXLIutJKZm4FxY
 rfJ+1vEUkbEbY8X2A+LrKuk/ifu4EhJsRj8ZBaPTpy5iFQrn/z6P58yt9Nr53aQnH0
 T50dhB4qQsSpm4RJGHlwiBW18R7mOaGt9BtP5gnSNiI7uO2h5frI0pgk4Wr9jvrscP
 TXiL5S27qQvgqQTMbUi20gxtqLEYO4RhYAkmD+DfZ5H5LXbv1aW5FBXAzDDJHIvSbZ
 lMiiBmVmaApQw==
Message-ID: <sashiko-outbox-221366@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] drm/xe/wedge: Introduce xe_wedge_mode_is_no_reset()
To: "Raag Jadav" <raag.jadav@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261118153154.2024753-3-raag.jadav@intel.com>
References: <20261118153154.2024753-1-raag.jadav@intel.com>
 <20261118153154.2024753-3-raag.jadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 15:44:05 +0000
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
- [High] drm/xe/wedge: wedge_validate_mode() checks current mode instead
  of argument
--

commit f022abe900ad7539f9a5e02a0f8c440d6603b312
Author: Raag Jadav <raag.jadav@intel.com>

drm/xe/wedge: Introduce xe_wedge_mode_is_no_reset()

This commit introduces a helper xe_wedge_mode_is_no_reset() and replaces
open-coded XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET checks across the xe
driver.

> diff --git a/drivers/gpu/drm/xe/xe_wedge.c b/drivers/gpu/drm/xe/xe_wedge.c
> index 827fae058976a..3b4c8bee67972 100644
> --- a/drivers/gpu/drm/xe/xe_wedge.c
> +++ b/drivers/gpu/drm/xe/xe_wedge.c

[ ... ]

> @@ -184,7 +184,7 @@ static int wedge_validate_mode(struct xe_device *xe, =
unsigned int mode)
>  	if (mode > XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET) {
>  		xe_dbg(xe, "wedged_mode: invalid value (%u)\n", mode);
>  		return -EINVAL;
> -	} else if (mode =3D=3D XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET && (IS_SRI=
OV_VF(xe) ||
> +	} else if (xe_wedge_mode_is_no_reset(xe) && (IS_SRIOV_VF(xe) ||
>  		   (IS_SRIOV_PF(xe) && !IS_ENABLED(CONFIG_DRM_XE_DEBUG)))) {
>  		xe_dbg(xe, "wedged_mode: (%u) %s mode is not supported for %s\n",
>  		       mode, wedge_mode_to_string(mode),

[Severity: High]
Does wedge_validate_mode() check the current xe->wedged.mode via
xe_wedge_mode_is_no_reset(xe) instead of the candidate mode argument?

Because xe_wedge_init() and xe_wedge_set_mode() call wedge_validate_mode()
before updating xe->wedged.mode, setting wedged_mode to
XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET bypasses the SR-IOV check.  On an
SR-IOV VF, writing 2 to the wedged_mode debugfs file then proceeds into
wedge_mode_set_reset_policy() -> xe_guc_ads_scheduler_policy_toggle_reset()
and dereferences a NULL ads->bo pointer.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118153154.2024=
753-1-raag.jadav@intel.com?part=3D2
