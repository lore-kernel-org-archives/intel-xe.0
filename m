Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F7C8D232FC
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jan 2026 09:12:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C0FE10E848;
	Fri,  9 Jan 2026 09:12:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hoUwsKbp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D79C310E848
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jan 2026 09:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767949934; x=1799485934;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=8NOSGPfxpvc2FZeXmjHSZLMkS+ijNHBCdD83++YxlwE=;
 b=hoUwsKbpcQM7XAbAcAokfBcqS+XQWP+j46M0gtM1mfO30jADWXylCuWW
 iHaYqYSNTi56vy2g2RUIytfmR/3dlRGohKYwmKn+JcqCpOU4fIzoZ63JT
 yl6BsmSj2CeTFTGtKoNSQXp6NgR0DBiT7g88+GRtfo63seuMLMKhDMDOF
 Oe4u3aTHcqMbk+2Qi0yGnweb8IWSGWFJ5l69cGZqOfXzCLiReqE/s6vco
 OAJztzU3Qu+7mnAiDyNvTDq+W5dfne+9hOT7gVo81rNYiqov+y+8UT0N2
 DGu0/5ziFYPFo2lYNbWsVNziqL6FMwB/3nEbqE5gB6yX8lCM9FeHCbUGN w==;
X-CSE-ConnectionGUID: MhcP7ig+TuOlZ5LW9mBXKg==
X-CSE-MsgGUID: qL4PNem9RsWYJ90Dmoellg==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="73187838"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="73187838"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 01:12:13 -0800
X-CSE-ConnectionGUID: JLO05+6PTSKOCPlQLRVPvg==
X-CSE-MsgGUID: K7bnAfjJQNK3d9ze+g2TMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="208486326"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.143])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 01:12:13 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 5/5] drm/xe: improve header check
In-Reply-To: <20260107180051.GT1180203@mdroper-desk1.amr.corp.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260107155401.2379127-1-jani.nikula@intel.com>
 <20260107155401.2379127-5-jani.nikula@intel.com>
 <20260107180051.GT1180203@mdroper-desk1.amr.corp.intel.com>
Date: Fri, 09 Jan 2026 11:12:09 +0200
Message-ID: <27255b05de3d18ac6b55cb139bcc8115f5812e1c@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, 07 Jan 2026, Matt Roper <matthew.d.roper@intel.com> wrote:
> On Wed, Jan 07, 2026 at 05:54:01PM +0200, Jani Nikula wrote:
>> Improve header check: Remove unused -DHDRTEST. Include the header twice
>> to check for include guards. Run kernel-doc on the header.
>> 
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>
> Didn't we used to have kerneldoc checks running in a CI.Hooks task on
> pre-merge?  It seems like those vanished at some point and these
> mistakes started creeping in...

I think they were running the full Sphinx build, which only checks
kernel-doc comments that are actually incorporated in the documentation
build. Everything else was ignored. But then there were a lot of
failures in the hook too [1]. I don't know what happened.

BR,
Jani.


[1] https://lore.kernel.org/r/175854145966.353633.13388139741450056729@1538d3639d33

>
>
> Matt
>
>> ---
>>  drivers/gpu/drm/xe/Makefile | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 2b20c79d7ec9..b39cbb756232 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -370,7 +370,8 @@ always-$(CONFIG_DRM_XE_WERROR) += \
>>  	$(patsubst %.h,%.hdrtest, $(shell cd $(src) && find * -name '*.h' $(hdrtest_find_args)))
>>  
>>  quiet_cmd_hdrtest = HDRTEST $(patsubst %.hdrtest,%.h,$@)
>> -      cmd_hdrtest = $(CC) -DHDRTEST $(filter-out $(CFLAGS_GCOV), $(c_flags)) -S -o /dev/null -x c /dev/null -include $<; touch $@
>> +      cmd_hdrtest = $(CC) $(filter-out $(CFLAGS_GCOV), $(c_flags)) -S -o /dev/null -x c /dev/null -include $< -include $<; \
>> +		$(srctree)/scripts/kernel-doc -none -Werror $<; touch $@
>>  
>>  $(obj)/%.hdrtest: $(src)/%.h FORCE
>>  	$(call if_changed_dep,hdrtest)
>> -- 
>> 2.47.3
>> 

-- 
Jani Nikula, Intel
