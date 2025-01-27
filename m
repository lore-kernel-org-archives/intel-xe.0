Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A21AC0218A
	for <intel-xe@archiver.kernel.org>; Mon, 27 Jan 2025 22:22:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35C6010E1CD;
	Mon, 27 Jan 2025 22:22:25 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEEE610E1CD;
 Mon, 27 Jan 2025 22:22:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915=3A_Give_i915_and?=
 =?utf-8?q?_xe_each_their_own_display_tracepoints?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 27 Jan 2025 22:22:23 -0000
Message-ID: <173801654390.1600141.7985403370496719960@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250127213055.640-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20250127213055.640-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915: Give i915 and xe each their own display tracepoints
URL   : https://patchwork.freedesktop.org/series/144006/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 766a3a4561e1c42a0e2edc9a60a976d909582e90
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Mon Jan 27 23:30:55 2025 +0200

    drm/i915: Give i915 and xe each their own display tracepoints
    
    Currently we just define the display tracpoints with
    TRACE_SYSTEM i915. However the code gets included separately
    in i915 and xe, and now both modules are competing for the
    same tracpoints. Apparently whichever module is loaded first
    gets the tracepoints and the other guy is left with nothing.
    
    Give each module its own set of display tracpoints so that
    things work even when both modules are loaded.
    
    This one had me stumped for a bit when after a reboot I lost
    all i915 display tracpoints (on account of the new kernel
    also including xe, and something also ended up loading it
    before I manually loaded i915).
    
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch 3de9463a46e57221df6a0b5f2f5b7f33207d76f7 drm-intel
766a3a4561e1 drm/i915: Give i915 and xe each their own display tracepoints


