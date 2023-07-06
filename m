Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5170EB64D9
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jul 2023 16:23:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B75310E438;
	Thu,  6 Jul 2023 16:23:14 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3CD1210E443;
 Thu,  6 Jul 2023 16:23:12 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 117BBAADDC;
 Thu,  6 Jul 2023 16:23:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Date: Thu, 06 Jul 2023 16:23:12 -0000
Message-ID: <168866059206.18976.15330409924116786395@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230706161130.520247-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20230706161130.520247-1-maarten.lankhorst@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe=3A_Fix_bo_refcounting_in_intel=5Fframebuffer?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe: Fix bo refcounting in intel_framebuffer
URL   : https://patchwork.freedesktop.org/series/120310/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit bdf42292b4d057e342165a47d14bc023c4fc0592
Author: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date:   Thu Jul 6 18:11:30 2023 +0200

    drm/xe: Fix bo refcounting in intel_framebuffer
    
    Seems we have various confused refcounting mechanisms.
    intel_frontbuffer.c was holding a reference on the bo, but it should be
    handled in the framebuffer.
    
    A few rebases before, there was code that explicitly adds a refcount in
    intel_fb_init, but chunks of that have disappeared. The changes in
    xe_plane_initial are reminders of it.
    
    By adding a refcount, we match how drm_gem_framebuffer_helper handles
    things. In i915, this is opaquely (and accidentally?) handled through
    intel_frontbuffer_get(), not going to duplicate that mistake in xe.
    
    Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
+ /mt/dim checkpatch abcb88850f885254cf7477e1f7a5956136fb547c drm-intel
bdf42292b drm/xe: Fix bo refcounting in intel_framebuffer


