Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0730E9A02C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 21:01:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 571CF10E61E;
	Wed, 18 Feb 2026 21:01:59 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE1F610E61E;
 Wed, 18 Feb 2026 21:01:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/pf=3A_Allow_to_cha?=
 =?utf-8?q?nge_VFs_VRAM_quota_using_sysfs_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 18 Feb 2026 21:01:57 -0000
Message-ID: <177144851782.262554.18242981952731484102@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260218205553.3561-1-michal.wajdeczko@intel.com>
In-Reply-To: <20260218205553.3561-1-michal.wajdeczko@intel.com>
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

Series: drm/xe/pf: Allow to change VFs VRAM quota using sysfs (rev2)
URL   : https://patchwork.freedesktop.org/series/161625/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 0bcfb956254c9c0513a5a967c14c00d70cb3d26a
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Wed Feb 18 21:55:52 2026 +0100

    drm/xe/pf: Add documentation for vram_quota
    
    Add initial documentation for recently added VRAM provisioning
    Xe driver specific SR-IOV sysfs files under device/sriov_admin.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
+ /mt/dim checkpatch 7ee0795cb4f30c9ccc2b8a580faebcefbdf150c5 drm-intel
928cb435407c drm/xe/pf: Expose LMTT page size
cecde37ee761 drm/xe/pf: Add locked variants of VRAM configuration functions
29ef2f4573cc drm/xe/pf: Add functions for VRAM provisioning
091df93bbd42 drm/xe/pf: Allow to change VFs VRAM quota using sysfs
369b7782a1d9 drm/xe/pf: Use migration-friendly VRAM auto-provisioning
f4dab8737ae3 drm/xe/tests: Add KUnit tests for new VRAM fair provisioning
1bb6674e8734 drm/xe/pf: Don't check for empty config
ea9b1014bd12 drm/xe/pf: Prefer guard(mutex) when doing fair LMEM provisioning
605d2db86047 drm/xe/pf: Skip VRAM auto-provisioning if already provisioned
-:32: WARNING:LINE_SPACING: Missing a blank line after declarations
#32: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:1929:
+	unsigned int allvfs = 1 + xe_gt_sriov_pf_get_totalvfs(gt); /* PF plus VFs */
+	unsigned long *bitmap __free(bitmap) = bitmap_zalloc(allvfs, GFP_KERNEL);

total: 0 errors, 1 warnings, 0 checks, 68 lines checked
0bcfb956254c drm/xe/pf: Add documentation for vram_quota


