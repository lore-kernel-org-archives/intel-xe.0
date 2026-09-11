Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27184C88E53
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 20:31:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC00A10E402;
	Fri, 11 Sep 2026 20:31:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fb9utHrT";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6CBF10E402
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Sep 2026 20:31:38 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id BDC50600AA;
 Fri, 11 Sep 2026 20:31:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52EB71F000FF;
 Fri, 11 Sep 2026 20:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789158697;
 bh=EkJ9B76z7C+lckZ+WdORECPRByUJd6TNTzJ1u1A30Q0=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=fb9utHrTrR4HbRWW/GkXl9CWJ2RZoAs6m7mi+8qnZj3Q8TMFFtDayj0+icDh4R3kK
 060c//uzGERMXq8VyarQ1UaWzkdJHzXj+rmpBOfZug/0HJTSYKVspMvEidz7qP5Jyz
 Rb+wDlHNkt+GrjApZnwNHvGXzo56qcKAo2H5mi2UbLltfkKprbXPnB0XptnNKFFiSz
 UVSrvseuqjKrmnC12oddEwhVrLUJfi0SJMYkSelFOtSwnkcKb8V973W/H9WeY8m2VD
 1liEJoXmzAj28INqNTldTnNW1rxXVK1jhZpemohKHunaD3L/imJhRs1KaOshNyHS21
 3z40mV2BfVvKg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 17/20] drm/xe/vsec: Support late bind fw information
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260911201148.1610547-39-michael.j.ruhl@intel.com>
References: <20260911201148.1610547-22-michael.j.ruhl@intel.com>
 <20260911201148.1610547-39-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 20:31:36 +0000
Message-Id: <20260911203137.52EB71F000FF@smtp.kernel.org>
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
- [High] Race condition causing devres leak and zombie auxiliary device dur=
ing unbind.
- [High] Concurrent access to `set_telem_region` without `xe->pmt.lock` cau=
ses hardware state corruption.
- [Medium] Uninterruptible sleep for 20 seconds in debugfs read path causes=
 Denial of Service.
--

commit 4c5a8d1261728742c4507e3c8f19ebb935da6c19
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>

drm/xe/vsec: Support late bind fw information

This commit adds support for CRI firmware late binding. It updates the XE
PMT probe and access paths to check for late bind devices, verify the
firmware state, and wait for readiness before proceeding.

diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index cb3d9142346cf..c2f527e7894af 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -281,6 +291,48 @@ static int xe_guid_decode(u32 guid, int *index, u32 *o=
ffset)
[ ... ]
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
Does this uninterruptible sleep risk blocking hot-unplugs for up to 20
seconds?

This msleep() puts the process into an uninterruptible sleep state. When
called from user-space via xe_pmt_telem_read(), the thread has already
called drm_dev_enter(), meaning it holds the SRCU read lock for the entire
wait period. If a hot-unplug event occurs, drm_dev_unplug() will be blocked
waiting for the SRCU grace period to complete, effectively causing a denial
of service on the device removal path.

> +	}
> +
> +	drm_warn(&xe->drm, "Late Binding failed to complete\n");
> +
> +	return false;
> +}
[ ... ]
@@ -471,12 +541,44 @@ static enum xe_vsec get_platform_info(struct xe_devic=
e *xe)
[ ... ]
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
> +	info->priv_data =3D &xe_cri_pmt_cb;
> +	xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);

[Severity: High]
Is xe->pmt.lock needed here to protect the set_telem_region hardware
register?

In other code paths, the lock is correctly acquired before updating this
hardware state:

xe_pmt_telem_read() {
    ...
    mutex_lock(&xe->pmt.lock);
    xe->soc_remapper.set_telem_region(xe, mem_region);
    ...
}

Since cri_late_bind_probe() accesses it asynchronously from the worker
thread without acquiring the lock, concurrent debugfs reads could cause the
PMT hardware to read from the wrong region or return garbage telemetry
data.

> +
> +	intel_vsec_register(dev, info);

[Severity: High]
Does this sequence race with device unbind, leading to orphaned devres
entries?

When the device unbinds, devres_release_all() splices the parent device's
resource list into a local list and begins executing actions, including
vsec_disable_late_bind_work().

If vsec_disable_late_bind_work() blocks below on disable_delayed_work_sync(=
),
the worker may currently be executing this call to intel_vsec_register().

intel_vsec_register() will allocate new devres entries (such as auxiliary
devices) on the parent device. Because the parent's devres head is now
empty (having been moved to the local list for teardown), these new entries
are appended to the main list but will never be freed since the teardown is
already in progress. This leaves zombie auxiliary devices and causes memory
leaks.

> +}
> +
> +static void vsec_disable_late_bind_work(void *arg)
> +{
> +	struct xe_device *xe =3D arg;
> +
> +	/*
> +	 * If the queued work is canceled, the runtime reference needs to be
> +	 * released here.
> +	 */
> +	if (disable_delayed_work_sync(&xe->pmt.work))
> +		xe_pm_runtime_put(xe);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911201148.1610=
547-22-michael.j.ruhl@intel.com?part=3D17
