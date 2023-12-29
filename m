Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4063C46CD4
	for <intel-xe@archiver.kernel.org>; Fri, 29 Dec 2023 22:55:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D25E10E156;
	Fri, 29 Dec 2023 22:55:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79DAF10E156
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Dec 2023 22:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703890527; x=1735426527;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Yvs/lHoh3/JkF4Q7AjxOlCpCwuOM4jufwhpSFnGYR04=;
 b=ZpJi5now4nEhcCfPjD3Seli0qv69x6pDdoo+L9GcLq7j9/TeKurOHOG0
 LT6CaPttssyCpYctLEw3ykZlMHSRY+sxn2QY5KnJY4fZ0R1uHBKAQXALT
 qzRjXCBUgI2L/Dlc/+UOHCNA/4edUtvHB83i1NWGZE0TncLtw7ZSfUxph
 h1EmZlBn13UIEw7PBB7+y/tj7jwyG1J2QESmB0eHJU+uliLAG/8rv4qGZ
 rsanpuvs2VOoD9JQJa9RmvKmsqKLfxpyhzd6HBSKqb6uwpDhoU4UKFEK7
 fQShbYunrsseWi5ZOclzfwxYSXTz5ASrHtn3A/qy+u2UuswZq5aGXB6GS w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="3517850"
X-IronPort-AV: E=Sophos;i="6.04,316,1695711600"; 
   d="scan'208";a="3517850"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Dec 2023 14:55:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="813140769"
X-IronPort-AV: E=Sophos;i="6.04,316,1695711600"; d="scan'208";a="813140769"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orsmga001.jf.intel.com with ESMTP; 29 Dec 2023 14:55:19 -0800
Received: from [10.249.132.76] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.132.76])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 73E9535421;
 Fri, 29 Dec 2023 22:55:17 +0000 (GMT)
Message-ID: <490ec107-9c40-4215-86f0-1f34dadf8b8b@intel.com>
Date: Fri, 29 Dec 2023 23:55:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] drm/xe/guc: Introduce Relay Communication for SR-IOV
Content-Language: en-US
To: =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
References: <20231227235838.212-1-michal.wajdeczko@intel.com>
 <20231227235838.212-8-michal.wajdeczko@intel.com>
 <20231229211459.dqajp2s2dfzyojln@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20231229211459.dqajp2s2dfzyojln@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 29.12.2023 22:14, Piotr Piórkowski wrote:
> Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on czw [2023-gru-28 00:58:35 +0100]:
>> There are scenarios where SR-IOV Virtual Function (VF) driver will
>> need to get additional data that is not available over VF MMIO BAR
>> nor could be queried from the GuC firmware and must be obtained
>> from the Physical Function (PF) driver.
>>
>> To allow such communication between VF and PF drivers, GuC supports
>> set of H2G and G2H actions which allows relaying embedded messages,
>> that are otherwise opaque for the GuC.
>>
>> To allow use of this communication mechanism, provide functions for
>> sending requests and handling replies and placeholder where we will
>> put handlers for incoming requests.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>  drivers/gpu/drm/xe/Makefile             |   1 +
>>  drivers/gpu/drm/xe/xe_guc.c             |   5 +
>>  drivers/gpu/drm/xe/xe_guc_relay.c       | 918 ++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_guc_relay.h       |  32 +
>>  drivers/gpu/drm/xe/xe_guc_relay_types.h |  36 +
>>  drivers/gpu/drm/xe/xe_guc_types.h       |   4 +
>>  6 files changed, 996 insertions(+)
>>  create mode 100644 drivers/gpu/drm/xe/xe_guc_relay.c
>>  create mode 100644 drivers/gpu/drm/xe/xe_guc_relay.h
>>  create mode 100644 drivers/gpu/drm/xe/xe_guc_relay_types.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index df8601d6a59f..6952da8979ea 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -148,6 +148,7 @@ xe-$(CONFIG_HWMON) += xe_hwmon.o
>>  
>>  # graphics virtualization (SR-IOV) support
>>  xe-y += \
>> +	xe_guc_relay.o \
>>  	xe_memirq.o \
>>  	xe_sriov.o
>>  
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index 811e8b201270..311a0364bff1 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -21,6 +21,7 @@
>>  #include "xe_guc_hwconfig.h"
>>  #include "xe_guc_log.h"
>>  #include "xe_guc_pc.h"
>> +#include "xe_guc_relay.h"
>>  #include "xe_guc_submit.h"
>>  #include "xe_memirq.h"
>>  #include "xe_mmio.h"
>> @@ -263,6 +264,10 @@ int xe_guc_init(struct xe_guc *guc)
>>  	if (ret)
>>  		goto out;
>>  
>> +	ret = xe_guc_relay_init(&guc->relay);
>> +	if (ret)
>> +		goto out;
>> +
>>  	ret = xe_guc_pc_init(&guc->pc);
>>  	if (ret)
>>  		goto out;
>> diff --git a/drivers/gpu/drm/xe/xe_guc_relay.c b/drivers/gpu/drm/xe/xe_guc_relay.c
>> new file mode 100644
>> index 000000000000..528a18215389
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_guc_relay.c
>> @@ -0,0 +1,918 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#include <linux/bitfield.h>
>> +#include <linux/delay.h>
>> +
>> +#include <drm/drm_managed.h>
>> +
>> +#include "abi/guc_actions_sriov_abi.h"
>> +#include "abi/guc_relay_actions_abi.h"
>> +#include "abi/guc_relay_communication_abi.h"
>> +
>> +#include "xe_assert.h"
>> +#include "xe_device.h"
>> +#include "xe_gt.h"
>> +#include "xe_gt_sriov_printk.h"
>> +#include "xe_guc.h"
>> +#include "xe_guc_ct.h"
>> +#include "xe_guc_hxg_helpers.h"
>> +#include "xe_guc_relay.h"
>> +#include "xe_guc_relay_types.h"
>> +#include "xe_sriov.h"
>> +
>> +/*
>> + * How long should we wait for the response?
>> + * XXX this value is subject for the profiling.
>> + */
>> +#define RELAY_TIMEOUT_MSEC	(2500)
>> +
>> +static void relays_worker_fn(struct work_struct *w);
>> +
>> +static struct xe_guc *relay_to_guc(struct xe_guc_relay *relay)
>> +{
>> +	return container_of(relay, struct xe_guc, relay);
>> +}
>> +
>> +static struct xe_guc_ct *relay_to_ct(struct xe_guc_relay *relay)
>> +{
>> +	return &relay_to_guc(relay)->ct;
>> +}
>> +
>> +static struct xe_gt *relay_to_gt(struct xe_guc_relay *relay)
>> +{
>> +	return guc_to_gt(relay_to_guc(relay));
>> +}
>> +
>> +static struct xe_device *relay_to_xe(struct xe_guc_relay *relay)
>> +{
>> +	return gt_to_xe(relay_to_gt(relay));
>> +}
>> +
>> +#define relay_assert(relay, condition)	xe_gt_assert(relay_to_gt(relay), condition)
>> +#define relay_notice(relay, msg...)	xe_gt_sriov_notice(relay_to_gt(relay), "relay: " msg)
>> +#define relay_debug(relay, msg...)	xe_gt_sriov_dbg_verbose(relay_to_gt(relay), "relay: " msg)
>> +
>> +static int relay_get_totalvfs(struct xe_guc_relay *relay)
>> +{
>> +	struct xe_device *xe = relay_to_xe(relay);
>> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>> +
>> +	return IS_SRIOV_VF(xe) ? 0 : pci_sriov_get_totalvfs(pdev);
>> +}
>> +
>> +static bool relay_is_ready(struct xe_guc_relay *relay)
>> +{
>> +	return mempool_initialized(&relay->pool);
>> +}
>> +
>> +static u32 relay_get_next_rid(struct xe_guc_relay *relay, u32 target)
> 
> Why target here ? It seems not necessary

