Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECB7ECDB474
	for <intel-xe@archiver.kernel.org>; Tue, 17 Oct 2023 10:15:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B313210E2BE;
	Tue, 17 Oct 2023 10:15:35 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A16110E2BE
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Oct 2023 10:15:33 +0000 (UTC)
Message-ID: <de7acb2c-8738-fd92-500e-120ba20cbd0e@lankhorst.se>
Date: Tue, 17 Oct 2023 12:15:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: Matthew Brost <matthew.brost@intel.com>, maarten.lankhorst@linux.intel.com
References: <20231013152142.52869-1-maarten.lankhorst@linux.intel.com>
 <20231013152142.52869-4-maarten.lankhorst@linux.intel.com>
 <ZSmYyklINGOJ4RO2@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <ZSmYyklINGOJ4RO2@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH 3/4] drm/xe: Add vm snapshot mutex for easily
 taking a vm snapshot during devcoredump
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hey,

On 2023-10-13 21:21, Matthew Brost wrote:
> On Fri, Oct 13, 2023 at 05:21:41PM +0200, maarten.lankhorst@linux.intel.com wrote:
>> From: Maarten Lankhorst <dev@lankhorst.se>
>>
>> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
>> ---
>>   drivers/gpu/drm/xe/xe_vm.c       | 7 +++++++
>>   drivers/gpu/drm/xe/xe_vm_types.h | 5 +++++
>>   2 files changed, 12 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index da006249147e..544d998293d3 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -1163,7 +1163,9 @@ static int xe_vm_insert_vma(struct xe_vm *vm, struct xe_vma *vma)
>>   	xe_assert(vm->xe, xe_vma_vm(vma) == vm);
>>   	lockdep_assert_held(&vm->lock);
>>   
>> +	mutex_lock(&vm->snap_mutex);
> 
> I can't say I'm a fan of adding a new lock. Can you explain why this is
> needed? e.g. Why does the exisiting &vm->lock not work? We have lockdep
> annotations in both xe_vm_insert_vma & xe_vm_remove_vma that vm->lock is
> held. As is, the capture should be able to take vm->lock in write mode
> and this is safe.
We literally cannot take that lock at the time of crash capture. We are 
in a signaling context, so
lock vm->lock and then wait for signaling

would hang on
wait for signaling (snapshot context) locking vm->lock.

The snap_mutex only protects the walk of the VM, so it has very specific 
requirements. In the non-snapshot case, it will not ever be a contended 
lock.

> Side note the annotations should probably be in write mode for
> xe_vm_insert_vma & xe_vm_remove_vma and the capture should be able to
> take this in read mode. We should double check on this.

Cheers,
~Maarten
