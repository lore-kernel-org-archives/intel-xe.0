Return-Path: <intel-xe-bounces@lists.freedesktop.org>
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Thu, 12 Jan 2023 17:25:37 -0500
Message-ID: <20230112222538.2000142-37-rodrigo.vivi@intel.com>
In-Reply-To: <20230112222538.2000142-1-rodrigo.vivi@intel.com>
References: <20230112222538.2000142-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
MIME-Version: 1.0
Subject: [Intel-xe] [PATCH 36/37] drm/xe: Fix xe_mmio_wait32 timeouts.
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

From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

The call uses us, not ms now. Fix this to make display working again.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/display/intel_de.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/intel_de.h b/drivers/gpu/drm/xe/display/intel_de.h
index 678b4247464a..f0c1d16fa6f8 100644
--- a/drivers/gpu/drm/xe/display/intel_de.h
+++ b/drivers/gpu/drm/xe/display/intel_de.h
@@ -41,7 +41,7 @@ static inline int
 intel_de_wait_for_register(struct drm_i915_private *i915, i915_reg_t reg,
 			   u32 mask, u32 value, unsigned int timeout)
 {
-	return xe_mmio_wait32(to_gt(i915), reg.reg, value, mask, timeout, NULL,
+	return xe_mmio_wait32(to_gt(i915), reg.reg, value, mask, timeout * USEC_PER_MSEC, NULL,
 			      false);
 }
 
@@ -49,7 +49,7 @@ static inline int
 intel_de_wait_for_register_fw(struct drm_i915_private *i915, i915_reg_t reg,
 			      u32 mask, u32 value, unsigned int timeout)
 {
-	return xe_mmio_wait32(to_gt(i915), reg.reg, value, mask, timeout, NULL,
+	return xe_mmio_wait32(to_gt(i915), reg.reg, value, mask, timeout * USEC_PER_MSEC, NULL,
 			      false);
 }
 
-- 
2.38.1