it was used in future pending patches, will drop for now

> 
>> + {
>> +	u32 rid;
>> +
>> +	spin_lock(&relay->lock);
>> +	rid = ++relay->last_rid;
>> +	spin_unlock(&relay->lock);
>> +
>> +	return rid;
>> +}
>> +
>> +/*
>> + * Relation between struct relay_transaction members::
> 
> 
> From what I understand, the double colon is meaningful for docs, here it's
> probably not needed (unless it was meant to be docs,
> but then it's the wrong type of comment)

yup, it was a kernel-doc for the struct, somehow changed that to normal
comment in last minute, will convert back to full doc (as members are
still documented)

> 
>> + *
>> + *                 <-------------------- GUC_CTB_MAX_DWORDS -------------->
>> + *                                  <-------- GUC_RELAY_MSG_MAX_LEN --->
>> + *                 <--- offset ---> <--- request_len ------->
>> + *                +----------------+-------------------------+----------+--+
>> + *                |                |                         |          |  |
>> + *                +----------------+-------------------------+----------+--+
>> + *                ^                ^
>> + *               /                /
>> + *    request_buf          request
>> + *
>> + *                 <-------------------- GUC_CTB_MAX_DWORDS -------------->
>> + *                                  <-------- GUC_RELAY_MSG_MAX_LEN --->
>> + *                 <--- offset ---> <--- response_len --->
>> + *                +----------------+----------------------+-------------+--+
>> + *                |                |                      |             |  |
>> + *                +----------------+----------------------+-------------+--+
>> + *                ^                ^
>> + *               /                /
>> + *   response_buf         response
>> + */
>> +struct relay_transaction {
>> +	/**
>> +	 * @incoming: indicates whether this transaction represents an incoming
>> +	 *            request from the remote VF/PF or this transaction
>> +	 *            represents outgoing request to the remote VF/PF.
>> +	 */
>> +	bool incoming;
>> +
>> +	/**
>> +	 * @remote: PF/VF identifier of the origin (or target) of the relay
>> +	 *          request message.
>> +	 */
>> +	u32 remote;
>> +
>> +	/** @rid: identifier of the VF/PF relay message. */
>> +	u32 rid;
>> +
>> +	/**
>> +	 * @request: points to the inner VF/PF request message, copied to the
>> +	 *           #response_buf starting at #offset.
>> +	 */
>> +	u32 *request;
>> +
>> +	/** @request_len: length of the inner VF/PF request message. */
>> +	u32 request_len;
>> +
>> +	/**
>> +	 * @response: points to the placeholder buffer where inner VF/PF
>> +	 *            response will be located, for outgoing transaction
>> +	 *            this could be caller's buffer (if provided) otherwise
>> +	 *            it points to the #response_buf starting at #offset.
>> +	 */
>> +	u32 *response;
>> +
>> +	/**
>> +	 * @response_len: length of the inner VF/PF response message (only
>> +	 *                if #status is 0), initially set to the size of the
>> +	 *                placeholder buffer where response message will be
>> +	 *                copied.
>> +	 */
>> +	u32 response_len;
>> +
>> +	/**
>> +	 * @offset: offset to the start of the inner VF/PF relay message inside
>> +	 *          buffers; this offset is equal the length of the outer GuC
>> +	 *          relay header message.
>> +	 */
>> +	u32 offset;
>> +
>> +	/**
>> +	 * @request_buf: buffer with VF/PF request message including outer
>> +	 *               transport message.
>> +	 */
>> +	u32 request_buf[GUC_CTB_MAX_DWORDS];
>> +
>> +	/**
>> +	 * @response_buf: buffer with VF/PF response message including outer
>> +	 *                transport message.
>> +	 */
>> +	u32 response_buf[GUC_CTB_MAX_DWORDS];
>> +
>> +	/**
>> +	 * @reply: status of the reply, 0 means that data pointed by the
>> +	 *         #response is valid.
>> +	 */
>> +	int reply;
>> +
>> +	/** @done: completion of the outgoing transaction. */
>> +	struct completion done;
>> +
>> +	/** @link: transaction list link */
>> +	struct list_head link;
>> +};
>> +
>> +static u32 prepare_pf2guc(u32 *msg, u32 target, u32 rid)
>> +{
>> +	msg[0] = FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
>> +		 FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
>> +		 FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION, XE_GUC_ACTION_PF2GUC_RELAY_TO_VF);
>> +	msg[1] = FIELD_PREP(PF2GUC_RELAY_TO_VF_REQUEST_MSG_1_VFID, target);
>> +	msg[2] = FIELD_PREP(PF2GUC_RELAY_TO_VF_REQUEST_MSG_2_RELAY_ID, rid);
>> +
>> +	return PF2GUC_RELAY_TO_VF_REQUEST_MSG_MIN_LEN;
>> +}
>> +
>> +static u32 prepare_vf2guc(u32 *msg, u32 rid)
>> +{
>> +	msg[0] = FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
>> +		 FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
>> +		 FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION, XE_GUC_ACTION_VF2GUC_RELAY_TO_PF);
>> +	msg[1] = FIELD_PREP(VF2GUC_RELAY_TO_PF_REQUEST_MSG_1_RELAY_ID, rid);
>> +
>> +	return VF2GUC_RELAY_TO_PF_REQUEST_MSG_MIN_LEN;
>> +}
>> +
>> +static struct relay_transaction *
>> +__relay_get_transaction(struct xe_guc_relay *relay, bool incoming, u32 remote, u32 rid,
>> +			const u32 *action, u32 action_len, u32 *resp, u32 resp_size)
>> +{
>> +	struct relay_transaction *txn;
>> +
>> +	relay_assert(relay, action_len >= GUC_RELAY_MSG_MIN_LEN);
>> +	relay_assert(relay, action_len <= GUC_RELAY_MSG_MAX_LEN);
>> +	relay_assert(relay, !(!!resp ^ !!resp_size));
>> +	relay_assert(relay, resp_size <= GUC_RELAY_MSG_MAX_LEN);
>> +	relay_assert(relay, resp_size == 0 || resp_size >= GUC_RELAY_MSG_MIN_LEN);
>> +
>> +	if (unlikely(!relay_is_ready(relay)))
>> +		return ERR_PTR(-ENODEV);
>> +
>> +	/*
>> +	 * For incoming requests we can't use GFP_KERNEL as those are delivered
>> +	 * with CTB lock held which is marked as used in the reclaim path.
>> +	 * Btw, that's one of the reason why we use mempool here!
>> +	 */
>> +	txn = mempool_alloc(&relay->pool, incoming ? GFP_ATOMIC : GFP_KERNEL);
>> +	if (!txn)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	txn->incoming = incoming;
>> +	txn->remote = remote;
>> +	txn->rid = rid;
>> +	txn->offset = remote ?
>> +		prepare_pf2guc(incoming ? txn->response_buf : txn->request_buf, remote, rid) :
>> +		prepare_vf2guc(incoming ? txn->response_buf : txn->request_buf, rid);
>> +
>> +	relay_assert(relay, txn->offset);
>> +	relay_assert(relay, txn->offset + GUC_RELAY_MSG_MAX_LEN <= ARRAY_SIZE(txn->request_buf));
>> +	relay_assert(relay, txn->offset + GUC_RELAY_MSG_MAX_LEN <= ARRAY_SIZE(txn->response_buf));
>> +
>> +	txn->request = txn->request_buf + txn->offset;
>> +	memcpy(&txn->request_buf[txn->offset], action, sizeof(u32) * action_len);
>> +	txn->request_len = action_len;
>> +
>> +	txn->response = resp ?: txn->response_buf + txn->offset;
>> +	txn->response_len = resp_size ?: GUC_RELAY_MSG_MAX_LEN;
>> +	txn->reply = -ENOMSG;
>> +	INIT_LIST_HEAD(&txn->link);
>> +	init_completion(&txn->done);
>> +
>> +	return txn;
>> +}
>> +
>> +static struct relay_transaction *
>> +relay_new_transaction(struct xe_guc_relay *relay, u32 target, const u32 *action, u32 len,
>> +		      u32 *resp, u32 resp_size)
>> +{
>> +	u32 rid = relay_get_next_rid(relay, target);
>> +
>> +	return __relay_get_transaction(relay, false, target, rid, action, len, resp, resp_size);
>> +}
>> +
>> +static struct relay_transaction *
>> +relay_new_incoming_transaction(struct xe_guc_relay *relay, u32 origin, u32 rid,
>> +			       const u32 *action, u32 len)
>> +{
>> +	return __relay_get_transaction(relay, true, origin, rid, action, len, NULL, 0);
>> +}
>> +
>> +static void relay_release_transaction(struct xe_guc_relay *relay, struct relay_transaction *txn)
>> +{
>> +	relay_assert(relay, list_empty(&txn->link));
>> +
>> +	txn->offset = 0;
>> +	txn->response = NULL;
>> +	txn->reply = -ESTALE;
>> +	mempool_free(txn, &relay->pool);
>> +}
>> +
>> +static int relay_send_transaction(struct xe_guc_relay *relay, struct relay_transaction *txn)
>> +{
>> +	u32 len = txn->incoming ? txn->response_len : txn->request_len;
>> +	u32 *buf = txn->incoming ? txn->response_buf : txn->request_buf;
>> +	u32 *msg = buf + txn->offset;
>> +	int ret;
>> +
>> +	relay_assert(relay, txn->offset);
>> +	relay_assert(relay, txn->offset + len <= GUC_CTB_MAX_DWORDS);
>> +	relay_assert(relay, len >= GUC_RELAY_MSG_MIN_LEN);
>> +	relay_assert(relay, len <= GUC_RELAY_MSG_MAX_LEN);
>> +
>> +	relay_debug(relay, "sending %s.%u to %u = %*ph\n",
>> +		    guc_hxg_type_to_string(FIELD_GET(GUC_HXG_MSG_0_TYPE, msg[0])),
>> +		    txn->rid, txn->remote, (int)sizeof(u32) * len, msg);
>> +
>> +	ret = xe_guc_ct_send_block(relay_to_ct(relay), buf, len + txn->offset);
>> +
>> +	if (unlikely(ret > 0)) {
>> +		relay_notice(relay, "Unexpected data=%d from GuC, wrong ABI?\n", ret);
>> +		ret = -EPROTO;
>> +	}
>> +	if (unlikely(ret < 0)) {
>> +		relay_notice(relay, "Failed to send %s.%x to GuC (%pe) %*ph ...\n",
>> +			     guc_hxg_type_to_string(FIELD_GET(GUC_HXG_MSG_0_TYPE, buf[0])),
>> +			     FIELD_GET(GUC_HXG_REQUEST_MSG_0_ACTION, buf[0]),
>> +			     ERR_PTR(ret), (int)sizeof(u32) * txn->offset, buf);
>> +		relay_notice(relay, "Failed to send %s.%u to %u (%pe) %*ph\n",
>> +			     guc_hxg_type_to_string(FIELD_GET(GUC_HXG_MSG_0_TYPE, msg[0])),
>> +			     txn->rid, txn->remote, ERR_PTR(ret), (int)sizeof(u32) * len, msg);
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +static void __fini_relay(struct drm_device *drm, void *arg)
>> +{
>> +	struct xe_guc_relay *relay = arg;
>> +
>> +	mempool_exit(&relay->pool);
>> +}
>> +
>> +/**
>> + * xe_guc_relay_init - Initialize a &xe_guc_relay
>> + * @relay: the &xe_guc_relay to initialize
>> + *
>> + * Initialize remaining members of &xe_guc_relay that may depend
>> + * on the SR-IOV mode.
>> + *
>> + * Return: 0 on success or a negative error code on failure.
>> + */
>> +int xe_guc_relay_init(struct xe_guc_relay *relay)
>> +{
>> +	const int XE_RELAY_MEMPOOL_MIN_NUM = 1;
>> +	struct xe_device *xe = relay_to_xe(relay);
>> +	int err;
>> +
>> +	relay_assert(relay, !relay_is_ready(relay));
>> +
>> +	if (!IS_SRIOV(xe))
>> +		return 0;
>> +
>> +	spin_lock_init(&relay->lock);
>> +	INIT_WORK(&relay->worker, relays_worker_fn);
>> +	INIT_LIST_HEAD(&relay->pending_relays);
>> +	INIT_LIST_HEAD(&relay->incoming_actions);
>> +
>> +	err = mempool_init_kmalloc_pool(&relay->pool, XE_RELAY_MEMPOOL_MIN_NUM +
>> +					relay_get_totalvfs(relay),
>> +					sizeof(struct relay_transaction));
>> +	if (err)
>> +		return err;
>> +
>> +	relay_debug(relay, "using mempool with %d elements\n", relay->pool.min_nr);
>> +
>> +	return drmm_add_action_or_reset(&xe->drm, __fini_relay, relay);
>> +}
>> +
>> +static u32 to_relay_error(int err)
>> +{
>> +	/* XXX: assume that relay errors match errno codes */
>> +	return err < 0 ? -err : GUC_RELAY_ERROR_UNDISCLOSED;
>> +}
>> +
>> +static int from_relay_error(u32 error)
>> +{
>> +	/* XXX: assume that relay errors match errno codes */
>> +	return error ? -error : -ENODATA;
>> +}
>> +
>> +static u32 sanitize_relay_error(u32 error)
>> +{
>> +	/* XXX TBD if generic error codes will be allowed */
>> +	if (!IS_ENABLED(CONFIG_DRM_XE_DEBUG))
>> +		error = GUC_RELAY_ERROR_UNDISCLOSED;
>> +	return error;
>> +}
>> +
>> +static u32 sanitize_relay_error_hint(u32 hint)
>> +{
>> +	/* XXX TBD if generic error codes will be allowed */
>> +	if (!IS_ENABLED(CONFIG_DRM_XE_DEBUG))
>> +		hint = 0;
>> +	return hint;
>> +}
>> +
>> +static u32 prepare_error_reply(u32 *msg, u32 error, u32 hint)
>> +{
>> +	msg[0] = FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
>> +		 FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_RESPONSE_FAILURE) |
>> +		 FIELD_PREP(GUC_HXG_FAILURE_MSG_0_HINT, hint) |
>> +		 FIELD_PREP(GUC_HXG_FAILURE_MSG_0_ERROR, error);
>> +
>> +	XE_WARN_ON(!FIELD_FIT(GUC_HXG_FAILURE_MSG_0_ERROR, error));
>> +	XE_WARN_ON(!FIELD_FIT(GUC_HXG_FAILURE_MSG_0_HINT, hint));
>> +
>> +	return GUC_HXG_FAILURE_MSG_LEN;
>> +}
>> +
>> +static int relay_send_message_and_wait(struct xe_guc_relay *relay,
>> +					struct relay_transaction *txn,
>> +					u32 *buf, u32 buf_size)
>> +{
>> +	unsigned long timeout = msecs_to_jiffies(RELAY_TIMEOUT_MSEC);
>> +	u32 *msg = &txn->request_buf[txn->offset];
>> +	u32 len = txn->request_len;
>> +	u32 type, action, data0;
>> +	int ret;
>> +	long n;
>> +
>> +	type = FIELD_GET(GUC_HXG_MSG_0_TYPE, msg[0]);
>> +	action = FIELD_GET(GUC_HXG_REQUEST_MSG_0_ACTION, msg[0]);
>> +	data0 = FIELD_GET(GUC_HXG_REQUEST_MSG_0_DATA0, msg[0]);
>> +
>> +	relay_debug(relay, "%s.%u to %u action %#x:%u\n",
>> +		    guc_hxg_type_to_string(type),
>> +		    txn->rid, txn->remote, action, data0);
>> +
>> +	/* list ordering does not need to match RID ordering */
>> +	spin_lock(&relay->lock);
>> +	list_add_tail(&txn->link, &relay->pending_relays);
>> +	spin_unlock(&relay->lock);
>> +
>> +resend:
>> +	ret = relay_send_transaction(relay, txn);
>> +	if (unlikely(ret < 0))
>> +		goto unlink;
>> +
>> +wait:
>> +	n = wait_for_completion_timeout(&txn->done, timeout);
>> +	if (unlikely(n == 0 && txn->reply)) {
>> +		ret = -ETIME;
>> +		goto unlink;
>> +	}
>> +
>> +	relay_debug(relay, "%u.%u reply %d after %u msec\n",
>> +		    txn->remote, txn->rid, txn->reply, jiffies_to_msecs(timeout - n));
>> +	if (unlikely(txn->reply)) {
>> +		reinit_completion(&txn->done);
>> +		if (txn->reply == -EAGAIN)
>> +			goto resend;
>> +		if (txn->reply == -EBUSY)
>> +			goto wait;
>> +		if (txn->reply > 0)
>> +			ret = from_relay_error(txn->reply);
>> +		else
>> +			ret = txn->reply;
>> +		goto unlink;
>> +	}
>> +
>> +	relay_debug(relay, "%u.%u response %*ph\n", txn->remote, txn->rid,
>> +		    (int)sizeof(u32) * txn->response_len, txn->response);
>> +	relay_assert(relay, txn->response_len >= GUC_RELAY_MSG_MIN_LEN);
>> +	ret = txn->response_len;
>> +
>> +unlink:
>> +	spin_lock(&relay->lock);
>> +	list_del_init(&txn->link);
>> +	spin_unlock(&relay->lock);
>> +
>> +	if (unlikely(ret < 0)) {
>> +		relay_notice(relay, "Unsuccessful %s.%u %#x:%u to %u (%pe) %*ph\n",
>> +			     guc_hxg_type_to_string(type), txn->rid,
>> +			     action, data0, txn->remote, ERR_PTR(ret),
>> +			     (int)sizeof(u32) * len, msg);
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +static int relay_send_to(struct xe_guc_relay *relay, u32 target,
>> +			 const u32 *msg, u32 len, u32 *buf, u32 buf_size)
>> +{
>> +	struct relay_transaction *txn;
>> +	int ret;
>> +
>> +	relay_assert(relay, len >= GUC_RELAY_MSG_MIN_LEN);
>> +	relay_assert(relay, len <= GUC_RELAY_MSG_MAX_LEN);
>> +	relay_assert(relay, FIELD_GET(GUC_HXG_MSG_0_ORIGIN, msg[0]) == GUC_HXG_ORIGIN_HOST);
>> +	relay_assert(relay, guc_hxg_type_is_action(FIELD_GET(GUC_HXG_MSG_0_TYPE, msg[0])));
>> +
>> +	if (unlikely(!relay_is_ready(relay)))
>> +		return -ENODEV;
>> +
>> +	txn = relay_new_transaction(relay, target, msg, len, buf, buf_size);
>> +	if (IS_ERR(txn))
>> +		return PTR_ERR(txn);
>> +
>> +	switch (FIELD_GET(GUC_HXG_MSG_0_TYPE, msg[0])) {
>> +	case GUC_HXG_TYPE_REQUEST:
>> +		ret = relay_send_message_and_wait(relay, txn, buf, buf_size);
>> +		break;
>> +	case GUC_HXG_TYPE_FAST_REQUEST:
>> +		relay_assert(relay, !GUC_HXG_TYPE_FAST_REQUEST);
>> +		fallthrough;
>> +	case GUC_HXG_TYPE_EVENT:
>> +		ret = relay_send_transaction(relay, txn);
>> +		break;
>> +	default:
>> +		ret = -EINVAL;
>> +		break;
>> +	}
>> +
>> +	relay_release_transaction(relay, txn);
>> +	return ret;
>> +}
>> +
>> +/**
>> + * xe_guc_relay_send_to_vf - Send a message to the VF.
>> + * @relay: the &xe_guc_relay which will send the message
>> + * @target: target VF number
>> + * @msg: request message to be sent
>> + * @len: length of the request message (in dwords, can't be 0)
>> + * @buf: placeholder for the response message
>> + * @buf_size: size of the response message placeholder (in dwords)
>> + *
>> + * This function can only be used by the driver running in the SR-IOV PF mode.
>> + *
>> + * Return: Non-negative response length (in dwords) or
>> + *         a negative error code on failure.
>> + */
>> +int xe_guc_relay_send_to_vf(struct xe_guc_relay *relay, u32 target,
>> +			    const u32 *msg, u32 len, u32 *buf, u32 buf_size)
>> +{
>> +	relay_assert(relay, IS_SRIOV_PF(relay_to_xe(relay)));
>> +
>> +	return relay_send_to(relay, target, msg, len, buf, buf_size);
>> +}
>> +
>> +/**
>> + * xe_guc_relay_send_to_pf - Send a message to the PF.
>> + * @relay: the &xe_guc_relay which will send the message
>> + * @msg: request message to be sent
>> + * @len: length of the message (in dwords, can't be 0)
>> + * @buf: placeholder for the response message
>> + * @buf_size: size of the response message placeholder (in dwords)
>> + *
>> + * This function can only be used by driver running in SR-IOV VF mode.
>> + *
>> + * Return: Non-negative response length (in dwords) or
>> + *         a negative error code on failure.
>> + */
>> +int xe_guc_relay_send_to_pf(struct xe_guc_relay *relay,
>> +			    const u32 *msg, u32 len, u32 *buf, u32 buf_size)
> 
> What's the reason you didn't give an assert for VF here ?

from the GuC POV, a PF is also treated as a VF (VF0) and we take
advantage of it in some live/kunit relay tests executed on the PF which
will send relay messages to itself (VF0 -> PF and PF -> VF0)

> 
>> +{
>> +	return relay_send_to(relay, PFID, msg, len, buf, buf_size);
>> +}
>> +
>> +static int relay_handle_reply(struct xe_guc_relay *relay, u32 origin,
>> +			      u32 rid, int reply, const u32 *msg, u32 len)
>> +{
>> +	struct relay_transaction *pending;
>> +	int err = -ESRCH;
>> +
>> +	spin_lock(&relay->lock);
>> +	list_for_each_entry(pending, &relay->pending_relays, link) {
>> +		if (pending->remote != origin || pending->rid != rid) {
>> +			relay_debug(relay, "%u.%u still awaits response\n",
>> +				    pending->remote, pending->rid);
>> +			continue;
>> +		}
>> +		err = 0; /* found! */
>> +		if (reply == 0) {
>> +			if (len > pending->response_len) {
>> +				reply = -ENOBUFS;
>> +				err = -ENOBUFS;
>> +			} else {
>> +				memcpy(pending->response, msg, 4 * len);
>> +				pending->response_len = len;
>> +			}
>> +		}
>> +		pending->reply = reply;
>> +		complete_all(&pending->done);
>> +		break;
>> +	}
>> +	spin_unlock(&relay->lock);
>> +
>> +	return err;
>> +}
>> +
>> +static int relay_handle_failure(struct xe_guc_relay *relay, u32 origin,
>> +				u32 rid, const u32 *msg, u32 len)
>> +{
>> +	int error = FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, msg[0]);
>> +	u32 hint __maybe_unused = FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, msg[0]);
>> +
>> +	relay_assert(relay, len);
>> +	relay_debug(relay, "%u.%u error %#x (%pe) hint %u debug %*ph\n",
>> +		    origin, rid, error, ERR_PTR(-error), hint, 4 * (len - 1), msg + 1);
>> +
>> +	return relay_handle_reply(relay, origin, rid, error ?: -EREMOTEIO, NULL, 0);
>> +}
>> +
>> +static int relay_testloop_action_handler(struct xe_guc_relay *relay, u32 origin,
>> +					 const u32 *msg, u32 len, u32 *response, u32 size)
>> +{
>> +	static ktime_t last_reply = 0;
>> +	u32 type = FIELD_GET(GUC_HXG_MSG_0_TYPE, msg[0]);
>> +	u32 action = FIELD_GET(GUC_HXG_REQUEST_MSG_0_ACTION, msg[0]);
>> +	u32 opode = FIELD_GET(GUC_HXG_REQUEST_MSG_0_DATA0, msg[0]);

oops

> 
> I guess you meant the name of the variable "opcode"
> 
>> +	ktime_t now = ktime_get();
>> +	bool busy;
>> +	int ret;
>> +
>> +	relay_assert(relay, guc_hxg_type_is_action(type));
>> +	relay_assert(relay, action == GUC_RELAY_ACTION_VFXPF_TESTLOOP);
>> +
>> +	if (!IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV))
>> +		return -ECONNREFUSED;
>> +
>> +	if (!last_reply)
>> +		last_reply = now;
>> +	busy = ktime_before(now, ktime_add_ms(last_reply, 2 * RELAY_TIMEOUT_MSEC));
>> +	if (!busy)
>> +		last_reply = now;
>> +
>> +	switch (opode) {
>> +	case VFXPF_TESTLOOP_OPCODE_NOP:
>> +		if (type == GUC_HXG_TYPE_EVENT)
>> +			return 0;
>> +		return guc_hxg_msg_encode_success(response, 0);
>> +	case VFXPF_TESTLOOP_OPCODE_BUSY:
>> +		if (type == GUC_HXG_TYPE_EVENT)
>> +			return -EPROTO;
>> +		msleep(RELAY_TIMEOUT_MSEC / 8);
>> +		if (busy)
>> +			return -EINPROGRESS;
>> +		return guc_hxg_msg_encode_success(response, 0);
>> +	case VFXPF_TESTLOOP_OPCODE_RETRY:
>> +		if (type == GUC_HXG_TYPE_EVENT)
>> +			return -EPROTO;
>> +		msleep(RELAY_TIMEOUT_MSEC / 8);
>> +		if (busy)
>> +			return guc_hxg_msg_encode_retry(response, 0);
>> +		return guc_hxg_msg_encode_success(response, 0);
>> +	case VFXPF_TESTLOOP_OPCODE_ECHO:
>> +		if (type == GUC_HXG_TYPE_EVENT)
>> +			return -EPROTO;
>> +		if (size < len)
>> +			return -ENOBUFS;
>> +		ret = guc_hxg_msg_encode_success(response, len);
>> +		memcpy(response + ret, msg + ret, (len - ret) * sizeof(u32));
>> +		return len;
>> +	case VFXPF_TESTLOOP_OPCODE_FAIL:
>> +		return -EHWPOISON;
>> +	default:
>> +		break;
>> +	}
>> +
>> +	relay_notice(relay, "Unexpected action %#x opcode %#x\n", action, opode);
>> +	return -EBADRQC;
>> +}
>> +
>> +static int relay_action_handler(struct xe_guc_relay *relay, u32 origin,
>> +				const u32 *msg, u32 len, u32 *response, u32 size)
>> +{
>> +	u32 type;
>> +	int ret;
>> +
>> +	relay_assert(relay, len >= GUC_HXG_MSG_MIN_LEN);
>> +
>> +	if (FIELD_GET(GUC_HXG_REQUEST_MSG_0_ACTION, msg[0]) == GUC_RELAY_ACTION_VFXPF_TESTLOOP)
>> +		return relay_testloop_action_handler(relay, origin, msg, len, response, size);
>> +
> 
> From what I understand here we will be adding more actions.
> Wouldn't it be better to make a switch statement here for the future?

Actually I was planning to implement specific action handlers in
separate functions/files as there will PF specific actions/handlers and
VF specific actions/handlers. Only VFXPF_TESTLOOP is different as it can
be used for testing on both PF and VF sides.

> 
> 
>> +	type = FIELD_GET(GUC_HXG_MSG_0_TYPE, msg[0]);
>> +
>> +	/* XXX: PF services will be added later */
>> +	ret = -EOPNOTSUPP;
>> +
>> +	if (type == GUC_HXG_TYPE_EVENT)
>> +		relay_assert(relay, ret <= 0);
>> +
>> +	return ret;
>> +}
>> +
>> +static struct relay_transaction *relay_dequeue_transaction(struct xe_guc_relay *relay)
>> +{
>> +	struct relay_transaction *txn;
>> +
>> +	spin_lock(&relay->lock);
>> +	txn = list_first_entry_or_null(&relay->incoming_actions, struct relay_transaction, link);
>> +	if (txn)
>> +		list_del_init(&txn->link);
>> +	spin_unlock(&relay->lock);
>> +
>> +	return txn;
>> +}
>> +
>> +static void relay_process_incoming_action(struct xe_guc_relay *relay)
>> +{
>> +	struct relay_transaction *txn;
>> +	bool again = false;
>> +	u32 type;
>> +	int ret;
>> +
>> +	txn = relay_dequeue_transaction(relay);
>> +	if (!txn)
>> +		return;
>> +
>> +	type = FIELD_GET(GUC_HXG_MSG_0_TYPE, txn->request_buf[txn->offset]);
>> +
>> +	ret = relay_action_handler(relay, txn->remote,
>> +				   txn->request_buf + txn->offset, txn->request_len,
>> +				   txn->response_buf + txn->offset,
>> +				   ARRAY_SIZE(txn->response_buf) - txn->offset);
>> +
>> +	if (ret == -EINPROGRESS) {
>> +		again = true;
>> +		ret = guc_hxg_msg_encode_busy(txn->response_buf + txn->offset, 0);
>> +	}
>> +
>> +	if (ret > 0) {
>> +		txn->response_len = ret;
>> +		ret = relay_send_transaction(relay, txn);
>> +	}
>> +
>> +	if (ret < 0) {
>> +		u32 error = to_relay_error(ret);
>> +
>> +		relay_notice(relay, "Failed to handle %s.%u from %u (%pe) %*ph\n",
>> +			     guc_hxg_type_to_string(type), txn->rid, txn->remote,
>> +			     ERR_PTR(ret), 4 * txn->request_len, txn->request_buf + txn->offset);
>> +
>> +
>> +		txn->response_len = prepare_error_reply(txn->response_buf + txn->offset,
>> +							txn->remote ?
>> +							sanitize_relay_error(error) : error,
>> +							txn->remote ?
>> +							sanitize_relay_error_hint(-ret) : -ret);
>> +		ret = relay_send_transaction(relay, txn);
>> +		again = false;
>> +	}
>> +
>> +	if (again) {
>> +		spin_lock(&relay->lock);
>> +		list_add(&txn->link, &relay->incoming_actions);
>> +		spin_unlock(&relay->lock);
>> +		return;
>> +	}
>> +
>> +	if (unlikely(ret < 0))
>> +		relay_notice(relay, "Failed to process action.%u (%pe) %*ph\n",
>> +			     txn->rid, ERR_PTR(ret), 4 * txn->request_len,
>> +			     txn->request_buf + txn->offset);
>> +
>> +	relay_release_transaction(relay, txn);
>> +}
>> +
>> +static bool relay_needs_worker(struct xe_guc_relay *relay)
>> +{
>> +	return !list_empty(&relay->incoming_actions);
>> +}
>> +
>> +static void relay_kick_worker(struct xe_guc_relay *relay)
>> +{
>> +	queue_work(relay_to_xe(relay)->sriov.wq, &relay->worker);
>> +}
>> +
>> +static void relays_worker_fn(struct work_struct *w)
>> +{
>> +	struct xe_guc_relay *relay = container_of(w, struct xe_guc_relay, worker);
>> +
>> +	relay_process_incoming_action(relay);
>> +
>> +	if (relay_needs_worker(relay))
>> +		relay_kick_worker(relay);
>> +}
>> +
>> +static int relay_queue_action_msg(struct xe_guc_relay *relay, u32 origin, u32 rid,
>> +				  const u32 *msg, u32 len)
>> +{
>> +	struct relay_transaction *txn;
>> +
>> +	txn = relay_new_incoming_transaction(relay, origin, rid, msg, len);
>> +	if (IS_ERR(txn))
>> +		return PTR_ERR(txn);
>> +
>> +	spin_lock(&relay->lock);
>> +	list_add_tail(&txn->link, &relay->incoming_actions);
>> +	spin_unlock(&relay->lock);
>> +
>> +	relay_kick_worker(relay);
>> +	return 0;
>> +}
>> +
>> +static int relay_process_msg(struct xe_guc_relay *relay, u32 origin, u32 rid,
>> +			     const u32 *msg, u32 len)
>> +{
>> +	u32 type;
>> +	int err;
>> +
>> +	if (unlikely(len < GUC_HXG_MSG_MIN_LEN))
>> +		return -EPROTO;
>> +
>> +	if (FIELD_GET(GUC_HXG_MSG_0_ORIGIN, msg[0]) != GUC_HXG_ORIGIN_HOST)
>> +		return -EPROTO;
>> +
>> +	type = FIELD_GET(GUC_HXG_MSG_0_TYPE, msg[0]);
>> +	relay_debug(relay, "received %s.%u from %u = %*ph\n",
>> +		    guc_hxg_type_to_string(type), rid, origin, 4 * len, msg);
>> +
>> +	switch (type) {
>> +	case GUC_HXG_TYPE_REQUEST:
>> +	case GUC_HXG_TYPE_FAST_REQUEST:
>> +	case GUC_HXG_TYPE_EVENT:
>> +		err = relay_queue_action_msg(relay, origin, rid, msg, len);
>> +		break;
>> +	case GUC_HXG_TYPE_RESPONSE_SUCCESS:
>> +		err = relay_handle_reply(relay, origin, rid, 0, msg, len);
>> +		break;
>> +	case GUC_HXG_TYPE_NO_RESPONSE_BUSY:
>> +		err = relay_handle_reply(relay, origin, rid, -EBUSY, NULL, 0);
>> +		break;
>> +	case GUC_HXG_TYPE_NO_RESPONSE_RETRY:
>> +		err = relay_handle_reply(relay, origin, rid, -EAGAIN, NULL, 0);
>> +		break;
>> +	case GUC_HXG_TYPE_RESPONSE_FAILURE:
>> +		err = relay_handle_failure(relay, origin, rid, msg, len);
>> +		break;
>> +	default:
>> +		err = -EBADRQC;
>> +	}
>> +
>> +	if (unlikely(err))
>> +		relay_notice(relay, "Failed to process %s.%u from %u (%pe) %*ph\n",
>> +			     guc_hxg_type_to_string(type), rid, origin,
>> +			     ERR_PTR(err), 4 * len, msg);
>> +
>> +	return err;
>> +}
>> +
>> +/**
>> + * xe_guc_relay_process_guc2vf - Handle relay notification message from the GuC.
>> + * @relay: the &xe_guc_relay which will handle the message
>> + * @msg: message to be handled
>> + * @len: length of the message (in dwords)
>> + *
>> + * This function will handle relay messages received from the GuC.
>> + *
>> + * This function is can only be used if driver is running in SR-IOV mode.
> 
> I understand that this function is dedicated to VF. From this documentation
> it seems that the function can also be used by PF.
> This was your idea or is the word VFs missing here ?
> I would also suggest using an appropriate assert in the code.

as explained above, in some scenarios we will expect GUC2VF on PF side,
so we can't just check for IS_SRIOV_VF, we might need to use also
CONFIG_DRM_XE_KUNIT_TEST, but yes, maybe it will cleaner

btw, we should use "if" instead "assert" as this G2H handler and we
shouldn't trust GUC too much

> 
>> + *
>> + * Return: 0 on success or a negative error code on failure.
>> + */
>> +int xe_guc_relay_process_guc2vf(struct xe_guc_relay *relay, const u32 *msg, u32 len)
>> +{
>> +	u32 rid;
>> +
>> +	relay_assert(relay, len >= GUC_HXG_MSG_MIN_LEN);
>> +	relay_assert(relay, FIELD_GET(GUC_HXG_MSG_0_ORIGIN, msg[0]) == GUC_HXG_ORIGIN_GUC);
>> +	relay_assert(relay, FIELD_GET(GUC_HXG_MSG_0_TYPE, msg[0]) == GUC_HXG_TYPE_EVENT);
>> +	relay_assert(relay, FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, msg[0]) ==
>> +		     XE_GUC_ACTION_GUC2VF_RELAY_FROM_PF);
>> +
>> +	if (unlikely(!relay_is_ready(relay)))
>> +		return -ENODEV;
>> +
>> +	if (unlikely(len < GUC2VF_RELAY_FROM_PF_EVENT_MSG_MIN_LEN))
>> +		return -EPROTO;
>> +
>> +	if (unlikely(len > GUC2VF_RELAY_FROM_PF_EVENT_MSG_MAX_LEN))
>> +		return -EMSGSIZE;
>> +
>> +	if (unlikely(FIELD_GET(GUC_HXG_EVENT_MSG_0_DATA0, msg[0])))
>> +		return -EPFNOSUPPORT;
>> +
>> +	rid = FIELD_GET(GUC2VF_RELAY_FROM_PF_EVENT_MSG_1_RELAY_ID, msg[1]);
>> +
>> +	return relay_process_msg(relay, PFID, rid,
>> +				 msg + GUC2VF_RELAY_FROM_PF_EVENT_MSG_MIN_LEN,
>> +				 len - GUC2VF_RELAY_FROM_PF_EVENT_MSG_MIN_LEN);
>> +}
>> +
>> +#ifdef CONFIG_PCI_IOV
>> +/**
>> + * xe_guc_relay_process_guc2pf - Handle relay notification message from the GuC.
>> + * @relay: the &xe_guc_relay which will handle the message
>> + * @msg: message to be handled
>> + * @len: length of the message (in dwords)
>> + *
>> + * This function will handle relay messages received from the GuC.
>> + *
>> + * This function can only be used if driver is running in SR-IOV PF mode.
>> + *
>> + * Return: 0 on success or a negative error code on failure.
>> + */
>> +int xe_guc_relay_process_guc2pf(struct xe_guc_relay *relay, const u32 *msg, u32 len)
>> +{
>> +	struct xe_gt *gt = relay_to_gt(relay);
>> +	u32 origin, rid;
>> +	int err;
>> +
>> +	relay_assert(relay, len >= GUC_HXG_EVENT_MSG_MIN_LEN);
>> +	relay_assert(relay, FIELD_GET(GUC_HXG_MSG_0_ORIGIN, msg[0]) == GUC_HXG_ORIGIN_GUC);
>> +	relay_assert(relay, FIELD_GET(GUC_HXG_MSG_0_TYPE, msg[0]) == GUC_HXG_TYPE_EVENT);
>> +	relay_assert(relay, FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, msg[0]) ==
>> +		     XE_GUC_ACTION_GUC2PF_RELAY_FROM_VF);
>> +
>> +	if (unlikely(!relay_is_ready(relay)))
>> +		return -ENODEV;
>> +
>> +	if (unlikely(!xe_device_is_sriov_pf(gt_to_xe(gt))))
>> +		return -EPERM;
>> +
>> +	if (unlikely(len < GUC2PF_RELAY_FROM_VF_EVENT_MSG_MIN_LEN))
>> +		return -EPROTO;
>> +
>> +	if (unlikely(len > GUC2PF_RELAY_FROM_VF_EVENT_MSG_MAX_LEN))
>> +		return -EMSGSIZE;
>> +
>> +	if (unlikely(FIELD_GET(GUC_HXG_EVENT_MSG_0_DATA0, msg[0])))
>> +		return -EPFNOSUPPORT;
>> +
>> +	origin = FIELD_GET(GUC2PF_RELAY_FROM_VF_EVENT_MSG_1_VFID, msg[1]);
>> +	rid = FIELD_GET(GUC2PF_RELAY_FROM_VF_EVENT_MSG_2_RELAY_ID, msg[2]);
>> +
>> +	if (unlikely(origin > relay_get_totalvfs(relay)))
>> +		return -ENOENT;
>> +
>> +	err = relay_process_msg(relay, origin, rid,
>> +				msg + GUC2PF_RELAY_FROM_VF_EVENT_MSG_MIN_LEN,
>> +				len - GUC2PF_RELAY_FROM_VF_EVENT_MSG_MIN_LEN);
> 
> Return can be used already here, the one below is not needed.

