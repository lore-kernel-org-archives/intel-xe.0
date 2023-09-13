Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74282EDEC4D
	for <intel-xe@archiver.kernel.org>; Wed, 13 Sep 2023 13:53:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2712D10E4C2;
	Wed, 13 Sep 2023 13:53:13 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 33E4210E4C2;
 Wed, 13 Sep 2023 13:53:10 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 3608AAADDA;
 Wed, 13 Sep 2023 13:53:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Koby Elbaz" <kelbaz@habana.ai>
Date: Wed, 13 Sep 2023 13:53:10 -0000
Message-ID: <169461319021.31250.5155181872615363398@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230913095800.1661119-1-kelbaz@habana.ai>
In-Reply-To: <20230913095800.1661119-1-kelbaz@habana.ai>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_MM?=
 =?utf-8?q?IO_extension_support_for_multi-tile_devices?=
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

Series: MMIO extension support for multi-tile devices
URL   : https://patchwork.freedesktop.org/series/123636/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 2cea5994688f04dbb2314ca0e7866847140a0d96
Author: Koby Elbaz <kelbaz@habana.ai>
Date:   Wed Sep 13 12:58:00 2023 +0300

    drm/xe: refactor xe_mmio_probe_tiles to support MMIO extension
    
    In future ASICs, there will be an additional MMIO extension space
    for all tiles altogether, residing on top of MMIO address space.
    
    Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
    Reviewed-by: Ofir Bitton <obitton@habana.ai>
    Reviewed-by: Moti Haimovski <mhaimovski@habana.ai>
+ /mt/dim checkpatch 89b671db4d8e2c46f27044d39c69095f597290e5 drm-intel
960ff0c46 drm/xe: add 28-bit address support in struct xe_reg
af18eebf0 drm/xe: add read/write support for MMIO extension space
a4dfcae52 drm/xe: add a flag to bypass multi-tile config from MTCFG reg
-:47: CHECK:MULTIPLE_ASSIGNMENTS: multiple assignments should be avoided
#47: FILE: drivers/gpu/drm/xe/xe_mmio.c:331:
+		adj_tile_count = xe->info.tile_count =

total: 0 errors, 0 warnings, 1 checks, 61 lines checked
2b5c92aad drm/xe: add MMIO extension support flags
8747fef4b drm/xe: map MMIO BAR according to the num of tiles in device desc
2cea59946 drm/xe: refactor xe_mmio_probe_tiles to support MMIO extension
-:62: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#62: FILE: drivers/gpu/drm/xe/xe_mmio.c:337:
+			drm_info(&xe->drm, "tile_count: %d, reduced_tile_count %d\n",
+				xe->info.tile_count, tile_count);

total: 0 errors, 0 warnings, 1 checks, 82 lines checked


