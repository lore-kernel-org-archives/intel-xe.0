Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 770C6C02198
	for <intel-xe@archiver.kernel.org>; Tue, 18 Feb 2025 08:05:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18DA810E33E;
	Tue, 18 Feb 2025 08:05:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D5RETTwM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAEA510E33E
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Feb 2025 08:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739865908; x=1771401908;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=dWxz2vyPxyhTJBw5sMIikMEnVDKZ/imXXjT+bJosZ9c=;
 b=D5RETTwMxBcTVLOAhhJKYQGE8rr4oMuQmzJbfPmEUtm2TrlYRpoVHa0M
 jT8c09ZZm8/uJBLofFzkl400pLIELb9IpWkhSpnmWX7OQd2+fRESY/mmv
 Il0wRbtk4iZMqtQjDzark30v/+wZezWdjYCW29lcuOqe05sv5fG9JCeuM
 W4qtLPEOraMw1GG+BtD8xCvFoCSSfklYHcmYxwgRtE5fs0a8m7wihwUoZ
 Wu+c2yjBjJkf7H2iql/N3/u6+FF9VNgmjdKsfnXdKhIc21VgoMgZFP8Fh
 gJR/rvkgCrLOR6I4r2CILQcZgS7xDc4x0AUksvr00OeuPPvxOhLiJUFtL g==;
X-CSE-ConnectionGUID: v7ukRYVST+CKQ6JHgxTV9w==
X-CSE-MsgGUID: mkXNGismQvuK3l80oqbxkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="44304730"
X-IronPort-AV: E=Sophos;i="6.13,295,1732608000"; d="scan'208";a="44304730"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 00:05:02 -0800
X-CSE-ConnectionGUID: 6Xk8c2f4RXmtRJUv5vWi0g==
X-CSE-MsgGUID: 46qT4mwhSxSjGV/bWKWGhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="119244626"
Received: from intelmailrelay-01.habana-labs.com ([10.111.11.20])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 00:05:00 -0800
Received: internal info suppressed
Received: from dhirschfeld-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by dhirschfeld-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTP id 51I84oEj231021; Tue, 18 Feb 2025 10:04:50 +0200
Date: Tue, 18 Feb 2025 10:04:50 +0200
From: Dafna Hirschfeld <dafna.hirschfeld@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Koby Elbaz <kelbaz@habana.ai>, rodrigo.vivi@intel.com,
 intel-xe@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Ofir Bitton <obitton@habana.ai>,
 =?utf-8?B?Sm9zw6k=?= Roberto de Souza <jose.souza@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v9] drm/xe: add mmio debugfs file & restore xe_mmio_ioctl
 as its ioctl handler
Message-ID: <vkqwkeh5skjrumqicnvw7tpadpxpgfmniebraqojraamaija2b@pljoaak2gxl5>
References: <20240515165244.156194-1-kelbaz@habana.ai>
 <75pog7eg7y5igqenv7gjgearkwyn66ba2cnxpwhfh5wgjtj27o@nqgpq2vew2vt>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <75pog7eg7y5igqenv7gjgearkwyn66ba2cnxpwhfh5wgjtj27o@nqgpq2vew2vt>
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

