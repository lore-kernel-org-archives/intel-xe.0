Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D058606A324
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 06:17:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 452B711240F;
	Fri, 27 Nov 2026 06:17:21 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 028C31123EE;
 Fri, 27 Nov 2026 06:17:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_Sync_?=
 =?utf-8?q?tiled_displays_with_pipelock_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 27 Nov 2026 06:17:20 -0000
Message-ID: <179576024000.97348.16512928792380597396@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261127060924.1648295-1-suraj.kandpal@intel.com>
In-Reply-To: <20261127060924.1648295-1-suraj.kandpal@intel.com>
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

Series: drm/i915/display: Sync tiled displays with pipelock (rev2)
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
commit cd9e4a7a675c8232ef401e0b494314f1980cc58a
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Fri Nov 27 11:39:24 2026 +0530

    drm/i915/display: Disable port sync on PTL
    
    Port sync is defeatured from xe3lpd onwards (Wa_16024710867). It was
    allowed again on PTL to keep the tiles of dual-SST tiled displays in
    sync, but PTL now uses pipelock for that. Limit port sync to the
    platforms before xe3lpd again.
    
    Bspec: 69965
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch 17f7eb2368b0eed1dfda22b10966fa181d9b2c83 drm-intel
3d7f05539cfa drm/i915/display: Rename port sync master/slave to primary/secondary
20356f802e43 drm/i915/display: Add HAS_PIPELOCK()
ddd1d7691fb4 drm/i915/display: Add pipelock bits to TRANS_DDI_FUNC_CTL2
58a47d100b55 drm/i915/ddi: Program pipelock in TRANS_DDI_FUNC_CTL2
b5aed21dd4bd drm/i915/ddi: Don't hold the DP link in idle with pipelock
bfa6e4a78dfa drm/i915/display: Enable the pipelock primary before its secondaries
8e7f1ea6ca98 drm/i915/display: Read out and verify pipelock state
ae347af831a5 drm/i915/pipelock: Keep SSC, PSR and CMRR off on pipelock tiles
-:58: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#58: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 113 lines checked
e538c2da51f1 drm/i915/pipelock: Document pipelock
-:25: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#25: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 67 lines checked
a99a5acaefb9 drm/i915/display: Add HAS_PORT_SYNC()
4fe2c9d18e74 drm/i915/ddi: Rename the port sync transcoders to transcoder_mask
106a99d15b09 drm/i915/pipelock: Compute pipelock groups for DP tiled displays
7ff6a0f3c8ec drm/i915/vrr: Split out setting the guardband
b06886993f36 drm/i915/pipelock: Equalize the guardband across a pipelock group
1b391a5462eb drm/i915/dp: Apply link training fallback to the whole tile group
d86755c7a9c6 drm/i915/display: Show transcoder sync state in i915_display_info
64ef8fdbd777 drm/i915/display: Use pipelock on PTL
cd9e4a7a675c drm/i915/display: Disable port sync on PTL


