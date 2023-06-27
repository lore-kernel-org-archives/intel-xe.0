Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC93EB64D9
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jun 2023 18:27:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3525710E31B;
	Tue, 27 Jun 2023 18:27:57 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id AF11A10E31B;
 Tue, 27 Jun 2023 18:27:55 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id AC127AADDC;
 Tue, 27 Jun 2023 18:27:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Badal Nilawar" <badal.nilawar@intel.com>
Date: Tue, 27 Jun 2023 18:27:55 -0000
Message-ID: <168789047570.2458.10516970300733824811@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230627183043.2024530-1-badal.nilawar@intel.com>
In-Reply-To: <20230627183043.2024530-1-badal.nilawar@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Ad?=
 =?utf-8?q?d_HWMON_support_for_DGFX_=28rev2=29?=
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

Series: Add HWMON support for DGFX (rev2)
URL   : https://patchwork.freedesktop.org/series/118934/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e6cd3d95fdc59f86d12985e732692baf70b70f9f
Author: Badal Nilawar <badal.nilawar@intel.com>
Date:   Wed Jun 28 00:00:43 2023 +0530

    drm/xe/hwmon: Expose power1_max_interval
    
    Expose power1_max_interval, that is the tau corresponding to PL1, as a
    custom hwmon attribute. Some bit manipulation is needed because of the
    format of PKG_PWR_LIM_1_TIME in
    PACKAGE_RAPL_LIMIT register (1.x * power(2,y))
    This is port from i915 hwmon.
    
    v2: Get rpm wake ref while accessing power1_max_interval
    
    Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
+ /mt/dim checkpatch d06a7e92d9a63597656367b287824d4eaff581bc drm-intel
9ca92647e drm/xe/hwmon: Add HWMON infrastructure
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:73: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#73: 
new file mode 100644

-:97: CHECK:UNCOMMENTED_DEFINITION: struct mutex definition without comment
#97: FILE: drivers/gpu/drm/xe/xe_hwmon.c:20:
+	struct mutex hwmon_lock;

total: 0 errors, 1 warnings, 1 checks, 178 lines checked
8ef2e0493 drm/xe/hwmon: Expose power attributes
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:18: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#18: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 550 lines checked
52b585045 drm/xe/hwmon: Expose card reactive critical power
a24e5538b drm/xe/hwmon: Expose input voltage attribute
bc8ee77d4 drm/xe/hwmon: Expose hwmon energy attribute
e6cd3d95f drm/xe/hwmon: Expose power1_max_interval


