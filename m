Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3E5FC001E0
	for <intel-xe@archiver.kernel.org>; Wed,  2 Aug 2023 13:49:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76CAA10E191;
	Wed,  2 Aug 2023 13:49:39 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 95C7D10E191;
 Wed,  2 Aug 2023 13:49:38 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 91F97AADF1;
 Wed,  2 Aug 2023 13:49:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Badal Nilawar" <badal.nilawar@intel.com>
Date: Wed, 02 Aug 2023 13:49:38 -0000
Message-ID: <169098417859.6324.1310570457747998724@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230802135241.458855-1-badal.nilawar@intel.com>
In-Reply-To: <20230802135241.458855-1-badal.nilawar@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Ad?=
 =?utf-8?q?d_HWMON_support_for_DGFX_=28rev3=29?=
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

Series: Add HWMON support for DGFX (rev3)
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
commit 8e05576b4f379363fce3ee0b2bbef1d33a9b7b74
Author: Badal Nilawar <badal.nilawar@intel.com>
Date:   Wed Aug 2 19:22:41 2023 +0530

    drm/xe/hwmon: Expose power1_max_interval
    
    Expose power1_max_interval, that is the tau corresponding to PL1, as a
    custom hwmon attribute. Some bit manipulation is needed because of the
    format of PKG_PWR_LIM_1_TIME in
    PACKAGE_RAPL_LIMIT register (1.x * power(2,y))
    
    v2: Get rpm wake ref while accessing power1_max_interval
    
    Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
+ /mt/dim checkpatch 22bed6ae7f551b55263fb37318814f8363064be6 drm-intel
fc5ebe065 drm/xe/hwmon: Add HWMON infrastructure
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:80: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#80: 
new file mode 100644

-:105: CHECK:UNCOMMENTED_DEFINITION: struct mutex definition without comment
#105: FILE: drivers/gpu/drm/xe/xe_hwmon.c:21:
+	struct mutex hwmon_lock;

total: 0 errors, 1 warnings, 1 checks, 212 lines checked
8d80edd8c drm/xe/hwmon: Expose power attributes
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:21: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#21: 
new file mode 100644

-:147: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'ddat' - possible side-effects?
#147: FILE: drivers/gpu/drm/xe/xe_hwmon.c:48:
+#define ddat_to_xe_hwmon(ddat)	({ container_of(ddat, struct xe_hwmon, ddat); })

total: 0 errors, 1 warnings, 1 checks, 474 lines checked
b35ad4927 drm/xe/hwmon: Expose card reactive critical power
2169784a7 drm/xe/hwmon: Expose input voltage attribute
f1dee11f4 drm/xe/hwmon: Expose hwmon energy attribute
-:124: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'ddat' - possible side-effects?
#124: FILE: drivers/gpu/drm/xe/xe_hwmon.c:75:
+#define ddat_to_xe_hwmon(ddat)	\
+	({ ddat->type == HWMON_GT ?	\
+		container_of(ddat, struct xe_hwmon, ddat_gt[ddat->gt->info.id]) :	\
+		container_of(ddat, struct xe_hwmon, ddat); })

-:124: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'ddat' may be better as '(ddat)' to avoid precedence issues
#124: FILE: drivers/gpu/drm/xe/xe_hwmon.c:75:
+#define ddat_to_xe_hwmon(ddat)	\
+	({ ddat->type == HWMON_GT ?	\
+		container_of(ddat, struct xe_hwmon, ddat_gt[ddat->gt->info.id]) :	\
+		container_of(ddat, struct xe_hwmon, ddat); })

total: 0 errors, 0 warnings, 2 checks, 362 lines checked
8e05576b4 drm/xe/hwmon: Expose power1_max_interval


