Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F6CC77B7A
	for <intel-xe@archiver.kernel.org>; Wed, 17 May 2023 07:53:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09BF210E3CB;
	Wed, 17 May 2023 07:53:28 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0073810E3C9
 for <intel-xe@lists.freedesktop.org>; Wed, 17 May 2023 07:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684310006; x=1715846006;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=9UItBAJYjj2qKuOiAn1Tc0q3c0qGtYAluOl9E+kEQXc=;
 b=JdnLDa/h1LPRmptlIy3gHlycwiOISrecrwngR9rGXlY3PfwOz/gi90FM
 l0APdZaovfaTTAzS/F8adJzgPcO73lHaBSLaygMFSjXjU8XCs4IHkigu3
 QxwsNEbp5JaOIJG5C8A/wKd1Kk/qd0ruoXX+kwD0sBV4l7KzSqYv3pHfy
 G3rZ08M9t9E5+zN9yEJdRu3SYnIrdDKK1G7vZ5ouD0wKqg8zl1IgsTCAE
 DnCKjhTTgOiDbQkOgn/ma0WKkLJyFtxAAcTaxg/GxcaV6tPmT69d/xdPO
 RIIVZBOv1pfVZ9jyHhgqU96OPsZD8fOJW0SUTjxJKyPrY4a2GGId8A9ob A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="353984804"
X-IronPort-AV: E=Sophos;i="5.99,281,1677571200"; d="scan'208";a="353984804"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 00:53:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="704723936"
X-IronPort-AV: E=Sophos;i="5.99,281,1677571200"; d="scan'208";a="704723936"
Received: from pakurapo-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.252.50.207])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 00:53:23 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@kernel.org>
In-Reply-To: <ZGPuwpv4tg03730V@rdvivi-mobl4>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230511092828.833211-1-jani.nikula@intel.com>
 <ZGPuwpv4tg03730V@rdvivi-mobl4>
Date: Wed, 17 May 2023 10:53:20 +0300
Message-ID: <87sfbvgzrj.fsf@intel.com>
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, 16 May 2023, Rodrigo Vivi <rodrigo.vivi@kernel.org> wrote:
> On Thu, May 11, 2023 at 12:28:28PM +0300, Jani Nikula wrote:
>> The dsparb_lock may be coming back with [1] later, but adding it here is
>> probably just a rebase leftover. Drop it.
>> 
>> [1] https://patchwork.freedesktop.org/patch/msgid/20230327161223.406573-1-rodrigo.vivi@intel.com
>
> ouch...
>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Thanks, pushed.

>
>
>> 
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/gpu/drm/i915/display/intel_display_core.h | 3 ---
>>  drivers/gpu/drm/i915/i915_driver.c                | 1 -
>>  2 files changed, 4 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/i915/display/intel_display_core.h b/drivers/gpu/drm/i915/display/intel_display_core.h
>> index 437f623337e3..e36f88a39b86 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display_core.h
>> +++ b/drivers/gpu/drm/i915/display/intel_display_core.h
>> @@ -264,9 +264,6 @@ struct intel_wm {
>>  	 */
>>  	struct mutex wm_mutex;
>>  
>> -	/* protects DSPARB registers on pre-g4x/vlv/chv */
>> -	spinlock_t dsparb_lock;
>> -
>>  	bool ipc_enabled;
>>  };
>>  
>> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
>> index 5d302602793c..12ba7cf78b1e 100644
>> --- a/drivers/gpu/drm/i915/i915_driver.c
>> +++ b/drivers/gpu/drm/i915/i915_driver.c
>> @@ -215,7 +215,6 @@ static int i915_driver_early_probe(struct drm_i915_private *dev_priv)
>>  	spin_lock_init(&dev_priv->irq_lock);
>>  	spin_lock_init(&dev_priv->gpu_error.lock);
>>  	spin_lock_init(&dev_priv->display.fb_tracking.lock);
>> -	spin_lock_init(&dev_priv->display.wm.dsparb_lock);
>>  	mutex_init(&dev_priv->display.backlight.lock);
>>  
>>  	mutex_init(&dev_priv->sb_lock);
>> -- 
>> 2.39.2
>> 

-- 
Jani Nikula, Intel Open Source Graphics Center
