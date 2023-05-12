Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D2AC7EE24
	for <intel-xe@archiver.kernel.org>; Fri, 12 May 2023 07:28:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73BA510E107;
	Fri, 12 May 2023 07:28:07 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C72810E107
 for <intel-xe@lists.freedesktop.org>; Fri, 12 May 2023 07:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683876486; x=1715412486;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=AYSnRW+VSNM6x7F6AR1vMfeicC5AhL4LOyDzClMUHRs=;
 b=eAa+kDCas5YPUUeMDdw0BYj7hjecn/DONk4x6UkFrp8NtdMf9g3grWet
 JAsB+ZzTfSCd2B4BzrhxBZcYPhNlcyjKUOGVOWRGLnvbrpaipgTvRpw9K
 5u3DhHQ9Qw5PUxckghkzNoBG8ozYk4N8PvGJFMQKTIZH1VG5ufouWkD9Q
 S+5/qbw6bcdDYeGApAuk/6/S5mU0F45VXpddDRB/kf2s65r+id15+DLpf
 5vhSGORvDJ8DYm+typPfl661xWb/Wy6pCdgUxdiSz2Hqz22UVwd1EumlB
 5r1vKnFN7qE8eb02hV6oqUBRygQleLJD8Ssl0B7omymJiJIpstvMQ0cLx A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="331090682"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="331090682"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 00:28:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="844311831"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="844311831"
Received: from skwasnia-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.39.231])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 00:28:04 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
In-Reply-To: <dfrfnnjx4ajibnh6tolujfsmhyupvva3yud6dxrsm2mam43mff@vlgdco453ye5>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230511122901.872670-1-jani.nikula@intel.com>
 <dfrfnnjx4ajibnh6tolujfsmhyupvva3yud6dxrsm2mam43mff@vlgdco453ye5>
Date: Fri, 12 May 2023 10:28:01 +0300
Message-ID: <87v8gyj9fi.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH] fixup! drm/i915/display: Remaining changes
 to make xe compile
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

On Thu, 11 May 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> On Thu, May 11, 2023 at 03:29:01PM +0300, Jani Nikula wrote:
>>I don't think the ifdef is needed anymore.
>>
>>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> correct, it went away in a squash to drm/xe: Introduce a new DRM driver for Intel GPUs
> that removed the define
>
> #define i915_mcr_reg_t i915_reg_t
>
> (and the ifdef here was to workaround a compiler break due to that since
>   _Generic() would then be passed 2 identical types )
>
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Thanks, pushed.

>
>
> Lucas De Marchi
>
>>---
>> drivers/gpu/drm/i915/i915_reg_defs.h | 4 ----
>> 1 file changed, 4 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/i915/i915_reg_defs.h b/drivers/gpu/drm/i915/i915_reg_defs.h
>>index eac5a4141bfa..622d603080f9 100644
>>--- a/drivers/gpu/drm/i915/i915_reg_defs.h
>>+++ b/drivers/gpu/drm/i915/i915_reg_defs.h
>>@@ -231,12 +231,8 @@ typedef struct {
>>  * simply operations on the register's offset and don't care about the MCR vs
>>  * non-MCR nature of the register.
>>  */
>>-#ifdef I915
>> #define i915_mmio_reg_offset(r) \
>> 	_Generic((r), i915_reg_t: (r).reg, i915_mcr_reg_t: (r).reg)
>>-#else
>>-#define i915_mmio_reg_offset(r) ((r).reg)
>>-#endif
>> #define i915_mmio_reg_equal(a, b) (i915_mmio_reg_offset(a) == i915_mmio_reg_offset(b))
>> #define i915_mmio_reg_valid(r) (!i915_mmio_reg_equal(r, INVALID_MMIO_REG))
>>
>>-- 
>>2.39.2
>>

-- 
Jani Nikula, Intel Open Source Graphics Center
