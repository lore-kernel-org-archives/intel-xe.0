Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC2FC98304
	for <intel-xe@archiver.kernel.org>; Wed, 23 Sep 2026 18:20:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2506810E15E;
	Wed, 23 Sep 2026 18:20:34 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00C3C10E15E;
 Wed, 23 Sep 2026 18:20:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Crescent_Island_PMT_suppo?=
 =?utf-8?q?rt_=28rev13=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 23 Sep 2026 18:20:32 -0000
Message-ID: <179018763299.198725.10843947495714742922@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260923181115.2514193-22-michael.j.ruhl@intel.com>
In-Reply-To: <20260923181115.2514193-22-michael.j.ruhl@intel.com>
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

Series: Crescent Island PMT support (rev13)
URL   : https://patchwork.freedesktop.org/series/160717/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6bef5ce5c74dc76b4ee69ab2832c0d1fd63c91c7
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit db6523d0ae7a82255c99b1d996b5770451652b41
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>
Date:   Wed Sep 23 11:11:35 2026 -0700

    drm/xe/vsec: Refactor platform check
    
    For debugfs, residencies and pcode_info are available on the BMG and
    CRI (!SRIOV_VF) platforms.
    
    Refactor to have one code path for adding the debugfs entries.
    
    Reviewed-by: Karthik Poosa <karthik.poosa@intel.com>
    Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
+ /mt/dim checkpatch 703cd271db3a35088460ab3fec0a96bd48e7fe04 drm-intel
5c4cc9c8fb17 platform/x86/intel/pmt: complete pcidev to device update
6914c3d40545 platform/x86/intel/pmt: refactor rmw with a return value
b9d69c1e68b2 platform/x86/intel/pmt: refactor rc with a return value
b4ecaa456ac1 platform/x86/intel/pmt: Add register access callbacks
8e0c49b1801e platform/x86/intel/pmt: Do not remap when using callbacks
e2ba7e9022d7 drm/xe/vsec: Do not register BMG PMT for VF
de3a858d22bc drm/xe/vsec: Correct locking order
8a4fa2432426 drm/xe/vsec: Use correct pm state get
9468ca905b05 drm/xe/vsec: Add DOC text for VSEC
-:21: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#21: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 54 lines checked
c78a65ba344a drm/xe/vsec: Support possible hotplug exit
cc1fa83c4adb drm/xe/vsec: Refactor BattleMage PMT defines
c251c2caf10d drm/xe/vsec: Update VSEC probe order
114c121f6142 drm/xe/vsec: Add base_offset to allow for more flexibilty
a60f36a4ba92 drm/xe/vsec: Support Crescent Island PMT
cdffd7cd03b8 drm/xe/vsec: Crescent Island PMT decode
779603f917b2 drm/xe/vsec: Crescent Island PMT callbacks
0d3ae332f324 drm/xe/vsec: Support late bind fw information
89f077c98d17 drm/xe/vsec: Add PMT GUID internal access
8fc1da9b91b9 drm/xe/vsec: Update PMT internal access
db6523d0ae7a drm/xe/vsec: Refactor platform check


