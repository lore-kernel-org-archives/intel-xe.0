Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB10EB64DD
	for <intel-xe@archiver.kernel.org>; Fri, 11 Aug 2023 08:54:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1653E10E08F;
	Fri, 11 Aug 2023 08:54:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A58610E08F
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Aug 2023 08:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691744067; x=1723280067;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=WOsv3nIqTbVMIEUb+NCN2VXGoxT5cDQYuFduAu5DZEA=;
 b=RD8i1gxPc1hT6vxgUIvH2OptEIw/Hgs+RAb9T6Rom5ZSiMnGkv0dsL2j
 og2F/k8PotrWiqvtDEyAFT8sg/UBiddcRFyLxJY5SWFjuRHfM/PzHwcnm
 wjlsB1W5qDxK4macCW2piA05V4Klq0EanTqd5Jq4ssKZmIcScwhd16PJI
 DdADQ8DgJJwJ2RpMo1HNRooj9b6/auKSOmuYewn4I3Z5REUm9ona9zCAf
 +tjI9fwDkK6uGT3krb0RqHmCM0jYMNIFYEB7KT4LkXR4cCLi/164gZ96U
 cJnpkVcvt2A9n0v5P7BpIojApVw2DqqLqNv2BRpypfTXjqCknslI0gaCY A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="351235909"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; d="scan'208";a="351235909"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 01:54:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="822595838"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; d="scan'208";a="822595838"
Received: from unknown (HELO localhost) ([10.252.49.153])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 01:54:25 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <ZNWA8TxN1ZtdYuhV@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230809190453.1927134-1-jani.nikula@intel.com>
 <169161122546.10297.4625741320570358620@emeril.freedesktop.org>
 <ZNVZb3H4uBHtU9K7@intel.com> <ZNWA8TxN1ZtdYuhV@intel.com>
Date: Fri, 11 Aug 2023 11:54:21 +0300
Message-ID: <87il9mq7r6.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] 
 =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_series_st?=
 =?utf-8?q?arting_with_=5Bv2=2C1/9=5D__drm/i915/display=3A_add_I915_condit?=
 =?utf-8?q?ional_build_to_g4x=5Fhdmi=2Eh?=
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

On Thu, 10 Aug 2023, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> On Thu, Aug 10, 2023 at 05:41:03PM -0400, Rodrigo Vivi wrote:
>> On Wed, Aug 09, 2023 at 08:00:25PM -0000, Patchwork wrote:
>> >    Patch Details                                                                
>> >                                                                                 
>> >    Series: series starting with [v2,1/9] drm/i915/display: add I915             
>> >            conditional build to g4x_hdmi.h                                      
>> >    URL:    [1]https://patchwork.freedesktop.org/series/122242/                  
>> >    State:  failure                                                              
>> >                                                                                 
>> >    Participating hosts:                                                         
>> >    bat-pvc-2                                                                    
>> >    bat-atsm-2                                                                   
>> >    bat-dg2-oem2                                                                 
>> >    bat-adlp-7                                                                   
>> >    Missing hosts results[1]:                                                    
>> 
>> maybe it broke the build without CONFIG_DRM_XE_DISPLAY?
>
> I have verified this locally that it is not true and I have tested in DG2 and
> triggered a retest in CI.
>
> The retest still didn't run in PVC and I couldn't get a PVC working to test there,
> but I cannot see how that would fail in PVC and not fail in DG2 without display.
>
> So, I just pushed this patches since it is better to have them before my next
> rebase.

Thanks!

BR,
Jani.


>
>> 
>> >    bat-pvc-2                                                                    
>> >    Results: [2]xe-pw-122242v1                                                   
>> > 
>> > References
>> > 
>> >    Visible links
>> >    1. https://patchwork.freedesktop.org/series/122242/
>> >    2. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122242v1/index.html

-- 
Jani Nikula, Intel Open Source Graphics Center
