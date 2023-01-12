Return-Path: <intel-xe-bounces@lists.freedesktop.org>
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Thu, 12 Jan 2023 17:25:01 -0500
Message-ID: <20230112222538.2000142-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [Intel-xe] [PATCH 00/37] Catching up since we went public
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
To: intel-xe@lists.freedesktop.org, matthew.brost@intel.com, maarten.lankhorst@linux.intel.com, philippe.lecluse@intel.com, mchehab@kernel.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Hi Folks,

For those yet not subsribed to the mailing list, please do so:
https://lists.freedesktop.org/mailman/listinfo/intel-xe

This is the catch up since we went live.
The goal is to merge this patches on top of cgit/drm-xe-next and
then use this mailing list here to continue the public development.

gitlab will be used only for issues handling, but not as git
repository and not for merge requests.

We need to move towards the open source upstream development aligned
with the drm community methods and processes. What is using the cgit
and patches over email. In this way we don't create some strange
fragmentation with the rest of the community and ensure a better
care of the individual commits with proper history, log and recorded
reviewed-bys.

Please notice that I have added some 'Cc:' in most of the patches.
Those are the folks who approved the merge request containing that
commit in gitlab. I cannot forge any reviewed-by tag, but please
respond if that's okay to convert that cc to the reviewed-by.

Also, please notice that there are many commits without any message.
By the kernel rules this is not acceptable. We need to get a message
to the commits. Please respond the email with a message that I can
update the commit myself.

Once everything is in place I will push them to drm-xe-next.

I believe a few rounds will be needed before we can convert the flow.
So I will for now port the patches over. But please ensure that
the new commits in gitlab has the proper commit messages and style.

Thanks,
Rodrigo.

Maarten Lankhorst (13):
  drm/xe: Add intel_pps support too
  drm/xe: Rework initialisation ordering slightly so we can inherit fb
  drm/xe: Implement stolen memory.
  drm/xe: Allow fbdev to allocate stolen memory
  drm/xe: Implement initial hw readout for framebuffer
  drm/xe: Put DPT into stolen memory, if available
  drm/xe: Implement FBC support
  drm/i915: Remove i915_drm_suspend_mode
  drm/xe: Fix dumb bo create
  drm/xe: Make FBC check stolen at use time.
  drm/xe: Move xe_ttm_stolen_mgr_init back
  drm/xe: Fix hidden gotcha regression with bo create
  drm/xe: Fix xe_mmio_wait32 timeouts.

Matthew Brost (9):
  drm/msm: Fix compile error
  drm/xe: Take memory ref on kernel job creation
  Revert "drm/xe: Validate BO on CPU fault"
  drm/xe: Ensure VMA not userptr before calling xe_bo_is_stolen
  drm/xe: Don't use engine_mask until after hwconfig parse
  drm/xe: Fake pulling gt->info.engine_mask from hwconfig blob
  drm/xe/guc: Report submission version of GuC firmware
  drm/xe/guc: s/xe_guc_send_mmio/xe_guc_mmio_send
  drm/xe/guc: Add support GuC MMIO send / recv

Mauro Carvalho Chehab (1):
  drm/xe: Fix compilation when Xe driver is builtin

Philippe Lecluse (1):
  drm/xe: enforce GSMBASE for DG1 instead of BAR2

Rodrigo Vivi (12):
  drm/xe: Implement a local xe_mmio_wait32
  drm/xe: Stop using i915's range_overflows_t macro.
  drm/xe: Let's return last value read on xe_mmio_wait32.
  drm/xe: Convert guc_ready to regular xe_mmio_wait32
  drm/xe: Wait for success on guc done.
  drm/xe: Remove i915_utils dependency from xe_guc_pc.
  drm/xe: Stop using i915_utils in xe_wopcm.
  drm/xe: Let's avoid i915_utils in the xe_force_wake.
  drm/xe: Convert xe_mmio_wait32 to us so we can stop using wait_for_us.
  drm/xe: Remove i915_utils dependency from xe_pcode.
  drm/i915: Expand force_probe to block probe of devices as well.
  drm/xe: Introduce force_probe parameter.

