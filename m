Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B06DCC6B19
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 06:13:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB11410E3F5;
	Wed, 14 Oct 2026 06:13:45 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2375610E444
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Oct 2026 06:13:40 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 6FF1F60213;
 Wed, 14 Oct 2026 06:13:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09A511F000FF;
 Wed, 14 Oct 2026 06:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791958419;
 bh=Mx9tA7v4CithGRRQiYu07VIuWyaqV5Bw6A1SsVEUXm4=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=RpKUBIvfm/uxs71zh7VMmJ8rlcxRcRZN1qZSfrighOHWo6gB03+MikZUkpf37h82Y
 eUc87MRQRiL55UhahOr38JxGG9/QFkSoiLMwNI1j1kj5gFd1t7T2C5/qQoFG3TZ1zM
 cRZhpba8TdhnYRmO4BcwLIjW5U286XwScstHKugK10PSQgkwp3sy65bQa/MLgQ0HNt
 hkELiFTofE2lvk3FUyQDNu1L5LddGP2rOfUF8K39v9CpPAH61mRaHBLhbVmS2pFNKI
 Gax4l2FfG1M9xwa0o/7/BYI5+do2CvYi3JJm5sY9DeaSl5KuU3g2FaQvK6lKG50gbx
 Sn9uCeTAGBqIQ==
Message-ID: <sashiko-outbox-170854@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 4/7] drm/xe: Make xe_device_declare_wedged() IRQ safe
To: "Raag Jadav" <raag.jadav@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261014055215.330408-5-raag.jadav@intel.com>
References: <20261014055215.330408-1-raag.jadav@intel.com>
 <20261014055215.330408-5-raag.jadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 06:13:38 +0000
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

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] pm: MMIO access on suspended device during async wedge
--

commit bce18d1215504bf5f21999a5ea9ee776aca1fe38
Author: Raag Jadav <raag.jadav@intel.com>

drm/xe: Make xe_device_declare_wedged() IRQ safe

This commit defers wedge handling to a dedicated worker, allowing
xe_device_declare_wedged() to be safely called from IRQ contexts such as
handling MERT CAT errors.

> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1405,29 +1421,28 @@ void xe_device_declare_wedged(struct xe_device *x=
e, unsigned long method)
> =20
>  	if (!atomic_xchg(&xe->wedged.flag, 1)) {
>  		xe->needs_flr_on_fini =3D true;
> -		xe_pm_runtime_get_noresume(xe);
> +		pm_runtime_get_noresume(xe->drm.dev);

[Severity: High]
Does this allow MMIO access on a suspended device when a wedge is triggered
from an IRQ context?

If a hardware error (like a MERT CAT error) triggers an IRQ while the
device is in the RPM_SUSPENDED state, pm_runtime_get_noresume() will
increment the usage counter but will not wake the device up.

The GT wedge worker is then scheduled:

>  		xe_log_err_fatal(xe, WEDGED, -EIO, "Device declared wedged!\n");
>  		xe_err_once(xe, "IOCTLs and executions are now blocked!\n"
>  			    "For recovery procedure, refer to %s\n"
>  			    "Please file a _new_ bug report at %s\n",
>  			    WEDGED_URL, XE_BUG_URL);
> -	}
> =20
> -	for_each_initialized_gt(gt, xe, id)
> -		xe_gt_declare_wedged(gt);
> +		for_each_initialized_gt(gt, xe, id)
> +			xe_gt_declare_wedged(gt);

And runs asynchronously without ensuring the device is resumed:

gt_wedge_worker()
  xe_uc_declare_wedged()
    xe_guc_declare_wedged()
      xe_guc_submit_wedge()
        xe_guc_softreset()
          xe_guc_mmio_send()

Since the device might still be suspended, this sequence can result in
xe_guc_mmio_send() performing MMIO accesses on powered-down hardware,
causing invalid register reads (e.g., returning 0xffffffff), hardware
timeouts, or PCIe bus errors.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014055215.3304=
08-1-raag.jadav@intel.com?part=3D4
