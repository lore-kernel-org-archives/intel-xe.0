Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 641A1C5DF94
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 06:23:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0900810E8FB;
	Tue, 25 Aug 2026 06:23:18 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2164010E8FB;
 Tue, 25 Aug 2026 06:23:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_fix_GuC_TLB_inv?=
 =?utf-8?q?alidation_ack_stalls_on_ARL_=28Wa=5F22016122933=29_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Tales_A=2E_Mendon=C3=A7a?= <talesam@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 25 Aug 2026 06:23:17 -0000
Message-ID: <178763899713.80981.140069251289648099@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260824140748.54974-1-talesam@gmail.com>
In-Reply-To: <20260824140748.54974-1-talesam@gmail.com>
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

Series: drm/xe: fix GuC TLB invalidation ack stalls on ARL (Wa_22016122933) (rev2)
URL   : https://patchwork.freedesktop.org/series/172110/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit eebd19cb013f128d9c92b93a603b663318f8abf3
Author: Tales A. Mendonça <talesam@gmail.com>
Date:   Mon Aug 24 11:07:48 2026 -0300

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
    and the GGTT cache mode (XE_CACHE_NONE instead of XE_CACHE_WB), which
    is stricter than i915: i915 documents the workaround as WC on the CPU
    side and UC on the GPU side. A CPU-WC variant with the GGTT side kept
    at XE_CACHE_NONE was tested and is equally effective, but reaching it
    would require either a new flag or decoupling the GGTT cache-mode
    selection from XE_BO_FLAG_NEEDS_UC - simply swapping in
    XE_BO_FLAG_FORCE_WC silently relaxes the GPU side back to WB and the
    stalls return. Keeping the stricter mapping here; no throughput
    difference between the two was measurable.
    
    Validation on two ARL machines (7d51 and 7dd1): before, 20-60 TLB
    invalidation ack stalls per day, every day, for weeks, on every kernel
    and on two GuC firmware versions (70.53.0 and 70.72.1). After: zero
    stalls in ~4 weeks of combined runtime, over 7M TLB invalidations
    processed under the same workloads. The 7dd1 machine, which could not
    survive a day of media workloads on xe without a platform freeze, has
    been running xe continuously for two weeks including video
    transcoding, with zero incidents.
    
    The coherency experiment, the CPU-WC measurements and the engine
    activity coverage gap were found by Navon John Lukose while A/B
    testing v2 on an ARL 7d51.
    
    Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8678
    Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Signed-off-by: Tales A. Mendonça <talesam@gmail.com>
    Tested-by: Navon John Lukose <navonjohnlukose@gmail.com>
+ /mt/dim checkpatch 15e2ba2fb6d25c03d89519aec46f8d5be3e118ad drm-intel
0ba5f0836fb7 drm/xe: Capture devcoredump on TLB invalidation timeout
-:168: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_q' - possible side-effects?
#168: FILE: drivers/gpu/drm/xe/xe_devcoredump.h:34:
+#define xe_devcoredump(_q, _job, _fmt, ...) \
+	__xe_devcoredump((_q)->gt, _q, _job, _fmt, ##__VA_ARGS__)

total: 0 errors, 0 warnings, 1 checks, 184 lines checked
37f890bc677c drm/xe: Log when a timed out TLB invalidation ack finally arrives
eebd19cb013f drm/xe: Implement Wa_22016122933


