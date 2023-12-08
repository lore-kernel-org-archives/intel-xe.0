Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A39C9C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 06:31:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6068F10E9D6;
	Fri,  8 Dec 2023 06:31:22 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 555F510E9D6;
 Fri,  8 Dec 2023 06:31:20 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 5049CAA917;
 Fri,  8 Dec 2023 06:31:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/3=5D_drm/xe=3A_Change_the_name_of_frequency_sysfs_attributes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Date: Fri, 08 Dec 2023 06:31:20 -0000
Message-ID: <170201708032.7324.1413510094340091458@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231208051153.664055-1-rodrigo.vivi@intel.com>
In-Reply-To: <20231208051153.664055-1-rodrigo.vivi@intel.com>
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

Series: series starting with [1/3] drm/xe: Change the name of frequency sysfs attributes
URL   : https://patchwork.freedesktop.org/series/127544/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6030b24c1386b00de8187b5fb987e283a57b372a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 5ffc6ac18986b607506ee31de66542f4d4ee4292
Author: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Date:   Fri Dec 8 00:11:52 2023 -0500

    drm/xe: Add frequency throttle reasons sysfs attributes
    
    Add throttle reasons sysfs attributes under a separate directory.
    
    /device/tile<n>/gt<n>/freq0/throttle
                            |- reason_pl1
                            |- reason_pl2
                            |- reason_pl4
                            |- reason_prochot
                            |- reason_ratl
                            |- reason_vr_tdc
                            |- reason_vr_thermalert
                            |- status
    
    v2: Remove unnecessary headers and clean-up action (Riana)
    
    Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Reviewed-by: Riana Tauro <riana.tauro@intel.com>
+ /mt/dim checkpatch c4235ef53c0265159d2c5f34459a3b6c37ab1995 drm-intel
9d4974e48 drm/xe: Change the name of frequency sysfs attributes
9135d656e drm/xe: Create a xe_gt_freq component for raw management and sysfs
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:63: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#63: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 615 lines checked
5ffc6ac18 drm/xe: Add frequency throttle reasons sysfs attributes
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:77: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#77: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 303 lines checked


