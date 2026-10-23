Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C0D606A31E
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 12:08:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78F9F112AEA;
	Fri, 23 Oct 2026 12:08:30 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E43B1112AD9;
 Fri, 23 Oct 2026 12:08:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5Bv?=
 =?utf-8?q?2=2C1/2=5D_drm/xe/bo=3A_Add_xe=5Fbo=5Faddr=5Fiter=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 23 Oct 2026 12:08:28 -0000
Message-ID: <179275730893.61275.16033068473936602687@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261023114616.735366-1-dev@lankhorst.se>
In-Reply-To: <20261023114616.735366-1-dev@lankhorst.se>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

== Series Details ==

Series: series starting with [v2,1/2] drm/xe/bo: Add xe_bo_addr_iter.
URL   : https://patchwork.freedesktop.org/series/176723/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
3009867cd31863246e4afc138520a7a8bd37bb11
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 6cb2b0a31ed104506ee37eea995638b6b152ec50
Author: Maarten Lankhorst <dev@lankhorst.se>
Date:   Fri Oct 23 13:46:16 2026 +0200

    drm/xe/display: Use xe_bo_addr_iter in remapped DPT pinning
    
    Right now we're using xe_bo_addr() on each individual address, which gives
    problems at larger resolution and sizes, since it's a O(N²).
    
    By using xe_bo_addr_iter_first() + xe_bo_addr_iter_addr(), the time
    complexity is reduced again to O(N).
    
    To fix rotated pinning requires some thinking.
    
    Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
+ /mt/dim checkpatch 398287468d51cbdf3788b2a17fe84d4537aeba5d drm-intel
e92447340412 drm/xe/bo: Add xe_bo_addr_iter.
6cb2b0a31ed1 drm/xe/display: Use xe_bo_addr_iter in remapped DPT pinning
-:41: WARNING:LONG_LINE: line length of 109 exceeds 100 columns
#41: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:75:
+	for (xe_bo_addr_iter_first(bo, &cur, offset, size); cur.remaining; xe_res_next(&cur, XE_PAGE_SIZE)) {

total: 0 errors, 1 warnings, 0 checks, 55 lines checked


