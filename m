Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C186C5B552
	for <intel-xe@archiver.kernel.org>; Wed,  4 Jun 2025 09:36:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 580BE10E5CB;
	Wed,  4 Jun 2025 09:36:52 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B810710E5CB
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Jun 2025 09:36:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="------------2LZwCyaeCFjSq4wicR0OZaDv"
Message-ID: <d499803a-8b64-40fa-adb4-ed42d91e011f@lankhorst.se>
Date: Wed, 4 Jun 2025 11:36:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe/vf: Introduce helpers to access GGTT
 configuration
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Tomasz Lis <tomasz.lis@intel.com>
References: <20250602103325.549-1-michal.wajdeczko@intel.com>
 <20250602103325.549-2-michal.wajdeczko@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten@lankhorst.se>
In-Reply-To: <20250602103325.549-2-michal.wajdeczko@intel.com>
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

This is a multi-part message in MIME format.
--------------2LZwCyaeCFjSq4wicR0OZaDv
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hey,

I'm trying for a different direction for this path series. I want to move all ggtt handling to xe_ggtt.c again,
so I had to remove all the code that pokes around into xe_ggtt internals.

Can you test the patch I attached below instead?
It might require the rest of my GGTT cleanup series, I will resubmit those if they don't apply.

On 2025-06-02 12:33, Michal Wajdeczko wrote:
> In upcoming patch we want to separate tile-oriented VF functions
> from GT-oriented functions and to allow the former access a GGTT
> configuration stored at GT level we need to provide some helpers.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Tomasz Lis <tomasz.lis@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 34 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.h |  5 ++++-
>  2 files changed, 38 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 4ff7ae1a5f16..acfb3b1b0832 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -561,6 +561,40 @@ u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt)
>  	return gt->sriov.vf.self_config.lmem_size;
>  }
>  
> +/**
> + * xe_gt_sriov_vf_ggtt - VF GGTT configuration.
> + * @gt: the &xe_gt
> + *
> + * This function is for VF use only.
> + *
> + * Return: size of the GGTT assigned to VF.
> + */
> +u64 xe_gt_sriov_vf_ggtt(struct xe_gt *gt)
> +{
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
> +	xe_gt_assert(gt, gt->sriov.vf.self_config.ggtt_size);
> +
> +	return gt->sriov.vf.self_config.ggtt_size;
> +}
> +
> +/**
> + * xe_gt_sriov_vf_ggtt_base - VF GGTT base offset.
> + * @gt: the &xe_gt
> + *
> + * This function is for VF use only.
> + *
> + * Return: base offset of the GGTT assigned to VF.
> + */
> +u64 xe_gt_sriov_vf_ggtt_base(struct xe_gt *gt)
> +{
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
> +	xe_gt_assert(gt, gt->sriov.vf.self_config.ggtt_size);
> +
> +	return gt->sriov.vf.self_config.ggtt_base;
> +}
> +
>  /**
>   * xe_gt_sriov_vf_ggtt_shift - Return shift in GGTT range due to VF migration
>   * @gt: the &xe_gt struct instance
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> index 9db41afddd5a..2f96ac0c5dca 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> @@ -20,7 +20,6 @@ int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
>  int xe_gt_sriov_vf_prepare_ggtt(struct xe_gt *gt);
>  int xe_gt_sriov_vf_balloon_ggtt_locked(struct xe_gt *gt);
>  void xe_gt_sriov_vf_deballoon_ggtt_locked(struct xe_gt *gt);
> -s64 xe_gt_sriov_vf_ggtt_shift(struct xe_gt *gt);
>  void xe_gt_sriov_vf_fixup_ggtt_nodes(struct xe_gt *gt, s64 shift);
>  int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt);
>  void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
> @@ -28,6 +27,10 @@ void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
>  u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
>  u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
>  u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
> +u64 xe_gt_sriov_vf_ggtt(struct xe_gt *gt);
> +u64 xe_gt_sriov_vf_ggtt_base(struct xe_gt *gt);
> +s64 xe_gt_sriov_vf_ggtt_shift(struct xe_gt *gt);
> +
>  u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg);
>  void xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg reg, u32 val);
>  
----8<----

commit 40985bb758b283beba80d92e71e360aa2cc80783
Author: Maarten Lankhorst <dev@lankhorst.se>
Date:   Mon May 26 14:52:21 2025 +0200

    drm/xe: Make xe_ggtt_shift_nodes shift balloons as well
    
    Do not manipulate xe_ggtt from xe_gt_sriov_vf, instead give
    xe_ggtt_shift_nodes() the ability to resize and move the balloon
    nodes as well.
    
    Empty balloons do not get re-added. I'm not sure if this corner
    case happens in practice though.
    
    This removes the need for ggtt->lock from xe_gt_sriov_vf, and
    leaves the GGTT modification logic entirely in xe_ggtt.c
    
    Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
    Cc: Tomasz Lis <tomasz.lis@intel.com>
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index c32803b31bada..1e5f8901bf513 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -462,22 +462,21 @@ static void xe_ggtt_dump_node(struct xe_ggtt *ggtt,
 }
 
 /**
- * xe_ggtt_node_insert_balloon_locked - prevent allocation of specified GGTT addresses
+ * xe_ggtt_node_insert_balloon - prevent allocation of specified GGTT addresses
  * @node: the &xe_ggtt_node to hold reserved GGTT node
  * @start: the starting GGTT address of the reserved region
  * @end: then end GGTT address of the reserved region
  *
- * To be used in cases where ggtt->lock is already taken.
- * Use xe_ggtt_node_remove_balloon_locked() to release a reserved GGTT node.
+ * Use xe_ggtt_node_remove_balloon() to release a reserved GGTT node.
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_ggtt_node_insert_balloon_locked(struct xe_ggtt_node *node, u64 start, u64 end)
+int xe_ggtt_node_insert_balloon(struct xe_ggtt_node *node, u64 start, u64 end)
 {
 	struct xe_ggtt *ggtt = node->ggtt;
 	int err;
 
-	xe_tile_assert(ggtt->tile, start < end);
+	xe_tile_assert(ggtt->tile, start <= end);
 	xe_tile_assert(ggtt->tile, IS_ALIGNED(start, XE_PAGE_SIZE));
 	xe_tile_assert(ggtt->tile, IS_ALIGNED(end, XE_PAGE_SIZE));
 	xe_tile_assert(ggtt->tile, !drm_mm_node_allocated(&node->base));
@@ -487,26 +486,41 @@ int xe_ggtt_node_insert_balloon_locked(struct xe_ggtt_node *node, u64 start, u64
 	node->base.start = start;
 	node->base.size = end - start;
 
-	err = drm_mm_reserve_node(&ggtt->mm, &node->base);
+	if (node->base.size)
+		err = drm_mm_reserve_node(&ggtt->mm, &node->base);
+	else
+		err = 0;
 
 	if (xe_gt_WARN(ggtt->tile->primary_gt, err,
 		       "Failed to balloon GGTT %#llx-%#llx (%pe)\n",
 		       node->base.start, node->base.start + node->base.size, ERR_PTR(err)))
 		return err;
 
+	if (start == xe_wopcm_size(tile_to_xe(ggtt->tile)))
+		ggtt->balloon_start = &node->base;
+	else if (end == ggtt->size)
+		ggtt->balloon_end = &node->base;
+
 	xe_ggtt_dump_node(ggtt, &node->base, "balloon");
 	return 0;
 }
 
 /**
- * xe_ggtt_node_remove_balloon_locked - release a reserved GGTT region
+ * xe_ggtt_node_remove_balloon - release a reserved GGTT region
  * @node: the &xe_ggtt_node with reserved GGTT region
  *
- * To be used in cases where ggtt->lock is already taken.
- * See xe_ggtt_node_insert_balloon_locked() for details.
+ * See xe_ggtt_node_insert_balloon() for details.
  */
