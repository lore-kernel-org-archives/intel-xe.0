Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7550CC83F03
	for <intel-xe@archiver.kernel.org>; Wed,  9 Jul 2025 07:34:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39F7C10E754;
	Wed,  9 Jul 2025 07:34:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="N9DmscAr";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52AA010E754
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Jul 2025 07:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xR0tO6JWUh0aR8Ixnv8S0y9i/b9WXnC7f76N2XC/TII=; b=N9DmscArB1Y1mBiHOebLZql9p7
 qYTfXiY+fq3jPpfIsSB3DkW6Su6dVXbvewrsAhi0bGfPckb1KX8BiIs3wu/ifPncCyEkbNZhbvQRq
 ZNWD/oW6qbpw2oPfEjzzIWulod9r1m7PeoGgIASF6iDDbMaKAAaL7nVhB182vP+70tURGZ8SpnDrv
 2Qux+ebu/FxTqq6+NyPr7oGhm1yJcQOnz3YszerCRXJRXKHyXfSMm2xXa/WBVJciD1VdpaaIwN+Ua
 UdOFcekqIvjz38ufY8vSaiZm/TH8B2CQl7KDgdhneuNWdOVU5bSP3MjZu5FFIC9H/wFH2tMOlhK1E
 UevCYLMg==;
Received: from [84.65.48.237] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uZPJj-00EMYA-DE; Wed, 09 Jul 2025 09:34:11 +0200
Message-ID: <a35a44c3-6410-463d-8227-4dc37fdfc049@igalia.com>
Date: Wed, 9 Jul 2025 08:34:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] drm/xe/gt: Drop third submission for default context
To: Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20250703-lrc-refactors-v1-0-6aa22f174041@intel.com>
 <20250703-lrc-refactors-v1-6-6aa22f174041@intel.com>
 <32e154a8-4c01-47eb-8ac9-bbdb42a3eeb5@igalia.com>
 <nxvygecgyeh43k4pru36f4v3g2qcgweh7wsz5mhphiky435dwn@hc2hw4emmzav>
 <aGylzRvFQBqCF6be@lstrano-desk.jf.intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <aGylzRvFQBqCF6be@lstrano-desk.jf.intel.com>
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


On 08/07/2025 05:59, Matthew Brost wrote:
> On Mon, Jul 07, 2025 at 09:55:58PM -0500, Lucas De Marchi wrote:
>> On Fri, Jul 04, 2025 at 12:21:50PM +0100, Tvrtko Ursulin wrote:
>>>
>>> On 03/07/2025 23:41, Lucas De Marchi wrote:
>>>> There's no need to submit the nop job again on the first queue. Any
>>>> state needed is already saved when the first LRC is switched out. The
>>>> comment is a little misleading regarding indirect W/A: first of all
>>>> there's still no indirect W/A enabled and secondly, even after they are,
>>>> there's no need to submit this job again for having their state
>>>> propagated: the indirect W/A will actually run on every LRC switch.
>>>>
>>>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/xe/xe_gt.c | 8 --------
>>>>   1 file changed, 8 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>>>> index 67425e37c2187..439e7c703ed84 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt.c
>>>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>>>> @@ -361,14 +361,6 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
>>>>   			goto put_nop_q;
>>>>   		}
>>>> -		/* Reload golden LRC to record the effect of any indirect W/A */
>>>> -		err = emit_nop_job(gt, q);
>>>> -		if (err) {
>>>> -			xe_gt_err(gt, "hwe %s: emit_nop_job failed (%pe) guc_id=%u\n",
>>>> -				  hwe->name, ERR_PTR(err), q->guc->id);
>>>> -			goto put_nop_q;
>>>> -		}
>>>> -
>>>>   		xe_map_memcpy_from(xe, default_lrc,
>>>>   				   &q->lrc[0]->bo->vmap,
>>>>   				   xe_lrc_pphwsp_offset(q->lrc[0]),
>>>>
>>>
>>> Wasn't it also racy to memcpy from q's LRC without guaranteeing context
>>> save had completed? I don't think dma_fence_wait in emit_nop_job
>>> guarantees it. If that is so this patch should actually have Fixes:
>>> added and commit message adjusted accordingly.
>>
>> I don't think it really fixes anything, it's just pointless to do it.
>> It would just save the same information from the first time it executed
>> even if there was a race.
>>
> 
> Agree with Lucas, this pointless yet harmless.

If you guys are certain the way hardware saves the context has no 
opportunity to make the memcpy see a "corrupt" state then okay.

Otherwise I was thinking split/incomplete qw writes when context save 
races with the memcpy. If for example they would be written by 2x dw by 
the hw. Or whether context save has any guarantees on the order of 
writes. Might be all sprinkled out by units randomly. Something along 
those lines.

Regards,

Tvrtko

