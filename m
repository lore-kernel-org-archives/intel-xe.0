Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A19E9C35FFF
	for <intel-xe@archiver.kernel.org>; Tue, 17 Sep 2024 13:18:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7336A10E477;
	Tue, 17 Sep 2024 13:18:54 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E70D10E477;
 Tue, 17 Sep 2024 13:18:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Fix_xe=5Fforce=5Fwake=5Fg?=
 =?utf-8?q?et=28=29_failure_handling_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 17 Sep 2024 13:18:53 -0000
Message-ID: <172657913318.1022056.8586053393205063515@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240917122126.438448-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240917122126.438448-1-himal.prasad.ghimiray@intel.com>
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

Series: Fix xe_force_wake_get() failure handling (rev3)
URL   : https://patchwork.freedesktop.org/series/137982/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c62d7e164862503a3662a095da1c6c9014248cb2
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit afc9ddabf64291b6cc76122c59dc26d3ad251d45
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Tue Sep 17 17:51:26 2024 +0530

    drm/xe: Change return type to void for xe_force_wake_put
    
    There is no need to return an error from xe_force_wake_put(), as a
    failure implicitly indicates that the domain failed to sleep.
    
    v3
    - Move kernel-doc to this patch (Badal)
    
    Cc: Badal Nilawar <badal.nilawar@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Nirmoy Das <nirmoy.das@intel.com>
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
+ /mt/dim checkpatch 38e1b615fb395b928e514108e908cd6edf3d34c3 drm-intel
ef06113ec53d drm/xe: Error handling in xe_force_wake_get()
-:114: WARNING:NEW_TYPEDEFS: do not add new typedefs
#114: FILE: drivers/gpu/drm/xe/xe_force_wake_types.h:14:
+typedef unsigned int xe_wakeref_t;

total: 0 errors, 1 warnings, 0 checks, 73 lines checked
47453e6e6046 drm/xe: Modify xe_force_wake_put to handle _get returned mask
8e78e85275fd drm/xe/device: Update handling of xe_force_wake_get return
724a285fde36 drm/xe/hdcp: Update handling of xe_force_wake_get return
c46a1e089f9a drm/xe/gsc: Update handling of xe_force_wake_get return
d193eeb29872 drm/xe/gt: Update handling of xe_force_wake_get return
9ca1bdc2632b drm/xe/xe_gt_idle: Update handling of xe_force_wake_get return
c57a4a2351f6 drm/xe/devcoredump: Update handling of xe_force_wake_get return
568b5ca24bd3 drm/xe/tests/mocs: Update xe_force_wake_get() return handling
b91b4e886ec2 drm/xe/mocs: Update handling of xe_force_wake_get return
32c88d611f02 drm/xe/xe_drm_client: Update handling of xe_force_wake_get return
e5b904630b34 drm/xe/xe_gt_debugfs: Update handling of xe_force_wake_get return
651875b7aba8 drm/xe/guc: Update handling of xe_force_wake_get return
c422f7fdf78a drm/xe/huc: Update handling of xe_force_wake_get return
a3f2197a8045 drm/xe/oa: Handle force_wake_get failure in xe_oa_stream_init()
1d9c66f40706 drm/xe/pat: Update handling of xe_force_wake_get return
4270e9d86291 drm/xe/gt_tlb_invalidation_ggtt: Update handling of xe_force_wake_get return
28e4699a12d6 drm/xe/xe_reg_sr: Update handling of xe_force_wake_get return
0ed6b2754efb drm/xe/query: Update handling of xe_force_wake_get return
dd352d46fa67 drm/xe/vram: Update handling of xe_force_wake_get return
0a75996623a9 drm/xe: forcewake debugfs open fails on xe_forcewake_get failure
8147efc3e88a drm/xe: Ensure __must_check for xe_force_wake_get() return
afc9ddabf642 drm/xe: Change return type to void for xe_force_wake_put


