Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C120D6C299
	for <intel-xe@archiver.kernel.org>; Tue, 19 Nov 2024 20:33:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC67C10E363;
	Tue, 19 Nov 2024 20:33:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yuitgi70";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD66A10E363
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Nov 2024 20:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732048414; x=1763584414;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=TVi6kMlRtuZpPrSK3Ag8fowTczcoukk+bHxYpstN7ms=;
 b=Yuitgi70C2rtpwtXw706dWbTEjIssxz3NpZxzKdGxXhAcfMpKJu4jwZY
 dU2MdgZ72QLucfWK734s9PMf4EPe1ENi8lbqPDqhCk3RlXAt/6ewIaigc
 4vvaJA+YCpRthf2OT1cCKTvIKriM8Cv54i+3W/WOL7Aw9EJQsmfgAxkK0
 5ebjA43+e+xICE9F162s9cCIb5YHVuCYz/h2zpaOxcFMbyAYCI9jip+Qi
 DPeP3kkwKy4W1HDEjlGfKycXslPSmltC7cznjubQf371r9D0LYkhy9Y9f
 gGaTKN/QLm1ucuWL0e/70KwNAh58FiEIU6JzEmHdqBkQoC+mV4Q9RDTGe A==;
X-CSE-ConnectionGUID: PlGeQYjJSkyQQi0PNLCAOw==
X-CSE-MsgGUID: MZrYl/oHRgiPLHvgwpcTOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="57483313"
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="57483313"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 12:33:34 -0800
X-CSE-ConnectionGUID: WAr7aib6QQ2LdEArmDhpWw==
X-CSE-MsgGUID: lraCZsGaR7q91qK/TAsOOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="120629368"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.109.70])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 12:33:34 -0800
Date: Tue, 19 Nov 2024 14:33:28 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: Always setup GT MMIO adjustment data
Message-ID: <4drzjxtmbgwjiwwuxxu6436parjojvohwhuqcyzktvihvpbomm@m2j64wuicfr3>
References: <20241114175955.2299-1-michal.wajdeczko@intel.com>
 <20241114175955.2299-2-michal.wajdeczko@intel.com>
 <yzyjk63jmruhujcaqpkx4cd64ymrqvjmikwlltgbf7pmbg6s7o@ycn665ds4ile>
 <3dde1c69-39f7-4ae7-8ecd-31338ce94a80@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3dde1c69-39f7-4ae7-8ecd-31338ce94a80@intel.com>
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

On Thu, Nov 14, 2024 at 08:36:46PM +0100, Michal Wajdeczko wrote:
>
>
>On 14.11.2024 20:23, Lucas De Marchi wrote:
>> On Thu, Nov 14, 2024 at 06:59:54PM +0100, Michal Wajdeczko wrote:
>>> While we believed that xe_gt_mmio_init() will be called just once
>>> per GT, this might not be a case due to some tweaks that need to
>>> performed by the VF driver during early probe.  To avoid leaving
>>
>> can you be explicit where this is being set on the VF case?
>
>it will be used in read_gmdid(), see next patch
>
>> Shouldn't VF
>> itself deal with fixing up what it did?
>
>in read_gmdid() we already said
>
>516      /*
>517       * Only undo xe_gt.info here, the remaining changes made above
>518       * will be overwritten as part of the regular initialization.
>519       */
>
>and it looks that xe_gt_mmio_init() is not overwriting everything as we
>would expect

We only need to read the gmdid and for that need the mmio struct to be
filled out. We end up needing the gt as a context, but this all looks to
be fixing things that shouldn't have been done.

without looking deeper I don't have a short-term alternative, though.

Matt Roper, any better alternative that comes to mind? You did the mmio
conversion and acked this "misbehavior" for VF earlier, so I'd like to
hear your opinion.

Lucas De Marchi

>
>>
>>> any stale data in case of the re-run, reset the GT MMIO adjustment
>>> data for the non-media GT case.
>>
>>
>> Lucas De Marchi
>>
>>>
>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>> ---
>>> drivers/gpu/drm/xe/xe_gt.c | 3 +++
>>> 1 file changed, 3 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>>> index d6744be01a68..d45d2cecc4dc 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>>> @@ -643,6 +643,9 @@ void xe_gt_mmio_init(struct xe_gt *gt)
>>>     if (gt->info.type == XE_GT_TYPE_MEDIA) {
>>>         gt->mmio.adj_offset = MEDIA_GT_GSI_OFFSET;
>>>         gt->mmio.adj_limit = MEDIA_GT_GSI_LENGTH;
>>> +    } else {
>>> +        gt->mmio.adj_offset = 0;
>>> +        gt->mmio.adj_limit = 0;
>>>     }
>>>
>>>     if (IS_SRIOV_VF(gt_to_xe(gt)))
>>> -- 
>>> 2.43.0
>>>
>
