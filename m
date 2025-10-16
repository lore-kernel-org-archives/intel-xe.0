Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D16CCD183
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 06:13:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1151510E948;
	Thu, 16 Oct 2025 06:13:50 +0000 (UTC)
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5861F10E948
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 06:13:49 +0000 (UTC)
Message-ID: <52cccc2a-6958-4701-824b-3897bbdf366f@lankhorst.se>
Date: Thu, 16 Oct 2025 08:13:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 03/12] drm/xe: Add xe_ggtt_node_addr() to avoid
 dereferencing xe_ggtt_node
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20251015074708.1654014-14-dev@lankhorst.se>
 <20251015074708.1654014-17-dev@lankhorst.se>
 <aPAW2H5JAyOFXl69@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <aPAW2H5JAyOFXl69@lstrano-desk.jf.intel.com>
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

Hey,

Den 2025-10-15 kl. 23:49, skrev Matthew Brost:
> On Wed, Oct 15, 2025 at 09:47:12AM +0200, Maarten Lankhorst wrote:
>> This function makes it possible to add an offset that is applied to
>> all xe_ggtt_node's, and hides the internals from all its users.
>>
>> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
>> ---
>>  drivers/gpu/drm/xe/xe_bo.h   |  8 +++++---
>>  drivers/gpu/drm/xe/xe_ggtt.c | 11 +++++++++++
>>  drivers/gpu/drm/xe/xe_ggtt.h |  2 ++
>>  3 files changed, 18 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
>> index 353d607d301da..dd67a6f40a16d 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.h
>> +++ b/drivers/gpu/drm/xe/xe_bo.h
>> @@ -9,6 +9,7 @@
>>  #include <drm/ttm/ttm_tt.h>
>>  
>>  #include "xe_bo_types.h"
>> +#include "xe_ggtt.h"
>>  #include "xe_macros.h"
>>  #include "xe_validation.h"
>>  #include "xe_vm_types.h"
>> @@ -251,13 +252,14 @@ static inline u32
>>  __xe_bo_ggtt_addr(struct xe_bo *bo, u8 tile_id)
>>  {
>>  	struct xe_ggtt_node *ggtt_node = bo->ggtt_node[tile_id];
>> +	u64 offset;
>>  
>>  	if (XE_WARN_ON(!ggtt_node))
>>  		return 0;
>>  
>> -	XE_WARN_ON(ggtt_node->base.size > xe_bo_size(bo));
> 
> Is there any reason this warning was dropped? It's not immediately
> obvious to me why it would be.
> 
The impossibility because of being allocated with a different size
than xe_bo_size() in __xe_ggtt_insert_bo_at(). I dropped it
because it's redundant.

Kind regards,
~Maarten Lankhorst
