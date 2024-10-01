Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89AD2CEACE8
	for <intel-xe@archiver.kernel.org>; Tue,  1 Oct 2024 16:26:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F59A10E04B;
	Tue,  1 Oct 2024 16:26:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Emn2keOe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC12110E319
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Oct 2024 16:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727799960; x=1759335960;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=buBTmX55yM2qEMFgKeNBuqXAH9/UD/7MGhstiFoWTsk=;
 b=Emn2keOeXsx2NlC7bKN4p6tgLFqJbyiUFvrxoInG5e7Q4b8MPFDSv50a
 6YTY4TLmJtVqE5UcgY/t1XucRKC6clBHwnbNQb9/Mqd5yRdWi4OrD0Lgs
 ma9DSgzCQNDFo+gqFEpIbMD+SYdZ22ZnP6/Wf8PUAWiLpLMxi1mGW9g3A
 5y42QsSS29hpBKbBF/z8Z0+VTSYq+FLTWgTasCTBfJUEUhxjOquF8GYmX
 9WoSzIrw7BijtoelPLTcCTxIRzVWq5dqde+6GmDzoIQkUH+liv+yZJDbc
 B1bGXTmZLxNi5efaYS1YGk5g/MJu8vufbLijriQrGE39uwm8N5s9xuIso A==;
X-CSE-ConnectionGUID: BK0YGzIDRfOnVv8x2+NTGA==
X-CSE-MsgGUID: haN/a+dHTQiEbMqCvhb4uw==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="27084650"
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; d="scan'208";a="27084650"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 09:26:00 -0700
X-CSE-ConnectionGUID: BsTQByGoToKHYR4G+DayMw==
X-CSE-MsgGUID: tjXW1ei6S7uwHmcqQMDJyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; d="scan'208";a="78469500"
Received: from apaszkie-mobl2.apaszkie-mobl2 (HELO [10.245.245.112])
 ([10.245.245.112])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 09:25:59 -0700
Message-ID: <7b0e1435-a6d8-4148-9e99-2085aa2208bb@intel.com>
Date: Tue, 1 Oct 2024 17:25:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/18] drm/xe: Debug metadata create/destroy ioctls
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
References: <20241001144306.1991001-1-mika.kuoppala@linux.intel.com>
 <20241001144306.1991001-14-mika.kuoppala@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20241001144306.1991001-14-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi,

