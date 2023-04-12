Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89A85C7619A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Apr 2023 19:26:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CB9810E939;
	Wed, 12 Apr 2023 19:26:47 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F31E210E939
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Apr 2023 19:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681327606; x=1712863606;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=E13d9iurzY6XZ8CdS/x1C+/u78QOur+BwemvSDmu0Ms=;
 b=RjxM1+u1aePQKIdqgPOf6WPxLTlLhD22CvVdSzCGyXkJpRGnoFwhjN5W
 pIod5tR6e0EIf4EdvP40o0aXhuirz19WC0XEth8hD9hWqZiU4StajDpBc
 87dbngydBtzCv+1vVyGNQkLNI/7WsLvZyQJrMg8t5o5R5tPkaYLa+5Otm
 Lqd+a8Yh+S5cmOuD4S8vCcRrkdF0Oe/7IMy1hmjtInFzIBqtyb0cCUvf9
 Bo9BsqY8K6rsALCSNaEabw5wR/yvOiqYZlUWqfbBOu9YvUT9xDYo7o84Q
 h6zu9xqSZALH9xvySLxunB/+CY5tcbhLLRLVbjHsUcyVcgN4u1N63Hw7o Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="342752120"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="342752120"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 12:25:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="666476216"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="666476216"
Received: from smoticic-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.45.172])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 12:25:18 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
In-Reply-To: <20230412180911.i5xoctni5mr2r24n@ldmartin-desk2.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230412142006.877109-1-jani.nikula@intel.com>
 <20230412142006.877109-22-jani.nikula@intel.com>
 <20230412180911.i5xoctni5mr2r24n@ldmartin-desk2.lan>
Date: Wed, 12 Apr 2023 22:25:16 +0300
Message-ID: <87bkjsdhsz.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH 21/41] fixup! drm/xe/display: Implement
 display support
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

On Wed, 12 Apr 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> On Wed, Apr 12, 2023 at 05:19:46PM +0300, Jani Nikula wrote:
>>It's okay to include uapi/drm/i915_drm.h. It provides us with structs to
>>make stuff compile, even if we don't use them in xe.
>>
>>The placement is perhaps a bit random, though.
>>
>>Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>---
>> drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h | 1 +
>> 1 file changed, 1 insertion(+)
>>
>>diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
>>index 133c60cb3a09..c40bb27ac72a 100644
>>--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
>>+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
>>@@ -1,6 +1,7 @@
>> #ifndef I915_VMA_H
>> #define I915_VMA_H
>>
>>+#include <uapi/drm/i915_drm.h>
>
> my worry is that this creates an implicit dependency that ends up using
> where it shouldn't, particularly when included in a header. Where
> exactly this is needed? Can the include be moved to a .c?

struct drm_intel_sprite_colorkey ckey member in struct
intel_plane_state, in intel_display_types.h, and elsewhere. Can't be
moved to a .c file.

Without this, the member needs to be conditionally compiled, as well as
all the code referencing it all over the place. Though in most places
the code will just go away because it'll be unreferenced. But it needs
to compile before being optimized away.

BR,
Jani.



>
> Lucas De Marchi
>
>> #include <drm/drm_mm.h>
>>
>> struct xe_bo;
>>-- 
>>2.39.2
>>

-- 
Jani Nikula, Intel Open Source Graphics Center
