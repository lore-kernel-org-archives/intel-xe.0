Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 159BEC4452E
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jan 2026 13:22:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1FE310E1EF;
	Wed, 21 Jan 2026 13:22:52 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC4B110E154;
 Wed, 21 Jan 2026 13:22:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echecksparse=3A_warning_for_dma-buf=3A_Use_revoke_me?=
 =?utf-8?q?chanism_to_invalidate_shared_buffers_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Leon Romanovsky" <leon@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 21 Jan 2026 13:22:51 -0000
Message-ID: <176900177184.177197.1533897893842954846@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260121-dmabuf-revoke-v4-0-d311cbc8633d@nvidia.com>
In-Reply-To: <20260121-dmabuf-revoke-v4-0-d311cbc8633d@nvidia.com>
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

Series: dma-buf: Use revoke mechanism to invalidate shared buffers (rev2)
URL   : https://patchwork.freedesktop.org/series/160360/
State : warning

== Summary ==

+ trap cleanup EXIT
+ KERNEL=/kernel
+ MT=/root/linux/maintainer-tools
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools /root/linux/maintainer-tools
Cloning into '/root/linux/maintainer-tools'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ make -C /root/linux/maintainer-tools
make: Entering directory '/root/linux/maintainer-tools'
cc -O2 -g -Wextra -o remap-log remap-log.c
make: Leaving directory '/root/linux/maintainer-tools'
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ /root/linux/maintainer-tools/dim sparse --fast f869ee12e212bfa9fe277e6586c2c02902ed950b
Sparse version: 0.6.4 (Ubuntu: 0.6.4-4ubuntu3)
Fast mode used, each commit won't be checked separately.
-
+drivers/gpu/drm/drm_bridge.c:1643:1: error: bad constant expression
+drivers/gpu/drm/drm_bridge.c:1644:1: error: bad constant expression
+drivers/gpu/drm/drm_bridge.c:1645:1: error: bad constant expression
+drivers/gpu/drm/drm_bridge.c:1645:1: error: bad constant expression
+drivers/gpu/drm/drm_gem_framebuffer_helper.c:23:1: error: bad constant expression
+drivers/gpu/drm/drm_gem_shmem_helper.c:28:1: error: bad constant expression
+drivers/gpu/drm/drm_gem_shmem_helper.c:967:1: error: bad constant expression
+drivers/gpu/drm/drm_gem_shmem_helper.c:968:1: error: bad constant expression
+drivers/gpu/drm/drm_gem_shmem_helper.c:969:1: error: bad constant expression
+drivers/gpu/drm/drm_gem_shmem_helper.c:969:1: error: bad constant expression
+drivers/gpu/drm/drm_prime.c:44:1: error: bad constant expression
+drivers/gpu/drm/i915/display/intel_display_debugfs.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_dpt.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_fb_bo.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_fbc.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h, drivers/gpu/drm/i915/display/intel_display_trace.h):
+drivers/gpu/drm/i915/display/intel_fb.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_fb_pin.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_frontbuffer.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h, drivers/gpu/drm/i915/display/intel_display_trace.h):
+drivers/gpu/drm/i915/display/intel_overlay.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_plane.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h, drivers/gpu/drm/i915/display/intel_display_trace.h):
+drivers/gpu/drm/i915/display/intel_psr.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c:18:1: error: bad constant expression
+drivers/gpu/drm/i915/gem/i915_gem_pages.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/gt/intel_reset.c:1569:12: warning: context imbalance in '_intel_gt_reset_lock' - different lock contexts for basic block
+drivers/gpu/drm/i915/gt/intel_sseu.c:600:17: error: too long token expansion
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:191:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:191:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:191:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:191:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:191:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:191:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:191:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:191:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:191:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:191:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:191:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:191:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:191:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:191:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:191:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:191:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:191:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:191:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:191:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:191:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:191:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:192:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:192:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:192:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:192:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:192:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:192:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:192:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:192:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:192:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:192:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:192:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:192:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:192:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:192:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:192:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:192:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:192:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:192:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:192:1: error: bad constant expression
+drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:193:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_active.c:1062:16: warning: context imbalance in '__i915_active_fence_set' - different lock contexts for basic block
+drivers/gpu/drm/i915/i915_drm_client.c:92:9: error: incompatible types in comparison expression (different address spaces):
+drivers/gpu/drm/i915/i915_drm_client.c:92:9: error: incompatible types in comparison expression (different address spaces):
+drivers/gpu/drm/i915/i915_drm_client.c:92:9:    expected struct list_head const *list
+drivers/gpu/drm/i915/i915_drm_client.c:92:9:    got struct list_head [noderef] __rcu *pos
+drivers/gpu/drm/i915/i915_drm_client.c:92:9:    struct list_head *
+drivers/gpu/drm/i915/i915_drm_client.c:92:9:    struct list_head *
+drivers/gpu/drm/i915/i915_drm_client.c:92:9:    struct list_head [noderef] __rcu *
+drivers/gpu/drm/i915/i915_drm_client.c:92:9:    struct list_head [noderef] __rcu *
+drivers/gpu/drm/i915/i915_drm_client.c:92:9: warning: incorrect type in argument 1 (different address spaces)
+drivers/gpu/drm/i915/i915_initial_plane.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/i915_irq.c:467:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:467:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:475:16: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:475:16: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:480:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:480:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:480:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:518:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:518:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:526:16: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:526:16: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:531:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:531:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:531:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:575:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:575:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:578:15: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:578:15: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:582:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:582:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:589:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:589:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:589:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:589:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_mitigations.c:133:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_module.c:125:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_module.c:126:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_module.c:128:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_module.c:129:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_module.c:129:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_panic.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/i915_params.c:100:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_params.c:100:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_params.c:104:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_params.c:104:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_params.c:107:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_params.c:107:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_params.c:110:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_params.c:110:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_params.c:119:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_params.c:119:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_params.c:123:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_params.c:123:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_params.c:125:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_params.c:125:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_params.c:66:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_params.c:66:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_params.c:69:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_params.c:69:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_params.c:73:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_params.c:73:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_params.c:79:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_params.c:79:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_params.c:84:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_params.c:84:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_params.c:88:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_params.c:88:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_params.c:91:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_params.c:91:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_params.c:95:1: error: bad constant expression
+drivers/gpu/drm/i915/i915_params.c:95:1: error: bad constant expression
+drivers/gpu/drm/i915/intel_uncore.c:1930:1: warning: context imbalance in 'fwtable_read8' - unexpected unlock
+drivers/gpu/drm/i915/intel_uncore.c:1931:1: warning: context imbalance in 'fwtable_read16' - unexpected unlock
+drivers/gpu/drm/i915/intel_uncore.c:1932:1: warning: context imbalance in 'fwtable_read32' - unexpected unlock
+drivers/gpu/drm/i915/intel_uncore.c:1933:1: warning: context imbalance in 'fwtable_read64' - unexpected unlock
+drivers/gpu/drm/i915/intel_uncore.c:1998:1: warning: context imbalance in 'gen6_write8' - unexpected unlock
+drivers/gpu/drm/i915/intel_uncore.c:1999:1: warning: context imbalance in 'gen6_write16' - unexpected unlock
+drivers/gpu/drm/i915/intel_uncore.c:2000:1: warning: context imbalance in 'gen6_write32' - unexpected unlock
+drivers/gpu/drm/i915/intel_uncore.c:2020:1: warning: context imbalance in 'fwtable_write8' - unexpected unlock
+drivers/gpu/drm/i915/intel_uncore.c:2021:1: warning: context imbalance in 'fwtable_write16' - unexpected unlock
+drivers/gpu/drm/i915/intel_uncore.c:2022:1: warning: context imbalance in 'fwtable_write32' - unexpected unlock
+drivers/gpu/drm/i915/intel_wakeref.c:148:19: warning: context imbalance in 'wakeref_auto_timeout' - unexpected unlock
+drivers/gpu/drm/ttm/ttm_bo.c:1203:31: warning: symbol 'ttm_swap_ops' was not declared. Should it be static?
+drivers/gpu/drm/ttm/ttm_bo_util.c:329:38:    expected void *virtual
+drivers/gpu/drm/ttm/ttm_bo_util.c:329:38:    got void [noderef] __iomem *
+drivers/gpu/drm/ttm/ttm_bo_util.c:329:38: warning: incorrect type in assignment (different address spaces)
+drivers/gpu/drm/ttm/ttm_bo_util.c:332:38:    expected void *virtual
+drivers/gpu/drm/ttm/ttm_bo_util.c:332:38:    got void [noderef] __iomem *
+drivers/gpu/drm/ttm/ttm_bo_util.c:332:38: warning: incorrect type in assignment (different address spaces)
+drivers/gpu/drm/ttm/ttm_bo_util.c:335:38:    expected void *virtual
+drivers/gpu/drm/ttm/ttm_bo_util.c:335:38:    got void [noderef] __iomem *
+drivers/gpu/drm/ttm/ttm_bo_util.c:335:38: warning: incorrect type in assignment (different address spaces)
+drivers/gpu/drm/ttm/ttm_bo_util.c:465:28:    expected void volatile [noderef] __iomem *addr
+drivers/gpu/drm/ttm/ttm_bo_util.c:465:28:    got void *virtual
+drivers/gpu/drm/ttm/ttm_bo_util.c:465:28: warning: incorrect type in argument 1 (different address spaces)
+drivers/gpu/drm/ttm/ttm_pool.c:119:1: error: bad constant expression
+drivers/gpu/drm/ttm/ttm_pool.c:120:1: error: bad constant expression
+drivers/gpu/drm/ttm/ttm_tt.c:54:1: error: bad constant expression
+drivers/gpu/drm/ttm/ttm_tt.c:55:1: error: bad constant expression
+drivers/gpu/drm/ttm/ttm_tt.c:59:1: error: bad constant expression
+drivers/gpu/drm/ttm/ttm_tt.c:60:1: error: bad constant expression
+drivers/gpu/drm/virtio/virtgpu_drv.c:217:1: error: bad constant expression
+drivers/gpu/drm/virtio/virtgpu_drv.c:218:1: error: bad constant expression
+drivers/gpu/drm/virtio/virtgpu_drv.c:218:1: error: bad constant expression
+drivers/gpu/drm/virtio/virtgpu_drv.c:219:1: error: bad constant expression
+drivers/gpu/drm/virtio/virtgpu_drv.c:220:1: error: bad constant expression
+drivers/gpu/drm/virtio/virtgpu_drv.c:221:1: error: bad constant expression
+drivers/gpu/drm/virtio/virtgpu_drv.c:52:1: error: bad constant expression
+drivers/gpu/drm/virtio/virtgpu_drv.c:53:1: error: bad constant expression
+drivers/gpu/drm/virtio/virtgpu_object.c:34:1: error: bad constant expression
+drivers/gpu/drm/virtio/virtgpu_prime.c:30:1: error: bad constant expression
+./include/linux/pwm.h:13:1: error: bad constant expression
+./include/linux/pwm.h:13:1: error: bad constant expression
+./include/linux/pwm.h:13:1: error: bad constant expression
+./include/linux/pwm.h:13:1: error: bad constant expression
+./include/linux/pwm.h:13:1: error: bad constant expression
+./include/linux/pwm.h:13:1: error: bad constant expression
+./include/linux/pwm.h:13:1: error: bad constant expression
+./include/linux/pwm.h:13:1: error: bad constant expression
+./include/linux/pwm.h:13:1: error: bad constant expression
+./include/linux/pwm.h:13:1: error: bad constant expression
+./include/linux/pwm.h:13:1: error: bad constant expression
+./include/linux/pwm.h:13:1: error: bad constant expression
+./include/linux/pwm.h:13:1: error: bad constant expression

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


