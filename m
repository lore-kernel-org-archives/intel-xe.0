Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46482C5DF81
	for <intel-xe@archiver.kernel.org>; Mon, 24 Aug 2026 14:08:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0340410E5F4;
	Mon, 24 Aug 2026 14:08:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XPL2dz73";
	dkim-atps=neutral
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD12210E5F4
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Aug 2026 14:07:59 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-836cda225c1so49119317b3.2
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Aug 2026 07:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787580478; x=1788185278; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=0yNqopektA6CmGzMtywYajCtH1yhmgLiF2mewMkr3m0=;
 b=XPL2dz73LFGx3n2vPEobQLEhQyx/5Plhy9WfPNL7t0Z68pMuIutjLHDYr5IYNAoSkp
 7Oe4nG5tsosISpEJQiATta8UN4TRdLz0IdBuiNc2UhDjawsz2nB31L4kSVgYbManBTmC
 Vzqwsn0YJTUSnEhz0aFHVGmD0aoX/Q+4r03uvWgUVDS1Cw67rHr/pkAlsLPFA10adoPa
 3Fq+2sm/r3obYhN0RTqlgtAn1Ba+0SBYSTsi9pUFpH6wqkosgWAz/lOfTNWg+bZSnzmv
 h7z6y8Nl0mUXJF6f9u88VE3btIbye9A3pRYW+Txlj/ysRLl26P/xalqiNPXUqsV917RG
 YZKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787580478; x=1788185278;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=0yNqopektA6CmGzMtywYajCtH1yhmgLiF2mewMkr3m0=;
 b=dWj3ODWp8WaEpW7z22Lg3Dvqar1NseqyrugmYrWKtN91XcBs/fqmv0PsViw0XcoAl1
 DViQ51sh3JHaZ3Z9XV4GcUp3Y1Nk1ys3tIpEnrioju41PhMtCjAGywoWH0Fte0eXSYiD
 7JGY8tkf3Gf810oCNKkRrLPFgMWkzXN9Ymyl62TrJd0vN8Wm90ERHr/hjr2nH6GOvpUz
 oQhWWEZHMtNloWxd/0kEeu/ot2qKvhcqLOcqkK/ZZD9qesocWYIapV4I27RtjxCDhN+1
 dJu4rQfcVIc/HJzdXnd6tM6fhWpZbHiQOzAXUkd3JkXnsiv+00Znj4jGJ0FBXcK1X2Ry
 ouPQ==
X-Gm-Message-State: AFuF++lEm8ZMzay+5hatuHrmVTZcavqK9XtgV3HYeGVvNXhyAnwbwHDt
 1M/XZ9+vLYcHFsMHjxFZwaGl8WUMcvttQUrVPTBl9JwheUL2OHP+2UnmKbsKGf55
X-Gm-Gg: AR+sD12xsgrdwIa0xlIFTs/ZO9m9FhMi7MW5doVq5Ok4NhheDRBp92nQ/p64ofGOoYV
 LYBzs1zVckX4jv4XQ5TlbmtgJWGxw4o0gxM1y6a38hJriKnjarRXKBg8rRQGJoH8llCtk7CBryU
 E9hn9lWgOkfXTDFm7MLCrQwhGolZscvnnDfhq/sNYqLCEhEYzAHmcBJzB9Ltz0Ky+hv6UFmVcDn
 3x1xieNZ9tAfKQFObq18Z7V/t2DPtGmUM1ErVdIkCudJa8j4E+SU/ou1eGDx8Fj7o9fog2s0MRX
 U9Ld8Zmu14C6VjqzhCzs/M4DgKu1C51EubZeUBcdOgdVhHcSudcZwtAMw5cMCXlIpWjpiQHSTZb
 y/+e3QgjPrseDVDgzh2m1ysi5faJhLua0IXbs67tiY42Q1nZLmslcZrFImac0Ay236gIMdUCvU6
 fgs1e5pZUpAPq+gETqz4cJMi8P3xYnEMazxYE2+jrp2SsztqUdNIHiqlivZM7MfsvKhIvtnUktp
 rkr333qFU7433v/BomnUmgVmyhiaZXuF6XWnUk=
X-Received: by 2002:a05:690c:a714:b0:81e:893c:2c23 with SMTP id
 00721157ae682-849f14c4040mr92883567b3.11.1787580478334; 
 Mon, 24 Aug 2026 07:07:58 -0700 (PDT)
