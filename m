Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5490EC4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 01:30:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0660F10E7CF;
	Thu,  7 Dec 2023 01:30:23 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 66BE110E7CF;
 Thu,  7 Dec 2023 01:30:21 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 64FE0AADF2;
 Thu,  7 Dec 2023 01:30:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Date: Thu, 07 Dec 2023 01:30:21 -0000
Message-ID: <170191262141.28722.3143438259694286898@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231206205034.1105637-4-matthew.d.roper@intel.com>
In-Reply-To: <20231206205034.1105637-4-matthew.d.roper@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_xe?=
 =?utf-8?q?=3A_Add_IP_versions_to_GT_query?=
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

Series: xe: Add IP versions to GT query
URL   : https://patchwork.freedesktop.org/series/127457/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6030b24c1386b00de8187b5fb987e283a57b372a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 84fe7a818470e422c2f2d8326fdf848813e02587
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Wed Dec 6 12:50:37 2023 -0800

    drm/xe/uapi: Add IP version and stepping to GT list query
    
    For modern platforms (MTL and later), both kernel and userspace drivers
    are expected to apply GT programming and workarounds based on the IP
    version and stepping self-reported by the GT hardware via the the GMD_ID
    registers.  Since userspace drivers can't access these registers
    directly, pass along the version and stepping information via the GT
    list query.  Note that the new query fields will remain 0's when running
    on pre-GMD_ID platforms.  Userspace is expected to continue using PCI
    devid / revid on those older platforms.
    
    Although the hardware also has a GMD_ID register for display
    version/stepping, that value is intentionally *not* included anywhere in
    the Xe uapi.  Display userspace should be using platform-agnostic APIs
    and auto-detecting platform capabilities rather than matching specific
    IP versions.
    
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch 668d13abebbbc3812de86be1f8477475e1d90728 drm-intel
ed6459efa drm/xe: Stash GMD_ID value in xe_gt
84fe7a818 drm/xe/uapi: Add IP version and stepping to GT list query
-:8: WARNING:REPEATED_WORD: Possible repeated word: 'the'
#8: 
version and stepping self-reported by the GT hardware via the the GMD_ID

total: 0 errors, 1 warnings, 0 checks, 37 lines checked


