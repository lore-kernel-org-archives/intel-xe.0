Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD77CCF9E3
	for <intel-xe@archiver.kernel.org>; Wed,  5 Nov 2025 02:48:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECF6B10E6A6;
	Wed,  5 Nov 2025 02:48:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MKE5KI/6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A1FB10E6A6
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Nov 2025 02:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762310928; x=1793846928;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=MUKyKuXosqCkK44A1sfZytE/o1Zf06uPBCE31sxtvsQ=;
 b=MKE5KI/6NyP6abc8fvJWMtnlLI1MZDQB+dGo7HPphgqOryh/5mtZ+Nb9
 U0UaNBmQWYgy44HUH7EnmylhLPjZ0mfrGCMSS/dEKP4ijQHKKQKXj94kA
 GDM2bRq6/Ufz1Mc6kiEGeAQMJ2irkzX3d45aAD+UP4vOnscL7eo11kidE
 YKZl/RCTHfYfrrsAjiQ7OLtRJgvYRCqfbUBPMn0KU4cmB/0zH6+mrF4B7
 X6odcXCsbhTDjCA44RUlYlqnOup8DlRMGCCdqRiNcDMJ1MXSegpc7CSPH
 m7lnBSJPwRZoHlWtd7EcHcUDDQoOWpTrN3sHeYtkMMcbPowuC9poysL5C Q==;
X-CSE-ConnectionGUID: wnGG5Pc/SziwT7RsHtoIqQ==
X-CSE-MsgGUID: YwXYmUqyROiqhQDBQO0GkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="68071985"
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; d="scan'208";a="68071985"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 18:48:47 -0800
X-CSE-ConnectionGUID: cuPcejxeReiYipBTXC1ESg==
X-CSE-MsgGUID: S4dB3wQIT5Sq9upzx1kg+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; d="scan'208";a="187272293"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
 by orviesa007.jf.intel.com with ESMTP; 04 Nov 2025 18:48:45 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1vGTZi-000S5Y-1U;
 Wed, 05 Nov 2025 02:48:42 +0000
Date: Wed, 5 Nov 2025 10:45:27 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 intel-xe@lists.freedesktop.org,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: [drm-xe:drm-xe-next 3/13] drivers/gpu/drm/xe/xe_vm.c:1461:11:
 warning: variable 'number_tiles' set but not used
