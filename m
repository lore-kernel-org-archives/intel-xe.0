Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B7EC5B549
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 00:12:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E90C10E794;
	Thu,  5 Jun 2025 00:12:21 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 872C410E276;
 Thu,  5 Jun 2025 00:12:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Fixes_for_VF_GuC_version_?=
 =?utf-8?q?=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Jun 2025 00:12:20 -0000
Message-ID: <174908234054.49780.11041248284938075775@1538d3639d33>
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

Series: Fixes for VF GuC version (rev3)
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
commit e81ddb9ce242ab2fef9f11e4f1154a732af1b327
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
+ /mt/dim checkpatch 9becf23dcd5721a2ddb80f01d4964a1657117f11 drm-intel
2bc3c493ee20 drm/xe/uc: Prepare uc_fw_version for storing the VF ABI version
d754c54ca8c8 drm/xe/vf: Boostrap all GTs immediately after MMIO init
8857e82ed4aa drm/xe/vf: Use uc_fw_version to store the negotiated GuC ABI
e81ddb9ce242 drm/xe/vf: Store the GuC FW info in guc->fw
-:68: WARNING:RETURN_VOID: void function return statements are not generally useful
#68: FILE: drivers/gpu/drm/xe/xe_gt_sriov_vf.c:294:
+	return;
+}

total: 0 errors, 1 warnings, 0 checks, 133 lines checked


