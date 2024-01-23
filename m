Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A2BC46CD2
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jan 2024 03:15:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A861910E51B;
	Tue, 23 Jan 2024 03:15:52 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1262C10E51B;
 Tue, 23 Jan 2024 03:15:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Remove_PVC_from?=
 =?utf-8?q?_xe=5Fwa_kunit_tests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Tue, 23 Jan 2024 03:15:51 -0000
Message-ID: <170597975107.666090.1837986056963735914@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240123031242.3548724-1-lucas.demarchi@intel.com>
In-Reply-To: <20240123031242.3548724-1-lucas.demarchi@intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe: Remove PVC from xe_wa kunit tests
URL   : https://patchwork.freedesktop.org/series/129061/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e7f730565356938dd6c63cd498218fdc5d6a22b0
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9e84e8006144868ba0fe7d0b5716a90bc36737a7
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Mon Jan 22 19:12:42 2024 -0800

    drm/xe: Remove PVC from xe_wa kunit tests
    
    Since the PCI IDs for PVC were added to the xe driver, the xe_wa tests
    should not try to create a fake PVC device since they can't find
    the right PCI ID. Fix bugs when running kunit:
    
            # xe_wa_gt: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_wa_test.c:111
            Expected ret == 0, but
                ret == -19 (0xffffffffffffffed)
            [FAILED] PVC (B0)
            # xe_wa_gt: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_wa_test.c:111
            Expected ret == 0, but
                ret == -19 (0xffffffffffffffed)
            [FAILED] PVC (B1)
            # xe_wa_gt: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_wa_test.c:111
            Expected ret == 0, but
                ret == -19 (0xffffffffffffffed)
            [FAILED] PVC (C0)
    
    Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 7f85c565ce86f84fb5ef9ec4cf4c67b8e021710c drm-intel
9e84e8006 drm/xe: Remove PVC from xe_wa kunit tests
-:23: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'dd08ebf6c352', maybe rebased or not pulled?
#23: 
Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")

total: 0 errors, 1 warnings, 0 checks, 9 lines checked


