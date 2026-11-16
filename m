Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FE8606A31C
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 14:40:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2285610F251;
	Mon, 16 Nov 2026 14:40:53 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 465D010F24C;
 Mon, 16 Nov 2026 14:40:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_More_BIOS_FB_ta?=
 =?utf-8?q?keover_fixes_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 16 Nov 2026 14:40:52 -0000
Message-ID: <179484005228.32079.18134396924100078743@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261116122828.266113-8-dev@lankhorst.se>
In-Reply-To: <20261116122828.266113-8-dev@lankhorst.se>
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

Series: drm/xe: More BIOS FB takeover fixes (rev5)
URL   : https://patchwork.freedesktop.org/series/170430/
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
commit 403f2c2be11109515fb0340706f048b8c7060777
Author: Maarten Lankhorst <dev@lankhorst.se>
Date:   Mon Nov 16 13:28:35 2026 +0100

    drm/xe/ggtt: Remove xe_ggtt_insert_bo_at
    
    This code was created specifically for the display handover,
    and can be removed now that we temporarily reserve the area
    of GGTT that contains the original framebuffer contents.
    
    Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
+ /mt/dim checkpatch 038b4cc7dba91006374b26c220bdad77c5d6bb42 drm-intel
6a8ae1f841c6 drm/xe/ggtt: Add xe_ggtt_reserve_area
3b507b1f211c drm/xe/ggtt: Add xe_ggtt_node_remove_noclear
170472150527 drm/xe/display: Reserve the original GGTT space before creating a bo
18456cdbe222 drm/xe/display: Use the correct calculation for phys_base on integrated
-:15: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: or Link: with a URL to the report
#15: 
Reported-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
523d4f4f5a4a drm/xe/display: Remove duplicated code
403f2c2be111 drm/xe/ggtt: Remove xe_ggtt_insert_bo_at


