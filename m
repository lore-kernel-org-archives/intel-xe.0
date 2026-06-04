Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1328FCD6E57
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jun 2026 09:52:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4C9311275E;
	Thu,  4 Jun 2026 09:52:54 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAD3E11275E;
 Thu,  4 Jun 2026 09:52:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Fix_UAF_in_xe?=
 =?utf-8?q?=5Fgem=5Fprime=5Fimport=28=29_on_attach_failure_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nitin Gote" <nitin.r.gote@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 04 Jun 2026 09:52:52 -0000
Message-ID: <178056677282.43085.10371180155009341269@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260604102319.1812827-2-nitin.r.gote@intel.com>
In-Reply-To: <20260604102319.1812827-2-nitin.r.gote@intel.com>
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

Series: drm/xe: Fix UAF in xe_gem_prime_import() on attach failure (rev2)
URL   : https://patchwork.freedesktop.org/series/167647/
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
commit ca365a803481f620db1f5c2c5da944d872f726a5
Author: Nitin Gote <nitin.r.gote@intel.com>
Date:   Thu Jun 4 15:53:20 2026 +0530

    drm/xe: Fix UAF in xe_gem_prime_import() on attach failure
    
    xe_dma_buf_create_obj() creates the importer BO with obj->resv
    pointing at the exporter's dma_buf->resv. When dma_buf_dynamic_attach()
    fails, no dma_buf reference is held so the exporter can be freed
    immediately. Since ttm_bo_release() now always defers cleanup for
    ttm_bo_type_sg BOs to the TTM workqueue, the worker later calls
    dma_resv_lock() on the already-freed exporter resv, causing a UAF.
    
    Switch obj->resv to the BO's private _resv under lru_lock before
    dropping the last reference, mirroring ttm_bo_individualize_resv().
    lru_lock is needed because the BO is already on the LRU list and
    the shrinker can read bo->base.resv concurrently.
    
    Observed with igt@xe_live_ktest@xe_dma_buf_kunit on BMG (QEMU):
    
      Oops: general protection fault, probably for non-canonical address 0x6b6b6b6b6b6b6b9c
      Workqueue: ttm ttm_bo_delayed_delete [ttm]
      RIP: 0010:mutex_can_spin_on_owner+0x3f/0xc0
      Call Trace:
       <TASK>
       ? __ww_mutex_lock.constprop.0+0x2dd/0x18e0
       ? ttm_bo_delayed_delete+0x41/0xc0 [ttm]
       ww_mutex_lock+0x3c/0xb0
       ttm_bo_delayed_delete+0x41/0xc0 [ttm]
       process_one_work+0x239/0x740
       worker_thread+0x200/0x3f0
       kthread+0x10d/0x150
       ret_from_fork+0x3bd/0x470
       ret_from_fork_asm+0x1a/0x30
       </TASK>
    
    v2: Switch resv to &obj->_resv under lru_lock
        (Matthew Auld)
    
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8023
    Fixes: d99fbd9aab62 ("drm/ttm: Always take the bo delayed cleanup path for imported bos")
    Cc: stable@vger.kernel.org # v6.8+
    Cc: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
    Cc: Christian Konig <christian.koenig@amd.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Matthew Auld <matthew.auld@intel.com>
    Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
+ /mt/dim checkpatch 70c7b363fab8198549bb9b82134bda0f6bda9452 drm-intel
ca365a803481 drm/xe: Fix UAF in xe_gem_prime_import() on attach failure
-:20: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#20: 
  Oops: general protection fault, probably for non-canonical address 0x6b6b6b6b6b6b6b9c

total: 0 errors, 1 warnings, 0 checks, 16 lines checked


