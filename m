Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6DEDC982D8
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 13:41:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98BB210E8C9;
	Fri, 18 Sep 2026 13:41:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LFkID4O+";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01C9810E8C9
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Sep 2026 13:41:13 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 3A692601EF;
 Fri, 18 Sep 2026 13:41:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAEFC1F000FF;
 Fri, 18 Sep 2026 13:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789738872;
 bh=pqHaC7Nn5GDiY6xlvevtxRnv2t2YuJr5PGeIntFRxYg=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=LFkID4O+D1qPs41qzgExcMi+GbKEmC3hDOJ+/sujHOVKUamChf8FnyBYU78kzJ3BO
 0Rx16uM6mTSb402fW3ec9REqLGlPXjcD9lIUrTwzIKnWeAYuVJtUjAX5Av2vJlYATh
 Ys0Wm82abGfH2CzAJ5pl3yj4EhowubbHg0Vng/7h1yMhpQzT78CYg47YWWqz6smt0d
 c7gFkPsC+ySouutq+POBfO2+Ynt17qIEYPKeLitaM0MJbLUGFc46fVXzUNjl/ACnv4
 oP0dXym9Do4/6gkNuJnB98WEWVOQKpS/tADRjmRtkpZf7FscelHiTUfLDzApQex8Xk
 retUo5pNAFiZQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 17/20] drm/xe/vsec: Support late bind fw information
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260918131751.2408883-39-michael.j.ruhl@intel.com>
References: <20260918131751.2408883-22-michael.j.ruhl@intel.com>
 <20260918131751.2408883-39-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 13:41:12 +0000
Message-Id: <20260918134112.BAEFC1F000FF@smtp.kernel.org>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] core: async devm registration during unbind causes resource leak a=
nd UAF
- [Low] style: mixing goto-based cleanup labels with scoped_guard in same f=
unction
--

commit 07a655e6731c9aa568ad5d0e90b50bcc5c2bdb0a
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>

    drm/xe/vsec: Support late bind fw information
   =20
    CRI FW is loaded on power on.  Because of this, access to the FW cannot
    be done until it is running.
   =20
    Update the XE PMT probe and access to check for late bind devices,
    verify, and wait for the appropriate FW state before probe or access.

> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index 0f6e3be520c09..5384fef5e5ac5 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -343,6 +395,11 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, =
u64 *data, loff_t user_offse
>  		goto dev_exit;
>  	}
> =20
> +	if (!wait_for_fw(xe)) {
> +		ret =3D -ENODATA;
> +		goto runtime_exit;
> +	}
> +
>  	scoped_guard(mutex, &xe->pmt.lock) {
>  		/* set SoC re-mapper index register based on GUID memory region */
>  		xe->soc_remapper.set_telem_region(xe, mem_region);
> @@ -350,6 +407,7 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u=
64 *data, loff_t user_offse
>  		memcpy_fromio(data, telem_addr, count);
>  	}
> =20
> +runtime_exit:
>  	xe_pm_runtime_put(xe);
> =20
>  dev_exit:

[Severity: Low]
Does this code mix goto-based cleanup labels with scoped_guard in the same
function?

The cleanup subsystem guidelines explicitly state that functions should not
mix goto-based cleanup labels with scope-based cleanup declarations like
scoped_guard.

> @@ -397,6 +455,10 @@ static int xe_pmt_read_reg(struct device *dev, u32 g=
uid, u32 *reg, u32 offset)
>  	disc_addr +=3D inst + offset;
> =20
>  	xe_pm_runtime_get(xe);
> +	if (!wait_for_fw(xe)) {
> +		ret =3D -ENODATA;
> +		goto runtime_exit;
> +	}
> =20
>  	scoped_guard(mutex, &xe->pmt.lock) {
>  		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
> @@ -404,6 +466,7 @@ static int xe_pmt_read_reg(struct device *dev, u32 gu=
id, u32 *reg, u32 offset)
>  		*reg =3D readl(disc_addr);
>  	}
> =20
> +runtime_exit:
>  	xe_pm_runtime_put(xe);
> =20
>  dev_exit:

