Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E4DC4345F
	for <intel-xe@archiver.kernel.org>; Fri, 19 Apr 2024 10:29:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A199F10F6C5;
	Fri, 19 Apr 2024 10:29:15 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C462F10EACC;
 Fri, 19 Apr 2024 10:29:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/dmc=3A_firmware_?=
 =?utf-8?q?path_handling_changes_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 19 Apr 2024 10:29:14 -0000
Message-ID: <171352255480.1520059.6398331160022798078@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <cover.1713519628.git.jani.nikula@intel.com>
In-Reply-To: <cover.1713519628.git.jani.nikula@intel.com>
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

Series: drm/i915/dmc: firmware path handling changes (rev2)
URL   : https://patchwork.freedesktop.org/series/132608/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
0daf0be5bb95eb0a0e42275e00a0e42d8d8fd543
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 878af28dcd9450bbd0816a0e803fc9185ee3543b
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Fri Apr 19 12:41:58 2024 +0300

    drm/i915/display: move dmc_firmware_path to display params
    
    The dmc_firmware_path parameter is clearly a display parameter. Move it
    there so it's available to both i915 and xe modules. This also cleans up
    the ugly member in struct xe_device.
    
    v2:
    - New try with the NULL/"" param value issue resolved
    
    Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch d02ac9d1c1a99eac3bb111d443de62d7286f7708 drm-intel
08c17567787b drm/i915/dmc: handle request_firmware() errors separately
32811d4592a0 drm/i915/dmc: improve firmware parse failure propagation
5a7df56dce75 drm/i915/dmc: split out per-platform firmware path selection
7f4154fb01c4 drm/i915/dmc: change how to disable DMC firmware using module param
878af28dcd94 drm/i915/display: move dmc_firmware_path to display params
-:25: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#25: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:31:
+intel_display_param_named_unsafe(dmc_firmware_path, charp, 0400,
+	"DMC firmware path to use instead of the default one. "

total: 0 errors, 0 warnings, 1 checks, 51 lines checked


