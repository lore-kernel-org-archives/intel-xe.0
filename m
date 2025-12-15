Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 917FCD5B868
	for <intel-xe@archiver.kernel.org>; Mon, 15 Dec 2025 20:55:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A4D710E520;
	Mon, 15 Dec 2025 20:55:29 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD7DC10E520;
 Mon, 15 Dec 2025 20:55:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Improve_wedged_?=
 =?utf-8?q?mode_handling_=28rev11=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lukasz Laguna" <lukasz.laguna@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 15 Dec 2025 20:55:27 -0000
Message-ID: <176583212778.91038.9252488075635923974@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251215174613.3701-1-lukasz.laguna@intel.com>
In-Reply-To: <20251215174613.3701-1-lukasz.laguna@intel.com>
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

Series: drm/xe: Improve wedged mode handling (rev11)
URL   : https://patchwork.freedesktop.org/series/148214/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
8f50e69d0ce3656564bbdf8b3e213d61470d463f
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c3326a1556e2f76523991dc26bc0fb00b3a20f97
Author: Lukasz Laguna <lukasz.laguna@intel.com>
Date:   Mon Dec 15 18:46:13 2025 +0100

    drm/xe/pf: Allow upon-any-hang wedged mode only in debug config
    
    The GuC reset policy is global, so disabling it on PF can affect all
    running VFs. To avoid unintended side effects, restrict setting
    upon-any-hang (2) wedged mode on the PF to debug builds only.
    
    Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
    Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch 89b7f1ac50d51d9c2334e119fe40de41b366333f drm-intel
f6a6f4224af9 drm/xe: Validate wedged_mode parameter and define enum for modes
-:137: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#137: FILE: drivers/gpu/drm/xe/xe_device_types.h:51:
+ * ^Iwhen critical error occurs like GT reset failure or firmware failure.$

total: 0 errors, 1 warnings, 0 checks, 214 lines checked
e6be7b2d855b drm/xe: Update wedged.mode only after successful reset policy change
-:202: ERROR:CODE_INDENT: code indent should use tabs where possible
#202: FILE: drivers/gpu/drm/xe/xe_guc_ads.h:19:
+                                             bool enable_engine_reset);$

-:202: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#202: FILE: drivers/gpu/drm/xe/xe_guc_ads.h:19:
+                                             bool enable_engine_reset);$

total: 1 errors, 1 warnings, 0 checks, 149 lines checked
b866402cbf70 drm/xe/vf: Disallow setting wedged mode to upon-any-hang
c3326a1556e2 drm/xe/pf: Allow upon-any-hang wedged mode only in debug config


