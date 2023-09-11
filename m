Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A922EE57DF
	for <intel-xe@archiver.kernel.org>; Mon, 11 Sep 2023 11:53:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D30C10E2D4;
	Mon, 11 Sep 2023 11:53:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19E2F10E2D4
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Sep 2023 11:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694433198; x=1725969198;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=zMHmMgJ+9z4yK4W+Q317oUlrrjRqG7qYJBODfbJdZRQ=;
 b=atrjUqRNc2jFiiIRcIxggozcvqPmB7aG37wfN0mdGhXH3KrXv5z3a5yg
 zWyTcZgQBUJMsUqopDHxRHTckf1ig8TPxp4kP4WbNCVwdA+0t/1sP8qUu
 MHuS5VQPg3X4HmxLl2PTvS53HKXnTixcMCEYNOBb//FRfXTStNgn/2cAp
 FgzLZaj/70QX/nNI6qiBkjYtEgjQ0Ndfo7E68qdxuZoJ2ZkGcgra3L+1v
 gp6dgZQwIYh3mbG9k6HoAuT8okrVlho4bO3cUhLFl7PFGzUlq1hAkqY6R
 lzdqbM6sQjEgEWCuFqeMprquLEHRx3BL0+qQ14oECT3t0W/b01f7RJvq6 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="376973005"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="376973005"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 04:53:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="858286936"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="858286936"
Received: from kschuele-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.63.119])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 04:53:15 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Francois Dugast
 <francois.dugast@intel.com>
In-Reply-To: <uuo6ymgwte45hhifxo43wblq3oe745g72k3jblopzl2qtmch43@achez6wz62k3>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230907193515.7-1-francois.dugast@intel.com>
 <uuo6ymgwte45hhifxo43wblq3oe745g72k3jblopzl2qtmch43@achez6wz62k3>
Date: Mon, 11 Sep 2023 14:53:13 +0300
Message-ID: <874jk1exjq.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH] drm/xe/uapi: Remove MMIO ioctl
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

On Sun, 10 Sep 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> On Thu, Sep 07, 2023 at 07:35:15PM +0000, Francois Dugast wrote:
>>This was previously used in UMD for timestamp correlation, which can now
>>be done with DRM_XE_QUERY_CS_CYCLES.
>
> as a breaking uapi/uabi, "can be done" is not sufficient. We need to
> get acks from the UMDs that were/are using this interface. And we can
> only do this before merging upstream.

On that note, we can always *add* this interface afterwards, but it's
really hard to *remove* afterwards.

BR,
Jani.


