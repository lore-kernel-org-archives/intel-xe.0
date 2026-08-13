Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C12D9C5B572
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 10:32:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EF5D10E35F;
	Thu, 13 Aug 2026 10:32:01 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A7E810E4A5;
 Thu, 13 Aug 2026 10:31:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_PF-mem_VRAM_reg?=
 =?utf-8?q?ions?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 13 Aug 2026 10:31:59 -0000
Message-ID: <178661711962.46919.2353490711690718641@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260813102511.200690-1-piotr.piorkowski@intel.com>
In-Reply-To: <20260813102511.200690-1-piotr.piorkowski@intel.com>
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

Series: Introduce PF-mem VRAM regions
URL   : https://patchwork.freedesktop.org/series/172136/
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
commit 4c639c97e6302b704f18efb89e25ab520f037910
Author: Piotr Piórkowski <piotr.piorkowski@intel.com>
Date:   Thu Aug 13 12:25:11 2026 +0200

    drm/xe/kunit: Add tests for PF-mem regions
    
    Add coverage for PF-mem VRAM region metadata, bounds checking, and
    full, partial, and missing CPU visibility.
    
    Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
+ /mt/dim checkpatch ce212c90b6b1f5c50c99d1ad8770d4e45ea19c98 drm-intel
771ebbe773ed drm/xe/vram: Add binding information to VRAM regions
c7e8599170b0 drm/xe/ttm: Add PF-mem VRAM placement types for TTM
-:82: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i' - possible side-effects?
#82: FILE: drivers/gpu/drm/xe/xe_bo.h:90:
+#define xe_for_each_vram_pl(i) \
+	for (i = XE_PL_VRAM0; i <= XE_PL_VRAM1_PFMEM; i++)

total: 0 errors, 0 warnings, 1 checks, 152 lines checked
28f95be6859a drm/xe/vram: Add initial support for PF-mem regions
4c639c97e630 drm/xe/kunit: Add tests for PF-mem regions
-:15: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#15: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 122 lines checked


