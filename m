Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83643CC6B2A
	for <intel-xe@archiver.kernel.org>; Sat, 17 Oct 2026 03:25:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0773010E218;
	Sat, 17 Oct 2026 03:25:39 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8033710E1F9;
 Sat, 17 Oct 2026 03:25:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/forcewake=3A_add_d?=
 =?utf-8?q?elayed_release_for_engine-cycle_queries?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zongyao Bai" <zongyao.bai@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 17 Oct 2026 03:25:38 -0000
Message-ID: <179220753851.36666.16019993305285378182@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261017031856.2723986-1-zongyao.bai@intel.com>
In-Reply-To: <20261017031856.2723986-1-zongyao.bai@intel.com>
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

Series: drm/xe/forcewake: add delayed release for engine-cycle queries
URL   : https://patchwork.freedesktop.org/series/176324/
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
commit b5beca4050ff309dbe33925729579bcff1a7e9e3
Author: Zongyao Bai <zongyao.bai@intel.com>
Date:   Sat Oct 17 03:18:56 2026 +0000

    drm/xe/query: use delayed forcewake release for engine-cycle queries
    
    Engine-cycle queries are issued repeatedly by profilers such as VTune and
    PTI to correlate CPU and GPU timestamps, for example through Level Zero
    zeDeviceGetGlobalTimestamps(). Each query wakes the engine forcewake
    domain and puts it to sleep again, and waiting for both acknowledgments
    dominates the latency.
    
    Release the domain with xe_force_wake_put_delay() so that a burst of
    queries reuses the awake domain instead of waking it again. Other forcewake
    users keep releasing immediately.
    
    Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
+ /mt/dim checkpatch 173c9ebb628f22cdfb18e080e0ef46b728649f89 drm-intel
c406eb511f73 drm/xe/forcewake: add delayed release with hysteresis
-:310: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'done' - possible side-effects?
#310: FILE: drivers/gpu/drm/xe/xe_force_wake.h:116:
+#define __xe_with_force_wake_delay(ref, fw, domains, done) \
+	for (CLASS(xe_force_wake_delay, ref)(fw, domains), *(done) = NULL; \
+	     !(done); (done) = (void *)1)

total: 0 errors, 0 warnings, 1 checks, 327 lines checked
a758900e8cf0 drm/xe/forcewake: flush delayed release at power and teardown boundaries
b5beca4050ff drm/xe/query: use delayed forcewake release for engine-cycle queries


