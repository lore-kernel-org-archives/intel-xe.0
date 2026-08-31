Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B56F8C624A5
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 16:01:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ACA710E2E4;
	Mon, 31 Aug 2026 16:01:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ObZgXNnL";
	dkim-atps=neutral
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6064D10E2E4
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 16:01:12 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-8565d77c277so34270097b3.0
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 09:01:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788192071; cv=none;
 d=google.com; s=arc-20260327;
 b=Q2roehqxivU+66sX7dqsLVrF0tAFaWEFnlr04WortP++1/GRdwgMaOG5TNU8KIvhbw
 7wiod5MfQ/kQR5ICTvH97xZbEMpuxuJcJsB08L0BVKlfo/WUf9/bDkM3iIgJx5uXGC6v
 4yerx7yOHd8AN+zdsc14m4sW9HkhKjjrNsSveyzUHEZOOXAKaPmRGfXV9z3Pe5mrZXHd
 dhAH8v3hEUTdkuuG1I0sRfn2b4tSlr/GPUGzvtCeZjlw3/pkUxsGt3C1/B78odkV+I0e
 WShHlk05731TfxFLVGhFXiZDIVD7mZmze9t1ULb2r/U2heF/KziqQ0I7bgS7uv7GjAIA
 s05A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=ESNV4ph15b9j2FbSLaZw6uJteHQDQdNhxnbMXCIu30E=;
 fh=bZ9lxWKm+vD7WFY5mYFY2qfmUHFj7V0gjw6jNDRUuXg=;
 b=mKqhyttmMOnJdIQCoCNX5NpjYXfWOW9ig3pxUTkYyuazfYsrShhNkOU9b0kBv1vfqX
 C7NpgYiR8QeJFaDwBlILZ2fR9gYzJd70Jzy10G85tSry7hhYHUIsOPFwu2V67qrFOYJn
 v8TgRqWwJ3sYTL31fHdtBMezQCjvxf1sgXxUjprxVUs5Kqlta3OYMk3V1GK49o9YlLiO
 p5nvCJUuZPwfebrpZ4GsSDEPI3CuMESNiCP5KC2qS4MjffSG9ZPCoSuBbDLckVSYiYF3
 I2tEjuuz3gkmrE/QxAeLm7kFV/z2WejFlHEGcEDs4w0Xszl29xSZy/dAfRfgvxCHokgr
 e8EQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788192071; x=1788796871; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=ESNV4ph15b9j2FbSLaZw6uJteHQDQdNhxnbMXCIu30E=;
 b=ObZgXNnLfipWu74x4tsP0hTBMRNmNBriIobfuhrCrjo+eGXyVRXdXOhIIAJgvnXHm3
 0B2Ayya81P7gVrRGoJq5V4qtzv8/GeYCfV36OqNPlx5zsjA8uXvKUepFsmGuvTirmkDc
 grq3DQOFWeXEtOwGfeW/2nyUGCeLAGlPZ3OWFjd2uODCVkDxDXgXA2/d5I/zoqOjhA2D
 3W2/pgeV5DAH0J9EXLtVs+eB+ccNtZv3zEafzJPMj97MvpA1qZj6qkkKvO42r9qcp75X
 nwB4yJhtJgFQwfylFkX3bQBfLfatGuUY/k/6k472zZAI6sBr4WsmCEYJMbHwiqlSHQxu
 XRFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788192071; x=1788796871;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ESNV4ph15b9j2FbSLaZw6uJteHQDQdNhxnbMXCIu30E=;
 b=e3A9asND0WSuHFpWfY73VdExAO0ktOxiHEXzis7HeLslfJOJI5/pUWH98Y6hoPyNE4
 Qjf1agU87tyIdNHf1x41dlKzuEW15t8qbNJWXAVutkJFoKv7LomhRS1ahJam4dvzfH8O
 kupwGdA7bf5sWvkL5K65+Go1bPVXNcvfIyBofJcQdPD2JHD5zQfEXmfzWfTQGhzgDmeM
 peN7vxkHwxNkVFkCiJxzNVdZCg9qpBEbKIx1hOB085z9LbpMtvCMgbjQnDmwGdVeJTdw
 8i91czZsNDYN7o/GLgKREOIv+qawyTv3CaqOapBJGs7j71dLp5W2N3xHZXH88IummPgM
 Johw==
