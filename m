Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18C6FC47073
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jan 2024 12:45:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7B8710E471;
	Thu,  4 Jan 2024 12:45:53 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8FEE10E470;
 Thu,  4 Jan 2024 12:45:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_circumvent_bogu?=
 =?utf-8?q?s_stringop-overflow_warning?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arnd Bergmann" <arnd@kernel.org>
Date: Thu, 04 Jan 2024 12:45:52 -0000
Message-ID: <170437235275.20586.4281075239219597309@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240103114819.2913937-1-arnd@kernel.org>
In-Reply-To: <20240103114819.2913937-1-arnd@kernel.org>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe: circumvent bogus stringop-overflow warning
URL   : https://patchwork.freedesktop.org/series/128154/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6030b24c1386b00de8187b5fb987e283a57b372a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 8b9f73c08069afbae60e83d274d335de45c0baad
Author: Arnd Bergmann <arnd@arndb.de>
Date:   Wed Jan 3 12:48:02 2024 +0100

    drm/xe: circumvent bogus stringop-overflow warning
    
    gcc-13 warns about an array overflow that it sees but that is
    prevented by the "asid % NUM_PF_QUEUE" calculation:
    
    drivers/gpu/drm/xe/xe_gt_pagefault.c: In function 'xe_guc_pagefault_handler':
    include/linux/fortify-string.h:57:33: error: writing 16 bytes into a region of size 0 [-Werror=stringop-overflow=]
    include/linux/fortify-string.h:689:26: note: in expansion of macro '__fortify_memcpy_chk'
      689 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
          |                          ^~~~~~~~~~~~~~~~~~~~
    drivers/gpu/drm/xe/xe_gt_pagefault.c:341:17: note: in expansion of macro 'memcpy'
      341 |                 memcpy(pf_queue->data + pf_queue->tail, msg, len * sizeof(u32));
          |                 ^~~~~~
    drivers/gpu/drm/xe/xe_gt_types.h:102:25: note: at offset [1144, 265324] into destination object 'tile' of size 8
    
    I found that rewriting the assignment using pointer addition rather than the
    equivalent array index calculation prevents the warning, so use that instead.
    
    I sent a bug report against gcc for the false positive warning.
    
    Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
    Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=113214
    Signed-off-by: Arnd Bergmann <arnd@arndb.de>
+ /mt/dim checkpatch 7b3b98d034784b125bad7aca46f9e7a3cfcde45a drm-intel
8b9f73c08 drm/xe: circumvent bogus stringop-overflow warning
-:12: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#12: 
  689 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \

-:24: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'dd08ebf6c352', maybe rebased or not pulled?
#24: 
Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")

total: 0 errors, 2 warnings, 0 checks, 8 lines checked


