Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CABFFCD54B3
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 10:57:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BE0E10E39B;
	Tue, 19 Sep 2023 10:57:27 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id CAF1510E398;
 Tue, 19 Sep 2023 10:57:26 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id CA36EA0093;
 Tue, 19 Sep 2023 10:57:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sujaritha Sundaresan" <sujaritha.sundaresan@intel.com>
Date: Tue, 19 Sep 2023 10:57:26 -0000
Message-ID: <169512104682.3668.1044303504746074101@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230919110541.1243785-1-sujaritha.sundaresan@intel.com>
In-Reply-To: <20230919110541.1243785-1-sujaritha.sundaresan@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Ad?=
 =?utf-8?q?d_throttle_reasons_sysfs?=
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

Series: Add throttle reasons sysfs
URL   : https://patchwork.freedesktop.org/series/123906/
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
commit 7fbf09916ae3017509e06ccb46f3d273147fadea
Author: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Date:   Tue Sep 19 16:35:41 2023 +0530

    drm/xe: Add throttle reason sysfs attributes
    
    Add throttle reasons sysfs interface under device/../gt#/
    Currently there is one overall status and eight reasons
    attributes.
    
    The new sysfs structure will have the below layout
    
    device/tile<n>/gt<n>
                   ├── gt0
                   │   └── throttle
                   │       ├── <throttle_reasons>
                   │
                   │
                   ├── gtN
                   │   └── throttle
                   │       ├── <throttle_reasons>
    
    v2: Fix review comments (Riana)
        Move init call (Matt)
    
    Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
+ /mt/dim checkpatch 3d7e02fb9c40263a989c4c19d2dc5a07659965ed drm-intel
7fbf09916 drm/xe: Add throttle reason sysfs attributes
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
-:86: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#86: 
new file mode 100644

-:136: WARNING:LINE_SPACING: Missing a blank line after declarations
#136: FILE: drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c:46:
+	u32 reg;
+	if (xe_gt_is_media_type(gt))

-:371: CHECK:LINE_SPACING: Please don't use multiple blank lines
#371: FILE: drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c:281:
+
+

total: 0 errors, 2 warnings, 1 checks, 368 lines checked