-void xe_ggtt_node_remove_balloon_locked(struct xe_ggtt_node *node)
+void xe_ggtt_node_remove_balloon(struct xe_ggtt_node *node)
 {
+	struct xe_ggtt *ggtt = node->ggtt;
+
+	if (ggtt && &node->base == ggtt->balloon_start)
+		ggtt->balloon_start = NULL;
+
+	if (ggtt && &node->base == ggtt->balloon_end)
+		ggtt->balloon_end = NULL;
+
 	if (!xe_ggtt_node_allocated(node))
 		return;
 
@@ -517,18 +531,8 @@ void xe_ggtt_node_remove_balloon_locked(struct xe_ggtt_node *node)
 	drm_mm_remove_node(&node->base);
 }
 
-static void xe_ggtt_assert_fit(struct xe_ggtt *ggtt, u64 start, u64 size)
-{
-	struct xe_tile *tile = ggtt->tile;
-	struct xe_device *xe = tile_to_xe(tile);
-	u64 __maybe_unused wopcm = xe_wopcm_size(xe);
-
-	xe_tile_assert(tile, start >= wopcm);
-	xe_tile_assert(tile, start + size < ggtt->size - wopcm);
-}
-
 /**
- * xe_ggtt_shift_nodes_locked - Shift GGTT nodes to adjust for a change in usable address range.
+ * xe_ggtt_shift_nodes - Shift GGTT nodes to adjust for a change in usable address range.
  * @ggtt: the &xe_ggtt struct instance
  * @shift: change to the location of area provisioned for current VF
  *
@@ -542,29 +546,73 @@ static void xe_ggtt_assert_fit(struct xe_ggtt *ggtt, u64 start, u64 size)
  * the list of nodes was either already damaged, or that the shift brings the address range
  * outside of valid bounds. Both cases justify an assert rather than error code.
  */
-void xe_ggtt_shift_nodes_locked(struct xe_ggtt *ggtt, s64 shift)
+void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, s64 shift)
 {
 	struct xe_tile *tile __maybe_unused = ggtt->tile;
 	struct drm_mm_node *node, *tmpn;
+	u64 ggtt_start __maybe_unused = xe_wopcm_size(tile_to_xe(ggtt->tile));
 	LIST_HEAD(temp_list_head);
 
-	lockdep_assert_held(&ggtt->lock);
+	mutex_lock(&ggtt->lock);
 
+	if (ggtt->balloon_start) {
+		/*
+		 * Balloon at the beginning, only end is adjusted,
+		 * ensure it's possible with size >= 0)
+		 */
+		node = ggtt->balloon_start;
+		xe_tile_assert(tile, node->start + shift + node->size < ggtt->size);
+		xe_tile_assert(tile, node->start + shift + node->size > ggtt_start);
+
+		if (drm_mm_node_allocated(node))
+			drm_mm_remove_node(node);
+
+		node->size += shift;
+		if (node->size)
+			list_add_tail(&node->node_list, &temp_list_head);
+	}
+
+	if (ggtt->balloon_end) {
+		/*
+		 * Balloon at the end, only start is adjusted,
+		 * ensure it's possible with (size >= 0)
+		 */
+		node = ggtt->balloon_end;
+		xe_tile_assert(tile, node->start + shift >= ggtt_start);
+		xe_tile_assert(tile, node->start + shift < ggtt->size);
+
+		if (drm_mm_node_allocated(node))
+			drm_mm_remove_node(node);
+
+		node->start += shift;
+		node->size -= shift;
+		if (node->size)
+			list_add_tail(&node->node_list, &temp_list_head);
+	}
+
+	/* Remaining, actual nodes */
 	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG))
