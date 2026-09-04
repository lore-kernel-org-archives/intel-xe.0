Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCBC1C624D3
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 18:56:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71A2C10E575;
	Fri,  4 Sep 2026 18:56:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cQSvEkPy";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86F9910E575
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 18:56:07 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 6762C437AD;
 Fri,  4 Sep 2026 18:56:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 276CB1F00A3D;
 Fri,  4 Sep 2026 18:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788548167;
 bh=d+h1xshdvH6gZwJVU5+QUCnKmk4vL3WGCQ9mLeAPIoQ=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=cQSvEkPyIuTMAniH2BZdVXoJxwEUljFkQ368efRNwZ76fjUqabD+yeIvmDjpgIAbb
 ARUJKuchpRVbdg08eLnw5deInBsU7E1yH3t7D56F5SDR7G0NhgOIMsvVqiVO6JAVDi
 KuMsAInnm6o+2mW61ml/+E3S3rBGm40TimR4KN5GrBUIZnnvt85kZBlQCiDNTkdEUI
 qgU6X7WtZosHpErerNTk3ZhC4ROusSykiLEPGOXqB+L+VO8SgG9vQEgNTH2ZRIcNH+
 goY221NZRq6DDMQ8NIdvCFQP6uaxT7+qXVF1ml0FBNmcJj60zy39hQH1Cn+fbai60+
 WIJvkTSoElwbw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 15/18] drm/xe/vsec: Support late bind fw information
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260904182451.1164868-35-michael.j.ruhl@intel.com>
References: <20260904182451.1164868-20-michael.j.ruhl@intel.com>
 <20260904182451.1164868-35-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 18:56:06 +0000
Message-Id: <20260904185607.276CB1F00A3D@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Delayed work polling for firmware readiness is not canceled during=
 system suspend, risking hardware access on a powered-off device.
- [Medium] `wait_for_fw` sleeps uninterruptibly for up to 20 seconds while =
holding the `drm_dev_enter()` SRCU read lock, which can block system suspen=
d and stall concurrent device unplug operations.
- [Low] The function `xe_is_oobmsm_fw_ready` is called multiple times but i=
s undefined in the codebase.
--

commit 78def2bf4e30236b5f83a02d2b38ab43b6afb79d
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>

drm/xe/vsec: Support late bind fw information

This commit updates the XE PMT probe to support late-binding firmware. It
introduces a polling mechanism using delayed work to wait for the CRI
firmware to be ready before initializing VSEC features.

> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
[ ... ]
> @@ -281,6 +291,48 @@ static int xe_guid_decode(u32 guid, int *index, u32 =
*offset)
>  	return -ENODEV;
>  }
> =20
> +static void cri_late_bind_probe_work(struct work_struct *work)
> +{
> +	struct xe_device *xe =3D container_of(work, struct xe_device, pmt.work.=
work);
> +
> +	if (xe_is_oobmsm_fw_ready(xe)) {

[Severity: Low]
Is the xe_is_oobmsm_fw_ready() function defined anywhere? It appears this
function is called here but the definition seems to be missing from the
codebase. Will this cause a build failure with an unresolved symbol?

> +		cri_late_bind_probe(xe);
> +		xe_pm_runtime_put(xe);
> +		return;
> +	}
> +
> +	xe->pmt.retry_count++;
> +
> +	/* wait up to 20 seconds */
> +	if (xe->pmt.retry_count =3D=3D VSEC_LATE_BIND_RETRY) {
> +		drm_warn(&xe->drm, "PMT probe: Late Binding failed to complete\n");
> +		xe_pm_runtime_put(xe);
> +		return;
> +	}
> +
> +	if (!schedule_delayed_work(&xe->pmt.work, msecs_to_jiffies(VSEC_LATE_BI=
ND_DELAY_MSEC)))

[Severity: High]
Is there a risk that this delayed work could execute while the system is
suspended? The work is scheduled to poll for up to 20 seconds, but there
doesn't appear to be any integration with the driver's suspend/resume paths
to cancel this work.

If the system enters S3 sleep during this window, could the work wake up
and attempt to access MMIO (e.g., via xe_is_oobmsm_fw_ready()) on a
powered-off device, potentially causing PCI bus errors or a kernel panic?

> +		xe_pm_runtime_put(xe);
> +}
> +
> +static bool wait_for_fw(struct xe_device *xe)
> +{
> +	int retries =3D VSEC_LATE_BIND_RETRY;  /* wait up to 20 secs */
> +
> +	if (xe->info.platform !=3D XE_CRESCENTISLAND)
> +		return true;
> +
> +	while (retries--) {
> +		if (xe_is_oobmsm_fw_ready(xe))
> +			return true;
> +
> +		msleep(VSEC_LATE_BIND_DELAY_MSEC);

[Severity: Medium]
Could this uninterruptible sleep cause issues with system suspend or device
unplug? This function can sleep for up to 20 seconds, and it is called from
xe_pmt_telem_read() which holds the drm_dev_enter() SRCU read lock.

Holding that lock for 20 seconds will block drm_dev_unplug() for the same
duration. Additionally, an uninterruptible sleep of this length can block
the system PM freezer, potentially causing suspend to time out and abort.

Since this can be reached by a userspace process reading PMT telemetry,
could this allow an unprivileged user to trigger a localized denial of
service?

> +	}
> +
> +	drm_warn(&xe->drm, "Late Binding failed to complete\n");
> +
> +	return false;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904182451.1164=
868-20-michael.j.ruhl@intel.com?part=3D15
