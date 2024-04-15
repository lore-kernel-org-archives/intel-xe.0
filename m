Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC175C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 11:16:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AD4011248E;
	Mon, 15 Apr 2024 11:16:49 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9E4111248E;
 Mon, 15 Apr 2024 11:16:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_treewide=3A_Fix_common_gr?=
 =?utf-8?q?ammar_mistake_=22the_the=22_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thorsten Blum" <thorsten.blum@toblux.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 15 Apr 2024 11:16:48 -0000
Message-ID: <171317980895.1404431.10557523568644421315@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240411150437.496153-4-thorsten.blum@toblux.com>
In-Reply-To: <20240411150437.496153-4-thorsten.blum@toblux.com>
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

Series: treewide: Fix common grammar mistake "the the" (rev2)
URL   : https://patchwork.freedesktop.org/series/132370/
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
commit 9f60f72482d7fc37f18637c769f5e5fb05d9e33b
Author: Thorsten Blum <thorsten.blum@toblux.com>
Date:   Thu Apr 11 19:11:47 2024 +0200

    treewide: Fix common grammar mistake "the the"
    
    Use `find . -type f -exec sed -i 's/\<the the\>/the/g' {} +` to find all
    occurrences of "the the" and replace them with a single "the".
    
    In arch/arm/include/asm/unwind.h replace "the the" with "to the".
    
    Changes only comments and documentation - no code changes.
    
    Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
    Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
    Reviewed-by: Tyler Hicks <code@tyhicks.com>
+ /mt/dim checkpatch 85eef611f85be84edeabab83debdbb1fabeba066 drm-intel
9f60f72482d7 treewide: Fix common grammar mistake "the the"
-:369: WARNING:REPEATED_WORD: Possible repeated word: 'at'
#369: FILE: io_uring/kbuf.c:734:
+	 * the caller will call io_put_bl() to drop the reference at at the

-:382: ERROR:CODE_INDENT: code indent should use tabs where possible
#382: FILE: lib/zstd/common/fse_decompress.c:130:
+         * The benefit of doing it in two stages is that we avoid the$

-:395: ERROR:CODE_INDENT: code indent should use tabs where possible
#395: FILE: lib/zstd/decompress/zstd_decompress_block.c:513:
+         * The benefit of doing it in two stages is that we avoid the$

total: 2 errors, 1 warnings, 0 checks, 256 lines checked


