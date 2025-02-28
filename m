Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E17B5C19776
	for <intel-xe@archiver.kernel.org>; Fri, 28 Feb 2025 08:10:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A87D310E24D;
	Fri, 28 Feb 2025 08:10:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="I7AnEtTe";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D7A810E24D
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Feb 2025 08:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qWr9mNxgKUFvCuCtd13obW0RXObkWTkfDglRCkYu0V0=; b=I7AnEtTeDjWFWkWFLQjScQESnq
 /oi6njgESiqeWDINqWxWlULkTN9Pur6pVlHLZRlMWWTHkDt4tRwfMaCNnnMttE86TH3UldWyzOlXz
 INlCyggPpMw98IUDDCOLipvyS2qdb2Ti8fqqqdW7Wa1FxfqF1MW1uSyvuPZce+c+yyRo5rU5oBuDl
 fTq6VIkSW10x+ADo/DLiaX1owNrbomxwcKqL8bMD/5ilaqLMDPKGu8WXY/7l3pPOMYxLaPfa/xfNN
 zFS88XIRaxJ5gBCLcOm4/hivWKsG9e++/H5GiD+hgU7tpKudwzy0dTHu8kEH4Sk00o5HDz8wrIHz6
 w48pijGg==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tnvRe-001wOO-Qw; Fri, 28 Feb 2025 09:10:12 +0100
Message-ID: <04d6b13c-ed8e-4df8-abf0-2b35c46a98cd@igalia.com>
Date: Fri, 28 Feb 2025 08:10:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/12] drm/xe: Fix MOCS debugfs LNCF readout
To: Matt Roper <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20250221101736.78986-1-tvrtko.ursulin@igalia.com>
 <20250221101736.78986-2-tvrtko.ursulin@igalia.com>
 <20250227232454.GK5109@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20250227232454.GK5109@mdroper-desk1.amr.corp.intel.com>
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


On 27/02/2025 23:24, Matt Roper wrote:
> On Fri, Feb 21, 2025 at 10:17:20AM +0000, Tvrtko Ursulin wrote:
>> With only XE_FW_GT taken LNCF registers read back as all zeroes, leading
>> to a wild goose chase trying to figure out why is register programming
>> incorrect.
>>
>> Fix it by grabbing XE_FORCEWAKE_ALL for affected platforms.
> 
> LNCF MOCS registers were only in the render power domain on the old
> Xe_LP platforms.  From Xe_HP onward they moved into the GT power domain
> (and then in Xe2 they were removed completely).

Should I add a platform check on top of HAS_LNCF_MOCS? Or just the 
platform check? Or use XE_FORCEWAKE_ALL always as Rodrigo commented?

Regards,

Tvrtko

>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> ---
>>   drivers/gpu/drm/xe/xe_mocs.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
>> index 54d199b5cfb2..31dade91a089 100644
>> --- a/drivers/gpu/drm/xe/xe_mocs.c
>> +++ b/drivers/gpu/drm/xe/xe_mocs.c
>> @@ -781,7 +781,9 @@ void xe_mocs_dump(struct xe_gt *gt, struct drm_printer *p)
>>   	flags = get_mocs_settings(xe, &table);
>>   
>>   	xe_pm_runtime_get_noresume(xe);
>> -	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>> +	fw_ref = xe_force_wake_get(gt_to_fw(gt),
>> +				   flags & HAS_LNCF_MOCS ?
>> +				   XE_FORCEWAKE_ALL : XE_FW_GT);
>>   	if (!fw_ref)
>>   		goto err_fw;
>>   
>> -- 
>> 2.48.0
>>
> 