Message-ID: <202511051003.yS0SfG3M-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
head:   816e12793c6daef977f3d024b1ae91c54988e3ef
commit: cb99e12ba8cb8a16c44e6de7927e9a1d84260f24 [3/13] drm/xe: Decouple bind queue last fence from TLB invalidations
config: powerpc64-randconfig-002-20251105 (https://download.01.org/0day-ci/archive/20251105/202511051003.yS0SfG3M-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d2625a438020ad35330cda29c3def102c1687b1b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251105/202511051003.yS0SfG3M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511051003.yS0SfG3M-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/xe/xe_vm.c:1461:11: warning: variable 'number_tiles' set but not used [-Wunused-but-set-variable]
    1461 |         int err, number_tiles = 0;
         |                  ^
   1 warning generated.


vim +/number_tiles +1461 drivers/gpu/drm/xe/xe_vm.c

59eabff2a3524d Thomas Hellström       2025-09-08  1454  
9337166fa1d80f Piotr Piórkowski       2025-08-11  1455  struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
dd08ebf6c3525a Matthew Brost          2023-03-30  1456  {
b06d47be7c8316 Matthew Brost          2023-07-07  1457  	struct drm_gem_object *vm_resv_obj;
59eabff2a3524d Thomas Hellström       2025-09-08  1458  	struct xe_validation_ctx ctx;
59eabff2a3524d Thomas Hellström       2025-09-08  1459  	struct drm_exec exec;
dd08ebf6c3525a Matthew Brost          2023-03-30  1460  	struct xe_vm *vm;
b06d47be7c8316 Matthew Brost          2023-07-07 @1461  	int err, number_tiles = 0;
876611c2b75689 Matt Roper             2023-06-01  1462  	struct xe_tile *tile;
dd08ebf6c3525a Matthew Brost          2023-03-30  1463  	u8 id;
dd08ebf6c3525a Matthew Brost          2023-03-30  1464  
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  1465  	/*
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  1466  	 * Since the GSCCS is not user-accessible, we don't expect a GSC VM to
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  1467  	 * ever be in faulting mode.
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  1468  	 */
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  1469  	xe_assert(xe, !((flags & XE_VM_FLAG_GSC) && (flags & XE_VM_FLAG_FAULT_MODE)));
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  1470  
dd08ebf6c3525a Matthew Brost          2023-03-30  1471  	vm = kzalloc(sizeof(*vm), GFP_KERNEL);
dd08ebf6c3525a Matthew Brost          2023-03-30  1472  	if (!vm)
dd08ebf6c3525a Matthew Brost          2023-03-30  1473  		return ERR_PTR(-ENOMEM);
dd08ebf6c3525a Matthew Brost          2023-03-30  1474  
dd08ebf6c3525a Matthew Brost          2023-03-30  1475  	vm->xe = xe;
dd08ebf6c3525a Matthew Brost          2023-03-30  1476  
e9bb0891e69055 Matt Roper             2023-08-11  1477  	vm->size = 1ull << xe->info.va_bits;
dd08ebf6c3525a Matthew Brost          2023-03-30  1478  	vm->flags = flags;
dd08ebf6c3525a Matthew Brost          2023-03-30  1479  
9337166fa1d80f Piotr Piórkowski       2025-08-11  1480  	if (xef)
9337166fa1d80f Piotr Piórkowski       2025-08-11  1481  		vm->xef = xe_file_get(xef);
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  1482  	/**
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  1483  	 * GSC VMs are kernel-owned, only used for PXP ops and can sometimes be
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  1484  	 * manipulated under the PXP mutex. However, the PXP mutex can be taken
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  1485  	 * under a user-VM lock when the PXP session is started at exec_queue
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  1486  	 * creation time. Those are different VMs and therefore there is no risk
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  1487  	 * of deadlock, but we need to tell lockdep that this is the case or it
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  1488  	 * will print a warning.
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  1489  	 */
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  1490  	if (flags & XE_VM_FLAG_GSC) {
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  1491  		static struct lock_class_key gsc_vm_key;
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  1492  
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  1493  		__init_rwsem(&vm->lock, "gsc_vm", &gsc_vm_key);
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  1494  	} else {
dd08ebf6c3525a Matthew Brost          2023-03-30  1495  		init_rwsem(&vm->lock);
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  1496  	}
0cd99046ca0522 Maarten Lankhorst      2024-02-21  1497  	mutex_init(&vm->snap_mutex);
dd08ebf6c3525a Matthew Brost          2023-03-30  1498  
dd08ebf6c3525a Matthew Brost          2023-03-30  1499  	INIT_LIST_HEAD(&vm->rebind_list);
dd08ebf6c3525a Matthew Brost          2023-03-30  1500  
dd08ebf6c3525a Matthew Brost          2023-03-30  1501  	INIT_LIST_HEAD(&vm->userptr.repin_list);
dd08ebf6c3525a Matthew Brost          2023-03-30  1502  	INIT_LIST_HEAD(&vm->userptr.invalidated);
dd08ebf6c3525a Matthew Brost          2023-03-30  1503  	spin_lock_init(&vm->userptr.invalidated_lock);
dd08ebf6c3525a Matthew Brost          2023-03-30  1504  
4c44f89c5daee9 Thomas Hellström       2024-07-05  1505  	ttm_lru_bulk_move_init(&vm->lru_bulk_move);
4c44f89c5daee9 Thomas Hellström       2024-07-05  1506  
6e78e0719d0ed5 Matthew Auld           2024-04-23  1507  	INIT_WORK(&vm->destroy_work, vm_destroy_work_func);
6e78e0719d0ed5 Matthew Auld           2024-04-23  1508  
9b9529ce379a08 Francois Dugast        2023-07-31  1509  	INIT_LIST_HEAD(&vm->preempt.exec_queues);
dd08ebf6c3525a Matthew Brost          2023-03-30  1510  	vm->preempt.min_run_period_ms = 10;	/* FIXME: Wire up to uAPI */
dd08ebf6c3525a Matthew Brost          2023-03-30  1511  
fd84041d094ce8 Matthew Brost          2023-07-19  1512  	for_each_tile(tile, xe, id)
fd84041d094ce8 Matthew Brost          2023-07-19  1513  		xe_range_fence_tree_init(&vm->rftree[id]);
fd84041d094ce8 Matthew Brost          2023-07-19  1514  
0e5e77bd9704ed Lucas De Marchi        2023-09-27  1515  	vm->pt_ops = &xelp_pt_ops;
0e5e77bd9704ed Lucas De Marchi        2023-09-27  1516  
73ba282e7faf62 Rodrigo Vivi           2024-05-22  1517  	/*
73ba282e7faf62 Rodrigo Vivi           2024-05-22  1518  	 * Long-running workloads are not protected by the scheduler references.
73ba282e7faf62 Rodrigo Vivi           2024-05-22  1519  	 * By design, run_job for long-running workloads returns NULL and the
73ba282e7faf62 Rodrigo Vivi           2024-05-22  1520  	 * scheduler drops all the references of it, hence protecting the VM
73ba282e7faf62 Rodrigo Vivi           2024-05-22  1521  	 * for this case is necessary.
73ba282e7faf62 Rodrigo Vivi           2024-05-22  1522  	 */
96af397aa1a2d1 Matthew Auld           2025-05-14  1523  	if (flags & XE_VM_FLAG_LR_MODE) {
96af397aa1a2d1 Matthew Auld           2025-05-14  1524  		INIT_WORK(&vm->preempt.rebind_work, preempt_rebind_work_func);
783d6cdc8231f6 Rodrigo Vivi           2024-04-18  1525  		xe_pm_runtime_get_noresume(xe);
599334572a5a99 Thomas Hellström       2025-09-04  1526  		INIT_LIST_HEAD(&vm->preempt.pm_activate_link);
96af397aa1a2d1 Matthew Auld           2025-05-14  1527  	}
dd08ebf6c3525a Matthew Brost          2023-03-30  1528  
4f296d77cf49fc Matthew Auld           2025-05-14  1529  	err = xe_svm_init(vm);
4f296d77cf49fc Matthew Auld           2025-05-14  1530  	if (err)
4f296d77cf49fc Matthew Auld           2025-05-14  1531  		goto err_no_resv;
4f296d77cf49fc Matthew Auld           2025-05-14  1532  
b06d47be7c8316 Matthew Brost          2023-07-07  1533  	vm_resv_obj = drm_gpuvm_resv_object_alloc(&xe->drm);
b06d47be7c8316 Matthew Brost          2023-07-07  1534  	if (!vm_resv_obj) {
b06d47be7c8316 Matthew Brost          2023-07-07  1535  		err = -ENOMEM;
4f296d77cf49fc Matthew Auld           2025-05-14  1536  		goto err_svm_fini;
b06d47be7c8316 Matthew Brost          2023-07-07  1537  	}
b06d47be7c8316 Matthew Brost          2023-07-07  1538  
35705e32b13cf8 Thomas Hellström       2023-12-12  1539  	drm_gpuvm_init(&vm->gpuvm, "Xe VM", DRM_GPUVM_RESV_PROTECTED, &xe->drm,
35705e32b13cf8 Thomas Hellström       2023-12-12  1540  		       vm_resv_obj, 0, vm->size, 0, 0, &gpuvm_ops);
b06d47be7c8316 Matthew Brost          2023-07-07  1541  
b06d47be7c8316 Matthew Brost          2023-07-07  1542  	drm_gem_object_put(vm_resv_obj);
b06d47be7c8316 Matthew Brost          2023-07-07  1543  
59eabff2a3524d Thomas Hellström       2025-09-08  1544  	err = 0;
59eabff2a3524d Thomas Hellström       2025-09-08  1545  	xe_validation_guard(&ctx, &xe->val, &exec, (struct xe_val_flags) {.interruptible = true},
59eabff2a3524d Thomas Hellström       2025-09-08  1546  			    err) {
59eabff2a3524d Thomas Hellström       2025-09-08  1547  		err = xe_vm_drm_exec_lock(vm, &exec);
59eabff2a3524d Thomas Hellström       2025-09-08  1548  		drm_exec_retry_on_contention(&exec);
dd08ebf6c3525a Matthew Brost          2023-03-30  1549  
dd08ebf6c3525a Matthew Brost          2023-03-30  1550  		if (IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
0d39b6daa54553 Lucas De Marchi        2023-07-18  1551  			vm->flags |= XE_VM_FLAG_64K;
dd08ebf6c3525a Matthew Brost          2023-03-30  1552  
876611c2b75689 Matt Roper             2023-06-01  1553  		for_each_tile(tile, xe, id) {
dd08ebf6c3525a Matthew Brost          2023-03-30  1554  			if (flags & XE_VM_FLAG_MIGRATION &&
0d39b6daa54553 Lucas De Marchi        2023-07-18  1555  			    tile->id != XE_VM_FLAG_TILE_ID(flags))
dd08ebf6c3525a Matthew Brost          2023-03-30  1556  				continue;
dd08ebf6c3525a Matthew Brost          2023-03-30  1557  
59eabff2a3524d Thomas Hellström       2025-09-08  1558  			vm->pt_root[id] = xe_pt_create(vm, tile, xe->info.vm_max_level,
59eabff2a3524d Thomas Hellström       2025-09-08  1559  						       &exec);
dd08ebf6c3525a Matthew Brost          2023-03-30  1560  			if (IS_ERR(vm->pt_root[id])) {
dd08ebf6c3525a Matthew Brost          2023-03-30  1561  				err = PTR_ERR(vm->pt_root[id]);
dd08ebf6c3525a Matthew Brost          2023-03-30  1562  				vm->pt_root[id] = NULL;
59eabff2a3524d Thomas Hellström       2025-09-08  1563  				xe_vm_pt_destroy(vm);
59eabff2a3524d Thomas Hellström       2025-09-08  1564  				drm_exec_retry_on_contention(&exec);
59eabff2a3524d Thomas Hellström       2025-09-08  1565  				xe_validation_retry_on_oom(&ctx, &err);
59eabff2a3524d Thomas Hellström       2025-09-08  1566  				break;
dd08ebf6c3525a Matthew Brost          2023-03-30  1567  			}
dd08ebf6c3525a Matthew Brost          2023-03-30  1568  		}
59eabff2a3524d Thomas Hellström       2025-09-08  1569  		if (err)
59eabff2a3524d Thomas Hellström       2025-09-08  1570  			break;
dd08ebf6c3525a Matthew Brost          2023-03-30  1571  
06951c2ee72df2 Thomas Hellström       2023-12-09  1572  		if (xe_vm_has_scratch(vm)) {
876611c2b75689 Matt Roper             2023-06-01  1573  			for_each_tile(tile, xe, id) {
dd08ebf6c3525a Matthew Brost          2023-03-30  1574  				if (!vm->pt_root[id])
dd08ebf6c3525a Matthew Brost          2023-03-30  1575  					continue;
dd08ebf6c3525a Matthew Brost          2023-03-30  1576  
59eabff2a3524d Thomas Hellström       2025-09-08  1577  				err = xe_vm_create_scratch(xe, tile, vm, &exec);
59eabff2a3524d Thomas Hellström       2025-09-08  1578  				if (err) {
59eabff2a3524d Thomas Hellström       2025-09-08  1579  					xe_vm_free_scratch(vm);
59eabff2a3524d Thomas Hellström       2025-09-08  1580  					xe_vm_pt_destroy(vm);
59eabff2a3524d Thomas Hellström       2025-09-08  1581  					drm_exec_retry_on_contention(&exec);
59eabff2a3524d Thomas Hellström       2025-09-08  1582  					xe_validation_retry_on_oom(&ctx, &err);
59eabff2a3524d Thomas Hellström       2025-09-08  1583  					break;
59eabff2a3524d Thomas Hellström       2025-09-08  1584  				}
dd08ebf6c3525a Matthew Brost          2023-03-30  1585  			}
59eabff2a3524d Thomas Hellström       2025-09-08  1586  			if (err)
59eabff2a3524d Thomas Hellström       2025-09-08  1587  				break;
85dbfe47d07cdd Thomas Hellström       2023-06-05  1588  			vm->batch_invalidate_tlb = true;
dd08ebf6c3525a Matthew Brost          2023-03-30  1589  		}
dd08ebf6c3525a Matthew Brost          2023-03-30  1590  
59eabff2a3524d Thomas Hellström       2025-09-08  1591  		if (vm->flags & XE_VM_FLAG_LR_MODE) {
59eabff2a3524d Thomas Hellström       2025-09-08  1592  			INIT_WORK(&vm->preempt.rebind_work, preempt_rebind_work_func);
85dbfe47d07cdd Thomas Hellström       2023-06-05  1593  			vm->batch_invalidate_tlb = false;
59eabff2a3524d Thomas Hellström       2025-09-08  1594  		}
dd08ebf6c3525a Matthew Brost          2023-03-30  1595  
dd08ebf6c3525a Matthew Brost          2023-03-30  1596  		/* Fill pt_root after allocating scratch tables */
876611c2b75689 Matt Roper             2023-06-01  1597  		for_each_tile(tile, xe, id) {
dd08ebf6c3525a Matthew Brost          2023-03-30  1598  			if (!vm->pt_root[id])
dd08ebf6c3525a Matthew Brost          2023-03-30  1599  				continue;
dd08ebf6c3525a Matthew Brost          2023-03-30  1600  
876611c2b75689 Matt Roper             2023-06-01  1601  			xe_pt_populate_empty(tile, vm, vm->pt_root[id]);
dd08ebf6c3525a Matthew Brost          2023-03-30  1602  		}
59eabff2a3524d Thomas Hellström       2025-09-08  1603  	}
59eabff2a3524d Thomas Hellström       2025-09-08  1604  	if (err)
59eabff2a3524d Thomas Hellström       2025-09-08  1605  		goto err_close;
dd08ebf6c3525a Matthew Brost          2023-03-30  1606  
dd08ebf6c3525a Matthew Brost          2023-03-30  1607  	/* Kernel migration VM shouldn't have a circular loop.. */
dd08ebf6c3525a Matthew Brost          2023-03-30  1608  	if (!(flags & XE_VM_FLAG_MIGRATION)) {
876611c2b75689 Matt Roper             2023-06-01  1609  		for_each_tile(tile, xe, id) {
9b9529ce379a08 Francois Dugast        2023-07-31  1610  			struct xe_exec_queue *q;
d3d767396a02fa Matthew Brost          2023-12-15  1611  			u32 create_flags = EXEC_QUEUE_FLAG_VM;
dd08ebf6c3525a Matthew Brost          2023-03-30  1612  
dd08ebf6c3525a Matthew Brost          2023-03-30  1613  			if (!vm->pt_root[id])
dd08ebf6c3525a Matthew Brost          2023-03-30  1614  				continue;
dd08ebf6c3525a Matthew Brost          2023-03-30  1615  
852856e3b6f679 Matthew Brost          2024-08-15  1616  			q = xe_exec_queue_create_bind(xe, tile, create_flags, 0);
9b9529ce379a08 Francois Dugast        2023-07-31  1617  			if (IS_ERR(q)) {
9b9529ce379a08 Francois Dugast        2023-07-31  1618  				err = PTR_ERR(q);
b06d47be7c8316 Matthew Brost          2023-07-07  1619  				goto err_close;
dd08ebf6c3525a Matthew Brost          2023-03-30  1620  			}
9b9529ce379a08 Francois Dugast        2023-07-31  1621  			vm->q[id] = q;
876611c2b75689 Matt Roper             2023-06-01  1622  			number_tiles++;
dd08ebf6c3525a Matthew Brost          2023-03-30  1623  		}
dd08ebf6c3525a Matthew Brost          2023-03-30  1624  	}
dd08ebf6c3525a Matthew Brost          2023-03-30  1625  
30e0c3f43a4146 Piotr Piórkowski       2025-08-11  1626  	if (xef && xe->info.has_asid) {
30e0c3f43a4146 Piotr Piórkowski       2025-08-11  1627  		u32 asid;
30e0c3f43a4146 Piotr Piórkowski       2025-08-11  1628  
30e0c3f43a4146 Piotr Piórkowski       2025-08-11  1629  		down_write(&xe->usm.lock);
30e0c3f43a4146 Piotr Piórkowski       2025-08-11  1630  		err = xa_alloc_cyclic(&xe->usm.asid_to_vm, &asid, vm,
30e0c3f43a4146 Piotr Piórkowski       2025-08-11  1631  				      XA_LIMIT(1, XE_MAX_ASID - 1),
30e0c3f43a4146 Piotr Piórkowski       2025-08-11  1632  				      &xe->usm.next_asid, GFP_KERNEL);
30e0c3f43a4146 Piotr Piórkowski       2025-08-11  1633  		up_write(&xe->usm.lock);
30e0c3f43a4146 Piotr Piórkowski       2025-08-11  1634  		if (err < 0)
59eabff2a3524d Thomas Hellström       2025-09-08  1635  			goto err_close;
30e0c3f43a4146 Piotr Piórkowski       2025-08-11  1636  
30e0c3f43a4146 Piotr Piórkowski       2025-08-11  1637  		vm->usm.asid = asid;
30e0c3f43a4146 Piotr Piórkowski       2025-08-11  1638  	}
30e0c3f43a4146 Piotr Piórkowski       2025-08-11  1639  
dd08ebf6c3525a Matthew Brost          2023-03-30  1640  	trace_xe_vm_create(vm);
dd08ebf6c3525a Matthew Brost          2023-03-30  1641  
dd08ebf6c3525a Matthew Brost          2023-03-30  1642  	return vm;
dd08ebf6c3525a Matthew Brost          2023-03-30  1643  
b06d47be7c8316 Matthew Brost          2023-07-07  1644  err_close:
b06d47be7c8316 Matthew Brost          2023-07-07  1645  	xe_vm_close_and_put(vm);
b06d47be7c8316 Matthew Brost          2023-07-07  1646  	return ERR_PTR(err);
dd08ebf6c3525a Matthew Brost          2023-03-30  1647  
4f296d77cf49fc Matthew Auld           2025-05-14  1648  err_svm_fini:
4f296d77cf49fc Matthew Auld           2025-05-14  1649  	if (flags & XE_VM_FLAG_FAULT_MODE) {
4f296d77cf49fc Matthew Auld           2025-05-14  1650  		vm->size = 0; /* close the vm */
4f296d77cf49fc Matthew Auld           2025-05-14  1651  		xe_svm_fini(vm);
4f296d77cf49fc Matthew Auld           2025-05-14  1652  	}
b06d47be7c8316 Matthew Brost          2023-07-07  1653  err_no_resv:
0cd99046ca0522 Maarten Lankhorst      2024-02-21  1654  	mutex_destroy(&vm->snap_mutex);
fd84041d094ce8 Matthew Brost          2023-07-19  1655  	for_each_tile(tile, xe, id)
fd84041d094ce8 Matthew Brost          2023-07-19  1656  		xe_range_fence_tree_fini(&vm->rftree[id]);
4c44f89c5daee9 Thomas Hellström       2024-07-05  1657  	ttm_lru_bulk_move_fini(&xe->ttm, &vm->lru_bulk_move);
9337166fa1d80f Piotr Piórkowski       2025-08-11  1658  	if (vm->xef)
9337166fa1d80f Piotr Piórkowski       2025-08-11  1659  		xe_file_put(vm->xef);
dd08ebf6c3525a Matthew Brost          2023-03-30  1660  	kfree(vm);
73ba282e7faf62 Rodrigo Vivi           2024-05-22  1661  	if (flags & XE_VM_FLAG_LR_MODE)
783d6cdc8231f6 Rodrigo Vivi           2024-04-18  1662  		xe_pm_runtime_put(xe);
dd08ebf6c3525a Matthew Brost          2023-03-30  1663  	return ERR_PTR(err);
dd08ebf6c3525a Matthew Brost          2023-03-30  1664  }
dd08ebf6c3525a Matthew Brost          2023-03-30  1665  

:::::: The code at line 1461 was first introduced by commit
:::::: b06d47be7c83165d3b3e45e1d5f9520b79c7f5cc drm/xe: Port Xe to GPUVA

:::::: TO: Matthew Brost <matthew.brost@intel.com>
:::::: CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
