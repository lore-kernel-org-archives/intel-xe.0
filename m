Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D4A606A320
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 10:24:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD28910E789;
	Fri, 20 Nov 2026 10:24:24 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86B041128A0;
 Fri, 20 Nov 2026 10:24:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Fix_selective_fetch_updat?=
 =?utf-8?q?e?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 20 Nov 2026 10:24:23 -0000
Message-ID: <179517026354.58350.14190522274003407737@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261120095541.1325118-1-jouni.hogander@intel.com>
In-Reply-To: <20261120095541.1325118-1-jouni.hogander@intel.com>
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

Series: Fix selective fetch update
URL   : https://patchwork.freedesktop.org/series/179187/
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
commit 237bab574fa50098b2201ea0ed3f13edc5c2baf0
Author: Jouni Högander <jouni.hogander@intel.com>
Date:   Fri Nov 20 11:55:41 2026 +0200

    drm/i915/psr: Add trace for selective update area
    
    Add a display tracepoint for the final selective update area, including
    pipe, frame and full update status.
    
    Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
+ /mt/dim checkpatch 5273820504a824f0c81ed31f939599dd0da3fc69 drm-intel
8f31cc4606a9 drm/i915/psr: Update planes when early transport SU start moves
87cfb07cfdf8 drm/i915/psr: Keep planar planes in the selective update area
-:30: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#30: FILE: drivers/gpu/drm/i915/display/intel_psr.c:2930:
+static int psr2_sel_fetch_add_biplanar_planes(struct intel_atomic_state *state,
+					    struct intel_crtc *crtc)

total: 0 errors, 0 warnings, 1 checks, 61 lines checked
2e0a1778351f drm/i915/psr: Don't add all enabled planes into state before SU calculation
237bab574fa5 drm/i915/psr: Add trace for selective update area
-:27: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#27: FILE: drivers/gpu/drm/i915/display/intel_display_trace.h:483:
+	    TP_STRUCT__entry(

-:38: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#38: FILE: drivers/gpu/drm/i915/display/intel_display_trace.h:494:
+	    TP_fast_assign(

total: 0 errors, 0 warnings, 2 checks, 56 lines checked


