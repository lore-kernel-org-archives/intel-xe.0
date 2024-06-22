Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAE8FC27C53
	for <intel-xe@archiver.kernel.org>; Sat, 22 Jun 2024 09:17:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 651BB10E19C;
	Sat, 22 Jun 2024 09:17:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vutv9v8r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6862010E19C
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Jun 2024 09:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719047839; x=1750583839;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=lq3Ss1cFj6C0BS/5+DhKprKtlgMPYSqixbMtoJH/v1o=;
 b=Vutv9v8rf2RMsy3ThO365Ux3ZAS+XmuBUSGrSGWzmvBVQ6jx1SUmlOi2
 rbv34evCZylKyccu3AQLx1Vd9NfCVoJF3aIYAwN5Q2ZzhZTyv7yZDNPfK
 vVUZMEbqm2J7xJechqm3w0w6GehbReOUSze4ZhCTQvOBTvNQCDfv+mAXg
 +cQWsTc9t/Th8TjFXP2d1fAuL1A+tgRzf1LD3GCwC9jSOMXfN3moe0YIw
 zBWGqP6sTAiz9d3EB9ZHGasa3XFuamk+oLrIURBu/An+fsMUhWD4Bt6HA
 XCvSPtVdwf+OaTCT5KeR1rNk7Z7aGWvTPMoRSVploIbYNw8olgsVbCADy A==;
X-CSE-ConnectionGUID: MgOzS8HKRECvqWenrdTW0w==
X-CSE-MsgGUID: +XlVyCB7TISIvE3fMv7l2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="27484412"
X-IronPort-AV: E=Sophos;i="6.08,257,1712646000"; d="scan'208";a="27484412"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2024 02:17:18 -0700
X-CSE-ConnectionGUID: h2TXc3O3QbWvHMIFBKdYAw==
X-CSE-MsgGUID: 4k5yxH+ITSysELzoPhR0AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,257,1712646000"; d="scan'208";a="42914337"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa009.jf.intel.com with ESMTP; 22 Jun 2024 02:17:16 -0700
Received: from [10.246.19.248] (mwajdecz-MOBL.ger.corp.intel.com
 [10.246.19.248])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 8402612595;
 Sat, 22 Jun 2024 10:17:13 +0100 (IST)
Message-ID: <fa258ff8-86f2-4802-ba54-cd6705ce6e3d@intel.com>
Date: Sat, 22 Jun 2024 11:17:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/oa: Fix 'enum drm_xe_perf_type' kernel doc warnings
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20240621190903.3593781-1-ashutosh.dixit@intel.com>
 <508be309-17c8-419a-92b4-91cd06d2cb6b@intel.com>
 <87wmmihtbw.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <87wmmihtbw.wl-ashutosh.dixit@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 21.06.2024 23:36, Dixit, Ashutosh wrote:
> On Fri, 21 Jun 2024 12:45:43 -0700, Michal Wajdeczko wrote:
>>
> 
> Hi Michal,
> 
>>
>> On 21.06.2024 21:09, Ashutosh Dixit wrote:
>>> Include kernel doc's for 'enum drm_xe_perf_type' to fix kernel doc
>>> warnings.
>>>
>>> Reported-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>>> ---
>>>  include/uapi/drm/xe_drm.h | 5 ++++-
>>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>>> index 93e00be44b2d..d831f277f186 100644
>>> --- a/include/uapi/drm/xe_drm.h
>>> +++ b/include/uapi/drm/xe_drm.h
>>> @@ -1379,8 +1379,11 @@ struct drm_xe_wait_user_fence {
>>>   * enum drm_xe_perf_type - Perf stream types
>>>   */
>>>  enum drm_xe_perf_type {
>>> +	/** @DRM_XE_PERF_TYPE_OA: OA perf stream type */
>>> 	DRM_XE_PERF_TYPE_OA,
>>> -	__DRM_XE_PERF_TYPE_MAX, /* non-ABI */
>>> +
>>> +	/** @__DRM_XE_PERF_TYPE_MAX: Non-ABI */
>>
>> hmm, I would rather not document it at all, by marking it as:
>>
>> 	/* private: */
>>
>> see https://www.kernel.org/doc/html/next/doc-guide/kernel-doc.html#members
>>
>>> +	__DRM_XE_PERF_TYPE_MAX,
>>>  };
>>>
>>>  /**
> 
> Unfortunately, not documenting it doesn't seem to work and will result in
> kernel-doc error below:
> 
> $ ./scripts/kernel-doc -Werror -none include/uapi/drm/xe_drm.h
> include/uapi/drm/xe_drm.h:1388: warning: Enum value '__DRM_XE_PERF_TYPE_MAX' not described in enum 'drm_xe_perf_type'
> 1 warnings as Errors

hmm, but below diff works for me:

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 93e00be44b2d..081e584240e6 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1379,7 +1379,9 @@ struct drm_xe_wait_user_fence {
  * enum drm_xe_perf_type - Perf stream types
  */
 enum drm_xe_perf_type {
+       /** @DRM_XE_PERF_TYPE_OA: OA perf stream type */
        DRM_XE_PERF_TYPE_OA,
+       /* private: */
        __DRM_XE_PERF_TYPE_MAX, /* non-ABI */
 };


make sure you don't use /** private: */ as this might be not recognized

OTOH, if __DRM_XE_PERF_TYPE_MAX is not a real ABI definition, why did we
put this into uabi header?

see also DRM_XE_OA_PROPERTY_MAX that IMO should be either removed from
uabi or at least marked as a 'private'

+ Rodrigo

> 
> Thanks.
> --
> Ashutosh
