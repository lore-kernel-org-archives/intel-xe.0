Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 509BCC19F32
	for <intel-xe@archiver.kernel.org>; Wed,  5 Mar 2025 18:50:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 194098979D;
	Wed,  5 Mar 2025 18:50:14 +0000 (UTC)
Received: from 64e06c682a23 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9241E8979D;
 Wed,  5 Mar 2025 18:50:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/display=3A_Fix_fbd?=
 =?utf-8?q?ev_GGTT_mapping_handling=2E_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 05 Mar 2025 18:50:12 -0000
Message-ID: <174120061259.43388.3497233196101924036@64e06c682a23>
X-Patchwork-Hint: ignore
References: <20250305110106.564366-1-dev@lankhorst.se>
In-Reply-To: <20250305110106.564366-1-dev@lankhorst.se>
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

Series: drm/xe/display: Fix fbdev GGTT mapping handling. (rev7)
URL   : https://patchwork.freedesktop.org/series/144602/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
cbb4e4a079d89106c2736adc3c7de6f9dc56da07
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c67048b70e9e1ed705992442a40988d7d6682fd4
Author: Maarten Lankhorst <dev@lankhorst.se>
Date:   Wed Mar 5 12:01:06 2025 +0100

    drm/xe/display: Fix fbdev GGTT mapping handling.
    
    FBDEV ggtt is not restored correctly, add missing GGTT flag to intel_fbdev_fb_alloc to make it work.
    This ensures that the global GGTT mapping is always restored on resume. The GGTT mapping would
    otherwise be created in intel_fb_pin_to_ggtt() by intel_fbdev anyway.
    
    This fixes the fbdev device not working after resume.
    
    Fixes: 67a98f7e27ba ("drm/xe/display: Re-use display vmas when possible")
    Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 7edd877c586b6f7ece771d64061762adcccdfa87 drm-intel
c67048b70e9e drm/xe/display: Fix fbdev GGTT mapping handling.
-:6: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#6: 
FBDEV ggtt is not restored correctly, add missing GGTT flag to intel_fbdev_fb_alloc to make it work.

total: 0 errors, 1 warnings, 0 checks, 16 lines checked


