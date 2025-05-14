Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A71C2C3ABD8
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 18:07:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C52810E6CB;
	Wed, 14 May 2025 18:07:38 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E81D10E6CB;
 Wed, 14 May 2025 18:07:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Track_FAST=5FREQ_H2Gs_to_?=
 =?utf-8?q?report_where_errors_came_from_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: john.c.harrison@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 14 May 2025 18:07:37 -0000
Message-ID: <174724605738.80831.5608901989178925062@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250512215324.1457009-1-John.C.Harrison@Intel.com>
In-Reply-To: <20250512215324.1457009-1-John.C.Harrison@Intel.com>
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

Series: Track FAST_REQ H2Gs to report where errors came from (rev2)
URL   : https://patchwork.freedesktop.org/series/148912/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4d61b5a2312c329e97b58faddee256401e1286f4
Author: John Harrison <John.C.Harrison@Intel.com>
Date:   Mon May 12 14:53:24 2025 -0700

    drm/xe/guc: Track FAST_REQ H2Gs to report where errors came from
    
    Most H2G messages are FAST_REQ which means no synchronous response is
    expected. The messages are sent as fire-and-forget with no tracking.
    However, errors can still be returned when something goes unexpectedly
    wrong. That leads to confusion due to not being able to match up the
    error response to the originating H2G.
    
    So add support for tracking the FAST_REQ H2Gs and matching up an error
    response to its originator. This is only enabled in XE_DEBUG builds
    given that such errors should never happen in a working system and
    there is an overhead for the tracking.
    
    Further, if XE_DEBUG_GUC is enabled then even more memory and time is
    used to record the call stack of each H2G and report that with the
    error. That makes it much easier to work out where a specific H2G came
    from if there are multiple code paths that can send it.
    
    v2: Some re-wording of comments and prints, more consistent use of #if
    vs stub functions - review feedback from Daniele & Michal).
    v3: Split config change to separate patch, improve a debug print
    (review feedback from Michal).
    v4: Bunch of minor tweaks (review feedback from Michal).
    
    Original-i915-code: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
    Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch dd6a856541dd90fa4ef755783898fcfbea3b9961 drm-intel
c4ffbb8faa6d drm/xe/guc: Remove double blank line
251adc2e8eac drm/xe/guc: Add missing H2G error code definitions
59e620420226 drm/xe/guc: Rename CONFIG_XE_LARGE_GUC_BUFFER
-:23: WARNING:CONFIG_DESCRIPTION: please write a help paragraph that fully describes the config symbol with at least 4 lines
#23: FILE: drivers/gpu/drm/xe/Kconfig.debug:89:
+config DRM_XE_DEBUG_GUC
+        bool "Enable extra GuC related debug options"
+        depends on DRM_XE_DEBUG
         default n
         help
           Choose this option when debugging guc issues.
+          The GuC log buffer is increased to the maximum allowed, which should
+          The GuC log buffer is increased to the maximum allowed, which should
+          be large enough for complex issues.
 
           Recommended for driver developers only.
 

total: 0 errors, 1 warnings, 0 checks, 25 lines checked
4d61b5a2312c drm/xe/guc: Track FAST_REQ H2Gs to report where errors came from


