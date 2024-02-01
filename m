Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 458C2C48286
	for <intel-xe@archiver.kernel.org>; Thu,  1 Feb 2024 19:44:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0318210E6D7;
	Thu,  1 Feb 2024 19:44:04 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C542510E6D7;
 Thu,  1 Feb 2024 19:44:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/hwmon=3A_Refactor_?=
 =?utf-8?q?xe_hwmon_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 01 Feb 2024 19:44:02 -0000
Message-ID: <170681664280.895526.16465532761545604914@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240201180600.434822-1-karthik.poosa@intel.com>
In-Reply-To: <20240201180600.434822-1-karthik.poosa@intel.com>
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

Series: drm/xe/hwmon: Refactor xe hwmon (rev2)
URL   : https://patchwork.freedesktop.org/series/129187/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
35591fb8b4d5305b37ce31483f85ac0956eaa536
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c68abe370e68ca66d39ada103ede35b4c80fa528
Author: Karthik Poosa <karthik.poosa@intel.com>
Date:   Thu Feb 1 23:36:00 2024 +0530

    drm/xe/hwmon: Refactor xe hwmon
    
    Check latest platform first in xe_hwmon_get_reg.
    Move PVC HWMON registers to regs/xe_pcode.h.
    
    Suggested-by: Matt Roper <matthew.d.roper@intel.com>
    Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
+ /mt/dim checkpatch 3e58a4940c44430f20cad20ead5e1b77ed209cde drm-intel
c68abe370 drm/xe/hwmon: Refactor xe hwmon
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:28: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#28: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 82 lines checked


