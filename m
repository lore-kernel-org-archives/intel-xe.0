Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE013C44507
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jul 2026 23:35:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6751C10E26B;
	Wed, 15 Jul 2026 23:35:20 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3AF510E26B;
 Wed, 15 Jul 2026 23:35:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/xe/wopcm=3A_Use_the_size_from_HW_when_excluding_the_wop?=
 =?utf-8?q?cm_range_from_GGTT?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 15 Jul 2026 23:35:18 -0000
Message-ID: <178415851899.193149.5844878432785142918@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260715232845.3644281-3-daniele.ceraolospurio@intel.com>
In-Reply-To: <20260715232845.3644281-3-daniele.ceraolospurio@intel.com>
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

Series: series starting with [1/2] drm/xe/wopcm: Use the size from HW when excluding the wopcm range from GGTT
URL   : https://patchwork.freedesktop.org/series/170516/
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
commit daed3d59a898b45d33bc2d7ffd7f792dad356841
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Wed Jul 15 16:28:45 2026 -0700

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
    is the uC init, we can move the code in the xe_uc.c file. The
    documentation has also been dropped, both because it's wrong for
    platforms officially supported by the Xe driver (the WOPCM is now shared
    by root and media GTs and the GSC FW is also stored there) and because we
    don't use the layout anymore so we don't really care.
    
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Shuicheng Lin <shuicheng.lin@intel.com>
    Cc: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch 30d669bb45c300a1f1fc0f6201e14ad8679ef03c drm-intel
168e36ba9cb0 drm/xe/wopcm: Use the size from HW when excluding the wopcm range from GGTT
daed3d59a898 drm/xe/wopcm: Simplify GuC WOPCM programming
-:351: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#351: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 267 lines checked


