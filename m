Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A2B3C4167B
	for <intel-xe@archiver.kernel.org>; Mon,  4 Dec 2023 11:13:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E05810E199;
	Mon,  4 Dec 2023 11:13:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1C0F10E199
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Dec 2023 11:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701688390; x=1733224390;
 h=message-id:date:mime-version:subject:from:to:references:
 in-reply-to:content-transfer-encoding;
 bh=bW8JXo75lm+iVkemvn+6NFzHWIAP8ZQCCipsRLmhTVI=;
 b=MaFhl8wWpoBwnnghCfkSbFTNIoRXVXpzDk5GuIqFM71ZJeNHMCzse+Ym
 X651L26U8bPoUfPqFEwlMWH6vCPBEaiW/OYEd/N/HAvExYXoWbOeiTroW
 01xfiQSOSVT/dzwyY+lM8Wy/K3OFYQ+ZJLKiH3OcHmvLPzv7Xx+BXNSJw
 0zUPlUxNSEPgwY1QXLpnYu3PqZSf0CldrTFX23P2Lq8TWB+h3F6pOjlRz
 Gqq7Y/IU889Qc2poyCs6jueyMYH2p5MMCxxr9wfRarjDzSJYsPCUzKW4S
 til6NFximvCvI1Oxj9xld/8Y1Rv9b/RZ3UmSN5TSlUrXnkncrbOdbqV0U Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="396523193"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; d="scan'208";a="396523193"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 03:13:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; d="scan'208";a="18546796"
Received: from clanggaa-mobl.ger.corp.intel.com (HELO [10.249.254.100])
 ([10.249.254.100])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 03:13:09 -0800
Message-ID: <76433b29-3ed4-f1d1-d9f2-ee3b3be2c75c@linux.intel.com>
Date: Mon, 4 Dec 2023 12:13:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20231116194047.214330-1-matthew.brost@intel.com>
 <20231116194047.214330-4-matthew.brost@intel.com>
 <f538548c-e0a3-0c13-6855-baa02f0e6ec7@linux.intel.com>
In-Reply-To: <f538548c-e0a3-0c13-6855-baa02f0e6ec7@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH 3/5] drm/xe: Use a flags field instead of
 bools for sync parse
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


On 12/4/23 11:46, Thomas Hellström wrote:
>
> On 11/16/23 20:40, Matthew Brost wrote:
>> Use a flags field instead of severval bools for sync parse as it is
>> easier to read and less bug prone.
>>
>> Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>
Hmm. It looks, though, that the header update slipped into the next patch.

/Thomas



>
>> ---
>>   drivers/gpu/drm/xe/xe_exec.c | 5 +++--
>>   drivers/gpu/drm/xe/xe_sync.c | 8 +++++---
>>   drivers/gpu/drm/xe/xe_vm.c   | 5 +++--
>>   3 files changed, 11 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
>> index 28e84a0bbeb0..7d4d22c81a42 100644
>> --- a/drivers/gpu/drm/xe/xe_exec.c
>> +++ b/drivers/gpu/drm/xe/xe_exec.c
>> @@ -181,8 +181,9 @@ int xe_exec_ioctl(struct drm_device *dev, void 
>> *data, struct drm_file *file)
>>         for (i = 0; i < args->num_syncs; i++) {
>>           err = xe_sync_entry_parse(xe, xef, &syncs[num_syncs++],
>> -                      &syncs_user[i], true,
>> -                      xe_vm_no_dma_fences(vm));
>> +                      &syncs_user[i], SYNC_PARSE_FLAG_EXEC |
>> +                      (xe_vm_no_dma_fences(vm) ?
>> +                       SYNC_PARSE_FLAG_LR_MODE : 0));
>>           if (err)
>>               goto err_syncs;
>>       }
>> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
>> index 73ef259aa387..016d0a2ea5bc 100644
>> --- a/drivers/gpu/drm/xe/xe_sync.c
>> +++ b/drivers/gpu/drm/xe/xe_sync.c
>> @@ -100,10 +100,12 @@ static void user_fence_cb(struct dma_fence 
>> *fence, struct dma_fence_cb *cb)
>>   int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
>>               struct xe_sync_entry *sync,
>>               struct drm_xe_sync __user *sync_user,
>> -            bool exec, bool no_dma_fences)
>> +            unsigned int flags)
>>   {
>>       struct drm_xe_sync sync_in;
>>       int err;
>> +    bool exec = flags & SYNC_PARSE_FLAG_EXEC;
>> +    bool lr_mode = flags & SYNC_PARSE_FLAG_LR_MODE;
>>       bool signal;
>>         if (copy_from_user(&sync_in, sync_user, sizeof(*sync_user)))
>> @@ -118,7 +120,7 @@ int xe_sync_entry_parse(struct xe_device *xe, 
>> struct xe_file *xef,
>>       signal = sync_in.flags & DRM_XE_SYNC_SIGNAL;
>>       switch (sync_in.flags & SYNC_FLAGS_TYPE_MASK) {
>>       case DRM_XE_SYNC_SYNCOBJ:
>> -        if (XE_IOCTL_DBG(xe, no_dma_fences && signal))
>> +        if (XE_IOCTL_DBG(xe, lr_mode && signal))
>>               return -EOPNOTSUPP;
>>             if (XE_IOCTL_DBG(xe, upper_32_bits(sync_in.addr)))
>> @@ -136,7 +138,7 @@ int xe_sync_entry_parse(struct xe_device *xe, 
>> struct xe_file *xef,
>>           break;
>>         case DRM_XE_SYNC_TIMELINE_SYNCOBJ:
>> -        if (XE_IOCTL_DBG(xe, no_dma_fences && signal))
>> +        if (XE_IOCTL_DBG(xe, lr_mode && signal))
>>               return -EOPNOTSUPP;
>>             if (XE_IOCTL_DBG(xe, upper_32_bits(sync_in.addr)))
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index 13c8a9c6117c..1f3e5dcbef9e 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -3089,8 +3089,9 @@ int xe_vm_bind_ioctl(struct drm_device *dev, 
>> void *data, struct drm_file *file)
>>       syncs_user = u64_to_user_ptr(args->syncs);
>>       for (num_syncs = 0; num_syncs < args->num_syncs; num_syncs++) {
>>           err = xe_sync_entry_parse(xe, xef, &syncs[num_syncs],
>> -                      &syncs_user[num_syncs], false,
>> -                      xe_vm_no_dma_fences(vm));
>> +                      &syncs_user[num_syncs],
>> +                      xe_vm_no_dma_fences(vm) ?
>> +                      SYNC_PARSE_FLAG_LR_MODE : 0);
>>           if (err)
>>               goto free_syncs;
>>       }
