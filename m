Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58B7EEB64DC
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jul 2023 13:27:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 136FB10E07B;
	Tue, 11 Jul 2023 13:27:28 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28C3110E07B
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Jul 2023 13:27:26 +0000 (UTC)
Message-ID: <0a878f99-dbf6-89ff-d570-3e5e9e83b5c6@linux.intel.com>
Date: Tue, 11 Jul 2023 15:27:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20230710221544.1882405-1-matthew.brost@intel.com>
 <20230710221544.1882405-2-matthew.brost@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20230710221544.1882405-2-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Introduce a range-fence utility
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

Hey,

On 2023-07-11 00:15, Matthew Brost wrote:
> From: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>
> Add generic utility to track range conflicts signaled by a dma-fence.
> Tracking implemented via an interval tree. An example use case being
> tracking conflicts for pending (un)binds from multiple bind engines. By
> being generic ths idea would this could moved to the DRM level and used
> in multiple drivers for similar problems.
>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/xe/Makefile         |   1 +
>   drivers/gpu/drm/xe/xe_range_fence.c | 136 ++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_range_fence.h |  78 ++++++++++++++++
>   3 files changed, 215 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/xe_range_fence.c
>   create mode 100644 drivers/gpu/drm/xe/xe_range_fence.h
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 336f0eb8f91e..c2cf86002bff 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -90,6 +90,7 @@ xe-y += xe_bb.o \
>   	xe_pt.o \
>   	xe_pt_walk.o \
>   	xe_query.o \
> +	xe_range_fence.o \
>   	xe_reg_sr.o \
>   	xe_reg_whitelist.o \
>   	xe_rtp.o \
> diff --git a/drivers/gpu/drm/xe/xe_range_fence.c b/drivers/gpu/drm/xe/xe_range_fence.c
> new file mode 100644
> index 000000000000..72d75e78c621
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_range_fence.c
> @@ -0,0 +1,136 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include <linux/dma-fence.h>
> +#include <linux/interval_tree_generic.h>
> +#include <linux/slab.h>
> +
> +#include "xe_macros.h"
> +#include "xe_range_fence.h"
> +
> +#define XE_RANGE_TREE_START(_node)	((_node)->start)
> +#define XE_RANGE_TREE_LAST(_node)	((_node)->last)
> +
> +INTERVAL_TREE_DEFINE(struct xe_range_fence, rb, u64, __subtree_last,
> +		     XE_RANGE_TREE_START, XE_RANGE_TREE_LAST,
> +		     , xe_range_fence_tree);
> +
> +static void
> +xe_range_fence_signal_notify(struct dma_fence *fence, struct dma_fence_cb *cb)
> +{
> +	struct xe_range_fence *rfence = container_of(cb, typeof(*rfence), cb);
> +	struct xe_range_fence_tree *tree = rfence->tree;
> +
> +	llist_add(&rfence->link, &tree->list);
> +}
> +
> +static bool __xe_range_fence_cleanup(struct xe_range_fence_tree *tree)
> +{
> +	struct llist_node *node = llist_del_all(&tree->list);
> +	struct xe_range_fence *rfence, *next;
> +
> +	llist_for_each_entry_safe(rfence, next, node, link) {
> +		xe_range_fence_tree_remove(rfence, &tree->root);
> +		dma_fence_put(rfence->fence);
> +		kfree(rfence);
> +	}
> +
> +	return !!node;
> +}
> +
> +/**
> + * xe_range_fence_cleanup() - Cleanup range fence tree
> + * @tree: range fence tree
> + */
> +void xe_range_fence_cleanup(struct xe_range_fence_tree *tree)
> +{
> +	(void)__xe_range_fence_cleanup(tree);
> +}
> +
> +/**
> + * xe_range_fence_insert() - range fence insert
> + * @tree: range fence tree to insert intoi
> + * @rfence: range fence
> + * @ops: range fence ops
> + * @start: start address of range fence
> + * @last: last address of range fence
> + * @fence: dma fence which signals range fence can be removed + freed
> + *
> + * Return: 0 on success, non-zero on failure
> + */
> +int xe_range_fence_insert(struct xe_range_fence_tree *tree,
> +			  struct xe_range_fence *rfence,
> +			  const struct xe_range_fence_ops *ops,
> +			  u64 start, u64 last, struct dma_fence *fence)
> +{
> +	int err = 0;
> +
> +	(void)__xe_range_fence_cleanup(tree);
Is that void cast needed here? Should be safe to ignore return value 
regardless.
> +
> +	if (dma_fence_is_signaled(fence))
> +		goto free;
> +
> +	rfence->ops = ops;
> +	rfence->start = start;
> +	rfence->last = last;
> +	rfence->tree = tree;
> +	rfence->fence = dma_fence_get(fence);
> +	err = dma_fence_add_callback(fence, &rfence->cb,
> +				     xe_range_fence_signal_notify);
> +	if (err == -ENOENT) {
> +		dma_fence_put(fence);
> +		err = 0;
> +		goto free;
> +	} else if (err == 0) {
> +		xe_range_fence_tree_insert(rfence, &tree->root);
> +		return 0;
> +	}
> +
> +free:
> +	if (ops->free)
> +		ops->free(rfence);
> +
> +	return err;
> +}
> +
> +static void xe_range_fence_tree_remove_all(struct xe_range_fence_tree *tree)
> +{
> +	struct xe_range_fence *rfence;
> +	bool retry = true;
> +
> +	rfence = xe_range_fence_tree_iter_first(&tree->root, 0, U64_MAX);
> +	while (rfence) {
> +		/* Should be ok with the minimalistic callback */
> +		if (dma_fence_remove_callback(rfence->fence, &rfence->cb))
> +			llist_add(&rfence->link, &tree->list);
> +		rfence = xe_range_fence_tree_iter_next(rfence, 0, U64_MAX);
> +	}
> +
> +	while (retry)
> +		retry = __xe_range_fence_cleanup(tree);
> +}
> +
> +/**
> + * xe_range_fence_tree_init() - Init range fence tree
> + * @tree: range fence tree
> + */
> +void xe_range_fence_tree_init(struct xe_range_fence_tree *tree)
> +{
> +	memset(tree, 0, sizeof(*tree));
> +}
> +
> +/**
> + * xe_range_fence_tree_fini() - Fini range fence tree
> + * @tree: range fence tree
> + */
> +void xe_range_fence_tree_fini(struct xe_range_fence_tree *tree)
> +{
> +	xe_range_fence_tree_remove_all(tree);
> +	XE_WARN_ON(!RB_EMPTY_ROOT(&tree->root.rb_root));
> +}
> +
> +const struct xe_range_fence_ops xe_range_fence_kfree_ops = {
> +	.free = (void (*)(struct xe_range_fence *rfence)) kfree,
> +};
> diff --git a/drivers/gpu/drm/xe/xe_range_fence.h b/drivers/gpu/drm/xe/xe_range_fence.h
> new file mode 100644
> index 000000000000..d6a22eeb0158
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_range_fence.h
> @@ -0,0 +1,78 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_RANGE_FENCE_H_
> +#define _XE_RANGE_FENCE_H_
> +
> +#include <linux/dma-fence.h>
> +#include <linux/rbtree.h>
> +#include <linux/types.h>
> +
> +struct xe_range_fence_tree;
> +struct xe_range_fence;
> +
> +/** struct xe_range_fence_ops - XE range fence ops */
> +struct xe_range_fence_ops {
> +	/** @free: free range fence op */
> +	void (*free)(struct xe_range_fence *rfence);
> +};
Could we  keep the definitions private as much as possible?
> +
> +/** struct xe_range_fence - XE range fence (address conflict tracking) */
> +struct xe_range_fence {
> +	/** @rb: RB tree node inserted into interval tree */
> +	struct rb_node rb;
> +	/** @start: start address of range fence is interval tree */
> +	u64 start;
> +	/** @last: last address (inclusive) of range fence is interval tree */
> +	u64 last;
> +	/** @__subtree_last: interval tree internal usage */
> +	u64 __subtree_last;
> +	/**
> +	 * @fence: fence signals address in range fence no longer has conflict
> +	 */
> +	struct dma_fence *fence;
> +	/** @tree: interval tree which range fence belongs to */
> +	struct xe_range_fence_tree *tree;
> +	/**
> +	 * @cb: callback when fence signals to remove range fence free from interval tree
> +	 */
> +	struct dma_fence_cb cb;
> +	/** @link: used to defer free of range fence to non-irq context */
> +	struct llist_node link;
> +	/** @ops: range fence ops */
> +	const struct xe_range_fence_ops *ops;
> +};
> +
> +/** struct xe_range_fence_tree - interval tree to store range fences */
> +struct xe_range_fence_tree {
> +	/** @root: interval tree root */
> +	struct rb_root_cached root;
> +	/** @list: list of pending range fences to be freed */
> +	struct llist_head list;
> +};
> +
> +extern const struct xe_range_fence_ops xe_range_fence_kfree_ops;
> +
> +struct xe_range_fence *
> +xe_range_fence_tree_iter_first(struct rb_root_cached *root, u64 start,
> +			       u64 last);
> +
> +struct xe_range_fence *
> +xe_range_fence_tree_iter_next(struct xe_range_fence *rfence,
> +			      u64 start, u64 last);
> +
> +void xe_range_fence_tree_cleanup(struct xe_range_fence_tree *tree);
> +
> +void xe_range_fence_tree_init(struct xe_range_fence_tree *tree);
> +
> +void xe_range_fence_tree_fini(struct xe_range_fence_tree *tree);
> +
> +int xe_range_fence_insert(struct xe_range_fence_tree *tree,
> +			  struct xe_range_fence *rfence,
> +			  const struct xe_range_fence_ops *ops,
> +			  u64 start, u64 end,
> +			  struct dma_fence *fence);
> +
> +#endif

Cheers,

~Maarten

