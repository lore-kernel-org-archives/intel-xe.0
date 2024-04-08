Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B4AC67861
	for <intel-xe@archiver.kernel.org>; Mon,  8 Apr 2024 13:29:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5489F1125CE;
	Mon,  8 Apr 2024 13:29:10 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4D841125CE;
 Mon,  8 Apr 2024 13:29:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/edid=3A_cleanups=2C_r?=
 =?utf-8?q?esend?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 08 Apr 2024 13:29:07 -0000
Message-ID: <171258294792.1285472.9707915723151450280@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <cover.1712565984.git.jani.nikula@intel.com>
In-Reply-To: <cover.1712565984.git.jani.nikula@intel.com>
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

Series: drm/edid: cleanups, resend
URL   : https://patchwork.freedesktop.org/series/132141/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
10b531c2aeb176a1a539b4a77216232f97719cec
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9a375e5b3bb38795fbc156256d1d175327543143
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Mon Apr 8 11:56:08 2024 +0300

    drm/edid: make drm_edid_are_equal() more convenient for its single user
    
    Repurpose drm_edid_are_equal() to be more helpful for its single user,
    and rename drm_edid_eq(). Functionally deduce the length from the blob
    size, not the blob data, making it more robust against any errors.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 2f9a017b08b6f3c5f4ecc368b3733c37d4c0cac1 drm-intel
1d16f297507f drm/displayid: move drm_displayid.h to drm_displayd_internal.h
-:31: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#31: 
rename from include/drm/drm_displayid.h

total: 0 errors, 1 warnings, 0 checks, 37 lines checked
b4d289b4afb4 drm/edid: move all internal declarations to drm_crtc_internal.h
bc69bf2b210e drm/edid: group struct drm_edid based declarations together
99c99d9a282a drm/edid: rename drm_find_edid_extension() to drm_edid_find_extension()
c74083d7d9ed drm/edid: avoid drm_edid_find_extension() internally
a2847bf61506 drm/edid: make drm_edid_are_equal() static
9a375e5b3bb3 drm/edid: make drm_edid_are_equal() more convenient for its single user


