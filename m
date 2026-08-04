Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D9BC55ABA
	for <intel-xe@archiver.kernel.org>; Tue,  4 Aug 2026 20:55:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB57B10E127;
	Tue,  4 Aug 2026 20:55:46 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E15E210E127;
 Tue,  4 Aug 2026 20:55:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_DONOT-Review=3A_Pin_vram_?=
 =?utf-8?q?limit_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 04 Aug 2026 20:55:44 -0000
Message-ID: <178587694491.19127.18158166827989278522@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260804203343.1381637-2-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260804203343.1381637-2-himal.prasad.ghimiray@intel.com>
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

Series: DONOT-Review: Pin vram limit (rev5)
URL   : https://patchwork.freedesktop.org/series/171544/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 577cc06fcf10f0c72171000070a59692b6034e95
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Wed Aug 5 02:02:54 2026 +0530

    DONOT-Review: Pin vram limit
    
    drm/xe/dma-buf: propagate pin error
    
    Return the error from xe_bo_pin_external() instead of asserting
    success, so callers observe failures such as -ENOSPC from the pin limit.
    
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    
    drm/xe: add pin_vram_percent modparam
    
    Add a module parameter that caps the percentage of each VRAM region
    which may be pinned via dma-buf. A value of 0 disables the limit.
    
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    
    drm/xe/vram: add pinned vram counters
    
    Add per-region counters tracking dma-buf and total pinned VRAM bytes
    along with the enforced dma-buf pin limit.
    
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    
    drm/xe/vram: init dma-buf pin limit
    
    Derive the per-region dma-buf pin limit from pin_vram_percent during
    VRAM manager initialization.
    
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    
    drm/xe/bo: account dma-buf pinned vram
    
    Track dma-buf pinned VRAM in the per-region counters on external
    pin and unpin.
    
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    
    drm/xe/bo: account kernel pinned vram
    
    Track kernel pinned VRAM in the per-region total counter on pin
    and unpin.
    
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    
    drm/xe/bo: enforce dma-buf pin limit
    
    Reject external VRAM pins that would exceed the per-region dma-buf
    limit with -ENOSPC.
    
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    
    drm/xe/vram: show pinned vram in debug
    
    Expose the pinned VRAM counters and the dma-buf limit in the VRAM
    manager debug output.
    
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    
    drm/xe/tests: add VRAM pin limit KUnit tests
    
    Test under-limit success, over-limit rejection, counter recovery after
    unpin, and the limit=0 unlimited case in xe_bo tests. Add an end-to-end
    dma-buf pin limit test in xe_dma_buf tests.
    
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
+ /mt/dim checkpatch 814bd7de7f09446c4b9401eecb8b30c3285af78b drm-intel
577cc06fcf10 DONOT-Review: Pin vram limit
-:18: WARNING:BAD_SIGN_OFF: Duplicate signature
#18: 
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

-:25: WARNING:BAD_SIGN_OFF: Duplicate signature
#25: 
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

-:32: WARNING:BAD_SIGN_OFF: Duplicate signature
#32: 
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

-:39: WARNING:BAD_SIGN_OFF: Duplicate signature
#39: 
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

-:46: WARNING:BAD_SIGN_OFF: Duplicate signature
#46: 
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

-:53: WARNING:BAD_SIGN_OFF: Duplicate signature
#53: 
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

-:60: WARNING:BAD_SIGN_OFF: Duplicate signature
#60: 
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

-:68: WARNING:BAD_SIGN_OFF: Duplicate signature
#68: 
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

-:90: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#90: FILE: drivers/gpu/drm/xe/tests/xe_bo.c:835:
+static struct xe_ttm_vram_mgr *pin_limit_get_mgr(struct xe_device *xe,
+						  struct kunit *test)

total: 0 errors, 8 warnings, 1 checks, 606 lines checked


