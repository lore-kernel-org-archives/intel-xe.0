Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43BA1CFD2F6
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 14:17:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C0B610E661;
	Tue,  2 Dec 2025 14:17:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nBotATji";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38E5C10E661
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 14:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764685032; x=1796221032;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=y+DovbkQ/fg9MpfFIiTjssq48zYGeaVe4/4TG5YKYKc=;
 b=nBotATjiN9TfZe1iqPvUosugJACSdrpWHfXfMLRHtHzYGk23QZsqN3Jn
 Z0o+ky0Tn11vnh3Y+BoG7Q+wEU0cbD22ZmIxCr2o5dDcVKJQM5Acfyx3g
 oMwTAp4iSPaxmg8pZxRO7WYExbbqB2jXVB9zEvZcPGE3hrZpSyMmkTM93
 SPNcIKaY9gxIbmaTwjvLBTMijivzTbwcHYmczi91HFCiRvGZfNvqqT/ox
 /eGvdaRO/H0uFnN6vAfCcmqWNFeo/xWokTWXTmj4ebLel2TmGkwRi8dfw
 vWnCFcd1Mt9+c5Jah2iobtQuGiKvz+fpYbYowq4fPS2W6oBYEa0MgV0DX g==;
X-CSE-ConnectionGUID: sOFia8vxQoKAYzaeNqYO/w==
X-CSE-MsgGUID: JfH9mN9xT52GxeSXHNFd+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66726354"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="66726354"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 06:17:11 -0800
X-CSE-ConnectionGUID: CQIAsPLGS6uOH4GtB2TnsQ==
X-CSE-MsgGUID: DkwZpRqaQMiwXVEMnMc4nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="225078815"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 06:17:10 -0800
Date: Tue, 2 Dec 2025 15:17:08 +0100 (CET)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
cc: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>, 
 intel-xe@lists.freedesktop.org, Lucas De Marchi <demarchi@kernel.org>, 
 =?ISO-8859-15?Q?Thomas_Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe/configfs: free aux. array after storing the wa_bb
In-Reply-To: <aS351nEwG5YWKC7H@intel.com>
Message-ID: <fc771b86-9283-7b4c-ce13-44da4c9e96c2@intel.com>
References: <20251129222541.3306090-1-michal.grzelak@intel.com>
 <aS351nEwG5YWKC7H@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-128956625-1764684825=:3330920"
Content-ID: <16000adb-2bd7-d7a2-f25e-3476d98144ed@intel.com>
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-128956625-1764684825=:3330920
Content-Type: text/plain; CHARSET=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <c51e3963-b5fb-1af6-cd03-75f29dbdf0b4@intel.com>

On Mon, 1 Dec 2025, Rodrigo Vivi wrote:
> On Sat, Nov 29, 2025 at 11:25:41PM +0100, Micha³ Grzelak wrote:
>> When commands issued via configfs are executed mid- or post GPU context
>> restoration, a temporary buffer is reallocated in order to store all of
>> commands of varying count. However, after content of the buffer has been
>> copied to the desired location it is never freed, which causes following
>> memory leak to appear when running igt@xe_configfs@ctx-restore-mid-bb:
>>
>>     kmemleak_alloc+0x4a/0x90
>>     __kmalloc_node_track_caller_noprof+0x645/0x9d0
>>     krealloc_node_align_noprof+0x206/0x3c0
>>     wa_bb_store+0xf4/0x2c0 [xe]
>>     ctx_restore_mid_bb_store+0x21/0x30 [xe]
>>     configfs_write_iter+0xe6/0x150
>>     vfs_write+0x231/0x540
>>     ksys_write+0x6d/0xf0
>>     __x64_sys_write+0x19/0x30
>>     x64_sys_call+0x79/0x2350
>>     do_syscall_64+0x93/0x10f0
>>     entry_SYSCALL_64_after_hwframe+0x76/0x7e
>>
>> Deallocate temporary array upon finishing the store of batch buffer
>> into wa_bb.
>>
>> Fixes: 39ac06f7006f ("drm/xe/configfs: Add post context restore bb")
>
> this hash is wrong:
>
> Fixes: 39ac06f70062 ("drm/xe/configfs: Add post context restore bb")
>
>> Signed-off-by: Micha³ Grzelak <michal.grzelak@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_configfs.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
>> index 9f6251b1008b..f9a64352138b 100644
>> --- a/drivers/gpu/drm/xe/xe_configfs.c
>> +++ b/drivers/gpu/drm/xe/xe_configfs.c
>> @@ -789,6 +789,8 @@ static ssize_t wa_bb_store(struct wa_bb wa_bb[static XE_ENGINE_CLASS_MAX],
>>
>>  	memcpy(wa_bb, tmp_wa_bb, sizeof(tmp_wa_bb));
>>
>> +	kfree(tmp);
>
> hmm...
>
> do we need to change the kfree added in the xe_config_device_release()?

You're right, we don't need that. Sorry for the noise from this false
positive.

BR,
Micha³

>
>> +
>>  	return len;
>>  }
>>
>> --
>> 2.45.2
>>
>
--8323329-128956625-1764684825=:3330920--
