Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58182C25B77
	for <intel-xe@archiver.kernel.org>; Wed, 22 May 2024 10:29:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A85E810E7A2;
	Wed, 22 May 2024 10:29:00 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0477E10E7A2;
 Wed, 22 May 2024 10:28:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5BC?=
 =?utf-8?q?I=2Cv3=2C01/18=5D_drm/xe/pci=3A_remove_broken_driver=5Frelease?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 22 May 2024 10:28:59 -0000
Message-ID: <171637373901.2166692.17006674245865098274@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240522102143.128069-19-matthew.auld@intel.com>
In-Reply-To: <20240522102143.128069-19-matthew.auld@intel.com>
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

Series: series starting with [CI,v3,01/18] drm/xe/pci: remove broken driver_release
URL   : https://patchwork.freedesktop.org/series/133912/
State : warning

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
commit 5d564e9e27e310d1323618e2d0fa2db6820a9854
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Wed May 22 11:22:01 2024 +0100

    drm/xe/display: move device_remove over to drmm
    
    i915 display calls this when releasing the drm_device, match this also
    in xe by using drmm. intel_display_device_remove() is freeing purely
    software state for the drm_device.
    
    v2: fix build error
    
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Andrzej Hajda <andrzej.hajda@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
+ /mt/dim checkpatch 60d912720ac9462b1170ace7f05f8af68f898204 drm-intel
eda6e1e8307c drm/xe/pci: remove broken driver_release
eb91150584ee drm/xe: covert sysfs over to devm
1b4f8470a20a drm/xe/ggtt: use drm_dev_enter to mark device section
-:16: WARNING:COMMIT_LOG_USE_LINK: Unknown link reference 'References:', use 'Link:' or 'Closes:' instead
#16: 
References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1717

total: 0 errors, 1 warnings, 0 checks, 39 lines checked
1a26bdec81a1 drm/xe/guc: move guc_fini over to devm
-:13: WARNING:COMMIT_LOG_USE_LINK: Unknown link reference 'References:', use 'Link:' or 'Closes:' instead
#13: 
References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1717

total: 0 errors, 1 warnings, 0 checks, 16 lines checked
1c64162efedb drm/xe/guc: s/guc_fini/guc_fini_hw/
76e891f7f72a drm/xe/guc_pc: move pc_fini to devm
f81dbc48148e drm/xe/guc_pc: s/pc_fini/pc_fini_hw/
94532447f784 drm/xe/irq: move irq_uninstall over to devm
12cba2cbb677 drm/xe/device: move flr to devm
547cf87b4433 drm/xe/device: move xe_device_sanitize over to devm
382b8034170a drm/xe/coredump: move over to devm
-:19: WARNING:COMMIT_LOG_USE_LINK: Unknown link reference 'References:', use 'Link:' or 'Closes:' instead
#19: 
References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1679

total: 0 errors, 1 warnings, 0 checks, 17 lines checked
cbaccf65bcd3 drm/xe/gt: break out gt_fini into sw vs hw state
05b01c7c5701 drm/xe: make gt_remove use devm
4f248ed616cb drm/xe/mmio: move mmio_fini over to devm
973a0e4d4631 drm/xe: reset mmio mappings with devm
82f1ac4c6fc5 drm/xe/display: move display fini stuff to devm
14b5cf8e480c drm/xe/display: stop calling domains_driver_remove twice
5d564e9e27e3 drm/xe/display: move device_remove over to drmm


