Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D6DED1CA09
	for <intel-xe@archiver.kernel.org>; Mon,  4 Nov 2024 22:56:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B27810E4E4;
	Mon,  4 Nov 2024 22:56:46 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9A9010E4E4;
 Mon,  4 Nov 2024 22:56:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/xe3lpd=3A_Update?=
 =?utf-8?q?_HDCP_rekying_bit?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 04 Nov 2024 22:56:44 -0000
Message-ID: <173076100495.1409612.6881044692532847943@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241104185055.739605-1-suraj.kandpal@intel.com>
In-Reply-To: <20241104185055.739605-1-suraj.kandpal@intel.com>
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

Series: drm/i915/xe3lpd: Update HDCP rekying bit
URL   : https://patchwork.freedesktop.org/series/140891/
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
commit fa205289506599310f5bb3ae27499ec8f3b5797d
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Tue Nov 5 00:20:55 2024 +0530

    drm/i915/xe3lpd: Update HDCP rekying bit
    
    The TRANS_DDI_FUNC_CTL bit used to enable/disable HDCP rekeying
    has moved from bit 12 (Xe2) to bit 15 (Xe3); update the RMW
    toggle accordingly.
    Also drop the misleading workaround comment tag on this function
    since disabling of HDCP rekeying is something that happens on
    all platforms, not just those impacted by that workaround.
    While we're here, also re-order the if/else ladder to use
    standard "newest platform first" order.
    
    v2: add additional definition instead of function, commit message typo
    fix and update.
    v3: restore lost conditional from v2.
    v4: subject line and subject message updated, fix the if ladder order,
    fix the bit definition order.
    v5: Add the bspec link and remove the Wa comment tag
    v6: Rebase over new changes
    v7: Fix commit subject and message, reladder the if/else blocks
    
    Bspec: 69964
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch a4532bcf5eea0cfdb56fbdc3195a2d15d193727b drm-intel
fa2052895065 drm/i915/xe3lpd: Update HDCP rekying bit