>
> Lucas De Marchi
>
>>
>>Link: https://lore.kernel.org/all/20230706042044.GR6953@mdroper-desk1.amr.corp.intel.com/
>>Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/636
>>Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>>---
>> drivers/gpu/drm/xe/xe_device.c |   1 -
>> drivers/gpu/drm/xe/xe_mmio.c   | 102 ---------------------------------
>> include/uapi/drm/xe_drm.h      |  31 ++--------
>> 3 files changed, 4 insertions(+), 130 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>>index 109aeb25d19c..10fa1b55578a 100644
>>--- a/drivers/gpu/drm/xe/xe_device.c
>>+++ b/drivers/gpu/drm/xe/xe_device.c
>>@@ -107,7 +107,6 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
>> 	DRM_IOCTL_DEF_DRV(XE_EXEC_QUEUE_DESTROY, xe_exec_queue_destroy_ioctl,
>> 			  DRM_RENDER_ALLOW),
>> 	DRM_IOCTL_DEF_DRV(XE_EXEC, xe_exec_ioctl, DRM_RENDER_ALLOW),
>>-	DRM_IOCTL_DEF_DRV(XE_MMIO, xe_mmio_ioctl, DRM_RENDER_ALLOW),
>> 	DRM_IOCTL_DEF_DRV(XE_EXEC_QUEUE_SET_PROPERTY, xe_exec_queue_set_property_ioctl,
>> 			  DRM_RENDER_ALLOW),
>> 	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
>>diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>>index 3ccc0af4430b..e636e3f3456d 100644
>>--- a/drivers/gpu/drm/xe/xe_mmio.c
>>+++ b/drivers/gpu/drm/xe/xe_mmio.c
>>@@ -422,108 +422,6 @@ int xe_mmio_init(struct xe_device *xe)
>> 	return 0;
>> }
>>
>>-#define VALID_MMIO_FLAGS (\
>>-	DRM_XE_MMIO_BITS_MASK |\
>>-	DRM_XE_MMIO_READ |\
>>-	DRM_XE_MMIO_WRITE)
>>-
>>-static const struct xe_reg mmio_read_whitelist[] = {
>>-	RING_TIMESTAMP(RENDER_RING_BASE),
>>-};
>>-
>>-int xe_mmio_ioctl(struct drm_device *dev, void *data,
>>-		  struct drm_file *file)
>>-{
>>-	struct xe_device *xe = to_xe_device(dev);
>>-	struct xe_gt *gt = xe_root_mmio_gt(xe);
>>-	struct drm_xe_mmio *args = data;
>>-	unsigned int bits_flag, bytes;
>>-	struct xe_reg reg;
>>-	bool allowed;
>>-	int ret = 0;
>>-
>>-	if (XE_IOCTL_DBG(xe, args->extensions) ||
>>-	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
>>-		return -EINVAL;
>>-
>>-	if (XE_IOCTL_DBG(xe, args->flags & ~VALID_MMIO_FLAGS))
>>-		return -EINVAL;
>>-
>>-	if (XE_IOCTL_DBG(xe, !(args->flags & DRM_XE_MMIO_WRITE) && args->value))
>>-		return -EINVAL;
>>-
>>-	allowed = capable(CAP_SYS_ADMIN);
>>-	if (!allowed && ((args->flags & ~DRM_XE_MMIO_BITS_MASK) == DRM_XE_MMIO_READ)) {
>>-		unsigned int i;
>>-
>>-		for (i = 0; i < ARRAY_SIZE(mmio_read_whitelist); i++) {
>>-			if (mmio_read_whitelist[i].addr == args->addr) {
>>-				allowed = true;
>>-				break;
>>-			}
>>-		}
>>-	}
>>-
>>-	if (XE_IOCTL_DBG(xe, !allowed))
>>-		return -EPERM;
>>-
>>-	bits_flag = args->flags & DRM_XE_MMIO_BITS_MASK;
>>-	bytes = 1 << bits_flag;
>>-	if (XE_IOCTL_DBG(xe, args->addr + bytes > xe->mmio.size))
>>-		return -EINVAL;
>>-
>>-	/*
>>-	 * TODO: migrate to xe_gt_mcr to lookup the mmio range and handle
>>-	 * multicast registers. Steering would need uapi extension.
>>-	 */
>>-	reg = XE_REG(args->addr);
>>-
>>-	xe_device_mem_access_get(xe);
>>-	xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>-
>>-	if (args->flags & DRM_XE_MMIO_WRITE) {
>>-		switch (bits_flag) {
>>-		case DRM_XE_MMIO_32BIT:
>>-			if (XE_IOCTL_DBG(xe, args->value > U32_MAX)) {
>>-				ret = -EINVAL;
>>-				goto exit;
>>-			}
>>-			xe_mmio_write32(gt, reg, args->value);
>>-			break;
>>-		default:
>>-			drm_dbg(&xe->drm, "Invalid MMIO bit size");
>>-			fallthrough;
>>-		case DRM_XE_MMIO_8BIT: /* TODO */
>>-		case DRM_XE_MMIO_16BIT: /* TODO */
>>-			ret = -EOPNOTSUPP;
>>-			goto exit;
>>-		}
>>-	}
>>-
>>-	if (args->flags & DRM_XE_MMIO_READ) {
>>-		switch (bits_flag) {
>>-		case DRM_XE_MMIO_32BIT:
>>-			args->value = xe_mmio_read32(gt, reg);
>>-			break;
>>-		case DRM_XE_MMIO_64BIT:
>>-			args->value = xe_mmio_read64_2x32(gt, reg);
>>-			break;
>>-		default:
>>-			drm_dbg(&xe->drm, "Invalid MMIO bit size");
>>-			fallthrough;
>>-		case DRM_XE_MMIO_8BIT: /* TODO */
>>-		case DRM_XE_MMIO_16BIT: /* TODO */
>>-			ret = -EOPNOTSUPP;
>>-		}
>>-	}
>>-
>>-exit:
>>-	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>-	xe_device_mem_access_put(xe);
>>-
>>-	return ret;
>>-}
>>-
>> /**
>>  * xe_mmio_read64_2x32() - Read a 64-bit register as two 32-bit reads
>>  * @gt: MMIO target GT
>>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>>index 86f16d50e9cc..6c6d1cfa415a 100644
>>--- a/include/uapi/drm/xe_drm.h
>>+++ b/include/uapi/drm/xe_drm.h
>>@@ -106,11 +106,10 @@ struct xe_user_extension {
>> #define DRM_XE_EXEC_QUEUE_CREATE		0x06
>> #define DRM_XE_EXEC_QUEUE_DESTROY		0x07
>> #define DRM_XE_EXEC			0x08
>>-#define DRM_XE_MMIO			0x09
>>-#define DRM_XE_EXEC_QUEUE_SET_PROPERTY	0x0a
>>-#define DRM_XE_WAIT_USER_FENCE		0x0b
>>-#define DRM_XE_VM_MADVISE		0x0c
>>-#define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x0d
>>+#define DRM_XE_EXEC_QUEUE_SET_PROPERTY	0x09
>>+#define DRM_XE_WAIT_USER_FENCE		0x0a
>>+#define DRM_XE_VM_MADVISE		0x0b
>>+#define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x0c
>>
>> /* Must be kept compact -- no holes */
>> #define DRM_IOCTL_XE_DEVICE_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEVICE_QUERY, struct drm_xe_device_query)
>>@@ -123,7 +122,6 @@ struct xe_user_extension {
>> #define DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_GET_PROPERTY, struct drm_xe_exec_queue_get_property)
>> #define DRM_IOCTL_XE_EXEC_QUEUE_DESTROY		 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_DESTROY, struct drm_xe_exec_queue_destroy)
>> #define DRM_IOCTL_XE_EXEC			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
>>-#define DRM_IOCTL_XE_MMIO			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_MMIO, struct drm_xe_mmio)
>> #define DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY	 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_SET_PROPERTY, struct drm_xe_exec_queue_set_property)
>> #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
>> #define DRM_IOCTL_XE_VM_MADVISE			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_MADVISE, struct drm_xe_vm_madvise)
>>@@ -883,27 +881,6 @@ struct drm_xe_exec {
>> 	__u64 reserved[2];
>> };
>>
>>-struct drm_xe_mmio {
>>-	/** @extensions: Pointer to the first extension struct, if any */
>>-	__u64 extensions;
>>-
>>-	__u32 addr;
>>-
>>-#define DRM_XE_MMIO_8BIT	0x0
>>-#define DRM_XE_MMIO_16BIT	0x1
>>-#define DRM_XE_MMIO_32BIT	0x2
>>-#define DRM_XE_MMIO_64BIT	0x3
>>-#define DRM_XE_MMIO_BITS_MASK	0x3
>>-#define DRM_XE_MMIO_READ	0x4
>>-#define DRM_XE_MMIO_WRITE	0x8
>>-	__u32 flags;
>>-
>>-	__u64 value;
>>-
>>-	/** @reserved: Reserved */
>>-	__u64 reserved[2];
>>-};
>>-
>> /**
>>  * struct drm_xe_wait_user_fence - wait user fence
>>  *
>>-- 
>>2.34.1
>>

-- 
Jani Nikula, Intel Open Source Graphics Center
