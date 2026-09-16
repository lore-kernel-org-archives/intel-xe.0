Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA0DC982C1
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 20:44:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2625210E114;
	Wed, 16 Sep 2026 20:44:48 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 839A110E114;
 Wed, 16 Sep 2026 20:44:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Crescent_Island_PMT_suppo?=
 =?utf-8?q?rt_=28rev11=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 16 Sep 2026 20:44:46 -0000
Message-ID: <178959148653.174781.13902130681490428970@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260916201139.2374531-22-michael.j.ruhl@intel.com>
In-Reply-To: <20260916201139.2374531-22-michael.j.ruhl@intel.com>
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

Series: Crescent Island PMT support (rev11)
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
commit 8f97867f96d880b8531ad15753a1efda34a679d6
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>
Date:   Wed Sep 16 13:11:58 2026 -0700

    drm/xe/vsec: Refactor platform check
    
    For debugfs, residencies and pcode_info are available on the BMG and
    CRI (!SRIOV_VF) platforms.
    
    Refactor to have one code path for adding the debugfs entries.
    
    Reviewed-by: Karthik Poosa <karthik.poosa@intel.com>
    Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
+ /mt/dim checkpatch bb38af66c2f21340a7c081afbb7ace249357fbb5 drm-intel
4c26bbb89e96 platform/x86/intel/pmt: complete pcidev to device update
e6d2486d2b59 platform/x86/intel/pmt: refactor rmw with a return value
7053de2a17ae platform/x86/intel/pmt: refactor rc with a return value
3053eac3c446 platform/x86/intel/pmt: Add register access callbacks
0008275e6940 platform/x86/intel/pmt: Do not remap when using callbacks
ae8cc28a8e34 drm/xe/vsec: Do not register BMG PMT for VF
-:39: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 'xe->info.platform == XE_BATTLEMAGE'
#39: FILE: drivers/gpu/drm/xe/xe_vsec.c:188:
+	if (IS_SRIOV_VF(xe) && (xe->info.platform == XE_BATTLEMAGE))

total: 0 errors, 0 warnings, 1 checks, 26 lines checked
9ae8a70c4802 drm/xe/vsec: Correct locking order
e671b8ae4258 drm/xe/vsec: Use correct pm state get
106b5862ebfa drm/xe/vsec: Add DOC text for VSEC
-:21: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#21: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 53 lines checked
216a8d15dc21 drm/xe/vsec: Support possible hotplug exit
4f459d9c8f4f drm/xe/vsec: Refactor BattleMage PMT defines
5a57bede7285 drm/xe/vsec: Update VSEC probe order
751fe11da752 drm/xe/vsec: Add base_offset to allow for more flexibilty
574aa7b7d339 drm/xe/vsec: Support Crescent Island PMT
38e7e16e9d40 drm/xe/vsec: Crescent Island PMT decode
94089a3f736e drm/xe/vsec: Crescent Island PMT callbacks
7eb0e58d97f0 drm/xe/vsec: Support late bind fw information
36af95a6c3fe drm/xe/vsec: Add PMT GUID internal access
40631c0ad51a drm/xe/vsec: Update PMT internal access
8f97867f96d8 drm/xe/vsec: Refactor platform check


