Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A6EC02198
	for <intel-xe@archiver.kernel.org>; Wed, 12 Feb 2025 23:05:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24D8010E2D1;
	Wed, 12 Feb 2025 23:05:29 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B0BA10E2D1;
 Wed, 12 Feb 2025 23:05:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Cleanup_error_handling_on?=
 =?utf-8?q?_probe_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 12 Feb 2025 23:05:28 -0000
Message-ID: <173940152843.1452601.7181207390767218210@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250212193600.475089-1-lucas.demarchi@intel.com>
In-Reply-To: <20250212193600.475089-1-lucas.demarchi@intel.com>
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

Series: Cleanup error handling on probe (rev4)
URL   : https://patchwork.freedesktop.org/series/144211/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit df1816ccafadfcd630b2c498e2ed59ebef1d0d71
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Wed Feb 12 11:36:00 2025 -0800

    drm/xe/hwmon: Stop ignoring errors on probe
    
    Not registering hwmon because it's not available (SRIOV_VF and DGFX) is
    different from failing the initialization. Handle the errors
    appropriately.
    
    Cc: Badal Nilawar <badal.nilawar@intel.com>
    Cc: Karthik Poosa <karthik.poosa@intel.com>
    Reviewed-by: Raag Jadav <raag.jadav@intel.com>
    Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch fd03884f35d18372b0f7abb2fd33c55cee599bc3 drm-intel
6239c132d025 drm/xe: Add callback support for driver remove
d78c0d0ecbb4 drm/xe: Fix xe_display_fini() calls
e275c3a80220 drm/xe: Fix error handling in xe_irq_install()
46735dbcc491 drm/xe: Fix xe_tile_init_noalloc() error propagation
833aba3ef616 drm/xe: Stop ignoring errors from xe_ttm_stolen_mgr_init()
23858c9bedd9 drm/xe: Remove leftover pxp comment
cb8f5cad56a2 drm/xe: Cleanup unwind of gt initialization
2578ea8beb9c drm/xe: Cleanup extra calls to xe_hw_fence_irq_finish()
a52859de774e drm/xe/oa: Move fini to xe_oa
652528572ca1 drm/xe: Move drm_dev_unplug() out of display function
e7ec773eea6b drm/xe/oa: Handle errors in xe_oa_register()
c8fd7c166cda drm/xe/pmu: Fail probe if xe_pmu_register() fails
df1816ccafad drm/xe/hwmon: Stop ignoring errors on probe


