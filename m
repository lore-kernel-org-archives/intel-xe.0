Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE5B4C02193
	for <intel-xe@archiver.kernel.org>; Mon,  3 Feb 2025 21:26:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 835AA10E139;
	Mon,  3 Feb 2025 21:26:06 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 890BF10E139;
 Mon,  3 Feb 2025 21:26:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/dmc=5Fwl=3A_Trac?=
 =?utf-8?q?k_INITIATE=5FPM=5FDMD=5FREQ_for_DC5?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 03 Feb 2025 21:26:05 -0000
Message-ID: <173861796555.514132.10375656655696315302@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250203205941.251754-1-gustavo.sousa@intel.com>
In-Reply-To: <20250203205941.251754-1-gustavo.sousa@intel.com>
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

Series: drm/i915/dmc_wl: Track INITIATE_PM_DMD_REQ for DC5
URL   : https://patchwork.freedesktop.org/series/144277/
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
commit 62e8382f88d4c2cd634cfeb84707e2dd85e8d7e7
Author: Gustavo Sousa <gustavo.sousa@intel.com>
Date:   Mon Feb 3 17:58:58 2025 -0300

    drm/i915/dmc_wl: Track INITIATE_PM_DMD_REQ for DC5
    
    The Bspec has been updated to include INITIATE_PM_DMD_REQ in the set of
    register offsets that require the DMC wakelock for access during DC5.
    Update our table accordingly.
    
    Bspec: 71583
    Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
+ /mt/dim checkpatch 2e608df15605e5c7af9a92d764d4002619fab7a9 drm-intel
62e8382f88d4 drm/i915/dmc_wl: Track INITIATE_PM_DMD_REQ for DC5