-		drm_mm_for_each_node_safe(node, tmpn, &ggtt->mm)
-			xe_ggtt_assert_fit(ggtt, node->start + shift, node->size);
+		drm_mm_for_each_node_safe(node, tmpn, &ggtt->mm) {
+			xe_tile_assert(tile, node->start + shift >= ggtt_start);
+			xe_tile_assert(tile, node->start + shift + node->size <= ggtt->size);
+		}
 
 	drm_mm_for_each_node_safe(node, tmpn, &ggtt->mm) {
 		drm_mm_remove_node(node);
-		list_add(&node->node_list, &temp_list_head);
+
+		node->start += shift;
+		list_add_tail(&node->node_list, &temp_list_head);
 	}
 
+	/* Finally, insert balloons and nodes into their new locations */
 	list_for_each_entry_safe(node, tmpn, &temp_list_head, node_list) {
 		list_del(&node->node_list);
-		node->start += shift;
+
 		drm_mm_reserve_node(&ggtt->mm, node);
 		xe_tile_assert(tile, drm_mm_node_allocated(node));
 	}
+
+	mutex_unlock(&ggtt->lock);
 }
 
 static int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
@@ -608,7 +656,7 @@ int xe_ggtt_node_insert(struct xe_ggtt_node *node, u32 size, u32 align)
  * or xe_ggtt_node_remove_balloon().
  * Having %xe_ggtt_node struct allocated doesn't mean that the node is already allocated
  * in GGTT. Only the xe_ggtt_node_insert(), xe_ggtt_node_insert_transform(),
- * xe_ggtt_node_insert_balloon_locked() will ensure the node is inserted or reserved in GGTT.
+ * xe_ggtt_node_insert_balloon() will ensure the node is inserted or reserved in GGTT.
  *
  * Return: A pointer to %xe_ggtt_node struct on success. An ERR_PTR otherwise.
  **/
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 3951d9af97aa8..48f96267a7891 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -18,10 +18,10 @@ int xe_ggtt_init(struct xe_ggtt *ggtt);
 
 struct xe_ggtt_node *xe_ggtt_node_init(struct xe_ggtt *ggtt);
 void xe_ggtt_node_fini(struct xe_ggtt_node *node);
-int xe_ggtt_node_insert_balloon_locked(struct xe_ggtt_node *node,
+int xe_ggtt_node_insert_balloon(struct xe_ggtt_node *node,
 				       u64 start, u64 size);
-void xe_ggtt_node_remove_balloon_locked(struct xe_ggtt_node *node);
-void xe_ggtt_shift_nodes_locked(struct xe_ggtt *ggtt, s64 shift);
+void xe_ggtt_node_remove_balloon(struct xe_ggtt_node *node);
+void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, s64 shift);
 
 int xe_ggtt_node_insert(struct xe_ggtt_node *node, u32 size, u32 align);
 struct xe_ggtt_node *
diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
index 18b5466ae8e6f..3454a3c7686d1 100644
--- a/drivers/gpu/drm/xe/xe_ggtt_types.h
+++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
@@ -12,6 +12,7 @@
 
 struct xe_bo;
 struct xe_gt;
+struct xe_ggtt_node;
 
 /**
  * struct xe_ggtt - Main GGTT struct
@@ -49,6 +50,10 @@ struct xe_ggtt {
 	unsigned int access_count;
 	/** @wq: Dedicated unordered work queue to process node removals */
 	struct workqueue_struct *wq;
+	/** @balloon_start: Optional balloon at the beginning of GGTT, may be zero-sized */
+	struct drm_mm_node *balloon_start;
+	/** @balloon_end: Optional balloon at the end of GGTT, may be zero-sized */
+	struct drm_mm_node *balloon_end;
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 4ff7ae1a5f16c..8b8604bdedb48 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -600,12 +600,7 @@ static int vf_init_ggtt_balloons(struct xe_gt *gt)
 	return 0;
 }
 
