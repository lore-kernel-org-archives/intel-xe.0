Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D9DC5AD49
	for <intel-xe@archiver.kernel.org>; Wed,  4 Jun 2025 00:01:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4046010E24F;
	Wed,  4 Jun 2025 00:01:53 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99B2F10E24F;
 Wed,  4 Jun 2025 00:01:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Fixes_for_VF_GuC_version_?=
 =?utf-8?q?=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 04 Jun 2025 00:01:51 -0000
Message-ID: <174899531162.45422.12231055866016612381@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250603235432.720833-6-daniele.ceraolospurio@intel.com>
In-Reply-To: <20250603235432.720833-6-daniele.ceraolospurio@intel.com>
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

Series: Fixes for VF GuC version (rev2)
URL   : https://patchwork.freedesktop.org/series/149613/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ebfe199c0210ebcc10d709fd7db49e892bbb111a
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Tue Jun 3 16:54:37 2025 -0700

    drm/xe/vf: Store the GuC FW info in guc->fw
    
    The GuC compatibility version that we read from the CSS header in
    native/PF and the GuC VF version that we get when a VF handshakes with
    the GuC are the same version number, so we should store it into the same
    structure. This makes all the checks based on the compatibility version
    automatically work for VFs without having to copy the value over.
    
    For completion, also copy the wanted version and set the path to a known
    string to indicate that the FW is PF-loaded. This way all the info will
    be coherent when dumped from debugfs.
    
    v2: several code cleanups and style changes (Michal), rebase on
    bootstrap changes.
    
    v3: s/min/wanted/, clarify that handshake must happen before we can get
    the VF versions (Michal)
    
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Lukasz Laguna <lukasz.laguna@intel.com>
    Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch 2d51392d455943d0356d982902ce994f91996d3e drm-intel
0dd3b8d6926e drm/xe/uc: Prepare uc_fw_version for storing the VF ABI version
ee668fdb641b drm/xe/vf: Boostrap all GTs immediately after MMIO init
f8cceb7e1dd3 drm/xe/vf: Use uc_fw_version to store the negotiated GuC ABI
ebfe199c0210 drm/xe/vf: Store the GuC FW info in guc->fw
-:68: WARNING:RETURN_VOID: void function return statements are not generally useful
#68: FILE: drivers/gpu/drm/xe/xe_gt_sriov_vf.c:294:
+	return;
+}

total: 0 errors, 1 warnings, 0 checks, 133 lines checked


