Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E9D6C54E58
	for <intel-xe@archiver.kernel.org>; Wed, 13 Mar 2024 22:09:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE42E10EED2;
	Wed, 13 Mar 2024 22:09:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NaMnZKfK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D77A010EE2F
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Mar 2024 22:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710367780; x=1741903780;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=VOm2ypKkk3GxLf3VnIoNNH687UnY61vGgUL7rQztEJA=;
 b=NaMnZKfKL++38DtBY8oQOHyyEKGi8PK9u0USmJ8SZM1zgpXzts6YcYI3
 MYcZ/AtTPOHg+ac4axRMnYBu9hPxMb3DWKIZ/GX++CzqMyanmjLQQIv6S
 vtZbyYXXRaGfZWczG4Rq5dk9bUlPdp3eHcyJ8lsnJEF1D2eWgk0HD0uG3
 ZT94osa7+1acmGplQQ7UgkXkxVg/En2J07np3gfXyI/68LcWkWSVKDFXm
 wc53xny20AA68WP56UrB49MILqPFIT5lNK6l8fVBjkeaYlCFimFuSmFlK
 KtWzgbW4lJoBYqY14eNIPoksWOEVCUUFEqbtjZ1+h7QreX7dcTUwVsmvC Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5771564"
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; 
   d="scan'208";a="5771564"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 15:09:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; d="scan'208";a="12486937"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa006.jf.intel.com with ESMTP; 13 Mar 2024 15:09:36 -0700
Received: from [10.249.141.133] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.141.133])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 438604201D;
 Wed, 13 Mar 2024 22:09:34 +0000 (GMT)
Message-ID: <c7d6fdfd-8fa4-4c8c-b055-532b7957a2c2@intel.com>
Date: Wed, 13 Mar 2024 23:09:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/xe/guc: Introduce GuC context ID Manager
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20240110174622.409-1-michal.wajdeczko@intel.com>
 <20240110174622.409-3-michal.wajdeczko@intel.com>
 <Za3mnglPKG3zZw0T@DUT025-TGLU.fm.intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <Za3mnglPKG3zZw0T@DUT025-TGLU.fm.intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 22.01.2024 04:53, Matthew Brost wrote:
