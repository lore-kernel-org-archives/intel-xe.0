Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAA51C5DF94
	for <intel-xe@archiver.kernel.org>; Mon, 24 Aug 2026 07:33:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 955BD10E4E5;
	Mon, 24 Aug 2026 07:33:38 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E65E710E36E;
 Mon, 24 Aug 2026 07:33:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Expose_AMC_alert_reason_s?=
 =?utf-8?q?ysfs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 24 Aug 2026 07:33:36 -0000
Message-ID: <178755681692.78045.16078199043231447380@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260823103523.554184-4-badal.nilawar@intel.com>
In-Reply-To: <20260823103523.554184-4-badal.nilawar@intel.com>
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

Series: Expose AMC alert reason sysfs
URL   : https://patchwork.freedesktop.org/series/172639/
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
commit 4b7f3a01dc389f9a2ec96cbb0477b9af3b109683
Author: Badal Nilawar <badal.nilawar@intel.com>
Date:   Sun Aug 23 16:05:26 2026 +0530

    drm/xe/i2c: Expose AMC Alert reason sysfs
    
    AMC raises an SMBUS alert before performing a power removal or
    power-cycle operation. The xe driver then places the device into
    vendor-specific wedge mode until the recovery is performed.
    
    Expose a read-only xe_amc_alert_reason sysfs attribute to help users
    identify the required recovery action.
    
    Assisted-by: Claude:claude-opus-4.8
    Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
+ /mt/dim checkpatch 5be31107a16ff0c0b64ae39a48854d7cac22fc2b drm-intel
d31c33aabd37 drm/xe/i2c: Not for review, Squash of I2C/AMC series
-:49: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#49: 
new file mode 100644

-:233: WARNING:ALLOC_WITH_SIZEOF: Prefer kzalloc_obj over kzalloc with sizeof
#233: FILE: drivers/gpu/drm/xe/xe_amc.c:180:
+	amc = kzalloc(sizeof(*amc), GFP_KERNEL);

-:424: CHECK:USLEEP_RANGE: usleep_range is preferred over udelay; see function description of usleep_range() and udelay().
#424: FILE: drivers/gpu/drm/xe/xe_i2c.c:232:
+		udelay(25);

total: 0 errors, 2 warnings, 1 checks, 791 lines checked
4b7f3a01dc38 drm/xe/i2c: Expose AMC Alert reason sysfs
-:17: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#17: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 120 lines checked


