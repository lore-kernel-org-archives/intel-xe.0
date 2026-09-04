Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A5FCC624D3
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 18:55:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4D4C10FACF;
	Fri,  4 Sep 2026 18:55:48 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18DA910FACF;
 Fri,  4 Sep 2026 18:55:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Crescent_Island_PMT_suppo?=
 =?utf-8?q?rt_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 04 Sep 2026 18:55:48 -0000
Message-ID: <178854814809.122453.9558685142087081793@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260904182451.1164868-20-michael.j.ruhl@intel.com>
In-Reply-To: <20260904182451.1164868-20-michael.j.ruhl@intel.com>
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

Series: Crescent Island PMT support (rev8)
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
commit 896d72bedc574b178fba533fd2c329302bee5eb1
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>
Date:   Fri Sep 4 11:25:08 2026 -0700

    drm/xe/vsec: Refactor platform check
    
    For debugfs, residencies and pcode_info are available on the BMG and
    CRI (!SRIOV_VF) platforms.
    
    Refactor to have one code path for adding the debugfs entries.
    
    Reviewed-by: Karthik Poosa <karthik.poosa@intel.com>
    Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
+ /mt/dim checkpatch 313da1cc22491f07075c7ae36372343aa235d11e drm-intel
c52ab4afdfae platform/x86/intel/pmt: complete pcidev to device update
5093fa041c89 platform/x86/intel/pmt: refactor rmw with a return value
09ab17955b59 platform/x86/intel/pmt: refactor rc with a return value
1fe487ef2fd6 platform/x86/intel/pmt: Add register access callbacks
ab12eeaffb43 platform/x86/intel/pmt: Do not remap when using callbacks
25b5a44ab8e2 drm/xe/vsec: Do not register BMG PMT for VF
9b5a8ed61ca4 drm/xe/vsec: Correct locking order
12161d6c0afa drm/xe/vsec: Use correct pm state get
bbf57e7a8299 drm/xe/vsec: Add DOC text for VSEC
-:20: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#20: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 53 lines checked
20255f22906d drm/xe/vsec: Support possible hotplug exit
aa94602b3ef3 drm/xe/vsec: Support Crescent Island PMT
59e941b336d6 drm/xe/vsec: Refactor BattleMage PMT defines
6c3e5990cb6d drm/xe/vsec: Crescent Island PMT decode
5e13feae3ef8 drm/xe/vsec: Crescent Island PMT callbacks
134f3adcec0a drm/xe/vsec: Support late bind fw information
34a41bcb3eeb drm/xe/vsec: Add PMT GUID internal access
d808a9b94f1c drm/xe/vsec: Update PMT internal access
896d72bedc57 drm/xe/vsec: Refactor platform check


