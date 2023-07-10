Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 001D0C001DC
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jul 2023 10:13:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD6C010E25C;
	Mon, 10 Jul 2023 10:13:58 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5720510E25C;
 Mon, 10 Jul 2023 10:13:57 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 54310A73C7;
 Mon, 10 Jul 2023 10:13:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Mon, 10 Jul 2023 10:13:57 -0000
Message-ID: <168898403734.24989.17992173462876802532@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230710094037.28179-13-matthew.auld@intel.com>
In-Reply-To: <20230710094037.28179-13-matthew.auld@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Tr?=
 =?utf-8?q?y_to_handle_TLB_invalidations_from_CT_fast-path_=28rev4=29?=
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

Series: Try to handle TLB invalidations from CT fast-path (rev4)
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
commit d77c82ed5cae10ca54e82530253d754dd1146714
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Mon Jul 10 10:40:49 2023 +0100

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
    v4 (Matt Brost):
      - Be careful with racing against fast CT path writing the seqno,
        before we have actually published the fence.
    
    References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/297
    References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/320
    References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/449
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: José Roberto de Souza <jose.souza@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch bcc6a60a1130ef5b99f6347dcc553ab04cbf3365 drm-intel
f3bcd2526 drm/xe/tlb: drop unnecessary smp_wmb()
1f73f5d20 drm/xe/tlb: ensure we access seqno_recv once
2fc287e85 drm/xe: hold mem_access.ref for CT fast-path
00683543d drm/xe/ct: hold fast_lock when reserving space for g2h
fc99e9be1 drm/xe/tlb: increment next seqno after successful CT send
f6824b5e1 drm/xe/ct: serialise fast_lock during CT disable
6cf11f309 drm/xe/gt: tweak placement for signalling TLB fences after GT reset
71749d02e drm/xe/tlb: also update seqno_recv during reset
b3ee973f7 drm/xe/tlb: print seqno_recv on fence TLB timeout
c5c5223ed drm/xe/ct: update g2h outstanding for CTB capture
d77c82ed5 drm/xe: handle TLB invalidations from CT fast-path
-:30: WARNING:COMMIT_LOG_USE_LINK: Unknown link reference 'References:', use 'Link:' or 'Closes:' instead
#30: 
References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/297

-:31: WARNING:COMMIT_LOG_USE_LINK: Unknown link reference 'References:', use 'Link:' or 'Closes:' instead
#31: 
References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/320

-:32: WARNING:COMMIT_LOG_USE_LINK: Unknown link reference 'References:', use 'Link:' or 'Closes:' instead
#32: 
References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/449

total: 0 errors, 3 warnings, 0 checks, 265 lines checked


