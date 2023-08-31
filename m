Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF3AC88CB2
	for <intel-xe@archiver.kernel.org>; Thu, 31 Aug 2023 22:06:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ED5210E3C9;
	Thu, 31 Aug 2023 22:06:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BB5410E3C9
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Aug 2023 22:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693519587; x=1725055587;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=q829ReLXUM25ZtmcuWmv/+fSHUXlg/MToNZuU13MSTI=;
 b=kB19sQwgzhXYvTDzsh0sd09iwT5G/Swb0zR4/HDYW3bT1AlmQDXH7d3E
 KeVqR8MGFfh8lre01Ri9wX1uPyAyNggtk3ZJuN5e1yJAzWnjJo6q9WMEm
 oMVWinjNgCGo85i806mjJrMXTxt4qRza/8sjwMPv2jzxixLEDL/fnS2xs
 VuWesmI2gg58e6yFsWLvL6OiuwGCs4kvn44uAN9eZQ38wajOB3Q4R1euY
 kLQS7JTsEvExcpGgpRmwNXMrd9mb0Dn+S4zuZ/jc6PSCqFdf30VGHMFIy
 CyaO/gbUVMFkpae1tpF7l2dYcieSwVr+5HbdC6+WVj6qymQ6SHUxKA51G Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="378810486"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; d="scan'208";a="378810486"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 15:06:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="854453954"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; d="scan'208";a="854453954"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.80])
 ([10.145.162.80])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 15:06:07 -0700
Message-ID: <ee7be126-e4b9-b72a-8bea-e8f2832c9251@linux.intel.com>
Date: Fri, 1 Sep 2023 03:44:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20230830051544.369643-1-aravind.iddamsetty@linux.intel.com>
 <20230830051544.369643-4-aravind.iddamsetty@linux.intel.com>
 <ZO+tdVtAOrIYLqN0@intel.com> <874jkf0wle.wl-ashutosh.dixit@intel.com>
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <874jkf0wle.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH v5 3/3] drm/xe/pmu: Enable PMU interface
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
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 intel-xe@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 01/09/23 02:15, Dixit, Ashutosh wrote:
> On Wed, 30 Aug 2023 13:58:29 -0700, Rodrigo Vivi wrote:
> Hi Aravind,
>
>>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>>> index 86f16d50e9cc..75c9a7fe3490 100644
>>> --- a/include/uapi/drm/xe_drm.h
>>> +++ b/include/uapi/drm/xe_drm.h
>>> @@ -1056,6 +1056,22 @@ struct drm_xe_vm_madvise {
>>> 	__u64 reserved[2];
>>>  };
>>>
>>> +/* PMU event config IDs */
>>> +
>>> +/*
>>> + * Top bits of every counter are GT id.
>>> + */
>>> +#define __XE_PMU_GT_SHIFT (56)
>>> +
>>> +#define ___XE_PMU_OTHER(gt, x) \
>>> +	(((__u64)(x)) | ((__u64)(gt) << __XE_PMU_GT_SHIFT))
>>> +
>>> +#define XE_PMU_INTERRUPTS(gt)			___XE_PMU_OTHER(gt, 0)
>>> +#define XE_PMU_RENDER_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 1)
>>> +#define XE_PMU_COPY_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 2)
>>> +#define XE_PMU_MEDIA_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 3)
>>> +#define XE_PMU_ANY_ENGINE_GROUP_BUSY(gt)	___XE_PMU_OTHER(gt, 4)
>> Could you please add uapi documentation here showing examples on how
>> this is used and all?
> Rodrigo clarified some more the sort of uapi documentation to add here:
yup I didn't acknowledge but didn't neglect it either, i'm working on it
will add as part of next series.

Thanks,
Aravind.
>
> https://patchwork.freedesktop.org/patch/551694/?series=121084&rev=4#comment_1009774
>
> Cheers,
> Ashutosh
