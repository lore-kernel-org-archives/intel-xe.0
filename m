Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 951C1C47DDB
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jan 2024 18:19:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 424F110E882;
	Tue, 23 Jan 2024 18:19:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68F7810E83A
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jan 2024 18:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706033977; x=1737569977;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=0C2XZ4Jc2SMXKmThD5f98T50rmdJYxsKt49Gdy+XrxQ=;
 b=RcSaYh0IYCrDwYWrrNTBCeWgGxRPBeVVLkLDV614CvM+BqnfGfYxH1TZ
 KNcmzbyMvmMrLJCLsWNlwx42WYCGat26ovv/boC/c8Tga/sy7LliGNtHG
 pKQEvZflhjldoj+wH/utPuYtSzO2r+6GcpIF0jfK3ustJTmIe0oq/Ywxz
 m0e67faCSFLCHIT9fpMT5ufWxhiYCoDWD5xZMKrcO24Gy2j0iQMvAV3Cy
 rk7eTvFo1YQM+Y/BKEI8otH7JQ21H+poyqdK/i+TT87PGtpEGMsHg94On
 hc2Bsdi9jjuR7YEOIJw9iHMx9N+u4gDWMQsNhqRgCTRwmXwtJCr4AoKnN Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="465883022"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="465883022"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 10:19:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="929412099"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="929412099"
Received: from pzsolt-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.40.183])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 10:19:35 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, Suraj Kandpal
 <suraj.kandpal@intel.com>, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/xe/gsc: Add status check during gsc header readout
In-Reply-To: <d32e4718-53a6-4ebb-87cb-3b50cfc283a6@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240123062846.577031-1-suraj.kandpal@intel.com>
 <d32e4718-53a6-4ebb-87cb-3b50cfc283a6@intel.com>
Date: Tue, 23 Jan 2024 20:19:32 +0200
Message-ID: <878r4fnc97.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 23 Jan 2024, Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com> wrote:
> On 1/22/2024 10:28 PM, Suraj Kandpal wrote:
>> Before checking if data is present in the message reply check the
>> status in header and see if it indicates any error.
>>
>> --v2
>> - Use drm_err() instead of drm_dbg_kms() [Daniele]
>>
>> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
>> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gsc_submit.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gsc_submit.c b/drivers/gpu/drm/xe/xe_gsc_submit.c
>> index 9ecc1ead6844..3c402fe36026 100644
>> --- a/drivers/gpu/drm/xe/xe_gsc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_gsc_submit.c
>> @@ -125,11 +125,18 @@ int xe_gsc_read_out_header(struct xe_device *xe,
>>   {
>>   	u32 marker = mtl_gsc_header_rd(xe, map, offset, validity_marker);
>>   	u32 size = mtl_gsc_header_rd(xe, map, offset, message_size);
>> +	u32 status = mtl_gsc_header_rd(xe, map, offset, status);
>>   	u32 payload_size = size - GSC_HDR_SIZE;
>>   
>>   	if (marker != GSC_HECI_VALIDITY_MARKER)
>>   		return -EPROTO;
>>   
>> +	if (status != 0) {
>> +		drm_err(xe, "GSC header readout indicates error: %d\n",
>
> Sorry I didn't notice it in the first rev, but this should be &xe->drm 
> and not just xe. Note that since drm is the first thing inside the xe 
> structure, a pointer to the xe structure also points to xe->drm, so it 
> still works like this, but it isn't clean.

Does it actually build? There's no xe->dev member. See the definitions
of drm_err and __drm_printk.

Btw Suraj's messages didn't get through to the list, and thus CI wasn't
triggered.

BR,
Jani.



>
> Daniele
>
>> +			status);
>> +		return -EINVAL;
>> +	}
>> +
>>   	if (size < GSC_HDR_SIZE || payload_size < min_payload_size)
>>   		return -ENODATA;
>>   
>

-- 
Jani Nikula, Intel
