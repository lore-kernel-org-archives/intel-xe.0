Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB21CD4958
	for <intel-xe@archiver.kernel.org>; Thu, 21 Sep 2023 05:41:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D942C10E06B;
	Thu, 21 Sep 2023 05:41:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7979410E06B
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Sep 2023 05:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695274873; x=1726810873;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=gFffIbbevxPmUn5IOtolOUbuyzCoeocuDEpRMh5uFyI=;
 b=VstkPtdJNpJZPviJK0Pmh+GNXJRLnF7JOAxLMoV4/mQPrFL/ujy0laTZ
 usJCSw1HvSowY6Elo3WOKB5rczMaWYwwc0OlQ7oGd38aGKy+5dpQ+i/In
 8N4VDvtLf2kqdtIW/VcjDAvka6VBBM15ZoNmKVjkN3YQ78yaEU3m2ucrZ
 6l9l4s2048r5pobcj1rdlCttGEHbsQvweQEPN+/vzNapZ6HxIvIpMyT/I
 o+eHnqiIfWroHptvROz/SCXJsB8okoDfK/zrfVp7j/YHt9QA91EkSDwvN
 BBafsx5Ibq/JOEKk9D/i+XKUjeZTQ8optQoz/EOfCTATo956RTxTGoi4H Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="411374760"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; d="scan'208";a="411374760"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 22:41:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="740488008"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; d="scan'208";a="740488008"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 22:41:11 -0700
Message-ID: <da8b66d6-ea3f-bdde-dcd8-07b6c2c6f272@linux.intel.com>
Date: Thu, 21 Sep 2023 11:13:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Gustavo Sousa <gustavo.sousa@intel.com>, intel-xe@lists.freedesktop.org
References: <20230919063611.14236-1-aravind.iddamsetty@linux.intel.com>
 <169513003875.2105.6876281126480171944@gjsousa-mobl2>
 <a033461b-d970-4875-9409-af0c75b1dcd2@linux.intel.com>
 <169521609276.7665.8316775804745308048@gjsousa-mobl2>
Content-Language: en-US
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <169521609276.7665.8316775804745308048@gjsousa-mobl2>
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


On 20/09/23 18:51, Gustavo Sousa wrote:
> Quoting Aravind Iddamsetty (2023-09-20 05:26:56-03:00)
>> On 19/09/23 18:57, Gustavo Sousa wrote:
>>> Quoting Aravind Iddamsetty (2023-09-19 03:36:11-03:00)
>>>> Add DOC keyword to PMU events comment in include/drm/xe_drm.h to make it
>>>> kernel doc format.
>>>>
>>>> Fixes: 4a9681392cec ("drm/xe/pmu: Enable PMU interface")
>>>>
>>>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>>>> ---
>>>> include/uapi/drm/xe_drm.h | 2 +-
>>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>>>> index 63863eda8355..6ab85c7fed36 100644
>>>> --- a/include/uapi/drm/xe_drm.h
>>>> +++ b/include/uapi/drm/xe_drm.h
>>>> @@ -1054,7 +1054,7 @@ struct drm_xe_vm_madvise {
>>>> };
>>>>
>>>> /**
>>>> - * XE PMU event config IDs
>>>> + * DOC: XE PMU event config IDs
>>> That was my first thought when writing [1], but then I realized that the
>>> XE_PMU_*() macros would not show up in the generated documentation.
>>> Not sure if there is a special kernel-doc syntax to make them appear
>>> there. Maybe we should just list them in this kernel-doc?
>> IIUC as per Documentation/doc-guide/kernel-doc.rst it allows
>> for source code comments and code itself can't be part of the comment
>> so I don't think we need to list the defines in the comment.
> But then the generated HTML will not contain the ids we refer by "these ID's".
> If we are not going to list them, maybe change the wording to help the user
> locate them in the header file? Otherwise, I'm not sure it would make much sense
> to keep this as a kernel-doc.
ok will update the comment accordingly
>
> By the way, I built the docs locally and there is an issue with the code block:
>
>     (...)/Documentation/gpu/driver-uapi:24: ./include/uapi/drm/xe_drm.h:1063: ERROR: Error in "code-block" directive:
>     maximum 1 argument(s) allowed, 13 supplied.
>
> It just needs a line break after the code-block directive.

thanks for letting me know will fix this.

Regards,
Aravind.
>
>
> Gustavo Sousa
>
>>
>> Thanks,
>> Aravind.
>>> [1] https://patchwork.freedesktop.org/series/123887/
>>>
>>>>  *
>>>>  * Check 'man perf_event_open' to use these ID's in 'struct perf_event_attr'
>>>>  * as part of perf_event_open syscall to read a particular event.
>>>> -- 
>>>> 2.25.1
>>>>
