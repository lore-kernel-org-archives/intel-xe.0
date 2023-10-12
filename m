Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EA54CDB482
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 14:11:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4D0010E4FF;
	Thu, 12 Oct 2023 14:11:38 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7B6CD10E128;
 Thu, 12 Oct 2023 14:11:36 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 78C25A0093;
 Thu, 12 Oct 2023 14:11:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Date: Thu, 12 Oct 2023 14:11:36 -0000
Message-ID: <169711989649.25005.1321921008684546327@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231012135209.403827-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20231012135209.403827-1-juhapekka.heikkila@gmail.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_En?=
 =?utf-8?q?able_remapped_display_page_table_on_Xe_=28rev9=29?=
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

Series: Enable remapped display page table on Xe (rev9)
URL   : https://patchwork.freedesktop.org/series/124108/
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
commit 17edd9e563646028bba7f3e5f3417d34caca5152
Author: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date:   Thu Oct 12 16:52:09 2023 +0300

    drm/xe/display: Add writing of remapped dpt
    
    Xe need to use remapped display page table for tiled framebuffers
    on anywhere else than DG2. Here add function to write such dpt and
    enable usage of remapped display page tables where needed.
    
    Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
+ /mt/dim checkpatch 6c0d1e36f310682297a5b07336b0883afc77f66e drm-intel
bd1dabd34 drm/xe/display: Don't try to use vram if not available
17edd9e56 drm/xe/display: Add writing of remapped dpt
-:28: CHECK:ASSIGNMENT_CONTINUATIONS: Assignment operator '=' should be on the previous line
#28: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:56:
+	u64 (*pte_encode_bo)(struct xe_bo *bo, u64 bo_offset, u16 pat_index)
+		= ggtt->pt_ops->pte_encode_bo;

-:37: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#37: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:65:
+				     pte_encode_bo(bo, src_idx * XE_PAGE_SIZE,
+				     xe->pat.idx[XE_CACHE_WB]));

total: 0 errors, 0 warnings, 2 checks, 76 lines checked


