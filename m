Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35784C77B7C
	for <intel-xe@archiver.kernel.org>; Thu, 11 May 2023 12:32:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D8D810E12F;
	Thu, 11 May 2023 12:32:18 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2536110E0EA
 for <intel-xe@lists.freedesktop.org>; Thu, 11 May 2023 12:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683808335; x=1715344335;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=yc7NbOqlcCt3wp1z+xCbMNqkBPCRxfmoNSnmnxrJ4X0=;
 b=i9Rf0uEuD8uxUujIAM1Le/1d36Qq9PRKslkQsSsLnMPvavuCDNponxwQ
 2sQF4McjIlgUTeX9A6eUf+fV3oZxRvSLTyblxrwuIyoaIVZtec32jN+sG
 QV1M4vYiF0iMdj9tnb8dL98Ua8Ckf4L4b+BqGQ140J3rpjQRqrqi+E8U8
 +q6PRYHU2LziaOKv4HhKJLMKtcZKVgDnNC2SodniIYhLCtiH7eK20Dj8V
 mequiWRsLdTzcUlSWM7nEx9Kx8kd1x4roO3b5bXByRUyj4ik1o+ZrUrJh
 lq9ZUZ2+XyZpTHcNSg9lLQEb5zEKVMgXloGskWSu+kEzFMBkZjAagwKsE Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="334970970"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="334970970"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 05:32:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="677221043"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="677221043"
Received: from unknown (HELO localhost) ([10.237.66.162])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 05:32:13 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
In-Reply-To: <ui4rcyti66dcl3qtxpt4qmqz4xfwsczi6ym4svtlyfhh5idlh6@eicqy7iuk4sc>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230510154644.712030-1-jani.nikula@intel.com>
 <20230510154644.712030-2-jani.nikula@intel.com>
 <ui4rcyti66dcl3qtxpt4qmqz4xfwsczi6ym4svtlyfhh5idlh6@eicqy7iuk4sc>
Date: Thu, 11 May 2023 15:32:10 +0300
Message-ID: <87pm77kq0l.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH 2/2] fixup! drm/i915/display: Remaining
 changes to make xe compile
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
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, 10 May 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> On Wed, May 10, 2023 at 06:46:44PM +0300, Jani Nikula wrote:
>>Currently "drm/xe: Introduce a new DRM driver for Intel GPUs" removes
>>these lines, so don't add them in "drm/i915/display: Remaining changes
>>to make xe compile" to begin with!
>>
>>Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>---
>> drivers/gpu/drm/i915/i915_reg_defs.h | 4 ----
>> 1 file changed, 4 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/i915/i915_reg_defs.h b/drivers/gpu/drm/i915/i915_reg_defs.h
>>index a7c4101370ad..eac5a4141bfa 100644
>>--- a/drivers/gpu/drm/i915/i915_reg_defs.h
>>+++ b/drivers/gpu/drm/i915/i915_reg_defs.h
>>@@ -218,13 +218,9 @@ typedef struct {
>>
>> #define _MMIO(r) ((const i915_reg_t){ .reg = (r) })
>>
>>-#ifdef I915
>> typedef struct {
>> 	u32 reg;
>> } i915_mcr_reg_t;
>>-#else
>>-#define i915_mcr_reg_t i915_reg_t
>>-#endif
>
>
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Thanks, pushed to drm-xe-next.

BR,
Jani.

>
> Lucas De Marchi
>
>>
>> #define MCR_REG(offset)	((const i915_mcr_reg_t){ .reg = (offset) })
>>
>>-- 
>>2.39.2
>>

-- 
Jani Nikula, Intel Open Source Graphics Center
