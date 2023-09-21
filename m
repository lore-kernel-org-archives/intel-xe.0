Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE6AFE7070A
	for <intel-xe@archiver.kernel.org>; Thu, 21 Sep 2023 10:21:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6ED610E5AA;
	Thu, 21 Sep 2023 10:21:50 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 857BA10E5AA;
 Thu, 21 Sep 2023 10:21:49 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 88094A00CC;
 Thu, 21 Sep 2023 10:21:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Badal Nilawar" <badal.nilawar@intel.com>
Date: Thu, 21 Sep 2023 10:21:49 -0000
Message-ID: <169529170955.7233.9287779817115299960@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230921102519.3355538-1-badal.nilawar@intel.com>
In-Reply-To: <20230921102519.3355538-1-badal.nilawar@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Ad?=
 =?utf-8?q?d_HWMON_support_for_DGFX_=28rev5=29?=
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

Series: Add HWMON support for DGFX (rev5)
URL   : https://patchwork.freedesktop.org/series/118934/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 6623782667f2423737f0a3df93bde8e3ff639a6e
Author: Badal Nilawar <badal.nilawar@intel.com>
Date:   Thu Sep 21 15:55:19 2023 +0530

    drm/xe/hwmon: Expose power1_max_interval
    
    Expose power1_max_interval, that is the tau corresponding to PL1, as a
    custom hwmon attribute. Some bit manipulation is needed because of the
    format of PKG_PWR_LIM_1_TIME in
    PACKAGE_RAPL_LIMIT register (1.x * power(2,y))
    
    v2: Get rpm wake ref while accessing power1_max_interval
    v3: %s/hwmon/xe_hwmon/
    
    Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
+ /mt/dim checkpatch 57039c55bac31a639ce66355c26fe345f338c075 drm-intel
a26e2637c drm/xe: Add XE_MISSING_CASE macro
d50bb8d1c drm/xe/hwmon: Expose power attributes
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:28: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#28: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 473 lines checked
ded4ac88b drm/xe/hwmon: Expose card reactive critical power
88a517751 drm/xe/hwmon: Expose input voltage attribute
e25dd62d1 drm/xe/hwmon: Expose hwmon energy attribute
662378266 drm/xe/hwmon: Expose power1_max_interval


