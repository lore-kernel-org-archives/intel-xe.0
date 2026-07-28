Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F682C54F4C
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 06:30:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F2AE10E52A;
	Tue, 28 Jul 2026 06:30:57 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2396710E52A;
 Tue, 28 Jul 2026 06:30:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/pt=3A_check_no-DMA?=
 =?utf-8?q?_huge-pte_cases_before_DMA_segment_test_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 28 Jul 2026 06:30:56 -0000
Message-ID: <178522025613.229056.15601784554012859940@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260728055916.593707-2-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260728055916.593707-2-himal.prasad.ghimiray@intel.com>
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

Series: drm/xe/pt: check no-DMA huge-pte cases before DMA segment test (rev2)
URL   : https://patchwork.freedesktop.org/series/171053/
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
commit e359470079cc5f3ea89114932de708c3297f8207
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Tue Jul 28 11:29:17 2026 +0530

    drm/xe/pt: check no-DMA huge-pte cases before DMA segment test
    
    On a non-range clear, curs.size is never set, so the segment test
    (next - va_curs_start > curs->size) returns false for every level > 0
    before the clear_pt short-circuit is reached. The clear then descends to
    level 0 instead of forming a huge zero-leaf, wasting page tables and
    risking -ENOMEM on unbind.
    
    Move the null-VMA, purged-BO and clear_pt short-circuits above the
    curs->size test. The bind path always sets curs.size, so it is unaffected.
    
    v2
    - Also set curs.size on the clear path so the cursor stays meaningful
    during the walk. clear_pt is only reached with range == NULL, so assert
    that invariant. (Matthew Brost)
    
    Cc: Matthew Brost <matthew.brost@intel.com>
    Fixes: 5b658b7e89c3 ("drm/xe: Clear scratch page on vm_bind")
    Reported-by: Sashiko <sashiko-bot@kernel.org>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
+ /mt/dim checkpatch 28e3f47d47a61b5e28e7566944479e9c9715d41d drm-intel
e359470079cc drm/xe/pt: check no-DMA huge-pte cases before DMA segment test
-:23: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: or Link: with a URL to the report
#23: 
Reported-by: Sashiko <sashiko-bot@kernel.org>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

total: 0 errors, 1 warnings, 0 checks, 32 lines checked


