Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F19FC36008
	for <intel-xe@archiver.kernel.org>; Wed, 26 Mar 2025 20:07:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C729F10E73C;
	Wed, 26 Mar 2025 20:07:46 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47D8610E736;
 Wed, 26 Mar 2025 20:07:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Track_FAST=5FREQ_H2Gs_to_?=
 =?utf-8?q?report_where_errors_came_from?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: john.c.harrison@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 26 Mar 2025 20:07:45 -0000
Message-ID: <174301966529.7555.4276343170541069972@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250326193240.4165833-1-John.C.Harrison@Intel.com>
In-Reply-To: <20250326193240.4165833-1-John.C.Harrison@Intel.com>
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

Series: Track FAST_REQ H2Gs to report where errors came from
URL   : https://patchwork.freedesktop.org/series/146827/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
99e5a866b5e13f134e606a3e29d9508d97826fb3
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c756856342bf54bcae8c3ce4b1878903385557a0
Author: John Harrison <John.C.Harrison@Intel.com>
Date:   Wed Mar 26 12:32:39 2025 -0700

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
    
    Note, rather than create an extra Kconfig define for just this
    feature, the XE_LARGE_GUC_BUFFER option has been re-used and renamed
    to XE_DEBUG_GUC and is now just a general purpose 'verbose GuC debug'
    option.
    
    v2: Some re-wording of comments and prints, more consistent use of #if
    vs stub functions - review feedback from Daniele & Michal).
    
    Original-i915-code: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
    Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
+ /mt/dim checkpatch 14c330bc015ded4a1f1dd1f5aeb8617077aaa7e8 drm-intel
abdba12da3e4 drm/xe/guc: Add a missing H2G error code definition
c756856342bf drm/xe/guc: Track FAST_REQ H2Gs to report where errors came from
-:45: WARNING:CONFIG_DESCRIPTION: please write a help paragraph that fully describes the config symbol
#45: FILE: drivers/gpu/drm/xe/Kconfig.debug:89:
+config DRM_XE_DEBUG_GUC
+        bool "Enable extra GuC related debug options"
+        depends on DRM_XE_DEBUG
         default n
+        select STACKDEPOT
         help
           Choose this option when debugging guc issues.
+          The GuC log buffer is increased to the maximum allowed, which should
+          The GuC log buffer is increased to the maximum allowed, which should
+          be large enough for complex issues. This config also enables
+          recording of the stack when tracking FAST_REQ messages.
 
           Recommended for driver developers only.
 

total: 0 errors, 1 warnings, 0 checks, 199 lines checked


