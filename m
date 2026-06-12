Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A48ACD98CE
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jun 2026 14:17:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FFF610F546;
	Fri, 12 Jun 2026 14:17:01 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 349F610F53B;
 Fri, 12 Jun 2026 14:17:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/display=3A_Optimiz?=
 =?utf-8?q?e_remapped_DPT_pinning?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 12 Jun 2026 14:17:00 -0000
Message-ID: <178127382020.74124.8885244617443325082@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260612141122.17959-1-dev@lankhorst.se>
In-Reply-To: <20260612141122.17959-1-dev@lankhorst.se>
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

Series: drm/xe/display: Optimize remapped DPT pinning
URL   : https://patchwork.freedesktop.org/series/168440/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 91f43da8c66d477e9369fa5fe0c92ef75bc4b9b7
Author: Maarten Lankhorst <dev@lankhorst.se>
Date:   Fri Jun 12 16:11:21 2026 +0200

    drm/xe/display: Use xe_bo_addr_iter in remapped DPT pinning
    
    Right now we're using xe_bo_addr() on each individual address, which gives
    problems at larger resolution and sizes, since it's a O(N²).
    
    By using xe_bo_addr_iter_first() + xe_bo_addr_iter_addr(), the time
    complexity is reduced again to O(N).
    
    To fix rotated pinning requires some thinking.
    
    Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
+ /mt/dim checkpatch 536f4e1338749a805ec4a7b82b1444dae2c6fe4d drm-intel
be46249ce1fd drm/xe/bo: Add xe_bo_addr_iter.
91f43da8c66d drm/xe/display: Use xe_bo_addr_iter in remapped DPT pinning
-:41: WARNING:LONG_LINE: line length of 109 exceeds 100 columns
#41: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:77:
+	for (xe_bo_addr_iter_first(bo, &cur, offset, size); cur.remaining; xe_res_next(&cur, XE_PAGE_SIZE)) {

total: 0 errors, 1 warnings, 0 checks, 50 lines checked