Thomas Hellström (1):
  drm/xe/migrate: Add kerneldoc for the migrate subsystem

 drivers/gpu/drm/i915/Kconfig                  |  15 +-
 .../drm/i915/display/intel_display_power.c    |   8 +-
 .../drm/i915/display/intel_display_power.h    |   3 +-
 drivers/gpu/drm/i915/display/intel_fb.c       |   9 +
 drivers/gpu/drm/i915/display/intel_fbc.c      |  94 +++++--
 drivers/gpu/drm/i915/display/intel_fbdev.c    |  66 +++--
 drivers/gpu/drm/i915/display/intel_pps.c      |  14 +-
 drivers/gpu/drm/i915/i915_driver.c            |  16 +-
 drivers/gpu/drm/i915/i915_params.c            |   2 +-
 drivers/gpu/drm/i915/i915_pci.c               |  33 ++-
 drivers/gpu/drm/i915/intel_runtime_pm.h       |   6 -
 drivers/gpu/drm/msm/adreno/adreno_device.c    |   4 +-
 drivers/gpu/drm/xe/Kconfig                    |  29 +++
 drivers/gpu/drm/xe/Makefile                   |   3 +-
 drivers/gpu/drm/xe/display/intel_de.h         |   6 +-
 drivers/gpu/drm/xe/display/intel_pps.c        |   1 +
 drivers/gpu/drm/xe/display/intel_pps_stub.c   |  43 ----
 drivers/gpu/drm/xe/display/xe_fb_pin.c        |  40 +--
 drivers/gpu/drm/xe/display/xe_plane_initial.c | 224 ++++++----------
 drivers/gpu/drm/xe/xe_bo.c                    | 194 +++++++++++---
 drivers/gpu/drm/xe/xe_bo.h                    |  22 +-
 drivers/gpu/drm/xe/xe_debugfs.c               |   4 +
 drivers/gpu/drm/xe/xe_device.c                |  32 ++-
 drivers/gpu/drm/xe/xe_force_wake.c            |  11 +-
 drivers/gpu/drm/xe/xe_ggtt.c                  |  72 ++++--
 drivers/gpu/drm/xe/xe_ggtt.h                  |   1 +
 drivers/gpu/drm/xe/xe_gt.c                    |  54 +++-
 drivers/gpu/drm/xe/xe_gt.h                    |   1 +
 drivers/gpu/drm/xe/xe_gt_mcr.c                |   3 +-
 drivers/gpu/drm/xe/xe_gt_types.h              |   6 +
 drivers/gpu/drm/xe/xe_guc.c                   |  82 +++---
 drivers/gpu/drm/xe/xe_guc.h                   |   4 +-
 drivers/gpu/drm/xe/xe_guc_ct.c                |   2 +-
 drivers/gpu/drm/xe/xe_guc_hwconfig.c          |   2 +-
 drivers/gpu/drm/xe/xe_guc_pc.c                |  30 ++-
 drivers/gpu/drm/xe/xe_guc_types.h             |   9 +
 drivers/gpu/drm/xe/xe_huc.c                   |   2 +-
 drivers/gpu/drm/xe/xe_irq.c                   |  34 +--
 drivers/gpu/drm/xe/xe_irq.h                   |   2 +
 drivers/gpu/drm/xe/xe_migrate.c               | 108 +++++++-
 drivers/gpu/drm/xe/xe_migrate.h               |  16 +-
 drivers/gpu/drm/xe/xe_mmio.c                  |  66 +++--
 drivers/gpu/drm/xe/xe_mmio.h                  |  49 +++-
 drivers/gpu/drm/xe/xe_pci.c                   |  83 +++++-
 drivers/gpu/drm/xe/xe_pcode.c                 |  91 +++----
 drivers/gpu/drm/xe/xe_pt.c                    |   5 +-
 drivers/gpu/drm/xe/xe_res_cursor.h            |  47 +++-
 drivers/gpu/drm/xe/xe_sched_job.c             |  14 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c        | 243 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h        |  21 ++
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |  91 +++----
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h          |  18 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h    |   2 +
 drivers/gpu/drm/xe/xe_uc_fw.c                 |  54 +++-
 drivers/gpu/drm/xe/xe_uc_fw_abi.h             |   6 +-
 drivers/gpu/drm/xe/xe_wopcm.c                 |   5 +-
 56 files changed, 1465 insertions(+), 637 deletions(-)
 create mode 120000 drivers/gpu/drm/xe/display/intel_pps.c
 delete mode 100644 drivers/gpu/drm/xe/display/intel_pps_stub.c
 create mode 100644 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
 create mode 100644 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h

-- 
2.38.1


