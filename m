Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3715C25B7E
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jun 2024 13:06:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E97F10E150;
	Tue,  4 Jun 2024 13:06:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iX7U9gKo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75D7510E150
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jun 2024 13:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717506370; x=1749042370;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=KqOShfKT4M4PHpQVLx2NUpXCjKZD1j0B08R2WPRVknM=;
 b=iX7U9gKo8HdGjYuY/8WQ1syxP/HKj4Yf2plPxbxzECe8wPQRLaVwVi2l
 lavMttJ5+ZwLUNX38KJqRRJUkY8cnuG0k65qotfmiMYzQe/u4ER2O4U28
 bKNDnLrHuS/n0yA9ZiJwlPhanlHfAU2A7sGX3kub7MqkLAfj595KPpbCX
 n1/qT30e313lPvY4RkeZrouYt7cOCXcDKDQ0l/GN7V+Xgz35BetkeZigz
 D0MmOx3c+jMjGvXXUEicvNFT0V4/01oOp9xRtbMx/T3xjYogG2h0UkiuH
 sdKfLehqs1Zd27647UWucME5DLXkLjdou9l4/p06qOFNV34wLVr8GLope Q==;
X-CSE-ConnectionGUID: 3aZ2VjQPRTy6yI81oI+aTA==
X-CSE-MsgGUID: EN4mUmlgRAuCbbrUWhqPCg==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="24715393"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="24715393"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 06:06:09 -0700
X-CSE-ConnectionGUID: N0NP6VyXToCftGNoWOUaEw==
X-CSE-MsgGUID: MLDSbNtrRKuWkzVL5peO7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="42182710"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.50.1])
 ([10.246.50.1])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 06:06:08 -0700
Message-ID: <1f0c994e-1ecc-4f47-9161-ceff346e35d1@linux.intel.com>
Date: Tue, 4 Jun 2024 15:06:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] drm/xe/pat: Always call xe_force_wake_put/get in pairs
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org
References: <20240604110225.29495-1-nirmoy.das@intel.com>
 <20240604110225.29495-3-nirmoy.das@intel.com>
 <ab9b7cd1-852a-4144-80bb-e41ef23c9d09@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <ab9b7cd1-852a-4144-80bb-e41ef23c9d09@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi Michal,

On 6/4/2024 2:54 PM, Michal Wajdeczko wrote:
>
> On 04.06.2024 13:02, Nirmoy Das wrote:
>> xe_force_wake_get() increments the domain ref regardless of success
>> or failure so call xe_force_wake_put() even on failure to keep ref
>> count accurate.
>>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pat.c | 10 +++++-----
>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
>> index 4ee32ee1cc88..a5bdf4de845c 100644
>> --- a/drivers/gpu/drm/xe/xe_pat.c
>> +++ b/drivers/gpu/drm/xe/xe_pat.c
>> @@ -190,9 +190,9 @@ static void xelp_dump(struct xe_gt *gt, struct drm_printer *p)
>>   			   XELP_MEM_TYPE_STR_MAP[mem_type], pat);
>>   	}
>>   
>> -	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>>   err_fw:
>>   	xe_assert(xe, !err);
>> +	xe_assert(xe, !xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
> this is wrong as xe_assert() will be compiled out on the production
> builds, see [1]
>
> [1]
> https://www.kernel.org/doc/html/latest/gpu/xe/xe_debugging.html?highlight=xe_assert#debugging

Ah, yes! thanks for catching this.


Regards,

Nirmoy

>
>>   }
>>   
>>   static const struct xe_pat_ops xelp_pat_ops = {
>> @@ -221,9 +221,9 @@ static void xehp_dump(struct xe_gt *gt, struct drm_printer *p)
>>   			   XELP_MEM_TYPE_STR_MAP[mem_type], pat);
>>   	}
>>   
>> -	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>>   err_fw:
>>   	xe_assert(xe, !err);
>> +	xe_assert(xe, !xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>>   }
>>   
>>   static const struct xe_pat_ops xehp_pat_ops = {
>> @@ -250,9 +250,9 @@ static void xehpc_dump(struct xe_gt *gt, struct drm_printer *p)
>>   			   REG_FIELD_GET(XEHPC_CLOS_LEVEL_MASK, pat), pat);
>>   	}
>>   
>> -	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>>   err_fw:
>>   	xe_assert(xe, !err);
>> +	xe_assert(xe, !xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>>   }
>>   
>>   static const struct xe_pat_ops xehpc_pat_ops = {
>> @@ -284,9 +284,9 @@ static void xelpg_dump(struct xe_gt *gt, struct drm_printer *p)
>>   			   REG_FIELD_GET(XELPG_INDEX_COH_MODE_MASK, pat), pat);
>>   	}
>>   
>> -	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>>   err_fw:
>>   	xe_assert(xe, !err);
>> +	xe_assert(xe, !xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>>   }
>>   
>>   /*
>> @@ -366,9 +366,9 @@ static void xe2_dump(struct xe_gt *gt, struct drm_printer *p)
>>   		   REG_FIELD_GET(XE2_COH_MODE, pat),
>>   		   pat);
>>   
>> -	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>>   err_fw:
>>   	xe_assert(xe, !err);
>> +	xe_assert(xe, !xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>>   }
>>   
>>   static const struct xe_pat_ops xe2_pat_ops = {
