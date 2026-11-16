Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71873606A329
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 14:06:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3423710EDDE;
	Mon, 16 Nov 2026 14:06:40 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D61EC10F236;
 Mon, 16 Nov 2026 14:06:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/display=3A_Use_the?=
 =?utf-8?q?_GGTT_PTE_to_find_the_initial_FB_in_stolen_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Eriksen Xie" <xiaolu.xie@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 16 Nov 2026 14:06:38 -0000
Message-ID: <179483799886.32079.12412894600214670411@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261116113040.1480201-1-xiaolu.xie@intel.com>
In-Reply-To: <20261116113040.1480201-1-xiaolu.xie@intel.com>
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

Series: drm/xe/display: Use the GGTT PTE to find the initial FB in stolen (rev2)
URL   : https://patchwork.freedesktop.org/series/178676/
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
commit f02ab5a561d552a5a5230882f19907363de964b0
Author: Eriksen Xie <xiaolu.xie@intel.com>
Date:   Mon Nov 16 19:30:40 2026 +0800

    drm/xe/display: Use the GGTT PTE to find the initial FB in stolen
    
    On integrated platforms initial_plane_bo() passes the GGTT address of
    the initial plane as is to xe_bo_create_pin_map_at_novm() as the offset
    into stolen. That is only correct if the BIOS maps stolen 1:1 into the
    GGTT.
    
    On Nova Lake the BIOS puts the initial FB at GGTT address 0xff800000
    instead. Its PTE (0x800003) points to the start of stolen memory (the
    stolen base is 0x800000), but using the GGTT address as the stolen
    offset is far beyond the 120 MiB of stolen, so the BO creation fails and
    the driver can't take over the BIOS FB:
    
     xe 0000:00:02.0: [drm:xe_alloc_initial_plane_obj [xe]] Failed to create bo phys_base=0x00000000ff800000 size 8294400 with flags 430: -12
    
    Get the physical address from the PTE and convert it to an offset into
    stolen, like i915 does in initial_plane_phys(). Discard the initial FB
    if the PTE doesn't point into stolen, as done for the dGPU case and by
    i915, since the FB can't be wrapped by a stolen BO then.
    
    Tested on a Nova Lake platform: the BIOS FB is now taken over as the
    initial FB.
    
    Fixes: 44e694958b95 ("drm/xe/display: Implement display support")
    Signed-off-by: Eriksen Xie <xiaolu.xie@intel.com>
+ /mt/dim checkpatch 038b4cc7dba91006374b26c220bdad77c5d6bb42 drm-intel
f02ab5a561d5 drm/xe/display: Use the GGTT PTE to find the initial FB in stolen
-:18: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#18: 
 xe 0000:00:02.0: [drm:xe_alloc_initial_plane_obj [xe]] Failed to create bo phys_base=0x00000000ff800000 size 8294400 with flags 430: -12

total: 0 errors, 1 warnings, 0 checks, 37 lines checked


