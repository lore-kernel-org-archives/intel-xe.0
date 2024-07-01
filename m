Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A73DC2BD09
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jul 2024 16:01:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3D0610E478;
	Mon,  1 Jul 2024 16:01:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XR86BMfT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EA8010E478
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Jul 2024 16:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719849674; x=1751385674;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=9DpZ4ZQU1jkVp0GBKhmrWjpQgEjG8SVQluP/QU/npt4=;
 b=XR86BMfTvm7c9sUEW8OfSW5HqAG6j19d4cvNSy6QEVjzqi0w15WJgs7y
 +nvTOPzhK0WWsl6H8kb0saPKbDIPIvh+5qoLZvWV8SXmAq+jnRO1z/Lpx
 0wSrDBP43ImfHbY/f37bs4oTxeZnh0mcX+35CMLOnaoPuOScQpGFCo7Su
 SpWB9X8FrkOY9suNAqEFw9mkaUUdIUgEPyFfeeS5FXKQIt79RJTSJwWsf
 VC8UXBGen4/YDeRXCYmK1flRv4GUZTLND2YWZt4EsJgQMRTJQm8Nuwa01
 HqHTOiOZlHxoydoCskBF+/oAO2ke+a1Pyg265QcAU1Gf+66mVVbzO9kSV w==;
X-CSE-ConnectionGUID: BAEMVu0lTmyB0TMWR8kGRQ==
X-CSE-MsgGUID: 5Q6fM1eBT0O5m0gzrul3KQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11120"; a="16649788"
X-IronPort-AV: E=Sophos;i="6.09,176,1716274800"; d="scan'208";a="16649788"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2024 09:01:13 -0700
X-CSE-ConnectionGUID: EJt7Pg+aTVG89Yxr+LCqBw==
X-CSE-MsgGUID: p37s5iOoSDiLj6VMLEi5rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,176,1716274800"; d="scan'208";a="45466465"
Received: from rjblakel-mobl.amr.corp.intel.com (HELO [10.124.115.151])
 ([10.124.115.151])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2024 09:01:09 -0700
Message-ID: <09f7e0c2-570f-4e77-97d4-7480ea0a4c6a@linux.intel.com>
Date: Mon, 1 Jul 2024 18:01:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Fix global-out-of-bounds in rule_matches
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20240701153702.21824-1-nirmoy.das@intel.com>
 <7maqy22uryv6u37d7wapf3pweigf7znwklw7kc4avajkg2rqin@yzur4wn2la6j>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <7maqy22uryv6u37d7wapf3pweigf7znwklw7kc4avajkg2rqin@yzur4wn2la6j>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Lucas,

On 7/1/2024 5:56 PM, Lucas De Marchi wrote:
> On Mon, Jul 01, 2024 at 05:37:02PM GMT, Nirmoy Das wrote:
>> Do post-increment instead of pre-increment to fix:
>> [ 9344.404516] BUG: KASAN: global-out-of-bounds in 
>> rule_matches+0xb72/0x11c0 [xe]
>> [ 9344.411887] Read of size 1 at addr ffffffffa330b210 by task 
>> xe_module_load/248463
>>
>> Fixes: dc72c52a42e0 ("drm/xe/rtp: Allow to OR rules")
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_rtp.c | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
>> index 5b27f7c45ea3..f6ec8df5fc94 100644
>> --- a/drivers/gpu/drm/xe/xe_rtp.c
>> +++ b/drivers/gpu/drm/xe/xe_rtp.c
>> @@ -121,7 +121,7 @@ static bool rule_matches(const struct xe_device *xe,
>>              * Advance rules until we find XE_RTP_MATCH_OR to check
>>              * if there's another set of conditions to check
>>              */
>> -            while (i < n_rules && rules[++i].match_type != 
>> XE_RTP_MATCH_OR)
>> +            while (i < n_rules && rules[i++].match_type != 
>> XE_RTP_MATCH_OR)
>
> this will double check the current iteration. A better fix was posted 
> last
> week and I will merge it soon:


I missed that. Reviewed from my side.


Thanks,

Nirmoy

>
> https://patchwork.freedesktop.org/series/135527/
>
> Lucas De Marchi
>
>>                 ;
>>
>>             if (i >= n_rules)
>> -- 
>> 2.42.0
>>
