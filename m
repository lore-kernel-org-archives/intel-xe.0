Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC3AC25B74
	for <intel-xe@archiver.kernel.org>; Fri, 10 May 2024 10:53:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3155510E2AE;
	Fri, 10 May 2024 10:53:35 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5963010E2AE;
 Fri, 10 May 2024 10:53:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915=3A_Plane_fb_refa?=
 =?utf-8?q?ctoring_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 10 May 2024 10:53:33 -0000
Message-ID: <171533841336.2056703.10286206814494824429@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240506125718.26001-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20240506125718.26001-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915: Plane fb refactoring (rev3)
URL   : https://patchwork.freedesktop.org/series/133232/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
0daf0be5bb95eb0a0e42275e00a0e42d8d8fd543
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 94e9bdf4d2a879733a0cdaaea1cbd0770612004d
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Mon May 6 15:57:18 2024 +0300

    drm/i915: Rename the fb pinning functions to indicate the address space
    
    Rename the fb pinning functions such that their name directly
    informs us what gets pinned into which address space.
    
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch b885b00e7fc01fc109887d59ce2d1283714b07c6 drm-intel
7543e1bef385 drm/i915: Split gen2 vs. gen3 .max_stride()
afb20161cb6a drm/i915: Clean up skl+ plane stride limits
6aaca652e422 drm/i915: Drop 'uses_fence' parameter from intel_pin_fb_obj_dpt()
c04edbddbed3 drm/i915: Extract intel_plane_needs_physical()
0040addfa41d drm/i915: Polish types in fb calculations
fc425333617c drm/i915: Constify 'fb' in during pinning
c13d63254c98 drm/i915: Change intel_fbdev_fb_alloc() return type
c24039a68d5a drm/i915: Cleanup fbdev fb setup
94e9bdf4d2a8 drm/i915: Rename the fb pinning functions to indicate the address space