X-Gm-Message-State: AFuF++k6uNTHAbrH0K0Y+iThwR1ExYL7W5ZixYaXPHNSHGsVT9kilcoJ
 PC54GslzL+wnwrYKLM+cda3vRwci+GB6S5qMgKyFHyvZxCcn1Ykyu+28DGg6dSURsQmyXqclDu4
 C75tqXVuU3Qnvr7+DKyWyhQJLF/6qcB/fMmt5
X-Gm-Gg: AYBFou3qU/U1Csq/lXa5twf4nKFvjNL6KJOlpq4Vzh2fUMuM7zgUg7OP4XWxnja+KV6
 4rQFsRQu3sN8uyQ0TnBSZlkR+BgBmxY/kFGMDoL1iVHYDC+dBJqsuE9jarqzvgQvupLQO7GomSc
 LEL0OAeyel+hscrY1lOlBJZc5Z8k9qt95SN9ccOEpZQ2ufmPU970QioK+aIW+ZFngJO/LUz5Ng3
 hQskVrEnx+/qjmN7Q8JlwJAO5DCOri09xuo2p3qH+slF4LZXH+iQq29tLnm/mlDfLuoL/3icBjD
 QZMV6eJf6Mv6Y4DyamNkbRxcVomb3cyhQly5UxWdrP2EzbWsZAF4YO0lehp1Xmy9QN9sfTQ/f3X
 L5Uic8SCkKjwf6AAdlHzohFys8A8ERixQ
X-Received: by 2002:a05:690c:a583:b0:81e:ae6f:ac0a with SMTP id
 00721157ae682-85d6ee0a27dmr75676847b3.24.1788192070682; Mon, 31 Aug 2026
 09:01:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260824140748.54974-1-talesam@gmail.com>
In-Reply-To: <20260824140748.54974-1-talesam@gmail.com>
From: =?UTF-8?B?VGFsZXMgQS4gTWVuZG9uw6dh?= <talesam@gmail.com>
Date: Mon, 31 Aug 2026 13:00:58 -0300
X-Gm-Features: AcwNN1VQIGgx0fRQI5CTNMwuvZJlwR-D_D7e2bl7IOjwdjqhvPvytoYuUezr-64
Message-ID: <CAHBRX4G2OEk2gDvpbDTt_NDWteSzngmU2E+9hGKFP9h=aBpd4A@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] drm/xe: fix GuC TLB invalidation ack stalls on ARL
 (Wa_22016122933)
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, daniele.ceraolospurio@intel.com, 
 stuart.summers@intel.com, julia.filipchuk@intel.com, 
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com, 
 navonjohnlukose@gmail.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Daniele, Matt - now that rc1 is out, could you weigh in on the two open
questions from the cover letter? They are the only things I am unsure
about, and I would rather follow your preference than guess:

1. CPU mapping. This series uses XE_BO_FLAG_NEEDS_UC, which maps both
   the CPU side (uncached) and the GGTT side (XE_CACHE_NONE). i915
   documents the workaround as WC on the CPU side and UC on the GPU
   side. A CPU-WC variant with the GGTT side left at XE_CACHE_NONE was
   measured to be equally effective, but expressing it needs either a
   new BO flag or decoupling the GGTT cache-mode selection from
   XE_BO_FLAG_NEEDS_UC - swapping in XE_BO_FLAG_FORCE_WC alone
   silently relaxes the GPU side back to WB and the stalls return.
   Keep the stricter UC, or should I add the plumbing for i915 parity?

2. Scope. i915 applies the workaround to all media-GT shared memory,
   including LRC/ring state; this series covers the GuC-shared
   allocations (CTBs, log, ADS, SLPC, engine activity). Should xe match
   i915's full scope?

Either answer is a small change; I just do not want to pick the wrong
one unilaterally.

Meanwhile both test machines have moved to 7.2 with this exact series
applied (previously they ran a cruder CTB-only variant), and the
workaround shows up where it should - present on the media GT's OOB
list, absent on the primary GT:

  gt0/workarounds: (no 22016122933)
  gt1/workarounds: 22016122933

Still zero ack stalls on either machine. The 7dd1 machine, which used
to freeze under media workloads on xe, has been running xe full time
since 11 August, including a day with 16 video transcoding sessions,
with no stalls and no freezes.

Thanks,
Tales

