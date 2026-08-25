Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0525DC5DF94
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 05:39:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F2C810E011;
	Tue, 25 Aug 2026 05:39:06 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28F9410E011;
 Tue, 25 Aug 2026 05:39:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_PF-mem_VRAM_reg?=
 =?utf-8?q?ions_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 25 Aug 2026 05:39:05 -0000
Message-ID: <178763634516.80981.10520528396394960693@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260824080908.701133-1-piotr.piorkowski@intel.com>
In-Reply-To: <20260824080908.701133-1-piotr.piorkowski@intel.com>
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

Series: Introduce PF-mem VRAM regions (rev3)
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
commit 32632a329c600e60dab241a05d023ccea576df94
Author: Piotr Piórkowski <piotr.piorkowski@intel.com>
Date:   Mon Aug 24 10:09:08 2026 +0200

    drm/xe/kunit: Add tests for PF-mem regions
    
    Add coverage for PF-mem VRAM region metadata, bounds checking, and
    full, partial, and missing CPU visibility.
    
    v2:
     - Use a mock BAR mapping that fits into a pointer on 32-bit builds, where
       SZ_4G truncates to NULL and makes region init fail with -ENOMEM
       (Sashiko).
     - Use a page aligned out-of-bounds offset so the bounds check is actually
       exercised, and cover the unaligned offset/size cases separately
       (Sashiko).
    
    Assisted-by: Claude:claude-5-sonnet
    Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
+ /mt/dim checkpatch 15e2ba2fb6d25c03d89519aec46f8d5be3e118ad drm-intel
83eb00c680b5 drm/xe/vram: Add binding information to VRAM regions
93eae4f52578 drm/xe/ttm: Add PF-mem VRAM placement types for TTM
-:112: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i' - possible side-effects?
#112: FILE: drivers/gpu/drm/xe/xe_bo.h:90:
+#define xe_for_each_vram_pl(i) \
+	for (i = XE_PL_VRAM0; i <= XE_PL_VRAM1_PFMEM; i++)

total: 0 errors, 0 warnings, 1 checks, 197 lines checked
624eed7481cd drm/xe/vram: Add initial support for PF-mem regions
32632a329c60 drm/xe/kunit: Add tests for PF-mem regions
-:24: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#24: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 125 lines checked


