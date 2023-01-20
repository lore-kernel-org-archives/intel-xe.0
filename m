Return-Path: <intel-xe-bounces@lists.freedesktop.org>
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Fri, 20 Jan 2023 15:44:14 -0500
Message-ID: <20230120204426.68104-9-rodrigo.vivi@intel.com>
In-Reply-To: <20230120204426.68104-1-rodrigo.vivi@intel.com>
References: <20230120204426.68104-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
MIME-Version: 1.0
Subject: [Intel-xe] [PATCH 08/20] drm/xe: Fix tracepoints on 32b
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>

From: Lucas De Marchi <lucas.demarchi@intel.com>

Leave the types as u64, but cast the pointers to unsigned long before
assigning so the compiler doesn't throw warning about casting a pointer
to integer of different size.

Also, size_t should use %zu, not %ld.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_trace.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index 436593980c08..a00d4b210c3b 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -32,10 +32,10 @@ DECLARE_EVENT_CLASS(xe_bo,
 		    TP_fast_assign(
 			   __entry->size = bo->size;
 			   __entry->flags = bo->flags;
-			   __entry->vm = (u64)bo->vm;
+			   __entry->vm = (unsigned long)bo->vm;
 			   ),
 
-		    TP_printk("size=%ld, flags=0x%02x, vm=0x%016llx",
+		    TP_printk("size=%zu, flags=0x%02x, vm=0x%016llx",
 			      __entry->size, __entry->flags, __entry->vm)
 );
 
@@ -185,7 +185,7 @@ DECLARE_EVENT_CLASS(xe_sched_job,
 			   atomic_read(&job->engine->guc->state);
 			   __entry->flags = job->engine->flags;
 			   __entry->error = job->fence->error;
-			   __entry->fence = (u64)job->fence;
+			   __entry->fence = (unsigned long)job->fence;
 			   __entry->batch_addr = (u64)job->batch_addr[0];
 			   ),
 
@@ -272,7 +272,7 @@ DECLARE_EVENT_CLASS(xe_hw_fence,
 		    TP_fast_assign(
 			   __entry->ctx = fence->dma.context;
 			   __entry->seqno = fence->dma.seqno;
-			   __entry->fence = (u64)fence;
+			   __entry->fence = (unsigned long)fence;
 			   ),
 
 		    TP_printk("ctx=0x%016llx, fence=0x%016llx, seqno=%u",
@@ -312,7 +312,7 @@ DECLARE_EVENT_CLASS(xe_vma,
 			     ),
 
 		    TP_fast_assign(
-			   __entry->vma = (u64)vma;
+			   __entry->vma = (unsigned long)vma;
 			   __entry->asid = vma->vm->usm.asid;
 			   __entry->start = vma->start;
 			   __entry->end = vma->end;
@@ -409,7 +409,7 @@ DECLARE_EVENT_CLASS(xe_vm,
 			     ),
 
 		    TP_fast_assign(
-			   __entry->vm = (u64)vm;
+			   __entry->vm = (unsigned long)vm;
 			   __entry->asid = vm->usm.asid;
 			   ),
 
-- 
2.39.0


