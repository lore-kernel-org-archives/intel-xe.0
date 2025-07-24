Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B29D1C83F1A
	for <intel-xe@archiver.kernel.org>; Thu, 24 Jul 2025 14:58:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 794DB10E96E;
	Thu, 24 Jul 2025 14:58:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="o9WyJFvg";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E396110E96E
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Jul 2025 14:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YOm+esbjSic8cpkJME2nYnlyYLHaTj80ewilibbCdq4=; b=o9WyJFvgnbFd4tQFNfXrYlAu1Y
 pdaNNbhNTaD87FCQnbWSMkCWF13dxIJ4MW3PCSAEOUqXtKJHK2QKKq2L9JlWfwEfGltX6T7SNrSCc
 ILMAjlORU0a2k5CjCOsIGOpEeWdyX9s7OtgDLx4kF0vd3ikMivj2IxdC50Yrc62xn+b9m0X0QgJRb
 KtROCHauDMSZlZrVyC6lLG4TzTEmm1cbmxnWioTWezvsGFZF0xlZ45e5h1XlcxPJ5BsX0Kc8/Idu7
 VyLFNzc7nhxG27tCZRQOuUembXgOo8Hq7jY3l/HD2t9DGBJnH1MowHlNtZcTVE8KhmPraExKZhtOT
 qnB8zG1A==;
Received: from [84.66.36.92] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uexOm-003Eps-Sa; Thu, 24 Jul 2025 16:58:20 +0200
Message-ID: <4ae56101-5660-46e6-a424-6e8599751e70@igalia.com>
Date: Thu, 24 Jul 2025 15:58:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [CI 01/13] drm/xe: Use emit_flush_imm_ggtt helper instead of open
 coding
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20250724131711.74291-1-tvrtko.ursulin@igalia.com>
 <20250724131711.74291-2-tvrtko.ursulin@igalia.com>
 <h2yvdahgc7ifjc3n2lx4ksie2zlc7q6vz7v7uopwasuj5mxdzt@ocuu4ztn744g>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <h2yvdahgc7ifjc3n2lx4ksie2zlc7q6vz7v7uopwasuj5mxdzt@ocuu4ztn744g>
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


On 24/07/2025 15:49, Lucas De Marchi wrote:
> On Thu, Jul 24, 2025 at 02:16:58PM +0100, Tvrtko Ursulin wrote:
>> Helper is already there so lets just use it.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> 
> no behavior change in this particular patch,
> pushed to drm-xe-next.

Thanks!

I am trying to figure out why kms_frontbuffer_tracking@basic on BMG is 
persistently getting upset by this series. Appears to be impossible but 
I must be missing something.

Regards,

Tvrtko

>> ---
>> drivers/gpu/drm/xe/xe_ring_ops.c | 8 +++-----
>> 1 file changed, 3 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/ 
>> xe_ring_ops.c
>> index 7b50c7c1ee21..e8f22ec5f9af 100644
>> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
>> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
>> @@ -415,11 +415,9 @@ static void emit_migration_job_gen12(struct 
>> xe_sched_job *job,
>>
>>     i = emit_bb_start(job->ptrs[1].batch_addr, BIT(8), dw, i);
>>
>> -    dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | job- 
>> >migrate_flush_flags |
>> -        MI_FLUSH_DW_OP_STOREDW | MI_FLUSH_IMM_DW;
>> -    dw[i++] = xe_lrc_seqno_ggtt_addr(lrc) | MI_FLUSH_DW_USE_GTT;
>> -    dw[i++] = 0;
>> -    dw[i++] = seqno; /* value */
>> +    i = emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno,
>> +                MI_INVALIDATE_TLB | job->migrate_flush_flags,
>> +                dw, i);
>>
>>     i = emit_user_interrupt(dw, i);
>>
>> -- 
>> 2.48.0
>>

