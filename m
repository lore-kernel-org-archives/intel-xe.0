Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46BF8C021B3
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 03:20:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E2E610EA18;
	Fri, 21 Feb 2025 03:20:01 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4425810EA18;
 Fri, 21 Feb 2025 03:20:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/guc=3A_Track_FAST?=
 =?utf-8?q?=5FREQ_H2Gs_to_report_where_errors_came_from?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: john.c.harrison@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 21 Feb 2025 03:20:00 -0000
Message-ID: <174010800027.357311.17099463968785140530@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250221031444.3820965-1-John.C.Harrison@Intel.com>
In-Reply-To: <20250221031444.3820965-1-John.C.Harrison@Intel.com>
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

Series: drm/xe/guc: Track FAST_REQ H2Gs to report where errors came from
URL   : https://patchwork.freedesktop.org/series/145205/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 75c93c63ac1a37a6e943611fba0f2fbdf224c9cc
Author: John Harrison <John.C.Harrison@Intel.com>
Date:   Thu Feb 20 19:14:44 2025 -0800

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
    used to record the call stack of each H2G and report that with an
    error. That makes it much easier to work out where a specific H2G came
    from if there are multiple code paths that can send it.
    
    Note, rather than create an extra Kconfig define for just this
    feature, the XE_LARGE_GUC_BUFFER option has been re-used and renamed
    to XE_DEBUG_GUC and is now just a general purpose 'verbose GuC debug'
    option.
    
    Lastly, add a define to document FAST_REQ error 0x30C as being the
    error most recently hit. Not sure why it was previously missing.
    
    Original-i915-code: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
+ /mt/dim checkpatch 773b5639a9ff0a33feccb29de7f2d852c6d7f221 drm-intel
75c93c63ac1a drm/xe/guc: Track FAST_REQ H2Gs to report where errors came from
-:44: WARNING:CONFIG_DESCRIPTION: please write a help paragraph that fully describes the config symbol
#44: FILE: drivers/gpu/drm/xe/Kconfig.debug:89:
+config DRM_XE_DEBUG_GUC
+        bool "Enable extra GuC related debug options"
+        depends on DRM_XE_DEBUG
         default n
+        select STACKDEPOT
         help
           Choose this option when debugging guc issues.
+          The GuC log buffer is increased to the maximum allowed, which should
+          The GuC log buffer is increased to the maximum allowed, which should
+          be large enough for complex issues. It also enables recording of the
+          stack when tracking FAST_REQ messages.
 
           Recommended for driver developers only.
 

total: 0 errors, 1 warnings, 0 checks, 203 lines checked


