Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C2EC8303C
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 18:39:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE2DE10E1C1;
	Wed,  2 Jul 2025 18:39:16 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E8FA10E1C1;
 Wed,  2 Jul 2025 18:39:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introducing_firmware_late?=
 =?utf-8?q?_binding?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 02 Jul 2025 18:39:15 -0000
Message-ID: <175148155537.128711.3589535189790540994@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250702165216.557074-1-badal.nilawar@intel.com>
In-Reply-To: <20250702165216.557074-1-badal.nilawar@intel.com>
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
URL   : https://patchwork.freedesktop.org/series/151082/
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
commit 4bb2cd773bfacbf5154f819b768c22790edc83f4
Author: Badal Nilawar <badal.nilawar@intel.com>
Date:   Wed Jul 2 22:22:16 2025 +0530

    drm/xe/xe_late_bind_fw: Select INTEL_MEI_LATE_BIND for CI
    
    Do not review
    
    Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
+ /mt/dim checkpatch 94631e6b7f655b1922e3227970cd6180200694af drm-intel
57f3d238ff30 mei: bus: add mei_cldev_mtu interface
1dcf70da762a mei: late_bind: add late binding component driver
-:38: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#38: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 378 lines checked
5e1ef7275b36 drm/xe/xe_late_bind_fw: Introducing xe_late_bind_fw
-:91: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#91: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 202 lines checked
e22f9dfd345b drm/xe/xe_late_bind_fw: Initialize late binding firmware
48fcc1b142e8 drm/xe/xe_late_bind_fw: Load late binding firmware
61c0c7f13d9b drm/xe/xe_late_bind_fw: Reload late binding fw in rpm resume
14d2ffa762c4 drm/xe/xe_late_bind_fw: Reload late binding fw during system resume
4d5c84dc4322 drm/xe/xe_late_bind_fw: Introduce debug fs node to disable late binding
75638e1ad31c drm/xe/xe_late_bind_fw: Extract and print version info
4bb2cd773bfa drm/xe/xe_late_bind_fw: Select INTEL_MEI_LATE_BIND for CI


