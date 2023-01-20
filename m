Return-Path: <intel-xe-bounces@lists.freedesktop.org>
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Fri, 20 Jan 2023 15:44:08 -0500
Message-ID: <20230120204426.68104-3-rodrigo.vivi@intel.com>
In-Reply-To: <20230120204426.68104-1-rodrigo.vivi@intel.com>
References: <20230120204426.68104-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
MIME-Version: 1.0
Subject: [Intel-xe] [PATCH 02/20] drm/xe/fbc: set compressed_fb to NULL on
 error
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
Cc: Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>

From: Matthew Auld <matthew.auld@intel.com>

On DG2 we get a massive flood of the following:

[ 1068.790446] xe 0000:03:00.0: drm_WARN_ON((!!(fbc->compressed_fb)))
[ 1068.790465] WARNING: CPU: 9 PID: 637 at drivers/gpu/drm/xe/display/intel_fbc.c:843 intel_fbc_update+0x605/0x670 [xe]

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Maarten Lankhort <maarten.lankhorst@linux.intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index 82bc21b09332..13f03c6ea818 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -75,7 +75,7 @@ static int i915_gem_stolen_insert_node_in_range(struct xe_device *xe, struct xe_
 					ttm_bo_type_kernel, flags);
 	if (IS_ERR(*bo)) {
 		err = PTR_ERR(*bo);
-		bo = NULL;
+		*bo = NULL;
 		return err;
 	}
 	err = xe_bo_pin(*bo);
-- 
2.39.0


