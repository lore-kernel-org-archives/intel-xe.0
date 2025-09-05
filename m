Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A9EBCA0FED
	for <intel-xe@archiver.kernel.org>; Fri,  5 Sep 2025 16:08:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B8DE10EC08;
	Fri,  5 Sep 2025 16:08:10 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B857110EC08;
 Fri,  5 Sep 2025 16:08:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introducing_firmware_late?=
 =?utf-8?q?_binding?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 05 Sep 2025 16:08:09 -0000
Message-ID: <175708848975.307561.12252849491868944233@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250905154953.3974335-1-badal.nilawar@intel.com>
In-Reply-To: <20250905154953.3974335-1-badal.nilawar@intel.com>
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
URL   : https://patchwork.freedesktop.org/series/154104/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
4087ecac9007bf53f0d36756bd06d570e5d7050f
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 7b5b06fea4e4f2cdffc61e7a7649a22e74d1eed6
Author: Badal Nilawar <badal.nilawar@intel.com>
Date:   Fri Sep 5 21:19:53 2025 +0530

    drm/xe/xe_late_bind_fw: Extract and print version info
    
    Extract and print version info of the late binding binary.
    
    v2: Some refinements (Daniele)
    
    Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
    Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 1f778fbdf929e24ce13112d14835b780959892b0 drm-intel
c3ad2c0941bf mei: bus: add mei_cldev_mtu interface
4e11fb875031 mei: late_bind: add late binding component driver
-:67: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#67: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 415 lines checked
8a94cf22377c drm/xe/xe_late_bind_fw: Introduce xe_late_bind_fw
-:99: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#99: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 201 lines checked
fa22ee3e6aa6 drm/xe/xe_late_bind_fw: Initialize late binding firmware
a1e0e1c13b21 drm/xe/xe_late_bind_fw: Load late binding firmware
55e2bdf5faff drm/xe/xe_late_bind_fw: Reload late binding fw in rpm resume
ed495665ff01 drm/xe/xe_late_bind_fw: Reload late binding fw during system resume
e14862c3a1fb drm/xe/xe_late_bind_fw: Introduce debug fs node to disable late binding
7b5b06fea4e4 drm/xe/xe_late_bind_fw: Extract and print version info


