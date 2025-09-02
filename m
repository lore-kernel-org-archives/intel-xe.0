Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92CAACA1005
	for <intel-xe@archiver.kernel.org>; Tue,  2 Sep 2025 07:53:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C26110E3BC;
	Tue,  2 Sep 2025 07:53:07 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 070CE10E3BC;
 Tue,  2 Sep 2025 07:53:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_User_readable_error_codes?=
 =?utf-8?q?_on_atomic=5Fioctl_failure_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 02 Sep 2025 07:53:07 -0000
Message-ID: <175679958702.291778.17954088546812875071@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250902-atomic-v4-0-a97b4bed969b@intel.com>
In-Reply-To: <20250902-atomic-v4-0-a97b4bed969b@intel.com>
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

Series: User readable error codes on atomic_ioctl failure (rev3)
URL   : https://patchwork.freedesktop.org/series/152277/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e0fa7d6ad11ac6dc8dfa757164e518968a98b897
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 04136a39f1e8b64a43df84a9988eba3d326560de
Author: Arun R Murthy <arun.r.murthy@intel.com>
Date:   Tue Sep 2 13:17:55 2025 +0530

    drm/i915/display: Error codes for async flip failures
    
    For failures in async flip atomic check/commit path return user readable
    error codes in struct drm_atomic_state.
    
    Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
+ /mt/dim checkpatch 375a75bab74b1a70e8d6920b0614b57a05e88a3f drm-intel
898cb6575a21 drm: Define user readable error codes for atomic ioctl
06ba9c60f174 drm/atomic: Add error_code element in atomic_state
d84b66c61b0f drm/atomic: Return user readable error in atomic_ioctl
-:33: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#33: FILE: drivers/gpu/drm/drm_atomic.c:1519:
+							      DRM_MODE_ATOMIC_CRTC_NEED_FULL_MODESET,

-:90: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#90: FILE: drivers/gpu/drm/drm_atomic_uapi.c:1108:
+								      DRM_MODE_ATOMIC_ASYNC_NOT_SUPP_PLANE,

total: 0 errors, 2 warnings, 0 checks, 213 lines checked
04136a39f1e8 drm/i915/display: Error codes for async flip failures