-/**
- * xe_gt_sriov_vf_balloon_ggtt_locked - Insert balloon nodes to limit used GGTT address range.
- * @gt: the &xe_gt struct instance
- * Return: 0 on success or a negative error code on failure.
- */
-int xe_gt_sriov_vf_balloon_ggtt_locked(struct xe_gt *gt)
+static int vf_balloon_ggtt(struct xe_gt *gt)
 {
 	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
 	struct xe_tile *tile = gt_to_tile(gt);
@@ -615,7 +610,6 @@ int xe_gt_sriov_vf_balloon_ggtt_locked(struct xe_gt *gt)
 
 	xe_gt_assert(gt, IS_SRIOV_VF(xe));
 	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
-	lockdep_assert_held(&tile->mem.ggtt->lock);
 
 	if (!config->ggtt_size)
 		return -ENODATA;
@@ -638,7 +632,7 @@ int xe_gt_sriov_vf_balloon_ggtt_locked(struct xe_gt *gt)
 	start = xe_wopcm_size(xe);
 	end = config->ggtt_base;
 	if (end != start) {
-		err = xe_ggtt_node_insert_balloon_locked(tile->sriov.vf.ggtt_balloon[0],
+		err = xe_ggtt_node_insert_balloon(tile->sriov.vf.ggtt_balloon[0],
 							 start, end);
 		if (err)
 			return err;
@@ -647,10 +641,11 @@ int xe_gt_sriov_vf_balloon_ggtt_locked(struct xe_gt *gt)
 	start = config->ggtt_base + config->ggtt_size;
 	end = GUC_GGTT_TOP;
 	if (end != start) {
-		err = xe_ggtt_node_insert_balloon_locked(tile->sriov.vf.ggtt_balloon[1],
+		err = xe_ggtt_node_insert_balloon(tile->sriov.vf.ggtt_balloon[1],
 							 start, end);
 		if (err) {
-			xe_ggtt_node_remove_balloon_locked(tile->sriov.vf.ggtt_balloon[0]);
+			xe_ggtt_node_remove_balloon(tile->sriov.vf.ggtt_balloon[0]);
+			tile->sriov.vf.ggtt_balloon[0] = NULL;
 			return err;
 		}
 	}
@@ -658,38 +653,13 @@ int xe_gt_sriov_vf_balloon_ggtt_locked(struct xe_gt *gt)
 	return 0;
 }
 
-static int vf_balloon_ggtt(struct xe_gt *gt)
-{
-	struct xe_ggtt *ggtt = gt_to_tile(gt)->mem.ggtt;
-	int err;
-
-	mutex_lock(&ggtt->lock);
-	err = xe_gt_sriov_vf_balloon_ggtt_locked(gt);
-	mutex_unlock(&ggtt->lock);
-
-	return err;
-}
-
-/**
- * xe_gt_sriov_vf_deballoon_ggtt_locked - Remove balloon nodes.
- * @gt: the &xe_gt struct instance
- */
-void xe_gt_sriov_vf_deballoon_ggtt_locked(struct xe_gt *gt)
-{
-	struct xe_tile *tile = gt_to_tile(gt);
-
-	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
-	xe_ggtt_node_remove_balloon_locked(tile->sriov.vf.ggtt_balloon[1]);
-	xe_ggtt_node_remove_balloon_locked(tile->sriov.vf.ggtt_balloon[0]);
-}
-
 static void vf_deballoon_ggtt(struct xe_gt *gt)
 {
 	struct xe_tile *tile = gt_to_tile(gt);
 
-	mutex_lock(&tile->mem.ggtt->lock);
-	xe_gt_sriov_vf_deballoon_ggtt_locked(gt);
-	mutex_unlock(&tile->mem.ggtt->lock);
+	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
+	xe_ggtt_node_remove_balloon(tile->sriov.vf.ggtt_balloon[1]);
+	xe_ggtt_node_remove_balloon(tile->sriov.vf.ggtt_balloon[0]);
 }
 
 static void vf_fini_ggtt_balloons(struct xe_gt *gt)
@@ -912,11 +882,7 @@ void xe_gt_sriov_vf_fixup_ggtt_nodes(struct xe_gt *gt, s64 shift)
 
 	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
 
-	mutex_lock(&ggtt->lock);
-	xe_gt_sriov_vf_deballoon_ggtt_locked(gt);
-	xe_ggtt_shift_nodes_locked(ggtt, shift);
-	xe_gt_sriov_vf_balloon_ggtt_locked(gt);
-	mutex_unlock(&ggtt->lock);
+	xe_ggtt_shift_nodes(ggtt, shift);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
index 9db41afddd5a8..8956fed594996 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
@@ -18,8 +18,6 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt);
 int xe_gt_sriov_vf_connect(struct xe_gt *gt);
 int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
 int xe_gt_sriov_vf_prepare_ggtt(struct xe_gt *gt);
-int xe_gt_sriov_vf_balloon_ggtt_locked(struct xe_gt *gt);
-void xe_gt_sriov_vf_deballoon_ggtt_locked(struct xe_gt *gt);
 s64 xe_gt_sriov_vf_ggtt_shift(struct xe_gt *gt);
 void xe_gt_sriov_vf_fixup_ggtt_nodes(struct xe_gt *gt, s64 shift);
 int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt);

--------------2LZwCyaeCFjSq4wicR0OZaDv
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <font face="monospace">Hey,<br>
      <br>
      I'm trying for a different direction for this path series. I want
      to move all ggtt handling to xe_ggtt.c again,<br>
      so I had to remove all the code that pokes around into xe_ggtt
      internals.</font><br>
    <br>
    Can you test the patch I attached below instead?<br>
    It might require the rest of my GGTT cleanup series, I will resubmit
    those if they don't apply.<br>
    <br>
    <div class="moz-cite-prefix">On 2025-06-02 12:33, Michal Wajdeczko
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20250602103325.549-2-michal.wajdeczko@intel.com">
      <pre wrap="" class="moz-quote-pre">In upcoming patch we want to separate tile-oriented VF functions
from GT-oriented functions and to allow the former access a GGTT
configuration stored at GT level we need to provide some helpers.

Signed-off-by: Michal Wajdeczko <a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
Cc: Tomasz Lis <a class="moz-txt-link-rfc2396E" href="mailto:tomasz.lis@intel.com">&lt;tomasz.lis@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 34 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h |  5 ++++-
 2 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 4ff7ae1a5f16..acfb3b1b0832 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -561,6 +561,40 @@ u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt)
 	return gt-&gt;sriov.vf.self_config.lmem_size;
 }
 
