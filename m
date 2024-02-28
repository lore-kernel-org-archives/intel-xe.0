Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 456FDC5478C
	for <intel-xe@archiver.kernel.org>; Wed, 28 Feb 2024 14:07:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00BE110E3F3;
	Wed, 28 Feb 2024 14:07:59 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B13EE10E424;
 Wed, 28 Feb 2024 14:07:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_Disab?=
 =?utf-8?q?le_AuxCCS_framebuffers_if_built_for_Xe_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 28 Feb 2024 14:07:57 -0000
Message-ID: <170912927772.368864.8505321047347598465@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240228140225.858145-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20240228140225.858145-1-juhapekka.heikkila@gmail.com>
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

Series: drm/i915/display: Disable AuxCCS framebuffers if built for Xe (rev2)
URL   : https://patchwork.freedesktop.org/series/130400/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9ab59fc4b7cb7663906ac4471a262434aef57f03
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 554534263f3d24b3b5ad4bf66498ae9bd8649a97
Author: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date:   Wed Feb 28 16:02:25 2024 +0200

    drm/i915/display: Disable AuxCCS framebuffers if built for Xe
    
    AuxCCS framebuffers don't work on Xe driver hence disable them
    from plane capabilities until they are fixed. FlatCCS framebuffers
    work and they are left enabled. CCS is left untouched for i915
    driver.
    
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/933
    Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
    Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
+ /mt/dim checkpatch 5911a71f0d896bebb7af7cf60d60e0d36c3dde99 drm-intel
554534263f3d drm/i915/display: Disable AuxCCS framebuffers if built for Xe
-:26: WARNING:IS_ENABLED_CONFIG: IS_ENABLED(I915) is normally used as IS_ENABLED(CONFIG_I915)
#26: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:2298:
+	if (!IS_ENABLED(I915) && !HAS_FLAT_CCS(i915))

total: 0 errors, 1 warnings, 0 checks, 9 lines checked


