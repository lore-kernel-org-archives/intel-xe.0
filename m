Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7309FC3DA4A
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jul 2024 13:19:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C49310E3CE;
	Mon, 29 Jul 2024 13:19:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jb6857Mj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 916A910E3CE
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jul 2024 13:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722259172; x=1753795172;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=FBM5/y82nNfUBCbKhxOlisHah0ugcFZPix66JoWcV+s=;
 b=jb6857MjLqKUt6/AKJbXaB4N38nGDX1QjuwoGxPX7iU/HL/SpkuT+Lhk
 YCTQOfuwyDsXlVOtvYv261WK/h7TIvdf4B9LnhMFsMe8nIRynPelKD5l2
 3QXIcCq6dPGmvwAKdGHZWZMTKilrdklNkZAPz9F1Ligeil/0c6rnGyHxS
 9p6DPGr659l8AXgKhAnqHRhzczQd1XtYSaRGo5O1Hv1654tNYzqThQs7Y
 /aU8+TM7r0RdPeqbYeJTOaqnMlmJhaxEIuOvAAEDA0C431VHv/rVGD8ZD
 BsZgQ6bAHfElyN8yu3FAOeq3aw0BqDa4/v3iVdHOa/k5ebVtM1Cj1wnc0 Q==;
X-CSE-ConnectionGUID: xaFSjZVKQFmCU6f+2TkA5w==
X-CSE-MsgGUID: Zy9kqJXpTb+o0O3bzhsyPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="20156980"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="20156980"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 06:19:32 -0700
X-CSE-ConnectionGUID: UNh1qhX8QMinugqhz3r+4A==
X-CSE-MsgGUID: T11MCO1aTtuw2VVlzw3CTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="59062554"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.185])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 06:19:29 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Ohad Sharabi
 <osharabi@habana.ai>
Cc: intel-xe@lists.freedesktop.org, obitton@habana.ai, kelbaz@habana.ai,
 gustavo.sousa@intel.com
Subject: Re: [PATCH v2] drm/xe/uapi: restructure query config types in an enum
In-Reply-To: <gqffceiac2b6r5nsgmzixccfc3o4xsy4n5x2rsrnxxkca2nukv@whe7y5cqyv76>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240729121526.448199-1-osharabi@habana.ai>
 <gqffceiac2b6r5nsgmzixccfc3o4xsy4n5x2rsrnxxkca2nukv@whe7y5cqyv76>