> On Wed, Jan 10, 2024 at 06:46:20PM +0100, Michal Wajdeczko wrote:
>> While we are already managing GuC IDs directly in GuC submission
>> code, using bitmap() for MLRC and ida() for SLRC, this code can't
>> be easily extended to meet additional requirements for SR-IOV use
>> cases, like limited number of IDs available on VFs, or ID range
>> reservation for provisioning VFs by the PF.
>>
>> Add a separate component for managing GuC IDs, that will replace
>> existing ID management. Start with bitmap() based implementation
>> that could be optimized later based on perf data.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> ---
>>  drivers/gpu/drm/xe/Makefile        |   1 +
>>  drivers/gpu/drm/xe/xe_guc_id_mgr.c | 288 +++++++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_guc_id_mgr.h |  22 +++
>>  drivers/gpu/drm/xe/xe_guc_types.h  |  17 ++
>>  4 files changed, 328 insertions(+)
>>  create mode 100644 drivers/gpu/drm/xe/xe_guc_id_mgr.c
>>  create mode 100644 drivers/gpu/drm/xe/xe_guc_id_mgr.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index f3495d0e701c..1e804b155063 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -96,6 +96,7 @@ xe-y += xe_bb.o \
>>  	xe_guc_db_mgr.o \
>>  	xe_guc_debugfs.o \
>>  	xe_guc_hwconfig.o \
>> +	xe_guc_id_mgr.o \
>>  	xe_guc_log.o \
>>  	xe_guc_pc.o \
>>  	xe_guc_submit.o \
>> diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.c b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
>> new file mode 100644
>> index 000000000000..a6aacf92a28e
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
>> @@ -0,0 +1,288 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#include <linux/bitmap.h>
>> +#include <linux/mutex.h>
>> +
>> +#include <drm/drm_managed.h>
>> +
>> +#include "xe_assert.h"
>> +#include "xe_gt_printk.h"
>> +#include "xe_guc.h"
>> +#include "xe_guc_id_mgr.h"
>> +#include "xe_guc_types.h"
>> +
>> +static struct xe_guc *idm_to_guc(struct xe_guc_id_mgr *idm)
>> +{
>> +	return container_of(idm, struct xe_guc, idm);
>> +}
>> +
>> +static struct xe_gt *idm_to_gt(struct xe_guc_id_mgr *idm)
>> +{
>> +	return guc_to_gt(idm_to_guc(idm));
>> +}
>> +
>> +static struct xe_device *idm_to_xe(struct xe_guc_id_mgr *idm)
>> +{
>> +	return gt_to_xe(idm_to_gt(idm));
>> +}
>> +
>> +#define idm_assert(_idm, _cond)		xe_gt_assert(idm_to_gt(_idm), _cond)
>> +#define idm_mutex(_idm)			(&idm_to_guc(_idm)->submission_state.lock)
>> +
>> +static void idm_print_locked(struct xe_guc_id_mgr *idm, struct drm_printer *p, int indent);
>> +
>> +static void __fini_idm(struct drm_device *drm, void *arg)
>> +{
>> +	struct xe_guc_id_mgr *idm = arg;
>> +	unsigned int weight;
>> +
>> +	mutex_lock(idm_mutex(idm));
>> +
>> +	weight = bitmap_weight(idm->bitmap, idm->total);
>> +	idm_assert(idm, idm->used == 0);
>> +	idm_assert(idm, idm->used == weight);
> 
> I find this confusing.
> 
> How about:
> 	idm_assert(idm, weight == 0);
> 
>> +	if (weight) {
>> +		struct drm_printer p = xe_gt_info_printer(idm_to_gt(idm));
>> +
>> +		xe_gt_err(idm_to_gt(idm), "GUC ID manager unclean (%u/%u)\n",
>> +			  weight, idm->total);
>> +		idm_print_locked(idm, &p, 1);
>> +	}
> 
> Isn't the above assert plus these error messages a bit redunant?

will drop assert and will do a check only if CONFIG_DRM_XE_DEBUG=y

> 
>> +
>> +	bitmap_free(idm->bitmap);
>> +	idm->bitmap = NULL;
>> +	idm->total = 0;
>> +	idm->used = 0;
>> +
>> +	mutex_unlock(idm_mutex(idm));
>> +}
>> +
>> +/**
>> + * xe_guc_id_mgr_init() - Initialize GuC context ID Manager.
>> + * @idm: the &xe_guc_id_mgr to initialize
>> + * @limit: number of IDs to manage
>> + *
>> + * The bare-metal or PF driver can pass ~0 as &limit to indicate that all
>> + * context IDs supported by the GuC firmware are available for use.
>> + *
>> + * Only VF drivers will have to provide explicit number of context IDs
>> + * that they can use.
>> + *
>> + * Return: 0 on success or a negative error code on failure.
>> + */
>> +int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int limit)
>> +{
>> +	int ret;
>> +
>> +	idm_assert(idm, !idm->bitmap);
>> +	idm_assert(idm, !idm->total);
>> +	idm_assert(idm, !idm->used);
>> +
>> +	if (limit == ~0)
>> +		limit = GUC_ID_MAX;
>> +	else if (limit > GUC_ID_MAX)
>> +		return -ERANGE;
>> +	else if (!limit)
>> +		return -EINVAL;
>> +
>> +	idm->bitmap = bitmap_zalloc(limit, GFP_KERNEL);
>> +	if (!idm->bitmap)
>> +		return -ENOMEM;
>> +	idm->total = limit;
>> +
>> +	ret = drmm_add_action_or_reset(&idm_to_xe(idm)->drm, __fini_idm, idm);
>> +	if (ret)
>> +		return ret;
>> +
>> +	xe_gt_info(idm_to_gt(idm), "using %u GUC ID(s)\n", idm->total);
>> +	return 0;
>> +}
>> +
>> +static unsigned int find_last_zero_area(unsigned long *bitmap,
>> +					unsigned int total,
>> +					unsigned int count)
>> +{
>> +	unsigned int found = total;
>> +	unsigned int rs, re, range;
>> +
>> +	for_each_clear_bitrange(rs, re, bitmap, total) {
>> +		range = re - rs;
>> +		if (range < count)
>> +			continue;
>> +		found = rs + (range - count);
>> +	}
>> +	return found;
>> +}
>> +
>> +static int idm_reserve_chunk_locked(struct xe_guc_id_mgr *idm,
>> +				    unsigned int count, int order, unsigned int spare)
>> +{
> 
> I'm confused by having both count and order arguments.

me too, but I was trying to follow existing guc submission code that was
using "order", in v2 there will be just "count"

> 
>> +	int id;
>> +
>> +	idm_assert(idm, count);
>> +	idm_assert(idm, count == 1 || order == 0);
>> +	idm_assert(idm, spare == 0 || order == 0);
>> +	lockdep_assert_held(idm_mutex(idm));
>> +
>> +	if (!idm->total)
>> +		return -ENODATA;
>> +
>> +	if (spare) {
>> +		idm_assert(idm, order == 0);
> 
> So order isn't used here?
> 
> Also do we need idm_assert(idm, spare == 0 || order == 0); &&
> idm_assert(idm, order == 0); here?
> 
>> +
>> +		/*
>> +		 * For IDs reservations (used on PF for VFs) we want to make
>> +		 * sure there will be at least 'spare' available for the PF.
>> +		 */
>> +		if (idm->used + count + spare > idm->total)
>> +			return -EDQUOT;
>> +		/*
>> +		 * And we want to place them as close to the end as possible.
>> +		 */
>> +		id = find_last_zero_area(idm->bitmap, idm->total, count);
> 
> Shouldn't we start this search at spare?

we don't want to make any assumption where IDs for the PF was or will be
allocated, we only care about how many will be available (they could be
even non-contiguous)

> 
>> +		if (id >= idm->total)
>> +			return -ENOSPC;
>> +		bitmap_set(idm->bitmap, id, count);
>> +	} else {
>> +		idm_assert(idm, count == 1);
>> +
> 
> And count isn't used here?
> 
> Can we have we just have count or order (i.e. not both)?

yes

> 
>> +		id = bitmap_find_free_region(idm->bitmap, idm->total, order);
>> +		if (id < 0)
>> +			return -ENOSPC;
>> +		count <<= order;
>> +	}
>> +
>> +	idm->used += count;
>> +	return id;
>> +}
>> +
>> +static void idm_release_chunk_locked(struct xe_guc_id_mgr *idm,
>> +				     unsigned int start, unsigned int count)
>> +{
>> +	idm_assert(idm, count);
>> +	idm_assert(idm, count <= idm->used);
>> +	idm_assert(idm, start < idm->total);
>> +	idm_assert(idm, start + count <= idm->total);
>> +	lockdep_assert_held(idm_mutex(idm));
>> +
>> +	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
>> +		unsigned int n;
>> +
>> +		for (n = 0; n < count; n++)
>> +			idm_assert(idm, test_bit(start + n, idm->bitmap));
>> +	}
>> +	bitmap_clear(idm->bitmap, start, count);
>> +	idm->used -= count;
>> +}
>> +
>> +/**
>> + * xe_guc_id_mgr_reserve_locked() - Reserve a GuC context ID or IDs.
>> + * @idm: the &xe_guc_id_mgr
>> + * @order: 2^order of IDs to allocate
>> + *
>> + * This function expects that submission lock is already taken.
>> + *
>> + * Return: ID of allocated GuC context or a negative error code on failure.
>> + */
>> +int xe_guc_id_mgr_reserve_locked(struct xe_guc_id_mgr *idm, int order)
>> +{
>> +	return idm_reserve_chunk_locked(idm, 1, order, 0);
> 
> Same comment as above - can we pick either count or order as an
> argument?
> 
>> +}
>> +
>> +/**
>> + * xe_guc_id_mgr_release_locked() - Release a GuC context ID or IDs.
>> + * @idm: the &xe_guc_id_mgr
>> + * @id: the GuC context ID to release
>> + * @order: 2^order of IDs to release
>> + *
>> + * This function expects that submission lock is already taken.
>> + */
>> +void xe_guc_id_mgr_release_locked(struct xe_guc_id_mgr *idm, unsigned int id, int order)
>> +{
>> +	return idm_release_chunk_locked(idm, id, 1 << order);
>> +}
>> +
>> +/**
>> + * xe_guc_id_mgr_reserve_range() - Reserve a range of GuC context IDs.
>> + * @idm: the &xe_guc_id_mgr
>> + * @count: number of GuC context IDs to reserve (can't be 0)
>> + * @spare: number of GuC context IDs to keep available (can't be 0)
> 
> s/spare/reserved?

to avoid clash with function name, will rename this param to "retain"

> 
>> + *
>> + * This function is dedicated for the for use by the PF driver which expects
>> + * that allocated range for the VF will be contiguous and that there will be
>> + * at least &spare IDs still available for the PF use after this reservation.
> 
> Just can give an example of the argument values a PF would call this
> with so I make sure I understand the use case for this?

in addition to the primary requirement to reserve a contiguous range of
GuC IDs that will be later assigned for use by the VF, we also want to
make sure that some IDs will be still available for the PF.

thus if want to keep at least 128 of IDs for the PF and reserve 20000
IDs to let say 3 VFs we will call this function like this:

for (n = 1; n <= 3; n++)
	id = xe_guc_id_mgr_reserve_range(idm, 20000, 128);

this should succeed unless PF is already using more that (64K - 3*20000)
 IDs or existing IDs are spread across 0..65535 leaving no contiguous
empty ranges

> 
>> + *
>> + * Return: starting ID of the allocated GuC context ID range or
>> + *         a negative error code on failure.
>> + */
>> +int xe_guc_id_mgr_reserve_range(struct xe_guc_id_mgr *idm,
>> +				unsigned int count, unsigned int spare)
>> +{
>> +	int ret;
>> +
>> +	idm_assert(idm, count);
>> +	idm_assert(idm, spare);
>> +
>> +	mutex_lock(idm_mutex(idm));
>> +	ret = idm_reserve_chunk_locked(idm, count, 0, spare);
>> +	mutex_unlock(idm_mutex(idm));
>> +
>> +	return ret;
>> +}
>> +
>> +/**
>> + * xe_guc_id_mgr_release_range() - Release a range of GuC context IDs.
>> + * @idm: the &xe_guc_id_mgr
>> + * @start: the starting ID of GuC context range to release
>> + * @count: number of GuC context IDs to release
>> + */
>> +void xe_guc_id_mgr_release_range(struct xe_guc_id_mgr *idm,
>> +				 unsigned int start, unsigned int count)
> 
> Also kinda odd / inconsistent that
> xe_guc_id_mgr_reserve_range/xe_guc_id_mgr_release_range use a count
> argument and xe_guc_id_mgr_reserve_locked/xe_guc_id_mgr_release_locked
> use an order argument? Can this be made consistent? Either order or
> count argument for both?

