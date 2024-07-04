Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE27C30653
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jul 2024 13:10:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1B2A10E06C;
	Thu,  4 Jul 2024 13:10:16 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0422910E06C;
 Thu,  4 Jul 2024 13:10:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Enable_SR-IOV_f?=
 =?utf-8?q?or_ADL/ATSM?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 04 Jul 2024 13:10:16 -0000
Message-ID: <172009861601.29225.1522303031922637180@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240704130415.1066-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240704130415.1066-1-michal.wajdeczko@intel.com>
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

Series: drm/xe: Enable SR-IOV for ADL/ATSM
URL   : https://patchwork.freedesktop.org/series/135760/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit aa1766f10c8064f3e5a7a6fe576a417a99e7efed
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Thu Jul 4 15:04:15 2024 +0200

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
    Link: https://patchwork.freedesktop.org/patch/600604/?series=135296&rev=1
+ /mt/dim checkpatch 2bf4c5214910654a6a50082c90f0f4596ea6b0c6 drm-intel
aa1766f10c80 drm/xe: Enable SR-IOV for ADL/ATSM


