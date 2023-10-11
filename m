Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D38CD6E61
	for <intel-xe@archiver.kernel.org>; Wed, 11 Oct 2023 12:19:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1003210E4E2;
	Wed, 11 Oct 2023 12:19:38 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4297F10E4E2;
 Wed, 11 Oct 2023 12:19:35 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 40B22AADF2;
 Wed, 11 Oct 2023 12:19:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Date: Wed, 11 Oct 2023 12:19:35 -0000
Message-ID: <169702677526.26513.1684791814167308654@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231002104037.1923861-1-jani.nikula@intel.com>
In-Reply-To: <20231002104037.1923861-1-jani.nikula@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Re?=
 =?utf-8?q?vert_=22drm/i915/display=3A_Fix_a_use-after-free_when_intel=5Fe?=
 =?utf-8?q?dp=5Finit=5Fconnector_fails=22_=28rev3=29?=
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

Series: Revert "drm/i915/display: Fix a use-after-free when intel_edp_init_connector fails" (rev3)
URL   : https://patchwork.freedesktop.org/series/124516/
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
commit 9fff98926978812f97b2bdc12c7121dc99739b39
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Mon Oct 2 13:40:37 2023 +0300

    Revert "drm/i915/display: Fix a use-after-free when intel_edp_init_connector fails"
    
    This reverts commit 299ddb10031a33cd51e375565ea22b3e829f5949.
    
    This is fixed by commit f917130f19fe ("drm/i915: Flush power delayed put
    when connector init failed") upstream, and already part of the baseline.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
    Reviewed-by: Jouni Högander <jouni.hogander@intel.com>
+ /mt/dim checkpatch 3c98b0d3446e97713b2647ac6e0ad4024f0fbf15 drm-intel
9fff98926 Revert "drm/i915/display: Fix a use-after-free when intel_edp_init_connector fails"
-:10: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '299ddb10031a33cd51e375565ea22b3e829f5949', maybe rebased or not pulled?
#10: 
This reverts commit 299ddb10031a33cd51e375565ea22b3e829f5949.

-:12: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'f917130f19fe', maybe rebased or not pulled?
#12: 
This is fixed by commit f917130f19fe ("drm/i915: Flush power delayed put

total: 0 errors, 2 warnings, 0 checks, 23 lines checked


