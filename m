Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA48C27C53
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jun 2024 23:35:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C137010E296;
	Wed, 19 Jun 2024 23:35:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hOnz7Z3a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4604A10E296
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jun 2024 23:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718840102; x=1750376102;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=QrtZ6CDGUEr63c0qqo01nShhUoSEWWylAyoo7qTPAp4=;
 b=hOnz7Z3a8+OS9G3p+8WXgU1WHoR7oOS/9E544umGqzxgmeHe4ei5avKV
 m/jBwMK7zKmEiDkSX6s5kPyNYHfadkfHUleGBO3fjF9zDuNguNDFyFTYI
 VbXh0hwjw5ZK8I0B46+1pRhgmmihG8knir/qfM8pvQCEEA1RCPD6U4d1M
 4xo1PyvCekdPOi8kblsmln6oGFYu2f7bJz1Q0D0fRcpuvSkYJyFlDQtUk
 FD24q2hXkA6Dh3NCB95wfxRFQOrs4+AhRQ9Nj4NmDZPmW3f0z2yX30fd/
 TcN3X6jWPp2Jr5iZop+/TDxRQNICO4mKKner2SsYhf+q2Hk9UrX3v6Fy5 A==;
X-CSE-ConnectionGUID: DFcoCFG4Sh2xNgUBkGeKTQ==
X-CSE-MsgGUID: 7+9PO5WJQFmoK4eV60I/vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="15671815"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="15671815"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 16:35:01 -0700
X-CSE-ConnectionGUID: 5btndrRqTeW4pzED/ilbOA==
X-CSE-MsgGUID: luBl9qifTTe9MUQjNBB19g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="79534433"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa001.jf.intel.com with ESMTP; 19 Jun 2024 16:35:00 -0700
Received: from [10.246.25.139] (unknown [10.246.25.139])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 1ABB72877B;
 Thu, 20 Jun 2024 00:34:49 +0100 (IST)
Message-ID: <0e854a3e-b552-474e-8080-1e139e466509@intel.com>
Date: Thu, 20 Jun 2024 01:34:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] drm/xe/vf: Custom HuC initialization if VF
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20240619214557.905-1-michal.wajdeczko@intel.com>
 <20240619214557.905-10-michal.wajdeczko@intel.com>
 <ZnNloxEj2yHTYahZ@DUT025-TGLU.fm.intel.com>
 <fff7c121-5b1c-4433-bfe8-403f685a889a@intel.com>
 <ZnNofcyDFwoy7MDi@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <ZnNofcyDFwoy7MDi@DUT025-TGLU.fm.intel.com>
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



On 20.06.2024 01:23, Matthew Brost wrote:
> On Thu, Jun 20, 2024 at 01:14:29AM +0200, Michal Wajdeczko wrote:
>>
>>
>> On 20.06.2024 01:11, Matthew Brost wrote:
>>> On Wed, Jun 19, 2024 at 11:45:57PM +0200, Michal Wajdeczko wrote:
>>>> The HuC firmware is loaded and initialized by the PF driver. Make
>>>> sure VF driver performs only limited data structure initialization.
>>>>
>>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>> ---
>>>>  drivers/gpu/drm/xe/xe_huc.c | 4 ++++
>>>>  1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
>>>> index 6238fb354914..c88761fe31c9 100644
>>>> --- a/drivers/gpu/drm/xe/xe_huc.c
>>>> +++ b/drivers/gpu/drm/xe/xe_huc.c
>>>> @@ -21,6 +21,7 @@
>>>>  #include "xe_guc.h"
>>>>  #include "xe_map.h"
>>>>  #include "xe_mmio.h"
>>>> +#include "xe_sriov.h"
>>>>  #include "xe_uc_fw.h"
>>>>  
>>>>  static struct xe_gt *
>>>> @@ -92,6 +93,9 @@ int xe_huc_init(struct xe_huc *huc)
>>>>  	if (!xe_uc_fw_is_enabled(&huc->fw))
>>>>  		return 0;
>>>>  
>>>> +	if (IS_SRIOV_VF(xe))
>>>> +		return 0;
>>>> +
>>>
>>> With this change I assume the main part of xe_huc_auth is never called
>>> on a VF?
>>>
>>> Does xe_uc_fw_is_loadable return false on a VF?
>>
>> yes, as on VF it is marked as PRELOADED, so:
>>
>> static inline bool xe_uc_fw_is_loadable(struct xe_uc_fw *uc_fw)
>> {
>> 	return __xe_uc_fw_status(uc_fw) >= XE_UC_FIRMWARE_LOADABLE &&
>> 		__xe_uc_fw_status(uc_fw) != XE_UC_FIRMWARE_PRELOADED;
>> }
>>
>> returns false
>>
> 
> To be clear, I'd add asserts to parts of functions which should not be
> executed on a VF if it is expected to short circuit on another function.
> 
> e.g.
> 
> xe_huc_auth()
> 	if (!xe_uc_fw_is_loadable)
> 		return
> 
> 	xe_assert(!VF);

hmm, but then we might pollute the whole driver with such asserts, as VF
really can do only limited stuff

besides, we already track any unwanted access to unavailable registers
from VFs in xe_mmio_read32()

	if (!reg.vf && IS_SRIOV_VF(gt_to_xe(gt)))
		val = xe_gt_sriov_vf_read32(gt, reg);

...

xe_gt_WARN(gt, IS_ENABLED(CONFIG_DRM_XE_DEBUG),
	   "VF is trying to read an inaccessible register %#x+%#x\n",
	   reg.addr, addr - reg.addr);

and I'm planning to add similar code (or xe_assert) to xe_mmio_write()

finally, GuC will report errors if VF will try to execute privileged action

so IMO spreading xe_assert(!VF) all over is not ideal

> 
> This patch LGTM to me though. With that:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> 
>>>
>>> Matt
>>>
>>>>  	if (huc->fw.has_gsc_headers) {
>>>>  		ret = huc_alloc_gsc_pkt(huc);
>>>>  		if (ret)
>>>> -- 
>>>> 2.43.0
>>>>