[Severity: Low]
Is it intentional to mix goto labels and scoped_guard here as well?

Using goto-based cleanup labels together with scoped_guard in the same
function is discouraged by the cleanup subsystem guidelines.

> @@ -434,6 +497,10 @@ static int xe_pmt_write_reg(struct device *dev, u32 =
guid, u32 reg, u32 offset)
>  	disc_addr +=3D inst + offset;
> =20
>  	xe_pm_runtime_get(xe);
> +	if (!wait_for_fw(xe)) {
> +		ret =3D -ENODATA;
> +		goto runtime_exit;
> +	}
> =20
>  	scoped_guard(mutex, &xe->pmt.lock) {
>  		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
> @@ -441,6 +508,7 @@ static int xe_pmt_write_reg(struct device *dev, u32 g=
uid, u32 reg, u32 offset)
>  		writel(reg, disc_addr);
>  	}
> =20
> +runtime_exit:
>  	xe_pm_runtime_put(xe);
> =20
>  dev_exit:

[Severity: Low]
Does this function also mix goto-based cleanup labels with scoped_guard?

The same cleanup subsystem guidelines apply here, which advise against mixi=
ng
goto-based cleanup labels and scope-based cleanups in a single function.

> @@ -477,12 +545,46 @@ static enum xe_vsec get_platform_info(struct xe_dev=
ice *xe)
>  	return vsec_platforms[xe->info.platform];
>  }
> =20
> +static void cri_late_bind_probe(struct xe_device *xe)
> +{
> +	struct intel_vsec_platform_info *info;
> +	struct device *dev =3D xe->drm.dev;
> +	enum xe_vsec platform;
> +
> +	platform =3D get_platform_info(xe);
> +	if (platform !=3D XE_VSEC_CRI)
> +		return;
> +
> +	info =3D &xe_vsec_info[platform];
> +	if (!info->headers)
> +		return;
> +
> +	guard(mutex)(&xe->pmt.lock);
> +
> +	info->priv_data =3D &xe_cri_pmt_cb;
> +	xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
> +
> +	intel_vsec_register(dev, info);
> +}

[ ... ]

> @@ -504,12 +606,26 @@ void xe_vsec_init(struct xe_device *xe)
> =20
>  	case XE_VSEC_CRI:
>  		xe->pmt.base_offset =3D CRI_PMT_OFFSET;
> +
> +		xe->pmt.retry_count =3D 0;
> +		INIT_DELAYED_WORK(&xe->pmt.work, cri_late_bind_probe_work);
> +
> +		xe_pm_runtime_get_noresume(xe);
> +		if (!xe_sysctrl_is_oobmsm_fw_ready(xe)) {
> +			schedule_delayed_work(&xe->pmt.work,
> +					      msecs_to_jiffies(VSEC_LATE_BIND_DELAY_MSEC));
> +			return devm_add_action_or_reset(xe->drm.dev,
> +							vsec_disable_late_bind_work,
> +							xe);
> +		}
> +

[Severity: High]
Does this setup cause an async devm registration during unbind, leading to a
resource leak and Use-After-Free?

During driver unbind, devres_release_all() splices the dev->devres_head list
to a local todo list. It then executes vsec_disable_late_bind_work(), which
waits for the cri_late_bind_probe_work() thread to complete.

Concurrently, that worker thread calls cri_late_bind_probe(), which calls
intel_vsec_register(), adding a new devm action to the now-empty
dev->devres_head list.

Once the worker completes, vsec_disable_late_bind_work() unblocks and
devres_release_all() finishes its local list. The newly added devm action on
dev->devres_head is never checked or executed, leaving the auxiliary device
leaked and its sysfs nodes pointing to a freed parent.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918131751.2408=
883-22-michael.j.ruhl@intel.com?part=3D17
