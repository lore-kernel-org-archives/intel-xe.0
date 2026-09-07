Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D69BC79F9E
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 08:50:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFEA310E6E7;
	Mon,  7 Sep 2026 08:50:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="k6PS3fMw";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8B7010E6E7
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 08:50:28 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id C632660052;
 Mon,  7 Sep 2026 08:50:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D5281F00A3A;
 Mon,  7 Sep 2026 08:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788771027;
 bh=OJMZhJ91lfKN8hnZ2uF5HIEV+33/R5peMfT4ulznrBk=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=k6PS3fMwjt9cs+ziSxTyzldNB1WeAeYUZ0XfCX54LQ6QijeoL+y7e+o0nvU6VlRCC
 ilsVHQuma0sR+PGgIuRKwNeM8VewqvzKj7/nAxMuRCIl38ODfvhQb/lNmYtKihb3N4
 AbIpFYU9Y5NVNQy5dO/tsl84Yfft5q/Gn2snW9Birru0hMO6zdk6RBByQkB0j9d4v0
 yxkZQYjuivxk41dHlR3HDFR55ogJY0CpU9Gvk9WipPXNcoGpw/xAbZ1r4GZhiOyGtZ
 RQg7zlikPN4QwkQ8XWQ44IRBoWKhGx5aFKY8Cxdt1/Xw2PQZcEgNa6g8zvL8iH/6KO
 OqWPc1EBmJlmA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/5] drm/xe/gt: Use GT ordered workqueue for wedging
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260907083541.2194747-2-raag.jadav@intel.com>
References: <20260907083541.2194747-1-raag.jadav@intel.com>
 <20260907083541.2194747-2-raag.jadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 08:50:26 +0000
Message-Id: <20260907085027.5D5281F00A3A@smtp.kernel.org>
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
- [High] Lockless TOCTOU race on work_struct initialization can lead to que=
ueing an uninitialized work item.
--

commit 70fa657e4e9d6562a705a7808a6bc4a42f57256e
Author: Raag Jadav <raag.jadav@intel.com>
Subject: drm/xe/gt: Use GT ordered workqueue for wedging

This commit introduces a GT ordered workqueue for GT wedge handling to
avoid disrupting the scheduler with in-flight jobs. It adds a wedge worker
initialized during GT init and queued when a wedge is declared.

> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 478e047031f4f..200e34331c195 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c

[ ... ]

> @@ -1195,6 +1207,7 @@ void xe_gt_declare_wedged(struct xe_gt *gt)
>  {
>  	xe_gt_assert(gt, gt_to_xe(gt)->wedged.mode);
> =20
> -	xe_uc_declare_wedged(&gt->uc);
> -	xe_tlb_inval_reset(&gt->tlb_inval);
> +	/* Prevent queueing uninitialized worker if hit during probe */
> +	if (gt->wedge.worker.func)
> +		queue_work(gt->ordered_wq, &gt->wedge.worker);

[Severity: High]
Could this lockless check of the work_struct func field lead to list
corruption on weakly ordered architectures?

During driver probe, an asynchronous hardware fault (such as a PCI AER or
an I2C interrupt) could trigger xe_gt_declare_wedged() concurrently with
xe_gt_init().

In xe_gt_init(), the worker is initialized via:

INIT_WORK(&gt->wedge.worker, gt_wedge_worker);

This macro sets the work_struct's data, entry, and finally func, but does so
without memory barriers. If an interrupting CPU observes the writes out of
order due to CPU store reordering, func could be seen as non-NULL while data
or entry remain uninitialized.

If that happens, xe_gt_declare_wedged() would pass this check and call
queue_work() with a partially initialized work_struct. This can cause a
kernel panic in the workqueue core. Is there a safer way to synchronize
this probe-time wedge check without relying on lockless field inspection?

>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907083541.2194=
747-1-raag.jadav@intel.com?part=3D1