+/**
+ * xe_gt_sriov_vf_ggtt - VF GGTT configuration.
+ * @gt: the &amp;xe_gt
+ *
+ * This function is for VF use only.
+ *
+ * Return: size of the GGTT assigned to VF.
+ */
+u64 xe_gt_sriov_vf_ggtt(struct xe_gt *gt)
+{
+	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
+	xe_gt_assert(gt, gt-&gt;sriov.vf.guc_version.major);
+	xe_gt_assert(gt, gt-&gt;sriov.vf.self_config.ggtt_size);
+
+	return gt-&gt;sriov.vf.self_config.ggtt_size;
+}
+
+/**
+ * xe_gt_sriov_vf_ggtt_base - VF GGTT base offset.
+ * @gt: the &amp;xe_gt
+ *
+ * This function is for VF use only.
+ *
+ * Return: base offset of the GGTT assigned to VF.
+ */
+u64 xe_gt_sriov_vf_ggtt_base(struct xe_gt *gt)
+{
+	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
+	xe_gt_assert(gt, gt-&gt;sriov.vf.guc_version.major);
+	xe_gt_assert(gt, gt-&gt;sriov.vf.self_config.ggtt_size);
+
+	return gt-&gt;sriov.vf.self_config.ggtt_base;
+}
+
 /**
  * xe_gt_sriov_vf_ggtt_shift - Return shift in GGTT range due to VF migration
  * @gt: the &amp;xe_gt struct instance
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
index 9db41afddd5a..2f96ac0c5dca 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
@@ -20,7 +20,6 @@ int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
 int xe_gt_sriov_vf_prepare_ggtt(struct xe_gt *gt);
 int xe_gt_sriov_vf_balloon_ggtt_locked(struct xe_gt *gt);
 void xe_gt_sriov_vf_deballoon_ggtt_locked(struct xe_gt *gt);
-s64 xe_gt_sriov_vf_ggtt_shift(struct xe_gt *gt);
 void xe_gt_sriov_vf_fixup_ggtt_nodes(struct xe_gt *gt, s64 shift);
 int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt);
 void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
@@ -28,6 +27,10 @@ void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
 u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
 u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
 u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
+u64 xe_gt_sriov_vf_ggtt(struct xe_gt *gt);
+u64 xe_gt_sriov_vf_ggtt_base(struct xe_gt *gt);
+s64 xe_gt_sriov_vf_ggtt_shift(struct xe_gt *gt);
+
 u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg);
 void xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg reg, u32 val);
 
</pre>
    </blockquote>
    ----8&lt;----<br>
    <pre>commit 40985bb758b283beba80d92e71e360aa2cc80783
Author: Maarten Lankhorst <a class="moz-txt-link-rfc2396E" href="mailto:dev@lankhorst.se">&lt;dev@lankhorst.se&gt;</a>
Date:   Mon May 26 14:52:21 2025 +0200

    drm/xe: Make xe_ggtt_shift_nodes shift balloons as well
    
    Do not manipulate xe_ggtt from xe_gt_sriov_vf, instead give
    xe_ggtt_shift_nodes() the ability to resize and move the balloon
    nodes as well.
    
    Empty balloons do not get re-added. I'm not sure if this corner
    case happens in practice though.
    
    This removes the need for ggtt-&gt;lock from xe_gt_sriov_vf, and
    leaves the GGTT modification logic entirely in xe_ggtt.c
    
    Signed-off-by: Maarten Lankhorst <a class="moz-txt-link-rfc2396E" href="mailto:dev@lankhorst.se">&lt;dev@lankhorst.se&gt;</a>
    Cc: Tomasz Lis <a class="moz-txt-link-rfc2396E" href="mailto:tomasz.lis@intel.com">&lt;tomasz.lis@intel.com&gt;</a>
    Cc: Michal Wajdeczko <a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index c32803b31bada..1e5f8901bf513 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -462,22 +462,21 @@ static void xe_ggtt_dump_node(struct xe_ggtt *ggtt,
 }
 
 /**
- * xe_ggtt_node_insert_balloon_locked - prevent allocation of specified GGTT addresses
+ * xe_ggtt_node_insert_balloon - prevent allocation of specified GGTT addresses
  * @node: the &amp;xe_ggtt_node to hold reserved GGTT node
  * @start: the starting GGTT address of the reserved region
  * @end: then end GGTT address of the reserved region
  *
- * To be used in cases where ggtt-&gt;lock is already taken.
- * Use xe_ggtt_node_remove_balloon_locked() to release a reserved GGTT node.
+ * Use xe_ggtt_node_remove_balloon() to release a reserved GGTT node.
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_ggtt_node_insert_balloon_locked(struct xe_ggtt_node *node, u64 start, u64 end)
+int xe_ggtt_node_insert_balloon(struct xe_ggtt_node *node, u64 start, u64 end)
 {
 	struct xe_ggtt *ggtt = node-&gt;ggtt;
 	int err;
 
-	xe_tile_assert(ggtt-&gt;tile, start &lt; end);
+	xe_tile_assert(ggtt-&gt;tile, start &lt;= end);
 	xe_tile_assert(ggtt-&gt;tile, IS_ALIGNED(start, XE_PAGE_SIZE));
 	xe_tile_assert(ggtt-&gt;tile, IS_ALIGNED(end, XE_PAGE_SIZE));
 	xe_tile_assert(ggtt-&gt;tile, !drm_mm_node_allocated(&amp;node-&gt;base));
@@ -487,26 +486,41 @@ int xe_ggtt_node_insert_balloon_locked(struct xe_ggtt_node *node, u64 start, u64
 	node-&gt;base.start = start;
 	node-&gt;base.size = end - start;
 
-	err = drm_mm_reserve_node(&amp;ggtt-&gt;mm, &amp;node-&gt;base);
+	if (node-&gt;base.size)
+		err = drm_mm_reserve_node(&amp;ggtt-&gt;mm, &amp;node-&gt;base);
+	else
+		err = 0;
 
 	if (xe_gt_WARN(ggtt-&gt;tile-&gt;primary_gt, err,
 		       "Failed to balloon GGTT %#llx-%#llx (%pe)\n",
 		       node-&gt;base.start, node-&gt;base.start + node-&gt;base.size, ERR_PTR(err)))
 		return err;
 
+	if (start == xe_wopcm_size(tile_to_xe(ggtt-&gt;tile)))
+		ggtt-&gt;balloon_start = &amp;node-&gt;base;
+	else if (end == ggtt-&gt;size)
+		ggtt-&gt;balloon_end = &amp;node-&gt;base;
+
 	xe_ggtt_dump_node(ggtt, &amp;node-&gt;base, "balloon");
 	return 0;
 }
 
 /**
- * xe_ggtt_node_remove_balloon_locked - release a reserved GGTT region
+ * xe_ggtt_node_remove_balloon - release a reserved GGTT region
  * @node: the &amp;xe_ggtt_node with reserved GGTT region
  *
- * To be used in cases where ggtt-&gt;lock is already taken.
- * See xe_ggtt_node_insert_balloon_locked() for details.
+ * See xe_ggtt_node_insert_balloon() for details.
  */
