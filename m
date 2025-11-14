Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B39BFCD4F49
	for <intel-xe@archiver.kernel.org>; Fri, 14 Nov 2025 05:45:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74D0110E9B3;
	Fri, 14 Nov 2025 05:45:51 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F46010E9B3;
 Fri, 14 Nov 2025 05:45:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_LOBF_fixes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 14 Nov 2025 05:45:49 -0000
Message-ID: <176309914958.54405.9360691589519726286@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251114052746.158751-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20251114052746.158751-1-ankit.k.nautiyal@intel.com>
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

Series: LOBF fixes
URL   : https://patchwork.freedesktop.org/series/157554/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
d9120d4d84745cf011b4b3efb338747e69179dfb
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a1852e35794176c3330b7c8334e5bc04db148f33
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Fri Nov 14 10:57:46 2025 +0530

    drm/i915/alpm: Disable LOBF around transitioning for LRR/seamless MN
    
    When enabling LRR/seamless MN disable LOBF first and re-enable
    afterwards.
    - pre_plane_update: if LOBF was enabled, run pre even when new==old
      whenever update_lrr || update_m_n is set (to disable LOBF before the
      transition).
    - post_plane_update: run post to re-enable LOBF after the transition.
    
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch e15c082b1af0c5cd053273ea096ab84fbc309657 drm-intel
8c43f7952984 drm/i915/alpm: Compute LOBF late after guardband is already determined
-:146: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#146: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 115 lines checked
7b20dcb39692 drm/i915/alpm: Allow LOBF only if window1 > alpm check_entry lines
692dec3c875e drm/i915/alpm: Allow LOBF only for platform that have Always on VRR TG
1fa44f47aceb drm/i915/alpm: Simplify and align LOBF checks in pre/post plane update
a1852e357941 drm/i915/alpm: Disable LOBF around transitioning for LRR/seamless MN


