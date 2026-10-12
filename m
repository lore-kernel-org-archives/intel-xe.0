Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7539ECA9ED1
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 15:04:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32FC310F183;
	Mon, 12 Oct 2026 15:04:06 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7150C10F183
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 15:04:00 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 95882601FB;
 Mon, 12 Oct 2026 15:03:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D5191F0089C;
 Mon, 12 Oct 2026 15:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791817439;
 bh=mnbQNEqI2q47LGjspSuEmeVAVAMyQDb0HbIs+pooJ3M=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=h5CO7SHR52wa9nm+S2gByuhixkF2QdCbxiPwjoWTEWyzGvqkH5WtRC2UvRzSTD7KE
 KyTaa89WxH8Pnfb6nR83dT1bUX8nlebdauMT5gJmj9bBqmjeJ1+l42covIZ3zcbzR/
 lozC/Dx4nzkyBg4SCCb1ZJZ7EWL5jHvYVasfvKr/TU22g/1BJ857oy4QJsXyUdyXrQ
 zJihsKhPodr4So9HHD6rX0MHPeBycz06U8qPzxY43IGTKVIJHxmgQP1jzbF4P5GCzt
 k/Q8FV6oebPzGj169qYTlYjOOoRzrXBleFcm8kA+E/+bB9FyEFc3kxR/gNSowL/p05
 3UUwVAqJdn7gQ==
Message-ID: <sashiko-outbox-168310@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/7] drm/xe/devcoredump: Add GuC register snapshot to
 devcoredump
To: "Nareshkumar Gollakoti" <naresh.kumar.g@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261012145237.3788198-3-naresh.kumar.g@intel.com>
References: <20261012145237.3788198-1-naresh.kumar.g@intel.com>
 <20261012145237.3788198-3-naresh.kumar.g@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 15:03:58 +0000
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
- [High] xe: NULL pointer dereference of `q` in devcoredump_snapshot()
--

commit e0032c5e9ffbf65f21b038440b113313907d9c4c
Author: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: drm/xe/devcoredump: Add GuC register snapshot to devcoredump

This commit adds support for capturing GuC register state as part of the xe
devcoredump snapshot. It defines a dedicated GuC register snapshot structure
and records selected GT and media GuC status/error registers.

> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_=
devcoredump.c
> index 1dbee725f55a1..f4a22e46eda78 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
[ ... ]
> @@ -561,6 +591,14 @@ static void devcoredump_snapshot(struct xe_devcoredu=
mp *coredump,
>  						      other_gt,
>  						      XE_DBG_REGSET_RPM,
>  						      XE_GT_TYPE_MEDIA);
> +	ss->gt_guc_reg =3D xe_dbg_gt_snapshot_capture(q->gt,
> +						    other_gt,
> +						    XE_DBG_REGSET_GUC,
> +						    XE_GT_TYPE_MAIN);

[Severity: High]
Can this cause a NULL pointer dereference when devcoredump_snapshot() is
called?

The xe_devcoredump_gt() function explicitly passes NULL for the q (exec que=
ue)
parameter in cases like TLB invalidation timeouts, where the hang is not ti=
ed
to a specific queue.

If q is NULL, the unconditional access to q->gt here will trigger a kernel
panic during the error handling path, crashing the system and preventing the
devcoredump from successfully completing.

Would it be safer to use the provided gt argument instead of q->gt?

> +	ss->media_gt_guc_reg =3D xe_dbg_gt_snapshot_capture(q->gt,
> +							  other_gt,
> +							  XE_DBG_REGSET_GUC,
> +							  XE_GT_TYPE_MEDIA);

[Severity: High]
Similarly, does this unconditional access to q->gt risk a NULL pointer
dereference under the same conditions described above?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012145237.3788=
198-1-naresh.kumar.g@intel.com?part=3D2
