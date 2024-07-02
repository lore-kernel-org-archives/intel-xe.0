Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F40FBC3065C
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jul 2024 12:05:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3BA010E034;
	Tue,  2 Jul 2024 12:05:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sw+aEqcn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BBAF10E034
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Jul 2024 12:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719921921; x=1751457921;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=tmVpUwwJ/3PRDLPnTf2+L7Sik3ptLM1POpa69QhjzSY=;
 b=Sw+aEqcnTym8OTVStq2A7atJl2WOPLyVEV9uhXM05wnDpToR4GrSWx/r
 YA0orwm1JLrD/O5Mgj3ytphD3ix7Wl+6oE7bq7E0wTI4MDep7IXELG+y5
 EL2UVj7KXzEI3aNVB4wA6dWACJh42TDDWQQY4WBNB9f3NQAokUwzOvkNY
 8FOaJDFlSkQH35UZFgo/rL6PuT3Tjrsea7TTduhprXRBUJame3MJ68VW6
 Edhf++UtptXsmxErX/Kim35gC1tfPUTGz0WwW0tALh7oROtVPAer56F6/
 hwKraX3uVtvRlm5s6ROEug0EMDLtFXHRBR2cgp1iqfRyS3xBQIyoKMwzZ A==;
X-CSE-ConnectionGUID: XxrAlQtUQrWd+lZeocxrIA==
X-CSE-MsgGUID: 3r+PEkUZTDi8wdxQbJmIww==
X-IronPort-AV: E=McAfee;i="6700,10204,11120"; a="34631234"
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; d="scan'208";a="34631234"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 05:05:21 -0700
X-CSE-ConnectionGUID: nuOdyKNkQ++dBZGj4fVppw==
X-CSE-MsgGUID: HeuX7LLqQ5iDvH/K5Qameg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; d="scan'208";a="45885052"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.179])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 05:05:19 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Nirmoy Das
 <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/xe: Fix global-out-of-bounds in rule_matches
In-Reply-To: <7maqy22uryv6u37d7wapf3pweigf7znwklw7kc4avajkg2rqin@yzur4wn2la6j>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240701153702.21824-1-nirmoy.das@intel.com>
 <7maqy22uryv6u37d7wapf3pweigf7znwklw7kc4avajkg2rqin@yzur4wn2la6j>
Date: Tue, 02 Jul 2024 15:05:16 +0300
Message-ID: <87y16k80eb.fsf@intel.com>
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

On Mon, 01 Jul 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> On Mon, Jul 01, 2024 at 05:37:02PM GMT, Nirmoy Das wrote:
>>Do post-increment instead of pre-increment to fix:
>>[ 9344.404516] BUG: KASAN: global-out-of-bounds in rule_matches+0xb72/0x11c0 [xe]
>>[ 9344.411887] Read of size 1 at addr ffffffffa330b210 by task xe_module_load/248463
>>
>>Fixes: dc72c52a42e0 ("drm/xe/rtp: Allow to OR rules")
>>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>---
>> drivers/gpu/drm/xe/xe_rtp.c | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
>>index 5b27f7c45ea3..f6ec8df5fc94 100644
>>--- a/drivers/gpu/drm/xe/xe_rtp.c
>>+++ b/drivers/gpu/drm/xe/xe_rtp.c
>>@@ -121,7 +121,7 @@ static bool rule_matches(const struct xe_device *xe,
>> 			 * Advance rules until we find XE_RTP_MATCH_OR to check
>> 			 * if there's another set of conditions to check
>> 			 */
>>-			while (i < n_rules && rules[++i].match_type != XE_RTP_MATCH_OR)
>>+			while (i < n_rules && rules[i++].match_type != XE_RTP_MATCH_OR)
>
> this will double check the current iteration. A better fix was posted last
> week and I will merge it soon:

Meh, any messing with loop variables inside a for loop is a footgun. You
need a better abstraction. :p

Even the for loop is just too clever for its own good:

	for (r = rules, i = 0; i < n_rules; r = &rules[++i]) {

This should just be:

	for (i = 0; i < n_rules; i++) {
		r = rules[i];

Don't make it so hard for your future self. ;)

BR,
Jani.

>
> https://patchwork.freedesktop.org/series/135527/
>
> Lucas De Marchi
>
>> 				;
>>
>> 			if (i >= n_rules)
>>-- 
>>2.42.0
>>

-- 
Jani Nikula, Intel
