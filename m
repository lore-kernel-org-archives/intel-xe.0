Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A094FC369CA
	for <intel-xe@archiver.kernel.org>; Fri, 18 Apr 2025 12:58:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62BF910E1F5;
	Fri, 18 Apr 2025 12:58:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c1lDohPx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8733210E20A
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Apr 2025 12:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744981111; x=1776517111;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=/dDU2i7mxtqOpcQcJ9nHz+9O6rtKCOoKHHACi6p/Ty8=;
 b=c1lDohPxtXo/fFhdi1wQm7nczlWFHhdIBdye7clHPzxurIw6Xj3Ym/T6
 /eZMRkEQwqwnPV0hMsIiih0NUhppiFh7fKz6mRZjuAjj1eBdP5jWRa/0M
 3dVYtk7jj2VcsOV998cBYCkiyfQKd+LAz5ZCzB3jfeMHOYwwR2VT/HOBr
 yK8reCZqKluka8g0e9+gBYkmRhjAiNqV0qAUPxNl/Pt/Hdx617ieYgGLd
 thzaAd2kDK4Y4C/M+3LyfKRwACcLewobxzem0qGoGUykEYplZ6NoZ199s
 QdfZ+KJDAhHfsubJCfXlORX00FilcsncFsFAR1I7VOBjINaTweaHAfKQP g==;
X-CSE-ConnectionGUID: bL90KfWmQeav+A5zlBJJ6Q==
X-CSE-MsgGUID: a/yQ1DdgRvKNZHcwXx+iPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11407"; a="64012153"
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; d="scan'208";a="64012153"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2025 05:58:30 -0700
X-CSE-ConnectionGUID: JQYcyY4ATDixYgZ/pEdZKA==
X-CSE-MsgGUID: HwsoOr8VQx6iNBK7o7Vf2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; d="scan'208";a="136209501"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa004.fm.intel.com with ESMTP; 18 Apr 2025 05:58:28 -0700
Received: from [10.245.84.121] (unknown [10.245.84.121])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 6A50D340D5;
 Fri, 18 Apr 2025 13:58:27 +0100 (IST)
Message-ID: <09653333-094b-4f1e-91f2-ff738b278d5c@intel.com>
Date: Fri, 18 Apr 2025 14:58:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 4/4] drm/xe/vf: Fixup CTB send buffer messages after
 migration
To: Tomasz Lis <tomasz.lis@intel.com>, intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250417234239.3786508-1-tomasz.lis@intel.com>
 <20250417234239.3786508-5-tomasz.lis@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250417234239.3786508-5-tomasz.lis@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 18.04.2025 01:42, Tomasz Lis wrote:
