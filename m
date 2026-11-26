Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28169606A321
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 10:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dEt/eVC0
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C13921122AC;
	Thu, 26 Nov 2026 10:08:36 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7BD9112286
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Nov 2026 10:08:26 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 87A4C44160;
 Thu, 26 Nov 2026 10:08:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 337C71F000ED;
 Thu, 26 Nov 2026 10:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795687706;
 bh=9OxnSTixkBNpJf78vAdvG7wQAB2TrpitPyFdnU0q8dU=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=dEt/eVC0BcS7HFoiVhWAum9HIRyKaNe6hSFiIJYYrXBF6nuQc6pDa+mpc/b/UeEvt
 vf5BD5XlrYR2CCYMWhKgRaKl+W6ZvdTV5vVwA8u1hDQCfyLnUNcdJqAVvBs9KB2plA
 TwfJNaYu8TQZTJMT+YGUv4Z3ZXWp5IAr2Ng40H30Q5UhTfRDw/bWkby6Ba1I/MiiD2
 Vmpi5+CvxHP4Jrzuwe2pbdS0Ge6PJEg6h0GI+2T1xWLFfhqvjyFVS7GHSagl+BWP/w
 ROWjTgKWrKV9xPtspOGdrqIG7Or5kPGiqEUvDhI+YsqgAFw2CYM1Rc1ibhVaxoR0FF
 cJ6Hn/z/T0BDA==
Message-ID: <sashiko-outbox-235246@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] drm/xe/ras: Wedge device if page offline list is
 full at probe
To: "Soham Purkait" <soham.purkait@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261126094140.2102442-6-soham.purkait@intel.com>
References: <20261126094140.2102442-4-soham.purkait@intel.com>
 <20261126094140.2102442-6-soham.purkait@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 10:08:25 +0000
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

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] drm/xe/ras: early xe_wedge_declare() in process_offline_pages()
  breaks probe
- [Medium] drm/xe/ras: process_offline_pages() ignores
  disable_vram_page_offline
--

commit 111befac525523d3b152a055372e4da13c8a7854
Author: Soham Purkait <soham.purkait@intel.com>

drm/xe/ras: Wedge device if page offline list is full at probe

This commit declares the device wedged during probe if the firmware page
offline list has reached its maximum capacity.

> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 53fd6dcf8ee1c..1607550e98893 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -487,6 +487,11 @@ static void process_offline_pages(struct xe_device *=
xe, u32 cmd, void *req, size
>  			return;
>  		}
>  	} while (common->additional_data);
> +
> +	if (!xe_wedged(xe) && list_req && state->max_pages && total_pages >=3D =
state->max_pages) {
> +		xe_err(xe, "[RAS]: page offline list is full\n");
> +		xe_wedge_declare(xe, 0);
> +	}
>  }
> =20
>  /*

[Severity: High]
Does calling xe_wedge_declare() here during xe_ras_init() cause
xe_device_probe() to fail and drop the wedged uevent instead of keeping
the device bound in a wedged state?

In xe_device_probe(), xe_ras_init() runs before xe_gt_init() and
drm_dev_register().  xe_wedge_declare() sets xe->wedged.perm =3D 1, so when
xe_gt_init() subsequently runs xe_uc_load_hw() ->
xe_gt_record_default_lrcs(), __guc_ct_send_locked() rejects all CT
messages with -ENOTRECOVERABLE:

drivers/gpu/drm/xe/xe_guc_ct.c:__guc_ct_send_locked() {
	...
	if (xe_wedged_permanent(ct_to_xe(ct))) {
		ret =3D -ENOTRECOVERABLE;
		goto out;
	}

emit_wa_job() then times out waiting on the dropped submission and aborts
xe_device_probe().  In addition, xe_wedge_declare() schedules
wedge_work() to emit drm_dev_wedged_event() before drm_dev_register() has
registered dev->primary->kdev, so kobject_uevent_env() drops the wedged
uevent.

[Severity: Medium]
Should this check also verify !xe_ras_get_disable_vram_page_offline(xe)
before wedging the device?

xe_ras_init() reads state->disable_vram_page_offline from configfs before
calling get_offline_list().  When an administrator disables VRAM page
offlining via configfs so errors are only logged and removed from the
firmware queue in handle_page_offline(), process_offline_pages() still
wedges the device at probe if the firmware offline list is already full.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126094140.2102=
442-4-soham.purkait@intel.com?part=3D2
