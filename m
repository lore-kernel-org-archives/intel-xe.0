Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46081C47422
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jan 2024 00:19:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F37A110E93D;
	Fri, 19 Jan 2024 00:19:18 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F43810E93D;
 Fri, 19 Jan 2024 00:19:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Fix_32bit_build_=28rev2?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Fri, 19 Jan 2024 00:19:18 -0000
Message-ID: <170562355812.558567.1056164295590359125@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240119001612.2991381-1-lucas.demarchi@intel.com>
In-Reply-To: <20240119001612.2991381-1-lucas.demarchi@intel.com>
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

Series: Fix 32bit build (rev2)
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
commit 2f3415191f07ae8e88a1e87f5a94e2f69c7b5b85
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Thu Jan 18 16:16:12 2024 -0800

    drm/xe: Enable 32bits build
    
    Now that all the issues with 32bits are fixed, enable it again.
    
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch ed982e1f2709684a702b81cc5a0a0811570ab589 drm-intel
6bd6aacf9 drm/xe: Use _ULL for u64 division
-:8: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'dd08ebf6c352', maybe rebased or not pulled?
#8: 
Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
fc201ecd9 drm/xe/mmio: Cast to u64 when printing
-:12: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '286089ce6929', maybe rebased or not pulled?
#12: 
Fixes: 286089ce6929 ("drm/xe: Improve vram info debug printing")

-:30: WARNING:LONG_LINE: line length of 118 exceeds 100 columns
#30: FILE: drivers/gpu/drm/xe/xe_mmio.c:275:
+			 &tile->mem.vram.dpa_base, tile->mem.vram.dpa_base + (u64)tile->mem.vram.actual_physical_size,

-:31: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#31: FILE: drivers/gpu/drm/xe/xe_mmio.c:276:
+			 &tile->mem.vram.io_start, tile->mem.vram.io_start + (u64)tile->mem.vram.io_size);

total: 0 errors, 3 warnings, 0 checks, 10 lines checked
d9daf44e1 drm/xe/display: Avoid calling readq()
-:9: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#9: 
problem is not that big. Migrate to calling memcpy()/memcpy_fromio() to allow

-:15: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '44e694958b95', maybe rebased or not pulled?
#15: 
Fixes: 44e694958b95 ("drm/xe/display: Implement display support")

total: 0 errors, 2 warnings, 0 checks, 28 lines checked
2b506d286 drm/xe: Fix cast on trace variable
2f3415191 drm/xe: Enable 32bits build


