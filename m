Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B51BCA5FFF
	for <intel-xe@archiver.kernel.org>; Wed,  7 Oct 2026 21:40:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AF8510E053;
	Wed,  7 Oct 2026 21:40:32 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8839C10E053;
 Wed,  7 Oct 2026 21:40:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Convert_IO=5FBU?=
 =?utf-8?q?S_errors_to_structured_xe=5Flog_API_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dnyaneshwar Bhadane" <dnyaneshwar.bhadane@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 07 Oct 2026 21:40:30 -0000
Message-ID: <179140923055.250136.12562669635528269487@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20261007211417.2093611-1-dnyaneshwar.bhadane@intel.com>
In-Reply-To: <20261007211417.2093611-1-dnyaneshwar.bhadane@intel.com>
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

Series: drm/xe: Convert IO_BUS errors to structured xe_log API (rev5)
URL   : https://patchwork.freedesktop.org/series/172475/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6bef5ce5c74dc76b4ee69ab2832c0d1fd63c91c7
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 6674a1ef7e742710e1ead932ff687e4f9addf81f
Author: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Date:   Thu Oct 8 02:44:17 2026 +0530

    drm/xe/vram: Report VRAM errors using structured xe_log API
    
    Replace few drm_err()/drm_info() with xe_log_err_fatal()/xe_log_info()
    using the VRAM component tag. The "no CPU visible VRAM" error uses
    tile or device as the log location depending on the caller context.
    
    Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
+ /mt/dim checkpatch facc562ab96d7b9fa3dec0528022e0009a5bf875 drm-intel
fcf9141bca99 drm/xe/log: Add VRAM, PAT, and HWMON DRIVER_HARDWARE components
4d517f125644 drm/xe/ggtt: Report GGTT errors using structured logging
778b9b3d426d drm/xe/hwmon: Report errors using structured xe_log API
cb3b1f4ebfaf drm/xe/mmio: Report BAR mapping errors using structured xe_log API
cdfec0c12d65 drm/xe/memirq: Report errors using structured xe_log API
a6a76f3a353a drm/xe/reg_sr: Report save-restore errors using structured xe_log API
336d23a47ec1 drm/xe/pat: Return error from xe_pat_init_early() on unknown platform
c5a408108c99 drm/xe/pat: Report missing PAT table using structured xe_log API
acb8ef3d6aa6 drm/xe/pci: Report unknown GMDID versions using structured xe_log API
8237bea50f30 drm/xe/lmtt: Report invalidation errors using structured xe_log API
4349a4e018bb drm/xe/vram: Report tile vs device VRAM visibility errors
6674a1ef7e74 drm/xe/vram: Report VRAM errors using structured xe_log API
-:52: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#52: FILE: drivers/gpu/drm/xe/xe_vram.c:240:
+	xe_log_info(xe, VRAM, "VRAM[%u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n",
 		 vram->id, &vram->dpa_base, vram->dpa_base + (u64)vram->actual_physical_size,

total: 0 errors, 0 warnings, 1 checks, 66 lines checked