-void xe_ggtt_node_remove_balloon_locked(struct xe_ggtt_node *node)
+void xe_ggtt_node_remove_balloon(struct xe_ggtt_node *node)
 {
+	struct xe_ggtt *ggtt = node-&gt;ggtt;
+
+	if (ggtt &amp;&amp; &amp;node-&gt;base == ggtt-&gt;balloon_start)
+		ggtt-&gt;balloon_start = NULL;
+
+	if (ggtt &amp;&amp; &amp;node-&gt;base == ggtt-&gt;balloon_end)
+		ggtt-&gt;balloon_end = NULL;
+
 	if (!xe_ggtt_node_allocated(node))
 		return;
 
@@ -517,18 +531,8 @@ void xe_ggtt_node_remove_balloon_locked(struct xe_ggtt_node *node)
 	drm_mm_remove_node(&amp;node-&gt;base);
 }
 
-static void xe_ggtt_assert_fit(struct xe_ggtt *ggtt, u64 start, u64 size)
-{
-	struct xe_tile *tile = ggtt-&gt;tile;
-	struct xe_device *xe = tile_to_xe(tile);
-	u64 __maybe_unused wopcm = xe_wopcm_size(xe);
-
-	xe_tile_assert(tile, start &gt;= wopcm);
-	xe_tile_assert(tile, start + size &lt; ggtt-&gt;size - wopcm);
-}
-
 /**
- * xe_ggtt_shift_nodes_locked - Shift GGTT nodes to adjust for a change in usable address range.
+ * xe_ggtt_shift_nodes - Shift GGTT nodes to adjust for a change in usable address range.
  * @ggtt: the &amp;xe_ggtt struct instance
  * @shift: change to the location of area provisioned for current VF
  *
@@ -542,29 +546,73 @@ static void xe_ggtt_assert_fit(struct xe_ggtt *ggtt, u64 start, u64 size)
  * the list of nodes was either already damaged, or that the shift brings the address range
  * outside of valid bounds. Both cases justify an assert rather than error code.
  */
-void xe_ggtt_shift_nodes_locked(struct xe_ggtt *ggtt, s64 shift)
+void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, s64 shift)
 {
 	struct xe_tile *tile __maybe_unused = ggtt-&gt;tile;
 	struct drm_mm_node *node, *tmpn;
+	u64 ggtt_start __maybe_unused = xe_wopcm_size(tile_to_xe(ggtt-&gt;tile));
 	LIST_HEAD(temp_list_head);
 
-	lockdep_assert_held(&amp;ggtt-&gt;lock);
+	mutex_lock(&amp;ggtt-&gt;lock);
 
+	if (ggtt-&gt;balloon_start) {
+		/*
+		 * Balloon at the beginning, only end is adjusted,
+		 * ensure it's possible with size &gt;= 0)
+		 */
+		node = ggtt-&gt;balloon_start;
+		xe_tile_assert(tile, node-&gt;start + shift + node-&gt;size &lt; ggtt-&gt;size);
+		xe_tile_assert(tile, node-&gt;start + shift + node-&gt;size &gt; ggtt_start);
+
+		if (drm_mm_node_allocated(node))
+			drm_mm_remove_node(node);
+
+		node-&gt;size += shift;
+		if (node-&gt;size)
+			list_add_tail(&amp;node-&gt;node_list, &amp;temp_list_head);
+	}
+
+	if (ggtt-&gt;balloon_end) {
+		/*
+		 * Balloon at the end, only start is adjusted,
+		 * ensure it's possible with (size &gt;= 0)
+		 */
+		node = ggtt-&gt;balloon_end;
+		xe_tile_assert(tile, node-&gt;start + shift &gt;= ggtt_start);
+		xe_tile_assert(tile, node-&gt;start + shift &lt; ggtt-&gt;size);
+
+		if (drm_mm_node_allocated(node))
+			drm_mm_remove_node(node);
+
+		node-&gt;start += shift;
+		node-&gt;size -= shift;
+		if (node-&gt;size)
+			list_add_tail(&amp;node-&gt;node_list, &amp;temp_list_head);
+	}
+
+	/* Remaining, actual nodes */
 	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG))