fixed in v2

> 
>> +{
>> +	mutex_lock(idm_mutex(idm));
>> +	idm_release_chunk_locked(idm, start, count);
>> +	mutex_unlock(idm_mutex(idm));
>> +}
>> +
>> +static void idm_print_locked(struct xe_guc_id_mgr *idm, struct drm_printer *p, int indent)
>> +{
>> +	unsigned int rs, re;
>> +	unsigned int total;
>> +
>> +	lockdep_assert_held(idm_mutex(idm));
>> +
>> +	drm_printf_indent(p, indent, "count %u\n", idm->total);
>> +	if (!idm->bitmap)
>> +		return;
>> +
>> +	total = 0;
>> +	for_each_clear_bitrange(rs, re, idm->bitmap, idm->total) {
>> +		drm_printf_indent(p, indent, "available range %u..%u (%u)\n", rs, re - 1, re - rs);
>> +		total += re - rs;
>> +	}
>> +	drm_printf_indent(p, indent, "available total %u\n", total);
>> +
>> +	total = 0;
>> +	for_each_set_bitrange(rs, re, idm->bitmap, idm->total) {
>> +		drm_printf_indent(p, indent, "reserved range %u..%u (%u)\n", rs, re - 1, re - rs);
> 
> A bit redundant to print both set and clear as they are inverses. Maybe
> even a bit verbose to print either?

ok

> 
>> +		total += re - rs;
>> +	}
>> +	drm_printf_indent(p, indent, "reserved total %u\n", total);
>> +	drm_printf_indent(p, indent, "used %u\n", idm->used);
>> +}
>> +
>> +/**
>> + * xe_guc_id_mgr_print() - Print status of GuC ID Manager.
>> + * @idm: the &xe_guc_id_mgr to print
>> + * @p: the &drm_printer to print to
>> + * @indent: tab indentation level
>> + */
>> +void xe_guc_id_mgr_print(struct xe_guc_id_mgr *idm, struct drm_printer *p, int indent)
> 
> What is the usage of this function? Debugfs? Maybe this obvious by
> looking later in the series?

