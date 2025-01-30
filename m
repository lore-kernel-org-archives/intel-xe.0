Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56DA9C0218A
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jan 2025 08:59:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02D7610E2CF;
	Thu, 30 Jan 2025 08:59:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="rp/XPjh4";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C75710E2D2
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jan 2025 08:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rmTSnw5X+dg86tEKQK64t/r82UdzmW9KEiiXvxRXLxU=; b=rp/XPjh439mLgypfHqNBSZ8R4x
 h/6Y0/E2ZhNzkIvH2UqAfRWtRFpLHOnvMHD1pURZ0nUdl6iBMf1nHJBGPOU2ZKT8VCof+h8ogAmdT
 yqaS34iWOXPlvqv/mzGr8cf/IPgjAj734rlDDqAqYEwg2q4mFMWqlyyLxnPNKMtiO9ax9R2sgEVlA
 Su222RC5TuWO9avBPFsynycMPjhp9q6sYULTiMdv2haPUjqwJHsmea3KuE8KN8yX0BXAOVmVTXzvc
 mEvwSoayy67WSEvRH2TE9FFkWcobetvbTDAqwR/vkNFtzryWZOfuqoTTq+2B+hPR2G4nOBMxnfDkA
 RbqpBV2Q==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tdQOO-000xeD-QJ; Thu, 30 Jan 2025 09:59:26 +0100
Message-ID: <471f6b94-a2d1-4508-a54d-8205db5f574d@igalia.com>
Date: Thu, 30 Jan 2025 08:59:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] drm/xe: Fix GT workaround handling
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com,
 Matt Roper <matthew.d.roper@intel.com>
References: <20250129155627.93827-1-tvrtko.ursulin@igalia.com>
 <20250129155627.93827-2-tvrtko.ursulin@igalia.com>
 <mgjamkdkkivqko63evowuxuqhxyabr3oxqdkc27ldyja57eelf@xa3pdzszryrr>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <mgjamkdkkivqko63evowuxuqhxyabr3oxqdkc27ldyja57eelf@xa3pdzszryrr>
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


On 29/01/2025 17:46, Lucas De Marchi wrote:
> On Wed, Jan 29, 2025 at 03:56:23PM +0000, Tvrtko Ursulin wrote:
>> Any rules using engine matching are currently broken due RTP
>> processing happening in early init before the list of hardware
>> engines has been initialised.
> 
> for *gt* workarounds, it only makes sense to have an engine check
> if it's something like
>      XE_RTP_ENTRY_FLAG(FOREACH_ENGINE)
> 
> ... as it doesn't have an engine context. It will loop through all the
> engines on that gt and add the entry for that register and it should be
> able to do that before the complete engine setup. But indeed, a
> quick look on my tgl doesn't show e.g. 14011060649 as being used:
> 
> cat /sys/kernel/debug/dri/0/gt0/workarounds

Exactly.

> I will have to take another look.
> 
> It would be useful to dump gt0/workarounds and gt0/register-save-restore
> and check for not having a setting that should be there, adding it to
> the commit message.

Ok. I did not stop gt0/register-save-restore.

>> Fix it my moving the processing to later in the init phase.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_gt.c | 8 ++++----
>> 1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 01a4a852b8f4..7feb4b6fb976 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -380,10 +380,6 @@ int xe_gt_init_early(struct xe_gt *gt)
>>     if (err)
>>         return err;
>>
>> -    xe_wa_process_gt(gt);
>> -    xe_wa_process_oob(gt);
>> -    xe_tuning_process_gt(gt);
>> -
>>     xe_force_wake_init_gt(gt, gt_to_fw(gt));
>>     spin_lock_init(&gt->global_invl_lock);
>>
>> @@ -616,6 +612,10 @@ int xe_gt_init(struct xe_gt *gt)
>>     if (err)
>>         return err;
>>
>> +    xe_wa_process_gt(gt);
>> +    xe_wa_process_oob(gt);
>> +    xe_tuning_process_gt(gt);
> 
> that is too late as we need the gt WAs in place before initializing GuC.

Yeah it was a fumble. I did find the code paths where engines are 
initialised:

xe_gt_init						
   gt_fw_domain_init
     xe_hw_engines_init_early
       hw_engine_init_early
       	  hwe->name = ...

And then for some reason moved the calls to not straight after 
gt_fw_domain_init. Will re-check and respin.

Regards,

Tvrtko

> 
> Lucas De Marchi
> 
>> +
>>     xe_force_wake_init_engines(gt, gt_to_fw(gt));
>>
>>     err = all_fw_domain_init(gt);
>> -- 
>> 2.48.0
>>
