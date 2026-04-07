Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88FD2FEEF2E
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 12:10:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 440B510E405;
	Tue,  7 Apr 2026 12:10:36 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FCC910E3FC;
 Tue,  7 Apr 2026 12:10:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_Xe_Correctable_?=
 =?utf-8?q?Error_Handling_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 07 Apr 2026 12:10:35 -0000
Message-ID: <177556383563.436629.13407879945097057518@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260407110629.198158-1-raag.jadav@intel.com>
In-Reply-To: <20260407110629.198158-1-raag.jadav@intel.com>
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

Series: Introduce Xe Correctable Error Handling (rev5)
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
commit 1c90ff8d3c90471d1fd9e5e4d1b306e1ca2c9ee6
Author: Raag Jadav <raag.jadav@intel.com>
Date:   Tue Apr 7 16:36:29 2026 +0530

    drm/xe/ras: Introduce correctable error handling
    
    Add initial support for correctable error handling which is serviced
    using system controller event. Currently we only log the errors in
    dmesg but this serves as a foundation for RAS infrastructure and will
    be further extended to facilitate other RAS features.
    
    Signed-off-by: Raag Jadav <raag.jadav@intel.com>
+ /mt/dim checkpatch 87b52c2ff4f00eff41866d728f82d2b109c397f7 drm-intel
fe42aac0a529 drm/xe/sysctrl: Add system controller interrupt handler
0763f39dae65 drm/xe/sysctrl: Add system controller event support
-:63: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#63: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 189 lines checked
1c90ff8d3c90 drm/xe/ras: Introduce correctable error handling
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

total: 0 errors, 1 warnings, 2 checks, 205 lines checked


