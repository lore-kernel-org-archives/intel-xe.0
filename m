Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA20AC98321
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 17:43:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70EAD10E0CD;
	Fri, 25 Sep 2026 17:43:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BCQU/kZs";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8D2810E0CD
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 17:43:04 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 0542F60230;
 Fri, 25 Sep 2026 17:43:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84EFF1F00893;
 Fri, 25 Sep 2026 17:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790358183;
 bh=XMZMp7AIlBsgfBV0vZiiDSX+8pJZxbMlEP++4zXosJA=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=BCQU/kZsE9bKUykzlMh1GnbGUIpXAYCfYiMrZf+0SJVJmIlxmddqAjk6yD71lvr6P
 k5cBq/2oSSdUtCI1XVieb7txiGLK+sVrLmGth+n6WErai0AcpqWhMpGGZtoXRFHXpp
 AssW5G43QOSz87jkLfl6UiweoMU9hrIungUCh6LlYyao9mcwOPuOXTVn33eyouDsC1
 5q0tu/1VFeef+crmnrWzbNVNIwjahee/RBOcAs5GW+Zb4+wtETGFysVaK4G58r2nBR
 vTZLbmCwEyZz+WmLTZzSXJGMrtA863J2rq7bhYVTIIAKQTbLwnUZYTyN2jhLyMzvMT
 Ccej8JixFRMjA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] drm/xe: Set job credits based on LRC size
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260925172603.302050-6-dev@lankhorst.se>
References: <20260925172603.302050-4-dev@lankhorst.se>
 <20260925172603.302050-6-dev@lankhorst.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 17:43:03 +0000
Message-Id: <20260925174303.84EFF1F00893@smtp.kernel.org>
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
- [High] drm/xe: Ring buffer overflow due to static LRC initialization not =
accounted in credit limit
--

commit 89815f911de168c13f3cdfa254a0cefac8d7b016
Author: Maarten Lankhorst <dev@lankhorst.se>
drm/xe: Set job credits based on LRC size

This commit changes the scheduler credit limit to be based on the full LRC
size minus 4, rather than dividing by MAX_JOB_SIZE_BYTES, to allow filling
the entire LRC without throttling.

> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_exe=
clist.c
> index a36db39dcda8a..24469990ece97 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -329,7 +329,7 @@ static int execlist_exec_queue_init(struct xe_exec_qu=
eue *q)
>  	const struct drm_sched_init_args args =3D {
>  		.ops =3D &drm_sched_ops,
>  		.num_rqs =3D 1,
> -		.credit_limit =3D xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES,
> +		.credit_limit =3D xe_lrc_ring_size() - 4,

[Severity: High]
Does this limit account for the static initialization bytes emitted by
xe_lrc_init()? Since xe_lrc_init() emits 8 or 24 bytes of static initializa=
tion
commands into the ring buffer, advancing the initial tail pointer, a
credit_limit of xe_lrc_ring_size() - 4 (16380 bytes) only tracks dynamic job
payloads.

If a burst of jobs is submitted to a newly created queue before the hardware
processes the initial commands (while head =3D=3D 0), could the total bytes=
 in the
ring buffer reach 16376 + 8 =3D 16384 or 16376 + 24 =3D 16400? Since the ri=
ng
capacity is 16384, this could wrap the tail pointer to exactly head (0) or =
past
it, overwriting unconsumed initial bytes or appearing empty to the hardware,
which would lead to a permanent GPU hang or command corruption.

>  		.hang_limit =3D XE_SCHED_HANG_LIMIT,
>  		.timeout =3D XE_SCHED_JOB_TIMEOUT,
>  		.name =3D q->hwe->name,
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index f3ba8abfc228e..264e961fd7d71 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2089,7 +2089,7 @@ static int guc_exec_queue_init(struct xe_exec_queue=
 *q)
>  	}
> =20
>  	err =3D xe_sched_init(&ge->sched, &drm_sched_ops, &xe_sched_ops,
> -			    submit_wq, xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES, 64,
> +			    submit_wq, xe_lrc_ring_size() - 4, 64,

[Severity: High]
Does the GuC submission path also suffer from the same ring buffer overflow
issue as described above? It looks like this initialization uses the same
unsafe xe_lrc_ring_size() - 4 capacity limit which might not account for the
static LRC initialization bytes.

>  			    timeout, guc_to_gt(guc)->ordered_wq, NULL,
>  			    ge->name, gt_to_xe(q->gt)->drm.dev);
>  	if (err)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925172603.3020=
50-4-dev@lankhorst.se?part=3D2
