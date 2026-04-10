Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF38F4484F
	for <intel-xe@archiver.kernel.org>; Fri, 10 Apr 2026 12:19:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71D5510E962;
	Fri, 10 Apr 2026 12:19:20 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 178D910E962;
 Fri, 10 Apr 2026 12:19:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_Xe_Correctable_?=
 =?utf-8?q?Error_Handling_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 10 Apr 2026 12:19:19 -0000
Message-ID: <177582355907.451162.12127924232280679124@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260410102744.427150-1-raag.jadav@intel.com>
In-Reply-To: <20260410102744.427150-1-raag.jadav@intel.com>
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

Series: Introduce Xe Correctable Error Handling (rev6)
URL   : https://patchwork.freedesktop.org/series/160184/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit eff59313996ed7945dd703196decaab1da3aeda2
Author: Raag Jadav <raag.jadav@intel.com>
Date:   Fri Apr 10 15:57:44 2026 +0530

    drm/xe/ras: Introduce correctable error handling
    
    Add initial support for correctable error handling which is serviced
    using system controller event. Currently we only log the errors in
    dmesg but this serves as a foundation for RAS infrastructure and will
    be further extended to facilitate other RAS features.
    
    Signed-off-by: Raag Jadav <raag.jadav@intel.com>
+ /mt/dim checkpatch 56a9321dbb8dd1a1d5e85fc86bd30c4a0d5147db drm-intel
43c73e941791 drm/xe/sysctrl: Add system controller interrupt handler
8137c746c027 drm/xe/sysctrl: Add system controller event support
-:74: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#74: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 217 lines checked
eff59313996e drm/xe/ras: Introduce correctable error handling
-:26: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#26: 
new file mode 100644

-:69: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#69: FILE: drivers/gpu/drm/xe/xe_ras.c:39:
+};
+static_assert(ARRAY_SIZE(xe_ras_severities) == XE_RAS_SEV_MAX);

-:80: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#80: FILE: drivers/gpu/drm/xe/xe_ras.c:50:
+};
+static_assert(ARRAY_SIZE(xe_ras_components) == XE_RAS_COMP_MAX);

total: 0 errors, 1 warnings, 2 checks, 202 lines checked


