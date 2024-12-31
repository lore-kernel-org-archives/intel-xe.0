Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD51EE7718B
	for <intel-xe@archiver.kernel.org>; Tue, 31 Dec 2024 16:33:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8916910E689;
	Tue, 31 Dec 2024 16:33:50 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D671710E689;
 Tue, 31 Dec 2024 16:33:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/pmdemand=3A_clea?=
 =?utf-8?q?nups?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 31 Dec 2024 16:33:48 -0000
Message-ID: <173566282887.1365832.17230181181904890086@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <cover.1735662324.git.jani.nikula@intel.com>
In-Reply-To: <cover.1735662324.git.jani.nikula@intel.com>
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

Series: drm/i915/pmdemand: cleanups
URL   : https://patchwork.freedesktop.org/series/143041/
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
commit a522b20d0e3551c3854bc26d31f43bba2ec50c93
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Tue Dec 31 18:27:40 2024 +0200

    drm/i915/display: convert global state to struct intel_display
    
    Going forward, struct intel_display is the main display device
    structure. Convert intel_global_state.[ch] to it.
    
    This allows us to make intel_pmdemand.c completely independent of
    i915_drv.h.
    
    Cc: Gustavo Sousa <gustavo.sousa@intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 08bd590935a5258ffd79355c59adffd72fb2c642 drm-intel
31ea87d13426 drm/i915/pmdemand: convert to_intel_pmdemand_state() to a function
fec01b6dfe80 drm/i915/pmdemand: make struct intel_pmdemand_state opaque
729b62811e24 drm/i915/pmdemand: convert to struct intel_display
a522b20d0e35 drm/i915/display: convert global state to struct intel_display


