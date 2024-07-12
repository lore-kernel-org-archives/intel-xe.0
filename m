Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C969EC2BD09
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jul 2024 07:30:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9992A10EC38;
	Fri, 12 Jul 2024 07:30:27 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0641010EC38;
 Fri, 12 Jul 2024 07:30:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/6=5D_drm/xe/migrate=3A_Handle_clear_ccs_logic_for_xe2_dgfx?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Akshata Jahagirdar" <akshata.jahagirdar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 12 Jul 2024 07:30:27 -0000
Message-ID: <172076942702.166389.16167324969134986064@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1720768378.git.akshata.jahagirdar@intel.com>
In-Reply-To: <cover.1720768378.git.akshata.jahagirdar@intel.com>
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

Series: series starting with [1/6] drm/xe/migrate: Handle clear ccs logic for xe2 dgfx
URL   : https://patchwork.freedesktop.org/series/136026/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d6b1992e11d866522fa51f20b812f7f5925f3760
Author: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Date:   Fri Jul 12 07:24:29 2024 +0000

    drm/xe/xe2: Do not run xe_bo_test for xe2+ dgfx
    
    In xe2+ dgfx, we don't need to handle the copying of ccs
    metadata during migration. This test validates the ccs data post
    clear and copy during evict/restore operation. Thus, we can skip
    this test on xe2+ dgfx.
    
    Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
    Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
+ /mt/dim checkpatch 0b9174f237436b60b1c6fd9d5fbacbfcde660e3e drm-intel
c74b860ba059 drm/xe/migrate: Handle clear ccs logic for xe2 dgfx
0d8d06eca160 drm/xe/migrate: Add kunit to test clear functionality
65dc6333d082 drm/xe/xe2: Introduce identity map for compressed pat for vram
11dcfe241416 drm/xe/xe_migrate: Handle migration logic for xe2+ dgfx
-:6: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#6: 
During eviction (vram->sysmem), we use the mapping from compressed -> uncompressed.

total: 0 errors, 1 warnings, 0 checks, 31 lines checked
38b902cbd7ab drm/xe/migrate: Add kunit to test migration functionality for BMG
d6b1992e11d8 drm/xe/xe2: Do not run xe_bo_test for xe2+ dgfx


