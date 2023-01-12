Return-Path: <intel-xe-bounces@lists.freedesktop.org>
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Thu, 12 Jan 2023 17:25:34 -0500
Message-ID: <20230112222538.2000142-34-rodrigo.vivi@intel.com>
In-Reply-To: <20230112222538.2000142-1-rodrigo.vivi@intel.com>
References: <20230112222538.2000142-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
MIME-Version: 1.0
Subject: [Intel-xe] [PATCH 33/37] drm/xe: Make FBC check stolen at use time.
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

In case of xe, stolen is not initialised until much later, so just
assume it works, and check at runtime if required.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Philippe Lecluse <philippe.lecluse@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbc.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index 2804db71d630..82bc21b09332 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -1133,6 +1133,13 @@ static int intel_fbc_check_plane(struct intel_atomic_state *state,
 	if (!fbc)
 		return 0;
 
+#ifndef I915
+	if (!i915_gem_stolen_initialized(i915)) {
+		plane_state->no_fbc_reason = "stolen memory not initialised";
+		return 0;
+	}
+#endif
+
 	if (intel_vgpu_active(i915)) {
 		plane_state->no_fbc_reason = "VGPU active";
 		return 0;
@@ -1786,8 +1793,10 @@ void intel_fbc_init(struct drm_i915_private *i915)
 {
 	enum intel_fbc_id fbc_id;
 
+#ifdef I915
 	if (!i915_gem_stolen_initialized(i915))
 		RUNTIME_INFO(i915)->fbc_mask = 0;
+#endif
 
 	if (need_fbc_vtd_wa(i915))
 		RUNTIME_INFO(i915)->fbc_mask = 0;
-- 
2.38.1


