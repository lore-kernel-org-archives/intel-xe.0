Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA78C44515
	for <intel-xe@archiver.kernel.org>; Mon, 20 Jul 2026 22:18:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F26B810E207;
	Mon, 20 Jul 2026 22:18:57 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8475310E206;
 Mon, 20 Jul 2026 22:18:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/forcewake=3A_add_d?=
 =?utf-8?q?elayed-release_optimization_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zongyao Bai" <zongyao.bai@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 20 Jul 2026 22:18:56 -0000
Message-ID: <178458593653.209011.6028537581362742543@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260601213804.707256-1-zongyao.bai@intel.com>
In-Reply-To: <20260601213804.707256-1-zongyao.bai@intel.com>
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

Series: drm/xe/forcewake: add delayed-release optimization (rev4)
URL   : https://patchwork.freedesktop.org/series/167697/
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
commit 1fa470c9542fbe0396a3e144845f16ddc2c97cad
Author: Zongyao Bai <zongyao.bai@intel.com>
Date:   Mon Jul 20 22:13:05 2026 +0000

    drm/xe/forcewake: add delayed-release optimization
    
    Add delayed-release optimization:
     - Add domain sleep XE_FORCE_WAKE_HOLD_DELAY_US after xe_force_wake_put()
     - Skip MMIO wake in xe_force_wake_get() if domain still awake.
    Reduces frequent wake/sleep cycles for back-to-back operations.
    Examples of scenarios: zeDeviceGetGlobalTimestamps read by VTune, PTI
    
    v2:
     - Add xe_force_wake_flush() and call it on the runtime/system
       suspend paths to ensure no deferred-sleep runs after GT power-off.
       (Sashiko)
    
    v3:
     - Add configfs for XE_DEFAULT_FORCE_WAKE_HOLD_DELAY_US. (Matt)
     - Modify the default value of forcewake_hold_delay_us to 100. (Maarten)
     - Use guard(spinlock_irqsave) in the delayed-sleep timer callback. (Matt)
     - Drop the redundant refcount WARN in xe_force_wake_fini(). (Matt)
     - Document the spinlock protection of the timer_rearm / timer_domains
       fields, and reorder struct xe_force_wake_domain by member type. (Matt)
    
    v4:
     - Make delayed release opt-in via a new xe_force_wake_put_delay(),
       used only by xe_query.c:query_engine_cycles(); xe_force_wake_put()
       restores immediate sleep-and-ack-wait behavior for all other callers.
       (Matt)
     - Track a pending delayed-release request per domain so the final
       reference drop honors it, regardless of whether that drop happens via
       xe_force_wake_put() or xe_force_wake_put_delay(). (Matt)
    
    Assisted-by: GitHub-Copilot:claude-opus-4.8
    Suggested-by: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
+ /mt/dim checkpatch b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405 drm-intel
1fa470c9542f drm/xe/forcewake: add delayed-release optimization
-:531: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'done' - possible side-effects?
#531: FILE: drivers/gpu/drm/xe/xe_force_wake.h:137:
+#define __xe_with_force_wake_delay(ref, fw, domains, done) \
+	for (CLASS(xe_force_wake_delay, ref)(fw, domains), *(done) = NULL; \
+	     !(done); (done) = (void *)1)

total: 0 errors, 0 warnings, 1 checks, 584 lines checked


