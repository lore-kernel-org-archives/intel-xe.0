Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED72C47DDF
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jan 2024 09:20:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1E76112E81;
	Tue, 30 Jan 2024 09:20:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95234112E81
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jan 2024 09:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706606405; x=1738142405;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=eru7osboTH+pU7/3NXWNv7D1kX5niZtRDIsYYobU2tM=;
 b=DW5crVp9CP5HqcOH+51aDDRnYvD3QnWQAqKlGkTVfOAtJozYj6bHLJrd
 PEMbI2ln9NvjIAu7zu6RO9NhQp/g71XX/z7WGpwqT61wo1m8hGi5DDMFY
 Uge+QWrWo4ozxGXmHg8FsfzWgZPwWU89ggVTOKqcXzgYA7ImiKH0/0DHu
 zV93BwX4c3PkyqrRIkNXsBGhR64lKF4ibYN5uqfa5jKE+LLtI/OHarAYK
 X/SVtPHlJasQT/NKNg2K1x7rv5bn9Zv473aqI6tvNbiyCrYtMsMZEAICD
 PUnaOqsMZf6hEKWE+kVp92IMJAjXkdBC191spSmeeyLaYNqNt73pIdOP+ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="402089440"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; d="scan'208";a="402089440"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 01:20:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; 
   d="scan'208";a="3677563"
Received: from dcarleto-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.59.176])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 01:19:49 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: Re: [PATCH 2/2] drm/xe: drop display/ subdir from include
 directories
In-Reply-To: <87ttn4m0r2.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240122101428.2683468-1-jani.nikula@intel.com>
 <20240122101428.2683468-2-jani.nikula@intel.com>
 <47hzp5ya6cwdcidq7cwid5ykpkn6wavxtf3ynjf3xgirbgulsc@afsk7pgae3lx>
 <87le8hnu6r.fsf@intel.com>
 <663d25vngq6zcee6vupweq7dohhmftpaggtnfl7752sn6qhdao@ypgsfn62skob>
 <87ttn4m0r2.fsf@intel.com>
Date: Tue, 30 Jan 2024 11:19:45 +0200
Message-ID: <877cjrjhzi.fsf@intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, 23 Jan 2024, Jani Nikula <jani.nikula@intel.com> wrote:
> On Tue, 23 Jan 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> On Mon, Jan 22, 2024 at 07:39:56PM +0200, Jani Nikula wrote:
>>>On Mon, 22 Jan 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>>>> the downside of patch 1 is now that core xe code can include any of the
>>>> display/ headers, but only xe_display.h is acceptable to keep the
>>>> interface sane.
>>>
>>>I'd say xe_display.h remains the only interface towards xe core, I don't
>>>think this patch changes that, and its location doesn't really give any
>>>guarantees. It's been a matter of sticking display/ in the include
>>>anyway, and enforcing that is a matter of maintainer vigilance.
>>
>> I just thought the previous split was slightly better: No code in xe
>> should include display/ and should rather use the xe_display.[hc]
>> interface.
>>
>> Now with #include "display/xe_display.h" spread throughout the code,
>> this could serve as example for people to start including stuff they
>> shouldn't.
>>
>> I'm not entirely opposed, so if you and others agree, please go ahead.
>
> Well, at the moment you can include *anything* from under display/
> *without* the prefix, because it's all in the include path. (Although
> that will fail for DRM_XE_DISPLAY=n, but does CI even build that combo
> regularly?)
>
> I'm fine with dropping this too. I just think it makes it easier to
> check that nothing outside of display/ does any displayish things.
>
> Your call.

I've held off on pushing this. What's the verdict?

BR,
Jani.


-- 
Jani Nikula, Intel
