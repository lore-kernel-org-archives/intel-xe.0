Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C3DC71155
	for <intel-xe@archiver.kernel.org>; Fri, 20 Jun 2025 11:43:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F3B610EB51;
	Fri, 20 Jun 2025 11:43:41 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BB9710EB4F;
 Fri, 20 Jun 2025 11:43:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/wm=3A_reduce_sta?=
 =?utf-8?q?ck_usage_in_skl=5Fprint=5Fwm=5Fchanges=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arnd Bergmann" <arnd@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 20 Jun 2025 11:43:40 -0000
Message-ID: <175041982017.98139.9452131229963022959@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250620113748.3869160-1-arnd@kernel.org>
In-Reply-To: <20250620113748.3869160-1-arnd@kernel.org>
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

Series: drm/i915/wm: reduce stack usage in skl_print_wm_changes()
URL   : https://patchwork.freedesktop.org/series/150564/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f8ff75ae1d2127635239b134695774ed4045d05b
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 87c3264a6eb72ed39f5468f8bc420ac876029036
Author: Arnd Bergmann <arnd@arndb.de>
Date:   Fri Jun 20 13:37:45 2025 +0200

    drm/i915/wm: reduce stack usage in skl_print_wm_changes()
    
    When KMSAN is enabled, this function causes has a rather excessive stack usage:
    
    drivers/gpu/drm/i915/display/skl_watermark.c:2977:1: error: stack frame size (1432) exceeds limit (1408) in 'skl_compute_wm' [-Werror,-Wframe-larger-than]
    
    This is apparently all caused by the varargs calls to drm_dbg_kms(). Inlining
    this into skl_compute_wm() means that any function called by skl_compute_wm()
    has its own stack on top of that.
    
    Move the worst bit into a separate function marked as noinline_for_stack to
    limit that to the one code path that actually needs it.
    
    Signed-off-by: Arnd Bergmann <arnd@arndb.de>
+ /mt/dim checkpatch 1b4be188ae14a43b901f3005075fab3a22f77968 drm-intel
87c3264a6eb7 drm/i915/wm: reduce stack usage in skl_print_wm_changes()
-:6: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#6: 
When KMSAN is enabled, this function causes has a rather excessive stack usage:

total: 0 errors, 1 warnings, 0 checks, 194 lines checked


