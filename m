Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3163E77180
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 13:18:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F180892A1;
	Thu, 12 Dec 2024 13:18:44 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9D9789220;
 Thu, 12 Dec 2024 13:18:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/dp=3A_Rework_LTTPR_tr?=
 =?utf-8?q?ansparent_mode_handling_and_add_support_to_msm_driver_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Abel Vesa" <abel.vesa@linaro.org>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 12 Dec 2024 13:18:43 -0000
Message-ID: <173400952375.1586471.18242211429252316444@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-0-d5906ed38b28@linaro.org>
In-Reply-To: <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-0-d5906ed38b28@linaro.org>
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

Series: drm/dp: Rework LTTPR transparent mode handling and add support to msm driver (rev2)
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
commit 447fe8f5502069bc672214741ee686f70285dc7f
Author: Abel Vesa <abel.vesa@linaro.org>
Date:   Wed Dec 11 15:04:15 2024 +0200

    drm/msm/dp: Add support for LTTPR handling
    
    Link Training Tunable PHY Repeaters (LTTPRs) are defined in DisplayPort
    1.4a specification. As the name suggests, these PHY repeaters are
    capable of adjusting their output for link training purposes.
    
    According to the DisplayPort standard, LTTPRs have two operating
    modes:
     - non-transparent - it replies to DPCD LTTPR field specific AUX
       requests, while passes through all other AUX requests
     - transparent - it passes through all AUX requests.
    
    Switching between this two modes is done by the DPTX by issuing
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
    
    Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
+ /mt/dim checkpatch 7b441ab54824526dd570dfbfbef51bcd2ba4c5b5 drm-intel
f3b3e5990ee1 drm/dp: Add helper to set LTTPRs in transparent mode
cdbc8d24d02b drm/nouveau/dp: Use the generic helper to control LTTPR transparent mode
2a5a1a5b748b drm/i915/dp: Use the generic helper to control LTTPR transparent mode
447fe8f55020 drm/msm/dp: Add support for LTTPR handling


