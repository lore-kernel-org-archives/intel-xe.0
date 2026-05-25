Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC865CD5BB1
	for <intel-xe@archiver.kernel.org>; Mon, 25 May 2026 13:57:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75A0410E34C;
	Mon, 25 May 2026 13:57:46 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DDCF10E31A;
 Mon, 25 May 2026 13:57:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/dp=3A_Add_DSC_virtual?=
 =?utf-8?q?_DPCD_quirk_for_Realtek_MST_branch_device?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 25 May 2026 13:57:44 -0000
Message-ID: <177971746451.5829.6068296557126707818@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260525125516.2794636-1-imre.deak@intel.com>
In-Reply-To: <20260525125516.2794636-1-imre.deak@intel.com>
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

Series: drm/dp: Add DSC virtual DPCD quirk for Realtek MST branch device
URL   : https://patchwork.freedesktop.org/series/167215/
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
commit a0b98ed67adef2aedd4e1de2f38897d44ea69f99
Author: Imre Deak <imre.deak@intel.com>
Date:   Mon May 25 15:55:16 2026 +0300

    drm/dp: Add DSC virtual DPCD quirk for Realtek MST branch device
    
    The ASUS DC301 USB-C dock containing a Realtek MST branch device
    supports the DSC decompression functionality on each of the dock's
    downstream connectors, even though there is no discoverable peer-to-peer
    virtual device in the MST topology (which the DP Standard
    requires/suggests to control the DSC functionality on a per-DFP basis).
    Add the DP_DPCD_QUIRK_DSC_WITHOUT_VIRTUAL_DPCD quirk for this branch
    device as well to enable the DSC decompression functionality on all DFP
    connectors of the dock, similarly to how this is done for dock's
    containing older Synaptics branch devices.
    
    Cc: Lyude Paul <lyude@redhat.com>
    Reported-and-tested-by: Shawn C Lee <shawn.c.lee@intel.com>
    Signed-off-by: Imre Deak <imre.deak@intel.com>
+ /mt/dim checkpatch 04d475020800d0a1033ca89a0d6d5fc638ddc65b drm-intel
a0b98ed67ade drm/dp: Add DSC virtual DPCD quirk for Realtek MST branch device
-:18: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#18: 
Reported-and-tested-by: Shawn C Lee <shawn.c.lee@intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>

-:30: WARNING:LONG_LINE: line length of 124 exceeds 100 columns
#30: FILE: drivers/gpu/drm/display/drm_dp_helper.c:2550:
+	{ OUI(0x00, 0xe0, 0x4c), DEVICE_ID('D', 'p', '1', '.', '4', 0), true, BIT(DP_DPCD_QUIRK_DSC_WITHOUT_VIRTUAL_DPCD) },

total: 0 errors, 2 warnings, 0 checks, 8 lines checked