Received: from lord ([170.246.211.189]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-853ff053a84sm3326337b3.4.2026.08.24.07.07.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2026 07:07:57 -0700 (PDT)
From: =?UTF-8?q?Tales=20A=2E=20Mendon=C3=A7a?= <talesam@gmail.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, daniele.ceraolospurio@intel.com,
 stuart.summers@intel.com, julia.filipchuk@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 navonjohnlukose@gmail.com, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Tales=20A=2E=20Mendon=C3=A7a?= <talesam@gmail.com>
Subject: [PATCH v3 0/3] drm/xe: fix GuC TLB invalidation ack stalls on ARL
 (Wa_22016122933)
Date: Mon, 24 Aug 2026 11:07:45 -0300
Message-ID: <20260824140748.54974-1-talesam@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Hi,

v3 of the TLB invalidation ack stall fix for ARL, tracked in:

  https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8678

Root cause recap: the GuC replies in time, but on the standalone media
GT the CPU reads a stale cache line of the G2H CTB - the caching
erratum i915 works around as Wa_22016122933 and xe never inherited.
Patch 3 implements it, scoped like i915.

Since v2, Navon John Lukose A/B tested the series on an ARL 7d51 and
produced three results that are folded into this version:

 * Making the mapping coherent instead of uncached does not work: a
   GGTT PAT entry repurposed to WB|COH_2WAY still stalls
   (request-to-ack 2290ms). Now documented in patch 3 - it is the
   obvious question to ask about this patch, and the answer is
   measured rather than assumed.

 * xe_guc_engine_activity.c allocates GuC-written, CPU-read buffers on
   the same GT without the workaround flags; the symptom there would
   be stale busyness stats rather than hangs. Now covered.

 * CPU-WC (matching i915's wording) is equally effective, but
   XE_BO_FLAG_NEEDS_UC currently drives both the CPU mapping and the
   GGTT cache mode, and naively switching to XE_BO_FLAG_FORCE_WC
   relaxes the GPU side back to WB and brings the stalls back
   (3 hits/20min measured).

His Tested-by on patch 3 is from v2; the only code change since is the
added engine activity coverage.

Two questions I would rather have answered than decide unilaterally:

 1. CPU mapping: keep the stricter UC as in this series, or add a way
    to express i915's exact combination (CPU WC + GGTT XE_CACHE_NONE)?
    The latter needs either a new BO flag or decoupling the GGTT
    cache-mode selection from XE_BO_FLAG_NEEDS_UC. No measurable
    throughput difference between the two.

 2. Scope: i915 applies the workaround to all media-GT shared memory,
    including LRC/ring state; this series covers the GuC-shared
    allocations only (CTBs, log, ADS, SLPC, engine activity). Should
    xe match i915's full scope?

I also left out Fixes:/Cc: stable, since MTL/ARL is still
require_force_probe in xe - happy to add them if you would prefer the
fix to reach stable kernels.

Validation of patch 3: two ARL machines (7d51 and 7dd1), ~4 weeks of
combined runtime, >7M TLB invalidations, zero stalls. Before the fix
both machines reproduced 20-60 stalls/day, every day, on every kernel
and on two GuC firmware versions. The 7dd1 machine, which could not
survive a day of media workloads on xe without a platform freeze, has
been running xe continuously for two weeks including video
transcoding, with zero incidents.

Patches 1-2 are the diagnostics that made the investigation possible,
unchanged from v2 except for a commit-message line wrap.

v2 -> v3:
- Rebased on drm-tip.
- Patch 3: cover xe_guc_engine_activity.c; document the coherency
  experiment and the UC-vs-WC tradeoff; add Suggested-by/Tested-by.
- Patch 2: wrap a quoted log line to silence checkpatch.
- checkpatch is clean on all three patches now.

Thanks,
Tales

Tales A. Mendonça (3):
  drm/xe: Capture devcoredump on TLB invalidation timeout
  drm/xe: Log when a timed out TLB invalidation ack finally arrives
  drm/xe: Implement Wa_22016122933

 drivers/gpu/drm/xe/xe_devcoredump.c         | 46 +++++++++++----------
 drivers/gpu/drm/xe/xe_devcoredump.h         | 15 +++++--
 drivers/gpu/drm/xe/xe_guc.c                 | 16 +++++++
 drivers/gpu/drm/xe/xe_guc.h                 |  2 +
 drivers/gpu/drm/xe/xe_guc_ads.c             |  3 +-
 drivers/gpu/drm/xe/xe_guc_ct.c              |  6 ++-
 drivers/gpu/drm/xe/xe_guc_engine_activity.c |  6 ++-
 drivers/gpu/drm/xe/xe_guc_log.c             |  7 +++-
 drivers/gpu/drm/xe/xe_guc_pc.c              |  3 +-
 drivers/gpu/drm/xe/xe_tlb_inval.c           | 39 +++++++++++++++++
 drivers/gpu/drm/xe/xe_tlb_inval_types.h     | 17 ++++++++
 drivers/gpu/drm/xe/xe_wa_oob.rules          |  1 +
 12 files changed, 128 insertions(+), 33 deletions(-)

-- 
2.55.0