Date: Mon, 29 Jul 2024 16:19:25 +0300
Message-ID: <87plqwxrmq.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Mon, 29 Jul 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> On Mon, Jul 29, 2024 at 03:15:26PM GMT, Ohad Sharabi wrote:
>>The config query has entries per config type.
>>
>>In query_config(), an array is allocated using the last element of
>>the query config to dictate the array length.
>>
>>Instead, a more robust approach would be to use the standard "number of
>>elements" last element of an enum such that one wouldn't need to modify
>>the ioctl each time another entry is added.
>>
>>v2:
>> - modify `enum drm_xe_query_config_type` doc
>>
>>Signed-off-by: Ohad Sharabi <osharabi@habana.ai>
>>---
>> drivers/gpu/drm/xe/xe_query.c |  2 +-
>> include/uapi/drm/xe_drm.h     | 58 ++++++++++++++++++++++-------------
>> 2 files changed, 38 insertions(+), 22 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>>index 73ef6e4c2dc9..aaa60ff764ee 100644
>>--- a/drivers/gpu/drm/xe/xe_query.c
>>+++ b/drivers/gpu/drm/xe/xe_query.c
>>@@ -313,7 +313,7 @@ static int query_mem_regions(struct xe_device *xe,
>>
>> static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
>> {
>>-	const u32 num_params = DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY + 1;
>>+	const u32 num_params = DRM_XE_QUERY_CONFIG_NUM_CONFIGS;
>> 	size_t size =
>> 		sizeof(struct drm_xe_query_config) + num_params * sizeof(u64);
>> 	struct drm_xe_query_config __user *query_ptr =
>>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>>index 29425d7fdc77..9222563cddc3 100644
>>--- a/include/uapi/drm/xe_drm.h
>>+++ b/include/uapi/drm/xe_drm.h
>>@@ -378,6 +378,42 @@ struct drm_xe_query_mem_regions {
>> 	struct drm_xe_mem_region mem_regions[];
>> };
>>
>>+#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
>>+
>>+/**
>>+ * enum drm_xe_query_config_type - Indices for the supported configs returned
>>+ * in &drm_xe_query_config.info array
>>+ */
>>+enum drm_xe_query_config_type {
>>+	/**
>>+	 * @DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID: Device ID (lower 16 bits)
>>+	 * and the device revision (next 8 bits).
>>+	 */
>>+	DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID,
>>+	/**
>>+	 * @DRM_XE_QUERY_CONFIG_FLAGS: Flags describing the device
>>+	 * configuration, see list below.
>>+	 *
>>+	 *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM - Flag is set if the device
>>+	 *      has usable VRAM
>>+	 */
>>+	DRM_XE_QUERY_CONFIG_FLAGS,
>>+	/**
>>+	 * @DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT: Minimal memory alignment
>>+	 * required by this device, typically SZ_4K or SZ_64K.
>>+	 */
>>+	DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT,
>>+	/** @DRM_XE_QUERY_CONFIG_VA_BITS: Maximum bits of a virtual address. */
>>+	DRM_XE_QUERY_CONFIG_VA_BITS,
>>+	/**
>>+	 * @DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY: Value of the highest
>>+	 * available exec queue priority.
>>+	 */
>>+	DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY,
>>+	/** @DRM_XE_QUERY_CONFIG_NUM_CONFIGS: must be last. Number of configs */
>>+	DRM_XE_QUERY_CONFIG_NUM_CONFIGS,
>
> But then when we change from 5 to 6, we are changing the uapi.  It's
> very possible that userspace was using that number and then when they
> update the header the build breaks.
>
> I believe that's why none of our enums contain a max/count/num element
> at the end.

Agreed.


BR,
Jani.


>
> Lucas De Marchi
>
>>+};
>>+
>> /**
>>  * struct drm_xe_query_config - describe the device configuration
>>  *
>>@@ -385,33 +421,13 @@ struct drm_xe_query_mem_regions {
>>  * is equal to DRM_XE_DEVICE_QUERY_CONFIG, then the reply uses
>>  * struct drm_xe_query_config in .data.
>>  *
>>- * The index in @info can be:
>>- *  - %DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID - Device ID (lower 16 bits)
>>- *    and the device revision (next 8 bits)
>>- *  - %DRM_XE_QUERY_CONFIG_FLAGS - Flags describing the device
>>- *    configuration, see list below
>>- *
>>- *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM - Flag is set if the device
>>- *      has usable VRAM
>>- *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
>>- *    required by this device, typically SZ_4K or SZ_64K
>>- *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
>>- *  - %DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY - Value of the highest
>>- *    available exec queue priority
>>+ * The index in @info are the entries in `enum drm_xe_query_config`
>>  */
>> struct drm_xe_query_config {
>> 	/** @num_params: number of parameters returned in info */
>> 	__u32 num_params;
>>-
>> 	/** @pad: MBZ */
>> 	__u32 pad;
>>-
>>-#define DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
>>-#define DRM_XE_QUERY_CONFIG_FLAGS			1
>>-	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
>>-#define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
>>-#define DRM_XE_QUERY_CONFIG_VA_BITS			3
>>-#define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
>> 	/** @info: array of elements containing the config info */
>> 	__u64 info[];
>> };
>>-- 
>>2.34.1
>>

-- 
Jani Nikula, Intel
