Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 313DCC4345F
	for <intel-xe@archiver.kernel.org>; Thu, 18 Apr 2024 16:54:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E11A110FA57;
	Thu, 18 Apr 2024 16:54:36 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 662A110FA57;
 Thu, 18 Apr 2024 16:54:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/dmc=3A_firmware_?=
 =?utf-8?q?path_handling_changes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 18 Apr 2024 16:54:35 -0000
Message-ID: <171345927541.1501116.9417006879014338044@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <cover.1713450693.git.jani.nikula@intel.com>
In-Reply-To: <cover.1713450693.git.jani.nikula@intel.com>
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

Series: drm/i915/dmc: firmware path handling changes
URL   : https://patchwork.freedesktop.org/series/132608/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f5fb02e01091a469b6325b72a47b3a0a1e96309c
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4fcd997e831a58697db7da84b2df41687992e7c5
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Thu Apr 18 17:39:54 2024 +0300

    drm/i915/display: move dmc_firmware_path to display params
    
    The dmc_firmware_path parameter is clearly a display parameter. Move it
    there so it's available to both i915 and xe modules. This also cleans up
    the ugly member in struct xe_device.
    
    v2:
    - New try with the NULL/"" param value issue resolved
    
    Link: https://patchwork.freedesktop.org/patch/msgid/20240321161856.3517856-1-jani.nikula@intel.com
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch dc957095cbe4e5f2d0abe4b1cb27530f7111537a drm-intel
d65be8d09482 drm/i915/dmc: handle request_firmware() errors separately
95a04d9261eb drm/i915/dmc: improve firmware parse failure propagation
057e1454ef8d drm/i915/dmc: split out per-platform firmware path selection
c78a70c561ae drm/i915/dmc: change meaning of dmc_firmware_path="" module param
4fcd997e831a drm/i915/display: move dmc_firmware_path to display params
-:25: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#25: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:31:
+intel_display_param_named_unsafe(dmc_firmware_path, charp, 0400,
+	"DMC firmware path to use instead of the default one. "

total: 0 errors, 0 warnings, 1 checks, 51 lines checked


