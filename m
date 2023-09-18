Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B557BC46CA1
	for <intel-xe@archiver.kernel.org>; Mon, 18 Sep 2023 18:11:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F95B10E08B;
	Mon, 18 Sep 2023 18:11:14 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1E2C510E2C3;
 Mon, 18 Sep 2023 18:11:12 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 1F179A00E6;
 Mon, 18 Sep 2023 18:11:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Uma Shankar" <uma.shankar@intel.com>
Date: Mon, 18 Sep 2023 18:11:12 -0000
Message-ID: <169506067212.32418.3681171645443908207@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230918173711.625930-1-uma.shankar@intel.com>
In-Reply-To: <20230918173711.625930-1-uma.shankar@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_Make_vga_setup_decode_co-exist_with_Xe?=
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

Series: drm/xe: Make vga setup decode co-exist with Xe
URL   : https://patchwork.freedesktop.org/series/123871/
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
commit 18421b72766aac186736d7715ca643222ed0625f
Author: Uma Shankar <uma.shankar@intel.com>
Date:   Mon Sep 18 23:07:11 2023 +0530

    drm/i915: Use the wrapper function for vga decode setup
    
    Some of the VGA functionality is not needed by the proposed
    Intel Xe driver. A wrapper function for VGA decode setup, this
    patch uses the same.
    
    This fixes
    commit b9e2d240d489 ("FIXME: drm/i915/vga: disable vga set decode for xe")
    Reverts the changes added in the patch.
    
    Signed-off-by: Uma Shankar <uma.shankar@intel.com>
+ /mt/dim checkpatch 717f01815b20bde3f081a18f42f31673ce1f107f drm-intel
6c18a3533 drm/i915/display: Add a wrapper function for vga decode setup
412ad84b1 drm/xe: Add wrapper function for VGA decode setup
18421b727 drm/i915: Use the wrapper function for vga decode setup
-:11: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'b9e2d240d489', maybe rebased or not pulled?
#11: 
commit b9e2d240d489 ("FIXME: drm/i915/vga: disable vga set decode for xe")

total: 0 errors, 1 warnings, 0 checks, 32 lines checked


