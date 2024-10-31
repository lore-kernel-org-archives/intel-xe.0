Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B20FD767FA
	for <intel-xe@archiver.kernel.org>; Thu, 31 Oct 2024 19:02:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2437B10E910;
	Thu, 31 Oct 2024 19:02:01 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85E5A10E913;
 Thu, 31 Oct 2024 19:02:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Restore_system_?=
 =?utf-8?q?memory_GGTT_mappings?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 31 Oct 2024 19:02:00 -0000
Message-ID: <173040132054.1385623.1648793423160935588@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241031182257.2949579-1-matthew.brost@intel.com>
In-Reply-To: <20241031182257.2949579-1-matthew.brost@intel.com>
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

Series: drm/xe: Restore system memory GGTT mappings
URL   : https://patchwork.freedesktop.org/series/140788/
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
commit 5d0146ea76fe994631fd5a4b69b08229dc7b2fcd
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Thu Oct 31 11:22:57 2024 -0700

    drm/xe: Restore system memory GGTT mappings
    
    GGTT mappings reside on the device and this state is lost during suspend
    / d3cold thus this state must be restored resume regardless if the BO is
    in system memory or VRAM.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Matthew Auld <matthew.auld@intel.com>
+ /mt/dim checkpatch b8c3c871a2df70e3201eb70505981d39e449384d drm-intel
5d0146ea76fe drm/xe: Restore system memory GGTT mappings
-:32: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around bo->placements[0]
#32: FILE: drivers/gpu/drm/xe/xe_bo.c:942:
+	struct ttm_place *place = &(bo->placements[0]);

total: 0 errors, 0 warnings, 1 checks, 52 lines checked


