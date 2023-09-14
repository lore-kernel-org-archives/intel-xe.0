Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B32EDE98F
	for <intel-xe@archiver.kernel.org>; Thu, 14 Sep 2023 08:07:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE22110E0F1;
	Thu, 14 Sep 2023 08:07:36 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6D6A910E25D;
 Thu, 14 Sep 2023 08:07:34 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 74551A3ECB;
 Thu, 14 Sep 2023 08:07:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Date: Thu, 14 Sep 2023 08:07:34 -0000
Message-ID: <169467885447.29164.16094094260961185329@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230914063211.5210-1-jouni.hogander@intel.com>
In-Reply-To: <20230914063211.5210-1-jouni.hogander@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Re?=
 =?utf-8?q?move_extra_headers_added_into_intel=5Fdisplay=5Fpower=2Eh_=28re?=
 =?utf-8?b?djUp?=
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

Series: Remove extra headers added into intel_display_power.h (rev5)
URL   : https://patchwork.freedesktop.org/series/123598/
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
commit 4438876cb8f3081e0d97f02866c6b414af0327d6
Author: Jouni Högander <jouni.hogander@intel.com>
Date:   Thu Sep 14 09:32:11 2023 +0300

    Revert "FIXME: drm/i915: add a lot of includes in intel_display_power.h"
    
    This reverts commit 304baa8c20cfad330a6c7cad47d86043e968642c.
    
    We can revert this now as missing includes are added into
    compat-i915-headers/i915_drv.h.
    
    Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
    Acked-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch baea10eb27d49a2b8a526d87a70532ab201d140b drm-intel
3eb4b2566 fixup! drm/xe/display: Implement display support
-:10: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 0 checks, 7 lines checked
4438876cb Revert "FIXME: drm/i915: add a lot of includes in intel_display_power.h"
-:10: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '304baa8c20cfad330a6c7cad47d86043e968642c', maybe rebased or not pulled?
#10: 
This reverts commit 304baa8c20cfad330a6c7cad47d86043e968642c.

total: 0 errors, 1 warnings, 0 checks, 11 lines checked


