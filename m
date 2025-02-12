Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC735C021A0
	for <intel-xe@archiver.kernel.org>; Wed, 12 Feb 2025 18:03:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85BA110E966;
	Wed, 12 Feb 2025 18:03:50 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E8D810E967;
 Wed, 12 Feb 2025 18:03:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm=3A_Fix_DSC_BPP_increm?=
 =?utf-8?q?ent_decoding?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 12 Feb 2025 18:03:49 -0000
Message-ID: <173938342957.1381191.2082513457942594690@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250212161851.4007005-1-imre.deak@intel.com>
In-Reply-To: <20250212161851.4007005-1-imre.deak@intel.com>
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

Series: drm: Fix DSC BPP increment decoding
URL   : https://patchwork.freedesktop.org/series/144742/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 7be1c13470aa7def0a7404a6927566a7e301f350
Author: Imre Deak <imre.deak@intel.com>
Date:   Wed Feb 12 18:18:51 2025 +0200

    drm: Fix DSC BPP increment decoding
    
    Starting with DPCD version 2.0 bits 6:3 of the DP_DSC_BITS_PER_PIXEL_INC
    DPCD register contains the NativeYCbCr422_MAX_bpp_DELTA field, which can
    be non-zero as opposed to earlier DPCD versions, hence decoding the
    bit_per_pixel increment value at bits 2:0 in the same register requires
    applying a mask, do so.
    
    Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
    Fixes: 0c2287c96521 ("drm/display/dp: Add helper function to get DSC bpp precision")
    Signed-off-by: Imre Deak <imre.deak@intel.com>
    Reviewed-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch b9696aa14a67620661572e94f4141df2a4b6b5cd drm-intel
7be1c13470aa drm: Fix DSC BPP increment decoding


