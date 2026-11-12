Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B031606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 06:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KAlFcB21
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A7C510EA5F;
	Thu, 12 Nov 2026 06:29:51 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C12010EA5F
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Nov 2026 06:29:45 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id BD94A45AAF;
 Thu, 12 Nov 2026 06:29:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75B181F00A05;
 Thu, 12 Nov 2026 06:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794464984;
 bh=7GpnmZOW8o5AnQv+z1H0AkDNwQ6NPLmpkPuTb1DPYNA=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=KAlFcB21AJTYTHEV7mG7rcyzD6DxA/ZYm6swESc/Jo2dOcy/ov9yo7abN23F87FdK
 YEJ+Wp0KLXqXlrDTHqYdf2C7Fd7A8vGjKsHHE3xJVS8trw0tjLElZFSZP9E9kbDrr8
 bnDQlTkf1z0HNmcrbZP512iOCtBHYkKvk9V2uruz56DGHePlHeaIdpgejYvnqK5D07
 yjxE7cSHeifE88/b1vaOhK0SX8fjZFLZvj53BHjnpTed3spKXaTQ887W49xSJqstVp
 AbcW/ZKayFakfMviN1ZpiPZKZQ9zZMAgquuoAe8fRfb8d4Ui8xP9alRc5GsqoAXyNc
 Xjlsv0/sh1cug==
Message-ID: <sashiko-outbox-210526@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/8] drm/xe/hw_error: Initialize hw_error_work per tile
To: "Riana Tauro" <riana.tauro@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261112060701.3327125-12-riana.tauro@intel.com>
References: <20261112060701.3327125-10-riana.tauro@intel.com>
 <20261112060701.3327125-12-riana.tauro@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 06:29:43 +0000
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
- [Medium] drm/xe/hw_error: check devm_add_action_or_reset() in
  xe_hw_error_init()
--

commit 507eb21a794f9cbaaf41a0422e6f54d0d752cfac
Author: Raag Jadav <raag.jadav@intel.com>

drm/xe/hw_error: Initialize hw_error_work per tile

This commit initializes tile->hw_error_work across all tiles instead of
only the root tile and registers a devm action to disable the work items on
teardown.

> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_=
error.c
> index a934b649575c7..ef41bd24ece0c 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.c
> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
> @@ -537,6 +537,16 @@ static void process_hw_errors(struct xe_device *xe)
>  	}
>  }
> =20
> +static void hw_error_fini(void *arg)
> +{
> +	struct xe_device *xe =3D arg;
> +	struct xe_tile *tile;
> +	u8 id;
> +
> +	for_each_tile(tile, xe, id)
> +		disable_work_sync(&tile->hw_error_work);
> +}
> +
>  /**
>   * xe_hw_error_init - Initialize hw errors
>   * @xe: xe device instance
> @@ -546,12 +556,15 @@ static void process_hw_errors(struct xe_device *xe)
>   */
>  void xe_hw_error_init(struct xe_device *xe)
>  {
> -	struct xe_tile *tile =3D xe_device_get_root_tile(xe);
> +	struct xe_tile *tile;
> +	u8 id;
> =20
>  	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
>  		return;
> =20
> -	INIT_WORK(&tile->hw_error_work, hw_error_work);
> +	for_each_tile(tile, xe, id)
> +		INIT_WORK(&tile->hw_error_work, hw_error_work);
> =20
>  	process_hw_errors(xe);
> +	devm_add_action_or_reset(xe->drm.dev, hw_error_fini, xe);
>  }

[Severity: Medium]
As reported by Andi Shyti on v2 [1], should xe_hw_error_init() return int
and propagate the return value of devm_add_action_or_reset() to
xe_irq_install()?

If devm_add_action_or_reset() fails with -ENOMEM, it immediately invokes
hw_error_fini(), which calls disable_work_sync() on every
tile->hw_error_work.  Because the error is ignored, driver probe succeeds
with all per-tile hw_error_work items permanently disabled, so subsequent
hardware error interrupts calling schedule_work(&tile->hw_error_work) will
silently fail to queue hw_error_work().

[1] https://lore.kernel.org/r/auIW6DsRRyZ0GWnz@zenone.zhora.eu

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112060701.3327=
125-10-riana.tauro@intel.com?part=3D2
