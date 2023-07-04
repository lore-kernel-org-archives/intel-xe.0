Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C805FEB64DD
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jul 2023 13:49:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A97B10E135;
	Tue,  4 Jul 2023 13:49:04 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9913610E174;
 Tue,  4 Jul 2023 13:49:01 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 95B6DA3ECB;
 Tue,  4 Jul 2023 13:49:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Tue, 04 Jul 2023 13:49:01 -0000
Message-ID: <168847854161.28589.6294165436540614534@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230704134524.138377-7-matthew.auld@intel.com>
In-Reply-To: <20230704134524.138377-7-matthew.auld@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Tr?=
 =?utf-8?q?y_to_handle_TLB_invalidations_from_CT_fast-path?=
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

Series: Try to handle TLB invalidations from CT fast-path
URL   : https://patchwork.freedesktop.org/series/120174/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 73a9cb7badb7e074d3379ef110f2c597683d5f38
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Tue Jul 4 14:45:30 2023 +0100

    drm/xe: handle TLB invalidations from CT fast-path
    
    In various test cases that put the system under a heavy load, we can
    sometimes see errors with missed TLB invalidations. In such cases we see
    the interrupt arrive for the invalidation from the GuC, however the
    actual processing of the completion is pushed onto a workqueue and
    handled with all the other CT stuff, which might take longer than
    expected. Since we expect TLB invalidations to complete within a
    reasonable amount of time (at most ~250ms), and they do seem pretty
    critical, allow handling directly from the CT fast-path.
    
    v2 (José):
      - Actually use the correct spinlock/unlock_irq, since pending_lock is
        grabbed from IRQ.
    
    References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/297
    References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/320
    References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/449
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: José Roberto de Souza <jose.souza@intel.com>
+ /mt/dim checkpatch cd26cb9c94f4f04586f04fca4e94181c53854c46 drm-intel
44faaa962 drm/xe: hold mem_access.ref for CT fast-path
a462e5f93 drm/xe/ct: serialise fast_lock during CT disable
19443436d drm/xe/gt: tweak placement for signalling TLB fences after GT reset
340b7185b drm/xe/tlb: also update seqno_recv during reset
-:45: WARNING:MEMORY_BARRIER: memory barrier without comment
#45: FILE: drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c:109:
+	smp_wmb();

total: 0 errors, 1 warnings, 0 checks, 27 lines checked
73a9cb7ba drm/xe: handle TLB invalidations from CT fast-path
-:22: WARNING:COMMIT_LOG_USE_LINK: Unknown link reference 'References:', use 'Link:' or 'Closes:' instead
#22: 
References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/297

-:23: WARNING:COMMIT_LOG_USE_LINK: Unknown link reference 'References:', use 'Link:' or 'Closes:' instead
#23: 
References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/320

-:24: WARNING:COMMIT_LOG_USE_LINK: Unknown link reference 'References:', use 'Link:' or 'Closes:' instead
#24: 
References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/449

total: 0 errors, 3 warnings, 0 checks, 174 lines checked