-		drm_mm_for_each_node_safe(node, tmpn, &amp;ggtt-&gt;mm)
-			xe_ggtt_assert_fit(ggtt, node-&gt;start + shift, node-&gt;size);
+		drm_mm_for_each_node_safe(node, tmpn, &amp;ggtt-&gt;mm) {
+			xe_tile_assert(tile, node-&gt;start + shift &gt;= ggtt_start);
+			xe_tile_assert(tile, node-&gt;start + shift + node-&gt;size &lt;= ggtt-&gt;size);
+		}
 
 	drm_mm_for_each_node_safe(node, tmpn, &amp;ggtt-&gt;mm) {
 		drm_mm_remove_node(node);
-		list_add(&amp;node-&gt;node_list, &amp;temp_list_head);
+
+		node-&gt;start += shift;
+		list_add_tail(&amp;node-&gt;node_list, &amp;temp_list_head);
 	}
 
+	/* Finally, insert balloons and nodes into their new locations */
 	list_for_each_entry_safe(node, tmpn, &amp;temp_list_head, node_list) {
 		list_del(&amp;node-&gt;node_list);
-		node-&gt;start += shift;
+
 		drm_mm_reserve_node(&amp;ggtt-&gt;mm, node);
 		xe_tile_assert(tile, drm_mm_node_allocated(node));
 	}
+
+	mutex_unlock(&amp;ggtt-&gt;lock);
 }
 
 static int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
@@ -608,7 +656,7 @@ int xe_ggtt_node_insert(struct xe_ggtt_node *node, u32 size, u32 align)
  * or xe_ggtt_node_remove_balloon().
  * Having %xe_ggtt_node struct allocated doesn't mean that the node is already allocated
  * in GGTT. Only the xe_ggtt_node_insert(), xe_ggtt_node_insert_transform(),
- * xe_ggtt_node_insert_balloon_locked() will ensure the node is inserted or reserved in GGTT.
+ * xe_ggtt_node_insert_balloon() will ensure the node is inserted or reserved in GGTT.
  *
  * Return: A pointer to %xe_ggtt_node struct on success. An ERR_PTR otherwise.
  **/
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 3951d9af97aa8..48f96267a7891 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -18,10 +18,10 @@ int xe_ggtt_init(struct xe_ggtt *ggtt);
 
 struct xe_ggtt_node *xe_ggtt_node_init(struct xe_ggtt *ggtt);
 void xe_ggtt_node_fini(struct xe_ggtt_node *node);
-int xe_ggtt_node_insert_balloon_locked(struct xe_ggtt_node *node,
+int xe_ggtt_node_insert_balloon(struct xe_ggtt_node *node,
 				       u64 start, u64 size);
-void xe_ggtt_node_remove_balloon_locked(struct xe_ggtt_node *node);
-void xe_ggtt_shift_nodes_locked(struct xe_ggtt *ggtt, s64 shift);
+void xe_ggtt_node_remove_balloon(struct xe_ggtt_node *node);
+void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, s64 shift);
 
 int xe_ggtt_node_insert(struct xe_ggtt_node *node, u32 size, u32 align);
 struct xe_ggtt_node *
diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
index 18b5466ae8e6f..3454a3c7686d1 100644
--- a/drivers/gpu/drm/xe/xe_ggtt_types.h
+++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
@@ -12,6 +12,7 @@
 
 struct xe_bo;
 struct xe_gt;
+struct xe_ggtt_node;
 
 /**
  * struct xe_ggtt - Main GGTT struct
@@ -49,6 +50,10 @@ struct xe_ggtt {
 	unsigned int access_count;
 	/** @wq: Dedicated unordered work queue to process node removals */
 	struct workqueue_struct *wq;
+	/** @balloon_start: Optional balloon at the beginning of GGTT, may be zero-sized */
+	struct drm_mm_node *balloon_start;
+	/** @balloon_end: Optional balloon at the end of GGTT, may be zero-sized */
+	struct drm_mm_node *balloon_end;
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 4ff7ae1a5f16c..8b8604bdedb48 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -600,12 +600,7 @@ static int vf_init_ggtt_balloons(struct xe_gt *gt)
 	return 0;
 }
 