On 01/10/2024 15:43, Mika Kuoppala wrote:
> From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> 
> Ad a part of eu debug feature introduce debug metadata objects.
> These are to be used to pass metadata between client and debugger,
> by attaching them to vm_bind operations.
> 
> todo: WORK_IN_PROGRESS_* defines need to be reworded/refined when
>        the real usage and need is established by l0+gdb.
> 
> v2: - include uapi/drm/xe_drm.h
>      - metadata behind kconfig (Mika)
> 
> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> ---
>   drivers/gpu/drm/xe/Makefile                  |   3 +-
>   drivers/gpu/drm/xe/xe_debug_metadata.c       | 108 +++++++++++++++++++
>   drivers/gpu/drm/xe/xe_debug_metadata.h       |  50 +++++++++
>   drivers/gpu/drm/xe/xe_debug_metadata_types.h |  28 +++++
>   drivers/gpu/drm/xe/xe_device.c               |   5 +
>   drivers/gpu/drm/xe/xe_device.h               |   2 +
>   drivers/gpu/drm/xe/xe_device_types.h         |   7 ++
>   drivers/gpu/drm/xe/xe_eudebug.c              |  13 +++
>   include/uapi/drm/xe_drm.h                    |  53 ++++++++-
>   9 files changed, 267 insertions(+), 2 deletions(-)
>   create mode 100644 drivers/gpu/drm/xe/xe_debug_metadata.c
>   create mode 100644 drivers/gpu/drm/xe/xe_debug_metadata.h
>   create mode 100644 drivers/gpu/drm/xe/xe_debug_metadata_types.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 660c1dbba8d0..a94f771529a4 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -114,7 +114,8 @@ xe-y += xe_bb.o \
>   	xe_wa.o \
>   	xe_wopcm.o
>   
> -xe-$(CONFIG_DRM_XE_EUDEBUG) += xe_eudebug.o
> +xe-$(CONFIG_DRM_XE_EUDEBUG) += xe_eudebug.o \
> +	xe_debug_metadata.o
>   
>   xe-$(CONFIG_HMM_MIRROR) += xe_hmm.o
>   
> diff --git a/drivers/gpu/drm/xe/xe_debug_metadata.c b/drivers/gpu/drm/xe/xe_debug_metadata.c
> new file mode 100644
> index 000000000000..72a00b628475
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_debug_metadata.c
> @@ -0,0 +1,108 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +#include "xe_debug_metadata.h"
> +
> +#include <drm/drm_device.h>
> +#include <drm/drm_file.h>
> +#include <uapi/drm/xe_drm.h>
> +
> +#include "xe_device.h"
> +#include "xe_macros.h"
> +
> +static void xe_debug_metadata_release(struct kref *ref)
> +{
> +	struct xe_debug_metadata *mdata = container_of(ref, struct xe_debug_metadata, refcount);
> +
> +	kvfree(mdata->ptr);
> +	kfree(mdata);
> +}
> +
> +void xe_debug_metadata_put(struct xe_debug_metadata *mdata)
> +{
> +	kref_put(&mdata->refcount, xe_debug_metadata_release);
> +}
> +
> +int xe_debug_metadata_create_ioctl(struct drm_device *dev,
> +				   void *data,
> +				   struct drm_file *file)
> +{
> +	struct xe_device *xe = to_xe_device(dev);
> +	struct xe_file *xef = to_xe_file(file);
> +	struct drm_xe_debug_metadata_create *args = data;
> +	struct xe_debug_metadata *mdata;
> +	int err;
> +	u32 id;
> +
> +	if (XE_IOCTL_DBG(xe, args->extensions))
> +		return -EINVAL;
> +
> +	if (XE_IOCTL_DBG(xe, args->type > DRM_XE_DEBUG_METADATA_PROGRAM_MODULE))
> +		return -EINVAL;
> +
> +	if (XE_IOCTL_DBG(xe, !args->user_addr || !args->len))
> +		return -EINVAL;
> +
> +	if (XE_IOCTL_DBG(xe, !access_ok(u64_to_user_ptr(args->user_addr), args->len)))
> +		return -EFAULT;
> +
> +	mdata = kzalloc(sizeof(*mdata), GFP_KERNEL);
> +	if (!mdata)
> +		return -ENOMEM;
> +
> +	mdata->len = args->len;
> +	mdata->type = args->type;
> +
> +	mdata->ptr = kvmalloc(mdata->len, GFP_KERNEL);
> +	if (!mdata->ptr) {
> +		kfree(mdata);
> +		return -ENOMEM;
> +	}
> +	kref_init(&mdata->refcount);
> +
> +	err = copy_from_user(mdata->ptr, u64_to_user_ptr(args->user_addr), mdata->len);
> +	if (err) {
> +		err = -EFAULT;
> +		goto put_mdata;
> +	}
> +
> +	mutex_lock(&xef->eudebug.metadata.lock);
> +	err = xa_alloc(&xef->eudebug.metadata.xa, &id, mdata, xa_limit_32b, GFP_KERNEL);
> +	mutex_unlock(&xef->eudebug.metadata.lock);
> +
> +	args->metadata_id = id;

Just some drive-by-comments. Potentially this is passing uninitialised 
data from the stack back to userspace, assuming the xa_alloc here fails? 
Maybe safer to leave metadata_id zeroed on err?

> +	mdata->id = id;

It looks like mdata can go out of scope since user can technically guess 
the id and call the destroy ioctl before this ioctl returns. I think 
publishing the id needs to go last or needs some kind of locking.

Also are we sure we need to store the user id in mdata in the first 
place? Usually for user id kmd doesn't need to track it in such a way.
