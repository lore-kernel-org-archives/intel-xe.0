Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F6FC55ABA
	for <intel-xe@archiver.kernel.org>; Wed,  5 Aug 2026 12:32:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8A0810EE39;
	Wed,  5 Aug 2026 12:32:46 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B79B510EE39;
 Wed,  5 Aug 2026 12:32:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_diagnostics_and?=
 =?utf-8?q?_workaround_for_GuC_TLB_invalidation_ack_stalls_on_ARL_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Tales_A=2E_Mendon=C3=A7a?= <talesam@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 05 Aug 2026 12:32:45 -0000
Message-ID: <178593316574.21461.12896960442797538743@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260804021441.3054424-1-talesam@gmail.com>
In-Reply-To: <20260804021441.3054424-1-talesam@gmail.com>
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

Series: drm/xe: diagnostics and workaround for GuC TLB invalidation ack stalls on ARL (rev2)
URL   : https://patchwork.freedesktop.org/series/171539/
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
commit 34edb36f8f11bba53549e0a81459f317a6fac286
Author: Tales A. Mendonça <talesam@gmail.com>
Date:   Mon Aug 3 23:14:41 2026 -0300

    drm/xe: Kick GuC while TLB invalidation acks are overdue
    
    On ARL with GuC 70.53.0, TLB invalidation acks intermittently stall:
    the H2G request is consumed from the CTB immediately, but the G2H ack
    only arrives ~2.3s later, tens of milliseconds after the fence timeout
    has fired. During the stall the GPU keeps rendering; only work blocked
    on the invalidation (e.g. Wayland compositors performing buffer
    unmaps) hitches for the full 2.3s. Observed on three machines so far
    (7d51, 7dd1, plus an Arc Pro 130T report), see Link.
    
    Experiments ruled out the obvious suspects:
    
     * GT C6 parking: holding forcewake across the whole GT (C6 residency
       pinned at 0ms) still produced 9 timeouts in a row.
     * Lost interrupt/CT processing on the host: the G2H CTB is empty at
       timeout time; the ack genuinely has not been sent by the firmware.
    
    What does help is poking the GuC while the ack is overdue. Add a
    delayed work that fires XE_TLB_INVAL_KICK_DELAY_MS after an
    invalidation is issued and, while any ack is pending, re-reads the GuC
    status register, flushes the CT fast-path and rings the GuC doorbell
    (xe_guc_notify()), re-arming itself until the ack arrives; the
    existing TDR still bounds the total wait.
    
    Instrumented results from two ARL machines over several days:
    
     * Without kicks: every stall lasts the full ~2.3s and is reported as
       a fence timeout (-ETIME), ~1/hour on a desktop workload.
     * With kicks: the majority of stalls resolve 15-276ms after one of
       the kicks, e.g.:
    
         TLB invalidation ack after kick: seqno=36405 recv=36405, request-to-ack=528ms, last-kick-to-ack=15ms, kicks=2
    
     * A minority of severe episodes ignore 8-9 consecutive doorbells and
       still run to the timeout (worst observed: ack 5996ms after request,
       3.7s after the last kick), suggesting the firmware is internally
       blocked for the whole window rather than missing a wake event.
    
    This is a workaround, not a fix - the root cause looks like a GuC
    firmware issue - but it turns a guaranteed 2.3s stall into a sub-500ms
    hiccup for most occurrences, and the "ack after kick" log documents
    the firmware behavior for further debugging.
    
    Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8678
    Signed-off-by: Tales A. Mendonça <talesam@gmail.com>
+ /mt/dim checkpatch 4c13a67db118ee0019231dbc1362bcb8115ac660 drm-intel
cc6ee7dbdd9a drm/xe: Capture devcoredump on TLB invalidation timeout
d5341199c3eb drm/xe: Log when a timed out TLB invalidation ack finally arrives
-:24: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#24: 
  TLB invalidation late ack: seqno=10992 recv=10992, request-to-ack=2314ms, timeout-to-ack=45ms

total: 0 errors, 1 warnings, 0 checks, 57 lines checked
34edb36f8f11 drm/xe: Kick GuC while TLB invalidation acks are overdue
-:38: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#38: 
     TLB invalidation ack after kick: seqno=36405 recv=36405, request-to-ack=528ms, last-kick-to-ack=15ms, kicks=2

total: 0 errors, 1 warnings, 0 checks, 194 lines checked


