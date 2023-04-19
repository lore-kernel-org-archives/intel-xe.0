Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37569C6FD18
	for <intel-xe@archiver.kernel.org>; Wed, 19 Apr 2023 19:50:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB03310E1F2;
	Wed, 19 Apr 2023 19:50:58 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9C0B10E1F2
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Apr 2023 19:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681933855; x=1713469855;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ATSDZxZsZvS06tYDWrGybYKwyvzCT3QYxtnr4hPkykw=;
 b=OxQdQSuGrhF0FvlG2yLeSv7bCbSgUXG8uFVqrOXhyrui6UyXgSYMLrN3
 LAAFdoNjq7QTxd6szU8aWUrck8KyGWUoV3tAMWyZ6qgAHAbOKMlLhIDPY
 /kNhhPUHlan4tZKeSzMt8o3j72lTwq2VuJn9EkmvYbIc9Yc1kxyU9XBLg
 aoCX3jqccPjGX35Sa4YU8s32qkceLmun82gcJplcFT+xGoyW4QgEHwdZt
 QgWwW+EWFphExQpJ/YV6R05qsadrXuHlhwIubLCgginV1GK9D5DBtg6ck
 ifzahbTgzO9F226mXETyRq77e8VJQbX7SXBdsyMTGQ2qQG0Sg/svfsIat A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="344295740"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="344295740"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 12:50:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="1021333082"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="1021333082"
Received: from yedidyal-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.47.37])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 12:50:52 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
In-Reply-To: <ZEBCZ8ZhecK0bO4z@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230419123947.543175-1-jani.nikula@intel.com>
 <20230419123947.543175-3-jani.nikula@intel.com>
 <ZEBCZ8ZhecK0bO4z@intel.com>
Date: Wed, 19 Apr 2023 22:50:51 +0300
Message-ID: <87v8hrwt0k.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH 2/9] drm/i915/wm: remove stale and unused
 ilk_wm_max_level() declaration
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
Cc: lucas.demarchi@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, 19 Apr 2023, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> On Wed, Apr 19, 2023 at 03:39:40PM +0300, Jani Nikula wrote:
>> The declaration was removed earlier, but got accidentally resurrected in
>> i915xx_wm.[ch] refactoring. Remove harder.
>
> Should this be a fixup? or a patch to i915? I got confused on this...

This goof-up happened in i915, and I posted this to intel-gfx
separately. See the Link below.

BR,
Jani.

>
>> 
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> Link: https://patchwork.freedesktop.org/patch/msgid/20230419115449.422214-1-jani.nikula@intel.com
>> ---
>>  drivers/gpu/drm/i915/display/i9xx_wm.h | 1 -
>>  1 file changed, 1 deletion(-)
>> 
>> diff --git a/drivers/gpu/drm/i915/display/i9xx_wm.h b/drivers/gpu/drm/i915/display/i9xx_wm.h
>> index a7875cbcd05a..b87ae369685a 100644
>> --- a/drivers/gpu/drm/i915/display/i9xx_wm.h
>> +++ b/drivers/gpu/drm/i915/display/i9xx_wm.h
>> @@ -12,7 +12,6 @@ struct drm_i915_private;
>>  struct intel_crtc_state;
>>  struct intel_plane_state;
>>  
>> -int ilk_wm_max_level(const struct drm_i915_private *i915);
>>  bool ilk_disable_lp_wm(struct drm_i915_private *i915);
>>  void ilk_wm_sanitize(struct drm_i915_private *i915);
>>  bool intel_set_memory_cxsr(struct drm_i915_private *i915, bool enable);
>> -- 
>> 2.39.2
>> 

-- 
Jani Nikula, Intel Open Source Graphics Center
