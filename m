Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 787F7C6FD1F
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 19:35:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 107D510E6FA;
	Thu, 21 Mar 2024 19:35:49 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 155CF10E6FA;
 Thu, 21 Mar 2024 19:35:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_move_?=
 =?utf-8?q?dmc=5Ffirmware=5Fpath_to_display_params?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 21 Mar 2024 19:35:48 -0000
Message-ID: <171104974808.941104.7523476827771856198@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240321161856.3517856-1-jani.nikula@intel.com>
In-Reply-To: <20240321161856.3517856-1-jani.nikula@intel.com>
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

Series: drm/i915/display: move dmc_firmware_path to display params
URL   : https://patchwork.freedesktop.org/series/131442/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
a9eb1ac8298ef9f9146567c29fa762d8e9efa1ef
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 0de0d6418805ddb952e2c1d22d1375d116cc9423
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Thu Mar 21 18:18:56 2024 +0200

    drm/i915/display: move dmc_firmware_path to display params
    
    The dmc_firmware_path parameter is clearly a display parameter. Move it
    there. This also cleans up the ugly member in struct xe_device.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch ad4a10c6d0e21df4bd830c20c96b795ae2d03962 drm-intel
0de0d6418805 drm/i915/display: move dmc_firmware_path to display params
-:20: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#20: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:31:
+intel_display_param_named_unsafe(dmc_firmware_path, charp, 0400,
+	"DMC firmware path to use instead of the default one");

total: 0 errors, 0 warnings, 1 checks, 66 lines checked


