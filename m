Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B91D5C7EE22
	for <intel-xe@archiver.kernel.org>; Tue,  9 May 2023 12:29:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F1C910E0A5;
	Tue,  9 May 2023 12:29:29 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2404E10E0A5
 for <intel-xe@lists.freedesktop.org>; Tue,  9 May 2023 12:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683635368; x=1715171368;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=zfMmr1O6d4FcRatlmbWfEO0Z82wgg/9DTLfYdsrln0Q=;
 b=hbS2B47qyzJpDb11rqehTkh1dJeV3O1POYaEUzNxQCzcsWu1mDgBLiL5
 JUCDV6sDJigdteDPCMdir/fzRbJStbJuim/bxe2ACAc4T8K8Bge/mAQmE
 2fHuJDmbdpMoxqMFLIhR7pw5oxitm7CAhjm4RKaNH0FKhlOmELYaQeOZS
 8AmabPwWNTEsARlCJLPE37x4Gc8rtDMFiO2pnZfZIoqh77IdXyQ+ZIiWb
 5tS0A6zLI4nFJeafqFDctBvJLk1193FECLOCAykd647zL/qUcgLCb6heL
 rv+j2rw4YQvN1ljOfpj9kIWGLq452gc8djgJ2XJipe6zHUenuQYRFR66e Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="349945276"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; d="scan'208";a="349945276"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2023 05:29:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="698879563"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; d="scan'208";a="698879563"
Received: from jparkkin-mobl.ger.corp.intel.com (HELO [10.249.254.236])
 ([10.249.254.236])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2023 05:29:26 -0700
Message-ID: <58a2affd-fb1f-f703-80f7-836bf2a7e28b@linux.intel.com>
Date: Tue, 9 May 2023 14:29:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20230502001727.3211096-1-matthew.brost@intel.com>
 <20230502001727.3211096-8-matthew.brost@intel.com>
 <ZFVNqF+iqsN059E3@rdvivi-mobl4> <ZFhLejusrFMU3dIk@DUT025-TGLU.fm.intel.com>
 <ZFlrAJI44mbZcq7X@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <ZFlrAJI44mbZcq7X@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH v2 07/31] drm/xe: Only try to lock external
 BOs in VM bind
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
Cc: Rodrigo Vivi <rodrigo.vivi@kernel.org>, intel-xe@lists.freedesktop.org,
 Matthew Brost <mattthew.brost@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 5/8/23 23:34, Rodrigo Vivi wrote:
> On Mon, May 08, 2023 at 01:08:10AM +0000, Matthew Brost wrote:
>> On Fri, May 05, 2023 at 02:40:40PM -0400, Rodrigo Vivi wrote:
>>> On Mon, May 01, 2023 at 05:17:03PM -0700, Matthew Brost wrote:
>>>> Not needed and causes some issues with bulk LRU moves.
>>> I'm confused with this explanation and the code below.
>>> could you please provide a bit more wording here?
>>>
>> We only need to try to lock a BO if it external as non-external BOs
>> share the dma-resv with the already locked VM. Trying to lock
>> non-external BOs caused an issue (list corruption) in an uncoming patch

s/uncoming/upcoming/

Also it's not clear to me how this could fix a list corruption in the 
bulk LRU moves? I mean, if it's a duplicate lock then it gets removed 
from the tv list and not touched again? Could you explain the mechanism 
of the fix?

Thanks,

Thomas


>> which adds bulk LRU move. Since this code isn't needed, remove it.
> it makes more sense now. with this in commit msg (but with Christopher fix)
>
>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>
>
>> ^^^ How about this.
>>
>>>> Signed-off-by: Matthew Brost <mattthew.brost@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/xe/xe_vm.c | 8 +++++---
>>>>   1 file changed, 5 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>>>> index 272f0f7f24fe..6c427ff92c44 100644
>>>> --- a/drivers/gpu/drm/xe/xe_vm.c
>>>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>>>> @@ -2064,9 +2064,11 @@ static int vm_bind_ioctl(struct xe_vm *vm, struct xe_vma *vma,
>>>>   		 */
>>>>   		xe_bo_get(vbo);
>>>>   
>>>> -		tv_bo.bo = &vbo->ttm;
>>>> -		tv_bo.num_shared = 1;
>>>> -		list_add(&tv_bo.head, &objs);
>>>> +		if (!vbo->vm) {
>>>> +			tv_bo.bo = &vbo->ttm;
>>>> +			tv_bo.num_shared = 1;
>>>> +			list_add(&tv_bo.head, &objs);
>>>> +		}
>>>>   	}
>>>>   
>>>>   again:
>>>> -- 
>>>> 2.34.1
>>>>
