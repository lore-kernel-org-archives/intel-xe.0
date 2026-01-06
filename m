Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED072CEFD10
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jan 2026 21:09:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A4DA10E03D;
	Tue,  6 Jan 2026 21:09:09 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D96E10E03D;
 Tue,  6 Jan 2026 21:09:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/xe=5Fguc=5Fct=3A_E?=
 =?utf-8?q?xit_CT_submission_fence_wait_on_GT_reset_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 06 Jan 2026 21:09:08 -0000
Message-ID: <176773374844.130692.5221536093701210264@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260106205533.60180-2-jonathan.cavitt@intel.com>
In-Reply-To: <20260106205533.60180-2-jonathan.cavitt@intel.com>
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

Series: drm/xe/xe_guc_ct: Exit CT submission fence wait on GT reset (rev3)
URL   : https://patchwork.freedesktop.org/series/158719/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9f1cb6875f3f9eb0925ed50c16100322a2df513c
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit afb649d2f7387d5cd5fd7ab515f3d07f9712bd2b
Author: Jonathan Cavitt <jonathan.cavitt@intel.com>
Date:   Tue Jan 6 20:55:34 2026 +0000

    drm/xe/xe_guc_ct: Exit CT submission fence wait on GT reset
    
    It's possible if unlikely that the GuC could be reset in the time
    between performing a guc_ct_send and the G2H fence completing in
    guc_ct_send_recv.  Exit early if this is occurs.
    
    v2: Rebase
    
    v3: goto retry_same_fence if ct is not alive (Stuart)
    
    Suggested-by: Stuart Summers <stuart.summers@intel.com>
    Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
+ /mt/dim checkpatch 3d6700a02638d446a4e8ad92a8212c3efef84ae0 drm-intel
afb649d2f738 drm/xe/xe_guc_ct: Exit CT submission fence wait on GT reset
-:25: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'ct' - possible side-effects?
#25: FILE: drivers/gpu/drm/xe/xe_guc_ct.c:1241:
+#define ct_alive(ct)    \
+	(xe_guc_ct_enabled(ct) && !ct->ctbs.h2g.info.broken && \
+	 !ct->ctbs.g2h.info.broken)

total: 0 errors, 0 warnings, 1 checks, 34 lines checked


