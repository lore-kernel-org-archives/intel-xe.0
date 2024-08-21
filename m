Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19502C52D6F
	for <intel-xe@archiver.kernel.org>; Wed, 21 Aug 2024 21:05:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD9CC10E47A;
	Wed, 21 Aug 2024 21:05:50 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F41710E489;
 Wed, 21 Aug 2024 21:05:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Alternative_CCS?=
 =?utf-8?q?_fix=2E_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 21 Aug 2024 21:05:49 -0000
Message-ID: <172427434964.722512.6277511132405735388@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240821205637.552424-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240821205637.552424-1-maarten.lankhorst@linux.intel.com>
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

Series: drm/xe: Alternative CCS fix. (rev3)
URL   : https://patchwork.freedesktop.org/series/137591/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9fe5037901cabbcdf27a6fe0dfb047ca1474d363
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 903ad01e1332eec7b637b7fd4fddf195bafe3f7f
Author: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date:   Wed Aug 21 22:59:59 2024 +0200

    drm/i915/display: Allowing looking up invalid modifiers to make xe happy
    
    Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
+ /mt/dim checkpatch e0f8b8a5d8c77e94683451085c62cc54a4d9079d drm-intel
e9441663b2d0 drm/xe: Align all 64k VRAM buffers physically when multiple of 64k.
-:34: WARNING:BAD_SIGN_OFF: Co-developed-by: must be immediately followed by Signed-off-by:
#34: 
Co-developed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>

-:58: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#58: FILE: drivers/gpu/drm/xe/display/intel_fb_bo.c:33:
+	if (XE_IOCTL_DBG(xe, intel_fb_is_ccs_modifier(mode_cmd->modifier[0]) &&
+			     (xe->info.vram_flags & XE_VRAM_FLAGS_DISPLAY_NEED64K_CCS) &&

total: 0 errors, 1 warnings, 1 checks, 50 lines checked
0d60787c5dd6 drm/xe: Use 64K pages for scanout buffers for Battlemage
903ad01e1332 drm/i915/display: Allowing looking up invalid modifiers to make xe happy
-:8: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:18: WARNING:LINE_SPACING: Missing a blank line after declarations
#18: FILE: drivers/gpu/drm/i915/display/intel_fb.c:394:
+	const struct intel_modifier_desc *desc = lookup_modifier_or_null(modifier);
+	if (!desc)

total: 0 errors, 2 warnings, 0 checks, 10 lines checked


