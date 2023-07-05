Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F179EEB64DD
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jul 2023 16:11:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C256910E3A0;
	Wed,  5 Jul 2023 16:11:05 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 54DEA10E185;
 Wed,  5 Jul 2023 16:11:04 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 515E8AADE1;
 Wed,  5 Jul 2023 16:11:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Wed, 05 Jul 2023 16:11:04 -0000
Message-ID: <168857346432.24204.12321835609783790588@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230705160602.237213-9-matthew.auld@intel.com>
In-Reply-To: <20230705160602.237213-9-matthew.auld@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Tr?=
 =?utf-8?q?y_to_handle_TLB_invalidations_from_CT_fast-path_=28rev2=29?=
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

Series: Try to handle TLB invalidations from CT fast-path (rev2)
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
commit 4f5eb6be6e710571740101a01282285fcbb5209d
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Wed Jul 5 17:06:10 2023 +0100

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
    v3:
      - Don't publish the TLB fence on the list until after we fully
        initialize it and successfully do the CT send. The list is now only
        protected by the spin_lock pending_lock and we can't hold that
        across the entire TLB send operation.
    
    References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/297
    References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/320
    References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/449
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: José Roberto de Souza <jose.souza@intel.com>
+ /mt/dim checkpatch a7d60b4c1cc05bf8be394d35f262e8cd34588fb5 drm-intel
20b433650 drm/xe: hold mem_access.ref for CT fast-path
d9e9621c9 drm/xe/ct: hold fast_lock when reserving space for g2h
d30c7506c drm/xe/tlb: increment next seqno after successful CT send
a77414ae3 drm/xe/ct: serialise fast_lock during CT disable
2789af258 drm/xe/gt: tweak placement for signalling TLB fences after GT reset
8f378b6d5 drm/xe/tlb: also update seqno_recv during reset
-:45: WARNING:MEMORY_BARRIER: memory barrier without comment
#45: FILE: drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c:109:
+	smp_wmb();

total: 0 errors, 1 warnings, 0 checks, 27 lines checked
4f5eb6be6 drm/xe: handle TLB invalidations from CT fast-path
-:27: WARNING:COMMIT_LOG_USE_LINK: Unknown link reference 'References:', use 'Link:' or 'Closes:' instead
#27: 
References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/297

-:28: WARNING:COMMIT_LOG_USE_LINK: Unknown link reference 'References:', use 'Link:' or 'Closes:' instead
#28: 
References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/320

-:29: WARNING:COMMIT_LOG_USE_LINK: Unknown link reference 'References:', use 'Link:' or 'Closes:' instead
#29: 
References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/449

total: 0 errors, 3 warnings, 0 checks, 197 lines checked


