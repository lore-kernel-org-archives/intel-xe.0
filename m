Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D044DC624D0
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 19:34:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90D1A10EED4;
	Tue,  1 Sep 2026 19:34:47 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65E7D10EEC9;
 Tue,  1 Sep 2026 19:34:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Crescent_Island_PMT_suppo?=
 =?utf-8?q?rt_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 01 Sep 2026 19:34:46 -0000
Message-ID: <178829128641.109472.58426231809446257@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260901192736.626777-20-michael.j.ruhl@intel.com>
In-Reply-To: <20260901192736.626777-20-michael.j.ruhl@intel.com>
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

Series: Crescent Island PMT support (rev6)
URL   : https://patchwork.freedesktop.org/series/160717/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b2cbdf417a6ca74baa3d0138b9523e9327a22af3
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>
Date:   Tue Sep 1 12:27:53 2026 -0700

    drm/xe/vsec: Refactor platform check
    
    For debugfs, residencies and pcode_info are available on
    the BMG and CRI (!SRIOV_VF) platforms.
    
    Refactor to have one code path for adding the debugfs
    entries.
    
    Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
+ /mt/dim checkpatch 97649417ea562630ab357dbea25f153a654b61c6 drm-intel
d3d369d00f65 platform/x86/intel/pmt: complete pcidev to device update
43c8f578322e platform/x86/intel/pmt: refactor rmw with a return value
-:43: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#43: FILE: drivers/platform/x86/intel/pmt/crashlog.c:187:
+static int pmt_crashlog_set_disable(struct crashlog_entry *crashlog,
 				     bool disable)

total: 0 errors, 0 warnings, 1 checks, 211 lines checked
f555bb5e5fa9 platform/x86/intel/pmt: refactor rc with a return value
897d0a0577ea platform/x86/intel/pmt: Add register access callbacks
374d4d5ec4c3 platform/x86/intel/pmt: Add helpers for callback info
2ecd4ee2630a platform/x86/intel/pmt: Do not remap when using callbacks
e87b11f4526c drm/xe/vsec: Do not register BMG PMT for VF
47e6dd4c4643 drm/xe/vsec: Correct locking order
2633ed0773fd drm/xe/vsec: Use correct pm state get
2118b1af542b drm/xe/vsec: Support possible hotplug exit
e5783d965f6c drm/xe/vsec: Support Crescent Island PMT
3ba0bd759a31 drm/xe/vsec: Refactor BattleMage PMT defines
c2da175c12e2 drm/xe/vsec: Crescent Island PMT decode
a69f04a65625 drm/xe/vsec: Crescent Island PMT callbacks
e393d9556710 drm/xe/vsec: Support late bind fw information
479a37fbda7b drm/xe/vsec: Add PMT GUID internal access
-:11: WARNING:TYPO_SPELLING: 'plaform' may be misspelled - perhaps 'platform'?
#11: 
Add the plaform id to the GUID register define and use that
        ^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 107 lines checked
4ab35fd0fbca drm/xe/vsec: Update PMT internal access
b2cbdf417a6c drm/xe/vsec: Refactor platform check


