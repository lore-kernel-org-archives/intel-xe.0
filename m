Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3E02C9830D
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 12:02:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57D3310E258;
	Fri, 25 Sep 2026 12:02:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QGw3IcIR";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15CF510E258
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 12:02:14 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 2939260136;
 Fri, 25 Sep 2026 12:02:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9E6C1F000FF;
 Fri, 25 Sep 2026 12:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790337732;
 bh=4CjD1jM33OML+JtKpJcbn6Sogk0KgpUrk5kX7ywdeiM=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=QGw3IcIRggp3DrfOYKmiqjvTWWZO6mf1rCgrVh9ogaUlsYECLbiReszR1VqSPVi9G
 uestRXH8+PbduHr2bdenD/MAx5yEAwhZR1Eo+RKBzzdIakzVLZRtHbW0/fy1HwV09z
 0GqkX1RA2RMf7VP/5SFwpL/0Jmav5Xpyd2tnlEmh18STBiLrgTyxvdspnOEPmYBQGU
 hSW187roz/xJ5nC+dOZGfWiesz/C8MA2jWJ5tiJnZTgqTWZTA3EttEe0+gl5YeD5Xu
 QLK8Y6mbuVo43eiozKWS1/e68J+pG+qeZX4Wx2oCKOZ1qX1yz8xXMd4/Nyl2YUjvOX
 uKQvgQWy6iJoA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] drm/xe/shrinker: use async RPM get
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260925115521.1018940-3-matthew.auld@intel.com>
References: <20260925115521.1018940-3-matthew.auld@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 12:02:12 +0000
Message-Id: <20260925120212.A9E6C1F000FF@smtp.kernel.org>
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
- [Low] xe: missing trace event in xe_pm_runtime_get_async() creates unbala=
nced tracing
--

commit 1b04fd7832712be0fc1a084098ad02baf3e5f01f
Author: Matthew Auld <matthew.auld@intel.com>

drm/xe/shrinker: use async RPM get

Replaces the custom PM worker with pm_runtime_get() using RPM_ASYNC to
queue a resume request.

> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 4a745c3a933b4..ba63a26444957 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c

[ ... ]

> @@ -803,6 +803,18 @@ void xe_pm_runtime_get(struct xe_device *xe)
>  	pm_runtime_resume(xe->drm.dev);
>  }
> =20
> +/**
> + * xe_pm_runtime_get_async - Get a runtime_pm reference and queue up a r=
esume
> + * @xe: xe device instance
> + *
> + * Grabs a runtime PM reference and requests an asynchronous resume with=
out
> + * blocking. Safe to call from contexts such as reclaim.
> + */
> +void xe_pm_runtime_get_async(struct xe_device *xe)
> +{
> +	pm_runtime_get(xe->drm.dev);
> +}

[Severity: Low]
Does this new function need a trace_xe_pm_runtime_get() call?

Other synchronous PM wrappers in this driver include a trace event.
Without it here, tools tracking RPM refcounts might log 'put' events
without corresponding 'get' events from the async path.

[ ... ]

> diff --git a/drivers/gpu/drm/xe/xe_shrinker.c b/drivers/gpu/drm/xe/xe_shr=
inker.c
> index deb4378c1ec15..518f77acf1dd3 100644
> --- a/drivers/gpu/drm/xe/xe_shrinker.c
> +++ b/drivers/gpu/drm/xe/xe_shrinker.c

[ ... ]

> @@ -66,7 +64,8 @@ static bool __xe_shrinker_runtime_pm_get(struct xe_shri=
nker *shrinker)
>  		return true;
>  	}
> =20
> -	queue_work(xe->unordered_wq, &shrinker->pm_worker);
> +	xe_pm_runtime_get_async(xe);
> +	xe_pm_runtime_put(xe);
> =20
>  	return false;
>  }

[Severity: Low]
During memory reclaim under pressure, if xe_pm_runtime_get_if_active()
fails, the driver falls back to this path.

Because xe_pm_runtime_get_async() is missing a trace, this sequence will
produce a trace_xe_pm_runtime_put() without a corresponding get trace,
unlike the pm_worker thread it replaced. Is this tracing regression
intentional?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925115521.1018=
940-3-matthew.auld@intel.com?part=3D1
