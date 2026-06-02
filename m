Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D896CD6E4A
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jun 2026 05:17:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1A47113835;
	Tue,  2 Jun 2026 05:17:57 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E494B113835;
 Tue,  2 Jun 2026 05:17:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_DRM_RAS_Fixes_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 02 Jun 2026 05:17:56 -0000
Message-ID: <178037747692.34044.14898051915360907723@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260602044919.702209-1-raag.jadav@intel.com>
In-Reply-To: <20260602044919.702209-1-raag.jadav@intel.com>
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

Series: DRM RAS Fixes (rev3)
URL   : https://patchwork.freedesktop.org/series/166595/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 402f56fd6ce87724f3f018dfb365a84ba5666e48
Author: Raag Jadav <raag.jadav@intel.com>
Date:   Tue Jun 2 10:18:44 2026 +0530

    drm/xe/hw_error: Use HW_ERR prefix in log
    
    Hardware errors should be logged with HW_ERR prefix. Make them
    consistent with existing logs.
    
    Fixes: 01aab7e1c9d4 ("drm/xe/xe_hw_error: Add support for PVC SoC errors")
    Signed-off-by: Raag Jadav <raag.jadav@intel.com>
    Reviewed-by: Riana Tauro <riana.tauro@intel.com>
+ /mt/dim checkpatch a980196655477a8f5067112946401fe52e510664 drm-intel
cb20acd8d2da drm/ras: Cancel and free message on get counter failure
9c92f4af2bd9 drm/xe/drm_ras: Make counter allocation drm managed
f267f2f6a311 drm/xe/drm_ras: Add per node cleanup action
402f56fd6ce8 drm/xe/hw_error: Use HW_ERR prefix in log
-:50: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#50: FILE: drivers/gpu/drm/xe/xe_hw_error.c:260:
+			drm_err_ratelimited(&xe->drm, HW_ERR "%s SOC %s detected", name, severity_str);

total: 0 errors, 1 warnings, 0 checks, 34 lines checked


