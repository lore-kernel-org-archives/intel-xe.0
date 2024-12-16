Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00AA2E7717F
	for <intel-xe@archiver.kernel.org>; Mon, 16 Dec 2024 19:20:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB0F110E775;
	Mon, 16 Dec 2024 19:20:01 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7D3D10E76F;
 Mon, 16 Dec 2024 19:20:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/cx0=5Fphy=3A_Fix?=
 =?utf-8?q?_C10_pll_programming_sequence?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 16 Dec 2024 19:20:00 -0000
Message-ID: <173437680074.3389043.5265862999949263677@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241216181554.2861381-1-suraj.kandpal@intel.com>
In-Reply-To: <20241216181554.2861381-1-suraj.kandpal@intel.com>
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

Series: drm/i915/cx0_phy: Fix C10 pll programming sequence
URL   : https://patchwork.freedesktop.org/series/142670/
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
commit 29853f078998a7936035348b622cf8d3956c0234
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Mon Dec 16 23:45:54 2024 +0530

    drm/i915/cx0_phy: Fix C10 pll programming sequence
    
    According to spec VDR_CUSTOM_WIDTH register gets programmed after pll
    specific VDR registers and TX Lane programming registers are done.
    Moreover we only program into C10_VDR_CONTROL1 to update config and
    setup master lane once all VDR registers are written into.
    Bspec: 67636
    
    Fixes: 51390cc0e00a ("drm/i915/mtl: Add Support for C10 PHY message bus and pll programming")
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch 49cc582754c205bbe43d4ef2b1fd3894bee1f3bd drm-intel
29853f078998 drm/i915/cx0_phy: Fix C10 pll programming sequence


