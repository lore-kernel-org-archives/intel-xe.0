Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADFA9CD13CF
	for <intel-xe@archiver.kernel.org>; Mon,  2 Sep 2024 05:55:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E0D010E1FA;
	Mon,  2 Sep 2024 05:55:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XWsAAEm6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BE4A10E1FA
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Sep 2024 05:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725256557; x=1756792557;
 h=message-id:date:mime-version:from:subject:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=LRASwT7gdmFjgS3n8+PaQg9fzsWdQJKV8CJoi69Le5k=;
 b=XWsAAEm6Rt/xYyzNRRQrizDPKuOTXHSTBObdvzZc851fKfStMD8MhYKn
 go9OuH5Qb5KnOQt43gjwS9Zy45/nnDX5MrBvX5gnRpUiJppLCV8iRtvNj
 AskQkf/hJjFNzPeW+hvCjkem5BVqiXkjTYtnUG93/18+4Z23ciBh7r6IB
 SEg9HTiVeUcn6zK5KCSybawYpEn48F09WBXcnYE4tDNEP0CebPvKOEICw
 Lj0IzbNE0GX+EmE1XEBJVChHiBd+VwP5iOfByMxbHI+V9I8mrS4IQH3+R
 nX8Nt8m3gkXZtH1Y1H8DG1FXIQrgrFRTVlX4FAOkf6OOeR5Q6E/HGK21l g==;
X-CSE-ConnectionGUID: NZl4KGxUSEOON+iXUxQAPA==
X-CSE-MsgGUID: sD7FIA/sSgiKBEgWzppp6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="13325217"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="13325217"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2024 22:55:57 -0700
X-CSE-ConnectionGUID: G29uty2JSt+xTrABICjuhw==
X-CSE-MsgGUID: fhKukxY4Sm2TkeZH4J23YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="64193959"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2024 22:55:55 -0700
Message-ID: <3de57ee4-d8a6-4b39-bd17-0fd2f00adc2b@linux.intel.com>
Date: Mon, 2 Sep 2024 11:29:05 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Subject: Re: [PATCH 1/4] drm/xe/pmu: Enable PMU interface
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Tvrtko Ursulin
 <tvrtko.ursulin@intel.com>, Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240827164107.47034-1-vinay.belgaumkar@intel.com>
 <20240827164107.47034-2-vinay.belgaumkar@intel.com>
 <o42m66pseq7yxitt27whcwjntvtuoxndlxcvld2vak5i6ejhtv@ny3ilfuxvwyz>
 <602bffcd-d66f-4b49-b3b4-abb934b00f3a@intel.com>
Content-Language: en-US
In-Reply-To: <602bffcd-d66f-4b49-b3b4-abb934b00f3a@intel.com>
Content-Type: text/plain; charset=UTF-8
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


On 30/08/24 03:40, Belgaumkar, Vinay wrote:
>
> On 8/28/2024 12:33 PM, Lucas De Marchi wrote:
>> On Tue, Aug 27, 2024 at 09:41:04AM GMT, Vinay Belgaumkar wrote:
>>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>>> index b6fbe4988f2e..de6f39db618c 100644
>>> --- a/include/uapi/drm/xe_drm.h
>>> +++ b/include/uapi/drm/xe_drm.h
>>> @@ -1389,6 +1389,40 @@ struct drm_xe_wait_user_fence {
>>>     __u64 reserved[2];
>>> };
>>>
>>> +/**
>>> + * DOC: XE PMU event config IDs
>>> + *
>>> + * Check 'man perf_event_open' to use the ID's XE_PMU_XXXX listed in xe_drm.h
>>> + * in 'struct perf_event_attr' as part of perf_event_open syscall to read a
>>> + * particular event.
>>> + *
>>> + * For example to open the XE_PMU_RENDER_GROUP_BUSY(0):
>>> + *
>>> + * .. code-block:: C
>>> + *
>>> + *    struct perf_event_attr attr;
>>> + *    long long count;
>>> + *    int cpu = 0;
>>> + *    int fd;
>>> + *
>>> + *    memset(&attr, 0, sizeof(struct perf_event_attr));
>>> + *    attr.type = type; // eg: /sys/bus/event_source/devices/xe_0000_56_00.0/type
>>> + *    attr.read_format = PERF_FORMAT_TOTAL_TIME_ENABLED;
>>> + *    attr.use_clockid = 1;
>>> + *    attr.clockid = CLOCK_MONOTONIC;
>>> + *    attr.config = XE_PMU_RENDER_GROUP_BUSY(0);
>>> + *
>>> + *    fd = syscall(__NR_perf_event_open, &attr, -1, cpu, -1, 0);
>>> + */
>>> +
>>> +/*
>>> + * Top bits of every counter are GT id.
>>> + */
>>> +#define __XE_PMU_GT_SHIFT (56)
>>> +
>>> +#define ___XE_PMU_OTHER(gt, x) \
>>> +    (((__u64)(x)) | ((__u64)(gt) << __XE_PMU_GT_SHIFT))
>>> +
>>
>> The perf uapi is self-describing and users should look up on sysfs what
>> to use. Example for i915 since it's what I'm currently working on:
>>
>>     $ cat /sys/bus/event_source/devices/i915/events/actual-frequency
>>     config=0x100000
>>     $ cat /sys/bus/event_source/devices/i915/events/actual-frequency.unit
>>     M
>>
>> `perf list` works fine and doesn't know anything about this xe-only
>> header. Why would we add anything here rather than encourage other users
>> to read from the generic interface?
>
> Agree. perf list | grep rc6 is sufficient.

This was previously asked by Rodrigo https://patchwork.freedesktop.org/patch/555013/?series=119504&rev=5

so what changed from then to now.

Thanks,
Aravind.

>
> Thanks,
>
> Vinay.
>
>>
>> Lucas De Marchi
