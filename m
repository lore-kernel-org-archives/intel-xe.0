Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B0FE64AB9
	for <intel-xe@archiver.kernel.org>; Tue,  3 Dec 2024 15:09:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52F9610EA55;
	Tue,  3 Dec 2024 15:09:00 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EA9110E22B;
 Tue,  3 Dec 2024 15:08:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/display=3A_fix_ttm?=
 =?utf-8?q?=5Fbo=5Faccess=28=29_usage_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 03 Dec 2024 15:08:59 -0000
Message-ID: <173323853938.2040493.11619117064332748529@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241202170102.88893-2-matthew.auld@intel.com>
In-Reply-To: <20241202170102.88893-2-matthew.auld@intel.com>
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

Series: drm/xe/display: fix ttm_bo_access() usage (rev3)
URL   : https://patchwork.freedesktop.org/series/141996/
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
commit 65afb5db49814408dccbb39c8af962cb0a277793
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Mon Dec 2 17:01:03 2024 +0000

    drm/xe/display: fix ttm_bo_access() usage
    
    ttm_bo_access() returns the size on success. Account for that otherwise
    the caller incorrectly thinks this is an error in
    intel_atomic_prepare_plane_clear_colors().
    
    v2 (Thomas)
     - Make sure we check for the partial copy case. Also since this api is
       easy to get wrong, wrap the whole thing in a new helper to hide the
       details and then convert the existing users over.
    
    Fixes: b6308aaa24a7 ("drm/xe/display: Update intel_bo_read_from_page to use ttm_bo_access")
    Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3661
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Jani Nikula <jani.nikula@intel.com>
    Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 5779fb3c12faf12589054127d60b1d36d56ba219 drm-intel
65afb5db4981 drm/xe/display: fix ttm_bo_access() usage


