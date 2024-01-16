Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC96C47077
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jan 2024 14:16:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A1CC10E5C1;
	Tue, 16 Jan 2024 14:16:08 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1343A10E56D;
 Tue, 16 Jan 2024 14:16:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm=3A_drm_debug_and_erro?=
 =?utf-8?q?r_logging_improvements?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Date: Tue, 16 Jan 2024 14:16:07 -0000
Message-ID: <170541456707.502239.5070239632065546487@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <cover.1705410327.git.jani.nikula@intel.com>
In-Reply-To: <cover.1705410327.git.jani.nikula@intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm: drm debug and error logging improvements
URL   : https://patchwork.freedesktop.org/series/128830/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
faa12d3432d7ef7793d934cd9338c555e95a5aad
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1f54a7467812676e1db503e15d580fdb2d2636cf
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Tue Jan 16 15:07:35 2024 +0200

    drm: remove drm_debug_printer in favor of drm_dbg_printer
    
    Convert the remaining drm_debug_printer users over to drm_dbg_printer,
    as it can handle the cases without struct drm_device pointer, and also
    provides drm debug category and prefix support. Remove drm_debug_printer
    altogether.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 3a1d727c0061b96ddf8e653130f94ab331e2f065 drm-intel
60c09e37f drm/print: make drm_err_printer() device specific by using drm_err()
d223b0e10 drm/print: move enum drm_debug_category etc. earlier in drm_print.h
0fe6b6644 drm/print: add drm_dbg_printer() for drm device specific printer
-:37: WARNING:PREFER_DEV_LEVEL: Prefer dev_dbg(... to dev_printk(KERN_DEBUG, ...
#37: FILE: drivers/gpu/drm/drm_print.c:205:
+		dev_printk(KERN_DEBUG, dev, "[" DRM_NAME "]%s%s %pV",

-:40: WARNING:PREFER_PR_LEVEL: Prefer [subsystem eg: netdev]_dbg([subsystem]dev, ... then dev_dbg(dev, ... then pr_debug(...  to printk(KERN_DEBUG ...
#40: FILE: drivers/gpu/drm/drm_print.c:208:
+		printk(KERN_DEBUG "[" DRM_NAME "]%s%s %pV",

total: 0 errors, 2 warnings, 0 checks, 69 lines checked
d65addf3c drm/dp_mst: switch from drm_debug_printer() to device specific drm_dbg_printer()
0f99eab08 drm/mode: switch from drm_debug_printer() to device specific drm_dbg_printer()
6f58f596f drm/dp: switch drm_dp_vsc_sdp_log() to struct drm_printer
c130713e2 drm/i915: switch from drm_debug_printer() to device specific drm_dbg_printer()
782c72920 drm/i915: use drm_printf() with the drm_err_printer intead of pr_err()
852df9d7d drm/xe: switch from drm_debug_printer() to device specific drm_dbg_printer()
1f54a7467 drm: remove drm_debug_printer in favor of drm_dbg_printer


