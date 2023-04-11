Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B06BBC7619A
	for <intel-xe@archiver.kernel.org>; Tue, 11 Apr 2023 07:56:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8579110E09C;
	Tue, 11 Apr 2023 07:56:44 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93F8010E09C
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Apr 2023 07:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681199802; x=1712735802;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=XyVnY8siGSeVLx6vi8pplO5DWg22MkjPuvUbY3MTOz8=;
 b=XetAckqCu54WL1bIq22eMksdOZUQ3eVgZKIcqTnOopP+jqlPCywXh29e
 2xqrsXNzsw+o+5MBspn2bDAe/S2fmnAChOx12I7wHmxPjdgnnuLqYaQ2k
 v9Q5UaCCN0lACCIoBw8it2b23oSUbdyvBEDOfMxOEsX7LvAHy8KbMfOwC
 C7i98kSxxtE/FcY7tSzE1RZ768Ze3eCVm8fXBcsRFWOY4XKpb2dxrNEoA
 ECEBO8nragB/jmwjj85BpyxU6wHefsE0pQBgu3vzz4e8PmEgYME2ae+z6
 J7mAofBNDkk99qiLjI1QoezplulUbw8t9kdpMawvofab027Mmqb829/Hw g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="345337843"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; d="scan'208";a="345337843"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2023 00:56:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="799818105"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; d="scan'208";a="799818105"
Received: from tunterlu-mobl2.amr.corp.intel.com (HELO localhost)
 ([10.252.56.34])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2023 00:56:39 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>
In-Reply-To: <20230411070133.byyciicbo4a7z3qt@ldmartin-desk2.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230410183910.2696628-1-matthew.d.roper@intel.com>
 <20230411070133.byyciicbo4a7z3qt@ldmartin-desk2.lan>
Date: Tue, 11 Apr 2023 10:56:37 +0300
Message-ID: <87leiyetsa.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH 1/3] drm/xe: Use packed bitfields for
 xe->info feature flags
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

On Tue, 11 Apr 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> On Mon, Apr 10, 2023 at 11:39:08AM -0700, Matt Roper wrote:
>>Replace 'bool' fields with single bits to allow the various device
>>feature flags to pack more tightly.
>
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
> but a  digression:
>
> for structs like the descriptors in xe_pci.c, this justification is
> enough as we will be maintaining several of those as they extend to
> each platform. Also the access to struct members is contained in
> one place.
>
> However this reasoning can't be generalized to structs like xe_device,
> that has one allocated per device. The gain should be very minimal if
> any at all.
>
> 1) Each place accessing one of these fields will have more
> instructions generated to use the right bit although in most cases
> the compiler should swap a cmpb with testb since we are likely just
> checking if the feature is available or not.
>
> 2) It also limits the ability to pass them by address.
>
> 3) We also need to be careful when changing
> bool -> u8 as they don't have the same semantics in cases like
> `b = true; b++;`, which may not be obvious in some cases.
>
> for (1), the pro/con should be really small, (2) we should get a
> compiler error if we tried. But for (3)... we need to check all the
> fields we are converting to make sure this doesn't introduce bugs.  I'm
> on the fence on the need for this change, but I'm ok with it.  I double
> checked all the members in the struct and didn't find use cases that
> would introduce a bug, hence my r-b above.

bloat-o-meter results with both might be interesting, for code and
data. Does the data saving matter if we bloat code more?

BR,
Jani.



>
>
> Lucas De Marchi
>
>>
>>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>>---
>> drivers/gpu/drm/xe/xe_device_types.h | 21 +++++++++++----------
>> 1 file changed, 11 insertions(+), 10 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>>index f5399b284e3b..9ce6e348dd29 100644
>>--- a/drivers/gpu/drm/xe/xe_device_types.h
>>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>>@@ -67,8 +67,6 @@ struct xe_device {
>> 		u32 media_verx100;
>> 		/** @mem_region_mask: mask of valid memory regions */
>> 		u32 mem_region_mask;
>>-		/** @is_dgfx: is discrete device */
>>-		bool is_dgfx;
>> 		/** @platform: XE platform enum */
>> 		enum xe_platform platform;
>> 		/** @subplatform: XE subplatform enum */
>>@@ -87,22 +85,25 @@ struct xe_device {
>> 		u8 tile_count;
>> 		/** @vm_max_level: Max VM level */
>> 		u8 vm_max_level;
>>+
>>+		/** @is_dgfx: is discrete device */
>>+		u8 is_dgfx:1;
>> 		/** @supports_usm: Supports unified shared memory */
>>-		bool supports_usm;
>>+		u8 supports_usm:1;
>> 		/** @has_asid: Has address space ID */
>>-		bool has_asid;
>>+		u8 has_asid:1;
>> 		/** @enable_guc: GuC submission enabled */
>>-		bool enable_guc;
>>+		u8 enable_guc:1;
>> 		/** @has_flat_ccs: Whether flat CCS metadata is used */
>>-		bool has_flat_ccs;
>>+		u8 has_flat_ccs:1;
>> 		/** @has_4tile: Whether tile-4 tiling is supported */
>>-		bool has_4tile;
>>+		u8 has_4tile:1;
>> 		/** @has_range_tlb_invalidation: Has range based TLB invalidations */
>>-		bool has_range_tlb_invalidation;
>>+		u8 has_range_tlb_invalidation:1;
>> 		/** @has_link_copy_engines: Whether the platform has link copy engines */
>>-		bool has_link_copy_engine;
>>+		u8 has_link_copy_engine:1;
>> 		/** @enable_display: display enabled */
>>-		bool enable_display;
>>+		u8 enable_display:1;
>>
>> #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>> 		struct xe_device_display_info {
>>-- 
>>2.39.2
>>

-- 
Jani Nikula, Intel Open Source Graphics Center
