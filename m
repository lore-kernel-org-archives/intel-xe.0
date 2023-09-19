Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 703C7CD3443
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 06:57:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CD9710E1A8;
	Tue, 19 Sep 2023 06:57:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D59E810E1A8
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Sep 2023 06:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695106662; x=1726642662;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=biC38LaYB1oiivZe4kSBaesZ3YU/h2UqUq6FgV1tydM=;
 b=EXjoigW9BE5yWfH9Udrbm9cfagPLb9s+4Cv+9pNQLdRYWPpaX72+wJXF
 tdusbmE2FL725ogsiMWUzPBJ7yr2PWy/XTU2iGWFaeVeJZb+dnXDGOQsm
 C1jS5QiWSYTInknbVirIA6nTLU7s+pkKAKO2HuSjFQydEpBp4eAL7rjdv
 DU3yNJ+9FAfeih1P1ReWtCv/ms8I6WZoVmIABrdTCXzOJPnA/U3DPumQe
 LWKSKqPNIJ38vxMCY76EXVZCKqCipnXovxUSsbovEpPlpZWkGvrSxw66d
 TAuWAdemHQypxlAcYiTu18FswV3P5TdjCgAejYf0toMh1GrAZZ9ZCbhlQ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="410799787"
X-IronPort-AV: E=Sophos;i="6.02,158,1688454000"; d="scan'208";a="410799787"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 23:57:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="775433769"
X-IronPort-AV: E=Sophos;i="6.02,158,1688454000"; d="scan'208";a="775433769"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.80])
 ([10.145.162.80])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 23:57:40 -0700
Message-ID: <27edfabf-7df3-c952-2491-e1c6538ef3c6@linux.intel.com>
Date: Tue, 19 Sep 2023 12:37:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20230919063611.14236-1-aravind.iddamsetty@linux.intel.com>
 <87h6nqy80h.wl-ashutosh.dixit@intel.com>
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <87h6nqy80h.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix kernel doc warning for PMU events
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


On 19/09/23 12:17, Dixit, Ashutosh wrote:
> On Mon, 18 Sep 2023 23:36:11 -0700, Aravind Iddamsetty wrote:
>> Add DOC keyword to PMU events comment in include/drm/xe_drm.h to make it
>> kernel doc format.
>>
>> Fixes: 4a9681392cec ("drm/xe/pmu: Enable PMU interface")
> Maybe make this a fixup! patch so it can get merged with the original
> patch? With that this is:

Ok, will do that.
>
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Thanks,
Aravind.
>
>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>> ---
>>  include/uapi/drm/xe_drm.h | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index 63863eda8355..6ab85c7fed36 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -1054,7 +1054,7 @@ struct drm_xe_vm_madvise {
>>  };
>>
>>  /**
>> - * XE PMU event config IDs
>> + * DOC: XE PMU event config IDs
>>   *
>>   * Check 'man perf_event_open' to use these ID's in 'struct perf_event_attr'
>>   * as part of perf_event_open syscall to read a particular event.
>> --
>> 2.25.1
>>
