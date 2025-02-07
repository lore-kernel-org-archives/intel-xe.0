Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E63B1C02194
	for <intel-xe@archiver.kernel.org>; Fri,  7 Feb 2025 01:00:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91B5310E22B;
	Fri,  7 Feb 2025 01:00:12 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13CA610E9BF;
 Fri,  7 Feb 2025 01:00:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Cleanup_error_handling_on?=
 =?utf-8?q?_probe_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 07 Feb 2025 01:00:12 -0000
Message-ID: <173889001207.2324859.2219151811402627611@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250206232333.2660325-1-lucas.demarchi@intel.com>
In-Reply-To: <20250206232333.2660325-1-lucas.demarchi@intel.com>
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

Series: Cleanup error handling on probe (rev2)
URL   : https://patchwork.freedesktop.org/series/144211/
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
commit 4b93941d49e5c174e424eb4a2a53c6da93462ca5
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Thu Feb 6 15:23:32 2025 -0800

    drm/xe/hwmon: Stop ignoring errors on probe
    
    Not registering hwmon because it's not available (SRIOV_VF and DGFX) is
    different from failing the initialization. Handle the errors
    appropriately.
    
    Cc: Badal Nilawar <badal.nilawar@intel.com>
    Cc: Karthik Poosa <karthik.poosa@intel.com>
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch f2401c718ce075408a723b147cac70aad2a8246f drm-intel
8100e9c9ec8f drm/xe: Fix xe_display_fini() calls
2781b3fc9d79 drm/xe: Fix error handling in xe_irq_install()
5e5991148684 drm/xe: Fix xe_tile_init_noalloc() error propagation
aa551f79ddfd drm/xe: Stop ignoring errors from xe_ttm_stolen_mgr_init()
1c1960c2559a drm/xe: Remove leftover pxp comment
ac378dd44347 drm/xe: Add callback support for driver remove
-:130: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#130: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 155 lines checked
274da3bf01b7 drm/xe: Cleanup unwind of gt initialization
04261db5a36d drm/xe: Cleanup extra calls to xe_hw_fence_irq_finish()
38ad2b707f73 drm/xe: Move oa fini to xe_oa
6e7efb509022 drm/xe: Move drm_dev_unplug() out of display function
0109c0101d87 drm/xe/oa: Handle errors in xe_oa_register()
a51883dca4ac drm/xe: Fail probe if xe_pmu_register() fails
405b48ac74a3 drm/xe/hwmon: Fix mutex destroy
4b93941d49e5 drm/xe/hwmon: Stop ignoring errors on probe


