Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66A82C3DA5D
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jul 2024 16:55:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3586D10EC69;
	Fri, 19 Jul 2024 16:55:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XyMAqGf7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C44210EC69
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jul 2024 16:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721408147; x=1752944147;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=9opk0nqpoP+MTos8gkBcYVuYa+OUnOyjnQoJnwC5nGc=;
 b=XyMAqGf7cQwm2RKt3vvyjg+gMYU+S12N+evZXR3GVdCL2M9rQkNgQ0TG
 Ykw7u/ITy8unlZMDaLKQj7lXuV2+/dHltQ4d3ddamkIyb14mDh1mRG24U
 ariKDFGD8/gPJnmQguBXoUeTgIZZq23uzlGdUuAVZDwlfUrqKdyamgFQ6
 d9BffDYAy5xJMynNHjL9T5NlBWvy5EiIjp1/Fc/Xf/gSz758I35nQM/Ek
 R31NY8E7y/IRvC5OB39TQYKd6VCx/7sT3caYU4Z2lu2CJWmisWeaYW3Qj
 9hN/AsbCrENekHb+rW9ZU2hNIyNYZfw3rYCk9DauzMY//u3phBdQobh9C w==;
X-CSE-ConnectionGUID: KNlOc8awT8aLELlPR7aipA==
X-CSE-MsgGUID: 5D9EY51jQxWkTD1j4SQIDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="18903043"
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="18903043"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 09:55:46 -0700
X-CSE-ConnectionGUID: Yt7MK/TdRwSGIEfFeUx7yw==
X-CSE-MsgGUID: P38rbvtHRda2tH6CouM7gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="51449847"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa006.jf.intel.com with ESMTP; 19 Jul 2024 09:55:46 -0700
Received: from [10.245.82.99] (mwajdecz-MOBL.ger.corp.intel.com [10.245.82.99])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 0F0B827BB3;
 Fri, 19 Jul 2024 17:55:43 +0100 (IST)
Message-ID: <280022b5-cbb0-405c-8285-92335edf5d3b@intel.com>
Date: Fri, 19 Jul 2024 18:55:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] drm/xe: Introduce const cast helper
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20240717195155.442-1-michal.wajdeczko@intel.com>
 <20240717195155.442-2-michal.wajdeczko@intel.com>
 <gs32gpbe62ph7j3l7akrrtcc4z2wr3kv7xnezb3szwedcaezds@hohvqsmqilc2>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <gs32gpbe62ph7j3l7akrrtcc4z2wr3kv7xnezb3szwedcaezds@hohvqsmqilc2>
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



On 19.07.2024 18:32, Lucas De Marchi wrote:
> On Wed, Jul 17, 2024 at 09:51:49PM GMT, Michal Wajdeczko wrote:
>> Typically we want to preserve pointer constness when converting
>> from one xe pointer to another, but in some rare cases, like kunit
>> parameter conversions, we might want to discard this constness.
>> Add a helper that we will use to clearly indicate our intention.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_device.h | 5 +++++
>> 1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.h
>> b/drivers/gpu/drm/xe/xe_device.h
>> index 0a2a3e7fd402..c2b1f9f066bd 100644
>> --- a/drivers/gpu/drm/xe/xe_device.h
>> +++ b/drivers/gpu/drm/xe/xe_device.h
>> @@ -20,6 +20,11 @@ static inline struct xe_device
>> *pdev_to_xe_device(struct pci_dev *pdev)
>>     return pci_get_drvdata(pdev);
>> }
>>
>> +static inline struct xe_device *xe_device_const_cast(const struct
>> xe_device *xe)
>> +{
>> +    return pdev_to_xe_device(to_pci_dev(xe->drm.dev));
> 
> why are you going through pdev_to_xe_device() rather than doing what the
> function name says and just remove the const?

IIRC this was my initial way how to get rid of the const without doing a
forced cast and it was before I decided to introduce a helper for it and
before this helper was named this way ;)

and while explicit cast is more direct (and I can still do that way in
next rev if preferred), then it will be just pure C language concept,
while the potential advantage of doing that through pdev_to_xe_device()
is that it shows that this non-const xe pointer could be still obtained
indirectly, so it should be safe to do so

> 
> Lucas De Marchi
> 
>> +}
>> +
>> static inline struct xe_device *ttm_to_xe_device(struct ttm_device *ttm)
>> {
>>     return container_of(ttm, struct xe_device, ttm);
>> -- 
>> 2.43.0
>>
