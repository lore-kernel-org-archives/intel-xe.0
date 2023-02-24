Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05DA4C61DA3
	for <intel-xe@archiver.kernel.org>; Fri, 24 Feb 2023 11:14:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD45210E5BE;
	Fri, 24 Feb 2023 11:14:29 +0000 (UTC)
X-Greylist: delayed 606 seconds by postgrey-1.36 at gabe;
 Fri, 24 Feb 2023 11:14:27 UTC
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4F8310E5CF
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Feb 2023 11:14:27 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="------------t8h0hu10kNJKoH0EEA6qBgh6"
Message-ID: <52d3aae1-a023-5ac2-b7b9-e23acb0a9fcd@mblankhorst.nl>
Date: Fri, 24 Feb 2023 12:04:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230223215618.24326-1-niranjana.vishwanathapura@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@mblankhorst.nl>
In-Reply-To: <20230223215618.24326-1-niranjana.vishwanathapura@intel.com>
Subject: Re: [Intel-xe] [PATCH v2] drm/xe/migrate: Some cleanups and fixes
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
Cc: thomas.hellstrom@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------t8h0hu10kNJKoH0EEA6qBgh6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hey,

Some quick notes.

On 2023-02-23 22:56, Niranjana Vishwanathapura wrote:
> Some minor fixes and cleanups in migration code.
>
> 1) Remove unused 'struct xe_bo *bo' from emit_pte()
> 2) Use 'false' for is_vram of  emit_pte() where it is obvious
This is a matter of personal taste. I originally put in those original 
calls to make it clear what is false exactly, instead of having to infer 
it from the context.
> 3) Pass source bo as 'bo' in xe_migrate_copy() calls
> 4) Kernel-doc fix for function xe_migrate_clear()
> 5) In write_pgtable(), consider 'ofs' while calculating chunk size
Since you're trying to do a few unrelated things, better to split this up.
> 6) Update xe_migrate_doc.h with 32 page table structs (not 48)
Docbook updates could be a single patch.
>
> v2: Rebased
>
> Signed-off-by: Niranjana Vishwanathapura<niranjana.vishwanathapura@intel.com>
> ---
>   drivers/gpu/drm/xe/tests/xe_migrate.c |  4 ++--
>   drivers/gpu/drm/xe/xe_migrate.c       | 17 +++++++----------
>   drivers/gpu/drm/xe/xe_migrate_doc.h   |  2 +-
>   3 files changed, 10 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
> index 03a60d5b42f1..12e8f79e65cb 100644
> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
> @@ -148,7 +148,7 @@ static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
>   	xe_map_memset(xe, &sysmem->vmap, 0, 0xd0, sysmem->size);
>   	xe_map_memset(xe, &bo->vmap, 0, 0xc0, bo->size);
>   
> -	fence = xe_migrate_copy(m, sysmem, bo->ttm.resource,
> +	fence = xe_migrate_copy(m, bo, bo->ttm.resource,
>   				sysmem->ttm.resource);
>   	if (!sanity_fence_failed(xe, fence, big ? "Copying big bo vram -> sysmem" :
>   				 "Copying small bo vram -> sysmem", test)) {
> @@ -274,7 +274,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
>   		expected |= GEN12_PTE_PS64;
>   	xe_res_first(pt->ttm.resource, 0, pt->size, &src_it);
>   	emit_pte(m, bb, NUM_KERNEL_PDE - 1, xe_bo_is_vram(pt),
> -		 &src_it, GEN8_PAGE_SIZE, pt);
> +		 &src_it, GEN8_PAGE_SIZE);
>   	run_sanity_job(m, xe, bb, bb->len, "Writing PTE for our fake PT", test);
>   
>   	retval = xe_map_rd(xe, &bo->vmap, GEN8_PAGE_SIZE * (NUM_KERNEL_PDE - 1),
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index cbcc355cd391..cf6ad1b1ccd5 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -423,7 +423,7 @@ static void emit_pte(struct xe_migrate *m,
>   		     struct xe_bb *bb, u32 at_pt,
>   		     bool is_vram,
>   		     struct xe_res_cursor *cur,
> -		     u32 size, struct xe_bo *bo)
> +		     u32 size)
>   {
>   	u32 ptes;
>   	u64 ofs = at_pt * GEN8_PAGE_SIZE;
> @@ -672,19 +672,17 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>   			emit_arb_clear(bb);
>   
>   		if (!src_is_vram)
> -			emit_pte(m, bb, src_L0_pt, src_is_vram, &src_it, src_L0,
> -				 bo);
> +			emit_pte(m, bb, src_L0_pt, false, &src_it, src_L0);
>   		else
>   			xe_res_next(&src_it, src_L0);
>   
>   		if (!dst_is_vram)
> -			emit_pte(m, bb, dst_L0_pt, dst_is_vram, &dst_it, src_L0,
> -				 bo);
> +			emit_pte(m, bb, dst_L0_pt, false, &dst_it, src_L0);
>   		else
>   			xe_res_next(&dst_it, src_L0);
>   
>   		if (copy_system_ccs)
> -			emit_pte(m, bb, ccs_pt, false, &ccs_it, ccs_size, bo);
> +			emit_pte(m, bb, ccs_pt, false, &ccs_it, ccs_size);
>   
>   		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
>   		update_idx = bb->len;
> @@ -783,7 +781,7 @@ static int emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
>   }
>   
>   /**
> - * xe_migrate_clear() - Copy content of TTM resources.
> + * xe_migrate_clear() - Clear content of TTM resources.
>    * @m: The migration context.
>    * @bo: The buffer object @dst is currently bound to.
>    * @dst: The dst TTM resource to be cleared.
> @@ -856,8 +854,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>   		/* Preemption is enabled again by the ring ops. */
>   		if (!clear_vram) {
>   			emit_arb_clear(bb);
> -			emit_pte(m, bb, clear_L0_pt, clear_vram, &src_it, clear_L0,
> -				 bo);
> +			emit_pte(m, bb, clear_L0_pt, false, &src_it, clear_L0);
>   		} else {
>   			xe_res_next(&src_it, clear_L0);
>   		}
> @@ -941,7 +938,7 @@ static void write_pgtable(struct xe_gt *gt, struct xe_bb *bb, u64 ppgtt_ofs,
>   
>   	do {
>   		u64 addr = ppgtt_ofs + ofs * 8;
> -		chunk = min(update->qwords, 0x1ffU);
> +		chunk = min(update->qwords, 0x1ffU - (ofs & 0x1ff));

There is a bug here which should be a separate patch, but we will never hit it.
A pagetable can hold 512 entries, but the moment we would do more than 511 updates,
we would update the entry in the PDE above it.


The correct fix is chunk = min(size, 0x1ffU);

>   
>   		/* Ensure populatefn can do memset64 by aligning bb->cs */
>   		if (!(bb->len & 1))
> diff --git a/drivers/gpu/drm/xe/xe_migrate_doc.h b/drivers/gpu/drm/xe/xe_migrate_doc.h
> index 6a68fdff08dc..584972c4d3be 100644
> --- a/drivers/gpu/drm/xe/xe_migrate_doc.h
> +++ b/drivers/gpu/drm/xe/xe_migrate_doc.h
> @@ -21,7 +21,7 @@
>    * table BOs for updates, and identity map the entire device's VRAM with 1 GB
>    * pages.
>    *
> - * Currently the page structure consists of 48 phyiscal pages with 16 being
> + * Currently the page structure consists of 32 phyiscal pages with 16 being
>    * reserved for BO mapping during copies and clear, 1 reserved for kernel binds,
>    * several pages are needed to setup the identity mappings (exact number based
>    * on how many bits of address space the device has), and the rest are reserved
--------------t8h0hu10kNJKoH0EEA6qBgh6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hey,</p>
    <p>Some quick notes.<br>
    </p>
    <div class="moz-cite-prefix">On 2023-02-23 22:56, Niranjana
      Vishwanathapura wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20230223215618.24326-1-niranjana.vishwanathapura@intel.com">
      <pre class="moz-quote-pre" wrap="">Some minor fixes and cleanups in migration code.

1) Remove unused 'struct xe_bo *bo' from emit_pte()
2) Use 'false' for is_vram of  emit_pte() where it is obvious</pre>
    </blockquote>
    This is a matter of personal taste. I originally put in those
    original calls to make it clear what is false exactly, instead of
    having to infer it from the context.<br>
    <blockquote type="cite"
      cite="mid:20230223215618.24326-1-niranjana.vishwanathapura@intel.com">
      <pre class="moz-quote-pre" wrap="">
3) Pass source bo as 'bo' in xe_migrate_copy() calls
4) Kernel-doc fix for function xe_migrate_clear()
5) In write_pgtable(), consider 'ofs' while calculating chunk size</pre>
    </blockquote>
    Since you're trying to do a few unrelated things, better to split
    this up.<br>
    <blockquote type="cite"
      cite="mid:20230223215618.24326-1-niranjana.vishwanathapura@intel.com">
      <pre class="moz-quote-pre" wrap="">
