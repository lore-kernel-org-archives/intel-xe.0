Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F80C3DA5D
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jul 2024 21:31:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E22410E16F;
	Mon, 22 Jul 2024 21:31:53 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB8CC10E342;
 Mon, 22 Jul 2024 21:31:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/guc=3A_Enable_w/a_?=
 =?utf-8?q?14022293748_and_22019794406_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Julia Filipchuk" <julia.filipchuk@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 22 Jul 2024 21:31:51 -0000
Message-ID: <172168391169.358374.5722807600787732507@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240722205608.2539635-1-julia.filipchuk@intel.com>
In-Reply-To: <20240722205608.2539635-1-julia.filipchuk@intel.com>
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

Series: drm/xe/guc: Enable w/a 14022293748 and 22019794406 (rev2)
URL   : https://patchwork.freedesktop.org/series/136307/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
5ce3e132caaa5b45e5e50201b574a097d130967c
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 09c72b850a0c58892cb16a2d794f3036b9a00e52
Author: Julia Filipchuk <julia.filipchuk@intel.com>
Date:   Mon Jul 22 13:56:08 2024 -0700

    drm/xe/guc: Enable w/a 14022293748 and 22019794406
    
    Enable workarounds for HW bug where render engine reset fails.
    
    v2: Enable KLV for either workarrounds (feedback from Lucas De Marchi)
    
    Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
+ /mt/dim checkpatch 3c91f8fc142cf0abea652fac341711086d1f40c9 drm-intel
09c72b850a0c drm/xe/guc: Enable w/a 14022293748 and 22019794406
-:50: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#50: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:108:
+	fw_def(BATTLEMAGE,	major_ver(intel-ci/xe,	guc,	bmg,	70, 29, 0))	\
 	                  	               ^

-:50: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#50: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:108:
+	fw_def(BATTLEMAGE,	major_ver(intel-ci/xe,	guc,	bmg,	70, 29, 0))	\
 	                  	                  ^

-:51: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#51: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:109:
+	fw_def(LUNARLAKE,	major_ver(intel-ci/xe,	guc,	lnl,	70, 29, 0))	\
 	                 	               ^

-:51: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#51: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:109:
+	fw_def(LUNARLAKE,	major_ver(intel-ci/xe,	guc,	lnl,	70, 29, 0))	\
 	                 	                  ^

total: 0 errors, 0 warnings, 4 checks, 36 lines checked


