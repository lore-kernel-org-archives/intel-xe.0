Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 119A8CD98F2
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jun 2026 16:34:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C756A10E78D;
	Mon, 22 Jun 2026 16:34:24 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45D5C10E785;
 Mon, 22 Jun 2026 16:34:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/i2c=3A_alerts_and_?=
 =?utf-8?q?controller_enabling_modifications?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Heikki Krogerus" <heikki.krogerus@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 22 Jun 2026 16:34:24 -0000
Message-ID: <178214606427.102380.4172414399324656925@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260622114759.3464047-1-heikki.krogerus@linux.intel.com>
In-Reply-To: <20260622114759.3464047-1-heikki.krogerus@linux.intel.com>
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

Series: drm/xe/i2c: alerts and controller enabling modifications
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
commit 6a8e2c0291e1711d9f26e3fa265a7219de42458a
Author: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Date:   Mon Jun 22 13:47:59 2026 +0200

    drm/xe/mcu_i2c: Take over control of the controller enabling
    
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
    
    Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
+ /mt/dim checkpatch 6583dd200482a34bb17e5dc54551f91f53b79798 drm-intel
b146b17eb5fc drm/xe/i2c: Handler for SMBus Alerts
-:9: WARNING:REPEATED_WORD: Possible repeated word: 'device'
#9: 
device device for them. The alert device makes sure that

-:147: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#147: 
new file mode 100644

total: 0 errors, 2 warnings, 0 checks, 166 lines checked
6a8e2c0291e1 drm/xe/mcu_i2c: Take over control of the controller enabling


