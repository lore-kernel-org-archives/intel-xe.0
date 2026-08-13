Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51BE1C5CFCF
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 00:13:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D985010E480;
	Thu, 13 Aug 2026 00:13:21 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0913610E480;
 Thu, 13 Aug 2026 00:13:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/forcewake=3A_add_d?=
 =?utf-8?q?elayed-release_optimization_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zongyao Bai" <zongyao.bai@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 13 Aug 2026 00:13:21 -0000
Message-ID: <178658000101.45878.3941640198989501329@61270ab9df2a>
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

Series: drm/xe/forcewake: add delayed-release optimization (rev5)
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
commit 41fe5f0484cedabba39f47ff346d9290a8df708c
Author: Zongyao Bai <zongyao.bai@intel.com>
Date:   Thu Aug 13 00:06:54 2026 +0000

    drm/xe/forcewake: enable configurable delayed forcewake release
    
    Enable delayed forcewake release for engine-cycle queries used by
    tools such as VTune and PTI. Bursts of queries can reuse an already
    awake domain, avoiding another wake request and ACK wait. Only
    engine-cycle queries request delayed release; all other forcewake users
    continue to request immediate release.
    
    Add the bind-time configfs forcewake_hold_delay_us attribute to control
    the hold interval. It defaults to 100 us and accepts values from 1 to
    U32_MAX microseconds. Runtime and system suspend cancel and settle
    outstanding delayed releases before power-off. Longer intervals trade
    higher power use for more opportunities to reuse an awake domain.
    
    Suggested-by: Matthew Brost <matthew.brost@intel.com>
    Assisted-by: GitHub-Copilot:gpt-5.6-sol
    Assisted-by: GitHub-Copilot:claude-opus-4.8
    Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
+ /mt/dim checkpatch 707b81710802330f08e561e54d174f74abdb10e5 drm-intel
f7a1ee94feef drm/xe/forcewake: synchronize engine-cycle access with unplug
ee83ee075600 drm/xe/forcewake: add delayed-release state machine
-:372: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'done' - possible side-effects?
#372: FILE: drivers/gpu/drm/xe/xe_force_wake.h:118:
+#define __xe_with_force_wake_delay(ref, fw, domains, done) \
+	for (CLASS(xe_force_wake_delay, ref)(fw, domains), *(done) = NULL; \
+	     !(done); (done) = (void *)1)

total: 0 errors, 0 warnings, 1 checks, 383 lines checked
3487b5031ec3 drm/xe/forcewake: flush delayed release at power boundaries
41fe5f0484ce drm/xe/forcewake: enable configurable delayed forcewake release


