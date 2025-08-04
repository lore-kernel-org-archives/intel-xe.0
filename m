Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB34C87FDA
	for <intel-xe@archiver.kernel.org>; Mon,  4 Aug 2025 06:45:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1659110E12F;
	Mon,  4 Aug 2025 06:45:14 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCEE210E12F;
 Mon,  4 Aug 2025 06:45:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Wait_PSR_idle_before_on_d?=
 =?utf-8?q?sb_commit?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 04 Aug 2025 06:45:12 -0000
Message-ID: <175428991283.208773.17708836998047658294@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250804061615.932508-1-jouni.hogander@intel.com>
In-Reply-To: <20250804061615.932508-1-jouni.hogander@intel.com>
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

Series: Wait PSR idle before on dsb commit
URL   : https://patchwork.freedesktop.org/series/152470/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c298eac5978c38dcc62a70c0d73c91765e7cc296
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 49437b846a008884c8a0cb34bfa6768d2441070d
Author: Jouni Högander <jouni.hogander@intel.com>
Date:   Mon Aug 4 09:16:15 2025 +0300

    drm/i915/psr: Add poll for checking PSR is idle before starting update
    
    We are currently observing crc failures after we started using dsb for PSR
    updates as well. This seems to happen because PSR HW is still sending
    couple of updates using old framebuffers on wake-up.
    
    Fix this by adding poll ensuring PSR is idle before starting update.
    
    Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
+ /mt/dim checkpatch 88abc8239a17ea427f6d6bef8f9807fde5bf7cfb drm-intel
a53c2a4c44b7 drm/i915/psr: Pass intel_crtc_state instead of intel_dp in wait_for_idle
0cc13c8f4dac drm/i915/psr: Add new define for PSR idle timeout
d2f040613ec9 drm/i915/psr: New interface adding PSR idle poll into dsb commit
-:14: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#14: 
This patch is preparing to fix that by adding interface which can be used to

-:15: WARNING:REPEATED_WORD: Possible repeated word: 'dsb'
#15: 
add poll ensuring PSR HW is idle into dsb dsb commit.

total: 0 errors, 2 warnings, 0 checks, 52 lines checked
49437b846a00 drm/i915/psr: Add poll for checking PSR is idle before starting update


