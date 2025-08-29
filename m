Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE7A1CA0FF9
	for <intel-xe@archiver.kernel.org>; Fri, 29 Aug 2025 18:57:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D53210E1E9;
	Fri, 29 Aug 2025 18:57:02 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D632F10E1E9;
 Fri, 29 Aug 2025 18:57:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Misc_xe/kunit_improvement?=
 =?utf-8?q?s_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 29 Aug 2025 18:57:00 -0000
Message-ID: <175649382087.285817.413982603128441410@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250829171922.572-1-michal.wajdeczko@intel.com>
In-Reply-To: <20250829171922.572-1-michal.wajdeczko@intel.com>
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

Series: Misc xe/kunit improvements (rev2)
URL   : https://patchwork.freedesktop.org/series/152440/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e0fa7d6ad11ac6dc8dfa757164e518968a98b897
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d9e298bfbb43e9ac5aa489241c5f9789b375388a
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Fri Aug 29 19:19:22 2025 +0200

    drm/xe/kunit: Allow to run tests against custom platform
    
    We might want to run our KUnit tests against not defined yet
    future platform that differs from the existing ones only by
    new GDMID versions being used, but otherwise it is similar
    to existing graphics and media IP.
    
    Add kunit-only "dut" modparam where we can specify GMDIDs to
    be used by param generators:
    
        $ tools/testing/kunit/kunit.py run ... \
            --kernel_args=xe.dut=LUNARLAKE:2025:2025 \
            "*xe_[wp][ac]*.*_??"
        ...
        KTAP version 1
        1..2
            KTAP version 1
            # Subtest: xe_pci
            # module: xe_test
            1..2
                KTAP version 1
                # Subtest: check_graphics_ip
                ok 1 20.25 Xe2_LPG
            ok 1 check_graphics_ip
                KTAP version 1
                # Subtest: check_media_ip
                ok 1 20.25 Xe2_LPM
            ok 2 check_media_ip
        # xe_pci: pass:2 fail:0 skip:0 total:2
        # Totals: pass:2 fail:0 skip:0 total:2
        ok 1 xe_pci
            KTAP version 1
            # Subtest: xe_wa
            # module: xe_test
            1..1
                KTAP version 1
                # Subtest: xe_wa_gt
                ok 1 LUNARLAKE 20.25(Xe2_LPG) A0 20.25(Xe2_LPM) A0
            ok 1 xe_wa_gt
        ok 2 xe_wa
    
    Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 94efba53a792987b3649b6370e69f772c2210412 drm-intel
cfbe4ff815f7 drm/xe: Allow to stub lookup for graphics and media IP
e41b7e731589 drm/xe/kunit: Update struct xe_pci_fake_data step declarations
f69808a1913a drm/xe/kunit: Introduce xe_pci_fake_data_desc()
7e3c0e852aa3 drm/xe/kunit: Drop custom struct platform_test_case
701dd644e1ad drm/xe/kunit: Promote fake platform parameter list
599f14afbc59 drm/xe/kunit: Drop xe_wa_test_exit
-:10: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#10: 
 |    # xe_wa_gt: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_wa_test.c:34

total: 0 errors, 1 warnings, 0 checks, 20 lines checked
d9e298bfbb43 drm/xe/kunit: Allow to run tests against custom platform


