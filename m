Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A652E7D27A
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 10:42:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1762510E3A0;
	Tue, 26 Sep 2023 10:42:25 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id C5D0E10E39D;
 Tue, 26 Sep 2023 10:42:23 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id C5437A0169;
 Tue, 26 Sep 2023 10:42:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Koby Elbaz" <kelbaz@habana.ai>
Date: Tue, 26 Sep 2023 10:42:23 -0000
Message-ID: <169572494380.20980.5875348517431790300@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230926103848.1200206-1-kelbaz@habana.ai>
In-Reply-To: <20230926103848.1200206-1-kelbaz@habana.ai>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_MM?=
 =?utf-8?q?IO_extension_support_for_multi-tile_devices_=28rev2=29?=
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

Series: MMIO extension support for multi-tile devices (rev2)
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
commit 1ee55e4bba12b954eab24aa1ba294e8f1bda9cb1
Author: Koby Elbaz <kelbaz@habana.ai>
Date:   Tue Sep 26 13:38:48 2023 +0300

    drm/xe: refactor xe_mmio_probe_tiles to support MMIO extension
    
    In future ASICs, there will be an additional MMIO extension space
    for all tiles altogether, residing on top of MMIO address space.
    
    Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
    Reviewed-by: Ofir Bitton <obitton@habana.ai>
    Reviewed-by: Moti Haimovski <mhaimovski@habana.ai>
+ /mt/dim checkpatch fc8ec3c56efa5c15b630ddc17c89100440fe03ef drm-intel
a5f4229c9 drm/xe: add 28-bit address support in struct xe_reg
34de82c7a drm/xe: add read/write support for MMIO extension space
5397ee2be drm/xe: add a flag to bypass multi-tile config from MTCFG reg
-:47: CHECK:MULTIPLE_ASSIGNMENTS: multiple assignments should be avoided
#47: FILE: drivers/gpu/drm/xe/xe_mmio.c:331:
+		adj_tile_count = xe->info.tile_count =

total: 0 errors, 0 warnings, 1 checks, 61 lines checked
a3296d9c6 drm/xe: add MMIO extension support flags
d78a8e68e drm/xe: map MMIO BAR according to the num of tiles in device desc
1ee55e4bb drm/xe: refactor xe_mmio_probe_tiles to support MMIO extension
-:62: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#62: FILE: drivers/gpu/drm/xe/xe_mmio.c:337:
+			drm_info(&xe->drm, "tile_count: %d, reduced_tile_count %d\n",
+					xe->info.tile_count, tile_count);

total: 0 errors, 0 warnings, 1 checks, 88 lines checked


