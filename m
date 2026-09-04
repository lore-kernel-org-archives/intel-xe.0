Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F61C624DE
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 21:23:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B6A710E199;
	Fri,  4 Sep 2026 21:23:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="a+pvAv2f";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCA6310E199
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 21:23:10 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id BCD4260A74;
 Fri,  4 Sep 2026 21:23:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 530FC1F00A3D;
 Fri,  4 Sep 2026 21:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788556989;
 bh=+50N08t0As8W+YzyVxBmCcjm81KAPoLfjwuLfQrzQ2w=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=a+pvAv2fKJKCcnyz59ANGB6LInvx0ZYs+RH8Fcrn0/EnBq7XKJMzOwy6XNvcs6hFt
 Qt2kEBSBaexrrt0Ipy0kBeBaK16oyed2Jkc4QT/Mmp/IkaX3T7ch2FDyFelqN9Xjus
 a1bXZf62J9Oez7P+PkXfsEFa7BR7TE8U8PdghB0rytL9RHYcQ8OnzooH0Qx1aDNA9h
 wqR9dtW/UpWXto4Yonu+fLPXqABQ/BsEg7jfnVhewDvVZRQZctAn+PNrI8ZKanhtLO
 Vd4VZ0PSuMJMYn2xxso6iXL6KU9KuXUjiZqxQoWITmvJRNhzxSGmU6XL/Hzf1vkdt+
 Ufa33+1Al5Sjg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 04/24] drm/xe: Add job count to GuC exec queue snapshot
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260904211613.3934307-5-matthew.brost@intel.com>
References: <20260904211613.3934307-1-matthew.brost@intel.com>
 <20260904211613.3934307-5-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 21:23:08 +0000
Message-Id: <20260904212309.530FC1F00A3D@smtp.kernel.org>
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
- [Low] Format specifier mismatch when printing `jobcount`
--

commit bcb5e4e44e3808966c558f04a63143c713dbc759
Author: Matthew Brost <matthew.brost@intel.com>
drm/xe: Add job count to GuC exec queue snapshot

This commit adds the job count to the GuC exec queue snapshot to provide
useful debugging information.

Link: https://patch.msgid.link/20260228013501.106680-5-matthew.brost@intel.=
com

> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index 0a6e2b81b5a53..8b8673f4e037c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
[ ... ]
> @@ -3756,6 +3757,7 @@ xe_guc_exec_queue_snapshot_print(struct xe_guc_subm=
it_exec_queue_snapshot *snaps
>  	drm_printf(p, "\tLogical mask: 0x%x\n", snapshot->logical_mask);
>  	drm_printf(p, "\tWidth: %d\n", snapshot->width);
>  	drm_printf(p, "\tRef: %d\n", snapshot->refcount);
> +	drm_printf(p, "\tJob count: %d\n", snapshot->jobcount);

[Severity: Low]
Does this code use the wrong format specifier for jobcount?

In xe_guc_submit_types.h, jobcount is declared as an unsigned 32-bit integer
(u32), but it is printed here in xe_guc_exec_queue_snapshot_print() using
the signed %d format specifier instead of %u. While the maximum job count
(1000) easily fits within a signed 32-bit integer, this formally violates
the printf-style format string API constraints.

>  	drm_printf(p, "\tTimeout: %ld (ms)\n", snapshot->sched_timeout);
>  	drm_printf(p, "\tTimeslice: %u (us)\n",
>  		   snapshot->sched_props.timeslice_us);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904211613.3934=
307-1-matthew.brost@intel.com?part=3D4
