Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C981AC77B7C
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 17:59:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8761510E7CE;
	Wed, 25 Jun 2025 17:59:33 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9DC910E7C5;
 Wed, 25 Jun 2025 17:59:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introducing_firmware_late?=
 =?utf-8?q?_binding?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 25 Jun 2025 17:59:32 -0000
Message-ID: <175087437268.109302.5198184795872758699@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250625170015.33912-1-badal.nilawar@intel.com>
In-Reply-To: <20250625170015.33912-1-badal.nilawar@intel.com>
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
URL   : https://patchwork.freedesktop.org/series/150772/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f8ff75ae1d2127635239b134695774ed4045d05b
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e265f1e55bd9e2421504b701faebbf52ec1eec33
Author: Badal Nilawar <badal.nilawar@intel.com>
Date:   Wed Jun 25 22:30:15 2025 +0530

    drm/xe/xe_late_bind_fw: Select INTEL_MEI_LATE_BIND for CI
    
    Do not review
    
    Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
+ /mt/dim checkpatch b5a4f1f5ebf74c0b2c583cb7ea8dd768d8f315db drm-intel
26b5be95ee89 mei: bus: add mei_cldev_mtu interface
d5bf236e3cb0 mei: late_bind: add late binding component driver
-:37: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#37: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 387 lines checked
080e566e78a3 drm/xe/xe_late_bind_fw: Introducing xe_late_bind_fw
-:91: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#91: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 211 lines checked
f774064f2796 drm/xe/xe_late_bind_fw: Initialize late binding firmware
52f9edc1f39d drm/xe/xe_late_bind_fw: Load late binding firmware
cf9d1e09ecd7 drm/xe/xe_late_bind_fw: Reload late binding fw in rpm resume
b87a38b0bf7c drm/xe/xe_late_bind_fw: Reload late binding fw during system resume
1cc121285cf0 drm/xe/xe_late_bind_fw: Introduce debug fs node to disable late binding
3ad58dfdca1b drm/xe/xe_late_bind_fw: Extract and print version info
e265f1e55bd9 drm/xe/xe_late_bind_fw: Select INTEL_MEI_LATE_BIND for CI