Em seg., 24 de ago. de 2026 =C3=A0s 11:07, Tales A. Mendon=C3=A7a
<talesam@gmail.com> escreveu:
>
> Hi,
>
> v3 of the TLB invalidation ack stall fix for ARL, tracked in:
>
>   https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8678
>
> Root cause recap: the GuC replies in time, but on the standalone media
> GT the CPU reads a stale cache line of the G2H CTB - the caching
> erratum i915 works around as Wa_22016122933 and xe never inherited.
> Patch 3 implements it, scoped like i915.
>
> Since v2, Navon John Lukose A/B tested the series on an ARL 7d51 and
> produced three results that are folded into this version:
>
>  * Making the mapping coherent instead of uncached does not work: a
>    GGTT PAT entry repurposed to WB|COH_2WAY still stalls
>    (request-to-ack 2290ms). Now documented in patch 3 - it is the
>    obvious question to ask about this patch, and the answer is
>    measured rather than assumed.
>
>  * xe_guc_engine_activity.c allocates GuC-written, CPU-read buffers on
>    the same GT without the workaround flags; the symptom there would
>    be stale busyness stats rather than hangs. Now covered.
>
>  * CPU-WC (matching i915's wording) is equally effective, but
>    XE_BO_FLAG_NEEDS_UC currently drives both the CPU mapping and the
>    GGTT cache mode, and naively switching to XE_BO_FLAG_FORCE_WC
>    relaxes the GPU side back to WB and brings the stalls back
>    (3 hits/20min measured).
>
> His Tested-by on patch 3 is from v2; the only code change since is the
> added engine activity coverage.
>
> Two questions I would rather have answered than decide unilaterally:
>
>  1. CPU mapping: keep the stricter UC as in this series, or add a way
>     to express i915's exact combination (CPU WC + GGTT XE_CACHE_NONE)?
>     The latter needs either a new BO flag or decoupling the GGTT
>     cache-mode selection from XE_BO_FLAG_NEEDS_UC. No measurable
>     throughput difference between the two.
>
>  2. Scope: i915 applies the workaround to all media-GT shared memory,
>     including LRC/ring state; this series covers the GuC-shared
>     allocations only (CTBs, log, ADS, SLPC, engine activity). Should
>     xe match i915's full scope?
>
> I also left out Fixes:/Cc: stable, since MTL/ARL is still
> require_force_probe in xe - happy to add them if you would prefer the
> fix to reach stable kernels.
>
> Validation of patch 3: two ARL machines (7d51 and 7dd1), ~4 weeks of
> combined runtime, >7M TLB invalidations, zero stalls. Before the fix
> both machines reproduced 20-60 stalls/day, every day, on every kernel
> and on two GuC firmware versions. The 7dd1 machine, which could not
> survive a day of media workloads on xe without a platform freeze, has
> been running xe continuously for two weeks including video
> transcoding, with zero incidents.
>
> Patches 1-2 are the diagnostics that made the investigation possible,
> unchanged from v2 except for a commit-message line wrap.
>
> v2 -> v3:
> - Rebased on drm-tip.
> - Patch 3: cover xe_guc_engine_activity.c; document the coherency
>   experiment and the UC-vs-WC tradeoff; add Suggested-by/Tested-by.
> - Patch 2: wrap a quoted log line to silence checkpatch.
> - checkpatch is clean on all three patches now.
>
> Thanks,
> Tales
>
> Tales A. Mendon=C3=A7a (3):
>   drm/xe: Capture devcoredump on TLB invalidation timeout
>   drm/xe: Log when a timed out TLB invalidation ack finally arrives
>   drm/xe: Implement Wa_22016122933
>
>  drivers/gpu/drm/xe/xe_devcoredump.c         | 46 +++++++++++----------
>  drivers/gpu/drm/xe/xe_devcoredump.h         | 15 +++++--
>  drivers/gpu/drm/xe/xe_guc.c                 | 16 +++++++
>  drivers/gpu/drm/xe/xe_guc.h                 |  2 +
>  drivers/gpu/drm/xe/xe_guc_ads.c             |  3 +-
>  drivers/gpu/drm/xe/xe_guc_ct.c              |  6 ++-
>  drivers/gpu/drm/xe/xe_guc_engine_activity.c |  6 ++-
>  drivers/gpu/drm/xe/xe_guc_log.c             |  7 +++-
>  drivers/gpu/drm/xe/xe_guc_pc.c              |  3 +-
>  drivers/gpu/drm/xe/xe_tlb_inval.c           | 39 +++++++++++++++++
>  drivers/gpu/drm/xe/xe_tlb_inval_types.h     | 17 ++++++++
>  drivers/gpu/drm/xe/xe_wa_oob.rules          |  1 +
>  12 files changed, 128 insertions(+), 33 deletions(-)
>
> --
> 2.55.0
>


--=20
Com os cumprimentos,

Tales A. Mendon=C3=A7a
talesam.org
communitybig.org
