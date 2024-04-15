Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18426C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 16:25:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C24ED1126E0;
	Mon, 15 Apr 2024 16:25:11 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B82501126DF;
 Mon, 15 Apr 2024 16:25:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5Bv?=
 =?utf-8?q?7=2C1/2=5D_drm/xe=3A_add_a_new_debugfs_file_-_mmio?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Koby Elbaz" <kelbaz@habana.ai>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 15 Apr 2024 16:25:10 -0000
Message-ID: <171319831075.1406028.16922885615234343401@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240414081105.1199559-1-kelbaz@habana.ai>
In-Reply-To: <20240414081105.1199559-1-kelbaz@habana.ai>
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

Series: series starting with [v7,1/2] drm/xe: add a new debugfs file - mmio
URL   : https://patchwork.freedesktop.org/series/132409/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
04432599dcb1becb52633b02487fe3c638ba5915
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ea37fc6438410d7d648f040c4f496432a5f93e22
Author: Koby Elbaz <kelbaz@habana.ai>
Date:   Sun Apr 14 11:11:05 2024 +0300

    drm/xe: restore xe_mmio_ioctl as the ioctl handler of the mmio debugfs file
    
    The drm mmio ioctl handler (xe_mmio_ioctl) wasn't needed anymore,
    and therefore, recently removed.
    Nevertheless, it is now restored for debugging purposes to function
    as the ioctl handler of the 'mmio' debugfs file.
    
    Notes:
    1. The non-admin user's limited mmio access (aka, whitelist),
    was removed being irrelevant anymore, now that a user using debugfs
    must anyway have root permission to use it.
    2. To support multi-tile access, the tile index is now dynamic and
    will be retrieved from the given mmio address itself.
    
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Cc: Daniel Vetter <daniel@ffwll.ch>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Ofir Bitton <obitton@habana.ai>
    Cc: José Roberto de Souza <jose.souza@intel.com>
    Cc: Michal Winiarski <michal.winiarski@intel.com>
    Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
    Reviewed-by: Ofir Bitton <obitton@habana.ai>
+ /mt/dim checkpatch eb71974e8580aeae58e59b3a35e9f41d70edf968 drm-intel
b86d64e10e1d drm/xe: add a new debugfs file - mmio
ea37fc643841 drm/xe: restore xe_mmio_ioctl as the ioctl handler of the mmio debugfs file
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:71: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 'mmio_addr >= tile_mmio_base_addr'
#71: FILE: drivers/gpu/drm/xe/xe_debugfs.c:129:
+		if ((mmio_addr >= tile_mmio_base_addr) &&
+				(mmio_addr < (tile_mmio_base_addr + SZ_4M))) {

-:72: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#72: FILE: drivers/gpu/drm/xe/xe_debugfs.c:130:
+		if ((mmio_addr >= tile_mmio_base_addr) &&
+				(mmio_addr < (tile_mmio_base_addr + SZ_4M))) {

-:218: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#218: 
new file mode 100644

total: 0 errors, 1 warnings, 2 checks, 222 lines checked


