Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD56C79FB7
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 15:56:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC03510E1CA;
	Wed,  9 Sep 2026 15:56:06 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85C7C10E1CA;
 Wed,  9 Sep 2026 15:56:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Crescent_Island_PMT_suppo?=
 =?utf-8?q?rt_=28rev9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 09 Sep 2026 15:56:05 -0000
Message-ID: <178896936554.143971.16580626481871010403@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260909154739.1515514-22-michael.j.ruhl@intel.com>
In-Reply-To: <20260909154739.1515514-22-michael.j.ruhl@intel.com>
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

Series: Crescent Island PMT support (rev9)
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
commit 8bb2dc057910aefcf5a68f6851096b26ac023c0d
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>
Date:   Wed Sep 9 08:47:59 2026 -0700

    drm/xe/vsec: Refactor platform check
    
    For debugfs, residencies and pcode_info are available on the BMG and
    CRI (!SRIOV_VF) platforms.
    
    Refactor to have one code path for adding the debugfs entries.
    
    Reviewed-by: Karthik Poosa <karthik.poosa@intel.com>
    Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
+ /mt/dim checkpatch 0d30bc4f35590b6353a77f23e397ab2168b69673 drm-intel
24a377ef6d0e platform/x86/intel/pmt: complete pcidev to device update
c37c86ebbd76 platform/x86/intel/pmt: refactor rmw with a return value
6890cdac8f39 platform/x86/intel/pmt: refactor rc with a return value
525907e0c3b6 platform/x86/intel/pmt: Add register access callbacks
25192c883054 platform/x86/intel/pmt: Do not remap when using callbacks
b9bef2b86264 drm/xe/vsec: Do not register BMG PMT for VF
1b425caf2f9c drm/xe/vsec: Correct locking order
2f164d2ea178 drm/xe/vsec: Use correct pm state get
f379b48be500 drm/xe/vsec: Add DOC text for VSEC
-:20: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#20: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 53 lines checked
b450216d7ea0 drm/xe/vsec: Support possible hotplug exit
a5c84e9506df drm/xe/vsec: Refactor BattleMage PMT defines
9d3fcef1a541 drm/xe/vsec: Support EAGAIN return value
f2a242ec878b drm/xe/vsec: Add base_offset to allow for more flexibilty
d86b5b9a86c3 drm/xe/vsec: Support Crescent Island PMT
2a9edfa33ad6 drm/xe/vsec: Crescent Island PMT decode
de23ff3da447 drm/xe/vsec: Crescent Island PMT callbacks
c64f15202fef drm/xe/vsec: Support late bind fw information
24f944f8d5de drm/xe/vsec: Add PMT GUID internal access
2323a5b0be85 drm/xe/vsec: Update PMT internal access
8bb2dc057910 drm/xe/vsec: Refactor platform check


