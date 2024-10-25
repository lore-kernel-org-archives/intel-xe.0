Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF617D0C5ED
	for <intel-xe@archiver.kernel.org>; Fri, 25 Oct 2024 09:09:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCF9610EA3D;
	Fri, 25 Oct 2024 09:09:49 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FEDC10EA3F;
 Fri, 25 Oct 2024 09:09:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_DRM_device_wedg?=
 =?utf-8?q?ed_event_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 25 Oct 2024 09:09:48 -0000
Message-ID: <172984738845.1331517.7889932265372317133@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241025084817.144621-1-raag.jadav@intel.com>
In-Reply-To: <20241025084817.144621-1-raag.jadav@intel.com>
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

Series: Introduce DRM device wedged event (rev6)
URL   : https://patchwork.freedesktop.org/series/138070/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 7ebadd95c48c1684edc9445a7ce640cd8c1d6f07
Author: Raag Jadav <raag.jadav@intel.com>
Date:   Fri Oct 25 14:18:17 2024 +0530

    drm/i915: Use device wedged event
    
    Now that we have device wedged event provided by DRM core, make use
    of it and support both driver rebind and bus-reset based recovery.
    With this in place, userspace will be notified of wedged device on
    gt reset failure.
    
    Signed-off-by: Raag Jadav <raag.jadav@intel.com>
+ /mt/dim checkpatch 7cadd167321b3267a9803aba88f115fc9809d4ea drm-intel
87c8151d745c drm: Introduce device wedged event
-:128: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#128: FILE: drivers/gpu/drm/drm_drv.c:84:
+};
+static_assert(ARRAY_SIZE(drm_wedge_recovery_opts) == ffs(DRM_WEDGE_RECOVERY_BUS_RESET));

-:156: WARNING:STATIC_CONST_CHAR_ARRAY: char * array declaration might be better as static const
#156: FILE: drivers/gpu/drm/drm_drv.c:532:
+	char *envp[] = { event_string, NULL };

total: 0 errors, 1 warnings, 1 checks, 95 lines checked
354ac9b687e7 drm/doc: Document device wedged event
5c800f86c85f drm/xe: Use device wedged event
-:20: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#20: 
KERNEL[265.802982] change   /devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:00.0/drm/card0 (drm)

total: 0 errors, 1 warnings, 0 checks, 24 lines checked
7ebadd95c48c drm/i915: Use device wedged event


