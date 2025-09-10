Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45192CA101F
	for <intel-xe@archiver.kernel.org>; Wed, 10 Sep 2025 15:15:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D913510E946;
	Wed, 10 Sep 2025 15:15:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G4Tr3Iwq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14E1010E946
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Sep 2025 15:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757517330; x=1789053330;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=004ojRjA0Z1v7vY42xy8S+nXCdgtTiqcCSVmkxVZ4dc=;
 b=G4Tr3Iwq0889vCDpekqgvyVHwLqmY6ZE5qX42E6BUJTP132oODy1j9Lf
 UCVrFf6EuqRRj1qMDS3xzsi+UmZYtpH+5y0F2qTjawf5ELJvjkqZ3auwc
 0MMw+8CHYD3isOazoik4ntZH1m7LmCqsIi7TVzu+j3MHe7Ugj+eDdZEAt
 1a1IqypoEvns2SzURqJYDrm8UPbQbjqBv2ZjEt8PL4k+WcrmjYvc9LIlH
 WlLR5DEN59mblt41K87Z0sSx+yS12UJCnf9eBKy61sU/xmcLU8CiRIbAA
 PpYaueKmzwoGAgkUQN6ThfbjEjI5d+ps/UOFgjmIdv4JyIec9vHxwaADA g==;
X-CSE-ConnectionGUID: /URFjdshSY+kno+AYFqTAw==
X-CSE-MsgGUID: eMWzNnRYROagbCSraTioxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="70522074"
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; d="scan'208";a="70522074"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 08:15:29 -0700
X-CSE-ConnectionGUID: yAMFH3p8QfWZkK7/iwf6WA==
X-CSE-MsgGUID: mHZVKwI5RXeAYRmizsn1Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; d="scan'208";a="174225326"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
 by fmviesa010.fm.intel.com with ESMTP; 10 Sep 2025 08:15:28 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uwMXe-000635-0i;
 Wed, 10 Sep 2025 15:15:26 +0000
Date: Wed, 10 Sep 2025 23:14:56 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 intel-xe@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>
Subject: [drm-xe:drm-xe-next 7/13]
 drivers/gpu/drm/xe/display/xe_fb_pin.c:314:8: warning: variable 'ret' is
 uninitialized when used here
Message-ID: <202509102218.kZLrvcuD-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
head:   844150c255c94230aec41f88db8e2875cb97439e
commit: 7bcb6e38c14d7d2654555a1b05b2a9a5411c693c [7/13] drm/xe/display: Convert __xe_pin_fb_vma()
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250910/202509102218.kZLrvcuD-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250910/202509102218.kZLrvcuD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509102218.kZLrvcuD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/xe/display/xe_fb_pin.c:314:8: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     314 |                             ret) {
         |                             ^~~
   drivers/gpu/drm/xe/xe_validation.h:189:57: note: expanded from macro 'xe_validation_guard'
     189 |         scoped_guard(xe_validation, _ctx, _val, _exec, _flags, _ret) \
         |                                                                ^~~~
   include/linux/cleanup.h:429:44: note: expanded from macro 'scoped_guard'
     429 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |                                                   ^~~~
   include/linux/cleanup.h:420:27: note: expanded from macro '__scoped_guard'
     420 |         for (CLASS(_name, scope)(args);                                 \
         |                                  ^~~~
   drivers/gpu/drm/xe/display/xe_fb_pin.c:286:9: note: initialize the variable 'ret' to silence this warning
     286 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +/ret +314 drivers/gpu/drm/xe/display/xe_fb_pin.c

   274	
   275	static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
   276						const struct i915_gtt_view *view,
   277						unsigned int alignment)
   278	{
   279		struct drm_device *dev = fb->base.dev;
   280		struct xe_device *xe = to_xe_device(dev);
   281		struct i915_vma *vma = kzalloc(sizeof(*vma), GFP_KERNEL);
   282		struct drm_gem_object *obj = intel_fb_bo(&fb->base);
   283		struct xe_bo *bo = gem_to_xe_bo(obj);
   284		struct xe_validation_ctx ctx;
   285		struct drm_exec exec;
   286		int ret;
   287	
   288		if (!vma)
   289			return ERR_PTR(-ENODEV);
   290	
   291		refcount_set(&vma->ref, 1);
   292		if (IS_DGFX(to_xe_device(bo->ttm.base.dev)) &&
   293		    intel_fb_rc_ccs_cc_plane(&fb->base) >= 0 &&
   294		    !(bo->flags & XE_BO_FLAG_NEEDS_CPU_ACCESS)) {
   295			struct xe_vram_region *vram = xe_device_get_root_tile(xe)->mem.vram;
   296	
   297			/*
   298			 * If we need to able to access the clear-color value stored in
   299			 * the buffer, then we require that such buffers are also CPU
   300			 * accessible.  This is important on small-bar systems where
   301			 * only some subset of VRAM is CPU accessible.
   302			 */
   303			if (xe_vram_region_io_size(vram) < xe_vram_region_usable_size(vram)) {
   304				ret = -EINVAL;
   305				goto err;
   306			}
   307		}
   308	
   309		/*
   310		 * Pin the framebuffer, we can't use xe_bo_(un)pin functions as the
   311		 * assumptions are incorrect for framebuffers
   312		 */
   313		xe_validation_guard(&ctx, &xe->val, &exec, (struct xe_val_flags) {.interruptible = true},
 > 314				    ret) {
   315			ret = drm_exec_lock_obj(&exec, &bo->ttm.base);
   316			drm_exec_retry_on_contention(&exec);
   317			if (ret)
   318				break;
   319	
   320			if (IS_DGFX(xe))
   321				ret = xe_bo_migrate(bo, XE_PL_VRAM0, NULL, &exec);
   322			else
   323				ret = xe_bo_validate(bo, NULL, true, &exec);
   324			drm_exec_retry_on_contention(&exec);
   325			xe_validation_retry_on_oom(&ctx, &ret);
   326			if (!ret)
   327				ttm_bo_pin(&bo->ttm);
   328		}
   329		if (ret)
   330			goto err;
   331	
   332		vma->bo = bo;
   333		if (intel_fb_uses_dpt(&fb->base))
   334			ret = __xe_pin_fb_vma_dpt(fb, view, vma, alignment);
   335		else
   336			ret = __xe_pin_fb_vma_ggtt(fb, view, vma,  alignment);
   337		if (ret)
   338			goto err_unpin;
   339	
   340		return vma;
   341	
   342	err_unpin:
   343		ttm_bo_reserve(&bo->ttm, false, false, NULL);
   344		ttm_bo_unpin(&bo->ttm);
   345		ttm_bo_unreserve(&bo->ttm);
   346	err:
   347		kfree(vma);
   348		return ERR_PTR(ret);
   349	}
   350	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
