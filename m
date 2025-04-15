Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB12C369AB
	for <intel-xe@archiver.kernel.org>; Tue, 15 Apr 2025 12:40:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F12510E368;
	Tue, 15 Apr 2025 12:40:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="kUOfOZKF";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDB0810E77A
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Apr 2025 12:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h9BC526acjez272xrlY5HDcDlG9/WyEgjnDR5yYE8vo=; b=kUOfOZKFjDmjjONXxd2p6U5gJX
 vsFCNgncs85JWkK/jiItLrMmBSfhpJZq1lM3sUZnotlmgqgJ5lrVdZCsMf0r+HIn49X67wa2x/2fl
 4fQC/R+VKoi5RgCLmca5RrCYzDNv59Rh93u5dBAMWFzJSZh9xzkuHPMh3jvmHfJd500zqIZ1BJx6R
 sULUV05o+MQue/C+UtCHHtKGflgi4docgfn2yCehL/sUdDJSaRlw5lG+v8mZgoZIA9Z8SvffcjgLN
 VrQ7nfBZIeXGrRTWywalh3BdgFzRbvgWWSA61b0RgqHPJSWR6aRjQDHDzA7ynFlRSmecvBdvxqshY
 qhFECS/Q==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1u4faU-00Gw5n-V4; Tue, 15 Apr 2025 14:40:27 +0200
Message-ID: <6c723c10-4466-4d30-80cd-d8ef01ae0f19@igalia.com>
Date: Tue, 15 Apr 2025 13:40:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/16] drm/xe: Adjust ringbuf emission for maximum
 possible size
To: Francois Dugast <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20250403190317.6064-1-tvrtko.ursulin@igalia.com>
 <20250403190317.6064-2-tvrtko.ursulin@igalia.com>
 <Z_5KC1Xny1EZCxR6@fdugast-desk>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <Z_5KC1Xny1EZCxR6@fdugast-desk>
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


On 15/04/2025 12:59, Francois Dugast wrote:
> On Thu, Apr 03, 2025 at 08:03:01PM +0100, Tvrtko Ursulin wrote:
>> MAX_JOB_SIZE_DW seems to be undersized. For the worst case emission from
>>   __emit_job_gen12_render_compute I hand count 57 dwords so lets bump this
>> to an even 58.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> 
> Reviewed-by: Francois Dugast <francois.dugast@intel.com>

Thank you!

Can you (or maintainers) take this one from the series or I should send 
it standalone?

Regards,

Tvrtko

>> ---
>>   drivers/gpu/drm/xe/xe_ring_ops_types.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ring_ops_types.h b/drivers/gpu/drm/xe/xe_ring_ops_types.h
>> index 1ae56e2ee7b4..d7e3e150a9a5 100644
>> --- a/drivers/gpu/drm/xe/xe_ring_ops_types.h
>> +++ b/drivers/gpu/drm/xe/xe_ring_ops_types.h
>> @@ -8,7 +8,7 @@
>>   
>>   struct xe_sched_job;
>>   
>> -#define MAX_JOB_SIZE_DW 48
>> +#define MAX_JOB_SIZE_DW 58
>>   #define MAX_JOB_SIZE_BYTES (MAX_JOB_SIZE_DW * 4)
>>   
>>   /**
>> -- 
>> 2.48.0
>>

