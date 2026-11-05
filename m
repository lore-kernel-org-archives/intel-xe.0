Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C986E606A326
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 02:00:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8690B10E0F0;
	Thu,  5 Nov 2026 02:00:45 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C8B110E0F0;
 Thu,  5 Nov 2026 02:00:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5Bv?=
 =?utf-8?q?2=2C1/2=5D_drm/xe/wopcm=3A_Use_the_size_from_HW_when_excluding_th?=
 =?utf-8?q?e_wopcm_range_from_GGTT?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Nov 2026 02:00:44 -0000
Message-ID: <179384404411.121942.17548540214843373772@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261105004254.262075-3-daniele.ceraolospurio@intel.com>
In-Reply-To: <20261105004254.262075-3-daniele.ceraolospurio@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

== Series Details ==

Series: series starting with [v2,1/2] drm/xe/wopcm: Use the size from HW when excluding the wopcm range from GGTT
URL   : https://patchwork.freedesktop.org/series/177807/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
3009867cd31863246e4afc138520a7a8bd37bb11
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit f03c59a74d3459d6e83a448eef4d79c9bd99f726
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Thu Nov 5 00:42:54 2026 +0000

    drm/xe/wopcm: Simplify GuC WOPCM programming
    
    Starting from PVC, the GuC WOPCM registers are programmed by BIOS/IFWI,
    which is a trusted entity, so we don't really need to double-check the
    programmed values; therefore, if we find the WOPCM registers already
    locked we can just return early and keep going.
    For legacy platform (which are not officially supported by the Xe
    driver), we still need to do the math ourselves.
    By switching to use the WOPCM size from the HW instead of using an
    hardcoded value, we make it impossible for the programming to end up
    incorrect when using the official binaries (because those are sized so
    that they're guaranteed to fit), so in this case we can drop the layout
    check as well. If a malicious user is using modified binaries, we'll
    still catch the error and fail at either parse or load time.
    
    Given these simplifications and the fact that the only user left for this
    is the uC code, we can move the code in the xe_uc.c file. As part of
    this, the wopcm re-programming post-reset/resume has been moved from
    do_gt_restart to xe_uc_load_hw.
    The documentation has also been dropped, both because it's wrong for
    platforms officially supported by the Xe driver (the WOPCM is now shared
    by root and media GTs and the GSC FW is also stored there) and because we
    don't use the layout anymore so we don't really care.
    
    v2: Don't check against the WOPCM size on VFs, rework WOPCM base and
    size log to not look like base and end.
    
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Shuicheng Lin <shuicheng.lin@intel.com>
    Cc: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch 3379b0f74f31bfc3746b692822a7700aeeebe15d drm-intel
0602f742012e drm/xe/wopcm: Use the size from HW when excluding the wopcm range from GGTT
f03c59a74d34 drm/xe/wopcm: Simplify GuC WOPCM programming
-:358: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#358: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 269 lines checked


