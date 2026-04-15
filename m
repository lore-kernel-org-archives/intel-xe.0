Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FCDFFA0C30
	for <intel-xe@archiver.kernel.org>; Wed, 15 Apr 2026 05:49:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E00D310E0F5;
	Wed, 15 Apr 2026 05:49:19 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D75210E0F5;
 Wed, 15 Apr 2026 05:49:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_PSR2_SDP_on_Prior_Scanlin?=
 =?utf-8?q?e_workarounds?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 15 Apr 2026 05:49:19 -0000
Message-ID: <177623215916.463073.3282308908552866482@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260415054000.400070-1-jouni.hogander@intel.com>
In-Reply-To: <20260415054000.400070-1-jouni.hogander@intel.com>
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

Series: PSR2 SDP on Prior Scanline workarounds
URL   : https://patchwork.freedesktop.org/series/164901/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit f1567c2b1ef408c9d929879bf740d6cc8b428a63
Author: Jouni Högander <jouni.hogander@intel.com>
Date:   Wed Apr 15 08:40:00 2026 +0300

    drm/i915/psr: Apply SDP on prior scanline workaround for NVL
    
    In NVL there is an HW optimization done. When there is an SU triggered in
    Capture state, Link will be kept ON post Capture CRC SDP. Before valid SU
    pixels Intel source will transmit dummy pixels. Some TCONS are improperly
    considering these dummy pixels as a valid pixel data. Prior NVL link was
    was turned of even if there was SU triggered in Capture state and no dummy
    pixels were transmitted. These dummy pixels are problem only if SDP on
    prior scanline is used and Early Transport is not in use. The workaround is
    to start SU area always at scanline 0.
    
    Bspec: 74741, 79482
    Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
+ /mt/dim checkpatch 19fc8405447f8b93c3fb0a341c00c2ffc6b05c4a drm-intel
417ca0059409 drm/i915/psr: Add defininitions for INTEL_WA_REGISTER_CAPS DPCD register
-:36: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#36: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 15 lines checked
59a7936b759c drm/i915/psr: Read Intel DPCD workaround register
8f994d3b74e2 drm/i915/psr: Apply Intel DPCD workaround when SDP on prior line used
-:38: ERROR:OPEN_BRACE: that open brace { should be on the previous line
#38: FILE: drivers/gpu/drm/i915/display/intel_psr.c:1398:
+	switch(early_scanline_support)
+	{

-:38: ERROR:SPACING: space required before the open parenthesis '('
#38: FILE: drivers/gpu/drm/i915/display/intel_psr.c:1398:
+	switch(early_scanline_support)

total: 2 errors, 0 warnings, 0 checks, 55 lines checked
f1567c2b1ef4 drm/i915/psr: Apply SDP on prior scanline workaround for NVL


