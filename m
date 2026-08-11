Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25553C5B56A
	for <intel-xe@archiver.kernel.org>; Tue, 11 Aug 2026 12:18:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA10510E30E;
	Tue, 11 Aug 2026 12:17:59 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86C2D10E30E;
 Tue, 11 Aug 2026 12:17:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/i2c=3A_alerts_and_?=
 =?utf-8?q?controller_enabling_modifications_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Heikki Krogerus" <heikki.krogerus@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 11 Aug 2026 12:17:58 -0000
Message-ID: <178645067854.37993.9266318995291072586@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260811121008.1493015-1-heikki.krogerus@linux.intel.com>
In-Reply-To: <20260811121008.1493015-1-heikki.krogerus@linux.intel.com>
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

Series: drm/xe/i2c: alerts and controller enabling modifications (rev7)
URL   : https://patchwork.freedesktop.org/series/168930/
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
commit f484168ca9be2ab9cde3be22ecaf00e7bcefb08b
Author: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Date:   Tue Aug 11 14:10:08 2026 +0200

    drm/xe/i2c: Keep the i2c controller always enabled
    
    Some platforms make an assumption that the i2c controller's
    enabled state indicates also the power state of the
    controller. This can create a problem when the controller is
    in disabled state, because the hardware may assume
    incorrectly that it is then also in low-power state.
    
    To fix this, the controller is kept enabled by taking over
    the IC_ENABLE register. The controller has to be disabled
    when the configuration is updated and when the target
    address or the slave address are assigned, so disabling it
    when IC_CON, IC_TAR or IC_SAR registers are programmed, and
    then re-enabling it again.
    
    Fixes: f0e53aadd702 ("drm/xe: Support for I2C attached MCUs")
    Cc: stable@vger.kernel.org
    Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
+ /mt/dim checkpatch dc462ab791b686c48545c160ecc81be64f77a846 drm-intel
fcee54ac36b2 i2c: designware: Global register definitions
-:191: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#191: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 250 lines checked
cf789b238777 drm/xe/i2c: Fix the interrupt handling
-:51: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#51: 
new file mode 100644

-:235: WARNING:ALLOC_WITH_SIZEOF: Prefer kzalloc_obj over kzalloc with sizeof
#235: FILE: drivers/gpu/drm/xe/xe_amc.c:180:
+	amc = kzalloc(sizeof(*amc), GFP_KERNEL);

total: 0 errors, 2 warnings, 0 checks, 485 lines checked
f484168ca9be drm/xe/i2c: Keep the i2c controller always enabled
-:52: CHECK:USLEEP_RANGE: usleep_range is preferred over udelay; see function description of usleep_range() and udelay().
#52: FILE: drivers/gpu/drm/xe/xe_i2c.c:232:
+		udelay(25);

total: 0 errors, 0 warnings, 1 checks, 78 lines checked


