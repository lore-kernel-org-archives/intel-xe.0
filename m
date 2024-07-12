Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F108C2BD09
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jul 2024 06:45:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA40410EC0F;
	Fri, 12 Jul 2024 06:45:13 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 644A910EC0F;
 Fri, 12 Jul 2024 06:45:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Implement_compression_sup?=
 =?utf-8?q?port_on_BMG?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Akshata Jahagirdar" <akshata.jahagirdar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 12 Jul 2024 06:45:12 -0000
Message-ID: <172076671240.166024.4233476182705859757@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1720766122.git.akshata.jahagirdar@intel.com>
In-Reply-To: <cover.1720766122.git.akshata.jahagirdar@intel.com>
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

Series: Implement compression support on BMG
URL   : https://patchwork.freedesktop.org/series/136023/
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
commit 10b21c37e888b840444931e81111a41ab13cf420
Author: Jahagirdar, Akshata <akshata.jahagirdar@intel.com>
Date:   Fri Jul 12 06:39:25 2024 +0000

    drm/xe/xe2: Do not run xe_bo_test for xe2+ dgfx
    
    In xe2+ dgfx, we don't need to handle the copying of ccs
    metadata during migration. This test validates the ccs data post
    clear and copy during evict/restore operation. Thus, we can skip
    this test on xe2+ dgfx.
    
    Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
    Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
+ /mt/dim checkpatch 0b9174f237436b60b1c6fd9d5fbacbfcde660e3e drm-intel
eeb7861be028 drm/xe/migrate: Handle clear ccs logic for xe2 dgfx
-:58: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email name mismatch: 'From: "Jahagirdar, Akshata" <akshata.jahagirdar@intel.com>' != 'Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>'

total: 0 errors, 1 warnings, 0 checks, 35 lines checked
288027bbf066 drm/xe/migrate: Add kunit to test clear functionality
-:317: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email name mismatch: 'From: "Jahagirdar, Akshata" <akshata.jahagirdar@intel.com>' != 'Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>'

total: 0 errors, 1 warnings, 0 checks, 288 lines checked
0909884d6cb7 drm/xe/xe2: Introduce identity map for compressed pat for vram
85980848175d drm/xe/xe_migrate: Handle migration logic for xe2+ dgfx
-:6: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#6: 
During eviction (vram->sysmem), we use the mapping from compressed -> uncompressed.

-:53: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email name mismatch: 'From: "Jahagirdar, Akshata" <akshata.jahagirdar@intel.com>' != 'Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>'

total: 0 errors, 2 warnings, 0 checks, 31 lines checked
efabe00da866 drm/xe/migrate: Add kunit to test migration functionality for BMG
-:175: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email name mismatch: 'From: "Jahagirdar, Akshata" <akshata.jahagirdar@intel.com>' != 'Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>'

total: 0 errors, 1 warnings, 0 checks, 154 lines checked
10b21c37e888 drm/xe/xe2: Do not run xe_bo_test for xe2+ dgfx
-:30: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email name mismatch: 'From: "Jahagirdar, Akshata" <akshata.jahagirdar@intel.com>' != 'Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>'

total: 0 errors, 1 warnings, 0 checks, 12 lines checked


