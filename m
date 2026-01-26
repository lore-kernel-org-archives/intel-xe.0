Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25616E63C8C
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jan 2026 12:59:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D383910E21E;
	Mon, 26 Jan 2026 12:58:59 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDC7610E21E;
 Mon, 26 Jan 2026 12:58:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Enable_ATS=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 26 Jan 2026 12:58:57 -0000
Message-ID: <176943233784.192609.18224488738586999097@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260126125207.1119351-1-dev@lankhorst.se>
In-Reply-To: <20260126125207.1119351-1-dev@lankhorst.se>
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

Series: drm/xe: Enable ATS.
URL   : https://patchwork.freedesktop.org/series/160645/
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
commit 9a9635013e6cb63c1689fafcd337cfe49821bbac
Author: Maarten Lankhorst <dev@lankhorst.se>
Date:   Mon Jan 26 13:52:07 2026 +0100

    drm/xe: Add migration selftest for validating job submission and basic features work
    
    Add a migration selftest that copies either from local VRAM to sysmem,
    or sysmem to sysmem. The idea is to validate whether accessing VRAM and
    system memory works, so we don't run into slightly harder issues later
    if ATS fails.
    
    TODO: Do we want to run this all the time, put it behind a module
    parameter, or only if DRM_XE_DEBUG_VM is set?
    
    Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
+ /mt/dim checkpatch a1e0224c47409e3c48cfc55a7db0321d22dc343e drm-intel
7257559f3a6e drm/xe: Force page fault
dff21062a1f8 drm/xe: Set the bits in PASID to enable ATS.
9a9635013e6c drm/xe: Add migration selftest for validating job submission and basic features work
-:83: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#83: FILE: drivers/gpu/drm/xe/xe_migrate.c:548:
+	fence = xe_migrate_copy(m, tile_bo, mem_bo, tile_bo->ttm.resource, mem_bo->ttm.resource, false);

total: 0 errors, 1 warnings, 0 checks, 81 lines checked


