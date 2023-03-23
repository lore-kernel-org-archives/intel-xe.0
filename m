Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E207DC6FD1D
	for <intel-xe@archiver.kernel.org>; Thu, 23 Mar 2023 11:06:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC58210E17C;
	Thu, 23 Mar 2023 11:06:42 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E6C210E17C
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Mar 2023 11:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679569600; x=1711105600;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=Sh3o5MT78fbwSFnL+AUlNmLhA1YN5TOabZGN8V/ajbw=;
 b=LCrfhZkOxnluUbNDcwuka6H+QK1JUXu5+wKPrqKRCmky09wKShRA7l/B
 lEeJs0bj9DNPNZ00L3ZrKvDuNCCQ8XRPe4iZUCXy1NoqMjLWCw3H0frdw
 0g7fZH+RrT0LoZs8/sp4cBiTYq2Kwr7v6UrL7UER//WRi9uLRBoXSD9x4
 2JPMEhWX6LLULSYspPnsfQvHjJh6bKcKTZw4+fRmvNqUiV15Am1rBvXxQ
 Rg6LPJoO7vQrEI/wYY3tbQy0UAWQWQvmQYXXVwcOva3qwB/VQwXGEUyTe
 Txf+OF5uBJKThOpN0OGIK3ETZRiYCOvbz4iULjJ72KFYqnjdmIO46ck44 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="341821188"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="341821188"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 04:06:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="714748718"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="714748718"
Received: from ymekhani-mobl2.amr.corp.intel.com (HELO [10.251.222.144])
 ([10.251.222.144])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 04:06:38 -0700
Message-ID: <ceeb7002-b48b-b95e-8bef-7ad072f3dfc0@linux.intel.com>
Date: Thu, 23 Mar 2023 12:06:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.0
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>, intel-xe@lists.freedesktop.org,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
References: <20230323085052.153697-1-maarten.lankhorst@linux.intel.com>
 <875yar7n01.fsf@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <875yar7n01.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH] drm/xe: Rename intel_de.h to xe_de.h
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


On 2023-03-23 11:58, Jani Nikula wrote:
> On Thu, 23 Mar 2023, Maarten Lankhorst <maarten.lankhorst@linux.intel.com> wrote:
>> Rename intel_de.h to xe_de.h in order to remove #include_next,
>> and change the ifdef guard to be the same as the rest of xe headers.
>>
>> This is consistent with the other files that are inside xe/display,
>> and implement xe specific behavior.
>>
>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> ---
>>   drivers/gpu/drm/i915/display/intel_de.h            | 2 +-
>>   drivers/gpu/drm/xe/display/{intel_de.h => xe_de.h} | 8 ++++----
>>   2 files changed, 5 insertions(+), 5 deletions(-)
>>   rename drivers/gpu/drm/xe/display/{intel_de.h => xe_de.h} (97%)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm/i915/display/intel_de.h
>> index 5c223ff6b3ec..267b1108abbb 100644
>> --- a/drivers/gpu/drm/i915/display/intel_de.h
>> +++ b/drivers/gpu/drm/i915/display/intel_de.h
>> @@ -4,7 +4,7 @@
>>    */
>>   
>>   #ifdef BUILD_FOR_XE
> I wonder why this isn't just
>
> #ifndef I915
>
> and why do we need the separate
>
> 	-DBUILD_FOR_XE=1 \
>
> in xe Makefile?
If you give the ack, I will remove the BUILD_FOR_XE too when committing.
