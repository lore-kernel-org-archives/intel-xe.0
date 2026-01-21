Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA5CEC44536
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jan 2026 22:25:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8600410E1D4;
	Wed, 21 Jan 2026 22:25:51 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE49C10E1D4;
 Wed, 21 Jan 2026 22:25:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/configfs=3A_Add_sr?=
 =?utf-8?q?iov=2Eadmin=5Fonly=5Fpf_attribute?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 21 Jan 2026 22:25:50 -0000
Message-ID: <176903435077.180221.8752032944778137785@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260121214218.2817-1-michal.wajdeczko@intel.com>
In-Reply-To: <20260121214218.2817-1-michal.wajdeczko@intel.com>
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

Series: drm/xe/configfs: Add sriov.admin_only_pf attribute
URL   : https://patchwork.freedesktop.org/series/160448/
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
commit 2e8765600edf7c3f0526c54b2285ccb903ff5ea9
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Wed Jan 21 22:42:16 2026 +0100

    drm/xe/configfs: Add sriov.admin_only_pf attribute
    
    Instead of relying on fixed relation to the display probe flag,
    add configfs attribute to allow an administrator to configure
    desired PF operation mode in a more flexible way.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch ad2a046603cba140214aed34015ed5027441e85a drm-intel
ee84fcf9ad2b drm/xe: Keep all defaults in single header
-:16: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#16: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 140 lines checked
29e9a322836f drm/xe/configfs: Use proper notation for local include
7f6b229df44f drm/xe/configfs: Always return consistent max_vfs value
38d6f0f29145 drm/xe/pf: Define admin_only as real flag
2e8765600edf drm/xe/configfs: Add sriov.admin_only_pf attribute
-:147: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#147: FILE: drivers/gpu/drm/xe/xe_configfs.h:52:
 }
+static inline bool xe_configfs_admin_only_pf(struct pci_dev *pdev)

total: 0 errors, 0 warnings, 1 checks, 140 lines checked