planned to use in debugfs, mostly beneficial for SR-IOV PF debug, but
didn't include anything in this series as waiting for [1]

[1] https://patchwork.freedesktop.org/series/129890/

> 
>> +{
>> +	mutex_lock(idm_mutex(idm));
>> +	idm_print_locked(idm, p, indent);
>> +	mutex_unlock(idm_mutex(idm));
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.h b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
>> new file mode 100644
>> index 000000000000..f70a908d9d4a
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
>> @@ -0,0 +1,22 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_GUC_ID_MGR_H_
>> +#define _XE_GUC_ID_MGR_H_
>> +
>> +struct drm_printer;
>> +struct xe_guc_id_mgr;
>> +
>> +int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int count);
>> +
>> +int xe_guc_id_mgr_reserve_locked(struct xe_guc_id_mgr *idm, int order);
>> +void xe_guc_id_mgr_release_locked(struct xe_guc_id_mgr *idm, unsigned int id, int order);
>> +
>> +int xe_guc_id_mgr_reserve_range(struct xe_guc_id_mgr *idm, unsigned int count, unsigned int spare);
>> +void xe_guc_id_mgr_release_range(struct xe_guc_id_mgr *idm, unsigned int start, unsigned int count);
>> +
>> +void xe_guc_id_mgr_print(struct xe_guc_id_mgr *idm, struct drm_printer *p, int indent);
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
>> index dc6059de669c..04529be0917e 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_types.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_types.h
>> @@ -31,6 +31,21 @@ struct xe_guc_db_mgr {
>>  	unsigned long *bitmap;
>>  };
>>  
>> +/**
>> + * struct xe_guc_id_mgr - GuC context ID Manager.
>> + *
>> + * Note: GuC context ID Manager is relying on &xe_guc::submission_state.lock
>> + * to protect its members.
>> + */
>> +struct xe_guc_id_mgr {
>> +	/** @bitmap: bitmap to track allocated IDs */
>> +	unsigned long *bitmap;
>> +	/** @total: total number of IDs being managed */
>> +	unsigned int total;
>> +	/** @used: number of IDs currently in use */
>> +	unsigned int used;
>> +};
>> +
> 
> Should this be in xe_guc_id_mgr_types.h?

tempting but I would rather expect the submission_state to be promoted
to it's own .h (or moved to xe_guc_submit_types.h)

> 
>>  /**
>>   * struct xe_guc - Graphic micro controller
>>   */
>> @@ -47,6 +62,8 @@ struct xe_guc {
>>  	struct xe_guc_pc pc;
>>  	/** @dbm: GuC Doorbell Manager */
>>  	struct xe_guc_db_mgr dbm;
>> +	/** @idm: GuC context ID Manager */
>> +	struct xe_guc_id_mgr idm;
> 
> I'd personally move idm & dbm under the 'GuC submission state'

dbm is not used by the submission code yet, so maybe better to move it
once we start using doorbells ?

for now just moved idm to the submission_state

> 
> Matt
> 
>>  	/** @submission_state: GuC submission state */
>>  	struct {
>>  		/** @exec_queue_lookup: Lookup an xe_engine from guc_id */
>> -- 
>> 2.25.1
>>
