Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B11C982D8
	for <intel-xe@archiver.kernel.org>; Sun, 20 Sep 2026 15:09:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B9D110E2AA;
	Sun, 20 Sep 2026 15:09:04 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08AFB10E0F8;
 Sun, 20 Sep 2026 15:09:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm=3A_handle_IRQ=5FHPD_e?=
 =?utf-8?q?vents_correctly_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 20 Sep 2026 15:09:03 -0000
Message-ID: <178991694302.184334.9372679477065616336@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260920-hpd-irq-events-v5-0-ff1de0090c72@oss.qualcomm.com>
In-Reply-To: <20260920-hpd-irq-events-v5-0-ff1de0090c72@oss.qualcomm.com>
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

Series: drm: handle IRQ_HPD events correctly (rev6)
URL   : https://patchwork.freedesktop.org/series/164955/
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
commit a3ef28af43f1c0d596c4d43965f0c1bfd034e9db
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date:   Sun Sep 20 18:01:33 2026 +0300

    usb: typec: ucsi: huawei-gaokun: pass down HPD_IRQ events
    
    The DisplayPort standard defines a special kind of HPD events called
    IRQ_HPD. These events are used to notify DP Source about the events on
    the Sink side.
    
    Pass IRQ_HPD events from the EC to the HPD bridge, letting those
    to be delivered to the DisplayPort driver.
    
    Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
    Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
    Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+ /mt/dim checkpatch e56378c725f82208a52da0a3b5eecd67ddcbf750 drm-intel
45bfca58ecf7 drm/connector: report out-of-band IRQ_HPD events
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
#117: FILE: drivers/usb/typec/altmodes/displayport.c:854:
+		drm_connector_dp_oob_status(dp->connector_fwnode,
+						connector_status_disconnected,

total: 0 errors, 0 warnings, 4 checks, 120 lines checked
9707879bd546 drm/connector: pass down IRQ_HPD to the drivers
7a2ffaa2de1e drm/bridge: aux-hpd: let drivers pass IRQ_HPD events
07bc8de0c800 drm/bridge: pass extra events to the HPD callback
ab907adb335f drm/bridge: pass down IRQ_HPD to the drivers
c43e89478b2e drm/msm: dp: handle the IRQ_HPD events reported by USB-C
efdd1bae1b8c soc: qcom: pmic-glink-altmode: pass down HPD_IRQ events
a3ef28af43f1 usb: typec: ucsi: huawei-gaokun: pass down HPD_IRQ events


