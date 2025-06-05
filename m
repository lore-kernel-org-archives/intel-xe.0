Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7293C5B543
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 06:42:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47A1D10E057;
	Thu,  5 Jun 2025 06:42:06 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4382A10E057;
 Thu,  5 Jun 2025 06:42:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_Fix_m?=
 =?utf-8?q?acro_HAS=5FULTRAJOINER?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Jun 2025 06:42:05 -0000
Message-ID: <174910572527.50857.17439471220862104282@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250605052616.3368990-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20250605052616.3368990-1-ankit.k.nautiyal@intel.com>
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

Series: drm/i915/display: Fix macro HAS_ULTRAJOINER
URL   : https://patchwork.freedesktop.org/series/149861/
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
commit 1501bea97fc42130974a0f42ff7d4814752414df
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Thu Jun 5 10:56:16 2025 +0530

    drm/i915/display: Fix macro HAS_ULTRAJOINER
    
    Not all platforms that have display >= 20 support ultrajoiner.
    Fix the macro HAS_ULTRAJOINER with correct platforms.
    
    Bspec: 69556
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch d527f1a12f1a9cb4fbc43288c4e41a6f3c7c08cd drm-intel
1501bea97fc4 drm/i915/display: Fix macro HAS_ULTRAJOINER
-:23: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__display' - possible side-effects?
#23: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:195:
+#define HAS_ULTRAJOINER(__display)	(((__display)->platform.dgfx && \
+					  DISPLAY_VER(__display) == 14) && HAS_DSC(__display))

total: 0 errors, 0 warnings, 1 checks, 11 lines checked


