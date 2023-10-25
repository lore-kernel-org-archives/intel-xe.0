Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA036C07545
	for <intel-xe@archiver.kernel.org>; Wed, 25 Oct 2023 16:08:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB93910E5BE;
	Wed, 25 Oct 2023 16:08:02 +0000 (UTC)
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Wed, 25 Oct 2023 16:08:00 UTC
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E82210E5BE
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Oct 2023 16:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698250081; x=1729786081;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=K8tyZRpG15cxBns49/Dxy44d4kVyEMwsP0SF6nShXRQ=;
 b=Hy8+umIuvvtaG/KHICJbXjwMN5NBqFEocx+Rebs89XleL6vB6B3xVCT7
 KeAWpWIahCloUp6ROtuwb7rYEXt6XyTpSCIpmS3MGPrLEl5fGlGl+6Bb8
 ijRy6Y4nqySutvWfcB39JVjgQNCcZk9LQe96ou8SX+lYwwUGVQQaO1Jfi
 eWzMvBdulrS6ksp10JClPE40NeCdiTCA8RM71haB4IXkMhxH5HNrGyXon
 DMn5WOdpNE6pxFZEdvgKEAmd08Qt/kdl6kWBba+FjOBrA1BotJApUiCCf
 9jVA6QcHDxs6is1RdN+USwFIvGm4SuHHUGavPR1gT3yifQ4Py1enFCbxu A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="131990"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="131990"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 09:00:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="932402679"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="932402679"
Received: from dtorrice-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.33.83])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 09:00:50 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
In-Reply-To: <dt7zwchu5mwb6sgrxbq7hcyti6dh5cermo4eqhoyjdcc3s62tn@jummbosmcllp>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231025104306.667700-1-jani.nikula@intel.com>
 <20231025104306.667700-2-jani.nikula@intel.com>
 <dt7zwchu5mwb6sgrxbq7hcyti6dh5cermo4eqhoyjdcc3s62tn@jummbosmcllp>
Date: Wed, 25 Oct 2023 19:00:48 +0300
Message-ID: <87il6u8zf3.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH 2/2] drm/i915: drop gt/intel_gt.h include
 from skl_universal_plane.c
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, 25 Oct 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> On Wed, Oct 25, 2023 at 01:43:06PM +0300, Jani Nikula wrote:
>>No longer needed after commit 94bcf876cb6a ("drm/i915/mtl: Drop
>>Wa_14017240301").
>>
>>Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>>Link: https://patchwork.freedesktop.org/patch/msgid/20231011142704.985867-1-jani.nikula@intel.com
>>(cherry picked from commit f17c08a6046f0c9383a61d7009216b0ad3369db4)
>>
>>---
>>
>>Note: The cherry-pick conflicted, but it should be trivial to resolve.
>
>
> Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>

Thanks, pushed.

BR,
Jani.

>
> Lucas De Marchi
>
>>---
>> drivers/gpu/drm/i915/display/skl_universal_plane.c | 1 -
>> 1 file changed, 1 deletion(-)
>>
>>diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
>>index 6ce7dc419df1..188d53bb8594 100644
>>--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
>>+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
>>@@ -21,7 +21,6 @@
>> #include "skl_scaler.h"
>> #include "skl_universal_plane.h"
>> #include "skl_watermark.h"
>>-#include "gt/intel_gt.h"
>> #ifdef I915
>> #include "pxp/intel_pxp.h"
>> #else
>>-- 
>>2.39.2
>>

-- 
Jani Nikula, Intel
