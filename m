Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 053E0E784A4
	for <intel-xe@archiver.kernel.org>; Mon,  2 Oct 2023 08:01:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51D2310E225;
	Mon,  2 Oct 2023 08:01:05 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id C41DB10E232;
 Mon,  2 Oct 2023 08:00:52 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 5B006ACC1F;
 Mon,  2 Oct 2023 08:00:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Date: Mon, 02 Oct 2023 08:00:52 -0000
Message-ID: <169623365235.3205.13519092976918894821@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231002065802.3609656-1-jouni.hogander@intel.com>
In-Reply-To: <20231002065802.3609656-1-jouni.hogander@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Ba?=
 =?utf-8?q?ckport_including_i915=5Factive=2Eh_in_intel=5Ffrontbuffer=2Ec?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: Backport including i915_active.h in intel_frontbuffer.c
URL   : https://patchwork.freedesktop.org/series/124501/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 452f7accb70ae30c17312d5d2b88bbe6695cae98
Author: Jouni Högander <jouni.hogander@intel.com>
Date:   Mon Oct 2 09:58:02 2023 +0300

    drm/i915/display: Include i915_active header in frontbuffer tracking code
    
    Intel frontbuffer tracking code is using i915_active functions -> include
    i915_active.h directly instead of relying getting indirectly included.
    
    Cc: Jani Nikula <jani.nikula@intel.com>
    
    Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
    Reviewed-by: Jani Nikula <jani.nikula@intel.com>
    Link: https://patchwork.freedesktop.org/patch/msgid/20230929112047.1151914-1-jouni.hogander@intel.com
    (cherry picked from commit f52d1493dfbf9ba421bb3f84a798cc309128b728)
+ /mt/dim checkpatch 22fcf2404f56a8e7aea6734298e0b2b265136313 drm-intel
2e048c6fa Revert "drm/i915/display: Include i915_active header"
-:9: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '6ca0e8966a68524d292d1b5448963454a0878a01', maybe rebased or not pulled?
#9: 
This reverts commit 6ca0e8966a68524d292d1b5448963454a0878a01.

total: 0 errors, 1 warnings, 0 checks, 7 lines checked
452f7accb drm/i915/display: Include i915_active header in frontbuffer tracking code


