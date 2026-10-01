Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1D07CA5FCB
	for <intel-xe@archiver.kernel.org>; Thu,  1 Oct 2026 12:02:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62DAA10F4BF;
	Thu,  1 Oct 2026 12:02:41 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22A6010F4BF;
 Thu,  1 Oct 2026 12:02:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/i2c=3A_Expose_AMC_?=
 =?utf-8?q?Alert_reason_sysfs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 01 Oct 2026 12:02:40 -0000
Message-ID: <179085616013.228408.2405310471094949280@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20261001121302.4102629-2-badal.nilawar@intel.com>
In-Reply-To: <20261001121302.4102629-2-badal.nilawar@intel.com>
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

Series: drm/xe/i2c: Expose AMC Alert reason sysfs
URL   : https://patchwork.freedesktop.org/series/175359/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6bef5ce5c74dc76b4ee69ab2832c0d1fd63c91c7
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 053cbf11e161bda870cd5a5954c93c500c7f1f42
Author: Badal Nilawar <badal.nilawar@intel.com>
Date:   Thu Oct 1 17:43:03 2026 +0530

    drm/xe/i2c: Expose AMC Alert reason sysfs
    
    AMC raises an SMBUS alert before performing a power removal or
    power-cycle operation. The xe driver then places the device into
    vendor-specific wedge mode until the recovery is performed.
    
    Expose a read-only xe_amc_alert_reason sysfs attribute to help users
    identify the required recovery action.
    
    Assisted-by: Claude:claude-opus-4.8
    Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
+ /mt/dim checkpatch 48433f4760819252dafd6bf71d1c0e4f38415842 drm-intel
053cbf11e161 drm/xe/i2c: Expose AMC Alert reason sysfs
-:17: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#17: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 160 lines checked


