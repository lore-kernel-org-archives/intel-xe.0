Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 293F6D1039A
	for <intel-xe@archiver.kernel.org>; Mon, 28 Oct 2024 13:25:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F35710E4AA;
	Mon, 28 Oct 2024 13:25:16 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAA4F10E4AA;
 Mon, 28 Oct 2024 13:25:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/psr=3A_WA_for_pa?=
 =?utf-8?q?nels_stating_bad_link_status_after_PSR_is_enabled?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Hogander, Jouni" <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 28 Oct 2024 13:25:14 -0000
Message-ID: <173012191495.1354457.17872100231105227612@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241028074642.804895-1-jouni.hogander@intel.com>
In-Reply-To: <20241028074642.804895-1-jouni.hogander@intel.com>
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

Series: drm/i915/psr: WA for panels stating bad link status after PSR is enabled
URL   : https://patchwork.freedesktop.org/series/140571/
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
commit 69da4cb6cb90dc7a19558f47d54cf02a5f4a69bc
Author: Jouni Högander <jouni.hogander@intel.com>
Date:   Mon Oct 28 09:46:42 2024 +0200

    drm/i915/psr: WA for panels stating bad link status after PSR is enabled
    
    We are currently seeing unexpected link trainings with several different
    eDP panels. These are caused by these panels stating bad link status in
    their dpcd registers. This can be observed by doing following test:
    
    1. Boot up without Xe module loaded
    
    2. Load Xe module with PSR disabled:
        $ modprobe xe  enable_psr=0
    
    3. Read panel link status register
        $ dpcd_reg read --offset 0x200e --count=1
        0x200e:  00
    
    4. Enable PSR, sleep for 2 seconds and disable PSR again:
    
        $ echo 0x1 > /sys/kernel/debug/dri/0/i915_edp_psr_debug
        $ echo "-1" > /sys/kernel/debug/dri/0000:00:02.0/xe_params/enable_psr
        $ echo 0x0 > /sys/kernel/debug/dri/0/i915_edp_psr_debug
        $ sleep 2
        $ cat /sys/kernel/debug/dri/0/i915_edp_psr_status | grep status
        $ echo 0x1 > /sys/kernel/debug/dri/0/i915_edp_psr_debug
        Source PSR/PanelReplay status: DEEP_SLEEP [0x80310030]
    
    5. Now read panel link status registers again:
        $ dpcd_reg read --offset 0x200e --count=1
        0x200e:  80
    
    Workaround this by not trusting link status registers after PSR is enabled
    until first short pulse interrupt is received.
    
    Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
+ /mt/dim checkpatch c2877b9a7941e5b9c9e48d653e3a8917495ed681 drm-intel
69da4cb6cb90 drm/i915/psr: WA for panels stating bad link status after PSR is enabled


