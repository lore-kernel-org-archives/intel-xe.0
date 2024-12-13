Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F44DE7717D
	for <intel-xe@archiver.kernel.org>; Fri, 13 Dec 2024 15:03:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAED610F04A;
	Fri, 13 Dec 2024 15:03:02 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 349AD10F04A;
 Fri, 13 Dec 2024 15:03:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5Bv?=
 =?utf-8?q?4=2C1/2=5D_drm/xe=3A_Use_non-interruptible_wait_when_moving_BO_to?=
 =?utf-8?q?_system?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 13 Dec 2024 15:03:02 -0000
Message-ID: <173410218221.2161794.12476981537020743657@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241213122415.3880017-1-nirmoy.das@intel.com>
In-Reply-To: <20241213122415.3880017-1-nirmoy.das@intel.com>
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

Series: series starting with [v4,1/2] drm/xe: Use non-interruptible wait when moving BO to system
URL   : https://patchwork.freedesktop.org/series/142559/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 45b56f16da4da96d46c01b647977d6deaaeeec91
Author: Nirmoy Das <nirmoy.das@intel.com>
Date:   Fri Dec 13 13:24:15 2024 +0100

    drm/xe: Wait for migration job before unmapping pages
    
    Fix a potential GPU page fault during tt -> system moves by waiting for
    migration jobs to complete before unmapping SG. This ensures that IOMMU
    mappings are not prematurely torn down while a migration job is still in
    progress.
    
    v2: Use intr=false(Matt A)
    v3: Update commit message(Matt A)
    v4: s/DMA_RESV_USAGE_BOOKKEEP/DMA_RESV_USAGE_KERNEL(Thomas)
    
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3466
    Fixes: 75521e8b56e8 ("drm/xe: Perform dma_map when moving system buffer objects to TT")
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: <stable@vger.kernel.org> # v6.11+
    Cc: Matthew Auld <matthew.auld@intel.com>
    Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
    Reviewed-by: Matthew Auld <matthew.auld@intel.com>
+ /mt/dim checkpatch a752f9b5366a071e41f973b51842b6af5817f2a2 drm-intel
4c9742aadfa5 drm/xe: Use non-interruptible wait when moving BO to system
45b56f16da4d drm/xe: Wait for migration job before unmapping pages


