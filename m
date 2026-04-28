Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B4DBFF885D
	for <intel-xe@archiver.kernel.org>; Tue, 28 Apr 2026 11:52:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FF8410E313;
	Tue, 28 Apr 2026 11:52:26 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0512E10EB38;
 Tue, 28 Apr 2026 11:52:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915=3A_move_more_dis?=
 =?utf-8?q?play_dependencies_from_i915_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Luca Coelho" <luciano.coelho@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 28 Apr 2026 11:52:25 -0000
Message-ID: <177737714501.17344.7357868819431289151@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260428095104.818360-1-luciano.coelho@intel.com>
In-Reply-To: <20260428095104.818360-1-luciano.coelho@intel.com>
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

Series: drm/i915: move more display dependencies from i915 (rev5)
URL   : https://patchwork.freedesktop.org/series/163785/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c8c12e558adaef7a4d125d83b6e1f8824bc13b82
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 64523fe611c3e92a1eb28839fc5a24037f53efd3
Author: Luca Coelho <luciano.coelho@intel.com>
Date:   Tue Apr 28 12:48:26 2026 +0300

    drm/i915: remove HAS_PCH_NOP() dependency from clock gating
    
    intel_pch_init_clock_gating() already handles unsupported PCH types,
    including PCH_NOP, by doing nothing.
    
    Drop the explicit HAS_PCH_NOP() check from the IVB clock gating
    path and always call the display helper directly. This removes one
    more direct dependency on display-side PCH macros from
    intel_clock_gating.c.
    
    Reviewed-by: Jani Nikula <jani.nikula@intel.com>
    Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
+ /mt/dim checkpatch e066eb26712bca7174e694a358351c50a38661d6 drm-intel
1ddc68c6b5b6 drm/i915: move SKL clock gating init to display
-:28: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#28: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 61 lines checked
7d6c61cc4779 drm/i915: move KBL clock gating init to display
6ab33073b138 drm/i915/display: move CFL clock gating init to display
48f2e6fc85d5 drm/i915/display: move BXT clock gating init to display
3b45137d68b5 drm/i915/display: move GLK clock gating init to display
254a6659f1d0 drm/i915/display: move HSW and BDW clock gating init to display
22b6f06ff94b drm/i915/display: move pre-HSW clock gating init to display
64523fe611c3 drm/i915: remove HAS_PCH_NOP() dependency from clock gating


