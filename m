Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEBD1C6FA99
	for <intel-xe@archiver.kernel.org>; Fri, 10 Mar 2023 11:07:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B17110E9C9;
	Fri, 10 Mar 2023 11:07:18 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C6FA10E9C9
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Mar 2023 11:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678446435; x=1709982435;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=fJygLGSrjlMUDrvUrWBIEgjhDvYFipFvvTVAz7kBbrI=;
 b=moucf35r0FfoEJJesV5siIzORqtGCsEMI4rLPSpHPJbBBzc+5wNgDCqY
 o5Rc4VPsI/oKAe7OON/P4ATz7YMxB1rZaOxTBlTis49sP2QhXySF7hZXF
 xSu8XwMTDn6B3ontyir1F+JSJUdhONmoSHZIavBCOPHXsWUJVQ7Ob7iAM
 kV7f36BJiygbTNbmSu1b3oaAXpoJoTN8EwiZ8sGQPM1PLnbg4F13KPJA2
 caI9ksg5+ukvRh0GiZpOo9WtZgIgRRBY3YG8F6eQseM5ykLIwnE1Tz/si
 oCbV+6MAx+UlHBpS+8Yi470PW3lR3LRZNQcAat07tKq936YeBmHwszG3r g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="364358755"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; d="scan'208";a="364358755"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 03:07:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="680173601"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; d="scan'208";a="680173601"
Received: from klausuhl-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.33.190])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 03:07:13 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
In-Reply-To: <ZApbUEobAF/ULC41@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230309121746.479146-1-jani.nikula@intel.com>
 <ZApbUEobAF/ULC41@intel.com>
Date: Fri, 10 Mar 2023 13:07:11 +0200
Message-ID: <87r0tw9868.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH] drm/xe: make compound literal initialization
 const
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

On Thu, 09 Mar 2023, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> On Thu, Mar 09, 2023 at 02:17:46PM +0200, Jani Nikula wrote:
>> Be careful about having const in the compound literal initialization to
>> keep the initializers in rodata. Here, the impact is 1.8k of mutable
>> data moved to rodata.
>
> is there any static tool/script that we could run along with checkpatch
> to prevent these?

Glad you asked. Over the years I had accumulated a number of quick bash
scripts for checking various style issues in i915. I now have them all
gathered in a single python script at [1]. It's not the greatest, and I
kind of wish checkpatch was more accessible (i.e. not perl) and allowed
local plugins, but this is what I have.

It's really just a collection of simple git greps. And probably too many
false positives to add to CI. And you'd have to hack it to make it work
on patches, not the source tree.

Anyway, for global data it uses objdump. You need to build the driver
first, and then run 'i915-check data'. Or, for xe, 'i915-check
--path=drivers/gpu/drm/xe data'.

Try 'i915-check help' or 'i915-check --explain <check>' where <check> is
one of the listed checks.


BR,
Jani.


PS. Regarding the recent discussion whether module parameters should be
individual variables or gathered in a struct, the objdump is IMO in
favour of a struct. Contrast the scattered results in xe:

drivers/gpu/drm/xe/xe_module.o: .data	0000000000000008 xe_param_force_probe
drivers/gpu/drm/xe/xe_module.o: .data	0000000000000004 xe_guc_log_level
drivers/gpu/drm/xe/xe_module.o: .bss	0000000000000004 xe_force_vram_bar_size
drivers/gpu/drm/xe/xe_module.o: .data	0000000000000001 enable_display
drivers/gpu/drm/xe/xe_module.o: .data	0000000000000001 enable_guc

with i915:

drivers/gpu/drm/i915/i915_params.o: .data..read_mostly	00000000000000a0 i915_modparams



[1] https://gitlab.freedesktop.org/jani/i915-check


>
>> 
>> add/remove: 0/1 grow/shrink: 0/0 up/down: 0/-1804 (-1804)
>> Data                                         old     new   delta
>> __compound_literal                          1804       -   -1804
>> Total: Before=42425, After=40621, chg -4.25%
>> add/remove: 0/0 grow/shrink: 1/0 up/down: 1804/0 (1804)
>> RO Data                                      old     new   delta
>> __compound_literal                          7696    9500   +1804
>> Total: Before=138535, After=140339, chg +1.30
>> 
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>
>
>> ---
>>  drivers/gpu/drm/xe/xe_rtp.h | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
>> index bd44fd8bbe05..8fc393ef7358 100644
>> --- a/drivers/gpu/drm/xe/xe_rtp.h
>> +++ b/drivers/gpu/drm/xe/xe_rtp.h
>> @@ -363,7 +363,7 @@ struct xe_reg_sr;
>>   */
>>  #define XE_RTP_RULES(r1, ...)							\
>>  	.n_rules = COUNT_ARGS(r1, ##__VA_ARGS__),				\
>> -	.rules = (struct xe_rtp_rule[]) {					\
>> +	.rules = (const struct xe_rtp_rule[]) {					\
>>  		CALL_FOR_EACH(__ADD_XE_RTP_RULE_PREFIX, r1, ##__VA_ARGS__)	\
>>  	}
>>  
>> @@ -390,7 +390,7 @@ struct xe_reg_sr;
>>   */
>>  #define XE_RTP_ACTIONS(a1, ...)							\
>>  	.n_actions = COUNT_ARGS(a1, ##__VA_ARGS__),				\
>> -	.actions = (struct xe_rtp_action[]) {					\
>> +	.actions = (const struct xe_rtp_action[]) {				\
>>  		CALL_FOR_EACH(__ADD_XE_RTP_ACTION_PREFIX, a1, ##__VA_ARGS__)	\
>>  	}
>>  
>> -- 
>> 2.39.1
>> 

-- 
Jani Nikula, Intel Open Source Graphics Center
