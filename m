Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A92CE7A94
	for <intel-xe@archiver.kernel.org>; Mon, 25 Sep 2023 11:27:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C934C10E21B;
	Mon, 25 Sep 2023 11:27:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D4E510E251
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Sep 2023 11:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695641276; x=1727177276;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=mxgDviQJrlv58fcse416UEUoOUHuTfXL+Zx+EoKAD4U=;
 b=GHJIt/aGnLvB4ei1dZkfL5Smm+73jUUwKqrPH26Ti0JJiQ4NrWWk5Wp9
 8sG0aa2Q/Dfbkun6kihn0UcJX9qnbMee5Sxq4WaCqxd8X0X3V4zeuhEiK
 hmRtP/Jp1NtRLMEJH+1Im4hzjdFe0MXDwcTHR62inJtwCVyX9dMe8bF1a
 p/xB2YBVzgc7kJikJTctuB+wHlA9stcxfHBkZS3KzQaYjhOZrTSUetBGF
 PzgvZzaJeTeqMdmPeiXH1ELmo9cgxx7+k7d0NyJjX9mmfwjraEtCgi38U
 vt2DGvSBw6rQNH8vtF+ATv3YjwhgkwfaTw5IOscDmOFS60eVl9svx+AuT Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="378495777"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; d="scan'208";a="378495777"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 04:27:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="741902317"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; d="scan'208";a="741902317"
Received: from smgotth-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.40.46])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 04:27:53 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Shankar, Uma" <uma.shankar@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
In-Reply-To: <CY5PR11MB6344C71CD63660EEACF3BB00F4FCA@CY5PR11MB6344.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230924144751.446446-1-arun.r.murthy@intel.com>
 <20230924144751.446446-2-arun.r.murthy@intel.com>
 <CY5PR11MB6344C71CD63660EEACF3BB00F4FCA@CY5PR11MB6344.namprd11.prod.outlook.com>
Date: Mon, 25 Sep 2023 14:27:51 +0300
Message-ID: <877coeo5l4.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH 2/2] Revert "FIXME: drm/i915: xe doesn't have
 fastboot module parameter"
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
Cc: "Murthy, Arun R" <arun.r.murthy@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, 25 Sep 2023, "Shankar, Uma" <uma.shankar@intel.com> wrote:
>> -----Original Message-----
>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Arun R
>> Murthy
>> Sent: Sunday, September 24, 2023 8:18 PM
>> To: intel-xe@lists.freedesktop.org
>> Cc: Murthy, Arun R <arun.r.murthy@intel.com>
>> Subject: [Intel-xe] [PATCH 2/2] Revert "FIXME: drm/i915: xe doesn't have fastboot
>> module parameter"
>> 
>> Fastboot module parameter has been added to xe driver.
>
> Use "git commit --fixup" linking to patch which introduce the original change.
> Suggested by Jani in a different series.

Either that, or if the commit is completely being removed, the revert is
fine also. They'll be rebased away.

BR,
Jani.


>
> Regards,
> Uma Shankar
>
>> This reverts commit e1d816044a2feb4aab2592c840e999bd9a13f0a8.
>> ---
>>  drivers/gpu/drm/i915/display/intel_display.c | 4 ----
>>  1 file changed, 4 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/i915/display/intel_display.c
>> b/drivers/gpu/drm/i915/display/intel_display.c
>> index b2e16cb8d026..46a166b9ae43 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display.c
>> +++ b/drivers/gpu/drm/i915/display/intel_display.c
>> @@ -4986,7 +4986,6 @@ pipe_config_mismatch(bool fastset, const struct
>> intel_crtc *crtc,
>> 
>>  static bool fastboot_enabled(struct drm_i915_private *dev_priv)  { -#ifdef I915
>>  	if (dev_priv->params.fastboot != -1)
>>  		return dev_priv->params.fastboot;
>> 
>> @@ -5000,9 +4999,6 @@ static bool fastboot_enabled(struct drm_i915_private
>> *dev_priv)
>> 
>>  	/* Disabled by default on all others */
>>  	return false;
>> -#else
>> -	return true;
>> -#endif
>>  }
>> 
>>  bool
>> --
>> 2.25.1
>

-- 
Jani Nikula, Intel
