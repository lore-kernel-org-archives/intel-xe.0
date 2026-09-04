Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84263C79F82
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 18:20:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 325B210E1FD;
	Fri,  4 Sep 2026 18:20:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aIeQqgay";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9C5910E1FD
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 18:20:05 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 9967F41781;
 Fri,  4 Sep 2026 18:20:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FBEB1F00A3F;
 Fri,  4 Sep 2026 18:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788546005;
 bh=4vLLxi4wYtqyg0sCAU1tC7JLIQ+iVkomsb0aTDM4MY8=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=aIeQqgayAthVKfUHF6i3WUsprFkzpfawfCffH8TigAFW+flZOTgzxAw56hrYbOYVD
 64v7WWFRPvcHTYdISven6vs7/QHbnScsHO+o7+f7yt+3wR/GDed8z88uMVumET7HbP
 VK9qQrzxpLFbrD5Fllh2dpjUFGAiY19NKeQsc9dESuU/LVRoULjU5i8rwtEPIcsm0g
 y4NPAKvhZY2h8SAMMdbRJSBYkIPuSTqkMD/TS1G0raLgfcz7am5KwCU1XXCw+cJ5wq
 S+hIGxN0gSMUIXHTDn9E6fPfJE71C6Vr1/g32jPuSoUcfXXVTcC+Uh3Bdo71k3vjIQ
 vtR5qojMBZutg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/xe/guc: skip TDR timeout check when ctx_timestamp
 is 0 or 1
To: "Jia Yao" <jia.yao@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260904180943.3455267-1-jia.yao@intel.com>
References: <20260904180943.3455267-1-jia.yao@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 18:20:04 +0000
Message-Id: <20260904182005.4FBEB1F00A3F@smtp.kernel.org>
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
- [High] Resetting `job->sample_timestamp` to `U64_MAX` when `ctx_timestamp=
 <=3D 1` unconditionally bypasses the TDR watchdog if the GPU hangs during =
context restore, causing an infinite loop that completely disables hang rec=
overy.
--

commit e50d47eb7a620614e04b8e05f251f148a49a7005
Author: Jia Yao <jia.yao@intel.com>

drm/xe/guc: skip TDR timeout check when ctx_timestamp is 0 or 1

This commit updates the TDR timeout check to skip when ctx_timestamp
is 0 or 1. It resets the sampling baseline instead, under the assumption
that the timestamp is not yet valid.

> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
[ ... ]
> @@ -1428,6 +1428,20 @@ static bool check_timeout(struct xe_exec_queue *q,=
 struct xe_sched_job *job)
>  		return xe_sched_invalidate_job(job, 0);
>  	}
> =20
> +	/*
> +	 * A ctx_timestamp of 0 or 1 indicates an invalid timestamp:
> +	 * - 1 (CONTEXT_ACTIVE) is the cookie written by the WA BB immediately
> +	 *   after a full context restore, before the spinner has run.
> +	 * - 0 can occur when lrc->ctx_timestamp shadow is uninitialized or was
> +	 *   last updated while the context was being restored.
> +	 * In both cases the timestamp is not yet valid, so reset the sampling
> +	 * baseline and wait for the next check_timeout() call.
> +	 */
> +	if (ctx_timestamp <=3D 1) {
> +		job->sample_timestamp =3D U64_MAX;
> +		return false;
> +	}
> +

[Severity: High]
Does this unconditionally bypass the TDR watchdog if the GPU hangs during a
context restore?

If the hardware stalls while ctx_timestamp is 0 or 1 (e.g., during context
restore or while the WA BB is executing), check_timeout() will continuously
reset job->sample_timestamp to U64_MAX and return false.

On all subsequent TDR ticks, ctx_timestamp will still be 0 or 1, which does
not equal U64_MAX. Won't this repeat the reset and return false indefinitel=
y,
preventing the DRM scheduler from ever invalidating the job and triggering a
GPU reset?

>  	job->sample_timestamp =3D ctx_timestamp;
>  	ctx_job_timestamp =3D xe_lrc_ctx_job_timestamp(q->lrc[0]);
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904180943.3455=
267-1-jia.yao@intel.com?part=3D1