On 15.05.2024 15:04, Lucas De Marchi wrote:
>On Wed, May 15, 2024 at 07:52:44PM GMT, Koby Elbaz wrote:
>>The drm mmio ioctl handler (xe_mmio_ioctl) wasn't needed anymore,
>>and therefore, recently removed.
>>Nevertheless, it is now restored for debugging purposes as an
>>ioctl handler for a newly added 'mmio' debugfs file.
>>
>>Notes:
>>1. The non-admin user's limited mmio access (aka, whitelist),
>>was removed being irrelevant anymore, now that a user using debugfs
>>must anyway have root permissions to use it.
>>2. To support multi-tile access, the tile index is now dynamic and
>>will be retrieved from the given mmio address itself.
>>
>>Cc: Daniel Vetter <daniel@ffwll.ch>
>>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>Cc: Ofir Bitton <obitton@habana.ai>
>>Cc: José Roberto de Souza <jose.souza@intel.com>
>>Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
>>---
>>Changes in v9:
>>- Fix checkpatch warnings
>>
>>drivers/gpu/drm/xe/xe_debugfs.c      | 169 ++++++++++++++++++++++++++-
>>drivers/gpu/drm/xe/xe_debugfs_mmio.h |  43 +++++++
>>2 files changed, 211 insertions(+), 1 deletion(-)
>>create mode 100644 drivers/gpu/drm/xe/xe_debugfs_mmio.h
>>
>>diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
>>index 1011e5d281fa..ff99f5466931 100644
>>--- a/drivers/gpu/drm/xe/xe_debugfs.c
>>+++ b/drivers/gpu/drm/xe/xe_debugfs.c
>>@@ -7,7 +7,7 @@
>>
>>#include <linux/debugfs.h>
>>#include <linux/string_helpers.h>
>>-
>>+#include <linux/security.h>
>>#include <drm/drm_debugfs.h>
>>
>>#include "xe_bo.h"
>>@@ -19,6 +19,8 @@
>>#include "xe_pm.h"
>>#include "xe_sriov.h"
>>#include "xe_step.h"
>>+#include "xe_debugfs_mmio.h"
>>+#include "xe_mmio.h"
>>
>>#ifdef CONFIG_DRM_XE_DEBUG
>>#include "xe_bo_evict.h"
>>@@ -115,6 +117,164 @@ static int forcewake_release(struct inode *inode, struct file *file)
>>	return 0;
>>}
>>
>>+static int get_tile_id_of_mmio_addr(struct xe_device *xe, u32 mmio_addr, u8 *tile_id)
>>+{
>>+	/* MMIO space size is identical for all tiles so arbitrarily choose root tile */
>>+	struct xe_tile *tile = xe_device_get_root_tile(xe);
>>+	u32 tile_mmio_base_addr = 0;
>>+	u8 id;
>>+
>>+	if (mmio_addr >= (tile->mmio.size * xe->info.tile_count))
>>+		return -EINVAL;
>>+
>>+	for_each_tile(tile, xe, id) {
>>+		tile_mmio_base_addr = id * tile->mmio.size;
>>+		/* Each tile has a 16M MMIO space, but the contained CFG space is only 4M */
>>+		if (mmio_addr >= tile_mmio_base_addr && mmio_addr < (tile_mmio_base_addr + SZ_4M)) {
>>+			*tile_id = id;
>>+			return 0;
>>+		}
>>+	}
>>+
>>+	return -EINVAL;
>>+}
>>+
>>+static int assign_mmio_args_to_xe_reg(struct xe_device *xe, struct xe_debugfs_mmio_ioctl_data *args,
>>+				      struct xe_reg *reg, u8 *tile_id)
>>+{
>>+	unsigned int mmio_bits_flag, bytes;
>>+	u32 mmio_offset_in_tile;
>>+	struct xe_gt *gt;
>>+	u8 local_tile_id;
>>+	int ret;
>>+
>>+	mmio_bits_flag = args->flags & XE_DEBUGFS_MMIO_BITS_MASK;
>>+	bytes = 1 << mmio_bits_flag;
>
>looks like you are using the value of the flag to calculate the number
>of bytes, is that right?
>
>>+
>>+	ret = get_tile_id_of_mmio_addr(xe, args->addr, &local_tile_id);
>>+	if (ret)
>>+		return ret;
>>+
>>+	gt = xe_device_get_gt(xe, local_tile_id);
>
>is there some confusion going on here between tile and gt?
>xe_device_get_gt() is supposed to get the gt id, not the tile id.  this
>would fail for e.g. when trying to read something from media gt in MTL.

right, we are assuming accessing the primary gt, do you think we should extend the ioctl
to have 'MEDIA_GT' flag?

>
>
>>+	mmio_offset_in_tile = args->addr - local_tile_id * SZ_16M;
>>+
>>+	/*
>>+	 * TODO: migrate to xe_gt_mcr to lookup the mmio range and handle
>>+	 * multicast registers. Steering would need uapi extension.
>>+	 */
>>+	*reg = XE_REG(mmio_offset_in_tile);
>
>This basically kills any usefulness of this entire patch. It's already a
>stretch to require usable driver to read a register, which can already
>be done by mapping the BAR like done by intel_reg.
>
>The only meaninful thing here is that it uses the driver's steering
>knowledge to steer register accesses, whic is not supported here.
>
>>+
>>+	if (XE_IOCTL_DBG(xe, reg->addr + bytes > gt_to_tile(gt)->mmio.size))
>>+		return -EINVAL;
>>+
>>+	*tile_id = local_tile_id;
>>+
>>+	return 0;
>>+}
>>+
>>+static int _xe_debugfs_mmio_ioctl(struct xe_device *xe, struct xe_debugfs_mmio_ioctl_data *args)
>>+{
>>+	struct xe_reg reg;
>>+	struct xe_gt *gt;
>>+	u8 tile_id, id;
>>+	int ret;
>>+
>>+	if (XE_IOCTL_DBG(xe, args->extensions) ||
>>+	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
>>+		return -EINVAL;
>>+
>>+	if (XE_IOCTL_DBG(xe, args->flags & ~XE_DEBUGFS_MMIO_VALID_FLAGS))
>>+		return -EINVAL;
>>+
>>+	if (XE_IOCTL_DBG(xe, !(args->flags & XE_DEBUGFS_MMIO_WRITE) && args->value))
>>+		return -EINVAL;
>>+
>>+	xe_pm_runtime_get_noresume(xe);
>>+	for_each_gt(gt, xe, id)
>>+		XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>
>we are trying to get rid of the XE_WARN_ON. Please use the gt variant.
>
>>+
>>+	ret = assign_mmio_args_to_xe_reg(xe, args, &reg, &tile_id);
>>+	if (ret)
>>+		goto exit;
>>+
>>+	gt = xe_device_get_gt(xe, tile_id);
>>+
>>+	if (args->flags & XE_DEBUGFS_MMIO_WRITE) {
>>+		switch (args->flags & XE_DEBUGFS_MMIO_BITS_MASK) {
>>+		case XE_DEBUGFS_MMIO_32BIT:
>>+			if (XE_IOCTL_DBG(xe, args->value > U32_MAX)) {
>>+				ret = -EINVAL;
>>+				goto exit;
>>+			}
>>+			xe_mmio_write32(gt, reg, args->value);
>
>I'm not sure how this is going to work. xe_mmio_write32() adds the GTI
>offset, but it looks like the desire here would be to pass with the GTI
>offset already encoded (since assign_mmio_args_to_xe_reg() tries to
>convert the raw address back to tile / gt).
>
>>+			break;
>>+		default:
>>+			drm_dbg(&xe->drm, "Invalid MMIO bit size");
>>+			fallthrough;
>>+		case XE_DEBUGFS_MMIO_8BIT: /* TODO */
>>+		case XE_DEBUGFS_MMIO_16BIT: /* TODO */
>
>it's not suppored for neither read or write so it would be better just
>to not support it.
>
>>+			ret = -EOPNOTSUPP;
>>+			goto exit;
>>+		}
>>+	}
>>+
>>+	if (args->flags & XE_DEBUGFS_MMIO_READ) {
>>+		switch (args->flags & XE_DEBUGFS_MMIO_BITS_MASK) {
>>+		case XE_DEBUGFS_MMIO_32BIT:
>>+			args->value = xe_mmio_read32(gt, reg);
>>+			break;
>>+		case XE_DEBUGFS_MMIO_64BIT:
>>+			args->value = xe_mmio_read64_2x32(gt, reg);
>>+			break;
>>+		default:
>>+			drm_dbg(&xe->drm, "Invalid MMIO bit size");
>>+			fallthrough;
>>+		case XE_DEBUGFS_MMIO_8BIT: /* TODO */
>>+		case XE_DEBUGFS_MMIO_16BIT: /* TODO */
>>+			ret = -EOPNOTSUPP;
>>+		}
>>+	}
>>+
>>+exit:
>>+	for_each_gt(gt, xe, id)
>>+		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>>+
>>+	xe_pm_runtime_put(xe);
>>+
>>+	return ret;
>>+}
>>+
>>+static long xe_debugfs_mmio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>>+{
>>+	struct xe_device *xe = file_inode(filp)->i_private;
>>+	struct xe_debugfs_mmio_ioctl_data mmio_data;
>>+	int ret;
>>+
>>+	ret = security_locked_down(LOCKDOWN_PCI_ACCESS);
>>+	if (ret)
>>+		return ret;
>>+
>>+	if (cmd == XE_DEBUGFS_MMIO_IOCTL) {
>>+		ret = copy_from_user(&mmio_data, (struct xe_debugfs_mmio_ioctl_data __user *)arg,
>>+				     sizeof(mmio_data));
>>+		if (ret)
>>+			return -EFAULT;
>>+
>>+		ret = _xe_debugfs_mmio_ioctl(xe, &mmio_data);
>>+		if (ret)
>>+			return ret;
>>+
>>+		ret = copy_to_user((struct xe_debugfs_mmio_ioctl_data __user *)arg,
>>+				   &mmio_data, sizeof(mmio_data));
>>+		if (ret)
>>+			return -EFAULT;
>>+	} else {
>>+		return -EINVAL;
>>+	}
>>+
>>+	return 0;
>>+}
>>+
>>static const struct file_operations forcewake_all_fops = {
>>	.owner = THIS_MODULE,
>>	.open = forcewake_open,
>>@@ -173,6 +333,11 @@ static const struct file_operations wedged_mode_fops = {
>>	.write = wedged_mode_set,
>>};
>>
>>+static const struct file_operations mmio_fops = {
>>+	.owner = THIS_MODULE,
>>+	.unlocked_ioctl = xe_debugfs_mmio_ioctl,
>>+};
>>+
>>void xe_debugfs_register(struct xe_device *xe)
>>{
>>	struct ttm_device *bdev = &xe->ttm;
>>@@ -214,6 +379,8 @@ void xe_debugfs_register(struct xe_device *xe)
>>	for_each_gt(gt, xe, id)
>>		xe_gt_debugfs_register(gt);
>>
>>+	debugfs_create_file("mmio", 0644, root, xe, &mmio_fops);
>>+
>>#ifdef CONFIG_FAULT_INJECTION
>>	fault_create_debugfs_attr("fail_gt_reset", root, &gt_reset_failure);
>>#endif
>>diff --git a/drivers/gpu/drm/xe/xe_debugfs_mmio.h b/drivers/gpu/drm/xe/xe_debugfs_mmio.h
>>new file mode 100644
>>index 000000000000..1dfb8fa2ce9a
>>--- /dev/null
>>+++ b/drivers/gpu/drm/xe/xe_debugfs_mmio.h
>
>How is userspace going to know about the values?
>Even if it's debugfs, we need some way to communicate the values the
>kernel expects. Not sure if it fits include/uapi/ though. Are there
>other use cases in the kernel to follow along?

There is amdgpu_debugfs_regs2_ioctl, which has the definitions in file
drivers/gpu/drm/amd/amdgpu/amdgpu_umr.h
The definitions are copied in repo
https://gitlab.freedesktop.org/tomstdenis/umr.git

Thanks,
Dafna

>
>>@@ -0,0 +1,43 @@
>>+/* SPDX-License-Identifier: MIT */
>>+/*
>>+ * Copyright © 2023 Intel Corporation
>>+ */
>>+
>>+#ifndef _XE_DEBUGFS_MMIO_H_
>>+#define _XE_DEBUGFS_MMIO_H_
>>+
>>+#include <drm/drm.h>
>
>what is this for? Apparently you want asm/ioctl.h rather than this.
>
>>+
>>+#define XE_DEBUGFS_MMIO_8BIT		0x0
>>+#define XE_DEBUGFS_MMIO_16BIT		0x1
>
>as said above, just don't expose things you don't support.
>
>>+#define XE_DEBUGFS_MMIO_32BIT		0x2
>>+#define XE_DEBUGFS_MMIO_64BIT		0x3
>>+#define XE_DEBUGFS_MMIO_BITS_MASK	0x3
>>+#define XE_DEBUGFS_MMIO_READ		0x4
>>+#define XE_DEBUGFS_MMIO_WRITE		0x8
>>+
>>+#define XE_DEBUGFS_MMIO_VALID_FLAGS (\
>
>		^ this can't be in the header if it goes to uapi
>
>>+	XE_DEBUGFS_MMIO_BITS_MASK |\
>>+	XE_DEBUGFS_MMIO_READ |\
>>+	XE_DEBUGFS_MMIO_WRITE)
>>+
>>+struct xe_debugfs_mmio_ioctl_data {
>>+	/** @extensions: Pointer to the first extension struct, if any */
>>+	__u64 extensions;
>>+
>>+	__u32 addr;
>>+
>>+	__u32 flags;
>>+
>>+	__u64 value;
>>+
>>+	/** @reserved: Reserved */
>>+	__u64 reserved[2];
>>+};
>>+
>>+#define XE_DEBUGFS_MMIO_IOCTL_NR	0x00
>>+
>>+#define XE_DEBUGFS_MMIO_IOCTL \
>>+	_IOWR(0x20, XE_DEBUGFS_MMIO_IOCTL_NR, struct xe_debugfs_mmio_ioctl_data)
>>+
>>+#endif /* _XE_DEBUGFS_MMIO_H_ */
>
>	   ^ no need for this as it often gets out of sync with the
>	   guard above
>
>
>I'm not very confident this works as is. I think one possibility is to
>implement the MCR missing above and implement this backend in intel_reg.
>Then you can prove it works and show it's worth it.
>
>Currently intel_reg has a few backends like mapping the BAR, or
>submitting a batch and reading/writing from the GPU side. Adding another
>one to be "via driver's debugfs" would probably be ok. +Jani as
>intel_reg's original author.
>
>Lucas De Marchi
>
>>-- 
>>2.34.1
>>
