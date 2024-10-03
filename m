Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A505ACF34BB
	for <intel-xe@archiver.kernel.org>; Thu,  3 Oct 2024 16:56:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71E6910E23C;
	Thu,  3 Oct 2024 16:56:31 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 281B510E23C;
 Thu,  3 Oct 2024 16:56:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Reduce_flickeri?=
 =?utf-8?q?ng_when_inheriting_BIOS_fb=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 03 Oct 2024 16:56:30 -0000
Message-ID: <172797459015.1169685.17797348584547822045@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241003154421.33805-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20241003154421.33805-1-maarten.lankhorst@linux.intel.com>
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

Series: drm/xe: Reduce flickering when inheriting BIOS fb.
URL   : https://patchwork.freedesktop.org/series/139516/
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
commit 4718dce252b04e0a5531024295bacfe57f4f44f6
Author: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date:   Thu Oct 3 17:44:21 2024 +0200

    drm/xe: Move struct xe_ggtt to xe_ggtt.c
    
    No users left outside of xe_ggtt.c, so we can make the struct private.
    
    This prevents us from accidentally touching it before init.
    
    Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
+ /mt/dim checkpatch 17c0158bdb239d8b6d23834db5595ea422b69915 drm-intel
76d7456efd8a drm/xe/display: Handle stolen bar readout in the same way as lmem
ffa1365b0434 drm/xe: Remove double pageflip
72a9f074a561 drm/i915/display: Use async flip when available for initial plane config
7288339db3f2 drm/xe/display: Remove single wait for vblank
c499ff2f1cf2 drm/xe: Move suballocator init to after display init
821d2a0e69e0 drm/xe: Use xe_ggtt_map_bo_unlocked for resume
2a7a67143421 drm/xe: Add xe_ggtt_might_lock
028643f94e47 drm/xe: Add xe_ggtt_alloc
-:22: WARNING:LINE_SPACING: Missing a blank line after declarations
#22: FILE: drivers/gpu/drm/xe/xe_ggtt.c:166:
+	struct xe_ggtt *ggtt = drmm_kzalloc(&tile_to_xe(tile)->drm, sizeof(*ggtt), GFP_KERNEL);
+	if (ggtt)

total: 0 errors, 1 warnings, 0 checks, 35 lines checked
58ecc2b1f800 drm/xe: Abstract read/write functions for GGTT PTEs
275263c3b84a drm/xe: Make xe_ggtt_pt_ops private
-:117: CHECK:LINE_SPACING: Please don't use multiple blank lines
#117: FILE: drivers/gpu/drm/xe/xe_ggtt.c:78:
+
+

total: 0 errors, 0 warnings, 1 checks, 137 lines checked
4435f04ceacc drm/xe/display: Stop dereferencing ggtt in xe_fb_pin
4718dce252b0 drm/xe: Move struct xe_ggtt to xe_ggtt.c


