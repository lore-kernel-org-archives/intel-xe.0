Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D54C77B7A
	for <intel-xe@archiver.kernel.org>; Thu,  1 Jun 2023 14:20:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C9BC10E143;
	Thu,  1 Jun 2023 14:20:10 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFBC010E143
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 14:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685629208; x=1717165208;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=cU9ttpWrZE7+4HjA7leHMPRdApgryAibmk4FI1QeY1g=;
 b=F1wqOZV57J1W7t1p9NiaLGvS/UoNbN3kQ6lrUZTSsYiYId2GCIYJMOHS
 wvzfGprgcps1dMN53K8Csh8xu2vRRmwAtqIfFVDqQQhsa/AlWwWBZUq9w
 PHfEMdGhpZCp3zDsFHdNjedL7qreGArRgoq9VKcksVk6iqAA0HHUoTQtj
 d5fwKyIT39V5QqfYsiuOw/vkQB1H0KREvWODsXYL9oIwTjTzt7+E5437p
 LPIluiAz6ZWtgI/3RMB8HSfTbABl506SVzTXABhhtnvCDBckPkl8DbIJV
 wF/zSKpw3h2YdLYVIW+1OJp/6jqyakNegL+g51Fz6nXaBPFshcHv7Sq9g Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="357989342"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="357989342"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 07:16:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="881624280"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="881624280"
Received: from aswhelan-mobl.ger.corp.intel.com (HELO [10.252.20.240])
 ([10.252.20.240])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 07:16:34 -0700
Message-ID: <c93fe5f3-8dd0-0d52-265e-13e91b921d94@intel.com>
Date: Thu, 1 Jun 2023 15:16:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230601123505.646031-1-matthew.auld@intel.com>
 <ac489553-cd65-a16c-b8fa-c77bf0fc49e5@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <ac489553-cd65-a16c-b8fa-c77bf0fc49e5@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH] drm/xe/vm: fix double list add
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

Hi,

On 01/06/2023 14:19, Maarten Lankhorst wrote:
> Hey,
> 
> I guess that should make the ignore argument pointless?

IIUC we have something like:

vma = create_vma(vm, bo, ...) -> list_add(..., bo->vmas)
....
vm_insert_extobj(vm, vma)

Here we need the "ignore", otherwise bo_has_vm_references() in 
vm_insert_extobj() might incorrectly think the vma we just added to 
bo->vmas counts as a reference, and then the vma never becomes tracked 
as external. Or am I missing something here?

> 
> Cheers,
> 
> Maarten
> 
> On 2023-06-01 14:35, Matthew Auld wrote:
>> It looks like the driver only wants to track one vma for each external
>> object per vm. However it looks like bo_has_vm_references_locked() will
>> ignore any vma that is marked as vma->destroyed (not actually destroyed
>> yet). If we then mark our externally tracked vma as destroyed and then
>> create a new vma for the same object and vm, we can have two externally
>> tracked vma for the same object and vm. When the destroy actually
>> happens it tries to move the external tracking to a different vma, but
>> in this case it is already being tracked, leading to double list add
>> errors. It should be safe to simply drop the destroyed check in
>> bo_has_vm_references(), since the actual destroy will switch the
>> external tracking to the next available vma.
>>
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/290
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_vm.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index dd1335e12d4c..5aa2aeb14beb 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -964,7 +964,7 @@ bo_has_vm_references_locked(struct xe_bo *bo, struct xe_vm *vm,
>>   	struct xe_vma *vma;
>>   
>>   	list_for_each_entry(vma, &bo->vmas, bo_link) {
>> -		if (vma != ignore && vma->vm == vm && !vma->destroyed)
>> +		if (vma != ignore && vma->vm == vm)
>>   			return vma;
>>   	}
>>   
