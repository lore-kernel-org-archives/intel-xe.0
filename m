Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D88B3C83038
	for <intel-xe@archiver.kernel.org>; Tue,  1 Jul 2025 12:28:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9845E10E03E;
	Tue,  1 Jul 2025 12:28:37 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2B6F10E03E;
 Tue,  1 Jul 2025 12:28:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_i2c_support_=28?=
 =?utf-8?q?rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Heikki Krogerus" <heikki.krogerus@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 01 Jul 2025 12:28:36 -0000
Message-ID: <175137291692.123583.2949800642150017515@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250701122252.2590230-1-heikki.krogerus@linux.intel.com>
In-Reply-To: <20250701122252.2590230-1-heikki.krogerus@linux.intel.com>
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

Series: drm/xe: i2c support (rev6)
URL   : https://patchwork.freedesktop.org/series/149699/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f8ff75ae1d2127635239b134695774ed4045d05b
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1fc9fee6df0e31f875d061c04a10c6a9b0abfe0b
Author: Riana Tauro <riana.tauro@intel.com>
Date:   Tue Jul 1 15:22:52 2025 +0300

    drm/xe/xe_i2c: Add support for i2c in survivability mode
    
    Initialize i2c in survivability mode to allow firmware
    update of Add-In Management Controller (AMC) in
    survivability mode.
    
    Signed-off-by: Riana Tauro <riana.tauro@intel.com>
    Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
    Reviewed-by: Raag Jadav <raag.jadav@intel.com>
    Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
+ /mt/dim checkpatch 9f3690735949ad5f24ece89cf2e91c2750ea580f drm-intel
cf5044118b7c i2c: designware: Use polling by default when there is no irq resource
ca9127e99159 i2c: designware: Add quirk for Intel Xe
-:9: WARNING:BAD_SIGN_OFF: Non-standard signature: Originally-by:
#9: 
Originally-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

total: 0 errors, 1 warnings, 0 checks, 24 lines checked
acd550ef8110 drm/xe: Support for I2C attached MCUs
-:14: WARNING:BAD_SIGN_OFF: Non-standard signature: Originally-by:
#14: 
Originally-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

-:44: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#44: 
new file mode 100644

-:153: WARNING:SPDX_LICENSE_TAG: Improper SPDX comment style for 'drivers/gpu/drm/xe/xe_i2c.c', please use '//' instead
#153: FILE: drivers/gpu/drm/xe/xe_i2c.c:1:
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */

-:153: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#153: FILE: drivers/gpu/drm/xe/xe_i2c.c:1:
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */

total: 0 errors, 4 warnings, 0 checks, 457 lines checked
d4c211f8d91b drm/xe/pm: Wire up suspend/resume for I2C controller
1fc9fee6df0e drm/xe/xe_i2c: Add support for i2c in survivability mode


