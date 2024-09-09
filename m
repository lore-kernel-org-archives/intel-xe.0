Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40EE8ECE57A
	for <intel-xe@archiver.kernel.org>; Mon,  9 Sep 2024 13:12:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 074A710E554;
	Mon,  9 Sep 2024 13:12:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XB2pAR2o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F9CF10E554
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Sep 2024 13:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725887540; x=1757423540;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=43qmmi8utVHbtSLiKzqadrwWmWP9g9pUNt0rkWAVFac=;
 b=XB2pAR2oxLWvJy0LtIHEAzBDwL/Xygmr3X851fqzWGzdYavXH+MxtDC8
 BCbovxygfJz++GlliGeMBHzr1NbjjNLjtAp26nRQx85Trp8bmTVn3jV3t
 f2FTU7sThl07xZM3LR7ppGV7A2irPzhTmSPpVwFyJvK7egzjxDoUxBeL1
 2ti0Ht4bEAF5+n2SJKaWpMuhZNMOsMVpicR/pFgRkOK8RxiBWL7zpgSIO
 SosZ5GPWxEK431tnTxcqxwh8nt1jIiVWG9NdbqSzT97h9aKvl1A6hFFEU
 zpxk+FHbj2luap30bS0WGlm29Tmgoy5YTjr3724afRRCdXs8jgoBwlqA/ w==;
X-CSE-ConnectionGUID: YjBZN3pNTsyv5/A9w66eIA==
X-CSE-MsgGUID: /tt0OiNGTg+IQC0rNOtc/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="42092543"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; d="scan'208";a="42092543"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 06:12:07 -0700
X-CSE-ConnectionGUID: ujl95sJ1TsKycctDuWj1Vw==
X-CSE-MsgGUID: QOb792zrSwGiK7Ut1X9C3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; d="scan'208";a="97480902"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa001.fm.intel.com with ESMTP; 09 Sep 2024 06:12:07 -0700
Received: from [10.246.19.248] (mwajdecz-MOBL.ger.corp.intel.com
 [10.246.19.248])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 2D6F827BAD;
 Mon,  9 Sep 2024 14:12:04 +0100 (IST)
Message-ID: <f9c11e5f-8ee9-4cd9-9b3c-9f95c146021c@intel.com>
Date: Mon, 9 Sep 2024 15:12:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] drm/xe/xe_gt_idle: add debugfs entry for
 powergating info
To: Riana Tauro <riana.tauro@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 vinay.belgaumkar@intel.com, badal.nilawar@intel.com
References: <20240906071126.28078-1-riana.tauro@intel.com>
 <20240906071126.28078-3-riana.tauro@intel.com> <874j6pm3wk.fsf@intel.com>
 <3371ff33-b300-4aa3-bce0-516c36f3e3c9@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <3371ff33-b300-4aa3-bce0-516c36f3e3c9@intel.com>
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



On 09.09.2024 14:38, Riana Tauro wrote:
> Hi Jani
> 
> On 9/9/2024 5:32 PM, Jani Nikula wrote:
>> On Fri, 06 Sep 2024, Riana Tauro <riana.tauro@intel.com> wrote:
>>> @@ -288,6 +300,7 @@ static const struct drm_info_list debugfs_list[] = {
>>>       {"topology", .show = xe_gt_debugfs_simple_show, .data = topology},
>>>       {"steering", .show = xe_gt_debugfs_simple_show, .data = steering},
>>>       {"ggtt", .show = xe_gt_debugfs_simple_show, .data = ggtt},
>>> +    {"powergate_info", .show = xe_gt_debugfs_simple_show, .data =
>>> powergate_info},
>>>       {"register-save-restore", .show = xe_gt_debugfs_simple_show,
>>> .data = register_save_restore},
>>>       {"workarounds", .show = xe_gt_debugfs_simple_show, .data =
>>> workarounds},
>>>       {"pat", .show = xe_gt_debugfs_simple_show, .data = pat},
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c
>>> b/drivers/gpu/drm/xe/xe_gt_idle.c
>>> index 3924f9f3d0a5..85a35ed153a3 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
>>> @@ -53,6 +53,11 @@ pc_to_xe(struct xe_guc_pc *pc)
>>>       return gt_to_xe(gt);
>>>   }
>>>   +static inline const char *str_up_down(bool v)
>>> +{
>>> +    return v ? "up" : "down";
>>> +}
>>
>> Please don't add functions with names that are obviously going to have
>> name collisions with core kernel headers. This now conflicts in
>> linux-next [1]. Please rename until we can merge the real str_up_down()
>> from upstream to drm-xe-next.
>>
>> Also, please don't use static inline in .c files. Just let the compiler
>> do its thing.
> This was suggested in a review comment to have a local copy till the
> function lands in the tree
> 
> https://patchwork.freedesktop.org/patch/605708/?series=136477&rev=1

and there was heads-up [2] for potential conflict that was likely missed

[2]
https://lore.kernel.org/intel-xe/7b0a9a05-3a98-4ec7-9c21-f9743602b16a@intel.com/

> 
> Will remove this and use the function once its merged to drm-xe-next.
> 
> Thanks
> Riana
>>
>> BR,
>> Jani.
>>
>>
>> [1] https://lore.kernel.org/r/20240909195939.067c1c13@canb.auug.org.au
>>
>>
