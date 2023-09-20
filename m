Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A852CE79AC
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 08:17:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E831D10E16A;
	Wed, 20 Sep 2023 08:17:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D147B10E16A
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 08:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695197830; x=1726733830;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=lL/Kufe5d18ezSiT2kSLdtP2q8Mvw/kQHbkChy7uKqc=;
 b=JIMHZykVn1Ce4IhLHR5kWL4YX4qcJdhxRTtos7Em9K2zLRD8SzJ3rTlR
 nuWws+bUGWtGbAw94JxWO/e5ir3m+HvUr6BQo8zlCaB20az/rP0PKTDJa
 b/JwqO6NpVEfuBkZ4I3wa+rpjOt6eftXKpNr6av5ZFM6KgbNF3mqU/mmt
 pw6H1L9mEc1duIgN2V0z5sZRm4xZpIjYORBepCeF4XrxyeFmoQ/VGozvA
 7Eou6jAbArnnF25u7oC6cdWAglcUcHCd3SWv22MZLgtP9fBbzhuvJd+tK
 2DS1ZMLSF5KG+A7ZepeOc3Ak8unxn3Gjgu04pdpdgfyleegOevkXtbT3d A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="365209822"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; d="scan'208";a="365209822"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 01:17:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="696217308"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; d="scan'208";a="696217308"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.80])
 ([10.145.162.80])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 01:17:09 -0700
Message-ID: <a033461b-d970-4875-9409-af0c75b1dcd2@linux.intel.com>
Date: Wed, 20 Sep 2023 13:56:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Gustavo Sousa <gustavo.sousa@intel.com>, intel-xe@lists.freedesktop.org
References: <20230919063611.14236-1-aravind.iddamsetty@linux.intel.com>
 <169513003875.2105.6876281126480171944@gjsousa-mobl2>
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <169513003875.2105.6876281126480171944@gjsousa-mobl2>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 19/09/23 18:57, Gustavo Sousa wrote:
> Quoting Aravind Iddamsetty (2023-09-19 03:36:11-03:00)
>> Add DOC keyword to PMU events comment in include/drm/xe_drm.h to make it
>> kernel doc format.
>>
>> Fixes: 4a9681392cec ("drm/xe/pmu: Enable PMU interface")
>>
>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>> ---
>> include/uapi/drm/xe_drm.h | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index 63863eda8355..6ab85c7fed36 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -1054,7 +1054,7 @@ struct drm_xe_vm_madvise {
>> };
>>
>> /**
>> - * XE PMU event config IDs
>> + * DOC: XE PMU event config IDs
> That was my first thought when writing [1], but then I realized that the
> XE_PMU_*() macros would not show up in the generated documentation.
> Not sure if there is a special kernel-doc syntax to make them appear
> there. Maybe we should just list them in this kernel-doc?

IIUC as per Documentation/doc-guide/kernel-doc.rst it allows
for source code comments and code itself can't be part of the comment
so I don't think we need to list the defines in the comment.


Thanks,
Aravind.
>
> [1] https://patchwork.freedesktop.org/series/123887/
>
>>  *
>>  * Check 'man perf_event_open' to use these ID's in 'struct perf_event_attr'
>>  * as part of perf_event_open syscall to read a particular event.
>> -- 
>> 2.25.1
>>
