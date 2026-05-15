Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECD77CD4851
	for <intel-xe@archiver.kernel.org>; Fri, 15 May 2026 10:03:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A918B10F4D2;
	Fri, 15 May 2026 10:03:57 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF8D510F4D2;
 Fri, 15 May 2026 10:03:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_PSR2_SDP_on_Prior_Scanlin?=
 =?utf-8?q?e_workarounds_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 15 May 2026 10:03:55 -0000
Message-ID: <177883943590.74821.17253978824463504182@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260515095756.2799483-1-jouni.hogander@intel.com>
In-Reply-To: <20260515095756.2799483-1-jouni.hogander@intel.com>
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

Series: PSR2 SDP on Prior Scanline workarounds (rev2)
URL   : https://patchwork.freedesktop.org/series/164901/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 2d2a4ad0357495024b5b6f38e8fd85cfd47b3c50
Author: Jouni Högander <jouni.hogander@intel.com>
Date:   Fri May 15 12:57:56 2026 +0300

    drm/i915/psr: Apply SDP on prior scanline workaround for Xe3p
    
    In Xe3p there is an HW optimization done. When there is an SU triggered in
    Capture state, Link will be kept ON post Capture CRC SDP. Before valid SU
    pixels Intel source will transmit dummy pixels. Some TCONS are improperly
    considering these dummy pixels as a valid pixel data. Prior Xe3p link was
    was turned off even if there was SU triggered in capture state and no dummy
    pixels were transmitted. These dummy pixels are problem only if SDP on
    prior scanline is used and Early Transport is not in use. The workaround is
    to start SU area always at scanline 0.
    
    v2: use intel_display_wa
    
    Bspec: 74741, 79482
    Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
+ /mt/dim checkpatch b9819223b7e92173091b674c2212252b99ea6c4b drm-intel
b3b08cdbfb22 drm/i915/psr: Add defininitions for INTEL_WA_REGISTER_CAPS DPCD register
-:39: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#39: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 15 lines checked
d9169e76bb5e drm/i915/psr: Read Intel DPCD workaround register
d9ec1b0e50e1 drm/i915/psr: Apply Intel DPCD workaround when SDP on prior line used
2d2a4ad03574 drm/i915/psr: Apply SDP on prior scanline workaround for Xe3p


