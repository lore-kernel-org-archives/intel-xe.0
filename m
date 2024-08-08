Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE97C52D73
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 07:06:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89BA710E669;
	Thu,  8 Aug 2024 07:06:52 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3095710E66F;
 Thu,  8 Aug 2024 07:06:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/display_suspend/re?=
 =?utf-8?q?sume_fixes=2E_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 08 Aug 2024 07:06:51 -0000
Message-ID: <172310081119.548969.17999095542977239306@2413ebb6fbb6>
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

Series: drm/xe/display suspend/resume fixes. (rev3)
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
commit ef8fb64940cd0377f7d667829b547406769b16e7
Author: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date:   Tue Aug 6 12:50:44 2024 +0200

    drm/xe/display: Make display suspend/resume work on discrete
    
    We should unpin before evicting all memory, and repin after GT resume.
    This way, we preserve the contents of the framebuffers, and won't hang
    on resume due to migration engine not being restored yet.
    
    Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
    Cc: <stable@vger.kernel.org> # v6.8+
+ /mt/dim checkpatch 4f5d551409fb5562ab0d732120e7ac9b698b5864 drm-intel
c914c579ac3c drm/xe/display: Match i915 driver suspend/resume sequences better
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
ef8fb64940cd drm/xe/display: Make display suspend/resume work on discrete


