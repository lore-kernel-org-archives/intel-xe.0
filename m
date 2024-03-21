Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D15C6FD1F
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 18:52:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6590010E8D1;
	Thu, 21 Mar 2024 18:52:42 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A23010E8D4;
 Thu, 21 Mar 2024 18:52:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_remove_unused_s?=
 =?utf-8?q?truct_xe=5Fdevice_members?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 21 Mar 2024 18:52:41 -0000
Message-ID: <171104716104.940819.3636054617995979920@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240321161548.3509672-1-jani.nikula@intel.com>
In-Reply-To: <20240321161548.3509672-1-jani.nikula@intel.com>
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

Series: drm/xe: remove unused struct xe_device members
URL   : https://patchwork.freedesktop.org/series/131439/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
a9eb1ac8298ef9f9146567c29fa762d8e9efa1ef
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit fcc4e428c4bfeebd452cc5923b98239e2f1fc3bf
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Thu Mar 21 18:15:48 2024 +0200

    drm/xe: remove unused struct xe_device members
    
    modeset_restore_state has been unused since commit 6af0ffc0db93
    ("drm/i915/display: move restore state and ctx under display
    sub-struct").
    
    member global_obj_list has been unused since commit e2925e19c006
    ("drm/i915/display: move global_obj_list under display sub-struct").
    
    hti_state has been unused since commit 62749912540b ("drm/i915/display:
    move hti under display sub-struct").
    
    snps_phy_failed_calibration has been unused since commit 3a7e2d58f800
    ("drm/i915: move snps_phy_failed_calibration to display sub-struct under
    snps").
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 0cd99ca612f004f19c35f4966a584f0a729bbc31 drm-intel
fcc4e428c4bf drm/xe: remove unused struct xe_device members
-:6: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit 6af0ffc0db93 ("drm/i915/display: move restore state and ctx under display sub-struct")'
#6: 
modeset_restore_state has been unused since commit 6af0ffc0db93

-:16: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit 3a7e2d58f800 ("drm/i915: move snps_phy_failed_calibration to display sub-struct under snps")'
#16: 
snps_phy_failed_calibration has been unused since commit 3a7e2d58f800

total: 2 errors, 0 warnings, 0 checks, 11 lines checked


