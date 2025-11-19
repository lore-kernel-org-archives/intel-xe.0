Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB507CF34B5
	for <intel-xe@archiver.kernel.org>; Wed, 19 Nov 2025 14:10:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A74AF10E62B;
	Wed, 19 Nov 2025 14:10:00 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 566C410E62B;
 Wed, 19 Nov 2025 14:09:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_LOBF_fixes_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 19 Nov 2025 14:09:59 -0000
Message-ID: <176356139934.8491.7853893328718231396@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251119135152.673276-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20251119135152.673276-1-ankit.k.nautiyal@intel.com>
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

Series: LOBF fixes (rev2)
URL   : https://patchwork.freedesktop.org/series/157554/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
2de9a3901bc28757c7906b454717b64e2a214021
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 15bf63eac753dbdbd68f6bdf5cd458ed3d2fa927
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Wed Nov 19 19:21:52 2025 +0530

    drm/i915/alpm: Disable LOBF around transitioning for LRR/seamless MN
    
    When enabling LRR/seamless MN disable LOBF first and re-enable
    afterwards.
    - pre_plane_update: if LOBF was enabled, disable LOBF before the
      update_lrr/update_m_n transition.
    - post_plane_update: Re-enable LOBF after the transition.
    
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch 80939f90d3e68b92b868017ea450e6695f756666 drm-intel
a6c63a284223 drm/i915/alpm: Compute LOBF late after guardband is already determined
-:146: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#146: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 115 lines checked
379324ed31a4 drm/i915/alpm: Allow LOBF only if window1 > alpm check_entry lines
4cfd2406f794 drm/i915/alpm: Allow LOBF only for platform that have Always on VRR TG
e7033ee0f44d drm/i915/alpm: Simplify and align LOBF checks in pre/post plane update
15bf63eac753 drm/i915/alpm: Disable LOBF around transitioning for LRR/seamless MN