-/**
- * xe_gt_sriov_vf_balloon_ggtt_locked - Insert balloon nodes to limit used GGTT address range.
- * @gt: the &amp;xe_gt struct instance
- * Return: 0 on success or a negative error code on failure.
- */
-int xe_gt_sriov_vf_balloon_ggtt_locked(struct xe_gt *gt)
+static int vf_balloon_ggtt(struct xe_gt *gt)
 {
 	struct xe_gt_sriov_vf_selfconfig *config = &amp;gt-&gt;sriov.vf.self_config;
 	struct xe_tile *tile = gt_to_tile(gt);
@@ -615,7 +610,6 @@ int xe_gt_sriov_vf_balloon_ggtt_locked(struct xe_gt *gt)
 
 	xe_gt_assert(gt, IS_SRIOV_VF(xe));
 	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
-	lockdep_assert_held(&amp;tile-&gt;mem.ggtt-&gt;lock);
 
 	if (!config-&gt;ggtt_size)
 		return -ENODATA;
@@ -638,7 +632,7 @@ int xe_gt_sriov_vf_balloon_ggtt_locked(struct xe_gt *gt)
 	start = xe_wopcm_size(xe);
 	end = config-&gt;ggtt_base;
 	if (end != start) {
-		err = xe_ggtt_node_insert_balloon_locked(tile-&gt;sriov.vf.ggtt_balloon[0],
+		err = xe_ggtt_node_insert_balloon(tile-&gt;sriov.vf.ggtt_balloon[0],
 							 start, end);
 		if (err)
 			return err;
@@ -647,10 +641,11 @@ int xe_gt_sriov_vf_balloon_ggtt_locked(struct xe_gt *gt)
 	start = config-&gt;ggtt_base + config-&gt;ggtt_size;
 	end = GUC_GGTT_TOP;
 	if (end != start) {
-		err = xe_ggtt_node_insert_balloon_locked(tile-&gt;sriov.vf.ggtt_balloon[1],
+		err = xe_ggtt_node_insert_balloon(tile-&gt;sriov.vf.ggtt_balloon[1],
 							 start, end);
 		if (err) {
-			xe_ggtt_node_remove_balloon_locked(tile-&gt;sriov.vf.ggtt_balloon[0]);
+			xe_ggtt_node_remove_balloon(tile-&gt;sriov.vf.ggtt_balloon[0]);
+			tile-&gt;sriov.vf.ggtt_balloon[0] = NULL;
 			return err;
 		}
 	}
@@ -658,38 +653,13 @@ int xe_gt_sriov_vf_balloon_ggtt_locked(struct xe_gt *gt)
 	return 0;
 }
 
-static int vf_balloon_ggtt(struct xe_gt *gt)
-{
-	struct xe_ggtt *ggtt = gt_to_tile(gt)-&gt;mem.ggtt;
-	int err;
-
-	mutex_lock(&amp;ggtt-&gt;lock);
-	err = xe_gt_sriov_vf_balloon_ggtt_locked(gt);
-	mutex_unlock(&amp;ggtt-&gt;lock);
-
-	return err;
-}
-
-/**
- * xe_gt_sriov_vf_deballoon_ggtt_locked - Remove balloon nodes.
- * @gt: the &amp;xe_gt struct instance
- */
-void xe_gt_sriov_vf_deballoon_ggtt_locked(struct xe_gt *gt)
-{
-	struct xe_tile *tile = gt_to_tile(gt);
-
-	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
-	xe_ggtt_node_remove_balloon_locked(tile-&gt;sriov.vf.ggtt_balloon[1]);
-	xe_ggtt_node_remove_balloon_locked(tile-&gt;sriov.vf.ggtt_balloon[0]);
-}
-
 static void vf_deballoon_ggtt(struct xe_gt *gt)
 {
 	struct xe_tile *tile = gt_to_tile(gt);
 
-	mutex_lock(&amp;tile-&gt;mem.ggtt-&gt;lock);
-	xe_gt_sriov_vf_deballoon_ggtt_locked(gt);
-	mutex_unlock(&amp;tile-&gt;mem.ggtt-&gt;lock);
+	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
+	xe_ggtt_node_remove_balloon(tile-&gt;sriov.vf.ggtt_balloon[1]);
+	xe_ggtt_node_remove_balloon(tile-&gt;sriov.vf.ggtt_balloon[0]);
 }
 
 static void vf_fini_ggtt_balloons(struct xe_gt *gt)
@@ -912,11 +882,7 @@ void xe_gt_sriov_vf_fixup_ggtt_nodes(struct xe_gt *gt, s64 shift)
 
 	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
 
-	mutex_lock(&amp;ggtt-&gt;lock);
-	xe_gt_sriov_vf_deballoon_ggtt_locked(gt);
-	xe_ggtt_shift_nodes_locked(ggtt, shift);
-	xe_gt_sriov_vf_balloon_ggtt_locked(gt);
-	mutex_unlock(&amp;ggtt-&gt;lock);
+	xe_ggtt_shift_nodes(ggtt, shift);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
index 9db41afddd5a8..8956fed594996 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
@@ -18,8 +18,6 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt);
 int xe_gt_sriov_vf_connect(struct xe_gt *gt);
 int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
 int xe_gt_sriov_vf_prepare_ggtt(struct xe_gt *gt);
-int xe_gt_sriov_vf_balloon_ggtt_locked(struct xe_gt *gt);
-void xe_gt_sriov_vf_deballoon_ggtt_locked(struct xe_gt *gt);
 s64 xe_gt_sriov_vf_ggtt_shift(struct xe_gt *gt);
 void xe_gt_sriov_vf_fixup_ggtt_nodes(struct xe_gt *gt, s64 shift);
 int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt);

</pre>
  </body>
</html>

--------------2LZwCyaeCFjSq4wicR0OZaDv--
