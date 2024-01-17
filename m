Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC52BC47DA2
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jan 2024 22:37:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9591C10E8A5;
	Wed, 17 Jan 2024 22:37:47 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71DD110E8A5;
 Wed, 17 Jan 2024 22:37:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Fix_32bit_build?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Wed, 17 Jan 2024 22:37:46 -0000
Message-ID: <170553106646.537693.11404378275195785645@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240116174050.2435923-1-lucas.demarchi@intel.com>
In-Reply-To: <20240116174050.2435923-1-lucas.demarchi@intel.com>
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

Series: Fix 32bit build
URL   : https://patchwork.freedesktop.org/series/128840/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e7f730565356938dd6c63cd498218fdc5d6a22b0
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit aa645e7dd4687a16a082b3d2ca5202ebb3bb4c21
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Tue Jan 16 09:40:50 2024 -0800

    drm/xe: Enable 32bits build
    
    Now that all the issues with 32bits are fixed, enable it again.
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 6002d529f9fe420895d407e481d39b19b58ec001 drm-intel
2e18bf8e6 drm/xe: Use _ULL for u64 division
-:8: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'dd08ebf6c352', maybe rebased or not pulled?
#8: 
Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
f4d580839 drm/xe/mmio: Cast to u64 when printing
-:12: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '286089ce6929', maybe rebased or not pulled?
#12: 
Fixes: 286089ce6929 ("drm/xe: Improve vram info debug printing")

-:29: WARNING:LONG_LINE: line length of 118 exceeds 100 columns
#29: FILE: drivers/gpu/drm/xe/xe_mmio.c:275:
+			 &tile->mem.vram.dpa_base, tile->mem.vram.dpa_base + (u64)tile->mem.vram.actual_physical_size,

-:30: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#30: FILE: drivers/gpu/drm/xe/xe_mmio.c:276:
+			 &tile->mem.vram.io_start, tile->mem.vram.io_start + (u64)tile->mem.vram.io_size);

total: 0 errors, 3 warnings, 0 checks, 10 lines checked
28671885b drm/xe/display: Avoid calling readq()
-:10: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '44e694958b95', maybe rebased or not pulled?
#10: 
Fixes: 44e694958b95 ("drm/xe/display: Implement display support")

total: 0 errors, 1 warnings, 0 checks, 27 lines checked
3777c2542 drm/xe: Fix cast on trace variable
aa645e7dd drm/xe: Enable 32bits build


