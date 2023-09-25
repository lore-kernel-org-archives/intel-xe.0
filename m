Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF78CE7A81
	for <intel-xe@archiver.kernel.org>; Mon, 25 Sep 2023 08:20:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E8B710E1D1;
	Mon, 25 Sep 2023 08:20:23 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4A85210E1D1;
 Mon, 25 Sep 2023 08:20:22 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 4BCE1AADEB;
 Mon, 25 Sep 2023 08:20:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Badal Nilawar" <badal.nilawar@intel.com>
Date: Mon, 25 Sep 2023 08:20:22 -0000
Message-ID: <169563002230.21533.7437786881831801675@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230925081842.3566834-1-badal.nilawar@intel.com>
In-Reply-To: <20230925081842.3566834-1-badal.nilawar@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Ad?=
 =?utf-8?q?d_HWMON_support_for_DGFX_=28rev6=29?=
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

Series: Add HWMON support for DGFX (rev6)
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
commit 5bce98a0499dfaf87e76c991e1768e17d40a7f91
Author: Badal Nilawar <badal.nilawar@intel.com>
Date:   Mon Sep 25 13:48:42 2023 +0530

    drm/xe/hwmon: Expose power1_max_interval
    
    Expose power1_max_interval, that is the tau corresponding to PL1, as a
    custom hwmon attribute. Some bit manipulation is needed because of the
    format of PKG_PWR_LIM_1_TIME in
    PACKAGE_RAPL_LIMIT register (1.x * power(2,y))
    
    v2: Get rpm wake ref while accessing power1_max_interval
    v3: %s/hwmon/xe_hwmon/
    
    Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
+ /mt/dim checkpatch 6378241543c29ce3a7df5828323f1684b4bb19e3 drm-intel
a3aecb1b0 drm/xe/hwmon: Expose power attributes
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
-:33: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#33: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 471 lines checked
0f9a2f1cb drm/xe/hwmon: Expose card reactive critical power
83a14b2d4 drm/xe/hwmon: Expose input voltage attribute
80b10e8f7 drm/xe/hwmon: Expose hwmon energy attribute
5bce98a04 drm/xe/hwmon: Expose power1_max_interval