> During post-migration recovery of a VF, it is necessary to update
> GGTT references included in messages which are going to be sent
> to GuC. GuC will start consuming messages after VF KMD will inform
> it about fixups being done; before that, the VF KMD is expected
> to update any H2G messages which are already in send buffer but
> were not consumed by GuC.
> 
> Only a small subset of messages allowed for VFs have GGTT references
> in them. This patch adds the functionality to parse the CTB send
> ring buffer and shift addresses contained within.
> 
> While fixing the CTB content, ct->lock is not taken. This means
> the only barrier taken remains GGTT address lock - which is ok,
> because only requests with GGTT addresses matter, but it also means
> tail changes can happen during the CTB fixups execution (which may
> be ignored as any new messages will not have anything to fix).
> 
> The GGTT address locking will be introduced in a future series.
> 
> v2: removed storing shift as that's now done in VMA nodes patch;
>   macros to inlines; warns to asserts; log messages fixes (Michal)
> v3: removed inline keywords, enums for offsets in CTB messages,
>   less error messages, if return unused then made functs void (Michal)
> v4: update the cached head before starting fixups
> v5: removed/updated comments, wrapped lines, converted assert into
>   error, enums for offsets to separate patch, reused xe_map_rd
> v6: define xe_map_*_array() macros, support CTB wrap which divides
>   a message, updated comments, moved one function to an earlier patch
> v7: renamed few functions, wider use on previously introduced helper,
>   separate cases in parsing messges, documented a static funct
> v8: Introduced more helpers, fixed coding style mistakes
> v9: Move xe_map*() functs to macros, add asserts, add debug print
> v10: Errors in place of some asserts, style fixes
> 
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c   | 181 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_ct.h   |   2 +
>  drivers/gpu/drm/xe/xe_map.h      |  18 +++
>  drivers/gpu/drm/xe/xe_sriov_vf.c |  18 +++
>  4 files changed, 219 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 2447de0ebedf..32a6001c3d25 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -25,6 +25,7 @@
>  #include "xe_gt_printk.h"
>  #include "xe_gt_sriov_pf_control.h"
>  #include "xe_gt_sriov_pf_monitor.h"
> +#include "xe_gt_sriov_printk.h"
>  #include "xe_gt_tlb_invalidation.h"
>  #include "xe_guc.h"
>  #include "xe_guc_log.h"
> @@ -84,6 +85,8 @@ struct g2h_fence {
>  	bool done;
>  };
>  
> +#define make_u64(hi, lo) ((u64)((u64)(u32)(hi) << 32 | (u32)(lo)))
> +
>  static void g2h_fence_init(struct g2h_fence *g2h_fence, u32 *response_buffer)
>  {
>  	g2h_fence->response_buffer = response_buffer;
> @@ -1624,6 +1627,184 @@ static void g2h_worker_func(struct work_struct *w)
>  	receive_g2h(ct);
>  }
>  
> +static void xe_fixup_u64_in_cmds(struct xe_device *xe, struct iosys_map *cmds,
> +				 u32 size, u32 idx, s64 shift)
> +{
> +	u32 hi, lo;
> +	u64 offset;
> +
> +	lo = xe_map_rd_ring_u32(xe, cmds, idx, size);
> +	hi = xe_map_rd_ring_u32(xe, cmds, idx + 1, size);
> +	offset = make_u64(hi, lo);
> +	offset += shift;
> +	lo = lower_32_bits(offset);
> +	hi = upper_32_bits(offset);
> +	xe_map_wr_ring_u32(xe, cmds, idx, size, lo);
> +	xe_map_wr_ring_u32(xe, cmds, idx + 1, size, hi);
> +}
> +
> +/*
> + * Shift any GGTT addresses within a single message left within CTB from
> + * before post-migration recovery.
> + * @ct: pointer to CT struct of the target GuC
> + * @cmds: iomap buffer containing CT messages
> + * @head: start of the target message within the buffer
> + * @len: length of the target message
> + * @size: size of the commands buffer
> + * @shift: the address shift to be added to each GGTT reference
> + * Return: true if the message was fixed or needed no fixups, false on failure
> + */
> +static bool ct_fixup_ggtt_in_message(struct xe_guc_ct *ct,
> +				     struct iosys_map *cmds, u32 head,
> +				     u32 len, u32 size, s64 shift)
> +{
> +	struct xe_gt *gt __maybe_unused = ct_to_gt(ct);
> +	struct xe_device *xe = ct_to_xe(ct);
> +	u32 msg[GUC_HXG_MSG_MIN_LEN];
> +	u32 action, i, n;
> +
> +	xe_gt_assert(gt, len >= GUC_HXG_MSG_MIN_LEN);
> +
> +	msg[0] = xe_map_rd_ring_u32(xe, cmds, head, size);
> +	action = FIELD_GET(GUC_HXG_REQUEST_MSG_0_ACTION, msg[0]);
> +
> +	xe_gt_sriov_dbg_verbose(gt, "fixing H2G %#x\n", action);
> +
> +	switch (action) {
> +	case XE_GUC_ACTION_REGISTER_CONTEXT:
> +		if (len >= XE_GUC_REGISTER_CONTEXT_MSG_LEN)

hmm, was this code tested?

IMO this should be:

	len != XE_GUC_REGISTER_CONTEXT_MSG_LEN

> +			goto err_len;
> +		xe_fixup_u64_in_cmds(xe, cmds, size, head +
> +				     XE_GUC_REGISTER_CONTEXT_DATA_5_WQ_DESC_ADDR_LOWER,
> +				     shift);
> +		xe_fixup_u64_in_cmds(xe, cmds, size, head +
> +				     XE_GUC_REGISTER_CONTEXT_DATA_7_WQ_BUF_BASE_LOWER,
> +				     shift);
> +		xe_fixup_u64_in_cmds(xe, cmds, size, head +
> +				     XE_GUC_REGISTER_CONTEXT_DATA_10_HW_LRC_ADDR, shift);
> +		break;
> +	case XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC:
> +		if (len >= XE_GUC_REGISTER_CONTEXT_MULTI_LRC_MSG_LEN)

and this should be:

	len < XE_GUC_REGISTER_CONTEXT_MULTI_LRC_MSG_LEN

> +			goto err_len;
> +		n = xe_map_rd_ring_u32(xe, cmds, head +
> +				       XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_10_NUM_CTXS, size);
> +		if (len >= XE_GUC_REGISTER_CONTEXT_MULTI_LRC_MSG_LEN + 2 * n)

and this should be:

	len != XE_GUC_REGISTER_CONTEXT_MULTI_LRC_MSG_LEN + 2*n

> +			goto err_len;
> +		xe_fixup_u64_in_cmds(xe, cmds, size, head +
> +				     XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_5_WQ_DESC_ADDR_LOWER,
> +				     shift);
> +		xe_fixup_u64_in_cmds(xe, cmds, size, head +
> +				     XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_7_WQ_BUF_BASE_LOWER,
> +				     shift);
> +		for (i = 0; i < n; i++)
> +			xe_fixup_u64_in_cmds(xe, cmds, size, head +
> +					     XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_11_HW_LRC_ADDR
> +					     + 2 * i, shift);
> +		break;
> +	default:
> +		break;
> +	}
> +	return true;

nit: add empty line here

> +err_len:
> +	xe_gt_err(gt, "Skipped G2G %#x message fixups, length (%u) too small\n", action, len);
> +	return false;
> +}
> +
> +/*
> + * Apply fixups to the next outgoing CT message within given CTB
> + * @ct: the &xe_guc_ct struct instance representing the target GuC
> + * @h2g: the &guc_ctb struct instance of the target buffer
> + * @shift: shift to be added to all GGTT addresses within the CTB
> + * @mhead: pointer to an integer storing message start position; the
> + *   position is changed to next message before this function return
> + * @avail: size of the area available for parsing, that is length
> + *   of all remaining messages stored within the CTB
> + * Return: size of the area available for parsing after one message
> + *   has been parsed, that is length remaining from the updated mhead
> + */
> +static int ct_fixup_ggtt_in_buffer(struct xe_guc_ct *ct, struct guc_ctb *h2g,
> +				   s64 shift, u32 *mhead, s32 avail)
> +{
> +	struct xe_device *xe = ct_to_xe(ct);

to avoid 2x ct_to_gt() maybe add *gt here ?

> +	u32 msg[GUC_HXG_MSG_MIN_LEN];
> +	u32 size = h2g->info.size;
> +	u32 head = *mhead;
> +	u32 len;
> +
> +	xe_gt_assert(ct_to_gt(ct), avail >= (s32)GUC_CTB_MSG_MIN_LEN);
> +
> +	/* Read header */
> +	msg[0] = xe_map_rd_ring_u32(xe, &h2g->cmds, head, size);
> +	len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, msg[0]) + GUC_CTB_MSG_MIN_LEN;
> +
> +	if (unlikely(len > (u32)avail)) {
> +		xe_gt_err(ct_to_gt(ct), "H2G channel broken on read, avail=%d, len=%d, fixups skipped\n",
> +			  avail, len);
> +		return 0;
> +	}
> +
> +	head = (head + GUC_CTB_MSG_MIN_LEN) % size;
> +	if (!ct_fixup_ggtt_in_message(ct, &h2g->cmds, head, msg_len_to_hxg_len(len), size, shift))
> +		return 0;
> +	*mhead = (head + msg_len_to_hxg_len(len)) % size;
> +
> +	return avail - len;
> +}
> +
> +/**
> + * xe_guc_ct_fixup_messages_with_ggtt - Fixup any pending H2G CTB messages
> + * @ct: pointer to CT struct of the target GuC
> + * @ggtt_shift: shift to be added to all GGTT addresses within the CTB
> + *
> + * Messages in GuC to Host CTB are owned by GuC and any fixups in them
> + * are made by GuC. But content of the Host to GuC CTB is owned by the
> + * KMD, so fixups to GGTT references in any pending messages need to be
> + * applied here.
> + * This function updates GGTT offsets in payloads of pending H2G CTB
> + * messages (messages which were not consumed by GuC before the VF got
> + * paused).
> + */
> +void xe_guc_ct_fixup_messages_with_ggtt(struct xe_guc_ct *ct, s64 ggtt_shift)
> +{
> +	struct guc_ctb *h2g = &ct->ctbs.h2g;
> +	struct xe_guc *guc = ct_to_guc(ct);
> +	struct xe_gt *gt = guc_to_gt(guc);
> +	u32 head, tail, size;
> +	s32 avail;
> +
> +	if (unlikely(h2g->info.broken))
> +		return;
> +
> +	h2g->info.head = desc_read(ct_to_xe(ct), h2g, head);
> +	head = h2g->info.head;
> +	tail = READ_ONCE(h2g->info.tail);
> +	size = h2g->info.size;
> +
> +	if (unlikely(head > size))
> +		goto corrupted;
> +
> +	if (unlikely(tail >= size))
> +		goto corrupted;
> +
> +	avail = tail - head;
> +
> +	/* beware of buffer wrap case */
> +	if (unlikely(avail < 0))
> +		avail += size;
> +	xe_gt_dbg(gt, "available %d (%u:%u:%u)\n", avail, head, tail, size);
> +	xe_gt_assert(gt, avail >= 0);
> +
> +	while (avail > 0)
> +		avail = ct_fixup_ggtt_in_buffer(ct, h2g, ggtt_shift, &head, avail);
> +
> +	return;
> +
> +corrupted:
> +	xe_gt_err(gt, "Corrupted H2G descriptor head=%u tail=%u size=%u, fixups not applied\n",
> +		  head, tail, size);
> +	h2g->info.broken = true;
> +}
> +
>  static struct xe_guc_ct_snapshot *guc_ct_snapshot_alloc(struct xe_guc_ct *ct, bool atomic,
>  							bool want_ctb)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> index 82c4ae458dda..5649bda82823 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> @@ -22,6 +22,8 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot, struct drm_pr
>  void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot);
>  void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb);
>  
> +void xe_guc_ct_fixup_messages_with_ggtt(struct xe_guc_ct *ct, s64 ggtt_shift);
> +
>  static inline bool xe_guc_ct_enabled(struct xe_guc_ct *ct)
>  {
>  	return ct->state == XE_GUC_CT_STATE_ENABLED;
> diff --git a/drivers/gpu/drm/xe/xe_map.h b/drivers/gpu/drm/xe/xe_map.h
> index f62e0c8b67ab..8d67f6ba2d95 100644
> --- a/drivers/gpu/drm/xe/xe_map.h
> +++ b/drivers/gpu/drm/xe/xe_map.h
> @@ -78,6 +78,24 @@ static inline void xe_map_write32(struct xe_device *xe, struct iosys_map *map,
>  	iosys_map_wr(map__, offset__, type__, val__);			\
>  })
>  
> +#define xe_map_rd_array(xe__, map__, index__, type__) \
> +	xe_map_rd(xe__, map__, (index__) * sizeof(type__), type__)
> +
> +#define xe_map_wr_array(xe__, map__, index__, type__, val__) \
> +	xe_map_wr(xe__, map__, (index__) * sizeof(type__), type__, val__)
> +
> +#define xe_map_rd_array_u32(xe__, map__, index__) \
> +	xe_map_rd_array(xe__, map__, index__, u32)
> +
> +#define xe_map_wr_array_u32(xe__, map__, index__, val__) \
> +	xe_map_wr_array(xe__, map__, index__, u32, val__)
> +
> +#define xe_map_rd_ring_u32(xe__, map__, index__, size__) \
> +	xe_map_rd_array_u32(xe__, map__, (index__) % (size__))
> +
> +#define xe_map_wr_ring_u32(xe__, map__, index__, size__, val__) \
> +	xe_map_wr_array_u32(xe__, map__, (index__) % (size__), val__)
> +
>  #define xe_map_rd_field(xe__, map__, struct_offset__, struct_type__, field__) ({	\
>  	struct xe_device *__xe = xe__;					\
>  	xe_device_assert_mem_access(__xe);				\
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index e70f1ceabbb3..2674fa948fda 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -10,6 +10,7 @@
>  #include "xe_gt.h"
>  #include "xe_gt_sriov_printk.h"
>  #include "xe_gt_sriov_vf.h"
> +#include "xe_guc_ct.h"
>  #include "xe_pm.h"
>  #include "xe_sriov.h"
>  #include "xe_sriov_printk.h"
> @@ -158,6 +159,20 @@ static int vf_post_migration_requery_guc(struct xe_device *xe)
>  	return ret;
>  }
>  
> +static void vf_post_migration_fixup_ctb(struct xe_device *xe)
> +{
> +	struct xe_gt *gt;
> +	unsigned int id;
> +
> +	xe_assert(xe, IS_SRIOV_VF(xe));
> +
> +	for_each_gt(gt, xe, id) {
> +		s32 shift = xe_gt_sriov_vf_ggtt_shift(gt);
> +
> +		xe_guc_ct_fixup_messages_with_ggtt(&gt->uc.guc.ct, shift);
> +	}
> +}
> +
>  /*
>   * vf_post_migration_imminent - Check if post-restore recovery is coming.
>   * @xe: the &xe_device struct instance
> @@ -224,6 +239,9 @@ static void vf_post_migration_recovery(struct xe_device *xe)
>  
>  	need_fixups = vf_post_migration_fixup_ggtt_nodes(xe);
>  	/* FIXME: add the recovery steps */
> +	if (need_fixups)
> +		vf_post_migration_fixup_ctb(xe);
> +
>  	vf_post_migration_notify_resfix_done(xe);
>  	xe_pm_runtime_put(xe);
>  	drm_notice(&xe->drm, "migration recovery ended\n");

