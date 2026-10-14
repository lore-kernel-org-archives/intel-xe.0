Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF66FCC6B19
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 06:15:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FBE810E444;
	Wed, 14 Oct 2026 06:15:02 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3360710E444
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Oct 2026 06:14:56 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id BD1564322B;
 Wed, 14 Oct 2026 06:14:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 756151F000FF;
 Wed, 14 Oct 2026 06:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791958495;
 bh=tNRAqXr5t8ES4io6GjoamFxX0mFll76wBQrpxT9vbcE=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=IpSmSMG7ztUNL4YFS4tL3kMBfq7aoJf1i4+F3v9jHFyQVihA+FaHNYg2SZUWcjWmL
 4P9cWd4wNMQfjjcjaXkdYSlGQLSauLta9OXLfVgvFaE5zlwZphBQfi19dcmrmon9fS
 O163kEgKaGREJAuHCM8ZrDBfLuuAeavUEP1s/l1yRIMhxZM95a8TJyJhlCZxO4sxHl
 98J5Tg3qAD4swUvyPrbplHF2uRcF+g3csBTkOqXSMk/fTj0THZEJE8TDG41asq429f
 +63wEHRmSJVUWCldLYk8ENFCtSjzDDkAH2ivM5+EC/cQaCXcknr7/LRxgmjR7uDNQR
 Tw789R92XftEg==
Message-ID: <sashiko-outbox-170856@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/7] drm/xe/gt: Use GT ordered workqueue for wedging
To: "Raag Jadav" <raag.jadav@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261014055215.330408-2-raag.jadav@intel.com>
References: <20261014055215.330408-1-raag.jadav@intel.com>
 <20261014055215.330408-2-raag.jadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 06:14:55 +0000
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
- [High] drm/xe: Infinite TDR loop when device wedged during GT init
--

commit 6009cd9a52688d1928f2b5ef571d3108edd7243e
Author: Raag Jadav <raag.jadav@intel.com>

drm/xe/gt: Use GT ordered workqueue for wedging

This commit introduces a worker for GT specific wedge handling and queues t=
he
teardown on the GT ordered workqueue. This prevents scheduler disruptions
while jobs are still in-flight. It also introduces the
for_each_initialized_gt() macro and uses it when declaring the device
wedged.

> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index e1979bbcf7bc6..014bc5b0216dd 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1425,7 +1425,7 @@ void xe_device_declare_wedged(struct xe_device *xe)
>  			    WEDGED_URL, XE_BUG_URL);
>  	}
> =20
> -	for_each_gt(gt, xe, id)
> +	for_each_initialized_gt(gt, xe, id)
>  		xe_gt_declare_wedged(gt);

[Severity: High]
Does this create a race condition if the device is wedged concurrently with
xe_gt_init()?

If xe_device_declare_wedged() runs while a GT is initializing, the GT is
skipped here because gt->initialized is false.

> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 775c826b68b42..d8bf538ceafff 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
[ ... ]
> @@ -769,6 +773,8 @@ int xe_gt_init(struct xe_gt *gt)
>  			return err;
>  	}
> =20
> +	/* Must be last */
> +	WRITE_ONCE(gt->initialized, true);
>  	return 0;
>  }

Then xe_gt_init() sets gt->initialized to true without checking if a global
wedge event occurred during initialization.

This allows the GT to become active even though its GuC was never wedged
(since xe_guc_submit_wedge() was skipped during xe_device_declare_wedged()).

If jobs submitted to this GT (like migration jobs) hang, the TDR in
guc_exec_queue_timedout_job() runs. Since the TDR detects the global wedge
via xe_wedged(), it skips the hardware reset but returns NO_HANG while
immediately re-queueing the TDR work:

drivers/gpu/drm/xe/xe_guc_submit.c:guc_exec_queue_timedout_job() {
    ...
    xe_guc_exec_queue_trigger_cleanup(q);

    if (wedge_device)
        xe_device_declare_wedged(gt_to_xe(q->gt));

    /*
     * We want the job added back to the pending list so it gets freed; this
     * is what DRM_GPU_SCHED_STAT_NO_HANG does.
     */
    return DRM_GPU_SCHED_STAT_NO_HANG;
}

Can this lead to an infinite TDR spinloop (100% CPU deadlock) since the job
is never completed nor is the hardware reset?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014055215.3304=
08-1-raag.jadav@intel.com?part=3D1
