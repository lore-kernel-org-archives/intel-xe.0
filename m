Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4616C98321
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 20:48:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 667E410E1B3;
	Fri, 25 Sep 2026 20:48:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Kumog4Xx";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A2A310E1B3
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 20:48:04 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id A79EC60136;
 Fri, 25 Sep 2026 20:48:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E4271F000FF;
 Fri, 25 Sep 2026 20:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790369283;
 bh=SUH+QVy8Io+9Sudxtp//yGz6TTiDnNKElblzG+DOX3Q=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Kumog4Xxcd2sfXwvKM4GHkcFIn/Gi2cuMcYaA7OyXQRWGb7msA8vZf8t/Xf4ok2iG
 isds2qJE7iAJxLh1SgBdcgSywMELNHLnYhtW3h1OM+eVxL3mzYZ5IE4yTfVzsKms8b
 1c+ctpFXuD5mgZpB1cPeC3g45HapI08oS2Eo1b7rkrnwBsmdo1TRwX2SIeVE9lIG84
 Ts+ZtAZWN08d4Y9Wpibojo+edX02Ffg1x2VdhfyPyJJR5ZhticMyAuvDgsh8XIo+xn
 pRuecaMCdaHkW46B7GJJZ7hpyCVy3LRAwtAxAQj1mwUtWqORfEDRCXsWcMyAlTYgPo
 nQUAyCPBftt6g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 20/24] drm/xe: Add ULLS migration job support to ring
 ops
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260925201526.1355279-21-matthew.brost@intel.com>
References: <20260925201526.1355279-1-matthew.brost@intel.com>
 <20260925201526.1355279-21-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 20:48:02 +0000
Message-Id: <20260925204803.3E4271F000FF@smtp.kernel.org>
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
- [High] drm/xe: prefetch race in ULLS migration ring tail update
--

commit 3d64140e37d6f99c19fcb4ef3b9b272bf7535ed9
Author: Matthew Brost <matthew.brost@intel.com>

drm/xe: Add ULLS migration job support to ring ops

This commit adds preamble and postamble generation for ULLS migrations jobs.
The postamble advances the ring tail from within the ring itself to avoid
CPU overhead when submitting the next job.

> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_rin=
g_ops.c
> index 46ab1f0f35648..9f462bfecb831 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
[ ... ]
> +/* Publish the next job's tail, then park the engine on its semaphore */
> +static int emit_ulls_postamble(struct xe_gt *gt, struct xe_lrc *lrc, u32=
 *dw,
> +			       int i, u32 seqno, u32 head)
> +{
> +	i =3D emit_ulls_ring_tail(gt, lrc, dw, i, head);
> +
> +	dw[i++] =3D MI_SEMAPHORE_WAIT |
> +		MI_SEMW_GGTT |
> +		MI_SEMW_POLL |
> +		MI_SEMW_COMPARE(SAD_EQ_SDD);

[Severity: High]
Does advancing the ring tail via LRI before stalling the engine on the
MI_SEMAPHORE_WAIT create a prefetch race?

When the command streamer's fetch unit sees the updated tail before the
semaphore stall, it may prefetch the unwritten memory for the next job into
the L1I cache.

When a page fault occurs later, the CPU writes the new job and signals the
semaphore. Since the Intel GPU L1I cache is not coherent with CPU writes and
isn't invalidated after the CPU writes the new commands, could the execution
unit consume the stale prefetched commands instead of the intended migration
job?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925201526.1355=
279-1-matthew.brost@intel.com?part=3D20
