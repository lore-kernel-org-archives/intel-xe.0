Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3172E77180
	for <intel-xe@archiver.kernel.org>; Sat, 14 Dec 2024 00:57:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7210910E1E0;
	Sat, 14 Dec 2024 00:57:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iUhSKc6O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 015A610E1E0
 for <intel-xe@lists.freedesktop.org>; Sat, 14 Dec 2024 00:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734137857; x=1765673857;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=j1dnofr0pqmldGIElGQXLD0yITfyKplLR16VjysMtmU=;
 b=iUhSKc6OqGZ+8FPk/bdDy1+x/rJzFqM846mbWz56zlensusN7fK3Uysq
 lg8GnykOs3za9vu1s/xSYnkcfFOPzyCoshxvsEp9qhr+OrZoXhmj/ypYm
 SPlPBHzMAKbtD1lJWgggs70r3h3JLJSFcvv1yzjK+kjRwtb8F9XuH8JDq
 1MF20zXJGBKxHfQG/GZLvegZ9/p0vxaNcy+Y6TSXgAj2kmZ0RzMZzutpf
 WmTEoDcABPlqyVIfQ5taeAai76q+sIG1bllQvKmOuVX2TMh8wpZWYVmXH
 zfXtQyDpllISqkufO9OLbHJlvusEJu2wUhO3QqQXBxM5g4huTaE1Vd6yS Q==;
X-CSE-ConnectionGUID: KSQ7fPpgSwuqYOI+WWRhsw==
X-CSE-MsgGUID: 5ZMqpgV0QRWxJ097/2IVPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="60000212"
X-IronPort-AV: E=Sophos;i="6.12,232,1728975600"; d="scan'208";a="60000212"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 16:57:36 -0800
X-CSE-ConnectionGUID: VT6XQ3MCS9KfY5AIHssW5Q==
X-CSE-MsgGUID: bFPOc8bVSHG+830KL5xliw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,232,1728975600"; d="scan'208";a="97234029"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.110.252])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 16:57:36 -0800
Date: Fri, 13 Dec 2024 18:57:26 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Ilia Levi <ilia.levi@intel.com>, intel-xe@lists.freedesktop.org, 
 Dani Liberman <dliberman@habana.ai>,
 Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: Re: [CI 4/4] drm/xe/uapi: Support requesting unique MSI-X for exec
 queue
Message-ID: <zsukl2wjt76ep4llae6v6e2bidoekxi5hzdfclb277cm6le6g2@zhzfs7ttenue>
References: <20241213070353.1511-1-ilia.levi@intel.com>
 <20241213070353.1511-5-ilia.levi@intel.com>
 <Z1yAFtqjJO89T_C_@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z1yAFtqjJO89T_C_@intel.com>
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

On Fri, Dec 13, 2024 at 01:42:30PM -0500, Rodrigo Vivi wrote:
>On Fri, Dec 13, 2024 at 09:03:53AM +0200, Ilia Levi wrote:
>> From: Dani Liberman <dliberman@habana.ai>
>>
>> Unique MSI-X per exec queue will improve the performance of the
>> IRQ handler. In case no MSI-X is available, the uAPI will return
>> -EBUSY error and the user would be able to execute the uAPI again
>> without the flag (fallback to default MSI-X).
>
>Patches 1, 2 and 3 pushed to drm-xe-next. This patch here is on
>hold while we don't have the open source userspace for that ready
>
>https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#open-source-userspace-requirements
>
>Thanks,
>Rodrigo.
>
>>
>> Co-developed-by: Ilia Levi <ilia.levi@intel.com>
>> Signed-off-by: Ilia Levi <ilia.levi@intel.com>
>> Signed-off-by: Dani Liberman <dliberman@habana.ai>
>> Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_exec_queue.c       | 57 +++++++++++++++++++++---
>>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 +
>>  drivers/gpu/drm/xe/xe_irq.c              | 18 ++++++++
>>  drivers/gpu/drm/xe/xe_irq.h              |  1 +
>>  include/uapi/drm/xe_drm.h                |  8 +++-
>>  5 files changed, 80 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>> index 9c94be571900..35ef75f9919f 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> @@ -12,6 +12,7 @@
>>  #include <uapi/drm/xe_drm.h>
>>
>>  #include "xe_device.h"
>> +#include "xe_drv.h"
>>  #include "xe_gt.h"
>>  #include "xe_hw_engine_class_sysfs.h"
>>  #include "xe_hw_engine_group.h"
>> @@ -35,8 +36,46 @@ enum xe_exec_queue_sched_prop {
>>  static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue *q,
>>  				      u64 extensions, int ext_number);
>>
>> +static int xe_exec_queue_msix_init(struct xe_device *xe, struct xe_exec_queue *q, bool unique_msix)
>> +{
>> +	u16 msix;
>> +	int err;
>> +
>> +	if (!xe_device_has_msix(xe))
>> +		return 0;
>> +
>> +	if (!unique_msix) {
>> +		q->msix_vec = XE_IRQ_DEFAULT_MSIX;
>> +		return 0;
>> +	}
>> +
>> +	err = xe_irq_msix_request_irq(xe, xe_irq_msix_hwe_handler, q,
>> +				      DRIVER_NAME "-exec-queue", true, &msix);
>> +	if (err < 0) {
>> +		drm_dbg(&xe->drm, "Can't allocate unique MSI-X to exec queue (%d)\n", err);
>> +		return err;
>> +	}
>> +
>> +	q->msix_vec = msix;
>> +
>> +	return 0;
>> +}
>> +
>> +static void xe_exec_queue_msix_fini(struct xe_exec_queue *q)
>> +{
>> +	struct xe_device *xe = gt_to_xe(q->gt);
>> +
>> +	if (!xe_device_has_msix(xe))
>> +		return;
>> +
>> +	if (q->msix_vec && q->msix_vec != XE_IRQ_DEFAULT_MSIX)
>> +		xe_irq_msix_free_irq(xe, q->msix_vec);
>> +}
>> +
>>  static void __xe_exec_queue_free(struct xe_exec_queue *q)
>>  {
>> +	xe_exec_queue_msix_fini(q);
>> +
>>  	if (q->vm)
>>  		xe_vm_put(q->vm);
>>
>> @@ -69,7 +108,12 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
>>  	q->gt = gt;
>>  	q->class = hwe->class;
>>  	q->width = width;
>> -	q->msix_vec = XE_IRQ_DEFAULT_MSIX;
>> +	err = xe_exec_queue_msix_init(xe, q, flags & EXEC_QUEUE_FLAG_UNIQUE_MSIX);

is it fine to allow any user to starve this resource?

Lucas De Marchi
