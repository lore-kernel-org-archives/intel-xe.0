Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58884CAC5B0
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 17:36:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14F5910E156;
	Thu,  2 Oct 2025 17:36:32 +0000 (UTC)
Received: from 6aec98b87f92 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E809010E1CC;
 Thu,  2 Oct 2025 17:36:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Don=27t_force_D?=
 =?utf-8?q?RM=5FXE=5FDEBUG=5FMEMIRQ_for_SR-IOV_debug?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 02 Oct 2025 17:36:30 -0000
Message-ID: <175942659093.49.1473574993023011542@6aec98b87f92>
X-Patchwork-Hint: ignore
References: <20251002171308.203127-1-michal.wajdeczko@intel.com>
In-Reply-To: <20251002171308.203127-1-michal.wajdeczko@intel.com>
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

Series: drm/xe: Don't force DRM_XE_DEBUG_MEMIRQ for SR-IOV debug
URL   : https://patchwork.freedesktop.org/series/155343/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fbd08a78c3a3bb17964db2a326514c69c1dca660
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a65cc1a4c58b1dcd87e3726ebb684f9352664730
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Thu Oct 2 19:13:08 2025 +0200

    drm/xe: Don't force DRM_XE_DEBUG_MEMIRQ for SR-IOV debug
    
    For pure SR-IOV debugging there is no need to select already
    separated config for the debugging of the memory based interrupts,
    as the latter is also very noisy on its own. Change config order
    and use a weak reverse dependency instead.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
+ /mt/dim checkpatch b4baf08e066056e713400291abaa3bde646580fe drm-intel
a65cc1a4c58b drm/xe: Don't force DRM_XE_DEBUG_MEMIRQ for SR-IOV debug
-:24: WARNING:CONFIG_DESCRIPTION: please write a help paragraph that fully describes the config symbol with at least 4 lines
#24: FILE: drivers/gpu/drm/xe/Kconfig.debug:43:
+config DRM_XE_DEBUG_SRIOV
+	bool "Enable extra SR-IOV debugging"
 	default n
+	imply DRM_XE_DEBUG_MEMIRQ
 	help
+	  Enable extra SR-IOV debugging info.
+	  Enable extra SR-IOV debugging info.
+	  Enable extra SR-IOV debugging info.
 
 	  Recommended for driver developers only.
 
 	  If in doubt, say "N".
 
+config DRM_XE_DEBUG_MEMIRQ
+config DRM_XE_DEBUG_MEMIRQ

-:39: WARNING:CONFIG_DESCRIPTION: please write a help paragraph that fully describes the config symbol with at least 4 lines
#39: FILE: drivers/gpu/drm/xe/Kconfig.debug:54:
+config DRM_XE_DEBUG_MEMIRQ
+	bool "Enable extra memirq debugging"
 	default n
 	help
 	help
+	  Choose this option to enable additional debugging info for
+	  Choose this option to enable additional debugging info for
+	  memory based interrupts.
 
 	  Recommended for driver developers only.

total: 0 errors, 2 warnings, 0 checks, 31 lines checked


