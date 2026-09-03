Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF49FC624D7
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 20:17:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D8B410F784;
	Thu,  3 Sep 2026 20:17:12 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24E6F10E53F;
 Thu,  3 Sep 2026 20:17:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Crescent_Island_PMT_suppo?=
 =?utf-8?q?rt_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 03 Sep 2026 20:17:11 -0000
Message-ID: <178846663114.120893.1487613502811323665@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260903201002.1064889-20-michael.j.ruhl@intel.com>
In-Reply-To: <20260903201002.1064889-20-michael.j.ruhl@intel.com>
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

Series: Crescent Island PMT support (rev7)
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
commit 8278f4900eac36efc2d5a60149ed7e72cd4061d7
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>
Date:   Thu Sep 3 13:10:20 2026 -0700

    drm/xe/vsec: Refactor platform check
    
    For debugfs, residencies and pcode_info are available on the BMG and
    CRI (!SRIOV_VF) platforms.
    
    Refactor to have one code path for adding the debugfs entries.
    
    Reviewed-by: Karthik Poosa <karthik.poosa@intel.com>
    Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
+ /mt/dim checkpatch 96ca9b9870504c4a80addae1da9454c8c704a826 drm-intel
f37635015519 platform/x86/intel/pmt: complete pcidev to device update
c2b97bbedf27 platform/x86/intel/pmt: refactor rmw with a return value
eee92e0e4417 platform/x86/intel/pmt: refactor rc with a return value
cc5aa3b45f06 platform/x86/intel/pmt: Add register access callbacks
82c143c7acab platform/x86/intel/pmt: Do not remap when using callbacks
aace8bd9583b drm/xe/vsec: Do not register BMG PMT for VF
24cf215e9fb7 drm/xe/vsec: Correct locking order
f5278c7a0f26 drm/xe/vsec: Use correct pm state get
f65ba9872e9c drm/xe/vsec: Add DOC text for VSEC
-:11: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#11: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 48 lines checked
944be78c1a0e drm/xe/vsec: Support possible hotplug exit
520d52cab183 drm/xe/vsec: Support Crescent Island PMT
e7c44bc88fec drm/xe/vsec: Refactor BattleMage PMT defines
2fab9b493302 drm/xe/vsec: Crescent Island PMT decode
bbf9a637b184 drm/xe/vsec: Crescent Island PMT callbacks
4e1d2d5cb911 drm/xe/vsec: Support late bind fw information
fdfd0e06a8cc drm/xe/vsec: Add PMT GUID internal access
dd36a0b2646b drm/xe/vsec: Update PMT internal access
8278f4900eac drm/xe/vsec: Refactor platform check


