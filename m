Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF24CE79A8
	for <intel-xe@archiver.kernel.org>; Fri, 22 Sep 2023 12:20:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E4FD10E65C;
	Fri, 22 Sep 2023 12:20:58 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 19AD910E65C;
 Fri, 22 Sep 2023 12:20:46 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 7E13FAADEB;
 Fri, 22 Sep 2023 12:20:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Date: Fri, 22 Sep 2023 12:20:42 -0000
Message-ID: <169538524251.5198.5858065581387173541@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230922111721.302657-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20230922111721.302657-1-juhapekka.heikkila@gmail.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_En?=
 =?utf-8?q?able_remapped_display_page_table_on_Xe?=
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

Series: Enable remapped display page table on Xe
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
commit 8847ae57957388bce435a3d9c9e1d75a9066041a
Author: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date:   Fri Sep 22 14:17:21 2023 +0300

    drm/xe/display: Don't try to use vram if not available
    
    Trying to get bo from vram when vram not available will cause
    WARN_ON() hence avoid touching vram if not available.
    
    Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
+ /mt/dim checkpatch 6149acb947f2f8b65ee1a058982a5d6fce3124ec drm-intel
178c98b16 drm/xe/display: Add writing of remapped dpt
-:33: ERROR:SPACING: space prohibited before that '++' (ctx:WxO)
#33: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:57:
+			src_idx ++;
 			        ^

total: 1 errors, 0 warnings, 0 checks, 31 lines checked
78458dc1f drm/xe/display: Enable remapped display page tables
-:28: ERROR:TRAILING_STATEMENTS: trailing statements should be on next line (or did you mean 'else if'?)
#28: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:110:
+	} if (view->type == I915_GTT_VIEW_REMAPPED) {

total: 1 errors, 0 warnings, 0 checks, 39 lines checked
8847ae579 drm/xe/display: Don't try to use vram if not available


