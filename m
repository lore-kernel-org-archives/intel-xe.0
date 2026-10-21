Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89536606A31A
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 05:29:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BC6610E303;
	Wed, 21 Oct 2026 05:29:48 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B75310E303;
 Wed, 21 Oct 2026 05:29:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/xe3=3A_Fix_OAM_str?=
 =?utf-8?q?eam_broken_on_Xe3+_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shekhar Chauhan" <shekhar.chauhan@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 21 Oct 2026 05:29:47 -0000
Message-ID: <179256058723.49306.2437636454173770378@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261021052333.1341575-2-shekhar.chauhan@intel.com>
In-Reply-To: <20261021052333.1341575-2-shekhar.chauhan@intel.com>
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

Series: drm/xe/xe3: Fix OAM stream broken on Xe3+ (rev3)
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
commit 269131866fbd0821ac1860715d35500c689d6b3b
Author: Shekhar Chauhan <shekhar.chauhan@intel.com>
Date:   Wed Oct 21 10:53:34 2026 +0530

    drm/xe/xe3: Fix OAM stream broken on Xe3+
    
    OAM stream: Prevent partial reports at the end of the buffer
    when overrun mode is enabled by making the buffer size
    a multiple of the report size.
    
    v2: Fix checkpatch issues by using a static func instead of #define.
    
    Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
+ /mt/dim checkpatch f3bbda7128124e54c4881b56958249a18d79a110 drm-intel
269131866fbd drm/xe/xe3: Fix OAM stream broken on Xe3+
-:22: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'stream' - possible side-effects?
#22: FILE: drivers/gpu/drm/xe/xe_oa.c:1753:
+#define oag_has_tail_address_wrap(stream) \
+	(GRAPHICS_VER((stream)->oa->xe) >= 20 && \
+	 (stream)->oa_unit->type == DRM_XE_OA_UNIT_TYPE_OAG)

-:26: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'stream' - possible side-effects?
#26: FILE: drivers/gpu/drm/xe/xe_oa.c:1757:
+#define oam_has_tail_address_wrap(stream) \
+	(MEDIA_VER((stream)->oa->xe) >= 30 && \
+	 ((stream)->oa_unit->type == DRM_XE_OA_UNIT_TYPE_OAM || \
+	  (stream)->oa_unit->type == DRM_XE_OA_UNIT_TYPE_OAM_SAG))

total: 0 errors, 0 warnings, 2 checks, 33 lines checked


