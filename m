Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 611C8C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 29 Apr 2024 12:21:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 244DA112C0F;
	Mon, 29 Apr 2024 12:21:40 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A893B10FE69;
 Mon, 29 Apr 2024 12:21:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/8=5D_drm/xe/device=5Fsysfs=3A_switch_over_to_devm?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 29 Apr 2024 12:21:38 -0000
Message-ID: <171439329869.1756580.1046713524874316265@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240429121436.33013-9-matthew.auld@intel.com>
In-Reply-To: <20240429121436.33013-9-matthew.auld@intel.com>
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

Series: series starting with [1/8] drm/xe/device_sysfs: switch over to devm
URL   : https://patchwork.freedesktop.org/series/133021/
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
commit 9c18830bb4582f52be777a47965a188b000e9f09
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Mon Apr 29 13:14:44 2024 +0100

    drm/xe/device: move xe_device_sanitize over to devm
    
    Disable GuC submission when removing the device.
    
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch ea200da5ea9860ec9e7b772607760c19fdfdd2fc drm-intel
16661a9b028f drm/xe/device_sysfs: switch over to devm
2ca1b992b692 drm/xe: covert sysfs over to devm
9c5ec23bdf77 drm/xe/ggtt: use drm_dev_enter to mark device section
-:12: WARNING:COMMIT_LOG_USE_LINK: Unknown link reference 'References:', use 'Link:' or 'Closes:' instead
#12: 
References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1717

total: 0 errors, 1 warnings, 0 checks, 46 lines checked
a81cd75e276a drm/xe/guc: move guc_fini over to devm
-:13: WARNING:COMMIT_LOG_USE_LINK: Unknown link reference 'References:', use 'Link:' or 'Closes:' instead
#13: 
References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1717

total: 0 errors, 1 warnings, 0 checks, 16 lines checked
26d8a2e07397 drm/xe/guc_pc: move pc_fini to devm
92b581687e5c drm/xe/irq: move irq_uninstall over to devm
d78034329650 drm/xe/device: move flr to devm
9c18830bb458 drm/xe/device: move xe_device_sanitize over to devm


