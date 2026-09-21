Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E27C982ED
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 18:27:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCE8910E34F;
	Mon, 21 Sep 2026 18:27:44 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7292C10E34F;
 Mon, 21 Sep 2026 18:27:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_fix_GuC_TLB_inv?=
 =?utf-8?q?alidation_ack_stalls_on_ARL_=28Wa=5F22016122933=29_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Tales_A=2E_Mendon=C3=A7a?= <talesam@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 21 Sep 2026 18:27:43 -0000
Message-ID: <179001526346.188435.16907974567028230278@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260921182121.308217-1-talesam@gmail.com>
In-Reply-To: <20260921182121.308217-1-talesam@gmail.com>
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
Reply-To: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe: fix GuC TLB invalidation ack stalls on ARL (Wa_22016122933) (rev4)
URL   : https://patchwork.freedesktop.org/series/172110/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6bef5ce5c74dc76b4ee69ab2832c0d1fd63c91c7
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 40bacff47ae199d83f4e7a07f7a5ab17fa19e4d4
Author: Tales A. Mendonça <talesam@gmail.com>
Date:   Mon Sep 21 15:21:21 2026 -0300

    drm/xe: Implement Wa_22016122933
    
    On platforms with a standalone media GT and media version 13.00
    (MTL/ARL), memory shared between the CPU and the media GT's GuC must
    not be mapped cached on the CPU side: the CPU can otherwise read stale
    cache lines for data the GuC has already written.
    
    i915 implements this as Wa_22016122933 (see
    intel_gt_needs_wa_22016122933(), used by intel_guc_allocate_vma() and
    intel_gt_coherent_map_type()); xe never inherited it.
    
    The visible symptom on ARL is TLB invalidation acks stalling for a
    near-constant ~2.3s: the GuC writes the G2H ack in time, but the CPU
    keeps reading a stale (empty) view of the G2H CTB until the line is
    naturally evicted, so the fence timeout at 2.25s fires first. GuC log
    decode confirmed all invalidations were handled promptly by the
    firmware, and only the media GT was affected. See Link for the full
    investigation (three machines affected: 7d51, 7dd1, Arc Pro 130T).
    
    Making the mapping coherent instead of uncached does not help: with a
    GGTT PAT entry repurposed to WB|COH_2WAY the driver comes up and the
    media GT GuC runs, but the stalls remain (request-to-ack 2290ms).
    Uncached really is required here. Note that 2-way coherency is not
    normally reachable from a GGTT PTE (only 2 PAT bits), so that
    experiment needed a modified PAT table and may not reflect a supported
    configuration.
    
    Add the OOB workaround scoped like i915 (media version 13.00, media GT
    only - MEDIA_VERSION() OOB rules only match the media GT on standalone
    media platforms) and apply XE_BO_FLAG_NEEDS_UC to the GuC-shared
    allocations the CPU reads from: the CTBs, the GuC log, ADS, the SLPC
    shared data and the engine activity buffers. hwconfig and the G2G
    buffer are allocated on the primary GT only, where the workaround does
    not apply.
    
    Note that XE_BO_FLAG_NEEDS_UC drives both the CPU mapping (uncached)
    and the GGTT cache mode (XE_CACHE_NONE instead of XE_CACHE_WB), which is
    stricter than i915: i915 documents the workaround as WC on the CPU side
    and UC on the GPU side. A CPU-WC variant with the GGTT side kept at
    XE_CACHE_NONE was measured to be equally effective, but expressing it
    would require either a new BO flag or decoupling the GGTT cache-mode
    selection from XE_BO_FLAG_NEEDS_UC - simply swapping in
    XE_BO_FLAG_FORCE_WC silently relaxes the GPU side back to WB and the
    stalls return. The stricter mapping is kept here since it is the tested
    configuration and no throughput difference between the two was
    measurable; the extra plumbing can be added later if parity with i915 is
    preferred.
    
    Scope is limited to the GuC-shared allocations, which is where the
    failures were observed. i915 additionally covers media-GT LRC/ring
    state; extending xe to match can be done as a follow-up if wanted.
    
    Validation on two ARL machines (7d51 and 7dd1): before, 20-60 TLB
    invalidation ack stalls per day, every day, for weeks, on every kernel
    and on two GuC firmware versions (70.53.0 and 70.72.1). After: zero
    stalls in six weeks of combined runtime, over 10M TLB invalidations
    processed under the same workloads, across kernels 7.1.6, 7.1.8 and
    7.2. The 7dd1 machine, which could not survive a day of media
    workloads on xe without a platform freeze, has been running xe full
    time since 11 August, including days with heavy video transcoding,
    with zero stalls and zero freezes.
    
    The coherency experiment, the CPU-WC measurements and the engine
    activity coverage gap were found by Navon John Lukose while A/B
    testing v2 on an ARL 7d51.
    
    Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8678
    Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Signed-off-by: Tales A. Mendonça <talesam@gmail.com>
    Tested-by: Navon John Lukose <navonjohnlukose@gmail.com>
+ /mt/dim checkpatch 42735b6937d60963dd302128231fb74a18164a60 drm-intel
2aefd4be8004 drm/xe: Capture devcoredump on TLB invalidation timeout
-:169: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_q' - possible side-effects?
#169: FILE: drivers/gpu/drm/xe/xe_devcoredump.h:34:
+#define xe_devcoredump(_q, _job, _fmt, ...) \
+	__xe_devcoredump((_q)->gt, _q, _job, _fmt, ##__VA_ARGS__)

total: 0 errors, 0 warnings, 1 checks, 187 lines checked
30ace16f4cca drm/xe: Log when a timed out TLB invalidation ack finally arrives
40bacff47ae1 drm/xe: Implement Wa_22016122933


