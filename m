Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0405ECC6B12
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 22:50:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC20A10E377;
	Tue, 13 Oct 2026 22:50:10 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D73710E377;
 Tue, 13 Oct 2026 22:50:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Crescent_Island_PMT_suppo?=
 =?utf-8?q?rt_=28rev14=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 13 Oct 2026 22:50:09 -0000
Message-ID: <179193180918.21129.13502859767109446684@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261013214655.3502964-23-michael.j.ruhl@intel.com>
In-Reply-To: <20261013214655.3502964-23-michael.j.ruhl@intel.com>
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

Series: Crescent Island PMT support (rev14)
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
commit 0195ce811ae41c072c6da975c4b75b0e028a6501
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>
Date:   Tue Oct 13 14:47:14 2026 -0700

    drm/xe/vsec: Support survivability mode for CRI
    
    For survivability mode, CRI can only support access to the
    PUNIT CRASHLOG PMT function.
    
    Create a special config to support survivability mode.
    
    Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
+ /mt/dim checkpatch 83b6bc1390606facc1c0426727905f9fcd75836d drm-intel
f2200b849850 platform/x86/intel/pmt: complete pcidev to device update
c2028ac969fc platform/x86/intel/pmt: refactor rmw with a return value
6ecd280f4888 platform/x86/intel/pmt: refactor rc with a return value
7d2bc014d3fa platform/x86/intel/pmt: Add register access callbacks
9af4909d624b platform/x86/intel/pmt: Do not remap when using callbacks
18794b81b117 drm/xe/vsec: Do not register BMG PMT for VF
d93a84d10b73 drm/xe/vsec: Correct locking order
1d7d3fc2a888 drm/xe/vsec: Use correct pm state get
32b3b6da9898 drm/xe/vsec: Add DOC text for VSEC
-:21: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#21: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 54 lines checked
531314210266 drm/xe/vsec: Support possible hotplug exit
968093be80e7 drm/xe/vsec: Refactor BattleMage PMT defines
3b2ce5b0f893 drm/xe/vsec: Update VSEC probe order
c92c38201d3e drm/xe/vsec: Add base_offset to allow for more flexibilty
dd20731fad74 drm/xe/vsec: Support Crescent Island PMT
f9bffcc48d57 drm/xe/vsec: Crescent Island PMT decode
2505d2799e34 drm/xe/vsec: Crescent Island PMT callbacks
2b746a928d78 drm/xe/vsec: Support late bind fw information
9957b7c39ff4 drm/xe/vsec: Add PMT GUID internal access
035e50394f0c drm/xe/vsec: Update PMT internal access
7aabc4213145 drm/xe/vsec: Refactor platform check
0195ce811ae4 drm/xe/vsec: Support survivability mode for CRI


