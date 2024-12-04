Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9908DE7716D
	for <intel-xe@archiver.kernel.org>; Wed,  4 Dec 2024 16:32:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 688D910E2AF;
	Wed,  4 Dec 2024 16:32:11 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C87CA10E2AF;
 Wed,  4 Dec 2024 16:32:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/pps=3A_debug_log?=
 =?utf-8?q?_the_remaining_power_cycle_delay_to_wait?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 04 Dec 2024 16:32:09 -0000
Message-ID: <173332992981.2573370.14586319494546077710@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241204160048.2774419-1-jani.nikula@intel.com>
In-Reply-To: <20241204160048.2774419-1-jani.nikula@intel.com>
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

Series: drm/i915/pps: debug log the remaining power cycle delay to wait
URL   : https://patchwork.freedesktop.org/series/142126/
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
commit 6b3891d4c8568551c00adcb284f4b833c79ce477
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Wed Dec 4 18:00:48 2024 +0200

    drm/i915/pps: debug log the remaining power cycle delay to wait
    
    While pps_init_delays() debug logs the power cycle delay, also debug log
    the actual remaining time to wait in wait_panel_power_cycle().
    
    Note that this still isn't the full picture; the power sequencer may
    still wait after this one.
    
    Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13007
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 62d365d6c3078d7e4f34dd65735f6fcd7b53a856 drm-intel
6b3891d4c856 drm/i915/pps: debug log the remaining power cycle delay to wait


