Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 279B3C4167B
	for <intel-xe@archiver.kernel.org>; Mon, 11 Dec 2023 07:01:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B722910E14D;
	Mon, 11 Dec 2023 07:01:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 487D910E14D
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Dec 2023 07:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702278066; x=1733814066;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=mG1Ul2/+aDCcc/l923OCS/M1lla05Wcs7emPROv3/wU=;
 b=ZHrQKdjGzMrTKAiykvzsrXtPty2qLDc2c2hPy/WnsCUa5j6fmH2smYZ7
 fyDyUlY1KTWUuQ0VwG37VggmHIH+ntjCTblfmyU+Zy1ZKqYEN2w4o2lDC
 4//jr6/2Xbq4ZtHTOh8N1LVdukidtPw2V6eUJ2qHXkH0d7K+htncTUQiO
 5lYyP5enb0Irk6WDy3kK2bOsaNWOor9+bEeWRONV8B8YCLVAeJYKsVRt2
 tO+Q0m+Tfl6eXZSGm5AqbzYSR56CEHcp6PR6zSEAzF4JyjRI1d4jHXPsJ
 OS8mP6vxG5ZOczx64R/btAB1gkRlCt/LDEXkVWbCCprABHcj1S6lC8N0j g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="16153928"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; d="scan'208";a="16153928"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2023 23:01:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; d="scan'208";a="17570782"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2023 23:01:03 -0800
Message-ID: <7f3effe8-1526-45be-9bd8-71e179f54305@linux.intel.com>
Date: Mon, 11 Dec 2023 12:33:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/pmu: Remove PMU from Xe till uapi is finalized
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20231209224352.2720403-1-ashutosh.dixit@intel.com>
 <87msujhtu3.wl-ashutosh.dixit@intel.com>
 <aecbe74c-af61-4ea8-984b-c7d5ff3133c1@linux.intel.com>
 <87il55i6uz.wl-ashutosh.dixit@intel.com>
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <87il55i6uz.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: francois.dugast@intel.com, Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 12/11/23 12:05, Dixit, Ashutosh wrote:

Hi Ashutosh,
> On Sun, 10 Dec 2023 22:04:25 -0800, Aravind Iddamsetty wrote:
> Hi Aravind,
>
>> On 12/10/23 04:22, Dixit, Ashutosh wrote:
>>> On Sat, 09 Dec 2023 14:43:52 -0800, Ashutosh Dixit wrote:
>>>> PMU uapi is likely to change in the future. Till the uapi is finalized,
>>>> remove PMU from Xe. PMU can be re-added after uapi is finalized.
>> Hi Ashutosh,
>>
>> Is it possible to have the infra as it is and just remove the events
>> part.
> If you want to send a patch which can do this cleanly please go ahead. I
> was trying it but it was looking odd that the infra is there but no events
> were exposed.

Ya agree with you it won't look nice without any events, a piece of unused code.

so acking your patch to remove it.

Acked-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>

I believe we should also drop the corresponding IGT test xe_perf_pmu.

Thanks,
Aravind.
>
>> As there is follow on series from Riana which uses the infra
>> https://patchwork.freedesktop.org/series/126919/.  or the other
>> alternative would be for Riana to bring in the infra as part of her
>> series.
> So that is why I thought it would be easier if deleted the whole thing now
> and later Riana or Umesh could add an initial patch, authored by you, which
> adds the PMU infrastructure and then add their part in separate patches.
>
> Thanks.
> --
> Ashutosh
>
>>> Complete removal of PMU for now is probably preferable than what was done
>>> in:
>>>
>>> https://patchwork.freedesktop.org/series/127590/
>>>
>>> Also, it is probably preferable to remove PMU code via a rebase, but if
>>> that is time consuming, adding this patch will remove PMU code.
>>>
>>> I was trying to send a series of 'fixup' patches, but that seemed difficult
>>> because a large number of patches have touched non-PMU files, so all those
>>> patches will need to be fixed up.
>>>
>>> Thanks.
>>> --
>>> Ashutosh
