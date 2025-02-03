Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22E9FC02192
	for <intel-xe@archiver.kernel.org>; Mon,  3 Feb 2025 13:48:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E984210E055;
	Mon,  3 Feb 2025 13:48:29 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F7EE10E055;
 Mon,  3 Feb 2025 13:48:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/dp=3A_Rework_LTTPR_tr?=
 =?utf-8?q?ansparent_mode_handling_and_add_support_to_msm_driver_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Abel Vesa" <abel.vesa@linaro.org>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 03 Feb 2025 13:48:28 -0000
Message-ID: <173859050851.350570.5634010541514513645@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250203-drm-dp-msm-add-lttpr-transparent-mode-set-v5-0-c865d0e56d6e@linaro.org>
In-Reply-To: <20250203-drm-dp-msm-add-lttpr-transparent-mode-set-v5-0-c865d0e56d6e@linaro.org>
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

Series: drm/dp: Rework LTTPR transparent mode handling and add support to msm driver (rev5)
URL   : https://patchwork.freedesktop.org/series/140802/
State : success

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
commit 2ea52bc6c91534d9d0c73227e0749213dfad6400
Author: Abel Vesa <abel.vesa@linaro.org>
Date:   Mon Feb 3 12:57:59 2025 +0200

    drm/msm/dp: Add support for LTTPR handling
    
    Link Training Tunable PHY Repeaters (LTTPRs) are defined in DisplayPort
    1.4a specification. As the name suggests, these PHY repeaters are
    capable of adjusting their output for link training purposes.
    
    According to the DisplayPort standard, LTTPRs have two operating
    modes:
     - non-transparent - it replies to DPCD LTTPR field specific AUX
       requests, while passes through all other AUX requests
     - transparent - it passes through all AUX requests.
    
    Switching between these two modes is done by the DPTX by issuing
    an AUX write to the DPCD PHY_REPEATER_MODE register.
    
    The msm DP driver is currently lacking any handling of LTTPRs.
    This means that if at least one LTTPR is found between DPTX and DPRX,
    the link training would fail if that LTTPR was not already configured
    in transparent mode.
    
    The section 3.6.6.1 from the DisplayPort v2.0 specification mandates
    that before link training with the LTTPR is started, the DPTX may place
    the LTTPR in non-transparent mode by first switching to transparent mode
    and then to non-transparent mode. This operation seems to be needed only
    on first link training and doesn't need to be done again until device is
    unplugged.
    
    It has been observed on a few X Elite-based platforms which have
    such LTTPRs in their board design that the DPTX needs to follow the
    procedure described above in order for the link training to be successful.
    
    So add support for reading the LTTPR DPCD caps to figure out the number
    of such LTTPRs first. Then, for platforms (or Type-C dongles) that have
    at least one such an LTTPR, set its operation mode to transparent mode
    first and then to non-transparent, just like the mentioned section of
    the specification mandates.
    
    Tested-by: Johan Hovold <johan+linaro@kernel.org>
    Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
    Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
    Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
+ /mt/dim checkpatch 6b9207835048700bdfc9c486012a5b27f9c909ba drm-intel
4581b2f83233 drm/dp: Add helper to set LTTPRs in transparent mode
5b0b923c6431 drm/nouveau/dp: Use the generic helper to control LTTPR transparent mode
c81a960f4b89 drm/i915/dp: Use the generic helper to control LTTPR transparent mode
2ea52bc6c915 drm/msm/dp: Add support for LTTPR handling


