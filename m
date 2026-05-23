Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EEBECD4F54
	for <intel-xe@archiver.kernel.org>; Sat, 23 May 2026 05:10:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48F7210E59C;
	Sat, 23 May 2026 05:10:57 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5796310E596;
 Sat, 23 May 2026 05:10:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_DRM_RAS_Fixes_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 23 May 2026 05:10:55 -0000
Message-ID: <177951305535.2247.4500874089696427863@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260523050212.557292-1-raag.jadav@intel.com>
In-Reply-To: <20260523050212.557292-1-raag.jadav@intel.com>
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

Series: DRM RAS Fixes (rev2)
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
commit 47da65313aeea48680d3ff892299de8c1ba8ba7f
Author: Raag Jadav <raag.jadav@intel.com>
Date:   Sat May 23 10:30:22 2026 +0530

    drm/xe/hw_error: Use HW_ERR prefix in log
    
    Hardware errors should be logged with HW_ERR prefix. Make them
    consistent with existing logs.
    
    Fixes: 01aab7e1c9d4 ("drm/xe/xe_hw_error: Add support for PVC SoC errors")
    Signed-off-by: Raag Jadav <raag.jadav@intel.com>
+ /mt/dim checkpatch ca274c47b66d01ca8986007a2d7d395aa5cf247f drm-intel
b950453408b1 drm/ras: Cancel and free message on get counter failure
281eed550650 drm/xe/drm_ras: Make counter allocation drm managed
dd4db2b48673 drm/xe/drm_ras: Add per node cleanup action
47da65313aee drm/xe/hw_error: Use HW_ERR prefix in log
-:49: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#49: FILE: drivers/gpu/drm/xe/xe_hw_error.c:260:
+			drm_err_ratelimited(&xe->drm, HW_ERR "%s SOC %s detected", name, severity_str);

total: 0 errors, 1 warnings, 0 checks, 34 lines checked


