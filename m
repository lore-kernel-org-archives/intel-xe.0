Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB776C77B7C
	for <intel-xe@archiver.kernel.org>; Tue,  9 May 2023 08:11:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B618310E352;
	Tue,  9 May 2023 08:11:29 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 728A710E352
 for <intel-xe@lists.freedesktop.org>; Tue,  9 May 2023 08:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683619887; x=1715155887;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=nxyHI+qU0uuqAfVEy1Qgq3MBagu1LaNGL8oPM+8BlUw=;
 b=jFBzdRFRoXvnsXj6jKtzKz6cCVDnT8sdBfYcEDbotIbOhckkeXnzh/pv
 6fRsXGrLX9Oga3eScV0ip38ljkbFywhuVYmHM3kR7avOHT1a4wWgBl29y
 +Sx5yVC0Sb0qU8YapS9KHgQwogv7DiiJomVNGbuBUrjIIYI64iI9tJOkV
 Rg6b8+d7GyGRFSQ39kak+w9p0et/xDdjW5qZV/hGPsN4yNXRVIAonSjpb
 lzUtFhKYQiJ0Dkq3n9d6W+0X0Wm+y4gL/kGfWNweUhHt7hlt1TgFdcJmm
 MB/NBZNqhTFej8Mt29/JSjvIj5xKhhL036X2IdNuuQWq2/WxBG3Kjm+DO Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="339060021"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; d="scan'208";a="339060021"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2023 01:11:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="768364886"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; d="scan'208";a="768364886"
Received: from unknown (HELO localhost) ([10.252.39.92])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2023 01:11:24 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
In-Reply-To: <20230508203215.GV10045@mdroper-desk1.amr.corp.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230508144618.162140-1-jani.nikula@intel.com>
 <20230508144618.162140-12-jani.nikula@intel.com>
 <20230508203215.GV10045@mdroper-desk1.amr.corp.intel.com>
Date: Tue, 09 May 2023 11:11:22 +0300
Message-ID: <878rdxorf9.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH 11/18] fixup! drm/xe: Introduce a new DRM
 driver for Intel GPUs
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
Cc: lucas.demarchi@intel.com, intel-xe@lists.freedesktop.org,
 rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, 08 May 2023, Matt Roper <matthew.d.roper@intel.com> wrote:
> On Mon, May 08, 2023 at 05:46:11PM +0300, Jani Nikula wrote:
>> Add the read8 accessor to support intel_de_read8.
>> 
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_mmio.h | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>> 
>> diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
>> index 1a32e0f52261..b72a0a75259f 100644
>> --- a/drivers/gpu/drm/xe/xe_mmio.h
>> +++ b/drivers/gpu/drm/xe/xe_mmio.h
>> @@ -17,6 +17,14 @@ struct xe_device;
>>  
>>  int xe_mmio_init(struct xe_device *xe);
>>  
>> +static inline u8 xe_mmio_read8(struct xe_gt *gt, u32 reg)
>> +{
>> +	if (reg < gt->mmio.adj_limit)
>> +		reg += gt->mmio.adj_offset;
>
> This could probably be a warn_on; as far as I know, there are no 8-bit
> registers in the GT, so if we wind up trying to read sgunit or display
> registers through a media GT's pointer it's a clue that something has
> probably gone wrong.

Looks like Rodrigo already pushed this, so this would need to be added
separately.

> Of course this MMIO stuff is a confusing mess due to the fact that xe_gt
> is being used all over the driver for things that are completely
> unrelated to any GT.

This. The abstractions don't match reality.


BR,
Jani.


> After cleaning up the GT vs tile mess, I plan to
> work on coming up with something more sane for MMIO windows too.  I'm
> thinking something like a "struct xe_mmio_view" that will replace xe_gt
> as the first parameter to the xe_mmio_* functions and can provide them
> with additional information to also do range validation on debug builds
> to ensure you're accessing the subset of registers you think you are,
> and functions to hand you an appropriate xe_mmio_view:
>  - xe_mmio_for_display(xe): warns if read/write outside display range
>  - xe_mmio_for_gt(gt): warns if read/write outside a GT range; if media
>    GT is the parameter, also warns if outside the GSI range or one of
>    the media engines
>  - xe_mmio_for_tile(tile):  unrestricted MMIO access for a tile, mostly
>    intended for use with sgunit, soc, etc. registers that are outside
>    the GT
>
>
> Matt
>
>> +
>> +	return readb(gt->mmio.regs + reg);
>> +}
>> +
>>  static inline void xe_mmio_write32(struct xe_gt *gt,
>>  				   u32 reg, u32 val)
>>  {
>> -- 
>> 2.39.2
>> 

-- 
Jani Nikula, Intel Open Source Graphics Center
