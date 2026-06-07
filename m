Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6FDCCD8C90
	for <intel-xe@archiver.kernel.org>; Sun,  7 Jun 2026 21:43:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56CD710E5D3;
	Sun,  7 Jun 2026 21:43:04 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F51010E5D1;
 Sun,  7 Jun 2026 21:43:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm=3A_handle_IRQ=5FHPD_e?=
 =?utf-8?q?vents_correctly_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 07 Jun 2026 21:43:03 -0000
Message-ID: <178086858328.51703.234831165913222571@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260608-hpd-irq-events-v4-0-30b62b335487@oss.qualcomm.com>
In-Reply-To: <20260608-hpd-irq-events-v4-0-30b62b335487@oss.qualcomm.com>
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

Series: drm: handle IRQ_HPD events correctly (rev5)
URL   : https://patchwork.freedesktop.org/series/164955/
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
commit feccfd4f351e11289907697b8b6dddfe6d0d6a27
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date:   Mon Jun 8 00:33:09 2026 +0300

    usb: typec: ucsi: huawei-gaokun: pass down HPD_IRQ events
    
    The DisplayPort standard defines a special kind of HPD events called
    IRQ_HPD. These events are used to notify DP Source about the events on
    the Sink side.
    
    Pass IRQ_HPD events from the EC to the HPD bridge, letting those
    to be delivered to the DisplayPort driver.
    
    Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
    Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
    Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+ /mt/dim checkpatch 98b708c6794c9789a7d7caa89aa5967c6df413fe drm-intel
3f525e29394f drm/connector: report out-of-band IRQ_HPD events
-:76: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#76: FILE: drivers/usb/typec/altmodes/displayport.c:191:
+		drm_connector_dp_oob_status(dp->connector_fwnode,
 						hpd ? connector_status_connected :

-:91: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#91: FILE: drivers/usb/typec/altmodes/displayport.c:217:
+		drm_connector_dp_oob_status(dp->connector_fwnode,
+						connector_status_connected,

-:105: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#105: FILE: drivers/usb/typec/altmodes/displayport.c:405:
+				drm_connector_dp_oob_status(dp->connector_fwnode,
+								connector_status_disconnected,

-:117: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#117: FILE: drivers/usb/typec/altmodes/displayport.c:838:
+		drm_connector_dp_oob_status(dp->connector_fwnode,
+						connector_status_disconnected,

total: 0 errors, 0 warnings, 4 checks, 120 lines checked
0bc54ad9062a drm/connector: pass down IRQ_HPD to the drivers
f84fecfc3b35 drm/bridge: aux-hpd: let drivers pass IRQ_HPD events
751eecd98a78 drm/bridge: pass extra events to the HPD callback
e36aa325a26e drm/bridge: pass down IRQ_HPD to the drivers
30c7a37caf7b drm/msm: dp: handle the IRQ_HPD events reported by USB-C
9e6e969f75da soc: qcom: pmic-glink-altmode: pass down HPD_IRQ events
feccfd4f351e usb: typec: ucsi: huawei-gaokun: pass down HPD_IRQ events


