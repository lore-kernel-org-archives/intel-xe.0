Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF5DC3DA64
	for <intel-xe@archiver.kernel.org>; Tue,  6 Aug 2024 10:56:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A099C10E32C;
	Tue,  6 Aug 2024 10:56:13 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4349D10E32C;
 Tue,  6 Aug 2024 10:56:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/display_suspend/re?=
 =?utf-8?q?sume_fixes=2E_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 06 Aug 2024 10:56:12 -0000
Message-ID: <172294177227.542814.13468905035090894311@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240806105044.596842-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240806105044.596842-1-maarten.lankhorst@linux.intel.com>
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

Series: drm/xe/display suspend/resume fixes. (rev2)
URL   : https://patchwork.freedesktop.org/series/136891/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
66551fd1be58212fb46d0bc97f2e5ae43c69b733
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit fc257f2f910a8d39c606f718d4f1a55b7e046227
Author: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date:   Tue Aug 6 12:50:44 2024 +0200

    drm/xe/display: Make display suspend/resume work on discrete
    
    We should unpin before evicting all memory, and repin after GT resume.
    This way, we preserve the contents of the framebuffers, and won't hang
    on resume due to migration engine not being restored yet.
    
    Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
    Cc: <stable@vger.kernel.org> # v6.8+
+ /mt/dim checkpatch 38af90f98c71935da87b28c0552f32d175352d9f drm-intel
b01587dca39f drm/xe/display: Match i915 driver suspend/resume sequences better
-:12: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#12: 
24b412b1bfeb ("drm/i915: Disable intel HPD poll after DRM poll init/enable")

-:12: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit 24b412b1bfeb ("drm/i915: Disable intel HPD poll after DRM poll init/enable")'
#12: 
24b412b1bfeb ("drm/i915: Disable intel HPD poll after DRM poll init/enable")

-:13: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit 1ef28d86bea9 ("drm/i915: Suspend the framebuffer console earlier during system suspend")'
#13: 
1ef28d86bea9 ("drm/i915: Suspend the framebuffer console earlier during system suspend")

-:14: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit bd738d859e71 ("drm/i915: Prevent modesets during driver init/shutdown")'
#14: 
bd738d859e71 ("drm/i915: Prevent modesets during driver init/shutdown")

total: 3 errors, 1 warnings, 0 checks, 48 lines checked
fc257f2f910a drm/xe/display: Make display suspend/resume work on discrete


