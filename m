Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D7F3C982D8
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 13:58:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE19D10F371;
	Fri, 18 Sep 2026 13:58:16 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75E4B10F371;
 Fri, 18 Sep 2026 13:58:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Crescent_Island_PMT_suppo?=
 =?utf-8?q?rt_=28rev12=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 18 Sep 2026 13:58:15 -0000
Message-ID: <178973989547.182123.14271252057194843080@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260918131751.2408883-22-michael.j.ruhl@intel.com>
In-Reply-To: <20260918131751.2408883-22-michael.j.ruhl@intel.com>
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

Series: Crescent Island PMT support (rev12)
URL   : https://patchwork.freedesktop.org/series/160717/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
d875049d2b299159a272bd5151994970cdcd1e31
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 811e7ba8cdf2a42ecfd7d845f16fe51b15be2613
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>
Date:   Fri Sep 18 06:18:11 2026 -0700

    drm/xe/vsec: Refactor platform check
    
    For debugfs, residencies and pcode_info are available on the BMG and
    CRI (!SRIOV_VF) platforms.
    
    Refactor to have one code path for adding the debugfs entries.
    
    Reviewed-by: Karthik Poosa <karthik.poosa@intel.com>
    Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
+ /mt/dim checkpatch 6228f5616bb6fcd1cbf9fabf7d6123b1f69aced0 drm-intel
306d6ee3b8c3 platform/x86/intel/pmt: complete pcidev to device update
f6559b05504d platform/x86/intel/pmt: refactor rmw with a return value
94db25301612 platform/x86/intel/pmt: refactor rc with a return value
84f6583b5b84 platform/x86/intel/pmt: Add register access callbacks
5172581ed617 platform/x86/intel/pmt: Do not remap when using callbacks
f751b835d004 drm/xe/vsec: Do not register BMG PMT for VF
-:39: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 'xe->info.platform == XE_BATTLEMAGE'
#39: FILE: drivers/gpu/drm/xe/xe_vsec.c:188:
+	if (IS_SRIOV_VF(xe) && (xe->info.platform == XE_BATTLEMAGE))

total: 0 errors, 0 warnings, 1 checks, 26 lines checked
40db29fbab96 drm/xe/vsec: Correct locking order
8dc07351408f drm/xe/vsec: Use correct pm state get
2f22b9aa7390 drm/xe/vsec: Add DOC text for VSEC
-:21: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#21: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 54 lines checked
8ffd280a6270 drm/xe/vsec: Support possible hotplug exit
e2a11fbb2874 drm/xe/vsec: Refactor BattleMage PMT defines
abeaf1ffb05e drm/xe/vsec: Update VSEC probe order
fc7fd30a0b61 drm/xe/vsec: Add base_offset to allow for more flexibilty
d1794848114c drm/xe/vsec: Support Crescent Island PMT
beee303c0ac4 drm/xe/vsec: Crescent Island PMT decode
6df4f4f222df drm/xe/vsec: Crescent Island PMT callbacks
53e0d3764cc6 drm/xe/vsec: Support late bind fw information
399ec0b6b27d drm/xe/vsec: Add PMT GUID internal access
eddb818a05d4 drm/xe/vsec: Update PMT internal access
811e7ba8cdf2 drm/xe/vsec: Refactor platform check


