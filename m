Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D59E77188
	for <intel-xe@archiver.kernel.org>; Fri, 20 Dec 2024 08:58:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE14110EF2D;
	Fri, 20 Dec 2024 08:58:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EkGUAtSg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FF8B10EF2C;
 Fri, 20 Dec 2024 08:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734685086; x=1766221086;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=9YAbTC/ZzjGxYdlM6p4Lo37vySeQep4beFnu/uC1omY=;
 b=EkGUAtSga/rfnsOtAWNr7wkAVFJw557fdSLz0ElV2YgJuJxetZMrVAyT
 zLN/GP+T7iuRpap2qDtKk8CvC7tdu8PcJiliVtYCJmmPCTq8MAPh6oKTZ
 V4DE7oW+ZovxGZDj89uK0oLWGJJameknWwbIoTr2N/TDDQQV85LmEu617
 kqPZ1QPi4UYjXBgCGwoYKjekSvV34/IgDWJPW4GsRqkMjO6OdvO7QSe1J
 t/X/y1BKKn86j+Om7T6WIMPrcwpdfJyWehFgqsPSZtR/mQThOKAjIFlSv
 9etTVWKzXXJ/9Gye2z0G1lbe025AttaozkpQ7CxazJPAmZygxTaZbNWjh A==;
X-CSE-ConnectionGUID: +zNRdJ2NTruw/2dk2Wzfhg==
X-CSE-MsgGUID: x9waUcv4Su6q5xx/R21BKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="34945587"
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; d="scan'208";a="34945587"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 00:58:06 -0800
X-CSE-ConnectionGUID: EQkq0mq7RNupa84ykXD7WQ==
X-CSE-MsgGUID: ePEDoSsbT+qI0Thw18b4TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; d="scan'208";a="98854349"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.210])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 00:58:04 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/dmc_wl: store register ranges in rodata
In-Reply-To: <173453211835.3475.8229112069297893910@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241218141734.2583601-1-jani.nikula@intel.com>
 <173453211835.3475.8229112069297893910@intel.com>
Date: Fri, 20 Dec 2024 10:57:59 +0200
Message-ID: <87ikrepw88.fsf@intel.com>
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

On Wed, 18 Dec 2024, Gustavo Sousa <gustavo.sousa@intel.com> wrote:
> Quoting Jani Nikula (2024-12-18 11:17:34-03:00)
>>Add const to register range arrays to store them in rodata. They don't
>>need to be modified.
>>
>>Cc: Gustavo Sousa <gustavo.sousa@intel.com>
>>Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Good idea.
>
> Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

Thanks for the review, pushed to drm-intel-next.

BR,
Jani.


>
>>---
>> drivers/gpu/drm/i915/display/intel_dmc_wl.c | 6 +++---
>> 1 file changed, 3 insertions(+), 3 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/i915/display/intel_dmc_wl.c b/drivers/gpu/drm/i915/display/intel_dmc_wl.c
>>index 3ac44151aab5..02de3ae15074 100644
>>--- a/drivers/gpu/drm/i915/display/intel_dmc_wl.c
>>+++ b/drivers/gpu/drm/i915/display/intel_dmc_wl.c
>>@@ -55,12 +55,12 @@ struct intel_dmc_wl_range {
>>         u32 end;
>> };
>> 
>>-static struct intel_dmc_wl_range powered_off_ranges[] = {
>>+static const struct intel_dmc_wl_range powered_off_ranges[] = {
>>         { .start = 0x60000, .end = 0x7ffff },
>>         {},
>> };
>> 
>>-static struct intel_dmc_wl_range xe3lpd_dc5_dc6_dmc_ranges[] = {
>>+static const struct intel_dmc_wl_range xe3lpd_dc5_dc6_dmc_ranges[] = {
>>         { .start = 0x45500 }, /* DC_STATE_SEL */
>>         { .start = 0x457a0, .end = 0x457b0 }, /* DC*_RESIDENCY_COUNTER */
>>         { .start = 0x45504 }, /* DC_STATE_EN */
>>@@ -94,7 +94,7 @@ static struct intel_dmc_wl_range xe3lpd_dc5_dc6_dmc_ranges[] = {
>>         {},
>> };
>> 
>>-static struct intel_dmc_wl_range xe3lpd_dc3co_dmc_ranges[] = {
>>+static const struct intel_dmc_wl_range xe3lpd_dc3co_dmc_ranges[] = {
>>         { .start = 0x454a0 }, /* CHICKEN_DCPR_4 */
>> 
>>         { .start = 0x45504 }, /* DC_STATE_EN */
>>-- 
>>2.39.5
>>

-- 
Jani Nikula, Intel