we will be adding some monitoring code here shortly (to catch improper
activity from the VF drivers) so I would keep it as-is to minimize diff

> 
>> +
>> +	return err;
>> +}
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_guc_relay.h b/drivers/gpu/drm/xe/xe_guc_relay.h
>> new file mode 100644
>> index 000000000000..e6a251be34a1
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_guc_relay.h
>> @@ -0,0 +1,32 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_GUC_RELAY_H_
>> +#define _XE_GUC_RELAY_H_
>> +
>> +#include <linux/types.h>
>> +#include <linux/errno.h>
>> +
>> +struct xe_guc_relay;
>> +
>> +int xe_guc_relay_init(struct xe_guc_relay *relay);
>> +
>> +int xe_guc_relay_send_to_vf(struct xe_guc_relay *relay, u32 target,
>> +			    const u32 *msg, u32 len, u32 *buf, u32 buf_size);
>> +int xe_guc_relay_send_to_pf(struct xe_guc_relay *relay,
>> +			    const u32 *msg, u32 len, u32 *buf, u32 buf_size);
>> +
>> +int xe_guc_relay_process_guc2vf(struct xe_guc_relay *relay, const u32 *msg, u32 len);
>> +
>> +#ifdef CONFIG_PCI_IOV
>> +int xe_guc_relay_process_guc2pf(struct xe_guc_relay *relay, const u32 *msg, u32 len);
>> +#else
>> +static inline int xe_guc_relay_process_guc2pf(struct xe_guc_relay *relay, const u32 *msg, u32 len)
>> +{
>> +	return -ENODEV;
>> +}
>> +#endif
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_guc_relay_types.h b/drivers/gpu/drm/xe/xe_guc_relay_types.h
>> new file mode 100644
>> index 000000000000..600e10cd727e
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_guc_relay_types.h
>> @@ -0,0 +1,36 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_GUC_RELAY_TYPES_H_
>> +#define _XE_GUC_RELAY_TYPES_H_
>> +
>> +#include <linux/mempool.h>
>> +#include <linux/spinlock.h>
>> +#include <linux/workqueue.h>
>> +
>> +/**
>> + * struct xe_guc_relay - Data used by the VF-PF Relay Communication over GuC.
>> + */
>> +struct xe_guc_relay {
>> +	/**@lock: protects all internal data. */
>> +	spinlock_t lock;
>> +
>> +	/** @worker: dispathes incoming action messages. */
> 
> typo: dispatches
> 
> 
>> +	struct work_struct worker;
>> +
>> +	/** @pending_relays: list of sent requests that await a response. */
>> +	struct list_head pending_relays;
>> +
>> +	/** @incoming_actions: list of incoming relay action messages to process. */
>> +	struct list_head incoming_actions;
>> +
>> +	/** @pool: pool of the relay message buffers. */
>> +	mempool_t pool;
>> +
>> +	/** @last_rid: last Relay-ID used while sending a message. */
>> +	u32 last_rid;
>> +};
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
>> index 16de203c62a7..dc6059de669c 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_types.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_types.h
>> @@ -15,6 +15,7 @@
>>  #include "xe_guc_fwif.h"
>>  #include "xe_guc_log_types.h"
>>  #include "xe_guc_pc_types.h"
>> +#include "xe_guc_relay_types.h"
>>  #include "xe_uc_fw_types.h"
>>  
>>  /**
>> @@ -85,6 +86,9 @@ struct xe_guc {
>>  		u32 size;
>>  	} hwconfig;
>>  
>> +	/** @relay: GuC Relay Communication used in SR-IOV */
>> +	struct xe_guc_relay relay;
>> +
>>  	/**
>>  	 * @notify_reg: Register which is written to notify GuC of H2G messages
>>  	 */
> 
> With fixes:
> Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> 
>> -- 
>> 2.25.1
>>
> 
