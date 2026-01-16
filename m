Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27B88C982CA
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jan 2026 15:00:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1B4810E8C6;
	Fri, 16 Jan 2026 15:00:30 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F06B10E8BE;
 Fri, 16 Jan 2026 15:00:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/=7Bi915=2C_xe=7D/dsb?=
 =?utf-8?q?=3A_move_DSB_buffer_calls_to_parent_interface?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 16 Jan 2026 15:00:30 -0000
Message-ID: <176857563058.162148.6328401776649107342@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <cover.1768575249.git.jani.nikula@intel.com>
In-Reply-To: <cover.1768575249.git.jani.nikula@intel.com>
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

Series: drm/{i915, xe}/dsb: move DSB buffer calls to parent interface
URL   : https://patchwork.freedesktop.org/series/160198/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
ee83616c430ce70bd254bd2774d143a5733c8666
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 57d7a44b0df98858fae633d820deff2d0dcf2f11
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Fri Jan 16 16:54:41 2026 +0200

    drm/{i915,xe}/dsb: move DSB buffer to parent interface
    
    Move the DSB buffer handling to the display parent interface, making
    display more independent of i915 and xe driver implementations.
    
    Since the DSB parent interface is only called from intel_dsb.c, add the
    wrappers there with smaller visibility instead of the usual
    intel_parent.[ch], and using struct intel_dsb as the context parameter
    for convenience.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch eaf341ec50e661b2c81347e4bb9f3348b7fea5b9 drm-intel
49fca73b0a5e drm/i915/dsb: move i915 specific DSB buffer implementation to i915
-:34: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#34: 
rename from drivers/gpu/drm/i915/display/intel_dsb_buffer.c

total: 0 errors, 1 warnings, 0 checks, 26 lines checked
57d7a44b0df9 drm/{i915,xe}/dsb: move DSB buffer to parent interface
-:217: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#217: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 408 lines checked


