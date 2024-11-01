Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5BCEE6B242
	for <intel-xe@archiver.kernel.org>; Fri,  1 Nov 2024 10:56:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACA0D10E99F;
	Fri,  1 Nov 2024 10:56:43 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75F0210E9A0;
 Fri,  1 Nov 2024 10:56:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/dp=3A_Rework_LTTPR_tr?=
 =?utf-8?q?ansparent_mode_handling_and_add_support_to_msm_driver?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Abel Vesa" <abel.vesa@linaro.org>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 01 Nov 2024 10:56:42 -0000
Message-ID: <173045860247.1387145.10991196160259162098@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241031-drm-dp-msm-add-lttpr-transparent-mode-set-v1-0-cafbb9855f40@linaro.org>
In-Reply-To: <20241031-drm-dp-msm-add-lttpr-transparent-mode-set-v1-0-cafbb9855f40@linaro.org>
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

Series: drm/dp: Rework LTTPR transparent mode handling and add support to msm driver
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
commit 599aa4854adf78c898348c3b8b691d1de4bc1d7c
Author: Abel Vesa <abel.vesa@linaro.org>
Date:   Thu Oct 31 17:12:48 2024 +0200

    drm/msm/dp: Add support for LTTPR handling
    
    Link Training Tunable PHY Repeaters (LTTPRs) are defined in DisplayPort
    1.4a specification. As the name suggests, these PHY repeaters are
    capable of adjusting their output for link training purposes.
    
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
+ /mt/dim checkpatch 73837e0500d417f9ff3afdf145ee7e1b152d9c24 drm-intel
56b40b638ad4 drm/dp: Add helper to set LTTPRs in transparent mode
d7f6e3e525e3 drm/nouveau/dp: Use the generic helper to control LTTPR transparent mode
d3c8e0104029 drm/i915/dp: Use the generic helper to control LTTPR transparent mode
599aa4854adf drm/msm/dp: Add support for LTTPR handling


