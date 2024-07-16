Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D31C3DA59
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jul 2024 01:07:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB6A410E4D8;
	Tue, 16 Jul 2024 01:07:55 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9058B10E4D8;
 Tue, 16 Jul 2024 01:07:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Implement_compression_sup?=
 =?utf-8?q?port_on_BMG?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Akshata Jahagirdar" <akshata.jahagirdar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 16 Jul 2024 01:07:54 -0000
Message-ID: <172109207458.233406.16483202275882496080@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1721091282.git.akshata.jahagirdar@intel.com>
In-Reply-To: <cover.1721091282.git.akshata.jahagirdar@intel.com>
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
URL   : https://patchwork.freedesktop.org/series/136121/
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
commit b6c2403a67bbbb41905d56faf08cba8d19153e38
Author: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Date:   Tue Jul 16 01:01:11 2024 +0000

    drm/xe/migrate: Parameterize ccs and bo data clear in xe_migrate_clear()
    
    Parameterize clearing ccs and bo data in xe_migrate_clear() which  higher
    layers can utilize. This patch will be used later on when doing bo data
    clear for igfx as well.
    
    Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
    Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
+ /mt/dim checkpatch b6af83ceb593bc4e0d79acda73684462b13a15b9 drm-intel
297e40cc63e4 drm/xe/migrate: Handle clear ccs logic for xe2 dgfx
-:62: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email name mismatch: 'From: "Jahagirdar, Akshata" <akshata.jahagirdar@intel.com>' != 'Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>'

total: 0 errors, 1 warnings, 0 checks, 35 lines checked
4d0966c75a84 drm/xe/migrate: Add kunit to test clear functionality
-:310: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email name mismatch: 'From: "Jahagirdar, Akshata" <akshata.jahagirdar@intel.com>' != 'Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>'

total: 0 errors, 1 warnings, 0 checks, 283 lines checked
85c6bacb0254 drm/xe/xe2: Introduce identity map for compressed pat for vram
-:193: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#193: FILE: drivers/gpu/drm/xe/xe_migrate.c:320:
+			xe_migrate_program_identity(xe, vm, bo, map_ofs, vram_offset, comp_pat_index);

total: 0 errors, 1 warnings, 0 checks, 201 lines checked
fdfa19bf58fc drm/xe/xe_migrate: Handle migration logic for xe2+ dgfx
-:6: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#6: 
During eviction (vram->sysmem), we use the mapping from compressed -> uncompressed.

-:53: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email name mismatch: 'From: "Jahagirdar, Akshata" <akshata.jahagirdar@intel.com>' != 'Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>'

total: 0 errors, 2 warnings, 0 checks, 31 lines checked
1143d3184be6 drm/xe/migrate: Add kunit to test migration functionality for BMG
-:175: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email name mismatch: 'From: "Jahagirdar, Akshata" <akshata.jahagirdar@intel.com>' != 'Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>'

total: 0 errors, 1 warnings, 0 checks, 154 lines checked
cc0ba8756d1c drm/xe/xe2: Do not run xe_bo_test for xe2+ dgfx
-:30: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email name mismatch: 'From: "Jahagirdar, Akshata" <akshata.jahagirdar@intel.com>' != 'Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>'

total: 0 errors, 1 warnings, 0 checks, 12 lines checked
b6c2403a67bb drm/xe/migrate: Parameterize ccs and bo data clear in xe_migrate_clear()


