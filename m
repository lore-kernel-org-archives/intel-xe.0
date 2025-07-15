Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 426A7C83F17
	for <intel-xe@archiver.kernel.org>; Tue, 15 Jul 2025 19:20:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0088610E10B;
	Tue, 15 Jul 2025 19:20:59 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D91DD10E642;
 Tue, 15 Jul 2025 19:20:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Enable_SR-IOV_PF_mode_by_?=
 =?utf-8?q?default?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 15 Jul 2025 19:20:57 -0000
Message-ID: <175260725788.164102.17406792177629369790@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250715181419.807-1-michal.wajdeczko@intel.com>
In-Reply-To: <20250715181419.807-1-michal.wajdeczko@intel.com>
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

Series: Enable SR-IOV PF mode by default
URL   : https://patchwork.freedesktop.org/series/151660/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
43254c2aa575037fc031c7ac21b0d031c700b2bf
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 865da55ad0c4b034b7f7cdd2d6bd203302a27ee9
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Tue Jul 15 20:14:18 2025 +0200

    drm/xe: Enable SR-IOV for ADL/ATSM
    
    We should now have sufficient changes in the Xe driver changes to
    run it on ADL and ATSM platforms in the PF mode, to configure VFs
    and successfully probe driver on the enabled VF devices.
    
    While some more changes are likely still needed to fix all corner
    cases, we will not find them without running any tests. To start
    testing this feature by the CI, we need to mark which platforms
    have basic SR-IOV support and let the driver run in the PF mode.
    
    Since this feature support is still in the early testing stage,
    make all enabling available only for CONFIG_DRM_XE_DEBUG=y and
    keep it on CI topic branch.
    
    Note that from this point, on selected platforms, the Xe driver
    will be acting as a PF driver, will some SR-IOV specific changes
    compared to running in the non-virtualized (native) mode.
    
    However, those specific changes are visible mostly on the debugfs,
    and should not impact normal driver execution, unless VFs will be
    manually provisioned or explicitly enabled.
    
    Once we finish adding the remaining SR-IOV tests to the CI and fix
    any issues that we find in the meantime, we will replace this patch
    with proper series outside the topic branch.
    
    Suggested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Acked-by: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
    Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
    Link: https://patchwork.freedesktop.org/patch/msgid/20240711192320.1198-3-michal.wajdeczko@intel.com
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch dbffc39b3c9d2f89b8915bb09660370b4cf13148 drm-intel
d90197ba8c3f Revert "drm/xe: Enable SR-IOV for ADL/ATSM"
bf5261ca24b2 drm/xe/pf: Enable SR-IOV PF mode by default
453f55312ba1 drm/xe/pf: Add max_vfs configfs attribute to control PF mode
865da55ad0c4 drm/xe: Enable SR-IOV for ADL/ATSM
-:39: WARNING:BAD_SIGN_OFF: Duplicate signature
#39: 
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

total: 0 errors, 1 warnings, 0 checks, 28 lines checked


