Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19EDBCA9ED1
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 16:38:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFD0E10E407;
	Mon, 12 Oct 2026 16:38:10 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C70510E407;
 Mon, 12 Oct 2026 16:38:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/xe3=3A_Fix_OAM_str?=
 =?utf-8?q?eam_broken_on_Xe3+_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shekhar Chauhan" <shekhar.chauhan@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 12 Oct 2026 16:38:09 -0000
Message-ID: <179182308911.13983.4620248949818831428@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261012112158.180251-1-shekhar.chauhan@intel.com>
In-Reply-To: <20261012112158.180251-1-shekhar.chauhan@intel.com>
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

Series: drm/xe/xe3: Fix OAM stream broken on Xe3+ (rev2)
URL   : https://patchwork.freedesktop.org/series/175946/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6bef5ce5c74dc76b4ee69ab2832c0d1fd63c91c7
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 30e935573a92a8456ce8fea58d475beb87a6d14b
Author: Shekhar Chauhan <shekhar.chauhan@intel.com>
Date:   Mon Oct 12 16:51:58 2026 +0530

    drm/xe/xe3: Fix OAM stream broken on Xe3+
    
    OAM stream: Prevent partial reports at the end of the buffer
    when overrun mode is enabled by making the buffer size
    a multiple of the report size.
    
    Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
+ /mt/dim checkpatch c7126da5b5d507ecf3f195efa75d99a7fb9cfd95 drm-intel
30e935573a92 drm/xe/xe3: Fix OAM stream broken on Xe3+
-:20: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'stream' - possible side-effects?
#20: FILE: drivers/gpu/drm/xe/xe_oa.c:1746:
+#define oag_has_tail_address_wrap(stream) \
+	(GRAPHICS_VER((stream)->oa->xe) >= 20 && \
+	 (stream)->oa_unit->type == DRM_XE_OA_UNIT_TYPE_OAG)

-:24: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'stream' - possible side-effects?
#24: FILE: drivers/gpu/drm/xe/xe_oa.c:1750:
+#define oam_has_tail_address_wrap(stream) \
+	(MEDIA_VER((stream)->oa->xe) >= 30 && \
+	 ((stream)->oa_unit->type == DRM_XE_OA_UNIT_TYPE_OAM || \
+	  (stream)->oa_unit->type == DRM_XE_OA_UNIT_TYPE_OAM_SAG))

total: 0 errors, 0 warnings, 2 checks, 33 lines checked


