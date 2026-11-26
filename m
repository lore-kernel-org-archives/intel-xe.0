Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D676A606A321
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 06:42:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A330C10FD3D;
	Thu, 26 Nov 2026 06:42:53 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED3E510FC78;
 Thu, 26 Nov 2026 06:42:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_Sync_?=
 =?utf-8?q?tiled_displays_with_pipelock?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 26 Nov 2026 06:42:51 -0000
Message-ID: <179567537196.89569.1568298135119375239@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261126063459.863698-1-suraj.kandpal@intel.com>
In-Reply-To: <20261126063459.863698-1-suraj.kandpal@intel.com>
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

Series: drm/i915/display: Sync tiled displays with pipelock
URL   : https://patchwork.freedesktop.org/series/179688/
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
commit 55786dcfe60eaa7a4a7c076c775761e9a0096f3f
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Thu Nov 26 12:04:59 2026 +0530

    drm/i915/ddi: Disable port sync on PTL
    
    Port sync is defeatured from xe3lpd onwards (Wa_16024710867). It was
    allowed again on PTL to keep the tiles of dual-SST tiled displays in
    sync, but PTL now uses pipelock for that. Limit port sync to the
    platforms before xe3lpd again.
    
    Bspec: 69965
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch 38fc48e17b82ca1d9903a982ce596280f8172326 drm-intel
b1e079624a0d drm/i915/display: Rename port sync master/slave to primary/secondary
a2fa8fc2b277 drm/i915/display: Add HAS_PIPELOCK()
f1a683f0cf00 drm/i915/display: Add pipelock bits to TRANS_DDI_FUNC_CTL2
c2f293a1f46d drm/i915/ddi: Program pipelock in TRANS_DDI_FUNC_CTL2
ea4634af212a drm/i915/ddi: Don't hold the DP link in idle with pipelock
6d073bb9206a drm/i915/display: Enable the pipelock primary before its secondaries
e484cb078787 drm/i915/display: Read out and verify pipelock state
8099624c9643 drm/i915/pipelock: Keep SSC, PSR and CMRR off on pipelock tiles
-:58: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#58: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 113 lines checked
e215b90d2b3e drm/i915/pipelock: Compute pipelock groups for DP tiled displays
92f117fda677 drm/i915/vrr: Split out setting the guardband
2a772f9c3d85 drm/i915/pipelock: Equalize the guardband across a pipelock group
cf66a5cfc2f7 drm/i915/dp: Apply link training fallback to the whole tile group
64ea7f73e203 drm/i915/display: Show transcoder sync state in i915_display_info
c37b43433102 drm/i915/display: Use pipelock on PTL
55786dcfe60e drm/i915/ddi: Disable port sync on PTL


