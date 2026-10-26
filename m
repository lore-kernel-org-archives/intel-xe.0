Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7AE6606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 22:14:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95CF010E2B5;
	Mon, 26 Oct 2026 22:14:47 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59CF510E2B5;
 Mon, 26 Oct 2026 22:14:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Update_Wa=5F140?=
 =?utf-8?q?26539277?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 26 Oct 2026 22:14:46 -0000
Message-ID: <179305288636.73517.6170284839623229327@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261026-wa_14026539277-v4-0-54e40d3e92aa@intel.com>
In-Reply-To: <20261026-wa_14026539277-v4-0-54e40d3e92aa@intel.com>
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

Series: drm/xe: Update Wa_14026539277
URL   : https://patchwork.freedesktop.org/series/176895/
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
commit 604b9f8fe402410409900f3a208d717bd355e21d
Author: Gustavo Sousa <gustavo.sousa@intel.com>
Date:   Mon Oct 26 19:06:49 2026 -0300

    drm/xe: Add up-to-date implementation for Wa_14026539277
    
    Wa_14026539277 is a temporary workaround that targets only A*
    steppings of graphics version 35.10 and requires that we avoid using
    2-way coherency for device-cacheable memory accesses.  For
    driver-internal usage, we convert those configurations to be
    device-uncached and 1-way-coherent; on the UAPI side, we reject
    VM_BIND/MADVISE calls that are 2-way-coherent and leave it up to
    userspace to select the alternative option that is most appropriate to
    their usage.
    
    v2:
      - Add missing bits to convert the PAT value to device-uncacheable in
        wa_14026539277_fixup_pat_value(). (Sashiko)
      - Also validate the PAT index in the DRM_XE_VM_MADVISE
        ioctl. (Sashiko)
      - Match against the graphics IP instead of the platform.
    v3:
      - Handle any 2-way-coherent PAT index irrespective of L3 cache
        policy, because L3 UC can be promoted to cached by MOCS. (Matt)
    
    Acked-by: Carl Zhang <Carl.Zhang@intel.com>
    Acked-by: Filip Hazubski <filip.hazubski@intel.com>
    Acked-by: José Roberto de Souza <jose.souza@intel.com>
    Reviewed-by: Matthew Auld <matthew.auld@intel.com>
    Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
+ /mt/dim checkpatch 7cc1f8982b09c9881fbf1a28717efbc2b9fd2679 drm-intel
15e833cb3383 drm/xe: Extract override_has_cached_pt()
0a8792c6bd24 Revert "drm/xe/nvlp: Implement Wa_14026539277"
604b9f8fe402 drm/xe: Add up-to-date implementation for Wa_14026539277
-:121: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#121: FILE: drivers/gpu/drm/xe/xe_pat.c:428:
+					  wa_14026539277_fixup_pat_value(gt, xe->pat.pat_ats->value));

total: 0 errors, 1 warnings, 0 checks, 189 lines checked


