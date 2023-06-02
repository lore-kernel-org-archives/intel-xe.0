Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F29C7EE2D
	for <intel-xe@archiver.kernel.org>; Fri,  2 Jun 2023 18:40:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BECD310E618;
	Fri,  2 Jun 2023 18:40:02 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9949910E60B;
 Fri,  2 Jun 2023 18:40:00 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 96705AADE3;
 Fri,  2 Jun 2023 18:40:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Date: Fri, 02 Jun 2023 18:40:00 -0000
Message-ID: <168573120061.15698.6437829926071493520@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230602175444.3511273-1-jani.nikula@intel.com>
In-Reply-To: <20230602175444.3511273-1-jani.nikula@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_se?=
 =?utf-8?q?ries_starting_with_=5B1/4=5D_Revert_=22drm/i915/display=3A_Fix_?=
 =?utf-8?q?a_use-after-free_when_intel=5Fedp=5Finit=5Fconnector_fails=22?=
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

Series: series starting with [1/4] Revert "drm/i915/display: Fix a use-after-free when intel_edp_init_connector fails"
URL   : https://patchwork.freedesktop.org/series/118794/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 431dae93bbf2cc99fd1820be26788f6c47fbac80
Author: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date:   Fri Jun 2 20:54:44 2023 +0300

    drm/i915: Remove i915_drm_suspend_mode
    
    enum i915_drm_suspend_mode suspend_mode is only used in
    intel_display_power, while we only care about whether we perform a
    s2idle. Remove it and use a simple bool.
    
    v2: Rebase
    
    Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> # v1
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
    Link: https://patchwork.freedesktop.org/patch/msgid/20230529105900.1942814-1-jani.nikula@intel.com
    (cherry picked from commit c7b5abd3e030718b6666cdf766f8905b006a9b1b)
+ /mt/dim checkpatch ef153c77d25ffd86b074190b77f9f561b9a5a909 drm-intel
56c543e7e Revert "drm/i915/display: Fix a use-after-free when intel_edp_init_connector fails"
-:7: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'b0e69bfaee88d13127511ecbaac2001a2e111159', maybe rebased or not pulled?
#7: 
This reverts commit b0e69bfaee88d13127511ecbaac2001a2e111159.

-:9: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'f917130f19fe', maybe rebased or not pulled?
#9: 
To be replaced with backport of upstream commit f917130f19fe ("drm/i915:

total: 0 errors, 2 warnings, 0 checks, 23 lines checked
403d26f7b drm/i915: Flush power delayed put when connector init failed
8ecf4aa9c Revert "drm/i915/display: Remove i915_drm_suspend_mode"
-:6: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '8b346b4184e2b6e4a96d1c6bce1d4d1b0916b032', maybe rebased or not pulled?
#6: 
This reverts commit 8b346b4184e2b6e4a96d1c6bce1d4d1b0916b032.

-:8: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'c7b5abd3e030', maybe rebased or not pulled?
#8: 
To be replaced with backport of upstream commit c7b5abd3e030 ("drm/i915:

total: 0 errors, 2 warnings, 0 checks, 81 lines checked
431dae93b drm/i915: Remove i915_drm_suspend_mode


