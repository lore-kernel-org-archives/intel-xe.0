Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88D98D2FFFF
	for <intel-xe@archiver.kernel.org>; Fri, 18 Oct 2024 12:16:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 542B510E8FB;
	Fri, 18 Oct 2024 12:16:48 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9864E10E8FB;
 Fri, 18 Oct 2024 12:16:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Fix_initial_fra?=
 =?utf-8?q?mebuffer_handover=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 18 Oct 2024 12:16:47 -0000
Message-ID: <172925380761.1281889.13694483306427909702@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241018121123.5351-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20241018121123.5351-1-maarten.lankhorst@linux.intel.com>
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

Series: drm/xe: Fix initial framebuffer handover.
URL   : https://patchwork.freedesktop.org/series/140165/
State : warning

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
commit 0567e56b1d7a886b88cb5758818972b2b885637b
Author: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date:   Fri Oct 18 14:11:23 2024 +0200

    drm/xe: Initialise display before GT and tile init
    
    Display needs to be initialised first, because we need to preserve the
    initial framebuffer. It will be overwritten by any allocation we do,
    especially on discrete where the framebuffer is not in stolen memory.
    
    On integrated even if we still recover the initial framebuffer after
    allocating, it still shows up as temporary corruption on-screen.
    
    Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
+ /mt/dim checkpatch c1837d4e9af4e9df3109960341105c035b441667 drm-intel
2ba0b8bbc85d drm/xe: Remove double pageflip
ba24514f1999 drm/i915/display: Use async flip when available for initial plane config
b5528b7822cf drm/xe: Move suballocator init to after display init
0567e56b1d7a drm/xe: Initialise display before GT and tile init
-:99: WARNING:LINE_SPACING: Missing a blank line after declarations
#99: FILE: drivers/gpu/drm/xe/xe_gt.c:549:
+	unsigned int fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (!fw_ref)

total: 0 errors, 1 warnings, 0 checks, 90 lines checked


