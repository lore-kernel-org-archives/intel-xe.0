Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA65C282DC
	for <intel-xe@archiver.kernel.org>; Wed,  5 Mar 2025 10:25:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 170AF10E72B;
	Wed,  5 Mar 2025 10:25:12 +0000 (UTC)
Received: from db0ebb060c04 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAD8C10E72B;
 Wed,  5 Mar 2025 10:25:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Userptr_invalid?=
 =?utf-8?q?_page_access_fixes_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 05 Mar 2025 10:25:10 -0000
Message-ID: <174117031095.42987.11778817057313711241@db0ebb060c04>
X-Patchwork-Hint: ignore
References: <20250304173342.22009-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20250304173342.22009-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/xe: Userptr invalid page access fixes (rev4)
URL   : https://patchwork.freedesktop.org/series/145630/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
cbb4e4a079d89106c2736adc3c7de6f9dc56da07
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 6c63705163735c299598d3d82ecd902a0a80a6af
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Tue Mar 4 18:33:42 2025 +0100

    drm/xe/userptr: Unmap userptrs in the mmu notifier
    
    If userptr pages are freed after a call to the xe mmu notifier,
    the device will not be blocked out from theoretically accessing
    these pages unless they are also unmapped from the iommu, and
    this violates some aspects of the iommu-imposed security.
    
    Ensure that userptrs are unmapped in the mmu notifier to
    mitigate this. A naive attempt would try to free the sg table, but
    the sg table itself may be accessed by a concurrent bind
    operation, so settle for only unmapping.
    
    v3:
    - Update lockdep asserts.
    - Fix a typo (Matthew Auld)
    
    Fixes: 81e058a3e7fd ("drm/xe: Introduce helper to populate userptr")
    Cc: Oak Zeng <oak.zeng@intel.com>
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: <stable@vger.kernel.org> # v6.10+
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Reviewed-by: Matthew Auld <matthew.auld@intel.com>
+ /mt/dim checkpatch a76e0e6082b604f430c20762ca8495a854ae5f0e drm-intel
daa13784d4e8 drm/xe/hmm: Style- and include fixes
a6967e5c1c46 drm/xe/hmm: Don't dereference struct page pointers without notifier lock
6c6370516373 drm/xe/userptr: Unmap userptrs in the mmu notifier


