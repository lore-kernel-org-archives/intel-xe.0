Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C74CCFA1A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Nov 2025 14:10:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE3A210E746;
	Wed, 12 Nov 2025 14:10:27 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E1A310E746;
 Wed, 12 Nov 2025 14:10:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_VF_Migration_-_?=
 =?utf-8?q?Xe_internals?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Winiarski, Michal" <michal.winiarski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 12 Nov 2025 14:10:26 -0000
Message-ID: <176295662637.45975.12632662743940781870@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251112132220.516975-1-michal.winiarski@intel.com>
In-Reply-To: <20251112132220.516975-1-michal.winiarski@intel.com>
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

Series: drm/xe: VF Migration - Xe internals
URL   : https://patchwork.freedesktop.org/series/157435/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
d9120d4d84745cf011b4b3efb338747e69179dfb
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 5ebedf295f1e35138ec922f0f3db19934bb39d88
Author: Michał Winiarski <michal.winiarski@intel.com>
Date:   Wed Nov 12 14:22:20 2025 +0100

    drm/intel/bmg: Allow device ID usage with single-argument macros
    
    When INTEL_BMG_G21_IDS were added as a subplatform, token concatenation
    operator usage was omitted, making INTEL_BMG_IDS not usable with
    single-argument macros.
    Fix that by adding the missing operator.
    
    Fixes: 78de8f876683 ("drm/xe: Handle Wa_22010954014 and Wa_14022085890 as device workarounds")
    Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
    Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 0961bffa4c3b59fb4c844f2e5687d876a78938c2 drm-intel
fdc3600f4462 drm/xe/pf: Remove GuC version check for migration support
eba424a64199 drm/xe: Move migration support to device-level struct
-:111: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#111: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 161 lines checked
a87f6d13f748 drm/xe/pf: Convert control state to bitmap
cc4af00f8d8d drm/xe/pf: Add save/restore control state stubs and connect to debugfs
0ee05220d65c drm/xe/pf: Add data structures and handlers for migration rings
-:816: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#816: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 1008 lines checked
13764973291b drm/xe/pf: Add helpers for migration data packet allocation / free
-:164: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#164: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 302 lines checked
f6373bbf9a28 drm/xe/pf: Add support for encap/decap of bitstream to/from packet
4a66d58c1cfb drm/xe/pf: Add minimalistic migration descriptor
032f8d598edd drm/xe/pf: Expose VF migration data size over debugfs
6de0a1ce92cd drm/xe: Add sa/guc_buf_cache sync interface
1f810199bf97 drm/xe: Allow the caller to pass guc_buf_cache size
faf2dbfe107e drm/xe/pf: Increase PF GuC Buffer Cache size and use it for VF migration
a62ae7127d52 drm/xe/pf: Remove GuC migration data save/restore from GT debugfs
5a179edd44b3 drm/xe/pf: Don't save GuC VF migration data on pause
20d22a1c8ebe drm/xe/pf: Switch VF migration GuC save/restore to struct migration data
ccdfee684e37 drm/xe/pf: Handle GuC migration data as part of PF control
9e4e4d0642a3 drm/xe/pf: Add helpers for VF GGTT migration data handling
ac5280eb45a9 drm/xe/pf: Handle GGTT migration data as part of PF control
867a27892b0c drm/xe/pf: Handle MMIO migration data as part of PF control
6457c1b56fc3 drm/xe/pf: Add helper to retrieve VF's LMEM object
1d781182331a drm/xe/migrate: Add function to copy of VRAM data in chunks
862f2cfd0b76 drm/xe/pf: Handle VRAM migration data as part of PF control
3e3eb4729bcc drm/xe/pf: Add wait helper for VF FLR
5ebedf295f1e drm/intel/bmg: Allow device ID usage with single-argument macros


