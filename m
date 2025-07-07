Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB641C71130
	for <intel-xe@archiver.kernel.org>; Mon,  7 Jul 2025 19:41:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97B6E10E55C;
	Mon,  7 Jul 2025 19:41:00 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4972F10E55C;
 Mon,  7 Jul 2025 19:40:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introducing_firmware_late?=
 =?utf-8?q?_binding?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 07 Jul 2025 19:40:59 -0000
Message-ID: <175191725928.141533.7382750968707801258@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250707191237.1782824-1-badal.nilawar@intel.com>
In-Reply-To: <20250707191237.1782824-1-badal.nilawar@intel.com>
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

Series: Introducing firmware late binding
URL   : https://patchwork.freedesktop.org/series/151290/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
43254c2aa575037fc031c7ac21b0d031c700b2bf
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a421e9007b865d01061777b69ffee11d4c8c8e99
Author: Badal Nilawar <badal.nilawar@intel.com>
Date:   Tue Jul 8 00:42:37 2025 +0530

    drm/xe/xe_late_bind_fw: Extract and print version info
    
    Extract and print version info of the late binding binary.
    
    v2: Some refinements (Daniele)
    
    Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
    Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
+ /mt/dim checkpatch b9993cff911b1dd0abde4929435cc1eeb79e1c8f drm-intel
9bd36bfbe1b4 mei: bus: add mei_cldev_mtu interface
fe01864d3f09 mei: late_bind: add late binding component driver
-:49: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#49: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 364 lines checked
c911f53dbadd drm/xe/xe_late_bind_fw: Introducing xe_late_bind_fw
-:93: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#93: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 201 lines checked
d8addbc00d34 drm/xe/xe_late_bind_fw: Initialize late binding firmware
aa4bcd84f24a drm/xe/xe_late_bind_fw: Load late binding firmware
da592fe7516b drm/xe/xe_late_bind_fw: Reload late binding fw in rpm resume
0cfe675d38aa drm/xe/xe_late_bind_fw: Reload late binding fw during system resume
dd6ab7a623c1 drm/xe/xe_late_bind_fw: Introduce debug fs node to disable late binding
a421e9007b86 drm/xe/xe_late_bind_fw: Extract and print version info


