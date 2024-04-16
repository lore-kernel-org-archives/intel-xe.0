Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9197AC4345F
	for <intel-xe@archiver.kernel.org>; Tue, 16 Apr 2024 09:30:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D3CD112B4F;
	Tue, 16 Apr 2024 09:30:27 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6936112B4F;
 Tue, 16 Apr 2024 09:30:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/edid=3A_cleanups=2C_r?=
 =?utf-8?q?ebase?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 16 Apr 2024 09:30:25 -0000
Message-ID: <171325982565.1443376.1313202566736086825@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <cover.1713259151.git.jani.nikula@intel.com>
In-Reply-To: <cover.1713259151.git.jani.nikula@intel.com>
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

Series: drm/edid: cleanups, rebase
URL   : https://patchwork.freedesktop.org/series/132493/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
35057f376b5337039b258ae4c66ed9218f4b3fb8
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 833dab7a0f601ea53b45aa60cad200507d828cd9
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Tue Apr 16 12:20:00 2024 +0300

    drm/edid: make drm_edid_are_equal() more convenient for its single user
    
    Repurpose drm_edid_are_equal() to be more helpful for its single user,
    and rename drm_edid_eq(). Functionally deduce the length from the blob
    size, not the blob data, making it more robust against any errors.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 5f7597e990bea547bd1261170497e7476fb781bb drm-intel
c748e1c5a78c drm/displayid: move drm_displayid.h to drm_displayd_internal.h
-:31: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#31: 
rename from include/drm/drm_displayid.h

total: 0 errors, 1 warnings, 0 checks, 37 lines checked
d91a389da87e drm/edid: move all internal declarations to drm_crtc_internal.h
6acae688f74a drm/edid: group struct drm_edid based declarations together
2601a968e316 drm/edid: rename drm_find_edid_extension() to drm_edid_find_extension()
8370abe6b211 drm/edid: avoid drm_edid_find_extension() internally
739d3225a392 drm/edid: make drm_edid_are_equal() static
833dab7a0f60 drm/edid: make drm_edid_are_equal() more convenient for its single user


