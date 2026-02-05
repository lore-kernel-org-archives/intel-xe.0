Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B90BDEC1E96
	for <intel-xe@archiver.kernel.org>; Thu,  5 Feb 2026 10:21:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 748A410E842;
	Thu,  5 Feb 2026 10:21:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZHwVSQv6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FDB310E834
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Feb 2026 10:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770286888; x=1801822888;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=bsLhqFnGxcj2Rg2EIT2MJNl7JczF0rJRb2EqVolLTYA=;
 b=ZHwVSQv6fHxb/K5wJtKSBJA0FTk+jFDCwyEW1SHdqYVAjHndL/RZCWh4
 rZfiFaBj646AlAo+bBI36Y7t8vSoEHtKHieYjCe/zITsuBCw3dY7ChIze
 9MAPOcPqSVOUigwi+wCAjchFJHNec8u9/9umc3IKuyc1UkacY5bxSBfwP
 kmxOogt5a/in1u5sIO8mZ1ZLOBVNzxcgoqCqZyScyxnXcNnNjCcnOIP8X
 wpN8nIDRckSOGT2mHkcK1kinChjplozOa0GA0zH6ZEcfNI7mpzudt7YaD
 qsbdjiMaH8KTa1EDqrBXkcQtnrM7SVE3xsNPapCh8y4qT9Mb2RBhqWQOg g==;
X-CSE-ConnectionGUID: 1Hlgn0i3RdWhidgyKYvwuQ==
X-CSE-MsgGUID: jBschI07Tl6Kp4lxPIdyyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="75335700"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="75335700"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 02:21:28 -0800
X-CSE-ConnectionGUID: E5CgbKltQ/aeNQUEzJ91AQ==
X-CSE-MsgGUID: tyAtP8upT0a0YJbbAtzg3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="210355772"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.244.124])
 ([10.245.244.124])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 02:21:26 -0800
Message-ID: <86c575d3-a0a5-469f-b901-35ac83a68f4f@intel.com>
Date: Thu, 5 Feb 2026 10:21:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe: Add bounds check on pat_index to prevent OOB
 kernel read in madvise
To: "Yao, Jia" <jia.yao@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Cc: "Brost, Matthew" <matthew.brost@intel.com>,
 "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
References: <20260203172045.1154546-1-jia.yao@intel.com>
 <20260203210659.1194480-1-jia.yao@intel.com>
 <fb29d021-a0ed-4b33-b6e9-07918e966b8f@intel.com>
 <PH8PR11MB8040896B4DF18BE1393ACC50F498A@PH8PR11MB8040.namprd11.prod.outlook.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <PH8PR11MB8040896B4DF18BE1393ACC50F498A@PH8PR11MB8040.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 04/02/2026 18:15, Yao, Jia wrote:
> Thanks! May I add your Reviewed-by tag in the next revision?

Yes, with the comments addressed.

> 
>> -----Original Message-----
>> From: Auld, Matthew <matthew.auld@intel.com>
>> Sent: Wednesday, February 4, 2026 7:44 AM
>> To: Yao, Jia <jia.yao@intel.com>; intel-xe@lists.freedesktop.org
>> Cc: Brost, Matthew <matthew.brost@intel.com>; Lin, Shuicheng
>> <shuicheng.lin@intel.com>; Ghimiray, Himal Prasad
>> <himal.prasad.ghimiray@intel.com>; Thomas Hellström
>> <thomas.hellstrom@linux.intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
>> Subject: Re: [PATCH v2] drm/xe: Add bounds check on pat_index to prevent
>> OOB kernel read in madvise
>>
>> On 03/02/2026 21:06, Jia Yao wrote:
>>> When user provides a bogus pat_index value through the madvise IOCTL,
>>> the
>>> xe_pat_index_get_coh_mode() function performs an array access without
>>> validating bounds. This allows a malicious user to trigger an
>>> out-of-bounds kernel read from the xe->pat.table array.
>>>
>>> The vulnerability exists because the validation in
>>> madvise_args_are_sane() directly calls xe_pat_index_get_coh_mode(xe,
>>> args->pat_index.val) without first checking if pat_index is within [0, xe-
>>> pat.n_entries).
>>>
>>> Although xe_pat_index_get_coh_mode() has a WARN_ON to catch this in
>>> debug builds, it still performs the unsafe array access in production kernels.
>>>
>>> v2(Matthew Auld)
>>> - Using array_index_nospec() to mitigate spectre attacks when the
>>> value is used
>>>
>>> Fixes: ada7486c5668 ("drm/xe: Implement madvise ioctl for xe")
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
>>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>> Signed-off-by: Jia Yao <jia.yao@intel.com>
>>
>> I think you dropped the stable Cc.
>>
>>> ---
>>>    drivers/gpu/drm/xe/xe_vm_madvise.c | 7 ++++++-
>>>    1 file changed, 6 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c
>>> b/drivers/gpu/drm/xe/xe_vm_madvise.c
>>> index add9a6ca2390..3564e1442694 100644
>>> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
>>> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
>>> @@ -291,7 +291,12 @@ static bool madvise_args_are_sane(struct
>> xe_device *xe, const struct drm_xe_madv
>>>    		break;
>>>    	case DRM_XE_MEM_RANGE_ATTR_PAT:
>>>    	{
>>> -		u16 coh_mode = xe_pat_index_get_coh_mode(xe, args-
>>> pat_index.val);
>>> +		if (XE_IOCTL_DBG(xe, args->pat_index.val >= xe-
>>> pat.n_entries))
>>> +			return false;
>>> +
>>> +		u16 pat_index = array_index_nospec(args->pat_index.val,
>>> +xe->pat.n_entries);
>>> +
>>> +		u16 coh_mode = xe_pat_index_get_coh_mode(xe,
>> pat_index);
>>
>> nit: I think the normal coding style is to put the declarations at the start of the
>> block. The rest of this file seems to follow that.
>>
>> Otherwise:
>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>>
>>>
>>>    		if (XE_IOCTL_DBG(xe, !coh_mode))
>>>    			return false;
> 

