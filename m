Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3919EC04FFE
	for <intel-xe@archiver.kernel.org>; Mon, 20 May 2024 15:52:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B459F10E46F;
	Mon, 20 May 2024 15:52:02 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFE0010E46F;
 Mon, 20 May 2024 15:51:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5BC?=
 =?utf-8?q?I=2Cv2=2C01/18=5D_drm/xe/pci=3A_remove_broken_driver=5Frelease?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 20 May 2024 15:51:59 -0000
Message-ID: <171622031978.2157358.5773057965210415829@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240520154249.52888-19-matthew.auld@intel.com>
In-Reply-To: <20240520154249.52888-19-matthew.auld@intel.com>
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

Series: series starting with [CI,v2,01/18] drm/xe/pci: remove broken driver_release
URL   : https://patchwork.freedesktop.org/series/133819/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
57b97a66dd129aea93991dc66cd10477f7a05cf8
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 13a8fd6648fbdbbf5f9c956f27d2ea3c3140cc4c
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Mon May 20 16:43:07 2024 +0100

    drm/xe/display: move device_remove over to drmm
    
    i915 display calls this when releasing the drm_device, match this also
    in xe by using drmm. intel_display_device_remove() is freeing purely
    software state for the drm_device.
    
    v2: fix build error
    
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Andrzej Hajda <andrzej.hajda@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
+ /mt/dim checkpatch 1ba62f8cea9c797427d45108df1d453f4b343240 drm-intel
919aa5601b87 drm/xe/pci: remove broken driver_release
dbcf512535f8 drm/xe: covert sysfs over to devm
2a0c6fc3775b drm/xe/ggtt: use drm_dev_enter to mark device section
-:16: WARNING:COMMIT_LOG_USE_LINK: Unknown link reference 'References:', use 'Link:' or 'Closes:' instead
#16: 
References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1717

total: 0 errors, 1 warnings, 0 checks, 39 lines checked
e333c8ee30f2 drm/xe/guc: move guc_fini over to devm
-:13: WARNING:COMMIT_LOG_USE_LINK: Unknown link reference 'References:', use 'Link:' or 'Closes:' instead
#13: 
References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1717

total: 0 errors, 1 warnings, 0 checks, 16 lines checked
3d480bc0f065 drm/xe/guc: s/guc_fini/guc_fini_hw/
83896283157c drm/xe/guc_pc: move pc_fini to devm
9382d62ea5db drm/xe/guc_pc: s/pc_fini/pc_fini_hw/
db3d0ffdda5c drm/xe/irq: move irq_uninstall over to devm
773689eb4898 drm/xe/device: move flr to devm
32749ace6bd6 drm/xe/device: move xe_device_sanitize over to devm
ab3a5680cd04 drm/xe/coredump: move over to devm
-:19: WARNING:COMMIT_LOG_USE_LINK: Unknown link reference 'References:', use 'Link:' or 'Closes:' instead
#19: 
References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1679

total: 0 errors, 1 warnings, 0 checks, 17 lines checked
063c7a3a4f15 drm/xe/gt: break out gt_fini into sw vs hw state
94222542c694 drm/xe: make gt_remove use devm
80920702b15f drm/xe/mmio: move mmio_fini over to devm
4cd78207d685 drm/xe: reset mmio mappings with devm
9755e98341cf drm/xe/display: move display fini stuff to devm
cb665fa7d533 drm/xe/display: stop calling domains_driver_remove twice
13a8fd6648fb drm/xe/display: move device_remove over to drmm


