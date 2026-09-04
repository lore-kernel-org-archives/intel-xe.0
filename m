Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79BA2C624D6
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 00:28:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F25E610E0FD;
	Fri,  4 Sep 2026 00:28:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Kew78IJg";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6770D10E0FD
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 00:28:53 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 0EC07412BE;
 Fri,  4 Sep 2026 00:28:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBB201F000E9;
 Fri,  4 Sep 2026 00:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788481732;
 bh=MMSTrIpH/+Z34w9MtkdfArE/MjePbIJJY2jrH5Gp0bQ=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Kew78IJg2odPK99KwB+VI577dNYWxbnPQuSRUIXhigIdr63ZO1m0aP/o+3ddqT6Da
 hGEFDD0k1jwbaOltKxa9VZxuYNmXVrXs/YMcninTCcGvKxC/JIqYybeJNUP1pP6oty
 jyINpUg5SYZTbur2zYytauPMyNMAs9MUiGOq6o4S8xUrvWOFYWn57K56Avsfv2mFOs
 fn48tPfubZOFXx/hYciGqT3p4y1hFxn+G/xocZVvxmCgkIgUS7WdhWr8l/ZTByIzXq
 0tmfco8gAz1vdhsgeQn+CrjbRG1U+VLX0K+g5eZw8JEe2qVJPdIH7Iy992OCATSQob
 4tnymw/dI++Bw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 23/25] drm/xe: Enter ULLS for migration jobs upon
 page fault or SVM prefetch
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260903235842.3401722-24-matthew.brost@intel.com>
References: <20260903235842.3401722-1-matthew.brost@intel.com>
 <20260903235842.3401722-24-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 00:28:52 +0000
Message-Id: <20260904002852.BBB201F000E9@smtp.kernel.org>
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
- [High] Incorrect ordering of xe_pm_runtime_put() and xe_force_wake_put() =
leading to hardware MMIO access on a potentially suspended device.
--

commit 43d7d496e886ff3c7ea66fac7a62b351eae1e2b2
Author: Matthew Brost <matthew.brost@intel.com>

drm/xe: Enter ULLS for migration jobs upon page fault or SVM prefetch

This commit calls xe_migrate_ulls_enter upon page fault or SVM prefetch in =
an
effort to speed up these critical paths. It also adjusts the teardown and e=
xit
sequences for ULLS migration jobs.

Link: https://patch.msgid.link/20260228013501.106680-25-matthew.brost@intel=
.com

> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migr=
ate.c
> index 1fa236eb1a260..80efa67fc2e15 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -114,8 +114,8 @@ static void xe_migrate_fini(void *arg)
>  	disable_delayed_work_sync(&m->ulls.exit_work);
>  	mutex_lock(&m->job_mutex);
>  	if (m->ulls.enabled) {
> -		xe_force_wake_put(gt_to_fw(m->q->hwe->gt), m->q->hwe->domain);
>  		xe_pm_runtime_put(xe);
> +		xe_force_wake_put(gt_to_fw(m->q->hwe->gt), m->q->hwe->domain);

[Severity: High]
Does swapping the order here risk accessing hardware MMIO while the device
is suspended?

Because xe_pm_runtime_put() drops the runtime PM usage counter, it could
trigger a synchronous or asynchronous runtime suspend. If the device suspen=
ds
before xe_force_wake_put() completes its MMIO writes to release the forcewa=
ke
domain, it could result in PCI Unsupported Request (UR) errors or device ha=
ngs.

>  		m->ulls.enabled =3D false;
>  	}
>  	mutex_unlock(&m->job_mutex);
> @@ -589,8 +589,8 @@ static void xe_migrate_ulls_exit(struct work_struct *=
work)
>  		xe_sched_job_put(job);
>  	if (!m->ulls.enabled) {
>  		/* Pairs with PM gets on enter */
> -		xe_force_wake_put(gt_to_fw(m->q->hwe->gt), m->q->hwe->domain);
>  		xe_pm_runtime_put(xe);
> +		xe_force_wake_put(gt_to_fw(m->q->hwe->gt), m->q->hwe->domain);

[Severity: High]
Is this order change safe from a runtime PM perspective?=20

Similar to the sequence in xe_migrate_fini(), dropping the PM reference in
xe_migrate_ulls_exit() before releasing the forcewake domain might allow the
device to suspend while xe_force_wake_put() is still accessing hardware MMIO
registers.

> =20
>  		cancel_delayed_work(&m->ulls.exit_work);
>  		xe_dbg(xe, "Migrate ULLS mode exit");

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903235842.3401=
722-1-matthew.brost@intel.com?part=3D23
