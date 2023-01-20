Return-Path: <intel-xe-bounces@lists.freedesktop.org>
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Fri, 20 Jan 2023 15:44:06 -0500
Message-ID: <20230120204426.68104-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [Intel-xe] [PATCH 00/20] Catching up - round 2
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
To: intel-xe@lists.freedesktop.org, maarten.lankhorst@linux.intel.com, philippe.lecluse@intel.com, mchehab@kernel.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Continuation of last week's:
https://lists.freedesktop.org/archives/intel-xe/2023-January/000024.html

More patches that we need to get proper reviews recorded or fixed
subject before we can merge in cgit/drm-xe-next and continue the
development in open.

I will also start to reply the patches individually asking
questions and help.

Thanks,
Rodrigo.

Balasubramani Vivekanandan (1):
  drm/xe/gt: Enable interrupt while initializing root gt

Lucas De Marchi (7):
  drm/xe/ggtt: Use BIT_ULL() for 64bit
  drm/xe: Fix some log messages on 32b
  drm/xe/mmio: Use non-atomic writeq/readq variant for 32b
  drm/xe: Fix tracepoints on 32b
  drm/xe/gt: Fix min() with u32 and u64
  drm/xe: Add documentation for mem_type
  ]65;7002;1cdrm/xe: Add min config for kunit integration ARCH=um

Maarten Lankhorst (1):
  drm/xe/ext: Dont call intel_display_power_is_enabled from irq
    install/remove

Matthew Auld (2):
  drm/xe/fbc: set compressed_fb to NULL on error
  drm/xe/pcode: fix pcode error check

Matthew Brost (1):
  drm/xe/migrate: Update emit_pte to cope with a size level than 4k

Mauro Carvalho Chehab (5):
  drm/xe/Kconfig.debug: select DEBUG_FS for KUnit runs
  drm/xe: KUnit tests depend on CONFIG_DRM_FBDEV_EMULATION
  drm/xe: fix XE_DISPLAY dependency on ACPI
  drm/xe: allow building XE_DISPLAY without ACPI
  drm/xe: fix DRM_FBDEV_EMULATION dependencies

Philippe Lecluse (2):
  drm/xe: fix xe_mmio_total_vram_size
  drm/xe: Fix Meteor Lake rsa issue on guc loading

Rodrigo Vivi (1):
  drm/xe/guc_pc: Fix Meteor Lake registers.

 drivers/gpu/drm/i915/display/intel_fbc.c   |  2 +-
 drivers/gpu/drm/xe/.kunitconfig            | 11 ++++
 drivers/gpu/drm/xe/Kconfig.debug           |  3 +-
 drivers/gpu/drm/xe/Makefile                | 13 +++-
 drivers/gpu/drm/xe/display/ext/i915_irq.c  | 50 ++++------------
 drivers/gpu/drm/xe/tests/xe_migrate.c      |  6 +-
 drivers/gpu/drm/xe/xe_ggtt.c               |  4 +-
 drivers/gpu/drm/xe/xe_gt.c                 |  6 +-
 drivers/gpu/drm/xe/xe_guc_pc.c             | 70 ++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_guc_submit.c         |  2 +-
 drivers/gpu/drm/xe/xe_irq.c                |  2 +-
 drivers/gpu/drm/xe/xe_migrate.c            | 17 ++----
 drivers/gpu/drm/xe/xe_mmio.c               | 17 +-----
 drivers/gpu/drm/xe/xe_mmio.h               |  1 +
 drivers/gpu/drm/xe/xe_pcode.c              |  2 +-
 drivers/gpu/drm/xe/xe_trace.h              | 12 ++--
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |  2 +-
 17 files changed, 129 insertions(+), 91 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/.kunitconfig

-- 
2.39.0


