Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49998C88E53
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 20:43:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 863BC10E28A;
	Fri, 11 Sep 2026 20:43:33 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFD2210E28A;
 Fri, 11 Sep 2026 20:43:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Crescent_Island_PMT_suppo?=
 =?utf-8?q?rt_=28rev10=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 11 Sep 2026 20:43:32 -0000
Message-ID: <178915941284.152712.6772320853696055629@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260911201148.1610547-22-michael.j.ruhl@intel.com>
In-Reply-To: <20260911201148.1610547-22-michael.j.ruhl@intel.com>
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

Series: Crescent Island PMT support (rev10)
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
commit b24882cd188758aa5f5b51552289e4920dc71f52
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>
Date:   Fri Sep 11 13:12:08 2026 -0700

    drm/xe/vsec: Refactor platform check
    
    For debugfs, residencies and pcode_info are available on the BMG and
    CRI (!SRIOV_VF) platforms.
    
    Refactor to have one code path for adding the debugfs entries.
    
    Reviewed-by: Karthik Poosa <karthik.poosa@intel.com>
    Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
+ /mt/dim checkpatch f9dbf10ba445ce9399f8a782ba43326cba66d869 drm-intel
8f4e72ac482f platform/x86/intel/pmt: complete pcidev to device update
48d6f643b479 platform/x86/intel/pmt: refactor rmw with a return value
9c23f0ce6431 platform/x86/intel/pmt: refactor rc with a return value
0db8aa62b376 platform/x86/intel/pmt: Add register access callbacks
83a49130d1ce platform/x86/intel/pmt: Do not remap when using callbacks
3fbb4f42edc3 drm/xe/vsec: Do not register BMG PMT for VF
864079371ca9 drm/xe/vsec: Correct locking order
6bbe0e1979d4 drm/xe/vsec: Use correct pm state get
5bb7ed8bced5 drm/xe/vsec: Add DOC text for VSEC
-:20: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#20: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 53 lines checked
e755982a8398 drm/xe/vsec: Support possible hotplug exit
ab31f336ceb6 drm/xe/vsec: Refactor BattleMage PMT defines
5cce8e18e1a6 drm/xe/vsec: Update VSEC probe order
39e5bfbe7500 drm/xe/vsec: Add base_offset to allow for more flexibilty
8e8ad4c7bef9 drm/xe/vsec: Support Crescent Island PMT
050e333d683e drm/xe/vsec: Crescent Island PMT decode
44b963952f57 drm/xe/vsec: Crescent Island PMT callbacks
78302d190322 drm/xe/vsec: Support late bind fw information
89939227ee2e drm/xe/vsec: Add PMT GUID internal access
afa9e7055d98 drm/xe/vsec: Update PMT internal access
b24882cd1887 drm/xe/vsec: Refactor platform check


