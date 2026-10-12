Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F66CA9ED1
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 15:06:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67E1A10F1B1;
	Mon, 12 Oct 2026 15:06:07 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73AFC10F1AE
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 15:06:01 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id EBF98600D4;
 Mon, 12 Oct 2026 15:06:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 830011F0089C;
 Mon, 12 Oct 2026 15:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791817560;
 bh=fI/AKM+iZOrpksJENTgUFk3rKmsuf6ESZOZThvaB9ig=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=S33RMjbP77IHqZCpuUVu/tBImdaJXAJUBMj0r+elOpIYHq2UPQdP+5oJMkI6XH5U+
 ja621rMjLxYAss2YWxSHrIX+J82/bmCmJoOMTolDl8JcAxkm557cayP3ChPky1TPGs
 oIEmTgIaPvs+F9dvU/Xe9yyFZ1xEUCUWLyJ/0Zk6ygxdcM8vRahN19Svt5qw83euuN
 +CFFHIgQf6WiUdPsfzP8m02Nm6ZXkl3Tw8ZRpA8nBT+5lJbwIGbW8GKdDdmZu/XgF9
 fohjWbhp4pOFHxsL19IlbPhmHzdY0+JEXwgXTfjTqpUaD5lHKOZtJigH3pwMitbpag
 Xf9C2YHz9TbMA==
Message-ID: <sashiko-outbox-168313@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 6/7] drm/xe: capture L3 node status registers in
 devcoredump
To: "Nareshkumar Gollakoti" <naresh.kumar.g@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261012145237.3788198-7-naresh.kumar.g@intel.com>
References: <20261012145237.3788198-1-naresh.kumar.g@intel.com>
 <20261012145237.3788198-7-naresh.kumar.g@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 15:06:00 +0000
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
- [High] drm/xe: NULL pointer dereference of q in devcoredump_snapshot()
--

commit 6161ac10e80fa8c54c67e54542cd9c6bcb0ef507
Author: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
drm/xe: capture L3 node status registers in devcoredump

This commit adds L3_NODE_IDLE and L3STAT_LBCF_GFX registers and captures
them in the devcoredump snapshot. It also extends the register descriptor
to support reading MCR registers.

> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_=
devcoredump.c
> index a2a3437ec2f62..db7ccee12006a 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
[ ... ]
> @@ -639,13 +663,15 @@ static void devcoredump_snapshot(struct xe_devcored=
ump *coredump,
>  						       other_gt,
>  						       XE_DBG_REGSET_GAM_PF,
>  						       XE_GT_TYPE_MAIN);
> -
> +	ss->ns =3D xe_dbg_gt_snapshot_capture(q->gt,
> +					    other_gt,
> +					    XE_DBG_REGSET_L3_NODE,
> +					    XE_GT_TYPE_MAIN);

[Severity: High]
If q is NULL, will accessing q->gt cause a NULL pointer dereference here?

When a devcoredump is triggered for a GT-level hang not tied to an exec que=
ue
(such as a TLB invalidation timeout via xe_devcoredump_gt()), q can be NULL,
which is why the code immediately below checks if (q).

Should this capture use the gt parameter that is passed into
devcoredump_snapshot() instead of q->gt, or should it be moved inside the
if (q) block?

>  	if (q) {
>  		ss->ge =3D xe_guc_exec_queue_snapshot_capture(q);
>  		if (job)
>  			ss->job =3D xe_sched_job_snapshot_capture(job);
>  		ss->vm =3D xe_vm_snapshot_capture(q->vm);
> -
>  		xe_engine_snapshot_capture_for_queue(q);
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012145237.3788=
198-1-naresh.kumar.g@intel.com?part=3D6
