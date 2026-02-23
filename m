Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DCF3EA4FD8
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 15:57:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93E5C10E3DC;
	Mon, 23 Feb 2026 15:57:07 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77C8C10E3E6;
 Mon, 23 Feb 2026 15:57:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Do_not_create_drm_device_?=
 =?utf-8?q?for_PF_only_admin_mode_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 23 Feb 2026 15:57:06 -0000
Message-ID: <177186222647.275505.15761161699591133223@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260223150951.1834063-1-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20260223150951.1834063-1-satyanarayana.k.v.p@intel.com>
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

Series: Do not create drm device for PF only admin mode (rev2)
URL   : https://patchwork.freedesktop.org/series/160349/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 5567ea21c82a459bd2df5d2d004fa72e51f4923e
Author: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Date:   Mon Feb 23 15:09:51 2026 +0000

    drm/xe/pf: Skip creating DRM device entries in PF admin‑only mode
    
    When the PF is configured for admin‑only mode, it is restricted to
    management functions and should not expose a device node that would
    allow users to run workloads.
    
    In this mode, no DRM device entry is created; however, sysfs and debugfs
    interfaces for the PF remain available at:
    
    sysfs: /sys/devices/pci0000:00/<B:D:F>
    debugfs: /sys/kernel/debug/dri/<B:D:F>
    
    Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
    Cc: dri-devel@lists.freedesktop.org
+ /mt/dim checkpatch 08db5896d2bccbe60927f172ed05e7afbfe12863 drm-intel
5567ea21c82a drm/xe/pf: Skip creating DRM device entries in PF admin‑only mode
-:83: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#83: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 528 lines checked