6) Update xe_migrate_doc.h with 32 page table structs (not 48)</pre>
    </blockquote>
    Docbook updates could be a single patch.<br>
    <blockquote type="cite"
      cite="mid:20230223215618.24326-1-niranjana.vishwanathapura@intel.com">
      <pre class="moz-quote-pre" wrap="">

v2: Rebased

Signed-off-by: Niranjana Vishwanathapura <a class="moz-txt-link-rfc2396E" href="mailto:niranjana.vishwanathapura@intel.com">&lt;niranjana.vishwanathapura@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/tests/xe_migrate.c |  4 ++--
 drivers/gpu/drm/xe/xe_migrate.c       | 17 +++++++----------
 drivers/gpu/drm/xe/xe_migrate_doc.h   |  2 +-
 3 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index 03a60d5b42f1..12e8f79e65cb 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -148,7 +148,7 @@ static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
 	xe_map_memset(xe, &amp;sysmem-&gt;vmap, 0, 0xd0, sysmem-&gt;size);
 	xe_map_memset(xe, &amp;bo-&gt;vmap, 0, 0xc0, bo-&gt;size);
 
-	fence = xe_migrate_copy(m, sysmem, bo-&gt;ttm.resource,
+	fence = xe_migrate_copy(m, bo, bo-&gt;ttm.resource,
 				sysmem-&gt;ttm.resource);
 	if (!sanity_fence_failed(xe, fence, big ? "Copying big bo vram -&gt; sysmem" :
 				 "Copying small bo vram -&gt; sysmem", test)) {
@@ -274,7 +274,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 		expected |= GEN12_PTE_PS64;
 	xe_res_first(pt-&gt;ttm.resource, 0, pt-&gt;size, &amp;src_it);
 	emit_pte(m, bb, NUM_KERNEL_PDE - 1, xe_bo_is_vram(pt),
-		 &amp;src_it, GEN8_PAGE_SIZE, pt);
+		 &amp;src_it, GEN8_PAGE_SIZE);
 	run_sanity_job(m, xe, bb, bb-&gt;len, "Writing PTE for our fake PT", test);
 
 	retval = xe_map_rd(xe, &amp;bo-&gt;vmap, GEN8_PAGE_SIZE * (NUM_KERNEL_PDE - 1),
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index cbcc355cd391..cf6ad1b1ccd5 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -423,7 +423,7 @@ static void emit_pte(struct xe_migrate *m,
 		     struct xe_bb *bb, u32 at_pt,
 		     bool is_vram,
 		     struct xe_res_cursor *cur,
-		     u32 size, struct xe_bo *bo)
+		     u32 size)
 {
 	u32 ptes;
 	u64 ofs = at_pt * GEN8_PAGE_SIZE;
@@ -672,19 +672,17 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 			emit_arb_clear(bb);
 
 		if (!src_is_vram)
-			emit_pte(m, bb, src_L0_pt, src_is_vram, &amp;src_it, src_L0,
-				 bo);
+			emit_pte(m, bb, src_L0_pt, false, &amp;src_it, src_L0);
 		else
 			xe_res_next(&amp;src_it, src_L0);
 
 		if (!dst_is_vram)
-			emit_pte(m, bb, dst_L0_pt, dst_is_vram, &amp;dst_it, src_L0,
-				 bo);
+			emit_pte(m, bb, dst_L0_pt, false, &amp;dst_it, src_L0);
 		else
 			xe_res_next(&amp;dst_it, src_L0);
 
 		if (copy_system_ccs)
-			emit_pte(m, bb, ccs_pt, false, &amp;ccs_it, ccs_size, bo);
+			emit_pte(m, bb, ccs_pt, false, &amp;ccs_it, ccs_size);
 
 		bb-&gt;cs[bb-&gt;len++] = MI_BATCH_BUFFER_END;
 		update_idx = bb-&gt;len;
@@ -783,7 +781,7 @@ static int emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
 }
 
 /**
- * xe_migrate_clear() - Copy content of TTM resources.
+ * xe_migrate_clear() - Clear content of TTM resources.
  * @m: The migration context.
  * @bo: The buffer object @dst is currently bound to.
  * @dst: The dst TTM resource to be cleared.
@@ -856,8 +854,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 		/* Preemption is enabled again by the ring ops. */
 		if (!clear_vram) {
 			emit_arb_clear(bb);
-			emit_pte(m, bb, clear_L0_pt, clear_vram, &amp;src_it, clear_L0,
-				 bo);
+			emit_pte(m, bb, clear_L0_pt, false, &amp;src_it, clear_L0);
 		} else {
 			xe_res_next(&amp;src_it, clear_L0);
 		}
@@ -941,7 +938,7 @@ static void write_pgtable(struct xe_gt *gt, struct xe_bb *bb, u64 ppgtt_ofs,
 
 	do {
 		u64 addr = ppgtt_ofs + ofs * 8;
-		chunk = min(update-&gt;qwords, 0x1ffU);
+		chunk = min(update-&gt;qwords, 0x1ffU - (ofs &amp; 0x1ff));</pre>
    </blockquote>
    <pre>There is a bug here which should be a separate patch, but we will never hit it.
A pagetable can hold 512 entries, but the moment we would do more than 511 updates,
we would update the entry in the PDE above it.


The correct fix is chunk = min(size, 0x1ffU);
</pre>
    <blockquote type="cite"
      cite="mid:20230223215618.24326-1-niranjana.vishwanathapura@intel.com">
      <pre class="moz-quote-pre" wrap="">
 
 		/* Ensure populatefn can do memset64 by aligning bb-&gt;cs */
 		if (!(bb-&gt;len &amp; 1))
diff --git a/drivers/gpu/drm/xe/xe_migrate_doc.h b/drivers/gpu/drm/xe/xe_migrate_doc.h
index 6a68fdff08dc..584972c4d3be 100644
--- a/drivers/gpu/drm/xe/xe_migrate_doc.h
+++ b/drivers/gpu/drm/xe/xe_migrate_doc.h
@@ -21,7 +21,7 @@
  * table BOs for updates, and identity map the entire device's VRAM with 1 GB
  * pages.
  *
- * Currently the page structure consists of 48 phyiscal pages with 16 being
+ * Currently the page structure consists of 32 phyiscal pages with 16 being
  * reserved for BO mapping during copies and clear, 1 reserved for kernel binds,
  * several pages are needed to setup the identity mappings (exact number based
  * on how many bits of address space the device has), and the rest are reserved
</pre>
    </blockquote>
  </body>
</html>

--------------t8h0hu10kNJKoH0EEA6qBgh6--
