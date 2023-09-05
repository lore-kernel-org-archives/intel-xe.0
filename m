Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E2DBC83F33
	for <intel-xe@archiver.kernel.org>; Tue,  5 Sep 2023 09:01:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1401A10E46D;
	Tue,  5 Sep 2023 09:01:51 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 01DDE10E46D;
 Tue,  5 Sep 2023 09:01:49 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id EEB84AADE0;
 Tue,  5 Sep 2023 09:01:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Tue, 05 Sep 2023 09:01:48 -0000
Message-ID: <169390450897.19168.8918929661277300420@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230905085832.2103-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230905085832.2103-1-thomas.hellstrom@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/drm=5Fexec=2C_drm/drm=5Fkunit=3A_Fix_/_WA_for_uaf_and_lock_al?=
 =?utf-8?q?loc_tracking=2E?=
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

Series: drm/drm_exec, drm/drm_kunit: Fix / WA for uaf and lock alloc tracking.
URL   : https://patchwork.freedesktop.org/series/123273/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e700ea2f248a75138759bcb443affeef4a2d1991
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 08182e8eafc8e1fd8a955ccc83b2b6292037977c
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Tue Sep 5 10:58:32 2023 +0200

    drm/drm_exec: Work around a WW mutex lockdep oddity
    
    If *any* object of a certain WW mutex class is locked, lockdep will
    consider *all* mutexes of that class as locked. Also the lock allocation
    tracking code will apparently register only the address of the first
    mutex locked in a sequence.
    This has the odd consequence that if that first mutex is unlocked and
    its memory then freed, the lock alloc tracking code will assume that memory
    is freed with a held lock in there.
    
    For now, work around that for drm_exec by releasing the first grabbed
    object lock last.
    
    Related lock alloc tracking warning:
    [  322.660067] =========================
    [  322.660070] WARNING: held lock freed!
    [  322.660074] 6.5.0-rc7+ #155 Tainted: G     U           N
    [  322.660078] -------------------------
    [  322.660081] kunit_try_catch/4981 is freeing memory ffff888112adc000-ffff888112adc3ff, with a lock still held there!
    [  322.660089] ffff888112adc1a0 (reservation_ww_class_mutex){+.+.}-{3:3}, at: drm_exec_lock_obj+0x11a/0x600 [drm_exec]
    [  322.660104] 2 locks held by kunit_try_catch/4981:
    [  322.660108]  #0: ffffc9000343fe18 (reservation_ww_class_acquire){+.+.}-{0:0}, at: test_early_put+0x22f/0x490 [drm_exec_test]
    [  322.660123]  #1: ffff888112adc1a0 (reservation_ww_class_mutex){+.+.}-{3:3}, at: drm_exec_lock_obj+0x11a/0x600 [drm_exec]
    [  322.660135]
                   stack backtrace:
    [  322.660139] CPU: 7 PID: 4981 Comm: kunit_try_catch Tainted: G     U           N 6.5.0-rc7+ #155
    [  322.660146] Hardware name: ASUS System Product Name/PRIME B560M-A AC, BIOS 0403 01/26/2021
    [  322.660152] Call Trace:
    [  322.660155]  <TASK>
    [  322.660158]  dump_stack_lvl+0x57/0x90
    [  322.660164]  debug_check_no_locks_freed+0x20b/0x2b0
    [  322.660172]  slab_free_freelist_hook+0xa1/0x160
    [  322.660179]  ? drm_exec_unlock_all+0x168/0x2a0 [drm_exec]
    [  322.660186]  __kmem_cache_free+0xb2/0x290
    [  322.660192]  drm_exec_unlock_all+0x168/0x2a0 [drm_exec]
    [  322.660200]  drm_exec_fini+0xf/0x1c0 [drm_exec]
    [  322.660206]  test_early_put+0x289/0x490 [drm_exec_test]
    [  322.660215]  ? __pfx_test_early_put+0x10/0x10 [drm_exec_test]
    [  322.660222]  ? __kasan_check_byte+0xf/0x40
    [  322.660227]  ? __ksize+0x63/0x140
    [  322.660233]  ? drmm_add_final_kfree+0x3e/0xa0 [drm]
    [  322.660289]  ? _raw_spin_unlock_irqrestore+0x30/0x60
    [  322.660294]  ? lockdep_hardirqs_on+0x7d/0x100
    [  322.660301]  ? __pfx_kunit_try_run_case+0x10/0x10 [kunit]
    [  322.660310]  ? __pfx_kunit_generic_run_threadfn_adapter+0x10/0x10 [kunit]
    [  322.660319]  kunit_generic_run_threadfn_adapter+0x4a/0x90 [kunit]
    [  322.660328]  kthread+0x2e7/0x3c0
    [  322.660334]  ? __pfx_kthread+0x10/0x10
    [  322.660339]  ret_from_fork+0x2d/0x70
    [  322.660345]  ? __pfx_kthread+0x10/0x10
    [  322.660349]  ret_from_fork_asm+0x1b/0x30
    [  322.660358]  </TASK>
    [  322.660818]     ok 8 test_early_put
    
    Cc: Christian König <christian.koenig@amd.com>
    Cc: Boris Brezillon <boris.brezillon@collabora.com>
    Cc: Danilo Krummrich <dakr@redhat.com>
    Cc: dri-devel@lists.freedesktop.org
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 7ec520d3a63b6e95174329108cd44359a70907ba drm-intel
/mt/dim: line 50: /root/.dimrc: No such file or directory


