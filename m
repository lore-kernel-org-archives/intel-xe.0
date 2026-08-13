Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA17C5CFCF
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 02:37:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B68C010E48C;
	Thu, 13 Aug 2026 02:37:09 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAF1010E48C;
 Thu, 13 Aug 2026 02:37:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_fix_GuC_TLB_inv?=
 =?utf-8?q?alidation_ack_stalls_on_ARL_=28Wa=5F22016122933=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Tales_A=2E_Mendon=C3=A7a?= <talesam@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 13 Aug 2026 02:37:08 -0000
Message-ID: <178658862875.45879.9659455953891192280@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260813023016.805573-1-talesam@gmail.com>
In-Reply-To: <20260813023016.805573-1-talesam@gmail.com>
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

Series: drm/xe: fix GuC TLB invalidation ack stalls on ARL (Wa_22016122933)
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
commit f8708fc2a54c324f1b3ca8eb99cd20b5847f69dd
Author: Tales A. Mendonça <talesam@gmail.com>
Date:   Wed Aug 12 23:30:16 2026 -0300

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
    
    Add the OOB workaround scoped like i915 (media version 13.00, media GT
    only - MEDIA_VERSION() OOB rules only match the media GT on standalone
    media platforms) and apply XE_BO_FLAG_NEEDS_UC to the GuC-shared
    allocations the CPU reads from: the CTBs, the GuC log, ADS and the SLPC
    shared data. hwconfig and the G2G buffer are allocated on the primary
    GT only, where the workaround does not apply.
    
    Validation on two ARL machines (7d51 and 7dd1): before, 20-60 TLB
    invalidation ack stalls per day, every day, for weeks, on every kernel
    and on two GuC firmware versions (70.53.0 and 70.72.1). After: zero
    stalls across 6+ days of combined runtime and >5M TLB invalidations
    processed under the same workloads. The second machine, which could not
    survive a day of media workloads on xe without a platform freeze, ran
    34h+ continuously including video transcoding with zero incidents.
    
    Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8678
    Signed-off-by: Tales A. Mendonça <talesam@gmail.com>
+ /mt/dim checkpatch 707b81710802330f08e561e54d174f74abdb10e5 drm-intel
64c6eca650bf drm/xe: Capture devcoredump on TLB invalidation timeout
-:168: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_q' - possible side-effects?
#168: FILE: drivers/gpu/drm/xe/xe_devcoredump.h:34:
+#define xe_devcoredump(_q, _job, _fmt, ...) \
+	__xe_devcoredump((_q)->gt, _q, _job, _fmt, ##__VA_ARGS__)

total: 0 errors, 0 warnings, 1 checks, 184 lines checked
36c3128c8c80 drm/xe: Log when a timed out TLB invalidation ack finally arrives
-:24: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#24: 
  TLB invalidation late ack: seqno=10992 recv=10992, request-to-ack=2314ms, timeout-to-ack=45ms

total: 0 errors, 1 warnings, 0 checks, 66 lines checked
f8708fc2a54c drm/xe: Implement Wa_22016122933


